Return-Path: <linux-arm-msm+bounces-58491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D9ABC3DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05E127AF970
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A48289E15;
	Mon, 19 May 2025 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZojKrje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00D4289E08
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670688; cv=none; b=hLkptA0DrA43gf4voISUcCeOBv0Qfxiis67RZ5iqfvwS7JjprcQ1UFCr1ir6iKkg1kfcKEr1f19yeadCf4zRSG3SDxL3cqPsk20mOxEPR20YjSWfE4yFP+HlA5yXHYLB3zp3BHgBbdgyBvUC5QqmiT1kQaep3BI/EgAiKHJ3MWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670688; c=relaxed/simple;
	bh=LuuDGI9zKbFWm2nzJ6vDJ2HTvMxLeJP/RtVcyJId5rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbTyQ8j2YzTOq0sIBDUcUMZ53PKGO9/kGJcfBzC74OLNAlmC5xVa5Uiw0NlqSE24wfs28xGfTWTqKten/FS+bYF6pkDWmzM1icZK1Z8xOgK9beh2uSJT/pEOSVOLWWYEN+ggYr63gs51c491/LtsIV/GZOvufctpMLCoTmOpwzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZojKrje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9clgh012461
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gi+iisDpzgKdEiK0rcVeayKCWIAFmEEhg75ZFqke7ck=; b=OZojKrjeCW6QdIBP
	t5TUT3fb0ATF+YrvpL6nZYqzhKc4daO/HWvLMTHgeCVxz3xDEXqQQYwha/JTdrRV
	Y+uJcWMLngNk3ExavYhlRh5mQl4e9MIzYLHC4ETlHMBkh401fHbc8mT+HzD0nNPH
	p19UovV87jcHWl3ASKCmVae71NGF2I0QAJaQJowueUnJP8U4aOuT7xzSWVmOt0OL
	XB89CmqjOSjDs7tM3YQB/F9/RfK3YSFfmR8nPC8hhvqOM3M1Ld8GSQtnUR5XV2Fl
	gcaUvotS+WPwTZ+dIiATfmTFwRTD2yiIhcvqJANGTwujynW9355AIQjmu8f7JYGE
	xCQ0nA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4mu7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af59547f55bso2756312a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670684; x=1748275484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi+iisDpzgKdEiK0rcVeayKCWIAFmEEhg75ZFqke7ck=;
        b=L6jlQb010JNrvTFH3plyi51Wn8CYfn7HZrykcvuve+XxBFl/25FBXBMb96CFT/bnaJ
         tLK14rZwv/TyVf5+qK0HER23XGuEIpAqsma/JjHGs5GH76m/G5UKdFsgZBIHrtv48TXL
         E+hQidMFuYbyES5DlYyuxvBetyzyuDrzWxScoqWZVNHu+zetvM3BvEeGXkIu4H3Iqm9a
         wUjGoVBqFXoJX5zx1UnlLv1hHX3YHmNoHEXf+tWqc/5KGDsHVnlbRaKq4kC0YAlm4fWu
         nVxnE3hOLJcfKCI9i2Vox+nWkcxVuJviuri+GliCm8H044N46Z+Xfrz3EEReaxRuxDKv
         4qrA==
X-Gm-Message-State: AOJu0YyVaij31Oo/sxyiPDP6bLwZDbz1AY1+F6yQH+DmXY3ABxnJz36e
	vrwkHSfSDlR5S7kkInl9P22kpvA3qIIW9sFzA/pAmJtTqNroB2gqZjvFQFxCPZWgml1/61pblJi
	cnodrc/mXLjqSVgxSNODQrvj41+0X6Pm6SjF2LPBEspEP4gJqc0vobo3dvCgKvrmOp5K5
