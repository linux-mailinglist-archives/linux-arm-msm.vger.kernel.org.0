Return-Path: <linux-arm-msm+bounces-65647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D8B0A14C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBEA3A81789
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C9A2C1589;
	Fri, 18 Jul 2025 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qTl+/PNw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6D82C08DD;
	Fri, 18 Jul 2025 10:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836090; cv=none; b=UaPWRV3Z7+IOodcOnCa+XL1Qdt6T+Lxh5/wNSm+m8dyKEV/g4pV06XzsQ/pxnxy55FF+Ech6uug6FPH1BZFB1F/dE2rKTvsHp3LrGsiVas93kZdkmUs3KAgo8J8dK+9DnaEOIw0jCJZ2eRAaZyiHID+OpzvFGFPEQv5iGO8srg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836090; c=relaxed/simple;
	bh=zAFyDkIf9qCUhBZe8gnx6U8C2dwmN1Ikbn0/wkc7YvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdeU0UnRfgUoWwA/sfGYLjDFe9TMF+ePAvFNFzYnFZ+uMTpYPx2rZ0TR9TrAqnpj2fcBO3QjrX+yp63GSsHpfrJKGPVtSzCBooi7l2zdDZ9ttv9EkMZMwCdzbkWvcPbr6zrKbs7RtltZD3gId0QrlEL9S+Msoxxeal6bEQN+2JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qTl+/PNw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752836086;
	bh=zAFyDkIf9qCUhBZe8gnx6U8C2dwmN1Ikbn0/wkc7YvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qTl+/PNwgT4pQnJiv0dRTS0wCfOw5K0VqkHPHmswV3uS26vgK96Bl2lt7jN4pdurW
	 +lLQcQ4vUxqBodZrP5pFnHjF60LbRTLo0qHUH1yzwa7wdalGQXMUig7sS559dhO7fY
	 /UakIWIXeP0TxDWU7o0/AFU6cJ6nYFq6lF1NoxGRMfZTQXXSc4YvwqEz/9Mnz9lfx+
	 a39eRszxJAvOcbWHUeNeHgoMzErBxD/mGCBRtPwEW5VOtkusmUEqKk5oMHiCIkPAPY
	 I7PFLsY82pI+QjSoMMUeCv1nbc8WiFZZU7/G5ej+ZLnrxnLm3hemaFMS5rmj/UQ+pk
	 2EKYvXymLrxcQ==
Received: from debian.. (unknown [171.76.80.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3538517E1560;
	Fri, 18 Jul 2025 12:54:43 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] drm/ci: add mt8192
Date: Fri, 18 Jul 2025 16:23:59 +0530
Message-ID: <20250718105407.32878-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add job that executes the IGT test suite for mt8192-asurada-spherion-r0.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/arm64.config               |  4 +++
 drivers/gpu/drm/ci/test.yml                   | 13 +++++--
 .../drm/ci/xfails/mediatek-mt8192-fails.txt   | 34 +++++++++++++++++++
 .../drm/ci/xfails/mediatek-mt8192-skips.txt   | 14 ++++++++
 .../drm/ci/xfails/panfrost-mt8192-fails.txt   |  9 +++++
 .../drm/ci/xfails/panfrost-mt8192-skips.txt   | 20 +++++++++++
 6 files changed, 92 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8192-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8192-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8192-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8192-skips.txt

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 7cd6d9d612fc..bae0175df556 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -213,3 +213,7 @@ CONFIG_PWM_TEGRA=y
 CONFIG_DRM_PANTHOR=m
 CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
 CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
+
+# For Mediatek mt8192
+CONFIG_SPMI_MTK_PMIF=y
+CONFIG_REGULATOR_MT6315=y
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index dbd582442776..3d871c4bb5b9 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -451,8 +451,7 @@ panfrost:mt8183:
     - .mt8183
     - .panfrost-gpu
 
-# drm-mtk doesn't even probe yet in mainline for mt8192
-.mediatek:mt8192:
+.mt8192:
   extends:
     - .mediatek-device
   parallel: 3
@@ -461,6 +460,16 @@ panfrost:mt8183:
     GPU_VERSION: mt8192
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8192-asurada-spherion-r0
 
+mediatek:mt8192:
+  extends:
+    - .mt8192
+    - .mediatek-display
+
+panfrost:mt8192:
+  extends:
+    - .mt8192
+    - .panfrost-gpu
+
 .meson-device:
   extends:
     - .lava-igt:arm64
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8192-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8192-fails.txt
new file mode 100644
index 000000000000..4b4f1b594c23
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8192-fails.txt
@@ -0,0 +1,34 @@
+core_setmaster@master-drop-set-user,Fail
+dumb_buffer@create-clear,Crash
+kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
+kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@connected-linear-tiling-1-displays-3840x2160p,Fail
+kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-2160x1440p,Fail
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_color@invalid-gamma-lut-sizes,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_flip@basic-plain-flip,Fail
+kms_flip@dpms-off-confusion,Fail
+kms_flip@dpms-off-confusion-interruptible,Fail
+kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
+kms_flip@flip-vs-expired-vblank,Fail
+kms_flip@flip-vs-expired-vblank-interruptible,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning,Fail
+kms_flip@flip-vs-panning-interruptible,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_flip@flip-vs-suspend-interruptible,Fail
+kms_flip@plain-flip-fb-recreate,Fail
+kms_flip@plain-flip-fb-recreate-interruptible,Fail
+kms_flip@plain-flip-interruptible,Fail
+kms_flip@plain-flip-ts-check,Fail
+kms_flip@plain-flip-ts-check-interruptible,Fail
+kms_invalid_mode@overflow-vrefresh,Fail
+kms_lease@lease-uevent,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8192-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8192-skips.txt
new file mode 100644
index 000000000000..a165fccd8a93
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8192-skips.txt
@@ -0,0 +1,14 @@
+# Skip driver specific tests
+^amdgpu.*
+^msm.*
+nouveau_.*
+^panfrost.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+tools_test.*
+kms_dp_link_training.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8192-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8192-fails.txt
new file mode 100644
index 000000000000..6589d194323f
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8192-fails.txt
@@ -0,0 +1,9 @@
+core_hotunplug@hotreplug,Fail
+core_hotunplug@hotreplug-lateclose,Fail
+core_hotunplug@hotunplug-rescan,Fail
+core_hotunplug@unplug-rescan,Fail
+core_setmaster@master-drop-set-user,Fail
+panfrost/panfrost_prime@gem-prime-import,Fail
+panfrost/panfrost_submit@pan-reset,Fail
+panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail
+panfrost/panfrost_submit@pan-unhandled-pagefault,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8192-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8192-skips.txt
new file mode 100644
index 000000000000..b724cf04e3b3
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8192-skips.txt
@@ -0,0 +1,20 @@
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
+kms_dp_link_training.*
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip display functionality tests for GPU-only drivers
+dumb_buffer.*
+fbdev.*
-- 
2.47.2


