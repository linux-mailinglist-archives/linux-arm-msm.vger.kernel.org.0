Return-Path: <linux-arm-msm+bounces-101184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL7sMoiAzGn0TQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 04:18:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C85EF373C2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 04:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CFBF3044D14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 02:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB863233F4;
	Wed,  1 Apr 2026 02:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="jvh2HnAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A635D31A575
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 02:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009842; cv=none; b=EI2o+Apm5l2Ty3fzJrfFbHMbmkBpNSywzr4UzfK/hBDRYAY/mI1qkNiGCReLPdcPntuL5PcNy3+g94TxP678jSCszvYNl0tnIlmgr2YRQl20PTiV1z7TUnhvmtZGpe6oyFGLBQ/Osgi0LQq7kSS0GDfvPo/yTQSLFwuMVEoMdD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009842; c=relaxed/simple;
	bh=5bDEwsQ78ZBznFWaDDl9Hwa+dW7MA5sil64tFmJKV4w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZPbh0st5jmFuIZr6mfjCfCH73Dksmm3+OAmTgl+Ur5/qsI59trALgGEiRBMeSXBbgroZRuZ/h2MdY45G/ddyL0mByzzxdIQgZyVSR7GaZ4Wxh6Q1FqSAv9LEI/z9pCmxdFyjLEpC7JOyiidTcngrlCYiz+ZjDTfjbJkFQgAxCsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=jvh2HnAA; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775009831; x=1775269031;
	bh=swaiMdjjcSgBCqEa91t2bbQx5mik4+A0jfff30QRHjE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jvh2HnAA+TrrO010+wipNHKmf3KgcSAo5Vm3AYaiBK4mobQpn0aqS3ZJFPDPaBB7P
	 m2zcFVH5G2oNouUwi5/aEZH2BoWou52+QtfWuk3Hcj22asWB2PNTVMI8ON6XEvuKGL
	 N20Y4hDUYyMYjKQ9RmtWQfLuiAKqJg3rPu2lolTdVl+29qIi6FX2tzzG/HyKvJRbTb
	 g+9iPDkbGuE81GyANEhW8oXGJHhxor5kBwXb3l8dp/R4obzJQIJ9hhB+q9IvictAWx
	 K7fmJlP8MPvfhph2hd5qaQDP2eLPOahtmoreghuKjv893v3kCICz8hsFtdDLfBY2Da
	 SpAudeJ9/96pg==
Date: Wed, 01 Apr 2026 02:17:04 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/6] drm/msm/adreno: rename llc_mmio to cx_mmio
Message-ID: <20260331-adreno-810-v1-2-725801dbb12b@pm.me>
In-Reply-To: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ce7482096adcf8a9dee2bb08bee2177983f69004
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101184-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C85EF373C2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This region is used for more than just LLCC, it also provides access to
software fuse values (raytracing, etc).

Rename relevant symbols from _llc to _cx for use in a follow up change
that decouples this from LLCC.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  8 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 14 +++++++-------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  2 +-
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_gmu.c
index 916c5d99c4d1..e2f66ca0e319 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -947,7 +947,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsi=
gned int state)
=20
 =09/* Turn on TCM (Tightly Coupled Memory) retention */
 =09if (adreno_is_a7xx(adreno_gpu))
-=09=09a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL, 1);
+=09=09a6xx_cx_write(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL, 1);
 =09else if (!adreno_is_a8xx(adreno_gpu))
 =09=09gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
=20
@@ -1215,7 +1215,7 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx=
_gpu)
 =09=09if (!qcom_scm_is_available()) {
 =09=09=09dev_warn_once(gpu->dev->dev,
 =09=09=09=09"SCM is not available, poking fuse register\n");
-=09=09=09a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
+=09=09=09a6xx_cx_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
 =09=09=09=09A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
 =09=09=09=09A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
 =09=09=09=09A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
@@ -1236,7 +1236,7 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx=
_gpu)
 =09=09 * firmware, find out whether that's the case. The scm call
 =09=09 * above sets the fuse register.
 =09=09 */
-=09=09fuse_val =3D a6xx_llc_read(a6xx_gpu,
+=09=09fuse_val =3D a6xx_cx_read(a6xx_gpu,
 =09=09=09=09=09 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
 =09=09adreno_gpu->has_ray_tracing =3D
 =09=09=09!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
@@ -1299,7 +1299,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
=20
 =09/* Check to see if we are doing a cold or warm boot */
 =09if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
-=09=09status =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) =
=3D=3D 1 ?
+=09=09status =3D a6xx_cx_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) =3D=
=3D 1 ?
 =09=09=09GMU_WARM_BOOT : GMU_COLD_BOOT;
 =09} else if (gmu->legacy) {
 =09=09status =3D gmu_read(gmu, REG_A6XX_GMU_GENERAL_7) =3D=3D 1 ?
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_gpu.c
index e1eae6cb1e40..6ce14407007e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2039,7 +2039,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_g=
pu)
 =09struct msm_gpu *gpu =3D &adreno_gpu->base;
 =09u32 cntl1_regval =3D 0;
