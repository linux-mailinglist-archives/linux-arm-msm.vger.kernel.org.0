Return-Path: <linux-arm-msm+bounces-62598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00635AE9986
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A6CF3B88A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBF02BF001;
	Thu, 26 Jun 2025 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfp4XZDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7808218AAA;
	Thu, 26 Jun 2025 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928594; cv=none; b=brmaENiSQpIeNBpPTjfcbBKXUhgBVX+7es4rnrllFBiY9LAsnd0MuaJtSAPU3RAdzUzVA0ua17BUCr8TZaXoyH8Y3cF53N52VmbcYfszXF0qsDW3f/POded4JlwN47uSDx+6m71Ir8A/5+DLQoHZFlBxpXUVfQnJd4+Kq1TETBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928594; c=relaxed/simple;
	bh=zWK4yH8Jg26Fl8a2FaolN3BwaKEb7Hpbt65+cv5xnTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGyI/JArsmK8q/KgkzY8Pcegm1jKJqZQKnWn08DKpiaojwvdfo7Kh5Xgdw2yX3LCj9r9b9Y2kukvjibI8u9nEwl/WPfQtgiteWJE89C01i3/hUdfrobSH7+J6MkpwzqYj8roBGW+t2CYOW1PxK8sntkf1+/gE3RPTiFpd6SbnVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfp4XZDA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5D9C4CEEB;
	Thu, 26 Jun 2025 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928593;
	bh=zWK4yH8Jg26Fl8a2FaolN3BwaKEb7Hpbt65+cv5xnTc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rfp4XZDAev4o3axcrxUBkVgKistInUOQ9qmFEzMNgIaRBI0XHIwFYuys4VA7URdr4
	 MQTIparVq+J34JpDHuAO8rIdVaAp7FiE+aWOY6zAKAMsfEPhNrgCdycj8htaMN0w8W
	 NOW4DVk1Uyi3iRKjXjMtx1wLggLKWVrZMEvnjJezkAb0FiLglaQVH/IlMkAshE1wgm
	 BlLxgUQfKSzKWsx3WgfcvKmYnDEKpymybsXyxPRhdVq8X0CUlryyJqdmojmX5XnlXj
	 nuw2PcjEZLl49CwoNOwf1stJe1OTuJeYgCUqws2BQfRu3whXI9iBjeeDD79WVxDLUn
	 CAc7wRWnqY4Sw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Jun 2025 11:02:34 +0200
Subject: [PATCH v6 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-topic-ubwc_central-v6-7-c94fa9d12040@oss.qualcomm.com>
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
In-Reply-To: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928557; l=2107;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=V2rm+g2MVUmgPyxRPmjf3RJZQ9C8iyiXb6HR5Sg+OmQ=;
 b=uCBPPWcA4blauT023rXssRzq5W+UDabZXJbX+SH5R5fChz9DxPAp/uTYFSC+oBPqyEwmGsLSW
 k89XoL+pgzaD2PNMdV+cBuHEQu7UsFLg2pB+5PLdp+o13mjTNO8VL0v
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This bit is set iff the UBWC version is 1.0. That notably does not
include QCM2290's "no UBWC".

This commit is intentionally cross-subsystem to ease review, as the
patchset is intended to be merged together, with a maintainer
consensus.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 include/linux/soc/qcom/ubwc.h         | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3d9c98e56d92ed43cf6e702fbd2b5cbd3293ac5a..3d345844337608086ffec1998b47b315ada68a97 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -686,11 +686,11 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
 	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index d65df559603d95e3db5bc04ce42e00a0b4785828..f0334f4ece2098ddf290eb182897cd8aa74608b3 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -62,4 +62,14 @@ static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 }
 #endif
 
+static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
+{
+	bool ret = cfg->ubwc_enc_version == UBWC_1_0;
+
+	if (ret && !(cfg->ubwc_swizzle & BIT(0)))
+		pr_err("UBWC config discrepancy - level 1 swizzling disabled on UBWC 1.0\n");
+
+	return ret;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.50.0


