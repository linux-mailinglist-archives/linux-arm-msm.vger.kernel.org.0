Return-Path: <linux-arm-msm+bounces-89647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B9AD3A891
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BB09300F659
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695FE325713;
	Mon, 19 Jan 2026 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPZpVwLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRbMKvxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E431353D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825047; cv=none; b=ZIfEqCxcW0lfLV3EsZmV3s7U2EWl9lN/lpH2E5v+G99FUFVpKlTV3Dj2IvVmgdEmZIl52vVNkE+ueEevMWSjHrGIuJuz0foFJ3bV3BW8ybZ7hPSbuPk8+/lzh/IJvRHixy+WLLvPxWj2YbDqEH1u/MZc4QvBsrxauCr/T2Uy7yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825047; c=relaxed/simple;
	bh=j7ALa2ZclhoGMQnJoj7aJ1Do0/fMTZqp4zi/tvC4Yrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JebKnTOUqErIQ+9KEjAnK01iljOUpyHJxhoduXuqk6pp/2Qz+y97q2izqSjfCnpOyj3hGe0/xI7xghAiZB23xZJ0ek7mWtTS1Ahy5lpWVIvPTUeQzXO3OrDum855VwweknrrvgbvKlimh4bjcqkbO8fkXAPdieFJPo0WcX1F+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPZpVwLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRbMKvxJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JB7LSN1839355
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODvajz5k+1YRXA6Nwokuzw/VMyW4/mE+fTtWqbu7rKg=; b=IPZpVwLJPuvCjP68
	EoXnbOX2bzoU+tuQhq/IuETuOxfpvrvxHmSzbWOd+1epPb4wsI9ioMpvcVHF+Gnc
	Y28i1c2a6s/MklK5LDwOThlPLmtp4ZB8S5C0NYqVb0IPq1OmEvnlI4dKgK9bCWaJ
	+wDybahgZcE4bCioOW5d8zAg88TuEQ7JCFj6L/uNEvNCYsdo59GVICPx9/FMnupk
	oeCmOU33uP2A37xAG8cyG+TZizK8MZpEyBrt3zcHmqxqEaeRuGPnCIkrjy0lJ1Ne
	NUDKH99bzopgButMyP8nllor5LJN4uNloTCHWKzDoWuivzUOwCAfkrjzbg2KY/6K
	Q+yGKA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskf885wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:17:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so47432986d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768825043; x=1769429843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODvajz5k+1YRXA6Nwokuzw/VMyW4/mE+fTtWqbu7rKg=;
        b=RRbMKvxJMc5FLLOwDeDe//3MVExAp8xSYMI9xmEH8TAtjdSoctyRxnNGO9FlqzPKin
         oW1gA/WIKov9bTREPD4CoULwRToM1jMDZwV1NSK0XvcU2zWyVkDv+qiuPgMeopnWaePl
         S+T457YGVv22a9lFHEVhpto3j9ncbGVpLWtVHObLz2yZzgBGGV3LTyeESJMu96Xtk7YI
         EAgvneDdZ9BYNllsol5VpBkyTRp4xNSWGFcXPmZ3nAt7M4P9E1iU12zEI00RORTZazmJ
         novDUzSm/vBDbyZ6LKacUSolaAeap0XE5RahfjdMiAB5r0E1nGAkFtXgiExN3BCnNdMN
         BZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825043; x=1769429843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ODvajz5k+1YRXA6Nwokuzw/VMyW4/mE+fTtWqbu7rKg=;
        b=UOb+74LJLQTVZ9AqOWUIaoQbk3CjXWmEXRku9cxiMwTIxTRC60HnHOlpGvRjbox6S/
         sBWg6O8M6tDHpOyeGTJAdTuVYybA0fnugnKC4Lbp2Z+FEUPZl4VzolLFRnfQY2a9Qr+j
         GsKSzhGJfqMl0Oqv2LgikxKhaj1c7hTqa4xsgD9VcVI2DvVnWKCCSUk5gzhBuIbDvvy4
         k5TEqtxJg7eNAzJohK6EmtX952K9EwKtQ/W6qjemr+4FvkjQ74DgwSbflSP4eQ1dGyVy
         CFR9uNuVxCmfIuBQ7TBK3MUP8YoJfsOHpum0kBbZuOVfgl3FDV6H27mRCmBoPAudCC3d
         1t2w==
X-Gm-Message-State: AOJu0Yw10J6do08gAbBKdRkRbuZztmN7oyu5/53OYLGnha0pWtioxo1e
	YzShbRJgkMFA1uHtyv4kF/8jCOnb/9RA24iTASpJJBgDijs37RSdvSgUFMX57WNYtotgmywK2Hl
	UHLDoXTjH7Ov+vi/yoLiaHsP3KWuKLCL3/ondSb0mBCmJL3/erBqdkjye/ufPwBlCXF81
X-Gm-Gg: AZuq6aICepGaxvfsCzT5QlclnkCFUGHJGRvLPN9fOjNO9oL/0CgtRhVCqmfeDj193zv
	Yk5537nSdKUmwIk/TTygVdcNIIltsEmEwxLhNb57LSkZj4D4KHezuNTHjw9NV4grhuO8NmkJdoz
	9Z4RdqJ9cm4UX7Twue9UoQWtKJNNheyLeoMMZVEK+kGSy6cxk+6360m87bHOMJgZyUHYlthZw6u
	4c6sRyY3Z2EvuqYqYfx14KHrQrW0ngMIeXeqIJprpGsJhq6a4j1MCf9SypXJ2iksFH59Q+KC2Ll
	DJjUEiaTsqwlFBn3IueEnq+uC6sMJG1fN2h9LdtC39jDsEBLFDQVxulA1pTn30UgrtcGT4BOLg4
	rhq40jmcfjitsQBIb27OVhxDR83oI7aQdjnhX84txoLboUGwF91hvVwU4lYCPTyLoWFZaOGm4CS
	ZHrEv+XKpcMbwT9E6nIc5fU9o=
