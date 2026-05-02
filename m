Return-Path: <linux-arm-msm+bounces-105570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOnkMw6x9WlYOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 10:08:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9A4B166B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 10:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE81330065D0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 08:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA7D2FE042;
	Sat,  2 May 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="jpGenxEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8691B2DB79E;
	Sat,  2 May 2026 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777709315; cv=none; b=PGdd5A38RTrBAGSDZn7sb2B9zKw9SWPHNXd4X13gWBlQ5QF/8ZjKRykI+AnSahisU1R/6GpXkUPglqcLnR6+49RQRbHvfc2Q25nesMxoskQX9cTxCjvQaPpI0Lf/2Ys+6dHU35GypfATkVJHFntiw1si8ObocvenDlzR9qDAxCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777709315; c=relaxed/simple;
	bh=wpiHLX1zWOUy8hBTDFwvSmMkzZNlxTZRLe+LwVa3mZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wsz2bl2wL0CoEnF5U7/ECzSvuceD70I/BYWbZrLjszJ5C9LO2D3ca0oULNGeZk61dZuW+ZPPr10JAw/Tfb4UfR6nkLmpjB2u+nX4g/GYqS/6My9OLVhYrtcOKxurZ6n1ZJ7haEgRqLDGMIsPDM5rbjkET5UPmnoA6eyiKUogqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=jpGenxEi; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1777709306; x=1777968506;
	bh=wpiHLX1zWOUy8hBTDFwvSmMkzZNlxTZRLe+LwVa3mZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jpGenxEis4n63OIjgN/3mDSUGmMOEXAEq0C608LWBH1muDPew1CR83mRCDahL/KgJ
	 BFPD2lvr3j7oBLCxrmshwTLqK3xOc+VavcJNooNeZ0S3Duu8MRdcPBxOtby2a6ijlU
	 4l35iKSlAfnnvSpbVk1+3ADw/KRLV9BctqigG90632xVPukQ/v5L84g9k+KcYdMnUL
	 jkiqRD3FYWVOxOk3L8sNsf527KFpX8ttAB7ayXnccFiEV1FiL/MWAZubS4AMXA0qu2
	 lXNf7PpYyA1k5mVFh23GuvJ4m4hbD5jBWfXLe2OG3LXltGKOBylLnnmyGhVdsjM3jf
	 4M2o1Z6JaFBHw==
Date: Sat, 02 May 2026 08:08:21 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v5 5/7] drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
Message-ID: <20260502-adreno-810-v5-5-bc9fd2bb788d@pm.me>
In-Reply-To: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
References: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 325815eec18b78703018c77bdfe495e0e3130c98
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8AD9A4B166B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105570-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

A8XX GPUs have two sets of protect registers: 64 global slots and 16
pipe specific slots. The last-span-unbound feature is only available
on pipe protect registers, and should always target pipe slot 15.

This matches the downstream driver which hardcodes pipe slot 15 for
all A8XX GPUs (GRAPHICS.LA.15.0.r1) and resolves protect errors on
A810.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a8xx_gpu.c
index d519a29573a1..74802f330ae9 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -265,8 +265,8 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 =09 * Last span feature is only supported on PIPE specific register.
 =09 * So update those here
 =09 */
-=09a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_m=
ax), final_cfg);
-=09a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_m=
ax), final_cfg);
+=09a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
+=09a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
=20
 =09a8xx_aperture_clear(gpu);
 }

--=20
2.53.0



