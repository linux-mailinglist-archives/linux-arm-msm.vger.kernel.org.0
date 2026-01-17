Return-Path: <linux-arm-msm+bounces-89495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5AED38CEF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 07:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96C65303F0E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 06:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DDB328B4D;
	Sat, 17 Jan 2026 06:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLcE31w2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcHSWqeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5463093B2
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768631768; cv=none; b=g5FQWP5Fx3wwgG6aGG7bgpXQci2yK6k5Y/4/lrLlb0dlaIupYNpNuaes34///tEdApAEW/ce06HBD3+ajQsZmAqfNQrshVikkObpV53l7445OLNZnxK1tRybrhrtUDhtFHBodAV85+rWhS+SH8JNwkGu86pbpHl/d60KrJRpSOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768631768; c=relaxed/simple;
	bh=pAwvHUCEcXNpm+LDy8SETL5I47IZwg6IMDS0FVV1308=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCUvaWdMpT6tK30St9gDYALDsKyE0OoeVjl+LKZMTP8xxOA2J2JTGoK1h/KZj/xiSvvIc8RtIbEXZJPXTRUKOTO/LljNIcZkIxvdiE//yESdiJbfcXJOSJwsYgY7RZ+QymSNs6lHTEG9RnZ1F5JilRcmQABP9IpFWR85hKo1pZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLcE31w2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcHSWqeM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H4dwbK821563
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=; b=jLcE31w2IBpt0At+
	bSqTZkfYMVmDjqiDGwxdmFUD3RXLSvubWclXzxJI/RuGrSFeYYMVpUS0xFTA/S2n
	vDz6zji4Qfk/t8FKzkLPr+U5PqeZ22kRKHR2W4eMDhsfmfqbTw7v4Jmq2lvqUKsm
	J/LopY85UWUt71jhKzdFyRgZBKMVRlUFmT6QLRYoQKBtT9LANSSBAzfN3hY1svEr
	H2LjS7meoDvxjKHT4j3E2RqkYZ95MadpYCzAwvfhxMOsSKXKL5rJu3f/KuFEuiwH
	54885+EzmjuN6ONWGEwhGHNriU4uJFPmUME5Q45Gg7xlIDqjU2zVrY01QLL6ceAE
	1Abo1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3kh05us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b20137a6so138040985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 22:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768631765; x=1769236565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
        b=VcHSWqeMe2AWdc2pTqdyDtuXiQsRXPNXQ929xMeAoDQe+KsKCcmvp3ljzM2isr44Di
         jVyLmy5KQa82G3dmXmkb7ZFUK6MZ0dCqLWM6ZBKtZ8PG9NlrKbwnz5zbvozDLMTphLPX
         gWsqXenyQ8YEBNrW7X/xSK8RjoGAeKg5/fOT/LLn6/zUuufpJ1ZoyM6j7J4HLu7CPT8V
         LZzFvg7znviiCZd1WFO4RzvEiLbX10+IZ934akOsNu27U1nU6VdWzzvjWGWFPzq4RhdQ
         gOldVJgyIUWpJOxEZmH/HFFCak/7mY7VKPQygxaPg/XNsQCEeOl+YGQVgfJq6L7DPu4n
         2Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768631765; x=1769236565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
        b=oMMnol8ABAYsMmB3IEfi+L9vlBfvfi24X0GGWO+iXA7KmKZpTfzcz0e2rppm9EFMva
         RgWWcUQSfR/dsb7LZj4qVigxdds8yXn+mevRa8IO3yACCE8pxgQSZzsp+cMqEBrcfb1W
         PdTs9xVFTGi+76OIIJ0vex/dR2B5wiei8b2qqJcwAfATBV3ZxZXhoYh31Dz/qGohjc9b
         Bc0AKInS7hDRP4XDLYDvOghvhu8r+CdsS/nCOSmhuhRntPD6GrjaXFnpuvuBSMz3htfE
         OTl4X3o5hKQWBjCgUgsew0SK6+cnjKXeuqhHDYoSuQySV8EVb9RcI+oBXzMAYw0/kDEd
         K4VA==
X-Gm-Message-State: AOJu0Yy0/ohfranu9r72QPwbRl2p9MKWLBuRe2Fz7Ir3thN6qL2E6ncW
	SGEASXjO5Ws/E8YvCrevqcbyBXcolMcPaBD/p9jOMbsgjPfpi0Jc/0g3ryBcLUwyd2K0jdOsYjh
	APfHVF0U8gk7S/HvRsVkx0YGWqrwzMzOaCjx8B389L5WTNtWB7pzdwiDCmrBcun/j1hPz
