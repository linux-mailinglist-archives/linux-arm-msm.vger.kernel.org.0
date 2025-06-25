Return-Path: <linux-arm-msm+bounces-62460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00911AE8405
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D6907B1179
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F5D264F81;
	Wed, 25 Jun 2025 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7XcIFUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD4A2620CF;
	Wed, 25 Jun 2025 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857056; cv=none; b=pN3pdjSCJXDFlpwpmPOPF87JI/uGqJu4wRlhHeC36IBVr+I5EHEaxbLxSva1nb5cOyXmgTVTQ2wi6Qxpww9ugzwtfZ9EPwdqhRMvLBNjcorWZObnAXusfUZJmGlDY/1QhIsnv2ptN2CJMyzr4+LDfU8BbLfKT4Xyp7JhnXn8Qk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857056; c=relaxed/simple;
	bh=GH/kR3kom1SR2DzZhLQydzQqd3+Oq3MgLgPaayrkqBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSGjh+n3viG+uZ96o2SxbMsSh3HDoi6plFyTZQ13c4g/gL0msvUL4OqgfLlrsGnTCPyoS3x2iAHLDd/ye8M/Eos1Uv78t9b0dBCBgDNBBAxlrK+AgGuEAMFyDbPu4i7UXSTeXiE8pXvWb3XvEMWrdZEfIGH3a0OESJ1MT/Au8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7XcIFUU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446F3C4CEEA;
	Wed, 25 Jun 2025 13:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857055;
	bh=GH/kR3kom1SR2DzZhLQydzQqd3+Oq3MgLgPaayrkqBA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m7XcIFUUfxFZR6fjiPnl+1RmX1aV56Zzpv5ul3fAuXozz0t9QBSg/mZJFxHkKSDdR
	 lQ4eCa42lkVqwMjM8d7RRNCDCRdBbMxo1oJlLtVlatTB9bDq+dxv0JNi6WkYfjoXdA
	 izESKRQrA8Q4UQkXQfePOID10ErTAZjIz+eGCl/gWzcxBzkm4w0R/DGDPBu/Hmcxpw
	 H4nbybcNZTwJdP4rbrn1jHBiRVDLTPQxd2UVCpCCRTIHMmcRa7oaK/3bltxieqeczs
	 p3C74BNhNGHLgCFn5Y1b8mpP7OLvvL4AMLCAplL+evZoEQn+CoysKTlN1aMOKuHW6L
	 XaX69zFFWO1eA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:16 +0200
Subject: [PATCH v5 08/14] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-8-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=1212;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=j6D8eqPjFQVMYlE8pITPkljcLo0t+bJ0APdpU9FQnCs=;
 b=GrLRZDYs1oQtLzYIS9KzLvNYfA8Qr92qXDwq/nGQP7MoF71QKyN+f9wdjS5ujWq2Qq/Vxwjix
 wYSlIawBsIxDVtrYiHNZOAaUA/Npe9gC+GKbrm2hWzDfLf0yNw7cpS+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3d345844337608086ffec1998b47b315ada68a97..78782f94ee678e13baa6eb1a009a412e13557d59 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -686,12 +686,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;

-- 
2.50.0


