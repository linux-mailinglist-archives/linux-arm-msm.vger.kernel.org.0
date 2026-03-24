Return-Path: <linux-arm-msm+bounces-99642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHr2N7B+wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:08:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAB8307E66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BB4C31A2F68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172A03F0AB3;
	Tue, 24 Mar 2026 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TAuFaoJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E263F54DF;
	Tue, 24 Mar 2026 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352917; cv=none; b=o49CzskWgbw5uMrNEiqxgOp0EYGjkkQ5kTJuqnChte1QB2hWSfRKvU/3b6QsJxGz5e8TRJOH4hjgbMOLYreJs+CDfO8pHTX/D+5GlIEqo9c/U9bNvj7Uc70ltGLGqdRzp4MjS7yDWFuS0k1jDWdTEJxFc3NYVe8oljcpY432boQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352917; c=relaxed/simple;
	bh=mLm4IQklaR2CNzE4LbjmpJTUb6cmIq5AyTVgjPiZhVY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F6taptTeR+yJIDhFcskGSobKhoZMT2M/FxiFI4lEvAfxe/6vLm4B9mA56lqdueu+NJ94s6tCsPKm7jItZFOhPyOm64f/ST+l76wJGqn5+zCqGb65rlx6+ZNiVfVGg0ucSXR20eX/jb+UBD+IBAgCtVwgipUXAepn+ggh3HujDPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TAuFaoJX; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352913; x=1774612113;
	bh=mLm4IQklaR2CNzE4LbjmpJTUb6cmIq5AyTVgjPiZhVY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TAuFaoJXbFCt4FGG/aUXi3LdyncyEKNx/phaFiAhYwuzf2eYm9r4zDyoGzGvanKNJ
	 ynMgXkrVhwflE6LmqKGIOhPsavdTxEKiwmTlwbxSiFGdpxULPZ0VlMacHOc2/vrfd1
	 yK8j30nBaPbIaJ6sT+f6z2gzdYeP/OsfvhrMNVqpsmCD9GZQQdfQVYOF3addrl9eMY
	 CjLhIkaTsOI0haB2RidAVPKkp8v2MoIptDspJcqpTMzZqMOfzPaFFRDlpZozkItqvr
	 gBzZmsH6KbObx2eiL85OCk//ANvd9YJJXfKYotR36Xnv46vzdxHSPMpGJ8iXqitiA3
	 pcwEvrlbM68cA==
Date: Tue, 24 Mar 2026 11:48:27 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 3/5] drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
Message-ID: <20260324-dsi-rgb101010-support-v5-3-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e1618d4fd2b5b0dccb180c20d1ef6e4586249b10
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99642-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5CAB8307E66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MSM8998 DSI controller is v2.0.0 as stated in commit 7b8c9e203039
("drm/msm/dsi: Add support for MSM8998 DSI controller"). The value was
always correct just the name was wrong.

Rename and reorder to maintain version sorting.

Fixes: 7b8c9e203039 ("drm/msm/dsi: Add support for MSM8998 DSI controller")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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



