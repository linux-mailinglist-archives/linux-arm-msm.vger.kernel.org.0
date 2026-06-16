Return-Path: <linux-arm-msm+bounces-113394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4iGWIHQ7MWo+egUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:03:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882768F0F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:02:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=e15C4+7h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113394-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113394-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D49DF308E10E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5970543DA35;
	Tue, 16 Jun 2026 11:54:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF6B43D515;
	Tue, 16 Jun 2026 11:54:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610872; cv=none; b=P1SWGHDYmVUkk5EFRj9skmxMD4cYHZGDlLkSXp4IYfFk8rSLiNcZIhdOiO2L5JCvr3pbTxOARwW/aNnFJ7K7IBy0SuDEoNvj9x1diL9VN1TvLBNpbiIc/wyhsKAgn4DluWKIn6R2JM3wOZDpVQ0ii2zSpgUJDsZqsbh690mbdMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610872; c=relaxed/simple;
	bh=R2E9ORlyPEOJ/lZgRyZEX56Qk0VOHmnqRy9p9iHuGRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGTnEx32PiM7FQ880zAPwVEsaqjrRl2PwfFVuRXivk2J8aOHb0SzLF/VwfDUdNTw32kl1GAJaEq7DAfDKza2Qw05jed65+DRI3hEqnCqeeRQicC7239m/AcP/WT9tCIKxXadwXy//M2/nTQpOgDi7n6jmVOYjIKBV37cQP3ofOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=e15C4+7h; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781610869;
	bh=R2E9ORlyPEOJ/lZgRyZEX56Qk0VOHmnqRy9p9iHuGRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e15C4+7h31mzaktTEHd274GSHsauwsFVL7qGl33H8hpMUfZrfOnLlewx2Ner8xI5/
	 N6FaYKA7dHMh1vMJc+94M09SRwEh7RY0p3dC78txFiPszf1A1ktOke6FpfKCuB+zL+
	 2nT/Ou91ry4BG7fuCTJn2DHa0w3AdqsPz+zIWosXhEcKUYhv3Zl2lVmJK3l3BDKoAl
	 qk3iZA60WUEui+UMhAFE0L0oK0aM283WqR0LShGjHji4PLjmh/RsLSkPCUyMPOHx+G
	 Fehvd8Dksr8vFcODw6BO1pV5JkYkF0ArKexIuTvYe+fSpx5bf29in0qPRCXtxTaHK7
	 3T7zyVGJfRYsA==
Received: from vignesh-thinkpad.. (unknown [100.64.0.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EA3417E0C65;
	Tue, 16 Jun 2026 13:54:26 +0200 (CEST)
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
	valentine.burley@collabora.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/ci: Remove sc7180-trogdor-lazor-limozeen job
Date: Tue, 16 Jun 2026 17:24:04 +0530
Message-ID: <20260616115410.325837-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616115410.325837-1-vignesh.raman@collabora.com>
References: <20260616115410.325837-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113394-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:daniels@collabora.com,m:helen.fornazier@gmail.com,m:airlied@gmail.com,m:simona.vetter@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:robdclark@gmail.com,m:robin.clark@oss.qualcomm.com,m:valentine.burley@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,vger.kernel.org:from_smtp,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6882768F0F1

sc7180-trogdor-lazor-limozeen devices in the LAVA lab have been
experiencing stability issues, and 4 of the 6 devices have been
retired. So remove the corresponding job from CI.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v1:
  - Remove sc7180-trogdor-lazor-limozeen job
  - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221

---
 drivers/gpu/drm/ci/build.sh                   |  1 -
 drivers/gpu/drm/ci/test.yml                   | 10 -------
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 22 --------------
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt | 20 -------------
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt | 30 -------------------
 5 files changed, 83 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index d00d549cbd9c..fdaa26ad79d6 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -26,7 +26,6 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb"
-    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sm8350-hdk.dtb"
 elif [[ "$KERNEL_ARCH" = "arm" ]]; then
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index f6bee5b67931..3777189e9737 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -102,16 +102,6 @@
     KERNEL_IMAGE_TYPE: ""
     LAVA_FIRMWARE: qcom-lava
 
-msm:sc7180-trogdor-lazor-limozeen:
-  extends:
-    - .msm-sc7180
-  parallel: 4
-  variables:
-    DEVICE_TYPE: sc7180-trogdor-lazor-limozeen
-    DTB: sc7180-trogdor-lazor-limozeen-nots-r5
-    GPU_VERSION: ${DEVICE_TYPE}
-    RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-lazor-limozeen
-
 msm:sc7180-trogdor-kingoftown:
   extends:
     - .msm-sc7180
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
deleted file mode 100644
index 2daf4ab879a9..000000000000
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-core_setmaster@master-drop-set-user,Fail
-kms_color@ctm-0-25,Fail
-kms_color@ctm-0-50,Fail
-kms_color@ctm-0-75,Fail
-kms_color@ctm-blue-to-red,Fail
-kms_color@ctm-green-to-red,Fail
-kms_color@ctm-negative,Fail
-kms_color@ctm-red-to-blue,Fail
-kms_color@ctm-signed,Fail
-kms_color@gamma,Fail
-kms_color@legacy-gamma,Fail
-kms_cursor_legacy@cursor-vs-flip-toggle,Fail
-kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
-kms_flip@flip-vs-modeset-vs-hang,Fail
-kms_flip@flip-vs-panning-vs-hang,Fail
-kms_lease@lease-uevent,Fail
-kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_plane_alpha_blend@alpha-7efc,Fail
-kms_plane_alpha_blend@coverage-7efc,Fail
-kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
deleted file mode 100644
index cafc802cecea..000000000000
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
-# Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
-# Failure Rate: 50
-# IGT Version: 1.28-g0df7b9b97
-# Linux Version: 6.9.0-rc7
-msm/msm_mapping@shadow
-
-# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
-# Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
-# Failure Rate: 100
-# IGT Version: 1.28-gf13702b8e
-# Linux Version: 6.10.0-rc5
-kms_lease@page-flip-implicit-plane
-
-# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
-# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/74
-# Failure Rate: 20
-# IGT Version: 1.30-g04bedb923
-# Linux Version: 6.14.0-rc4
-kms_cursor_crc@cursor-random-128x128
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
deleted file mode 100644
index a9bb3e1ad75c..000000000000
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-# Suspend to RAM seems to be broken on this machine
-.*suspend.*
-
-# Skip driver specific tests
-^amdgpu.*
-nouveau_.*
-^panfrost.*
-^v3d.*
-^vc4.*
-^vmwgfx*
-
-# Skip intel specific tests
-gem_.*
-i915_.*
-tools_test.*
-kms_dp_link_training.*
-
-# Currently fails and causes coverage loss for other tests
-# since core_getversion also fails.
-core_hotunplug.*
-
-# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
-# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
-kms_display_modes@extended-mode-basic
-kms_display_modes@mst-extended-mode-negative
-
-# sc7180 does not have APRIV, so memptrs is not protected.
-# (Preemption is not supported on devices that do not have
-# APRIV, so this is ok)
-msm/msm_mapping@memptrs
-- 
2.47.3