X-Gm-Gg: ASbGncvj8tuPgFyOgWkNMyKJ9w/t/S8VyGphQcZS9GbVIpKgsQmekpVLC0WyuDAhScX
	ll/yE0sLEC2MEHaI4V2oqiTtH66YYIkenVHJs8pzfcigNIBPqj+UQ5dI2J1M761q6OphkewOQFj
	H/2CY/YI0lR9xCP7ILuold4DyGzjJOdSfp218NLlFxb2lkp7BzauIHxNoTVWSu6efztcBgoKOf0
	1FO9Q/Ayl4i+6DjwOtrC5+eh+GEE3QvmeTxMHnPiNOALcf28o5UjG8JtEfiSXZchHuWieL3LjRk
	SW4lb0uE4wmq6/SI9VmTZ0ifriYHLfvYdEU+N5kbk0Jjom1tVXForoSPQu/7eRYfIXkLwAnvv+y
	ugQ7qVdbj4w2VMtTusMPyRp8k
X-Received: by 2002:a05:6a20:6a28:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2170ccaf4e4mr17466872637.19.1747670684373;
        Mon, 19 May 2025 09:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgNDYZ32Sjzzk2gJJMfu5Ie78pJwNA3N3D0CKRForF+eN6xgFTl7z1ALHWpDNFHkhlcSwM3A==
X-Received: by 2002:a05:6a20:6a28:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2170ccaf4e4mr17466829637.19.1747670683896;
        Mon, 19 May 2025 09:04:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:16 +0300
Subject: [PATCH v4 14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-14-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/oHhBsr0/SzduUBt+SEifBVkpkZbpX33SiSBjgxdPbQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z2WPX8vjhP754nU05dyRDPmccUXLRp5UrjKNM7k3QeR
 ZZLFKt2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiT3Q4GHo9H95gDl+vpvfQ
 rv37M2e53mcn9Vi/5c8/8VK31vpsiqVjlrFYc+Pk5c3b7/auajaeKj/T+PKcpI97v87nWnrTTm+
 qPIvzuWajtmbRdIZbSayLr/aKvVbW/h+mP0XBS/deWOsNH+E5dZd1/0/69ftl0Mc5aYIBwoscjE
 9V7+Q5F5Oa8EjFob+3vKtkw90DpdasM51V4qYqPg12k3qWNv3k/uRSVsZp3idrplw59sYyNDXnT
 t3OpZ2bY695au1OKo/n476aXcM5Zf8JzUl856zjnYIUHjj5VNcefhUSzf5szjvVKqfDv7ccbvga
 87L55t2gmTfc5VKjFZKKLvHWZTjptYpLSXvke9/3iIwGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HL4lenG9xcIUsxgim5sIb2m8TWgtdLb7
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b569d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=z6iiZyybfqEMMI01lysA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HL4lenG9xcIUsxgim5sIb2m8TWgtdLb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX7d+PHwh3Pz7R
 vR97DG7WCeffqwWAjqLZZkBK9+1adow/MXCy6Q9upGkyBQCHe+328GEp9+r0f3ZpraAAO8DD+Lh
 QkkSHvFw16tW//Nm9TgYS3VfgKtHChg9qE85wyJK+zFwVYCCarw2INBTrJDn54JAjakJyJQTGJK
 A+wHeYc4BecASqt/aRju1ZcEgTIk1CK3HUrV/+9V4fJeVnMow77g5pJgXGEO/RytxgwmFw88VvA
 xFzEiTlObAEWRwo4vzFzFMPR3BIkDl3MTYjaXF706AIhO7AXez62t/PUucxbhBADt3VRp1MPoZJ
 PYKQn9Uvmf2uguSBEBfZn6MQzhTvQSqyZx88gTCfGtZcVkxTNPYe7Rl38HSQQR5JVou/4FCnFcn
 E7VRJoYtaJ/fYreG7yd7Zior+Rr+D7XiT+/8/zSnuCR/nJyAV5R5WTkecyzP22KLG3adS0Gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1244dd59648d11123c507a1369f28f952d047fd5..4482f2fe6f04e58408b55994d885ea1c717c6a07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bf6b2392efb47fa8c3e3c5d17f1a72341872e18b..e1c6df3a3b72ffb5a816bd18266a35abe723fbd9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -143,12 +143,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5


