// ── Inline data (avoids fetch issues when opening files locally) ──

const WORK_DATA = [
  {
    "id": "cleverly",
    "title": "Cleverly",
    "type": "Case Study",
    "tags": ["UX Research", "Product Design"],
    "year": "2024",
    "cover": "",
    "coverUrl": "https://cdn.prod.website-files.com/67b72db85d52db126012f40b/67b7383f57c9c6effd912b52_Yusun-Cleverly.png",
    "color": "#C8C4BB",
    "summary": "Redesigning the onboarding experience to reduce drop-off and improve first-week retention.",
    "url": "work/cleverly.html"
  },
  {
    "id": "mediphin",
    "title": "Mediphin",
    "type": "Case Study",
    "tags": ["Healthcare", "Mobile Design"],
    "year": "2024",
    "cover": "",
    "coverUrl": "https://cdn.prod.website-files.com/67b72db85d52db126012f40b/6805bc194c33f7138bb575d0_Yusun-Mediphin.jpg",
    "color": "#BFC8C4",
    "summary": "A medication management app designed for elderly users navigating complex prescription schedules.",
    "url": "work/mediphin.html"
  },
  {
    "id": "robots-in-public-space",
    "title": "Robots in Public Space",
    "type": "Case Study",
    "tags": ["Service Design", "Research"],
    "year": "2023",
    "cover": "",
    "coverUrl": "https://cdn.prod.website-files.com/67b72db85d52db126012f40b/6805bc9eaaf1ee12936c1114_Yusun-Robots.jpg",
    "color": "#C4BBC8",
    "summary": "Exploring how autonomous robots should communicate intent and navigate social norms in shared spaces.",
    "url": "work/robots-in-public-space.html"
  },
  {
    "id": "dashboard-reading",
    "title": "Dashboard for Reading",
    "type": "Showcase",
    "tags": ["Data Visualization", "UI Design"],
    "year": "2023",
    "cover": "",
    "coverUrl": "https://cdn.prod.website-files.com/67b72db85d52db126012f40b/680063b37043835aeca92131_Yusun-Dashboard.png",
    "color": "#C8C0BB",
    "summary": "A personal reading tracker dashboard that turns habits into visual stories.",
    "url": "work/dashboard-for-reading.html"
  }
];

const SNACKS_DATA = [
  {
    "id": "snack-01",
    "title": "Color System Exploration",
    "tags": ["Visual Design"],
    "year": "2024",
    "cover": "",
    "color": "#D4C8C0",
    "description": "Experimenting with perceptually uniform color scales for UI systems."
  },
  {
    "id": "snack-02",
    "title": "Type Pairings",
    "tags": ["Typography"],
    "year": "2024",
    "cover": "",
    "color": "#C0C8D4",
    "description": "A collection of serif + sans-serif pairings tested in real layout contexts."
  },
  {
    "id": "snack-03",
    "title": "Micro-interaction Sketches",
    "tags": ["Motion", "Prototyping"],
    "year": "2023",
    "cover": "",
    "color": "#C8D4C0",
    "description": "Rough explorations of button states, transitions, and feedback animations."
  },
  {
    "id": "snack-04",
    "title": "Icon Set — Daily Objects",
    "tags": ["Illustration"],
    "year": "2023",
    "cover": "",
    "color": "#D4C0C8",
    "description": "A minimal icon set drawn from everyday household and desk objects."
  },
  {
    "id": "snack-05",
    "title": "Layout Studies",
    "tags": ["Visual Design", "Grid"],
    "year": "2023",
    "cover": "",
    "color": "#C4C8C0",
    "description": "Grid-based layout experiments inspired by editorial print design."
  },
  {
    "id": "snack-06",
    "title": "Accessibility Audit — Public Apps",
    "tags": ["Accessibility", "Research"],
    "year": "2022",
    "cover": "",
    "color": "#C8C0D4",
    "description": "Quick accessibility checks across five popular public-sector apps."
  }
];

// ── Helpers ──

function resolveUrl(relPath) {
  // Works whether the page is served or opened as file://
  const base = document.querySelector('base');
  if (base) return new URL(relPath, base.href).href;
  return new URL(relPath, location.href).href;
}

function setActiveNav() {
  const current = location.pathname.replace(/\/$/, '');
  document.querySelectorAll('.nav-links a').forEach(a => {
    const href = a.getAttribute('href');
    const abs = new URL(href, location.href).pathname.replace(/\/$/, '');
    const isWork = href === 'index.html' || href === '../index.html';
    if (
      current === abs ||
      (isWork && (current.endsWith('/portfolio') || current.endsWith('/index.html') || current === abs))
    ) {
      a.classList.add('active');
    }
  });
}

function coverEl(cover, color, title, coverUrl) {
  const div = document.createElement('div');
  div.className = 'card-cover';
  div.style.background = color || 'var(--gray-box)';

  const src = coverUrl || (cover ? resolveUrl('assets/images/' + cover) : null);
  if (src) {
    const img = document.createElement('img');
    img.src = src;
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

// ── Render work grid ──

function renderWork() {
  const grid = document.getElementById('work-grid');
  if (!grid) return;

  grid.innerHTML = '';
  WORK_DATA.forEach(p => {
    const a = document.createElement('a');
    a.className = 'work-card';
    a.href = resolveUrl(p.url);

    a.appendChild(coverEl(p.cover, p.color, p.title, p.coverUrl));

    a.insertAdjacentHTML('beforeend', `
      <div class="card-meta">
        <div class="card-type">${p.type} · ${p.year}</div>
        <div class="card-title">${p.title}</div>
        <div class="card-summary">${p.summary}</div>
        <div class="card-tags">${p.tags.map(t => `<span class="tag">${t}</span>`).join('')}</div>
      </div>`);

    grid.appendChild(a);
  });
}

// ── Render snacks grid ──

function renderSnacks() {
  const grid = document.getElementById('snacks-grid');
  if (!grid) return;

  grid.innerHTML = '';
  SNACKS_DATA.forEach(s => {
    const a = document.createElement('a');
    a.className = 'snack-card';
    a.href = '#';

    const cover = document.createElement('div');
    cover.className = 'snack-cover';
    cover.style.background = s.color || 'var(--gray-box)';

    if (s.cover) {
      const img = document.createElement('img');
      img.src = resolveUrl('assets/images/' + s.cover);
      img.alt = s.title;
      cover.appendChild(img);
    } else {
      const ph = document.createElement('div');
      ph.className = 'card-cover-placeholder';
      ph.textContent = 'Image';
      cover.appendChild(ph);
    }

    a.appendChild(cover);
    a.insertAdjacentHTML('beforeend', `
      <div class="snack-meta">
        <div class="snack-title">${s.title}</div>
        <div class="snack-desc">${s.description}</div>
        <div class="snack-tags">${s.tags.map(t => `<span class="tag">${t}</span>`).join('')}</div>
      </div>`);

    grid.appendChild(a);
  });
}

document.addEventListener('DOMContentLoaded', () => {
  setActiveNav();
  renderWork();
  renderSnacks();
});
