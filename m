Return-Path: <linux-arm-msm+bounces-57309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E10EAB025D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C1E77AFAF3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6D528852C;
	Thu,  8 May 2025 18:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4ToPFz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CB2287505;
	Thu,  8 May 2025 18:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728038; cv=none; b=WYC3yDVJozcJ/vOA8epHoglBg70E2tpVG1Czk/dno3845ZztbBKFZ53+YUFUlaNdILPEPjT7DG0/ICnvj2KVVo9a46d578H18Nmk4cpEFxLnCj31/rFaNMi+iJc/xCuaBxAEQK5zcfbVMhjN1G1VCVchVJ19RIOnUJ5NPn6NMxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728038; c=relaxed/simple;
	bh=mSJUEvv80r8+KtnSJMAeUi1qshbBWDIsutostsXF7fQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DFgkZMBQfLSXCTrd8yL8aaotyUwAgKkMhVCpf+vjHXH7m/FSIrH5QTxKx2V/TtWIdwGw37lRhdBwwO8G8y8tg59ccHJX58pnQLbckOK8f9Syjm6Y2NEqAiqDRRRPRX6R2QQ24JnhTaUNsXN5TftUHuCJ5XSXAHSCNbUg8EdbGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4ToPFz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9774CC4CEE7;
	Thu,  8 May 2025 18:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746728038;
	bh=mSJUEvv80r8+KtnSJMAeUi1qshbBWDIsutostsXF7fQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i4ToPFz887Ydu+YQWzhBPo5Y3Ygr1jeZWdWxb/g7WfmhCnNNf6T4eeaz/nyNorphl
	 28PgfdkmDop4tzXAQqbPdB+24pKjzm8uk9LC9sAQihjm46DU01dVlzZ5f2+cP7wq69
	 WRbl9B/W9bHz8REP/eZk0TOxtuxPECh/AiX7eE7EhRxxcH8JByEqjQJ3Shz5o377K1
	 m94GZSxQrpUtQosx8B95xLIIHGl/kwzl6COetZJP0QpOx9PXpfZUQMNpeQh2tn407d
	 TRcvClc/2MNq60YxR6bRbxm0JE1gpQt8Eq1LR43RMbwbi0BUJ1Q5T82gZrHzySM7Gf
	 oReDeEexwu4lg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:39 +0200
Subject: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=1198;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bdgZ+VQB/YhdQ2w9c/AGBkHp8bkhxZzalQyXbZHtSwk=;
 b=EvO5UGTWwUDaDxdjLGITE3vWhuZs7b8zM2G1C2DJEGe/pbry2U/RNnCvQxcM4a2qYtRqrSZOo
 lhl/5ozK4GvA3f5npJs12hyYk7iMqMdW72j3h6oZGuIReZNVoYSxNb3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This bit is set iff the UBWC version is 1.0. That notably does not
include QCM2290's "no UBWC".

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e1eab0906b6c460528da82a94a285ef181e0b479..d47726ea8818a9660eadd52d97dde1489a884684 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -663,10 +663,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit;
+	bool ubwc_mode = cfg->ubwc_enc_version == UBWC_1_0;
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
 	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,

-- 
2.49.0


