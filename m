Return-Path: <linux-arm-msm+bounces-19979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8268C8361
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 11:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52A351C224D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 09:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D5A200D3;
	Fri, 17 May 2024 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="tmSrgZak"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E42539FE0;
	Fri, 17 May 2024 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715937940; cv=none; b=YXQGReRgpWfDHSEA/Zgy++qBaHK+BglYaCQQp68N9tr0ihm9j+C1/FKl/Q0a2XdVTA91AFMkwQVZt27R7IC1czhlcOkKuvJkYhqNH2BnwxSWfjAzqbAiAhIhipZmOZtOLPhK7SvX8OzN8G9dfwld6/vKhLjACxA+VIKgBvxxXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715937940; c=relaxed/simple;
	bh=ZyoiA+f8HcgTO61/WkbObSh9oveuVoduCVJ1lwD+pm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IRXpJisB/s6HKdUDjvAfM+QnJvCy1qr67YpxAupUo0md5QsDeFYWpOyZhMHlDUmRFa1N5ue7h1DfVkZZsU+GH3hS+fBUBrithZp11NmMSV4qzYqW31tbl4FkYsE5ujPm1Lo4Sbxl7/gHWxY9kH97M58XY8lBo9ZPN16i62AMwHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=tmSrgZak; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715937936;
	bh=ZyoiA+f8HcgTO61/WkbObSh9oveuVoduCVJ1lwD+pm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tmSrgZakhionmeghDNjJ4tWk9WmbvvF4agSO211+6rG7NduP6L/ELoUJD2s8AAvRI
	 bsrGu8m7M/Rp3XH51ostYpz9DTzy/57o25TtiWdVfd5Fb2iiKPdpVKcRNT7/Us4RQA
	 h69uByJ7zThdv0lG/15FOq9PzpropfkLC2LezMJBAo/h0EAfuP4uWMPhVs6jvOq247
	 3dStek1M0sX+69DUHSxVJwRh8+SMze7MAw8i85hHtMVtctGjZsu7WU373sPahJ+ET5
	 q0RBKd1PdD4KAO5bS1nqc4NHCG41zxwexty9EaM4FLhVWuSe20sISOY57RttI4LuV5
	 8tyfA2/r+Vr9A==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6897237821C4;
	Fri, 17 May 2024 09:25:32 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	dmitry.baryshkov@linaro.org,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] drm/ci: skip driver specific tests
Date: Fri, 17 May 2024 14:55:01 +0530
Message-Id: <20240517092502.647420-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240517092502.647420-1-vignesh.raman@collabora.com>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Skip driver specific tests and skip kms tests for
panfrost driver since it is not a kms driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Skip xe tests for amdgpu and virtio.

---
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt   | 15 ++++++++++++++-
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt   | 11 ++++++++++-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt    | 11 ++++++++++-
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt    |  9 +++++++++
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt    | 11 ++++++++++-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt    | 11 ++++++++++-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt    | 11 ++++++++++-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt    | 11 ++++++++++-
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt | 12 ++++++++++++
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt | 14 ++++++++++++++
 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt  | 14 ++++++++++++++
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt | 11 +++++++++++
 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt | 14 +++++++++++++-
 .../msm-sc7180-trogdor-kingoftown-skips.txt     | 12 ++++++++++++
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt | 12 ++++++++++++
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt  | 12 ++++++++++++
 .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt | 17 ++++++++++++++++-
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt | 15 +++++++++++++++
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt | 16 +++++++++++++++-
 19 files changed, 229 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt

diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
index e2c538a0f954..21d26d5e67c2 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -1,2 +1,15 @@
 # Suspend to RAM seems to be broken on this machine
-.*suspend.*
\ No newline at end of file
+.*suspend.*
+
+# Skip driver specific tests
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+xe_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
index fe55540a3f9a..1e80987cf584 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
@@ -1,4 +1,13 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
index 3430b215c06e..0104f2ffa8ba 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
@@ -3,4 +3,13 @@
 # This is generating kernel oops with divide error
 kms_plane_scaling@invalid-parameters
 # This is cascading issues
-kms_3d
\ No newline at end of file
+kms_3d
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
index 6d3d7ddc377f..398ebe163ad0 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
@@ -1,2 +1,11 @@
 # This is generating kernel oops with divide error
 kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
index 4c7d00ce14bc..4f5419d62170 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
@@ -2,4 +2,13 @@
 .*suspend.*
 
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
index 4c7d00ce14bc..4f5419d62170 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
@@ -2,4 +2,13 @@
 .*suspend.*
 
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
index 1d0621750b14..b0372c239b93 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
@@ -8,4 +8,13 @@ gem_eio.*
 kms_flip@absolute-wf_vblank@a-edp1
 
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
index f3be0888a214..398ebe163ad0 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
@@ -1,2 +1,11 @@
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
new file mode 100644
index 000000000000..db0c9dbbeb61
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
@@ -0,0 +1,12 @@
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
new file mode 100644
index 000000000000..7a1c8be89e5b
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
@@ -0,0 +1,14 @@
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
new file mode 100644
index 000000000000..7a1c8be89e5b
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
@@ -0,0 +1,14 @@
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
new file mode 100644
index 000000000000..7fea49ec6b8f
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
@@ -0,0 +1,11 @@
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
index cd49c8ce2059..9ab2177df1ab 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
@@ -1,2 +1,14 @@
 # Whole machine hangs
-kms_cursor_legacy@all-pipes-torture-move
\ No newline at end of file
+kms_cursor_legacy@all-pipes-torture-move
+
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index 327039f70252..edf64057f866 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -1,2 +1,14 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
+
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
index 327039f70252..edf64057f866 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -1,2 +1,14 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
+
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
index 618e3a3a7277..dd24dc190db0 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
@@ -5,3 +5,15 @@ kms_bw.*
 # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/4b49f902ec6f2bb382cbbf489870573f4b43371e
 # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/38cdf4c5559771e2474ae0fecef8469f65147bc1
 msm_mapping@*
+
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
index f20c3574b75a..c33dc95b7fc1 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
@@ -49,4 +49,19 @@ kms_plane_lowres@pipe-F-tiling-y
 kms_cursor_crc.*
 
 # Machine is hanging in this test, so skip it
-kms_pipe_crc_basic@disable-crc-after-crtc
\ No newline at end of file
+kms_pipe_crc_basic@disable-crc-after-crtc
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
index 10c3d81a919a..8a7c9464b30d 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
@@ -3,3 +3,18 @@
 
 # Too unstable, machine ends up hanging after lots of Oopses
 kms_cursor_legacy.*
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
index 78be18174012..59d390d6856f 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
@@ -3,4 +3,18 @@
 kms_cursor_legacy.*
 
 # Job just hangs without any output
-kms_flip@flip-vs-suspend.*
\ No newline at end of file
+kms_flip@flip-vs-suspend.*
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+xe_.*
-- 
2.40.1


