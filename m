Return-Path: <linux-arm-msm+bounces-105568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEc1Iiqx9WlYOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 10:09:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9424B16B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 10:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2A543034A39
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 08:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A277B672;
	Sat,  2 May 2026 08:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="GCY3RY4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747C22DECC6
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 May 2026 08:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777709306; cv=none; b=ONtkGYYnykesqBJzAv3Fz4pQ9cgChN7IASIEJvHArVGp/SdprLGVagvj/lPTPXXzAzlSwTjw/LlnV2j5yM25fYDVd4TFMe/c7azejQx8riQ4QF/k2Hw3fTERibdvRiwrciDzbLcdFbQmb028rtVJ/ngkLPACb1KeHxk8kPdl3d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777709306; c=relaxed/simple;
	bh=nzQObpAPrcSdYX6uto8esFDmyD5kapyt7sbl2q4PMSE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9DDokuXmxlbd0xoos/Ze+MmM4Q2TI1/2U+WbcNiCC6HtReS7GWIEzDiAtTKYLtnDhII6PLy+iZ86dBHnU7V16w95OxP9SCViLezoJCpL2+wGxPSzOtFB7OiN/lUk67CV7aDi+zMFg9A2uPCWlvLHaee3I3uWJ0yXGgCpAluTzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=GCY3RY4a; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1777709289; x=1777968489;
	bh=6Y9wyShBEbuRDWcowqrU45jNU6QCKVTF+X7+oewA8Vw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GCY3RY4awBuuIxplsCJyAB3drPuSypyoXxSkuj/jKQuiG6USoNkyPHxOMr+iIh5Eb
	 /Evpo2N+htNDhRclDALLgejr8ZGbUxRzHYeVISxZiq/QjAgt9XdkOLeSirYi6w9R9t
	 H7ItF9ZLkadWk7vsAUgDTlEsX76T8J42E0h0mKRHrTgq1lzEZG6JyTqicO7Bxgt4UI
	 JKfHAMnS31ZR9X4+cTONouQKPbN+Ebf94oC1zRn62fdig7LBmiuY5ZNO7Qhqqu3aYG
	 SfiKhAL+B2Zme1oGBQTMXl49qqJngfRU1x1wLwx6PSuVqGBuJmACkM6tWbM5HOW1qO
	 Y5Q/wHj8+whVg==
Date: Sat, 02 May 2026 08:08:00 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v5 3/7] drm/msm/adreno: rename llc_mmio to cx_misc_mmio
Message-ID: <20260502-adreno-810-v5-3-bc9fd2bb788d@pm.me>
In-Reply-To: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
References: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6af37f89b757360e96f96e0f71dd5a10fd47f744
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4B9424B16B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105568-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:email,pm.me:dkim,pm.me:mid,qualcomm.com:email]

This region is used for more than just LLCC, it also provides access to
software fuse values (raytracing, etc).

Rename relevant symbols from _llc to _cx_misc for use in a follow up
change that decouples this from LLCC.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  8 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 14 +++++++-------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  2 +-
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_gmu.c
index b7166a883b01..6a369682bb80 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -947,7 +947,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsi=
gned int state)
=20
 =09/* Turn on TCM (Tightly Coupled Memory) retention */
 =09if (adreno_is_a7xx(adreno_gpu))
-=09=09a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL, 1);
+=09=09a6xx_cx_misc_write(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL, 1);
 =09else if (!adreno_is_a8xx(adreno_gpu))
 =09=09gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
=20
@@ -1215,7 +1215,7 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx=
_gpu)
 =09=09if (!qcom_scm_is_available()) {
 =09=09=09dev_warn_once(gpu->dev->dev,
 =09=09=09=09"SCM is not available, poking fuse register\n");
-=09=09=09a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
+=09=09=09a6xx_cx_misc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
 =09=09=09=09A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
 =09=09=09=09A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
 =09=09=09=09A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
@@ -1236,7 +1236,7 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx=
_gpu)
 =09=09 * firmware, find out whether that's the case. The scm call
 =09=09 * above sets the fuse register.
 =09=09 */
-=09=09fuse_val =3D a6xx_llc_read(a6xx_gpu,
+=09=09fuse_val =3D a6xx_cx_misc_read(a6xx_gpu,
 =09=09=09=09=09 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
 =09=09adreno_gpu->has_ray_tracing =3D
 =09=09=09!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
@@ -1343,7 +1343,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
=20
 =09/* Check to see if we are doing a cold or warm boot */
 =09if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
-=09=09status =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) =
=3D=3D 1 ?
+=09=09status =3D a6xx_cx_misc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL=
) =3D=3D 1 ?
 =09=09=09GMU_WARM_BOOT : GMU_COLD_BOOT;
 =09} else if (gmu->legacy) {
 =09=09status =3D gmu_read(gmu, REG_A6XX_GMU_GENERAL_7) =3D=3D 1 ?
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_gpu.c
index d5aba072f44c..4275c1d726b2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2039,7 +2039,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_g=
pu)
 =09struct msm_gpu *gpu =3D &adreno_gpu->base;
 =09u32 cntl1_regval =3D 0;
