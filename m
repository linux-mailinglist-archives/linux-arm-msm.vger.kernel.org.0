Return-Path: <linux-arm-msm+bounces-90710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHH9J6KXeGkWrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:46:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18470931A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F0173063B81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A36E3446CC;
	Tue, 27 Jan 2026 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ovdPJImi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19B43446B7;
	Tue, 27 Jan 2026 10:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510670; cv=none; b=hgH6bcR5nQspdPyEkhfg9U4Q6Pmg8qFVBi8XDpZPospUrmT4Z+orfG32ObG5bFzkh77g8aT2Kv6euwzyocBa0GN2DPLtVVDDpY7Weq8EpzAUr4e9z3W5pkFOy7uQ0aMHY392P6wIAhtQGmUy1hySXAmJKfgi1t2UwWECp3iJqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510670; c=relaxed/simple;
	bh=8k1knDjmTySyw7ZGPkl+PripTkXl+ZQ0RVPekZtLf28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ps0LGZVL/iHWNxpfp9BNgp7sGqCfjfw4yMVtzAKvvlmF01D+VskAVVZJyFZ3yxBOkQYjq4lGDXo+jRWpY+EVzOmkgiGYahAEGrao7f3/SNtNWaEBFe6sstNDhCzi00wpM/EG4pQhPIYwqzK4QLZQShtNLAgxTwwYAnCTRbvZ5TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ovdPJImi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769510667;
	bh=8k1knDjmTySyw7ZGPkl+PripTkXl+ZQ0RVPekZtLf28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ovdPJImiDu34OGf0iZGBId/tNMCq2xrdk6D5or+cjMUx6afma9RK2n6bM/SvFBXyI
	 +N1/JWv2Nmf4Jl7IC6bOLcEmrKT5ssCBLVYvSBmY9ZlgIEuTFey/Be1+/Tx70KY2If
	 SdlFsAoUG1uBFeAEpu/0MyiUteaK0v4XVL2oaRguhlG4ZI/iWdbK9jgw3l0TejCnVz
	 up+otSBFooml21DrmPxnQkhx4JpC7QKLiRe9PAXVgHzfOCt3eM6lSgqcDBiMl3gYzL
	 YNEMDCaA3Q9P76QR1l3SqldotHEOpyDBRuiSzKMMHafD5lUZ21GxjlYliAKUK+z72V
	 BH7HxHkUcu3PA==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3120C17E0DB7;
	Tue, 27 Jan 2026 11:44:23 +0100 (CET)
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
Subject: [PATCH v1 2/7] drm/ci: move qualcomm baremetal jobs to lava
Date: Tue, 27 Jan 2026 16:13:57 +0530
Message-ID: <20260127104406.200505-3-vignesh.raman@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-90710-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[forked-move:email,force-edid:email,qualcomm.com:email,memptrs:email,collabora.com:email,collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,single-bo:email,ring:email,inject-4k:email,lease-uevent:email,master-drop-set-user:email]
X-Rspamd-Queue-Id: 18470931A0
X-Rspamd-Action: no action

Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
farm. So enable these jobs to use lava and update expectation
files.

Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/arm64.config               |  1 +
 drivers/gpu/drm/ci/test.yml                   | 62 ++++++-------------
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
 4 files changed, 27 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index fddfbd4d2493..b850b88787ad 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -83,6 +83,7 @@ CONFIG_SC_DISPCC_7180=y
 CONFIG_SC_GPUCC_7180=y
 CONFIG_SM_GPUCC_8350=y
 CONFIG_QCOM_SPMI_ADC5=y
+CONFIG_QCOM_SPMI_VADC=y
 CONFIG_DRM_PARADE_PS8640=y
 CONFIG_DRM_LONTIUM_LT9611UXC=y
 CONFIG_PHY_QCOM_USB_HS=y
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 754db71049f0..84153aa2ad68 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -67,31 +67,6 @@
     - testing:x86_64
     - igt:x86_64
 
-.baremetal-igt-arm64:
-  extends:
-    - .baremetal-test-arm64-gl
-    - .use-debian/baremetal_arm64_test-gl
-    - .allow_failure_lockdep
-  timeout: "1h30m"
-  rules:
-    - !reference [.scheduled_pipeline-rules, rules]
-    - !reference [.google-freedreno-farm-rules, rules]
-    - when: on_success
-  variables:
-    FDO_CI_CONCURRENT: 10
-    HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
-    S3_ARTIFACT_NAME: "arm64/kernel-files"
-    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/Image.gz
-    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
-    FARM: google
-  needs:
-    - debian/baremetal_arm64_test-gl
-    - job: testing:arm64
-      artifacts: false
-    - igt:arm64
-  tags:
-    - $RUNNER_TAG
-
 .software-driver:
   stage: software-driver
   extends:
@@ -149,34 +124,37 @@ msm:sc7180-trogdor-kingoftown:
 
 msm:apq8016:
   extends:
-    - .baremetal-igt-arm64
+    - .lava-igt:arm64
   stage: msm
+  parallel: 3
   variables:
-    DEVICE_TYPE: apq8016-sbc-usb-host
+    BOOT_METHOD: fastboot
+    DEVICE_TYPE: dragonboard-410c
     DRIVER_NAME: msm
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
+    DTB: apq8016-sbc-usb-host
+    FARM: collabora
     GPU_VERSION: apq8016
-    # disabling unused clocks congests with the MDSS runtime PM trying to
-    # disable those clocks and causes boot to fail.
-    # Reproducer: DRM_MSM=y, DRM_I2C_ADV7511=m
-    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
-    RUNNER_TAG: google-freedreno-db410c
-  script:
-    - ./install/bare-metal/fastboot.sh || exit $?
+    KERNEL_IMAGE_NAME: "Image.gz"
+    KERNEL_IMAGE_TYPE: ""
+    RUNNER_TAG: mesa-ci-x86-64-lava-dragonboard-410c
+    LAVA_FIRMWARE: qcom-lava
 
 msm:apq8096:
   extends:
-    - .baremetal-igt-arm64
+    - .lava-igt:arm64
   stage: msm
+  parallel: 3
   variables:
-    DEVICE_TYPE: apq8096-db820c
+    BOOT_METHOD: fastboot
+    DEVICE_TYPE: dragonboard-820c
     DRIVER_NAME: msm
-    BM_KERNEL_EXTRA_ARGS: maxcpus=2
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
+    DTB: apq8096-db820c
+    FARM: collabora
     GPU_VERSION: apq8096
-    RUNNER_TAG: google-freedreno-db820c
-  script:
-    - ./install/bare-metal/fastboot.sh || exit $?
+    KERNEL_IMAGE_NAME: "Image.gz"
+    KERNEL_IMAGE_TYPE: ""
+    RUNNER_TAG: mesa-ci-x86-64-lava-dragonboard-820c
+    LAVA_FIRMWARE: qcom-lava
 
 msm:sm8350-hdk:
   extends:
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 72c469021b66..4546363447ff 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -1,5 +1,9 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
 kms_lease@lease-uevent,Fail
+msm/msm_mapping@memptrs,Fail
 msm/msm_mapping@ring,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 2893f98a6b97..0d5cb2a87e67 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,2 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
 kms_lease@lease-uevent,Fail
+msm/msm_mapping@memptrs,Fail
-- 
2.47.3


