Return-Path: <linux-arm-msm+bounces-90714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMUdBCKYeGkWrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:49:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513E9322E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6836830A48BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF10344D9F;
	Tue, 27 Jan 2026 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oRmX07F0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B8A344D9C;
	Tue, 27 Jan 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510683; cv=none; b=HxP08+A9qzuPNcZnusu/q33bn20USl/aj2Ku/rW5etHSFZqU8a3MF+46kTOAhg8OBFM++/LKAX8LBpzclxLUBeKRFC2clxrK1nxjv/hU/u1+k4Q1/foH96LY55Siyo8eyW+A5vkIR/vIBeEqxT3rFc2IBEqLkH6XUf8TtpIuQh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510683; c=relaxed/simple;
	bh=xhzd/Rzhmres2LNpnqypmTCkifou5yjzvRbrn8viXrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snloAxcsojzN/+Od8w5xunbH9Gcu1cG+rCB8qmUOblu6mhQqOESr76qlO+7+8fkW6CXLhKHheaOM7F5+LNV1r5wd6H2rYLDgaD74BfPSC25sb18J/FVepkFY6A2CngMecP1gHuNowpT5as0yynUtnJYFdPqpm1a/TmSlB/Kfhbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oRmX07F0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769510680;
	bh=xhzd/Rzhmres2LNpnqypmTCkifou5yjzvRbrn8viXrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oRmX07F0an/MPg0IhEhzqVnUz72jroC0O08qmAi0uXOz+f6RNDIlsqUICpsb0x5+I
	 kpeJbzgxaiL/snZn1Mw+U9DRyq337njQI2LVs+VB8kafSy/mpWxuTT5QAXMiwaZjsZ
	 S0VW+cZrm1L2erY00eN0akMx+inyfpl0RwPzwi+zK6XFZYhzdyUoXXM3ZjHc3WJhEB
	 SE5XDNdhmIM6E9/2V3N1s648ZbKICOdp9XYLloykajqbfDTqdr2fH6zOXumxxWZvxs
	 oYQvBywdTURdqX/U4v6hWpPRTfLEBMNkHHHpat0Px8unYoq061eXcoPU5BYdr2HaVR
	 dN6cJOCutkx/g==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65E0917E0117;
	Tue, 27 Jan 2026 11:44:36 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/7] drm/ci: add rk3588-rock-5b
Date: Tue, 27 Jan 2026 16:14:00 +0530
Message-ID: <20260127104406.200505-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127104406.200505-1-vignesh.raman@collabora.com>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,lists.infradead.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90714-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[create-clear:email,forked-bo:email,torture-bo:email,master-drop-set-user:email,hotreplug:email,unplug-rescan:email,torture-move:email,forked-move:email,gitlab.freedesktop.org:url,collabora.com:email,collabora.com:dkim,collabora.com:mid,single-bo:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.freedesktop.org:email,lease-uevent:email]
X-Rspamd-Queue-Id: 8513E9322E
X-Rspamd-Action: no action

Add job that executes the IGT test suite for rk3588-rock-5b.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/arm64.config               |  5 ++++
 drivers/gpu/drm/ci/build.sh                   |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |  1 +
 drivers/gpu/drm/ci/igt_runner.sh              |  2 +-
 drivers/gpu/drm/ci/test.yml                   | 28 +++++++++++++++++++
 .../drm/ci/xfails/panthor-rk3588-fails.txt    |  5 ++++
 .../drm/ci/xfails/panthor-rk3588-skips.txt    | 20 +++++++++++++
 .../drm/ci/xfails/rockchip-rk3588-fails.txt   | 10 +++++++
 .../drm/ci/xfails/rockchip-rk3588-skips.txt   | 14 ++++++++++
 10 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index ff92b9cc9435..b0eed114ed29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2149,6 +2149,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+F:	drivers/gpu/drm/ci/xfails/panthor*
 F:	drivers/gpu/drm/panthor/
 F:	include/uapi/drm/panthor_drm.h
 
diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index b850b88787ad..5da3913ec8a4 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -209,3 +209,8 @@ CONFIG_ARM_TEGRA_DEVFREQ=y
 CONFIG_TEGRA_SOCTHERM=y
 CONFIG_DRM_TEGRA_DEBUG=y
 CONFIG_PWM_TEGRA=y
+
+# For Rockchip rk3588
+CONFIG_DRM_PANTHOR=m
+CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
+CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index ac5e7ed195cf..5485ea756382 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -19,6 +19,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     GCC_ARCH="aarch64-linux-gnu"
     DEBIAN_ARCH="arm64"
     DEVICE_TREES="arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb"
+    DEVICE_TREES+=" arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb"
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 20e8cbdc39e9..56088c5393cd 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -136,6 +136,7 @@ stages:
   - meson
   - msm
   - panfrost
+  - panthor
   - powervr
   - rockchip
   - software-driver
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 1c01bda52237..741d30655ab5 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -23,7 +23,7 @@ set -e
 
 mkdir -p /lib/modules
 case "$DRIVER_NAME" in
-    amdgpu|vkms)
+    amdgpu|vkms|panthor)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/. || true
         modprobe --first-time $DRIVER_NAME
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index b7409f8a13a5..f6bee5b67931 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -206,6 +206,19 @@ msm:sm8350-hdk:
     KERNEL_IMAGE_TYPE: ""
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
+.rk3588:
+  extends:
+    - .lava-igt:arm64
+    - .rockchip-device
+  parallel: 2
+  variables:
+    DEVICE_TYPE: rk3588-rock-5b
+    GPU_VERSION: rk3588
+    BOOT_METHOD: u-boot
+    KERNEL_IMAGE_NAME: Image
+    KERNEL_IMAGE_TYPE: "image"
+    RUNNER_TAG: mesa-ci-x86-64-lava-rk3588-rock-5b
+
 rockchip:rk3288:
   extends:
     - .rk3288
@@ -226,6 +239,16 @@ panfrost:rk3399:
     - .rk3399
     - .panfrost-gpu
 
+rockchip:rk3588:
+  extends:
+    - .rk3588
+    - .rockchip-display
+
+panthor:rk3588:
+  extends:
+    - .rk3588
+    - .panthor-gpu
+
 .i915:
   extends:
     - .lava-igt:x86_64
@@ -354,6 +377,11 @@ amdgpu:stoney:
   variables:
     DRIVER_NAME: panfrost
 
+.panthor-gpu:
+  stage: panthor
+  variables:
+    DRIVER_NAME: panthor
+
 .mt8173:
   extends:
     - .mediatek-device
diff --git a/drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt b/drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
new file mode 100644
index 000000000000..7407bd0128d4
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
@@ -0,0 +1,5 @@
+core_hotunplug@hotreplug,Fail
+core_hotunplug@hotreplug-lateclose,Fail
+core_hotunplug@hotunplug-rescan,Fail
+core_hotunplug@unplug-rescan,Fail
+core_setmaster@master-drop-set-user,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt b/drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
new file mode 100644
index 000000000000..b724cf04e3b3
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
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
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
new file mode 100644
index 000000000000..a3aac6acb5df
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
@@ -0,0 +1,10 @@
+core_setmaster@master-drop-set-user,Fail
+dumb_buffer@create-clear,Crash
+kms_3d,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
+kms_cursor_legacy@single-move,Fail
+kms_cursor_legacy@torture-bo,Fail
+kms_cursor_legacy@torture-move,Fail
+kms_lease@lease-uevent,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt
new file mode 100644
index 000000000000..a165fccd8a93
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt
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
-- 
2.47.3


