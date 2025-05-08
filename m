Return-Path: <linux-arm-msm+bounces-57315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C6AB026C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BE5116AE68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49B728A414;
	Thu,  8 May 2025 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/Ogt0UY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8972882D3;
	Thu,  8 May 2025 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728064; cv=none; b=sc+UYZAbUpDLptpbTVZIS5GefgWwhVuFGMUx5l+atg887bjh+tnoMtBNIA9ad6tMfFFI1a31wNlCCXOGnN7vZdo3tUiv4IFtKUj573l5xdzgXEmFCth1KUpPVFNeeNFj0LDLPxhQ5lw8LzX1k2xrGeru2dma+B9dmcuj02ijCUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728064; c=relaxed/simple;
	bh=WveUhGhrtwZKyhlbx/JZP0djDAE6iGTAASLA4GSoKq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHUVbi4zdMcaiMEirSUmsdsSVfIlKkRwii9S2zy/W+tHlkyxrJXmQQYJqMx+5wYH6xDpBIJ6UfwBn0vqb8BHlrUXnYYeOzWLdx+yWLlSTQLeXIPnVdwr89nWBSpJ/J0jYDN3QX9CklBuOPwQGQdAhLHOJBPS3iYmm8O1Rvxnt1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/Ogt0UY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE8BC4CEE7;
	Thu,  8 May 2025 18:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746728064;
	bh=WveUhGhrtwZKyhlbx/JZP0djDAE6iGTAASLA4GSoKq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U/Ogt0UYTJqIzcVw/WVZUAeiVfqxGS1MATU0J/eVEq/TqTq5hyBL4HBf7Stl8jODR
	 SY5Lja1jbjrEE62Yv6ehAPiTpVIMdLgK7BxTZcDPcvlOYPl2TA8AEMshHUgtXHSKXJ
	 NobecadE3GURQ+HIHLX+uAxmiVAJZ628WJJOeWsIpdHvW/JyuyrTsMgSaQpjvJ8IeZ
	 J8psJ694f4IpHPSResB0UrszkrAXPXgGbk4yRib4E86Iij4BXVbKEM6plceWTlqFrS
	 ntOII7N05k3rFgWVFp+K0yG/fQxT1Ff36m5de1Zen2K6x8+bZiIt5ZusAFMf9YDQIW
	 HwLEV466udvdw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:45 +0200
Subject: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=1329;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QjPo7mRzkyky2v7OT2NwqggCjsaxe9ZY2P7ES9pQ+Ms=;
 b=hUkxZsMFQYp0KMXnZx6JjiiaS+YsYNUHP+LK5nHiwQ10VsfZl5sc4/2xpLMYRqb98tLUW/0iw
 x9bNPa2dtEeAVDS3qmpnMVsy9xlR1Eok2iJEH5WmBJ1+7x3LvqSJMUX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

On A663 (SA8775P) the value matches exactly.

On A610, the value matches on SM6115, but is different on SM6125. That
turns out not to be a problem, as the bits that differ aren't even
interpreted.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 28ba0cddd7d222b0a287c7c3a111e123a73b1d39..d96f8cec854a36a77896d39b88c320c29c787edd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -597,13 +597,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	*cfg = *common_cfg;
 
-	cfg->ubwc_swizzle = 0x6;
 	cfg->highest_bank_bit = 2;
 
-	if (adreno_is_a610(gpu)) {
+	if (adreno_is_a610(gpu))
 		cfg->highest_bank_bit = 0;
-		cfg->ubwc_swizzle = 0x7;
-	}
 
 	if (adreno_is_a618(gpu))
 		cfg->highest_bank_bit = 1;
@@ -630,10 +627,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		cfg->highest_bank_bit = 3;
 	}
 
-	if (adreno_is_a663(gpu)) {
+	if (adreno_is_a663(gpu))
 		cfg->highest_bank_bit = 0;
-		cfg->ubwc_swizzle = 0x4;
-	}
 
 	if (adreno_is_7c3(gpu))
 		cfg->highest_bank_bit = 1;

-- 
2.49.0


