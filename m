Return-Path: <linux-arm-msm+bounces-98997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDZGFZdOvmntMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:53:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B57502E411F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C6B93031F22
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E02337B99;
	Sat, 21 Mar 2026 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="jB/Sy4aF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611BA3451CC;
	Sat, 21 Mar 2026 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079588; cv=none; b=CEPg51T0XmL/kXq39LYkRyVoQmR2gm/xV5/0qdwaf8Kz9osleatVSX6x2hlXAzxkHXiS6op3hW+iIs+Ps68jsZuKS6Wcl9uQpV0IFHqqxYKOMBjEZzrtGipepAmH6j7g7COiwKZz1dQSzfxFQxL/m67uhLwWfIb4CzADH8H51Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079588; c=relaxed/simple;
	bh=gDsFJ1TxNtBfjcx3CiIs7XjGfFNLGNadfmE04Ihg9l0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KB+5PDgOeGtJAzloFT/7ktBg6mnsueG9EDfe8bsYs4if98z+3XtH4Cl0U/q6bIcwgC7tvAJJN96+1hYRscO4TzAR55ih5VRpIVU6qW89fJlHY0p8VR8NEEOKQOaKeljFNfJ3FBdlrEYTh4buMpoK1mFSATiJScvaPtzBNO4GqYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=jB/Sy4aF; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774079571; x=1774338771;
	bh=GXIrZ2JeBYt7lvRrjXt7T5FwWusy32QKCFn/6PrHSYY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jB/Sy4aFU4bYROKDZO6trbv16jvGwLbuXAMSwKZvdgBKyG+jDhoKqIcvCX4vnWIPM
	 zdzANg6OAY201s7xjeU2ILkSpRhaI7PkTEy5slXkTPGN1hmvIieFEdjr5g5k0X/Zhb
	 ORElhunBjYRfiSSLVJn5xZbhNe5TM9FYhrai1mrdIlXw5NqLDm0PXydM43dz45Rs2n
	 bA8zVphKpaalPxNoemc/U5wL4wrJcS18Q7HHcsbIhdvBvDvAw8uVgHY2hXInVF8R6i
	 H/GutRBI5DVec8rxlAVi4yJztLacvy7mTtUvj573ud9cpALMSi/Y+0ocAbc73urT8Y
	 obCIZFCA5jRNA==
Date: Sat, 21 Mar 2026 07:52:47 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 4/5] drm/msm/dsi: add DSI version >= comparison helper
Message-ID: <20260321-dsi-rgb101010-support-v4-4-eb28ecebbfe8@pm.me>
In-Reply-To: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2b0c9cedaf796717b0cb0c1a53938aef4991d5a7
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
	TAGGED_FROM(0.00)[bounces-98997-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: B57502E411F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a helper for checking if the DSI hardware version is greater
than or equal to a given version, for use in a future change.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index db6da99375a1..b55ffe2fdec3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -782,13 +782,21 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm=
_host)
 =09dsi_write(msm_host, REG_DSI_CTRL, 0);
 }
=20
+static bool msm_dsi_host_version_geq(struct msm_dsi_host *msm_host,
+=09=09=09=09    u32 major, u32 minor)
+{
+=09return msm_host->cfg_hnd->major > major ||
+=09       (msm_host->cfg_hnd->major =3D=3D major &&
+=09       msm_host->cfg_hnd->minor >=3D minor);
+}
+
 bool msm_dsi_host_is_wide_bus_enabled(struct mipi_dsi_host *host)
 {
 =09struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
=20
 =09return msm_host->dsc &&
-=09=09(msm_host->cfg_hnd->major =3D=3D MSM_DSI_VER_MAJOR_6G &&
-=09=09 msm_host->cfg_hnd->minor >=3D MSM_DSI_6G_VER_MINOR_V2_5_0);
+=09=09msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
+=09=09=09=09=09MSM_DSI_6G_VER_MINOR_V2_5_0);
 }
=20
 static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,

--=20
2.53.0



