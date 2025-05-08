Return-Path: <linux-arm-msm+bounces-57316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8207AB026E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DA79B24027
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F072882DE;
	Thu,  8 May 2025 18:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRZtPlvK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6B32874E4;
	Thu,  8 May 2025 18:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728068; cv=none; b=frHa/LBEFEy4eN5CednVc5Iy+9phj/iNVNzZxORwfVYxixD5ROpBqz6U8TXz+gDT1FX0ZpIvkRU2G0i7oTHOj8FeuGkj2fjLaA33ZACC0PENmu8xqjVIfik/fN6zPFDdWHMMuRCuJPczrTcT0Pc/8RAZSd31FwihhKJoPnHKKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728068; c=relaxed/simple;
	bh=u1ZebpgympfjFZvjfVb9tg/JxIpOvXahhTcaVs0MINU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSB3tTwf41+Iw6gQYyFk73jWVlJlsb7iOX/V6VK0CNb9da3/LjPz1MjJ6LMuO35pV+WjnW2JBJfvQxsQMsgWPCu/NHGjT87UY7QTGnvGTZhg1ya4PN/BFT0qs71n5XzhCXFEEp0JMfJJarKe2UosCv7ISzvudSeE85wt4jNkoj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRZtPlvK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83948C4CEEE;
	Thu,  8 May 2025 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746728067;
	bh=u1ZebpgympfjFZvjfVb9tg/JxIpOvXahhTcaVs0MINU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VRZtPlvKPdC6WIMNAsK6bCz/mLWr0CuqGSH88JIpumi+nWKqX3/S+nj4dlDXeP7hP
	 dDanUZ2TPn05JY2CpkI1kTuEew5BDm6AvOvjPMmstpoccXYV7934tGlP/dht8Dw97D
	 Nq6KBECE2xEW77qsByIdFpahBSh5Zs7x8nSPg2T3eopqjrkoQPDp8uwrMg19+uMNGG
	 8/ZrNZXynqbk1YdlfEYSv8lo2IxOPU/hbh+aUaHsd47JNmdPkYYRlSMcTWVgrYlAqg
	 aMHxf5zJyhoSjABA3PlQnHs3s3e9/0iu62yaXQHojDxznE65OPBGkGTBQKDUgjWgL7
	 t/aiLjSTh98kg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:46 +0200
Subject: [PATCH RFT 14/14] drm/msm/a5xx: Use UBWC data from the common UBWC
 config struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-14-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=1816;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XnxaU3f47vZgMuLum+OH9TEi5T6gf69H/vEopBXcG1g=;
 b=nF5fxgbJlDwUvAwuyKD0AA2ANMcmgfwbA0I7uxVbogq7qOO9HQid8CBOtWj0FHvBprsyu4Aro
 s42z6Yphv2RC2LxSoC2UkPNZajzJldeRVjmdYZ1iN2LTyn2nAn1haFJ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Make use of the SSOT config database, this time including the HBB
which doesn't seem to change between configurations.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 1344d461c16dfa942b0b65d747eadca507116806..691393e958cf164b69e7fe1a9df313f813473a35 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1753,6 +1753,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct qcom_ubwc_cfg_data *common_cfg;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1789,15 +1790,12 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a5xx_preempt_init(gpu);
 
-	/* Set the highest bank bit */
-	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
-		adreno_gpu->ubwc_config->highest_bank_bit = 2;
-	else
-		adreno_gpu->ubwc_config->highest_bank_bit = 1;
+	/* Inherit the common config and make some necessary fixups */
+	common_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(common_cfg))
+		return ERR_PTR(-EINVAL);
 
-	/* a5xx only supports UBWC 1.0, these are not configurable */
-	adreno_gpu->ubwc_config->macrotile_mode = 0;
-	adreno_gpu->ubwc_config->ubwc_swizzle = 0x7;
+	*adreno_gpu->ubwc_config = *common_cfg;
 
 	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
 

-- 
2.49.0