X-Received: by 2002:a05:6214:629:b0:88a:3113:3abf with SMTP id 6a1803df08f44-8942dd8e7c8mr153078976d6.52.1768825042397;
        Mon, 19 Jan 2026 04:17:22 -0800 (PST)
X-Received: by 2002:a05:6214:629:b0:88a:3113:3abf with SMTP id 6a1803df08f44-8942dd8e7c8mr153078406d6.52.1768825041762;
        Mon, 19 Jan 2026 04:17:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:17:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:39 +0200
Subject: [PATCH v4 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-3-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3623;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j7ALa2ZclhoGMQnJoj7aJ1Do0/fMTZqp4zi/tvC4Yrs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2aewum/G+1ffRMqUL0xI39LiBqH4eGkfwYP4uNeMlc7/
 S5hLmHoZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEumvY//C9Wblebvp1pYT4
 f/e736Zn70xWNo+XX//xTPn9j+902Riu1Sh1PjXZKhafFfiq66f3AgmX3aqLbfqv/90pNmnOgwL
 3z9ZCoUJNqqF1LE38ebs6pBwnMTcfMJHWfuC/hWnJEr3sG5PNdXgcs8vdS7fE1cm2bKu2m744/X
 +HZMceuU7PNLV3U4JfTTRV4zSMOct1pOp148FjgR1Nqwtta7bsfd7CydyfOlt/26942WfT/jNmH
 +X1Wvbh8etzXPus1FwuTrV4N52DIXiexss3leUCOp/F9umznX9jWLw2uu9kdY7pgRnrjhg9j757
 RuhPrV+hZL6qs9O7C/oBr5u5XvcfEFkc+db9o5SEfkU9AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX1QV19Tyod113
 RFHwLd2fwYYFnIia8YKNK2Fys5D2IhipysP9llVWf5dPwVGNH6yMPxbOKnv5OL4nJ+zqzXKcOvN
 diCin9CAxvtYwyaODVKZmGSSRSPcDq0mcBkr6X/eeJki5jrAmGH0sPbrXKEBNY+Yl4LMwx6rYEo
 APtvIutF5eduosCW/KAZitrqtntyeGHcgnW27NDyZF9G0eJL1IrrAFp58DMwKXU/ZeltPj/61rO
 VJ14JGRYELBKQMtQE9fXyPGCL+cDgHyC1LerSxgsddvlbS+DquxnxidPWke+vzvrLEuCQsLen7o
 69OO1yn0Cl7IoQxwiVQXV/tEqXW+93kVv4m1Wegtzl6HItjH/Pzhgrj+waub5CfNGxZhF4b9jHA
 9km/uieb+KXRNVJ2caK67QVCv63lrWs5kk1yBVVEzaReMcxitFHitPjKlAOqlXleiTs0ovWbQlv
 3SCbFcvIYcuKQkCXTZw==
X-Authority-Analysis: v=2.4 cv=H97WAuYi c=1 sm=1 tr=0 ts=696e20d3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BEO5sv_cWZf0Vc4k7EUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 8vXNs2yerZ0S6__F60GfWiU39aNlh_gD
X-Proofpoint-GUID: 8vXNs2yerZ0S6__F60GfWiU39aNlh_gD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102

Since DPU 8.0 there is a separate register for the second rectangle,
which needs to be programmed with the UBWC config if multirect is being
used. Write pipe's UBWC configuration to the correct register.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b66c4cb5760c..6ff4902fce08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -72,6 +72,8 @@
 #define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
+#define SSPP_UBWC_STATIC_CTRL_REC1         0x1c0
+#define SSPP_UBWC_ERROR_STATUS_REC1        0x1c8
 #define SSPP_CLK_CTRL                      0x330
 
 /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
@@ -215,7 +217,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode = 0;
 	u32 fast_clear = 0;
-	u32 op_mode_off, unpack_pat_off, format_off;
+	u32 op_mode_off, unpack_pat_off, format_off, ubwc_ctrl_off, ubwc_error_off;
 
 	if (!ctx || !fmt)
 		return;
@@ -225,10 +227,21 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		op_mode_off = SSPP_SRC_OP_MODE;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
 		format_off = SSPP_SRC_FORMAT;
+		ubwc_ctrl_off = SSPP_UBWC_STATIC_CTRL;
+		ubwc_error_off = SSPP_UBWC_ERROR_STATUS;
 	} else {
 		op_mode_off = SSPP_SRC_OP_MODE_REC1;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN_REC1;
 		format_off = SSPP_SRC_FORMAT_REC1;
+
+		/* reg wasn't present before DPU 8.0 */
+		if (ctx->mdss_ver->core_major_ver >= 8) {
+			ubwc_ctrl_off = SSPP_UBWC_STATIC_CTRL_REC1;
+			ubwc_error_off = SSPP_UBWC_ERROR_STATUS_REC1;
+		} else {
+			ubwc_ctrl_off = SSPP_UBWC_STATIC_CTRL;
+			ubwc_error_off = SSPP_UBWC_ERROR_STATUS;
+		}
 	}
 
 	c = &ctx->hw;
@@ -281,24 +294,24 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}
@@ -327,7 +340,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(c, op_mode_off, opmode);
 
 	/* clear previous UBWC error */
-	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
+	DPU_REG_WRITE(c, ubwc_error_off, BIT(31));
 }
 
 static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,

-- 
2.47.3


