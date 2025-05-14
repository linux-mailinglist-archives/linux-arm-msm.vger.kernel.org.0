Return-Path: <linux-arm-msm+bounces-57865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9148AB6F59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5EC61BA373D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EF6283FC3;
	Wed, 14 May 2025 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ne11gRYW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8E28368D;
	Wed, 14 May 2025 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235520; cv=none; b=RFkM6wpWyVLnG7Y20yZ18Ad2FXk7RXOip503/rD04N89TXoE6Iy+3YlEHTz3iGFRCVazKdYjJ0HG+bAR6TiXazj5IEvKlXjHt9hQhgOnC0RswjfHCNzK7Bt0X78iTiOrL/0Tv56ccDOlngsShCwPUjpa6qBdfwIdQSBS97unFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235520; c=relaxed/simple;
	bh=Hf3yeg1WG/z7INDo4b2QRGGuu17lQVYeFJrtiNhG/f4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=azyFBRYTuUqxlDo2mcNJZ2qH/KHRYviMe/xkYCztYYp1F7GZ6FPCEj3gJz/WC7ZEB+/TzU1cqwvr0RxpRkUDpp8kV3/WDgm3Xqll9IbquW0V3nyzXpLdG6GdoJtn2Kg3WVn5sgMasiWbQXsthEYv/im6REToHaWMXh2PnZC41ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ne11gRYW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7831CC4CEE3;
	Wed, 14 May 2025 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235520;
	bh=Hf3yeg1WG/z7INDo4b2QRGGuu17lQVYeFJrtiNhG/f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ne11gRYWj3lgEpcZrYSohDydfOYZvORQ1fzMRn23X7XgnG5NBJu5ZptVagwkDDdWB
	 77mnYKrnKHaO/0a7UIUGmw12f13ew0CjDDoOgdvdLoi0Zsz/armAGlQL02TKvHS4bX
	 qQtnX1PE5cJ8ahIAEPBwl0FF1I9J7EgZUMgMmxJ2Nvo6dVY0muBQYrdJXH/a8qzG4V
	 fVSsnfpEkoDSacxo2OUEAlSGPgc43vNl1txhBeTvO4eBgnbyY85bx3awQi0W520EpZ
	 K4ThhfSrDds0sCys1P8rOo/Ny3zyBJLVEx4iCX2mSiFnQ6QFwM2iLMppH5OSqNlrtn
	 4Q9syGAR98YxA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:35 +0200
Subject: [PATCH RFC RFT v2 15/15] drm/msm/a6xx: Warn if the
 highest_bank_bit value is overwritten
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=1451;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=NNwmHE/NXY7JNBB9ewjFIbDQ2ogaNlnpROm0GZClv6g=;
 b=c2HWY6JbvvY3r20QpOfuIVaoNxVaYPVeIJTkCQio4TyRUikHhSB6rqKK5+IfpP8nIUNZkkGbk
 03TnjpR85eqAiGlt0YgcL7Dc/g0lQUQA6bnpCfJUs4vsAjvI2pUmGSK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

In preparation to resolve the issue of hardcoding HBB, throw a warning
if the value is being overwritten in the GPU driver.

The HBB value is directly correlated with the memory configuration.
On platforms where more than one is supported, the value must differ
for proper functioning of the hardware, but it also must be consistent
across all UBWC producers/consumers.

On platforms supporting only a single DRAM setup, the value may still
be wrong, or at least inconsistent.

Print a warning to help catch such cases, until we declare full trust
to the central database.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index eaf468b67f97ff153e92a73a45581228fcf75e46..ab812338739568d5908ca439e5c53e230a02de5d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -637,6 +637,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a702(gpu))
 		cfg->highest_bank_bit = 14;
 
+	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
+		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
+			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
+
 	gpu->ubwc_config = &gpu->_ubwc_config;
 
 	return 0;

-- 
2.49.0