=20
-=09if (IS_ERR(a6xx_gpu->llc_mmio))
+=09if (IS_ERR(a6xx_gpu->cx_mmio))
 =09=09return;
=20
 =09if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
@@ -2078,14 +2078,14 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx=
_gpu)
 =09 * pagetables
 =09 */
 =09if (!a6xx_gpu->have_mmu500) {
-=09=09a6xx_llc_write(a6xx_gpu,
+=09=09a6xx_cx_write(a6xx_gpu,
 =09=09=09REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
=20
 =09=09/*
 =09=09 * Program cacheability overrides to not allocate cache
 =09=09 * lines on a write miss
 =09=09 */
-=09=09a6xx_llc_rmw(a6xx_gpu,
+=09=09a6xx_cx_rmw(a6xx_gpu,
 =09=09=09REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
 =09=09return;
 =09}
@@ -2098,7 +2098,7 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_g=
pu)
 =09struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
 =09struct msm_gpu *gpu =3D &adreno_gpu->base;
=20
-=09if (IS_ERR(a6xx_gpu->llc_mmio))
+=09if (IS_ERR(a6xx_gpu->cx_mmio))
 =09=09return;
=20
 =09if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
@@ -2151,15 +2151,15 @@ static void a6xx_llc_slices_init(struct platform_de=
vice *pdev,
 =09of_node_put(phandle);
=20
 =09if (is_a7xx || !a6xx_gpu->have_mmu500)
-=09=09a6xx_gpu->llc_mmio =3D msm_ioremap(pdev, "cx_mem");
+=09=09a6xx_gpu->cx_mmio =3D msm_ioremap(pdev, "cx_mem");
 =09else
-=09=09a6xx_gpu->llc_mmio =3D NULL;
+=09=09a6xx_gpu->cx_mmio =3D NULL;
=20
 =09a6xx_gpu->llc_slice =3D llcc_slice_getd(LLCC_GPU);
 =09a6xx_gpu->htw_llc_slice =3D llcc_slice_getd(LLCC_GPUHTW);
=20
 =09if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw=
_llc_slice))
-=09=09a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
+=09=09a6xx_gpu->cx_mmio =3D ERR_PTR(-EINVAL);
 }
=20
 #define GBIF_CLIENT_HALT_MASK=09=09BIT(0)
@@ -2560,7 +2560,7 @@ static int a6xx_read_speedbin(struct device *dev, str=
uct a6xx_gpu *a6xx_gpu,
 =09=09return ret;
=20
 =09if (info->quirks & ADRENO_QUIRK_SOFTFUSE) {
-=09=09*speedbin =3D a6xx_llc_read(a6xx_gpu, REG_A8XX_CX_MISC_SW_FUSE_FREQ_=
LIMIT_STATUS);
+=09=09*speedbin =3D a6xx_cx_read(a6xx_gpu, REG_A8XX_CX_MISC_SW_FUSE_FREQ_L=
IMIT_STATUS);
 =09=09*speedbin =3D A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS_FINALFREQLIMIT(=
*speedbin);
 =09=09return 0;
 =09}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/ad=
reno/a6xx_gpu.h
index eb431e5e00b1..e254d9711b30 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -102,7 +102,7 @@ struct a6xx_gpu {
=20
 =09bool has_whereami;
=20
-=09void __iomem *llc_mmio;
+=09void __iomem *cx_mmio;
 =09void *llc_slice;
 =09void *htw_llc_slice;
 =09bool have_mmu500;
@@ -240,19 +240,19 @@ static inline bool a6xx_has_gbif(struct adreno_gpu *g=
pu)
 =09return true;
 }
=20
-static inline void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 ma=
sk, u32 or)
+static inline void a6xx_cx_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mas=
k, u32 or)
 {
-=09return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
+=09return msm_rmw(a6xx_gpu->cx_mmio + (reg << 2), mask, or);
 }
=20
-static inline u32 a6xx_llc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
+static inline u32 a6xx_cx_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
 {
-=09return readl(a6xx_gpu->llc_mmio + (reg << 2));
+=09return readl(a6xx_gpu->cx_mmio + (reg << 2));
 }
=20
-static inline void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 =
value)
+static inline void a6xx_cx_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 v=
alue)
 {
-=09writel(value, a6xx_gpu->llc_mmio + (reg << 2));
+=09writel(value, a6xx_gpu->cx_mmio + (reg << 2));
 }
=20
 #define shadowptr(_a6xx_gpu, _ring) ((_a6xx_gpu)->shadow_iova + \
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a8xx_gpu.c
index 9e6f2ed69247..5af82d43f1e4 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -103,7 +103,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 =09=09return;
 =09}
=20
-=09slice_mask &=3D a6xx_llc_read(a6xx_gpu,
+=09slice_mask &=3D a6xx_cx_read(a6xx_gpu,
 =09=09=09REG_A8XX_CX_MISC_SLICE_ENABLE_FINAL);
=20
 =09a6xx_gpu->slice_mask =3D slice_mask;

--=20
2.53.0



