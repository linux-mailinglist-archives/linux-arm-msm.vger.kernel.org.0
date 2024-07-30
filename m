Return-Path: <linux-arm-msm+bounces-27352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 386FC940474
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 04:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B69C1C20754
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 02:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7481D15FA73;
	Tue, 30 Jul 2024 02:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OxQFiWXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A95778C98;
	Tue, 30 Jul 2024 02:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722305816; cv=none; b=leesTF+2ZSKUCW5I3tdsegNdGVJpoAPb18AXvjInhsQ/j7geEGjRgayAYa+UKivRWLPbcZrZA83JXJgDQfGKylDnGc5BmXZ4b0I8+Zb1vATUV8Zh33V75QqESU3pDGp38ZqHJZMYSn9Cga0raQqRKoA/R5lJc32zZmjAlQOdjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722305816; c=relaxed/simple;
	bh=uMbh7Osl28ZaSw+7CfzYyeg/kT8fDaFHO1NY0dBJ4Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BoMf97xmNTa3wKdnWvCPeqMEDqyNYmcFNNY5kuUjTBLZst8Z31C/tfU/b/NK3GaODL2UEnlZfahQolUicGf0JvOpKfZ5zPh3d76kaMPa2jdW7t1PQaWIQ0LsCgXQzP9bFWnBN+b734W3vIBLvEluSziqU7c/oEES5u0eSoBAY7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OxQFiWXx; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722305811;
	bh=uMbh7Osl28ZaSw+7CfzYyeg/kT8fDaFHO1NY0dBJ4Y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OxQFiWXxQ2JT1RD/G8XjyTIU0oW95ZYTInaNxtnpQS9wN2iwnzMwb56oiNT35pvn/
	 vu08K/n4qlH9k8NvTiv+ULXMf7aWyUeEkzoVY4gOrmDLGoa2U1X2I0qAe051DLGaUR
	 YGqb/LYyY2xDZpL7Bdi88Fzt2KDfI+Jf1MrgD/ilM7LS238I6ur+DSjqstqTN0Fkc8
	 hzR8ZeWmx2FWbO302Bkk1g0DpSkvVYQAFhL1SMzOFeQfL8q+Fibsh3L8rcEacY4G2R
	 rGnuMVw3/h1geArWXEbYt0/FI7ZchpgOmCMiH3vXnE+ixtLCeykBN9JkS8QHBDOye9
	 4SSxlO4jRvtcA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8551F3782191;
	Tue, 30 Jul 2024 02:16:47 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	dmitry.baryshkov@linaro.org,
	mcanal@igalia.com,
	melissa.srw@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/6] drm/ci: mediatek: add tests for mediatek display driver
Date: Tue, 30 Jul 2024 07:45:38 +0530
Message-ID: <20240730021545.912271-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730021545.912271-1-vignesh.raman@collabora.com>
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For mediatek mt8183, the display driver is mediatek, while the
gpu driver is panfrost. Currently, in drm-ci for mt8183, only
the gpu driver is tested. Refactor the existing mediatek jobs
and add support in drm-ci to test both display and gpu driver
for mt8183 and update xfails.

Since the correct driver name is passed from the job to test gpu
and display driver, remove the check to set IGT_FORCE_DRIVER
based on driver name for mediatek jobs.

Update the MAINTAINERS file to include xfails for panfrost driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files, and remove IGT_FORCE_DRIVER from the
    script since it's now set by the job.

v3:
  - Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME. Also update xfails.

v4:
  - Remove the display suffix in job and rename xfails accordingly.
    Remove the change adding job name in GPU_VERSION.

v5:
  - Add mediatek-display job.

v6:
  - Squash commits for display and gpu driver testing. Reword the commit message.


v7:
  - Rebase with recent drm-ci fixes and retest with latest IGT.

v8:
  - Add header for each flaky test.

v9:
  - Skip display functionality tests for GPU-only drivers and update expectation files.

---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  7 ----
 drivers/gpu/drm/ci/test.yml                   | 38 +++++++++++++++----
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 27 ++++++++++---
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  | 20 ++++++++++
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |  4 +-
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |  1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   | 23 +++++++++++
 9 files changed, 99 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index cb8355f20b36..f3783f2269ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1741,6 +1741,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/gpu/panfrost.rst
+F:	drivers/gpu/drm/ci/xfails/panfrost*
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index b09976c3d2c2..9d800f629f08 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -121,8 +121,8 @@ stages:
   - mediatek
   - meson
   - msm
+  - panfrost
   - rockchip
