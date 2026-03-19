Return-Path: <linux-arm-msm+bounces-98733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBScKvvku2njpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:58:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7D02CAC3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF36230340BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC5D3C943D;
	Thu, 19 Mar 2026 11:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="IKIt3sAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A953CD8D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921483; cv=none; b=gPGloD71S1bS76bEwAAPIQcvj87O1XKV3g0fQRUO2OjVujjGHm75QYlfPz0cJaPVGGk2MQ0ZhAYSTSCz11JDJOQ4ewEk/BBXvSuCQGV0vr2Z2MkXAIYd2P5fS8Us9vjqw8ej6WQg6jeB5OjBZzFfJJYF854BjGGIQORKz7vFXVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921483; c=relaxed/simple;
	bh=mEBBmmKkewV68WUhcRxlXKoX+eqcn8AWTduVHXPX4BA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTEisKN0xOeWyr7nCa+1yPR4dTln/O9ttz260oHOyYWGwvtc0FVmX5BVPZ5GPC7gTPJ06r1qnru/WCQsrNpJomVhqWJ/TDV2U0VDAzV+igDC2u/EjdyvEzUSaaEdsDaKJnV5ZLVT2rbVvWvcrqinGmrM9W57Hou6pc5uNP38IMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=IKIt3sAG; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773921473; x=1774180673;
	bh=mEBBmmKkewV68WUhcRxlXKoX+eqcn8AWTduVHXPX4BA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IKIt3sAGOeIxPaCMUocRU+SoP7Tx2/8Gy90HmLHwY77ezeexR36SxfYHixGsqX2tO
	 NA6suNR3LDNdRVz7vXnaAS8rYKE0cj4P+a7FXE3M9sbc1K5hBNOxKRTf00u0kh9FtH
	 VhBouK/lPLslmWCqS5c1ydNeMN9Pw28k9zmhBZ7IrJOr61yeHEQ6r8DFYArWu0GxTR
	 hZri0iMjdqDL7x1i6ETzLTq8wAWYSgM4tULTbGiJf5htR3Xx8Z942dUoRvDCiL5EEP
	 /vLGAilJhB6igsMqCuGvCWV1gGe7QfmhDBQNmygw46rcrmEJ12dBEdtEuKqyDKVMyS
	 1Vz13/mIRTArw==
Date: Thu, 19 Mar 2026 11:57:47 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 1/4] drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
Message-ID: <20260319-dsi-rgb101010-support-v3-1-85b99df2d090@pm.me>
In-Reply-To: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2976adefa00dd9004104e9d67642b07ae93d6130
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98733-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B7D02CAC3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MSM8998 DSI controller is v2.0.0 as stated in commit 7b8c9e203039
("drm/msm/dsi: Add support for MSM8998 DSI controller"). The value was
always correct just the name was wrong.

Rename and reorder to maintain version sorting.

Fixes: 7b8c9e203039 ("drm/msm/dsi: Add support for MSM8998 DSI controller")
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/ds=
i_cfg.c
index bd3c51c350e7..da3fe6824495 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -317,10 +317,10 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handl=
ers[] =3D {
 =09=09&msm8996_dsi_cfg, &msm_dsi_6g_host_ops},
 =09{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_4_2,
 =09=09&msm8976_dsi_cfg, &msm_dsi_6g_host_ops},
+=09{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_0_0,
+=09=09&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 =09{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_1_0,
 =09=09&sdm660_dsi_cfg, &msm_dsi_6g_v2_host_ops},
-=09{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_0,
-=09=09&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 =09{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
 =09=09&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 =09{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/ds=
i_cfg.h
index 5dc812028bd5..ccf06679608e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -19,8 +19,8 @@
 #define MSM_DSI_6G_VER_MINOR_V1_3_1=090x10030001
 #define MSM_DSI_6G_VER_MINOR_V1_4_1=090x10040001
 #define MSM_DSI_6G_VER_MINOR_V1_4_2=090x10040002
+#define MSM_DSI_6G_VER_MINOR_V2_0_0=090x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_1_0=090x20010000
-#define MSM_DSI_6G_VER_MINOR_V2_2_0=090x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1=090x20020001
 #define MSM_DSI_6G_VER_MINOR_V2_3_0=090x20030000
 #define MSM_DSI_6G_VER_MINOR_V2_3_1=090x20030001

--=20
2.53.0