X-Gm-Gg: AY/fxX7V1jTSHJJidy+tPtMRTRq4auQKipq3qzqyMRg8tdNKw3pydfiJGpBMQcp9pvz
	gxsdFUB9T62zZRFl+0eFtQ1teAdiypdMbW68gqHi6iCAwWYsvhhcZKDlA0eiwPacziK7ae3iulY
	VJJZe358X4n7RRVLcLsKCt89Ud8Q2sqkhEFq+eKie03I/3JgSiUNPU0wnhhAGxDNZPva9+pzFen
	WrsaTI/B3qLjNyUCnC/55u0R1y3oaLd6VIbOFZiQCatscnSOldZRJqdG+88ufnOxGCq5hdR76ZL
	21Q4hZ9OnvAblXvEGMBBN4WnUJTS+xC/LQeH3BiyOXmV1PW3ZgG5msbjZDLEakgRLKpxSHjb4xY
	caZa5hnoAPS68nt9RU3+Ww423jp/+UpaxbKVuo57G9UH0w4ajUC8VISsE2wTHVfP9K1rM8DTNvW
	zgsmBbx2GZ3MCUzzKFexr5X48=
X-Received: by 2002:a05:620a:2699:b0:8b2:de6a:ca with SMTP id af79cd13be357-8c6a6764a8dmr777936785a.52.1768631765270;
        Fri, 16 Jan 2026 22:36:05 -0800 (PST)
X-Received: by 2002:a05:620a:2699:b0:8b2:de6a:ca with SMTP id af79cd13be357-8c6a6764a8dmr777933485a.52.1768631764752;
        Fri, 16 Jan 2026 22:36:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 22:36:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 08:35:55 +0200
Subject: [PATCH 2/4] drm/msm/dpu: offset HBB values written to DPU by -13
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-msm-ubwc-fixes-v1-2-d5c65ea552c7@oss.qualcomm.com>
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pAwvHUCEcXNpm+LDy8SETL5I47IZwg6IMDS0FVV1308=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3LwLtC+kj2HBoDxcWwc+QhCyCWUb0ECl5wO
 d89f5P+uvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstywAKCRCLPIo+Aiko
 1XrhCACVi4wbYAVIcssEV3/mLOyF3vso5kep+hgNtASJMx/eNsD5wt/+iZRV8Q1XNOfcPViiQ8Y
 OPdGumJpMcoPhXkkmxMJ6yWcFSWmZu90i165KrX/iUssDk++S4UwhqBWnp6RGxhTr4hnhS9xNQl
 kHc2bjThbFxBTSWpyperO3O6sZuJih1IEDCeedXq9AJxKwmFzEw/UCQYLQ+MBm/f0/rZR5/27+s
 7rc1GO8L3+KWKXb/1FqL3Ids2kLd957fdGtr2o18GBY1rIkR6p/r9Z0W5ZwFBrfo2lGsxI4Cq/F
 0yEOxI3POI8B4USsdj9seca0a3LcJznUlIG6rp2XliYvnCm7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfX2i+KVao4Vv0a
 zZwBszdWDcN+8ZhGOqiXkZYlDgfU2QDfNVifZAIVZGNNG1SkZeJ3cAgn+RO4cHeevcyHjNWv1xl
 KriU3kvVYrFXx1hxbth/fW03jKn6LOHpmIyE+jNdz+MsIQ2mbVUVXz5gvnVTBWI1TbUlQ/WsMYH
 G/kzTl0Mhe9xDLvcwMJ+QpfUuZ98P2eOoGG3SwhFDXteKbegZvMlPP+OJxNTt3l521fDa0Cnc0W
 O3GnqmO6wy+rwrejen+AKS+khM4cvQZxMHT4D+vf4pzjK/zncHwpWrnlf/wXNFrJDHKvd3wowFk
 iqqHg9TFwoFoEC/9VJPKOpoJ7f14TBYlnYCou9SbXxo12DxjoLKWyIPd32VwkLN8lkAoARo5crv
 oI4wgN+S41yjLx0SZJOKpLCekLZwVanQFQtO5pRPdHrfsd8HmrMhH5Ed85sVU4C1M3jZXALSfWB
 Br5ZPWTYIBq+1j3iVrw==
X-Proofpoint-ORIG-GUID: ff74nfvp0uZYW0TxhJTUVuV9MBd49_1Y
X-Authority-Analysis: v=2.4 cv=JcyxbEKV c=1 sm=1 tr=0 ts=696b2dd6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ff74nfvp0uZYW0TxhJTUVuV9MBd49_1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170052

As in all other places, the Highest Bank Bit value should be programmed
into the hardware with the offset of -13.  Correct the value written
into the register to prevent unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..b66c4cb5760c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -270,30 +270,32 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		((fmt->bpp - 1) << 9);
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
-			ctx->ubwc->highest_bank_bit << 18);
+			hbb << 18);
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_3_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_4_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,

-- 
2.47.3


