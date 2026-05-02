Return-Path: <linux-arm-msm+bounces-105569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGYcFgqx9WldOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 10:08:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB894B1653
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 10:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9EC03005AAF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 08:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A0030BF5C;
	Sat,  2 May 2026 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="eicwn7Kp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A91421771B
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 May 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777709307; cv=none; b=RTyDadTNnwri/Lwe7ndrfrR0aGRNqd53daovE/kqOsDcBmibzOP6BVHc3OeW9oellNt09wuLziA3anyBOhrmr3a0p/hkfFGWMyfGBLfF4JKlMbJIU7QVHqUg+dOpu7u8uLnR9EzgfpPZQkuOOHtuJYkqjIXZdLthVBfRFMNXRwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777709307; c=relaxed/simple;
	bh=Tpnj9uF4ZKfxDszPrsQeXalLh7hFaXn6bvO+xHvviac=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEXW2xSdGg+tOwbkz9m4d/RwnMgLpcSICvSWz08y/QDgJ7lWv4MW29BD62UAHKG+VfEmYf5b/35h6wCGFNBgDZcgt8WrK0Gb6YNr3Oa7/y4j9zoiGaUx7oixLSmAWuPBAe3Ax0EyJzy2o1iXxZLpNYEqNx+a+VTWNDdP5M4oYHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=eicwn7Kp; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1777709296; x=1777968496;
	bh=Tpnj9uF4ZKfxDszPrsQeXalLh7hFaXn6bvO+xHvviac=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eicwn7KpIcjDvaWGmyHdZh/T+OSqUXXz86JQe7BK3b14LQ0kqCTD/Ka/mfEuePEa7
	 4cdT7OaBi9PJCDSVSfNVlXpB2HDFs3S3gx+8ELdb+EhYQ9g5SXlksW/FxzIODhcqr9
	 0yW9D7Focwb3hozSj8SxV+Pob5sg9wjG6n+L0Xt4Ext42hahTLViT2GtGp4AxDlt8N
	 ZW16S86b7oPbCKIfHAbwStUd583H4X8eDcrk7LCQEjdCZfnCIqPf5VIomZ+l4nSgVm
	 zdpC/0PD4RHQVBCkyN+WSV7Hia2g7kxcduFjAeXs9hcGLd7TkYHCH8AiGAs0QluqUy
	 IH8Y5FFYPa6nA==
Date: Sat, 02 May 2026 08:08:10 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v5 4/7] drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
Message-ID: <20260502-adreno-810-v5-4-bc9fd2bb788d@pm.me>
In-Reply-To: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
References: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 673075b6d09d9db46c0d208d632b57cdd50ad164
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EEB894B1653
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105569-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,pm.me:email,pm.me:dkim,pm.me:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

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
index 4275c1d726b2..533272e11111 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2039,7 +2039,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_g=
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
@@ -2098,7 +2098,7 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_g=
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
@@ -2135,31 +2135,12 @@ static void a6xx_llc_slices_destroy(struct a6xx_gpu=
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
@@ -2621,6 +2602,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_devic=
e *dev)
 =09struct platform_device *pdev =3D priv->gpu_pdev;
 =09struct adreno_platform_config *config =3D pdev->dev.platform_data;
 =09const struct adreno_info *info =3D config->info;
+=09struct device_node *phandle;
 =09struct device_node *node;
 =09struct a6xx_gpu *a6xx_gpu;
 =09struct adreno_gpu *adreno_gpu;
@@ -2657,6 +2639,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_devi=
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



