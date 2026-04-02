Return-Path: <linux-arm-msm+bounces-101592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP16A933zmn7sAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 01:12:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D9938F0C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 01:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 795AE3036EE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 23:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136E33CBE6B;
	Thu,  2 Apr 2026 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DMf6o7FQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F503AA4F7;
	Thu,  2 Apr 2026 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775171400; cv=none; b=opafPHtzzwiLWfnn2+9jboXTSp7lkJhwwdhxXNddi/a+gf/RCVWmc2ASSLrXfqtEW5zOrf8V+Lb/3cVFE+uRSlH9DqVLguyka/LHNMC4aSdgpBKhXrooAlWmqYXjcw3vTPwBMbiuDOyYQ3rriA1ZtueUBtQfvp0qVaAzxg2JaP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775171400; c=relaxed/simple;
	bh=qfuyo/O9SoLf+oG3o6C5AnIyEiyv6CT/F6V4xhJj8CY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxeiV841NHM9VK5xXesmG9mip+FcroYI9WxmgTFUuJe/AIDeFqONuwPZqV/XDaqV0FR7oAdWJI1Vbbk5CzzpgLwOgRDF9l2nu2qr23qzZHvZwhhMsMkm7W5ivZS3u68Sj41kQg5pP94k3/wBxQtFpvvu7jUWN9tJdBtS3DURbX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DMf6o7FQ; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775171389; x=1775430589;
	bh=CxssBi27SgEg80FEf1y4c3zHy/WZQZGr14hNRDU+DvY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DMf6o7FQD8aU1gQ7yizv69nBbrJ/qtOE0xQ0pEMrniLZBH8o1SQegJ2SEX2MQ5SuK
	 mqfyIwzACbYJM7V9qe9pwymePGbJwVkQ9Z06NTME3eoK/ENHGlGoAyI8dkB69wJK/3
	 PSbY7rWfnpMlX3FIJZ76PIynq+NWDYoqBBQKDZr0d2dnVhNoXcQrjloHoiRBCknQZm
	 YYEal1ko7wLhijVZ0o2bmximcnPg++48PWY8WBfqXTnqD7LIuyXBDz//PeB2bObtQ+
	 CVGAJ7ZrlAImFCOGTPmZRuxULILgf/5RJUFLz5/nVoarEXtn/3VFMFxuYyUeHqBRNI
	 CPfQe+RU5GboA==
Date: Thu, 02 Apr 2026 23:09:42 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC v2 5/6] drm/msm/adreno: add Adreno 810 GPU support
Message-ID: <20260402-adreno-810-v2-5-ce337ca87a9e@pm.me>
In-Reply-To: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6eb37a9e19f96551c9bcafe17333a683448e8a51
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101592-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A8D9938F0C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add catalog entry and register configuration for the Adreno 810
found in Qualcomm SM7635 (Milos) based devices.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 271 ++++++++++++++++++++++++++=
++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
 2 files changed, 276 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_catalog.c
index 550ff3a9b82e..8a57e6f9cee0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1799,6 +1799,240 @@ static const struct adreno_reglist_pipe x285_dyn_pw=
rup_reglist_regs[] =3D {
 };
 DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
=20
+static const struct adreno_reglist_pipe a810_nonctxt_regs[] =3D {
+=09{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
+=09{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00f80800, BIT(PIPE_BV) | BIT(PIPE_BR) }=
,
+=09{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_B=
R) },
+=09{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) =
},
+=09{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV)=
 | BIT(PIPE_BR) },
