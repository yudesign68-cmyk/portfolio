#!/bin/bash
# ============================================================
# make-independent.sh
# Webflow CDN 파일을 모두 로컬로 다운로드하고
# HTML에서 CDN 경로를 로컬 경로로 교체합니다.
# ============================================================

REPO="/Users/yujeon/Desktop/Personal Project/portfolio"
ASSETS="$REPO/assets"

mkdir -p "$ASSETS/images" "$ASSETS/css" "$ASSETS/js"

echo "📥 파일 다운로드 시작..."

download() {
  local url="$1"
  local dest="$2"
  if [ -f "$dest" ]; then
    echo "  SKIP (already exists): $(basename "$dest")"
    return
  fi
  curl -s -L --max-time 30 -A "Mozilla/5.0" -o "$dest" "$url"
  if [ $? -eq 0 ] && [ -s "$dest" ]; then
    echo "  OK: $(basename "$dest")"
  else
    echo "  FAIL: $url"
    rm -f "$dest"
  fi
}

# ── Images ──────────────────────────────────────────────────
BASE="https://cdn.prod.website-files.com/67b72db85d52db126012f40b"
I="$ASSETS/images"

download "$BASE/67b72db95d52db126012f4f2_arrow-right-black.svg"  "$I/67b72db95d52db126012f4f2_arrow-right-black.svg"
download "$BASE/67b72db95d52db126012f58c_arrow-down-black.svg"   "$I/67b72db95d52db126012f58c_arrow-down-black.svg"
download "$BASE/67b72db95d52db126012f717_arrow-external-link.svg" "$I/67b72db95d52db126012f717_arrow-external-link.svg"
download "$BASE/67b7383f57c9c6effd912b20_Slide%2016_9%20-%202.png"  "$I/67b7383f57c9c6effd912b20_Slide 16_9 - 2.png"
download "$BASE/67b7383f57c9c6effd912b35_image.png"              "$I/67b7383f57c9c6effd912b35_image.png"
download "$BASE/67b7383f57c9c6effd912b45_image.png"              "$I/67b7383f57c9c6effd912b45_image.png"
download "$BASE/67b7383f57c9c6effd912b52_Yusun-Cleverly-p-1080.png" "$I/67b7383f57c9c6effd912b52_Yusun-Cleverly-p-1080.png"
download "$BASE/67b7383f57c9c6effd912b52_Yusun-Cleverly-p-1600.png" "$I/67b7383f57c9c6effd912b52_Yusun-Cleverly-p-1600.png"
download "$BASE/67b7383f57c9c6effd912b52_Yusun-Cleverly-p-500.png"  "$I/67b7383f57c9c6effd912b52_Yusun-Cleverly-p-500.png"
download "$BASE/67b7383f57c9c6effd912b52_Yusun-Cleverly-p-800.png"  "$I/67b7383f57c9c6effd912b52_Yusun-Cleverly-p-800.png"
download "$BASE/67b7383f57c9c6effd912b52_Yusun-Cleverly.png"    "$I/67b7383f57c9c6effd912b52_Yusun-Cleverly.png"
download "$BASE/67b7383f57c9c6effd912b66_Capstone%20Project%20-%2004.jpg" "$I/67b7383f57c9c6effd912b66_Capstone Project - 04.jpg"
download "$BASE/67b7383f57c9c6effd912b70_Capstone%20Project%20-%2007.jpg" "$I/67b7383f57c9c6effd912b70_Capstone Project - 07.jpg"
download "$BASE/67b7383f57c9c6effd912b78_image%20426.png"        "$I/67b7383f57c9c6effd912b78_image 426.png"
download "$BASE/67b7383f57c9c6effd912b81_Slide%2016_9%20-%202.png" "$I/67b7383f57c9c6effd912b81_Slide 16_9 - 2.png"
download "$BASE/67b7383f57c9c6effd912b87_LearnLab_filesize.gif"  "$I/67b7383f57c9c6effd912b87_LearnLab_filesize.gif"
download "$BASE/67b7383f57c9c6effd912b89_BiteWise%20Opening%20Interaction.gif" "$I/67b7383f57c9c6effd912b89_BiteWise Opening Interaction.gif"
download "$BASE/67b7383f57c9c6effd912b8b_CleverLog_zise.gif"     "$I/67b7383f57c9c6effd912b8b_CleverLog_zise.gif"
download "$BASE/67b7383f57c9c6effd912b91_CleverMate.jpg"         "$I/67b7383f57c9c6effd912b91_CleverMate.jpg"
download "$BASE/67b73d2b20f3afc382115cf6_image.png"              "$I/67b73d2b20f3afc382115cf6_image.png"
download "$BASE/67b73d2b20f3afc382115cfd_image%20428.png"        "$I/67b73d2b20f3afc382115cfd_image 428.png"
download "$BASE/67b73d2b20f3afc382115d2b_image%20429.png"        "$I/67b73d2b20f3afc382115d2b_image 429.png"
download "$BASE/67b73d2b20f3afc382115d2d_image%20430.png"        "$I/67b73d2b20f3afc382115d2d_image 430.png"
download "$BASE/67b73d2b20f3afc382115d3d_42_Analysis-1.jpg"      "$I/67b73d2b20f3afc382115d3d_42_Analysis-1.jpg"
download "$BASE/67b73d2b20f3afc382115d46_14_Target%20User%20Profile.jpg" "$I/67b73d2b20f3afc382115d46_14_Target User Profile.jpg"
download "$BASE/67b73d2b20f3afc382115d4f_42_Analysis.jpg"        "$I/67b73d2b20f3afc382115d4f_42_Analysis.jpg"
download "$BASE/67b73d2b20f3afc382115d58_15_Target%20User%20Profile.jpg" "$I/67b73d2b20f3afc382115d58_15_Target User Profile.jpg"
download "$BASE/67b73d2b20f3afc382115d5d_Mockup%2003.jpg"        "$I/67b73d2b20f3afc382115d5d_Mockup 03.jpg"
download "$BASE/67b73d2b20f3afc382115d5e_Mockup%2002.jpg"        "$I/67b73d2b20f3afc382115d5e_Mockup 02.jpg"
download "$BASE/67b73d2b20f3afc382115d5f_Mockup%2001.jpg"        "$I/67b73d2b20f3afc382115d5f_Mockup 01.jpg"
download "$BASE/67b73d2b20f3afc382115d66_interview.png"          "$I/67b73d2b20f3afc382115d66_interview.png"
download "$BASE/67b73d2b20f3afc382115d6d_Mockup_design%20proposal.png" "$I/67b73d2b20f3afc382115d6d_Mockup_design proposal.png"
download "$BASE/67b73d2b20f3afc382115d74_User%20Jorney%2022.jpg" "$I/67b73d2b20f3afc382115d74_User Jorney 22.jpg"
download "$BASE/67b73d2b20f3afc382115d7d_User%20Jorney%2023.jpg" "$I/67b73d2b20f3afc382115d7d_User Jorney 23.jpg"
download "$BASE/67b73d2b20f3afc382115d86_47_Analysis.jpg"        "$I/67b73d2b20f3afc382115d86_47_Analysis.jpg"
download "$BASE/67b73d2b20f3afc382115d8f_46_Analysis.jpg"        "$I/67b73d2b20f3afc382115d8f_46_Analysis.jpg"
download "$BASE/67b73d2b20f3afc382115d98_49_Analysis.jpg"        "$I/67b73d2b20f3afc382115d98_49_Analysis.jpg"
download "$BASE/67b73d2b20f3afc382115da1_48_Analysis.jpg"        "$I/67b73d2b20f3afc382115da1_48_Analysis.jpg"
download "$BASE/67b73d2b20f3afc382115daa_User%20Journey04.jpg"   "$I/67b73d2b20f3afc382115daa_User Journey04.jpg"
download "$BASE/67b73d2b20f3afc382115db3_User%20Journey.jpg"     "$I/67b73d2b20f3afc382115db3_User Journey.jpg"
download "$BASE/67b73d2b20f3afc382115dbe_User%20Journey03.jpg"   "$I/67b73d2b20f3afc382115dbe_User Journey03.jpg"
download "$BASE/67b73d2b20f3afc382115dc7_User%20Journey05.jpg"   "$I/67b73d2b20f3afc382115dc7_User Journey05.jpg"
download "$BASE/67b73d2b20f3afc382115dd1_User%20Journey02.jpg"   "$I/67b73d2b20f3afc382115dd1_User Journey02.jpg"
download "$BASE/67b7cb347e0435bb10b915d7_rezise-02.jpg"          "$I/67b7cb347e0435bb10b915d7_rezise-02.jpg"
download "$BASE/67b7cb347e0435bb10b915e2_rezise-03.jpg"          "$I/67b7cb347e0435bb10b915e2_rezise-03.jpg"
download "$BASE/67b7cb347e0435bb10b915ed_rezise-06.jpg"          "$I/67b7cb347e0435bb10b915ed_rezise-06.jpg"
download "$BASE/67b7cb347e0435bb10b915f8_rezise-01.jpg"          "$I/67b7cb347e0435bb10b915f8_rezise-01.jpg"
download "$BASE/67b7cb347e0435bb10b91603_rezise-04.jpg"          "$I/67b7cb347e0435bb10b91603_rezise-04.jpg"
download "$BASE/67b7cb347e0435bb10b9160e_rezise-05.jpg"          "$I/67b7cb347e0435bb10b9160e_rezise-05.jpg"
download "$BASE/67b7cf266eed1b5ce3adb9e3_Yusun_Profile%20Picture_2024_Film%20effect.JPG" "$I/67b7cf266eed1b5ce3adb9e3_Yusun_Profile Picture_2024_Film effect.JPG"
download "$BASE/67b7d52b24f0e6c1f415d11e_IMG_8517.jpg"           "$I/67b7d52b24f0e6c1f415d11e_IMG_8517.jpg"
download "$BASE/67bea3652d4fc5e4d3c5c480_Ex%2001.jpg"            "$I/67bea3652d4fc5e4d3c5c480_Ex 01.jpg"
download "$BASE/67beb0bab8698921ca14c40c_Group%201000003332.png"  "$I/67beb0bab8698921ca14c40c_Group 1000003332.png"
download "$BASE/67beb0baca41b905909c25e6_Group%201000003336.png"  "$I/67beb0baca41b905909c25e6_Group 1000003336.png"
download "$BASE/67beb1a84f01cfac70603852_quotes.png"             "$I/67beb1a84f01cfac70603852_quotes.png"
download "$BASE/67bfd74095ddd3b75a36ebba_prototype05.jpg"        "$I/67bfd74095ddd3b75a36ebba_prototype05.jpg"
download "$BASE/67bfd740edf4ec58f653de05_prototype01.jpg"        "$I/67bfd740edf4ec58f653de05_prototype01.jpg"
download "$BASE/67bfd7418efcf8cef674824f_prototype03.jpg"        "$I/67bfd7418efcf8cef674824f_prototype03.jpg"
download "$BASE/67bfd741c78ee64a968d8a2c_prototype02.jpg"        "$I/67bfd741c78ee64a968d8a2c_prototype02.jpg"
download "$BASE/67bfd741edf4ec58f653de54_prototype04.jpg"        "$I/67bfd741edf4ec58f653de54_prototype04.jpg"
download "$BASE/67c3988970acacede41ff67a_Feature%20Definitaion%20Table_F.png" "$I/67c3988970acacede41ff67a_Feature Definitaion Table_F.png"
download "$BASE/67c3f66770acacede44c00ba_Affinity%20Mapping.jpg" "$I/67c3f66770acacede44c00ba_Affinity Mapping.jpg"
download "$BASE/67c3f88570acacede44ce598_Storyboard.jpg"         "$I/67c3f88570acacede44ce598_Storyboard.jpg"
download "$BASE/67ec893ef0f750b15a64e853_Workshop.jpg"           "$I/67ec893ef0f750b15a64e853_Workshop.jpg"
download "$BASE/67ecb1d26a30d21bfc73a94c_Workshop2.jpg"          "$I/67ecb1d26a30d21bfc73a94c_Workshop2.jpg"
download "$BASE/67ecbd28506313a5f8f45059_Placement%20Diary%20and%20Reflective%20Report%20_33460639_Yusun%20Jeon_Page_10_Image_0001.jpg" "$I/67ecbd28506313a5f8f45059_Placement_Page_10.jpg"
download "$BASE/67ecbda015d24fb177d1c548_Placement%20Diary%20and%20Reflective%20Report%20_33460639_Yusun%20Jeon_Page_06_Image_0001.jpg" "$I/67ecbda015d24fb177d1c548_Placement_Page_06.jpg"
download "$BASE/67ee0ca4876dadc49a9ba3a1_moodboard.jpg"          "$I/67ee0ca4876dadc49a9ba3a1_moodboard.jpg"
download "$BASE/67ee11086932dfa2bce2a752_Placement%20Diary%20and%20Reflective%20Report%20_33460639_Yusun%20Jeon_Page_22_Image_0001.jpg" "$I/67ee11086932dfa2bce2a752_Placement_Page_22.jpg"
download "$BASE/67ee2135f0ee769b2e669c80_Placement%20Diary%20and%20Reflective%20Report%20_33460639_Yusun%20Jeon_Page_12_Image_0004.jpg" "$I/67ee2135f0ee769b2e669c80_Placement_Page_12.jpg"
download "$BASE/67f4877da310d880a5123fcf_interaction.jpg"        "$I/67f4877da310d880a5123fcf_interaction.jpg"
download "$BASE/680063b37043835aeca92131_Yusun-Dashboard.png"    "$I/680063b37043835aeca92131_Yusun-Dashboard.png"
download "$BASE/6800af4c0816a4c8b8c15981_4.jpg"                  "$I/6800af4c0816a4c8b8c15981_4.jpg"
download "$BASE/6800af4c139f77d66b6981a2_7.jpg"                  "$I/6800af4c139f77d66b6981a2_7.jpg"
download "$BASE/6800af4ca1966f72d8114f80_5.jpg"                  "$I/6800af4ca1966f72d8114f80_5.jpg"
download "$BASE/6800af4ce306ad64e25207ea_3.jpg"                  "$I/6800af4ce306ad64e25207ea_3.jpg"
download "$BASE/6800af4d931d69244ded9a35_1.jpg"                  "$I/6800af4d931d69244ded9a35_1.jpg"
download "$BASE/6805a917095e86a528fc36ca_2.jpg"                  "$I/6805a917095e86a528fc36ca_2.jpg"
download "$BASE/6805aacbe88282bffe657082_6.png"                  "$I/6805aacbe88282bffe657082_6.png"
download "$BASE/6805bc194c33f7138bb575d0_Yusun-Mediphin.jpg"     "$I/6805bc194c33f7138bb575d0_Yusun-Mediphin.jpg"
download "$BASE/6805bc598a90f9174d85e222_Yusun-Dashboard.jpg"    "$I/6805bc598a90f9174d85e222_Yusun-Dashboard.jpg"
download "$BASE/6805bc9eaaf1ee12936c1114_Yusun-Robots.jpg"       "$I/6805bc9eaaf1ee12936c1114_Yusun-Robots.jpg"

