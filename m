Return-Path: <linux-arm-msm+bounces-110079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIhOD5wSGGrKbggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1AF5F0219
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34AA23118620
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AC33B4EA0;
	Thu, 28 May 2026 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DLr3gyKx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6471A3B2D17;
	Thu, 28 May 2026 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961776; cv=none; b=HjK3vcjD+mETwpklmgSpYcqs+bq5d/jiNBtZBl+/qt57xir5yZI4AiWM5J+gr65ui36G55M6vNcdL5vW+l0HOw3JxTQj+HNrwS3x4JuWvE2d/AGFtuWXyYNXJ2ER/sVKvVQgM7SEYCyFRcR6QF0kRTP0qGOjPWce7EubAi6MhSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961776; c=relaxed/simple;
	bh=MzuhaxepM5/KRPM7wBao0X2LSDQ3ffQ/74C94fXIQ8w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Scp2M60t4IDRyAObPv+N6keqn2iexh+bcsuR8A11a4IuHHYPFqNT2eWYzuITcX40rk8luIqNXU2l60WBANOuxy+qIsEe6d/ukPYcmKuMuDd82QynGOUtxr9VBlTlFW55R29vglf9SJrKOvKkm6Stj6IH9sH5OOYa2mH9zwlGdRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DLr3gyKx; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1779961764; x=1780220964;
	bh=pzmm1qBq9/agtzNc7qO0Y6QV4Q4byLeGlVb8xvZTcgk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DLr3gyKxSd4YGac9JG4ZDugDhb4e03MYTsDr1l0F08AhHumTaBW+S/d3CEogv5Oop
	 ykj9mCGlkmqzOTeFXnaiASjDnPzK16iYQzf7QiuOqk1IS8+glsijw82m5PtOy/BEfQ
	 S1a0rBvK+fpZEljvobOjud9ijDj2nbPujYWf8KbTRt+HbL9TbzfReJDusOGrYjg0BO
	 +YjFPeOPV1lJLrlFcf0gG3Z/LyLXjBoc6BCV3849lbHYODFCq9jNbymsh6RA8GlDVM
	 ryTYhPVHY1sNQQH/bwlocS5pSY01q/04DdSS/KsSKBYwPne+EwzxUUvitskqTADTjF
	 cW4BpTnVKX9bA==
Date: Thu, 28 May 2026 09:49:16 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 6/6] drm/msm/adreno: add Adreno 810 GPU support
Message-ID: <20260528-adreno-810-v7-6-7fe7fdd97fc2@pm.me>
In-Reply-To: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
References: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 968e0fa4248611ac9bff57573ec8890570a447e8
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	TAGGED_FROM(0.00)[bounces-110079-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[pm.me:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:mid,pm.me:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CE1AF5F0219
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add catalog entry and register configuration for the Adreno 810
found in Qualcomm SM7635 (Milos) based devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 298 ++++++++++++++++++++++++++=
++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
 2 files changed, 303 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_catalog.c
index 550ff3a9b82e..3e6f409d13a2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1799,6 +1799,261 @@ static const struct adreno_reglist_pipe x285_dyn_pw=
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
+=09/* Partially enable perf clear, Disable DINT to c/z be data forwarding =
*/
+=09{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
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
+=09{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
+=09{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
+=09{ REG_A6XX_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
+=09{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
+=09{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
+=09/* Disable write slow pointer in data phase queue */
+=09{ REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
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
+=09REG_A8XX_UCHE_CCHE_TRAP_BASE,
+=09REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
+=09REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
+=09REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
+=09REG_A8XX_UCHE_HW_DBG_CNTL,
+=09REG_A8XX_UCHE_WRITE_THRU_BASE,
+=09REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
+=09REG_A8XX_UCHE_TRAP_BASE,
+=09REG_A8XX_UCHE_TRAP_BASE + 1,
+=09REG_A8XX_UCHE_CLIENT_PF,
+=09REG_A8XX_RB_CMP_NC_MODE_CNTL,
+=09REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
+=09REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
+=09REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
+=09REG_A7XX_SP_READ_SEL,
+=09REG_A6XX_TPL1_NC_MODE_CNTL,
+=09REG_A6XX_TPL1_DBG_ECO_CNTL,
+=09REG_A6XX_TPL1_DBG_ECO_CNTL1,
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
+};
+DECLARE_ADRENO_REGLIST_LIST(a810_pwrup_reglist);
+
+static const u32 a810_ifpc_reglist_regs[] =3D {
+=09REG_A8XX_RBBM_NC_MODE_CNTL,
+=09REG_A8XX_RBBM_PERFCTR_CNTL,
+=09REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
+=09REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
+=09REG_A6XX_SP_NC_MODE_CNTL,
+=09REG_A7XX_SP_CHICKEN_BITS_2,
+=09REG_A7XX_SP_CHICKEN_BITS_3,
+=09REG_A6XX_SP_PERFCTR_SHADER_MASK,
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
+=09REG_A8XX_CP_PROTECT_GLOBAL(46),
+=09REG_A8XX_CP_PROTECT_GLOBAL(47),
+=09REG_A8XX_CP_PROTECT_GLOBAL(48),
+=09REG_A8XX_CP_PROTECT_GLOBAL(49),
+=09REG_A8XX_CP_PROTECT_GLOBAL(50),
+=09REG_A8XX_CP_PROTECT_GLOBAL(51),
+=09REG_A8XX_CP_PROTECT_GLOBAL(52),
+=09REG_A8XX_CP_PROTECT_GLOBAL(53),
+=09REG_A8XX_CP_PROTECT_GLOBAL(54),
+=09REG_A8XX_CP_PROTECT_GLOBAL(55),
+=09REG_A8XX_CP_PROTECT_GLOBAL(56),
+=09REG_A8XX_CP_PROTECT_GLOBAL(57),
+=09REG_A8XX_CP_PROTECT_GLOBAL(58),
+=09REG_A8XX_CP_PROTECT_GLOBAL(59),
+=09REG_A8XX_CP_PROTECT_GLOBAL(60),
+=09REG_A8XX_CP_PROTECT_GLOBAL(61),
+=09REG_A8XX_CP_PROTECT_GLOBAL(62),
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
+=09{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
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
@@ -2193,6 +2448,48 @@ static const struct adreno_info a8xx_gpus[] =3D {
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
+=09=09.speedbins =3D ADRENO_SPEEDBINS(
+=09=09=09{ 0,   0 },
+=09=09=09{ 242, 1 },
+=09=09=09{ 221, 2 },
+=09=09),
 =09}
 };
=20
@@ -2205,4 +2502,5 @@ static inline __always_unused void __build_asserts(vo=
id)
 =09BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
 =09BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
 =09BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
+=09BUILD_BUG_ON(a810_protect.count > a810_protect.count_max);
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/=
adreno/adreno_gpu.h
index ec643b84646b..d88eb8ecf417 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -592,6 +592,11 @@ static inline int adreno_is_a8xx(struct adreno_gpu *gp=
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