+=09{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) },
+=09{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000023, BIT(PIPE_BV) }, /* Avoid part=
ial waves at VFD */
+=09{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) }=
,
+=09{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) }=
,
+=09{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) }=
,
+=09{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
+=09{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
+=09{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
+=09{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+=09{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+=09{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
+=09{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
+=09{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
+=09{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
+=09{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
+=09/*
+=09 * BIT(22): Disable PS out of order retire
+=09 * BIT(23): Enable half wave mode and MM instruction src&dst is half pr=
ecision
+=09 */
+=09{ REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) },
+=09{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
+=09{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
+=09{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
+=09{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
+=09{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
+=09{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000724, BIT(PIPE_NONE) },
+=09{ REG_A6XX_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
+=09{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
+=09{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
+=09{ REG_A8XX_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
+=09{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
+=09{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR)=
 },
+=09{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR)=
 },
+=09{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR)=
 },
+=09{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) }=
,
+=09{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
+=09{ REG_A8XX_VSC_BIN_SIZE, 0x00010001, BIT(PIPE_NONE) },
+=09{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
+=09{ },
+};
+
+static const u32 a810_protect_regs[] =3D {
+=09A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
+=09A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
+=09A6XX_PROTECT_NORDWR(0x00440, 0x001f),
+=09A6XX_PROTECT_RDONLY(0x00580, 0x005f),
+=09A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
+=09A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
+=09A6XX_PROTECT_RDONLY(0x00759, 0x0026),
+=09A6XX_PROTECT_RDONLY(0x00789, 0x0000),
+=09A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
+=09A6XX_PROTECT_NORDWR(0x00800, 0x0029),
+=09A6XX_PROTECT_NORDWR(0x00837, 0x00af),
+=09A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
+=09A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
+=09A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
+=09A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
+=09A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
+=09A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
+=09A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
+=09A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
+=09A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
+=09A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
+=09A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
+=09A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
+=09A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
+=09A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
+=09A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
+=09A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
+=09A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
+=09A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
+=09A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
+=09A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
+=09A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
+=09A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
+=09A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
+=09A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+=09A6XX_PROTECT_NORDWR(0x18400, 0x003f),
+=09A6XX_PROTECT_RDONLY(0x18440, 0x013f),
+=09A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
+=09A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
+=09A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
+=09A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
+=09A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
+=09A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
+=09A6XX_PROTECT_NORDWR(0x27800, 0x007f),
+=09A6XX_PROTECT_RDONLY(0x27880, 0x0381),
+=09A6XX_PROTECT_NORDWR(0x27882, 0x0001),
+=09/* CP_PROTECT_REG[46, 62] are left untouched! */
+=090, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+=09A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
+};
+DECLARE_ADRENO_PROTECT(a810_protect, 64);
+
+static const uint32_t a810_pwrup_reglist_regs[] =3D {
+=09REG_A6XX_UCHE_MODE_CNTL,
+=09REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
+=09REG_A8XX_UCHE_GBIF_GX_CONFIG,
+=09REG_A8XX_UCHE_CACHE_WAYS,
+=09REG_A8XX_UCHE_CCHE_MODE_CNTL,
+=09REG_A8XX_UCHE_CCHE_CACHE_WAYS,
+=09REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
+=09REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
+=09REG_A8XX_UCHE_WRITE_THRU_BASE,
+=09REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
+=09REG_A8XX_UCHE_TRAP_BASE,
+=09REG_A8XX_UCHE_TRAP_BASE + 1,
+=09REG_A8XX_UCHE_CLIENT_PF,
+=09REG_A8XX_VSC_BIN_SIZE,
+=09REG_A8XX_RB_CMP_NC_MODE_CNTL,
+=09REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
+=09REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
+=09REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
+=09REG_A7XX_SP_READ_SEL,
+};
+DECLARE_ADRENO_REGLIST_LIST(a810_pwrup_reglist);
+
+static const u32 a810_ifpc_reglist_regs[] =3D {
+=09REG_A8XX_RBBM_NC_MODE_CNTL,
+=09REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
+=09REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
+=09REG_A6XX_SP_NC_MODE_CNTL,
+=09REG_A7XX_SP_CHICKEN_BITS_2,
+=09REG_A7XX_SP_CHICKEN_BITS_3,
+=09REG_A6XX_SP_PERFCTR_SHADER_MASK,
+=09REG_A6XX_TPL1_NC_MODE_CNTL,
+=09REG_A6XX_TPL1_DBG_ECO_CNTL,
+=09REG_A6XX_TPL1_DBG_ECO_CNTL1,
+=09REG_A8XX_RBBM_PERFCTR_CNTL,
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
+=09REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
+=09REG_A8XX_CP_PROTECT_GLOBAL(0),
+=09REG_A8XX_CP_PROTECT_GLOBAL(1),
+=09REG_A8XX_CP_PROTECT_GLOBAL(2),
+=09REG_A8XX_CP_PROTECT_GLOBAL(3),
+=09REG_A8XX_CP_PROTECT_GLOBAL(4),
+=09REG_A8XX_CP_PROTECT_GLOBAL(5),
+=09REG_A8XX_CP_PROTECT_GLOBAL(6),
+=09REG_A8XX_CP_PROTECT_GLOBAL(7),
+=09REG_A8XX_CP_PROTECT_GLOBAL(8),
+=09REG_A8XX_CP_PROTECT_GLOBAL(9),
+=09REG_A8XX_CP_PROTECT_GLOBAL(10),
+=09REG_A8XX_CP_PROTECT_GLOBAL(11),
+=09REG_A8XX_CP_PROTECT_GLOBAL(12),
+=09REG_A8XX_CP_PROTECT_GLOBAL(13),
+=09REG_A8XX_CP_PROTECT_GLOBAL(14),
+=09REG_A8XX_CP_PROTECT_GLOBAL(15),
+=09REG_A8XX_CP_PROTECT_GLOBAL(16),
+=09REG_A8XX_CP_PROTECT_GLOBAL(17),
+=09REG_A8XX_CP_PROTECT_GLOBAL(18),
+=09REG_A8XX_CP_PROTECT_GLOBAL(19),
+=09REG_A8XX_CP_PROTECT_GLOBAL(20),
+=09REG_A8XX_CP_PROTECT_GLOBAL(21),
+=09REG_A8XX_CP_PROTECT_GLOBAL(22),
+=09REG_A8XX_CP_PROTECT_GLOBAL(23),
+=09REG_A8XX_CP_PROTECT_GLOBAL(24),
+=09REG_A8XX_CP_PROTECT_GLOBAL(25),
+=09REG_A8XX_CP_PROTECT_GLOBAL(26),
+=09REG_A8XX_CP_PROTECT_GLOBAL(27),
+=09REG_A8XX_CP_PROTECT_GLOBAL(28),
+=09REG_A8XX_CP_PROTECT_GLOBAL(29),
+=09REG_A8XX_CP_PROTECT_GLOBAL(30),
+=09REG_A8XX_CP_PROTECT_GLOBAL(31),
+=09REG_A8XX_CP_PROTECT_GLOBAL(32),
+=09REG_A8XX_CP_PROTECT_GLOBAL(33),
+=09REG_A8XX_CP_PROTECT_GLOBAL(34),
+=09REG_A8XX_CP_PROTECT_GLOBAL(35),
+=09REG_A8XX_CP_PROTECT_GLOBAL(36),
+=09REG_A8XX_CP_PROTECT_GLOBAL(37),
+=09REG_A8XX_CP_PROTECT_GLOBAL(38),
+=09REG_A8XX_CP_PROTECT_GLOBAL(39),
+=09REG_A8XX_CP_PROTECT_GLOBAL(40),
+=09REG_A8XX_CP_PROTECT_GLOBAL(41),
+=09REG_A8XX_CP_PROTECT_GLOBAL(42),
+=09REG_A8XX_CP_PROTECT_GLOBAL(43),
+=09REG_A8XX_CP_PROTECT_GLOBAL(44),
+=09REG_A8XX_CP_PROTECT_GLOBAL(45),
+=09REG_A8XX_CP_PROTECT_GLOBAL(63),
+};
+DECLARE_ADRENO_REGLIST_LIST(a810_ifpc_reglist);
+
+static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] =3D =
{
+=09{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+=09{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+=09{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
+=09{ REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+=09{ REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+=09{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
+=09{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
+=09{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
+=09{ REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIPE_BR) =
},
+=09{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+=09{ REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+=09{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BR) | BIT(PI=
PE_BV) },
+=09{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+=09{ REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+};
+DECLARE_ADRENO_REGLIST_PIPE_LIST(a810_dyn_pwrup_reglist);
+
 static const struct adreno_reglist_pipe a840_nonctxt_regs[] =3D {
 =09{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
 =09{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) }=
,
@@ -2193,6 +2427,43 @@ static const struct adreno_info a8xx_gpus[] =3D {
 =09=09=09{ 252, 2 },
 =09=09=09{ 221, 3 },
 =09=09),
+=09}, {
+=09=09.chip_ids =3D ADRENO_CHIP_IDS(0x44010000),
+=09=09.family =3D ADRENO_8XX_GEN1,
+=09=09.fw =3D {
+=09=09=09[ADRENO_FW_SQE] =3D "gen80300_sqe.fw",
+=09=09=09[ADRENO_FW_GMU] =3D "gen80300_gmu.bin",
+=09=09},
+=09=09.gmem =3D SZ_512K + SZ_64K,
+=09=09.inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
+=09=09.quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
+=09=09=09  ADRENO_QUIRK_HAS_HW_APRIV |
+=09=09=09  ADRENO_QUIRK_PREEMPTION |
+=09=09=09  ADRENO_QUIRK_IFPC,
+=09=09.funcs =3D &a8xx_gpu_funcs,
+=09=09.zapfw =3D "gen80300_zap.mbn",
+=09=09.a6xx =3D &(const struct a6xx_info) {
+=09=09=09.protect =3D &a810_protect,
+=09=09=09.nonctxt_reglist =3D a810_nonctxt_regs,
+=09=09=09.pwrup_reglist =3D &a810_pwrup_reglist,
+=09=09=09.dyn_pwrup_reglist =3D &a810_dyn_pwrup_reglist,
+=09=09=09.ifpc_reglist =3D &a810_ifpc_reglist,
+=09=09=09.gbif_cx =3D a840_gbif,
+=09=09=09.max_slices =3D 1,
+=09=09=09.gmu_chipid =3D 0x8030000,
+=09=09=09.bcms =3D (const struct a6xx_bcm[]) {
+=09=09=09=09{ .name =3D "SH0", .buswidth =3D 16 },
+=09=09=09=09{ .name =3D "MC0", .buswidth =3D 4 },
+=09=09=09=09{
+=09=09=09=09=09.name =3D "ACV",
+=09=09=09=09=09.fixed =3D true,
+=09=09=09=09=09.perfmode =3D BIT(2),
+=09=09=09=09=09.perfmode_bw =3D 10687500,
+=09=09=09=09},
+=09=09=09=09{ /* sentinel */ },
+=09=09=09},
+=09=09},
+=09=09.preempt_record_size =3D 4558 * SZ_1K,
 =09}
 };
=20
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/=
adreno/adreno_gpu.h
index c0ee544ce257..d474d88b9152 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -596,6 +596,11 @@ static inline int adreno_is_a8xx(struct adreno_gpu *gp=
u)
 =09return gpu->info->family >=3D ADRENO_8XX_GEN1;
 }
=20
+static inline int adreno_is_a810(struct adreno_gpu *gpu)
+{
+=09return gpu->info->chip_ids[0] =3D=3D 0x44010000;
+}
+
 static inline int adreno_is_x285(struct adreno_gpu *gpu)
 {
 =09return gpu->info->chip_ids[0] =3D=3D 0x44070001;

--=20
2.53.0



