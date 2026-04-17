const BASE = (() => {
  const segs = location.pathname.split('/');
  const idx = segs.indexOf('portfolio');
  return idx !== -1 ? '/' + segs.slice(0, idx + 1).join('/').replace(/^\//, '') : '';
})();

function path(p) {
  return BASE + p;
}

function setActiveNav() {
  const current = location.pathname.replace(/\/$/, '');
  document.querySelectorAll('.nav-links a').forEach(a => {
    const href = a.getAttribute('href').replace(/\/$/, '');
    const absHref = href.startsWith('/') ? href : path('/' + href).replace('//', '/');
    if (current === absHref || (href === 'index.html' && (current === BASE || current === BASE + '/index.html'))) {
      a.classList.add('active');
    }
  });
}

function coverEl(cover, color, title) {
  const div = document.createElement('div');
  div.className = 'card-cover';
  div.style.background = color || 'var(--gray-box)';
  if (cover) {
    const img = document.createElement('img');
    img.src = path('/assets/images/' + cover);
    img.alt = title;
    div.appendChild(img);
  } else {
    const ph = document.createElement('div');
    ph.className = 'card-cover-placeholder';
    ph.textContent = 'Cover Image';
    div.appendChild(ph);
  }
  return div;
}

async function renderWork() {
  const grid = document.getElementById('work-grid');
  if (!grid) return;

  try {
    const res = await fetch(path('/data/work.json'));
    const projects = await res.json();

    grid.innerHTML = '';
    projects.forEach(p => {
      const a = document.createElement('a');
      a.className = 'work-card';
      a.href = path('/' + p.url);

      a.appendChild(coverEl(p.cover, p.color, p.title));

      a.innerHTML += `
        <div class="card-meta">
          <div class="card-type">${p.type} · ${p.year}</div>
          <div class="card-title">${p.title}</div>
          <div class="card-summary">${p.summary}</div>
          <div class="card-tags">${p.tags.map(t => `<span class="tag">${t}</span>`).join('')}</div>
        </div>`;

      grid.appendChild(a);
    });
  } catch (e) {
    grid.innerHTML = '<p style="color:var(--ink-muted);font-size:.85rem">Failed to load projects.</p>';
  }
}

async function renderSnacks() {
  const grid = document.getElementById('snacks-grid');
  if (!grid) return;

  try {
    const res = await fetch(path('/data/snacks.json'));
    const snacks = await res.json();

    grid.innerHTML = '';
    snacks.forEach(s => {
      const a = document.createElement('a');
      a.className = 'snack-card';
      a.href = '#';

      const cover = document.createElement('div');
      cover.className = 'snack-cover';
      cover.style.background = s.color || 'var(--gray-box)';

      if (s.cover) {
        const img = document.createElement('img');
        img.src = path('/assets/images/' + s.cover);
        img.alt = s.title;
        cover.appendChild(img);
      } else {
        const ph = document.createElement('div');
        ph.className = 'card-cover-placeholder';
        ph.textContent = 'Image';
        cover.appendChild(ph);
      }

      a.appendChild(cover);
      a.innerHTML += `
        <div class="snack-meta">
          <div class="snack-title">${s.title}</div>
          <div class="snack-desc">${s.description}</div>
          <div class="snack-tags">${s.tags.map(t => `<span class="tag">${t}</span>`).join('')}</div>
        </div>`;

      grid.appendChild(a);
    });
  } catch (e) {
    grid.innerHTML = '<p style="color:var(--ink-muted);font-size:.85rem">Failed to load snacks.</p>';
  }
}

document.addEventListener('DOMContentLoaded', () => {
  setActiveNav();
  renderWork();
  renderSnacks();
});