# ── CSS ─────────────────────────────────────────────────────
download "$BASE/css/yusuns-fantabulous-site-bcc0e3.webflow.shared.3b2555f64.css" \
         "$ASSETS/css/yusuns-fantabulous-site-bcc0e3.webflow.shared.3b2555f64.css"

# ── JS ──────────────────────────────────────────────────────
download "$BASE/js/webflow.schunk.57d5559d2f0cd9f8.js"   "$ASSETS/js/webflow.schunk.57d5559d2f0cd9f8.js"
download "$BASE/js/webflow.schunk.aff9ebe19807f924.js"   "$ASSETS/js/webflow.schunk.aff9ebe19807f924.js"
download "$BASE/js/webflow.a6c83a78.39c154bc4c981a0b.js" "$ASSETS/js/webflow.a6c83a78.39c154bc4c981a0b.js"
download "$BASE/js/webflow.7e3233df.7a2b0f999ee102cd.js" "$ASSETS/js/webflow.7e3233df.7a2b0f999ee102cd.js"
download "$BASE/js/webflow.65141ab0.24b410a85c1f22f2.js" "$ASSETS/js/webflow.65141ab0.24b410a85c1f22f2.js"

echo ""
echo "✅ 다운로드 완료!"
echo "📊 다운로드된 파일 수: $(find "$ASSETS" -type f | wc -l)"
echo ""