=20
-=09if (IS_ERR(a6xx_gpu->llc_mmio))
+=09if (IS_ERR(a6xx_gpu->cx_misc_mmio))
 =09=09return;
=20
 =09if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
@@ -2078,14 +2078,14 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx=
_gpu)
 =09 * pagetables
 =09 */
 =09if (!a6xx_gpu->have_mmu500) {
-=09=09a6xx_llc_write(a6xx_gpu,
+=09=09a6xx_cx_misc_write(a6xx_gpu,
 =09=09=09REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
=20
 =09=09/*
 =09=09 * Program cacheability overrides to not allocate cache
 =09=09 * lines on a write miss
 =09=09 */
-=09=09a6xx_llc_rmw(a6xx_gpu,
+=09=09a6xx_cx_misc_rmw(a6xx_gpu,
 =09=09=09REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
 =09=09return;
 =09}
@@ -2098,7 +2098,7 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_g=
pu)
 =09struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
 =09struct msm_gpu *gpu =3D &adreno_gpu->base;
=20
-=09if (IS_ERR(a6xx_gpu->llc_mmio))
+=09if (IS_ERR(a6xx_gpu->cx_misc_mmio))
 =09=09return;
=20
 =09if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
@@ -2151,15 +2151,15 @@ static void a6xx_llc_slices_init(struct platform_de=
vice *pdev,
 =09of_node_put(phandle);
=20
 =09if (is_a7xx || !a6xx_gpu->have_mmu500)
-=09=09a6xx_gpu->llc_mmio =3D msm_ioremap(pdev, "cx_mem");
+=09=09a6xx_gpu->cx_misc_mmio =3D msm_ioremap(pdev, "cx_mem");
 =09else
-=09=09a6xx_gpu->llc_mmio =3D NULL;
+=09=09a6xx_gpu->cx_misc_mmio =3D NULL;
=20
 =09a6xx_gpu->llc_slice =3D llcc_slice_getd(LLCC_GPU);
 =09a6xx_gpu->htw_llc_slice =3D llcc_slice_getd(LLCC_GPUHTW);
=20
 =09if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw=
_llc_slice))
-=09=09a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
+=09=09a6xx_gpu->cx_misc_mmio =3D ERR_PTR(-EINVAL);
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
+=09=09*speedbin =3D a6xx_cx_misc_read(a6xx_gpu, REG_A8XX_CX_MISC_SW_FUSE_F=
REQ_LIMIT_STATUS);
 =09=09*speedbin =3D A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS_FINALFREQLIMIT(=
*speedbin);
 =09=09return 0;
 =09}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/ad=
reno/a6xx_gpu.h
index eb431e5e00b1..648608c1c98e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -102,7 +102,7 @@ struct a6xx_gpu {
=20
 =09bool has_whereami;
=20
-=09void __iomem *llc_mmio;
+=09void __iomem *cx_misc_mmio;
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
+static inline void a6xx_cx_misc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u3=
2 mask, u32 or)
 {
-=09return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
+=09return msm_rmw(a6xx_gpu->cx_misc_mmio + (reg << 2), mask, or);
 }
=20
-static inline u32 a6xx_llc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
+static inline u32 a6xx_cx_misc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
 {
-=09return readl(a6xx_gpu->llc_mmio + (reg << 2));
+=09return readl(a6xx_gpu->cx_misc_mmio + (reg << 2));
 }
=20
-static inline void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 =
value)
+static inline void a6xx_cx_misc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, =
u32 value)
 {
-=09writel(value, a6xx_gpu->llc_mmio + (reg << 2));
+=09writel(value, a6xx_gpu->cx_misc_mmio + (reg << 2));
 }
=20
 #define shadowptr(_a6xx_gpu, _ring) ((_a6xx_gpu)->shadow_iova + \
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a8xx_gpu.c
index 9b99ec5ceeb5..d519a29573a1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -104,7 +104,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 =09=09return;
 =09}
=20
-=09slice_mask &=3D a6xx_llc_read(a6xx_gpu,
+=09slice_mask &=3D a6xx_cx_misc_read(a6xx_gpu,
 =09=09=09REG_A8XX_CX_MISC_SLICE_ENABLE_FINAL);
=20
 =09a6xx_gpu->slice_mask =3D slice_mask;

--=20
2.53.0



