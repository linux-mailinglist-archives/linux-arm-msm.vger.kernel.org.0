Return-Path: <linux-arm-msm+bounces-18265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B78ADC99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 06:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4F311F228D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 04:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F19E1CD35;
	Tue, 23 Apr 2024 04:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U57xcu3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662291CA82;
	Tue, 23 Apr 2024 04:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713845016; cv=none; b=KXAe6iHVtklTojOXSRe51ptVJx9xFFyMJsaVgxRp3lmPt0PlRyNjOJrV3hRJty9/rvOoea+celnZrkd57Aw8K42NX8Hr8yXHI+qt+SSErfDxqHyh1UWYSAmpPlR6wP6V21ZzUSFLkkIMubG5lM5Y5BkZcvnMUTMzFfIMrTeHcnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713845016; c=relaxed/simple;
	bh=VAaKLzzCKwuE52HpbPyhCXEtgH470macmRPpN1oVxeE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R7q+pS0DkT3Cjb0umcUDIk01OQ/VKkCSM1gEPCejbo34g0c2xbMO0r3Fom2Pt8k7SFwG9O3fMP5Tz3zsj+ZMOnPj3Hf28/N0wx8mxTOl4+XidWTbLjYylWWwZrtxMNhr3E4JTltowRCMhT+L1+QunU2JzfJ1sUY9D009nr97qEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U57xcu3J; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713845010;
	bh=VAaKLzzCKwuE52HpbPyhCXEtgH470macmRPpN1oVxeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U57xcu3J8Fa/jrun+mUzvvs4lHrJV3mSGeUz/H2Tdg7YOf3Xh5W65jfnhh9yCbN9J
	 iTWTnM6XA413yj7Pz7mYEzYYCmesX03US3uX9dsyiQum4WKtrM9YaONEDMNPwAHJiU
	 MWijXuQ93eWSgpCvT59tkAAnz3dI73h9fvvMkguYdMM+ET8WNWUVh4auy+HT9XzXPs
	 B+hiP1ouTr0snNO+QeOjbZdjrl16Fwoq6kSKGRk7ShC9TbmmkV8V67vTFo3F3C6etX
	 pIdXsZM47OT85D8Qid38sWWncVi1fPEq7hJTmkvL2TgxBNg+yzp6a3AV1vjPwe6uRI
	 LySB6xqv1bDDQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B6A843780C21;
	Tue, 23 Apr 2024 04:03:26 +0000 (UTC)
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
Subject: [PATCH v1 1/4] drm/ci: uprev mesa version
Date: Tue, 23 Apr 2024 09:32:40 +0530
Message-Id: <20240423040243.448091-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240423040243.448091-1-vignesh.raman@collabora.com>
References: <20240423040243.448091-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zlib.net is not allowing tarball download anymore and results
in below error in kernel+rootfs_arm32 container build,
urllib.error.HTTPError: HTTP Error 403: Forbidden
urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type

Uprev mesa to latest version which includes a fix for this issue.
https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e

