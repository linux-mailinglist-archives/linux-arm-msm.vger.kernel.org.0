Return-Path: <linux-arm-msm+bounces-103019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KsbyF8Go3WlQhgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 04:38:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A483F50FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 04:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A207B301DCCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 02:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305ED22A4E1;
	Tue, 14 Apr 2026 02:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KsODtmMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9526C8460;
	Tue, 14 Apr 2026 02:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776134334; cv=none; b=KuPzlaEQ1dgfixxwpAvMV5P3ZrZKtsSKJ6YUGFehLY0LLltU1qGuw+gJ6WFg2st7Kk6R16rX9M85O6Wyvkt3naiIHC8tWq6DkIzjvmEWJOEpXtPpP/vSKKC49KgV4DHYJKcHxdTfWmlyMpZ6BN0xxxXRoCl573BJ0fjWe3gC1cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776134334; c=relaxed/simple;
	bh=Qx+tHMbq0fPBzQDr2bz9NRk8eO6nlSbmaWoHsFYDGz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILOpaIUnJzoG5IZp4IgaeAahBKTNryEI/D9wL5sEq2rw6/A6/82/UjtCf7FkFauouhzUeP5fCAjbm/gOfjALo4pm+yYd/TiY8EINVwtBcrH1G6GpJ2NlzcqUnBCIRj5YCkLL2XzMGV88h8abSQipKNxoJ50jjpNbAj/4WJ7KPoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KsODtmMR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776134330;
	bh=Qx+tHMbq0fPBzQDr2bz9NRk8eO6nlSbmaWoHsFYDGz4=;
	h=From:To:Cc:Subject:Date:From;
	b=KsODtmMRAkY0I5yiJ8QB3jxi4qAQSv6GX1Ab/gXqmEd8pdXhwp7lwBUP3ikElJ9NI
	 0O8IZ+D+aWeRaTVHgiY6Q0a9xrjVUiCHoD/xK5y5DQPT4TMkmu2878Q+q2yur768OU
	 0907Z2znLb0m9GxhoH7njs5RA34b+ETCCwJ2QdIAnemTCTDB9A8pJa5QyMC6M/g+Wh
	 FLKjQW8I+B3NVnf0svVkITK+dZBXUC8WPgbSbdXHaCa047zmM/XdDH/RHfYCh2mPIs
	 dSTdCTajc5k7ZpyHJE4GT4RDVDtcZ/D8pcnOo0YTHXLvQrBESV0ApRHyHNhhENHaFA
	 WQSz/9Kh3Dq0A==
Received: from vignesh-thinkpad.. (unknown [100.64.0.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 871E517E1274;
	Tue, 14 Apr 2026 04:38:47 +0200 (CEST)
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
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/ci: add sc7180-trogdor-wormdingler-rev1-boe
Date: Tue, 14 Apr 2026 08:08:28 +0530
Message-ID: <20260414023835.169121-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103019-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 53A483F50FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add job that executes the IGT test suite for
sc7180-trogdor-wormdingler-rev1-boe.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add comments to clarify panel configurations for sc7180 trogdor devices
  - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
  - Failure pipeline - https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1642103

v1:
  - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
  - Depends on https://lore.kernel.org/dri-devel/20260210071138.2256773-1-vignesh.raman@collabora.com/

---
 drivers/gpu/drm/ci/arm64.config               |  4 +++
 drivers/gpu/drm/ci/build.sh                   |  1 +
 drivers/gpu/drm/ci/test.yml                   | 13 +++++++++
 ...180-trogdor-wormdingler-rev1-boe-fails.txt | 23 ++++++++++++++++
 ...180-trogdor-wormdingler-rev1-boe-skips.txt | 27 +++++++++++++++++++
 5 files changed, 68 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 5da3913ec8a4..a0ced4df7d79 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -214,3 +214,7 @@ CONFIG_PWM_TEGRA=y
 CONFIG_DRM_PANTHOR=m
 CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
 CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
+
+# For sc7180-trogdor-wormdingler-rev1-boe
+CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=y
+CONFIG_GPIO_SHARED_PROXY=y
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index d00d549cbd9c..5a3f3615f773 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -29,6 +29,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sm8350-hdk.dtb"
+    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb"
 elif [[ "$KERNEL_ARCH" = "arm" ]]; then
     GCC_ARCH="arm-linux-gnueabihf"
     DEBIAN_ARCH="armhf"
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index f6bee5b67931..4684c07d3ef5 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -102,6 +102,7 @@
     KERNEL_IMAGE_TYPE: ""
     LAVA_FIRMWARE: qcom-lava
 
+# eDP panel (ti sn65dsi86 dsi->edp bridge)
 msm:sc7180-trogdor-lazor-limozeen:
   extends:
     - .msm-sc7180
@@ -112,6 +113,7 @@ msm:sc7180-trogdor-lazor-limozeen:
     GPU_VERSION: ${DEVICE_TYPE}
     RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-lazor-limozeen
 
+# eDP panel (parade ps8640 dsi->edp bridge)
 msm:sc7180-trogdor-kingoftown:
   extends:
     - .msm-sc7180
@@ -122,6 +124,17 @@ msm:sc7180-trogdor-kingoftown:
     GPU_VERSION: ${DEVICE_TYPE}
     RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
 
+# MIPI DSI panel
+msm:sc7180-trogdor-wormdingler:
+  extends:
+    - .msm-sc7180
+  parallel: 6
+  variables:
+    DEVICE_TYPE: sc7180-trogdor-wormdingler-rev1-boe
+    DTB: sc7180-trogdor-wormdingler-rev1-boe
+    GPU_VERSION: ${DEVICE_TYPE}
+    RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-wormdingler-rev1-boe
+
 msm:apq8016:
   extends:
     - .lava-igt:arm64
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
new file mode 100644
index 000000000000..4af93eeeaf99
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
@@ -0,0 +1,23 @@
+core_setmaster@master-drop-set-user,Fail
+kms_color@ctm-0-25,Fail
+kms_color@ctm-0-50,Fail
+kms_color@ctm-0-75,Fail
+kms_color@ctm-blue-to-red,Fail
+kms_color@ctm-green-to-red,Fail
+kms_color@ctm-negative,Fail
+kms_color@ctm-red-to-blue,Fail
+kms_color@ctm-signed,Fail
+kms_color@gamma,Fail
+kms_color@legacy-gamma,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_invalid_mode@overflow-vrefresh,Fail
+kms_lease@lease-uevent,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
+kms_plane_alpha_blend@alpha-7efc,Fail
+kms_plane_alpha_blend@coverage-7efc,Fail
+kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt
new file mode 100644
index 000000000000..8d1768de90cc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt
@@ -0,0 +1,27 @@
+# Skip driver specific tests
+^amdgpu.*
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
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
+
+# sc7180 does not have APRIV, so memptrs is not protected.
+# (Preemption is not supported on devices that do not have
+# APRIV, so this is ok)
+msm/msm_mapping@memptrs
-- 
2.47.3