# ── HTML 경로 업데이트 ────────────────────────────────────────
echo "🔁 HTML 경로 업데이트 중..."

# 파일 이름이 URL인코딩된 경우 Python으로 처리
python3 << 'PYEOF'
import os, re

repo = "/Users/yujeon/Desktop/Personal Project/portfolio"
assets_img = "assets/images"
assets_css = "assets/css"
assets_js  = "assets/js"
base_cdn   = "https://cdn.prod.website-files.com/67b72db85d52db126012f40b"

# 파일명에서 공백이 있는 경우 -> URL 인코딩으로 HTML에서 참조
# 다운로드 시 로컬 파일명은 실제 문자로 저장됐으므로 URL에서 디코딩된 이름으로 참조해야 함
from urllib.parse import unquote

# 긴 파일명 매핑 (다운로드시 짧게 저장한 것들)
special_map = {
    "67ecbd28506313a5f8f45059_Placement%20Diary%20and%20Reflective%20Report%20_33460639_Yusun%20Jeon_Page_10_Image_0001.jpg": "67ecbd28506313a5f8f45059_Placement_Page_10.jpg",
    "67ecbda015d24fb177d1c548_Placement%20Diary%20and%20Reflective%20Report%20_33460639_Yusun%20Jeon_Page_06_Image_0001.jpg": "67ecbda015d24fb177d1c548_Placement_Page_06.jpg",
    "67ee11086932dfa2bce2a752_Placement%20Diary%20and%20Reflective%20Report%20_33460639_Yusun%20Jeon_Page_22_Image_0001.jpg": "67ee11086932dfa2bce2a752_Placement_Page_22.jpg",
    "67ee2135f0ee769b2e669c80_Placement%20Diary%20and%20Reflective%20Report%20_33460639_Yusun%20Jeon_Page_12_Image_0004.jpg": "67ee2135f0ee769b2e669c80_Placement_Page_12.jpg",
}

