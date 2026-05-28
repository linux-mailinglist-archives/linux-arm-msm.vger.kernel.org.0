Return-Path: <linux-arm-msm+bounces-110078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN5WHOIPGGrmbQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:50:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0B5EFF29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CADC7307855D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25EF3B5847;
	Thu, 28 May 2026 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="o4z7Ys61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F63B4EAB;
	Thu, 28 May 2026 09:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961759; cv=none; b=SKIpFuNH+KxUeUI3xLbIIYB3PNSdh5l+ZsOQOdqiYeNhjVOS+q8VQN0mefb4Yx6TktNHFXP3m5Z2F7tzGdJ2XEzZyacM0gqJ0zqd3Dg5D1MKBEm42WnY6wrYIVfaePWA59kDhF93RilYy0RlIph11H25MJ0zLWqluSsMIHib66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961759; c=relaxed/simple;
	bh=4GIvf6g25dTeIEkU4yrk2b1GS2dt1d/k+38Dt9gY7H8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFrrXpUXwLQ5FDQSvi6rpBvI3fS/FhulFoaF5HtjhBqoQ+Uwr33BDt8QQwnuIluP5jKtYpkkgQyDKrv3c0Jr/ea1Yhrrh6f0Bg3L9/YXlTBDEy5GIXrrY/60xzsWeIgvhoweYV81en2lerDodTuOl0aUBpwb1jQaCR6qp+kt1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=o4z7Ys61; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1779961750; x=1780220950;
	bh=4GIvf6g25dTeIEkU4yrk2b1GS2dt1d/k+38Dt9gY7H8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=o4z7Ys61t3P+B+ziURs+oZdCqJ4NtuId2lEVKgGvPlqkX0T4aeBbhSBVA3RbJ4m/h
	 jPU4Zv50P0UYRGRrSW8BX2etngPWd462ZtBjw/DDtb46ZcIVf3lCgu40JNm8lsCZs+
	 T1hbhkZ2g6osNDyCioaFXzXGOwqVJNh+4fmguurUBzSt3xvL6LVtwnO7dJIchzYyOP
	 Rubjm3O+bR3ZCwI6cpogE5m0RctzBEayoBSaub79Ca8THVo/R0EJP/I6bDH1SJ011P
	 Gftettr+0/xfwd3lDk0cOCFXIZu2O8TYgoUMZxfi5Z+k8J5XBTe00LiAYnvt8U8p0n
	 i8ju91tm4GXqA==
Date: Thu, 28 May 2026 09:48:57 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 4/6] drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
Message-ID: <20260528-adreno-810-v7-4-7fe7fdd97fc2@pm.me>
In-Reply-To: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
References: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fc7329e3a68a6e39061236e0de59472a1ac92049
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110078-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:mid,pm.me:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0DE0B5EFF29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Platforms without a LLCC (e.g. milos) still need to be able to read and
write to the cx_mem region. Previously if LLCC slices were unavailable
the cx_misc_mmio mapping was overwritten with ERR_PTR, causing a crash
when the GMU later accessed cx_mem.

Move the cx_misc_mmio mapping out of a6xx_llc_slices_init() into
a6xx_gpu_init() so that cx_mem mapping is independent of LLCC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 ++++++++++++++++---------------=
----
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_gpu.c
index d7f446e92098..ac9597baeb44 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2038,7 +2038,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_g=
pu)
 =09struct msm_gpu *gpu =3D &adreno_gpu->base;
 =09u32 cntl1_regval =3D 0;
=20
-=09if (IS_ERR(a6xx_gpu->cx_misc_mmio))
+=09if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw=
_llc_slice))
 =09=09return;
=20
 =09if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
@@ -2097,7 +2097,7 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_g=
pu)
 =09struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
 =09struct msm_gpu *gpu =3D &adreno_gpu->base;
=20
-=09if (IS_ERR(a6xx_gpu->cx_misc_mmio))
+=09if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw=
_llc_slice))
 =09=09return;
=20
 =09if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
@@ -2134,31 +2134,12 @@ static void a6xx_llc_slices_destroy(struct a6xx_gpu=
 *a6xx_gpu)
 static void a6xx_llc_slices_init(struct platform_device *pdev,
 =09=09struct a6xx_gpu *a6xx_gpu, bool is_a7xx)
 {
-=09struct device_node *phandle;
-
 =09/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
 =09if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
 =09=09return;
=20
-=09/*
-=09 * There is a different programming path for A6xx targets with an
-=09 * mmu500 attached, so detect if that is the case
-=09 */
-=09phandle =3D of_parse_phandle(pdev->dev.of_node, "iommus", 0);
-=09a6xx_gpu->have_mmu500 =3D (phandle &&
-=09=09of_device_is_compatible(phandle, "arm,mmu-500"));
-=09of_node_put(phandle);
-
-=09if (is_a7xx || !a6xx_gpu->have_mmu500)
-=09=09a6xx_gpu->cx_misc_mmio =3D msm_ioremap(pdev, "cx_mem");
-=09else
-=09=09a6xx_gpu->cx_misc_mmio =3D NULL;
-
 =09a6xx_gpu->llc_slice =3D llcc_slice_getd(LLCC_GPU);
 =09a6xx_gpu->htw_llc_slice =3D llcc_slice_getd(LLCC_GPUHTW);
-
-=09if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw=
_llc_slice))
-=09=09a6xx_gpu->cx_misc_mmio =3D ERR_PTR(-EINVAL);
 }
=20
 #define GBIF_CLIENT_HALT_MASK=09=09BIT(0)
@@ -2756,6 +2737,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_devic=
e *dev)
 =09struct platform_device *pdev =3D priv->gpu_pdev;
 =09struct adreno_platform_config *config =3D pdev->dev.platform_data;
 =09const struct adreno_info *info =3D config->info;
+=09struct device_node *phandle;
 =09struct a6xx_gpu *a6xx_gpu;
 =09struct adreno_gpu *adreno_gpu;
 =09struct msm_gpu *gpu;
@@ -2806,6 +2788,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_devi=
ce *dev)
=20
 =09a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
=20
+=09/*
+=09 * There is a different programming path for A6xx targets with an
+=09 * mmu500 attached, so detect if that is the case
+=09 */
+=09phandle =3D of_parse_phandle(pdev->dev.of_node, "iommus", 0);
+=09a6xx_gpu->have_mmu500 =3D (phandle &&
+=09=09of_device_is_compatible(phandle, "arm,mmu-500"));
+=09of_node_put(phandle);
+
+=09if (is_a7xx || !a6xx_gpu->have_mmu500)
+=09=09a6xx_gpu->cx_misc_mmio =3D msm_ioremap(pdev, "cx_mem");
+=09else
+=09=09a6xx_gpu->cx_misc_mmio =3D NULL;
+
 =09ret =3D a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info);
 =09if (ret) {
 =09=09a6xx_llc_slices_destroy(a6xx_gpu);

--=20
2.53.0