Also copy helper scripts to install, so that the ci jobs can
use these scripts for logging.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.sh       |  1 +
 drivers/gpu/drm/ci/container.yml  | 12 ++++--------
 drivers/gpu/drm/ci/gitlab-ci.yml  | 11 ++++++++---
 drivers/gpu/drm/ci/image-tags.yml |  3 ++-
 drivers/gpu/drm/ci/test.yml       |  2 ++
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 106f2d40d222..8a3baa003904 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -128,6 +128,7 @@ fi
 # Pass needed files to the test stage
 mkdir -p install
 cp -rfv .gitlab-ci/* install/.
+cp -rfv ci/*  install/.
 cp -rfv install/common install/ci-common
 cp -rfv drivers/gpu/drm/ci/* install/.
 
diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
index 9764e7921a4f..d6edf3635b23 100644
--- a/drivers/gpu/drm/ci/container.yml
+++ b/drivers/gpu/drm/ci/container.yml
@@ -36,15 +36,15 @@ debian/android_build:
   rules:
     - when: never
 
-debian/x86_64_test-android:
+.debian/x86_64_test-android:
   rules:
     - when: never
 
-windows_build_vs2019:
+windows_build_msvc:
   rules:
     - when: never
 
-windows_test_vs2019:
+windows_test_msvc:
   rules:
     - when: never
 
@@ -56,10 +56,6 @@ rustfmt:
    rules:
     - when: never
 
-windows_vs2019:
-   rules:
-    - when: never
-
-clang-format:
+windows_msvc:
    rules:
     - when: never
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 084e3ff8e3f4..9bf5190604a7 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 9d162de9a05155e1c4041857a5848842749164cf
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha e5f133ccc426a197c48a4e88f5377f943f078180
 
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
@@ -26,10 +26,13 @@ variables:
   JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
   # default kernel for rootfs before injecting the current kernel tree
   KERNEL_REPO: "gfx-ci/linux"
-  KERNEL_TAG: "v6.6.4-for-mesa-ci-e4f4c500f7fb"
+  KERNEL_TAG: "v6.6.21-mesa-19fc"
   KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/${KERNEL_REPO}/${KERNEL_TAG}
   LAVA_TAGS: subset-1-gfx
   LAVA_JOB_PRIORITY: 30
+  ARTIFACTS_BASE_URL: https://${CI_PROJECT_ROOT_NAMESPACE}.${CI_PAGES_DOMAIN}/-/${CI_PROJECT_NAME}/-/jobs/${CI_JOB_ID}/artifacts
+  # Python scripts for structured logger
+  PYTHONPATH: "$PYTHONPATH:$CI_PROJECT_DIR/install"
 
 default:
   before_script:
@@ -46,6 +49,7 @@ default:
     - cd $CI_PROJECT_DIR
     - curl --output - $DRM_CI_PROJECT_URL/-/archive/$DRM_CI_COMMIT_SHA/mesa-$DRM_CI_COMMIT_SHA.tar.gz | tar -xz
     - mv mesa-$DRM_CI_COMMIT_SHA/.gitlab-ci* .
+    - mv mesa-$DRM_CI_COMMIT_SHA/bin/ci .
     - rm -rf mesa-$DRM_CI_COMMIT_SHA/
     - echo -e "\e[0Ksection_end:$(date +%s):drm_ci_download_section\r\e[0K"
 
@@ -98,6 +102,7 @@ include:
 stages:
   - sanity
   - container
+  - code-validation
   - git-archive
   - build
   - amdgpu
@@ -107,7 +112,6 @@ stages:
   - msm
   - rockchip
   - virtio-gpu
-  - lint
 
 # YAML anchors for rule conditions
 # --------------------------------
@@ -218,6 +222,7 @@ make git archive:
   script:
     # Remove drm-ci files we just added
     - rm -rf .gitlab-ci.*
+    - rm -rf ci
 
     # Compactify the .git directory
     - git gc --aggressive
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 7ab4f2514da8..d8f72b82c938 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,5 +1,5 @@
 variables:
-   CONTAINER_TAG: "2023-10-11-mesa-uprev"
+   CONTAINER_TAG: "2024-04-22-mesa-uprev"
    DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
@@ -7,6 +7,7 @@ variables:
    DEBIAN_BUILD_TAG: "2023-10-08-config"
 
    KERNEL_ROOTFS_TAG: "2023-10-06-amd"
+   PKG_REPO_REV: "3cc12a2a"
 
    DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
    DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 8bc63912fddb..612c9ede3507 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -150,6 +150,8 @@ msm:sdm845:
     BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
     GPU_VERSION: sdm845
     RUNNER_TAG: google-freedreno-cheza
+    DEVICE_TYPE: sdm845-cheza-r3
+    FARM: google
   script:
     - ./install/bare-metal/cros-servo.sh
 
-- 
2.40.1