html_files = []
for root, dirs, files in os.walk(repo):
    # skip assets and .git
    dirs[:] = [d for d in dirs if d not in ['assets', '.git', 'node_modules']]
    for f in files:
        if f.endswith('.html'):
            html_files.append(os.path.join(root, f))

for html_path in html_files:
    rel_dir = os.path.dirname(os.path.relpath(html_path, repo))
    # depth: '' = root, 'work' = one level deep
    prefix = "../" if rel_dir and rel_dir != '.' else ""

    with open(html_path, 'r', encoding='utf-8') as fh:
        content = fh.read()

    original = content

    # Replace CDN URLs
    def replace_cdn(m):
        full_url = m.group(0)
        path_part = full_url[len(base_cdn)+1:]  # after base_cdn/

        if path_part.startswith('css/'):
            fname = path_part[4:]
            return f"{prefix}{assets_css}/{fname}"
        elif path_part.startswith('js/'):
            fname = path_part[3:]
            return f"{prefix}{assets_js}/{fname}"
        else:
            # image — check special map first
            if path_part in special_map:
                fname = special_map[path_part]
            else:
                fname = unquote(path_part)
            return f"{prefix}{assets_img}/{fname}"

    pattern = re.compile(re.escape(base_cdn) + r'/[^\s"\')\]>]+')
    content = pattern.sub(replace_cdn, content)

    if content != original:
        with open(html_path, 'w', encoding='utf-8') as fh:
            fh.write(content)
        print(f"  Updated: {os.path.relpath(html_path, repo)}")
    else:
        print(f"  No change: {os.path.relpath(html_path, repo)}")

print("Done!")
PYEOF

echo ""
echo "🎉 완료! 이제 git push 하세요:"
echo "  cd \"/Users/yujeon/Desktop/Personal Project/portfolio\""
echo "  rm -f .git/index.lock .git/HEAD.lock"
echo "  git add -A"
echo "  git commit -m \"Make site fully independent from Webflow CDN\""
echo "  git push"
