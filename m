Return-Path: <linux-arm-msm+bounces-97669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKG9BsfgtGlutwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:15:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 832FD28B8A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9BC2300DCC0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 04:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02B7314A64;
	Sat, 14 Mar 2026 04:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gHtEW9mI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3463A1A4F2F
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 04:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773461699; cv=none; b=q+NlY9EvFvhaDgaZcvrfg3jAOafl7r1ML/28ltIAxM92RgRLDz5qeRGdwX9Ox79rSLeOWzQu02/xaNxmVHufLuPSanCOPGjUO+X6NkswRNlttug6+KV2WuSWD7p6456TojNav9XLa8EiYxKbd/flenblCRoKjHDYnNjKcU1wM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773461699; c=relaxed/simple;
	bh=QqEy2OdKuWkqnAs2xtgSeBFA2/O9zwNNVusCjEEVHhM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IjYwGWS52rTejm8EGiz84Hv5OMgMU9mNJlA5IcADPjwR3cUEIlFXoaKBro0mC88Igokb0JVsTRiZK90NFggWLK6syZ+TeLzoMbr+E+2CMIQReWjepiTvBXJwYSNBsDtCak0xbXwbzDjCvqmvjOaxfM8C7fkuoSA5jldhdrd7Bvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gHtEW9mI; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773461695; x=1773720895;
	bh=QqEy2OdKuWkqnAs2xtgSeBFA2/O9zwNNVusCjEEVHhM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gHtEW9mIcNo3e0lgqd0++G8AlXljR6E8kYSYhwaMXK8MqRwAor64vw8p7BfcZDQgl
	 N+cL/wRx9sVV0GRoWEi9TevFCHyg8+S5l4TvgUZzMW78ssjc0d2xqtehGR54IkKBm1
	 +Mndx9Rm7QcdQdFPof5rb2h/9080jgcgGZeWx/Pb1LUq1PJjteGS7w7p+FoLhtdbFt
	 x97HC+EcRkT/q5ovsvM4AzSuKNl4ofil/HrLNKT1lgMQmOSP1Lu9f4Dcq69LWhzNJX
	 Fx40k7Z0RMyVOy5bPuhVMotBxCWChJ9Az1DB0/9sOhwshwl+inHkFrBmKhX0Ljlpe+
	 x1MxYkjSvjVoA==
Date: Sat, 14 Mar 2026 04:14:50 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH] drm/msm: Fix GMEM_BASE for A650
Message-ID: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 617005a9c644ef59bbc086c9bc4f92729f6fbba4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97669-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 832FD28B8A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8") changed the
GMEM_BASE check from adreno_is_a650_family() & adreno_is_a740_family()
to family >=3D ADRENO_6XX_GEN4.

This inadvertently excluded A650 (ADRENO_6XX_GEN3), causing it to report
an incorrect GMEM_BASE which results in severe rendering corruption.

Update check to also include ADRENO_6XX_GEN3 to fix A650.

Fixes: dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8")
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/=
adreno/adreno_gpu.c
index d5fe6f6f0dec..0ac3fba5c277 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -376,7 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_co=
ntext *ctx,
 =09=09*value =3D adreno_gpu->info->gmem;
 =09=09return 0;
 =09case MSM_PARAM_GMEM_BASE:
-=09=09if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN4)
+=09=09if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN3)
 =09=09=09*value =3D 0;
 =09=09else
 =09=09=09*value =3D 0x100000;

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260314-fix-gmem-base-a650-cfd9bfcea425

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