-  - virtio-gpu
   - software-driver
 
 # YAML anchors for rule conditions
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 37c724dba8cb..6193865f23a3 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -23,13 +23,6 @@ case "$DRIVER_NAME" in
     rockchip|meson)
         export IGT_FORCE_DRIVER="panfrost"
         ;;
-    mediatek)
-        if [ "$GPU_VERSION" = "mt8173" ]; then
-            export IGT_FORCE_DRIVER=${DRIVER_NAME}
-        elif [ "$GPU_VERSION" = "mt8183" ]; then
-            export IGT_FORCE_DRIVER="panfrost"
-        fi
-        ;;
     amdgpu|vkms)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/. || true
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index ee908b66aad2..219eca5ef24c 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -280,38 +280,62 @@ amdgpu:stoney:
     GPU_VERSION: stoney
     RUNNER_TAG: mesa-ci-x86-64-lava-hp-11A-G6-EE-grunt
 
-.mediatek:
+.mediatek-device:
   extends:
     - .lava-igt:arm64
   stage: mediatek
   variables:
-    DRIVER_NAME: mediatek
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
 
-mediatek:mt8173:
+.mediatek-display:
+  stage: mediatek
+  variables:
+    DRIVER_NAME: mediatek
+
+.panfrost-gpu:
+  stage: panfrost
+  variables:
+    DRIVER_NAME: panfrost
+
+.mt8173:
   extends:
-    - .mediatek
+    - .mediatek-device
   parallel: 4
   variables:
     DEVICE_TYPE: mt8173-elm-hana
     GPU_VERSION: mt8173
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
 
-mediatek:mt8183:
+.mt8183:
   extends:
-    - .mediatek
+    - .mediatek-device
   parallel: 3
   variables:
     DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
     GPU_VERSION: mt8183
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
 
+mediatek:mt8173:
+  extends:
+    - .mt8173
+    - .mediatek-display
+
+mediatek:mt8183:
+  extends:
+    - .mt8183
+    - .mediatek-display
+
+panfrost:mt8183:
+  extends:
+    - .mt8183
+    - .panfrost-gpu
+
 # drm-mtk doesn't even probe yet in mainline for mt8192
 .mediatek:mt8192:
   extends:
-    - .mediatek
+    - .mediatek-device
   parallel: 3
   variables:
     DEVICE_TYPE: mt8192-asurada-spherion-r0
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 70053ea74b5d..8cb2cb67853d 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -1,7 +1,22 @@
-dumb_buffer@create-clear,Fail
-dumb_buffer@create-valid-dumb,Fail
+core_setmaster@master-drop-set-shared-fd,Fail
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
+dumb_buffer@create-clear,Crash
 dumb_buffer@invalid-bpp,Fail
-dumb_buffer@map-invalid-size,Fail
-dumb_buffer@map-uaf,Fail
-dumb_buffer@map-valid,Fail
-panfrost/panfrost_prime@gem-prime-import,Fail
+fbdev@eof,Fail
+fbdev@pan,Fail
+fbdev@read,Fail
+fbdev@unaligned-read,Fail
+kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
+kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_color@invalid-gamma-lut-sizes,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_lease@lease-uevent,Fail
+kms_properties@plane-properties-atomic,Fail
+kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
new file mode 100644
index 000000000000..df7e5ce7a036
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
@@ -0,0 +1,20 @@
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
+# Bug Report: https://lore.kernel.org/linux-mediatek/0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.28-gf13702b8e
+# Linux Version: 6.10.0-rc5
+kms_bw@linear-tiling-1-displays-2560x1440p
+
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
+# Bug Report: https://lore.kernel.org/linux-mediatek/0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.28-gf13702b8e
+# Linux Version: 6.10.0-rc5
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
+
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
+# Bug Report: https://lore.kernel.org/linux-mediatek/0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.28-gf13702b8e
+# Linux Version: 6.10.0-rc5
+fbdev@write
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
index aeec535107c1..8198e06344a3 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
@@ -2,6 +2,7 @@
 ^amdgpu.*
 ^msm.*
 nouveau_.*
+^panfrost.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
@@ -11,9 +12,6 @@ gem_.*
 i915_.*
 tools_test.*
 
-# Panfrost is not a KMS driver, so skip the KMS tests
-kms_.*
-
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
new file mode 100644
index 000000000000..fe8ce2ce33e6
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
@@ -0,0 +1 @@
+panfrost/panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
new file mode 100644
index 000000000000..3c7e494857b5
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
@@ -0,0 +1,23 @@
+# Skip driver specific tests
+^amdgpu.*
+^msm.*
+nouveau_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+tools_test.*
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip display functionality tests for GPU-only drivers
+dumb_buffer.*
+fbdev.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
-- 
2.43.0


