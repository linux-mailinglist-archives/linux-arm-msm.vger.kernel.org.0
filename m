Return-Path: <linux-arm-msm+bounces-57857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DFFAB6F47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 781827B101C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F001E1A3F;
	Wed, 14 May 2025 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehU7Q17n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704EA1CAA98;
	Wed, 14 May 2025 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235483; cv=none; b=W1kH3XLMBb8qhjUR/6xWgbvGUPerK9uVGy6XjeFe8zy0IULfrSB/WW/xBUli7EnwQnEvOd6xLO//zX4mCMPVZeA4SAHHswcfAU2mIyyJhOU4sAQDOp/8jMnUVTuO2ePBWunoTDHRwjOZp/fImAZGcsyn5mZSEgTamMsV43VrL1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235483; c=relaxed/simple;
	bh=FuU6k5Adlwy1+B7b57bvaytQ6sRhVZFNWGjHNcC2jgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUkJZn0/uE0FcDooD1d3uWqfsKe+Flj4dkl49Ek7Dvrg236GPtPdunqvsTEiR75dOOnHcuvNV0DKu3VScpfPUEYNufbPPSP7E1gK3gqZfTRI0MSFwvPPl+eWmiGJbxfrvrClJuebq0IIrwSArY6+YYq+ufK+GoYyKM9kJsbfxmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehU7Q17n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027C1C4CEE3;
	Wed, 14 May 2025 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235481;
	bh=FuU6k5Adlwy1+B7b57bvaytQ6sRhVZFNWGjHNcC2jgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ehU7Q17nIXINrK0YEIzDXQhAfxbtUsz3RZFZoRYNBKpq03enbwjit3zAR6DgsCfnQ
	 2HxfcpHrlPqMYW+3Uh+cIlvXaqdpxPTL7fFksVP1Lg7W4NZ7LishgoeEg474R4PYAf
	 7jWWKpjUJxpsdYgral68+vXdKqX8GcvWpfeAmaRi/Zz/kqr26wLQNRQ+H5GooMJkN7
	 vWkH8COsycMmtYw5WWUNt2hwrapevyfT9aCTLs3y7M7NccdHj1Rc069RKMV4qm1RSm
	 0nFMa9DxMmXFBljLqNLxrn7pKdZ4cG5MT4+BWXFOw6/J385aHUlh1T3N+D1/EdIY7q
	 P0K/19IV/8fmw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:27 +0200
Subject: [PATCH RFT v2 07/15] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=1096;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=OTb7pyJT4/w1gM/ve6hjlXPBv3Lngyv7JnLIisn/gtA=;
 b=WpAInuOrWGGVmZSkmvyAE/FOIFXBLxH1FkzjX6vOMtENm01f9miAc/a6nkH/x72aggF4XPvuf
 cmCxWnzyMKdAdGXEN0c2kprb01BcCO34TWAKP/y6CtJNppek9LrVIyn
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
index e7c89f9c7d89798699848743843eed6a58b94bd3..6af4e70c1b936a30c1934dd49f2889be13c9780d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -669,10 +669,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
 	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,

-- 
2.49.0


