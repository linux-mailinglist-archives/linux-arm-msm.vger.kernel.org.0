Return-Path: <linux-arm-msm+bounces-71984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2CFB433D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42EE97AA1D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 07:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6D62BD033;
	Thu,  4 Sep 2025 07:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gkWJDUfK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D684D29B8C6
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970655; cv=none; b=pm4Y6Wvehlq2bPSU5XFACBDauVfHx3MLqmqht2wR9GawyWgnRKjKstns8oyJF89b/9nBM5f+0rTM/xX9uldVuSD2irglm/t/fZyviGWNJvfd9aamrGEZB13Gj4ZuZ6GoV3ysyQwnjXf5erLghgzfenqRXf6jfkzCh8Cj/+IhxUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970655; c=relaxed/simple;
	bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlshMKZ9JiUZHevY2zlFvCD80YOv7GgR3Unt0o8EofZTXv+QaWp8Wsi2yrT54DpS0z5JY2AIgBg6QoAScaj4K754cMkpTTGR2+8SbO/KPGYGcy2N7ejjs9IfY0zk+bi0vgxdWd6BjV/eQB44w4A5qw7dT5tb34lzYHFnu5TRf7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkWJDUfK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841dIvN003427
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 07:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=gkWJDUfK/EmvHJOp
	Il4ZQV1HfyFRXs2662MVXFJ4c5Nmx2ZkLS3Xqw3rMgecHgvVVGkpuIzRXqSAaWrl
	eyXb8wRZguWLa2N6u9cQOte5cBqL/xY/EwsUWWgMRzC5FLOXnFVPgm2Rxd+s8+9+
	fU3n+/VdqBw46eWok3GBw8G3LESkfwIy8va/izdkYzitN/9cLaYwUVq/jznk5oRa
	QD+Wj+yG1KqjnATqoiIaewOlcCn8oTmMh3cLcoBlqn6KsaBgKFBtyPe9sy+2EqW7
	vQd/sAJ0ErLlyqduLPc9VlofPrcl/9ea3A7YaZzIciz01VOjRS7z7rBQX1d/uEPP
	hZCGSw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8xgdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:24:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724688833bso808483b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 00:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970652; x=1757575452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
        b=Pudv1SZ/hfsZNEAXtDaG+HHbJbweGug+p/t4Jq/JpkMWLs+jNn4VV7u4OsLGF8upz6
         Z3O+F658ka8f9HqAmbg6czC6H20NqDCVeOW0lsN0TA/6jcSzw3xUB4b88taed9gd45Bs
         J4JPvVWUSKJ2ZVIWCNQbWtqa96Yk+uxLOBKAkKLjI/nTLY7U6tvD1B3YwKdGuF0l1g+5
         KmsRf3yAJliSOEDBUJdDMVsEPtOgjW+gCu7GUHn5k5t/1tSs+NHl35Tv8ZDeUGrpNDvM
         dslndeYUV2mGi9hFwQldXtXkpaMa9j9QL14DGXlHSXgm06XAzeaE5BdKgjI6Xi9o8opP
         SraA==
X-Gm-Message-State: AOJu0YwNIskxG3kuW5P0GmudgLkaAPY4UjR7pJZAZDjBP4jJIL+gZDI6
	a4axdSRePmbhp/Kd/LPdI6tG00EcSYU4Rmk2YVUQG0VioNiFVe9yoSmZRJZTofIoM4E9ThL1MG0
	1XgbZeLJKXlOQ+NyoomxrTW2FrRj4IeRUnVtJVeNvo4pLVdRCRAXr0UsCGQTCgQmSHbpl
X-Gm-Gg: ASbGnctiLLKh4wI4Wv82rdjYBTH0LmXHxPVC1b/X/6qAIBRJPzJcBpoYroqunlihpKb
	K1jrW1CbmC1/wRwt8h4Oe3wOTKBGkbCOJBPUO4Ly5ATD6/C0v/oBKj3WB1GGtnaEQ8KRZNjXNL8
	/cZ4vsy6r4ttpa4MOk6OI2slIXNfRqNcRmr4iPzQZxyGqRlMqc0s5YCmxTNUOVffmFFhbSPaF+a
	JecrlVhJmh5B3dJ/+9a9xv7mCarsYHcPuUkkKTyFaN5ovy+e0mFWTM2ZKMHsEj0z0slZVJl4RwY
	KGnlLfkbaC7TdywxgP5wFQ+zYc0TEcmWgitZzRF45eNCbE+N+ymMGehuzp+LUCqnqNEbsTw=
X-Received: by 2002:a05:6a20:4322:b0:243:ab0c:f0f7 with SMTP id adf61e73a8af0-243d6f02e59mr23320010637.31.1756970651453;
        Thu, 04 Sep 2025 00:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ8enfuqQcqlAwxhsH+5qitYBcmR2no0dT0Gse689XelnQPF9r7les6vLU1Q3oV7U2TZEQrw==
X-Received: by 2002:a05:6a20:4322:b0:243:ab0c:f0f7 with SMTP id adf61e73a8af0-243d6f02e59mr23319971637.31.1756970650898;
        Thu, 04 Sep 2025 00:24:10 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77243ffcebasm14656452b3a.51.2025.09.04.00.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 00:24:10 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 15:22:39 +0800
Subject: [PATCH v11 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-qcs8300_mdss-v11-4-bc8761964d76@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
In-Reply-To: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756970611; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=KWYVYnoqYgq/copKQInvh0Aj1bnq6K/MF3klLEorICC76+c7mfr4OZNoUWfsI0R5sv1eTtWYe
 nVQENoqS8xYDc/JIPq98MskOGVTXkgR0GuWTiXIC4qigBzXIKpBSb/C
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: tPDJ2p2gEwhUB2Wtf7S9ZbHBny_laKZR
X-Proofpoint-GUID: tPDJ2p2gEwhUB2Wtf7S9ZbHBny_laKZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXwBFs8oWOftIY
 33JjGVvM994bcAcAXzhZ3iyqppYg0f4UCj3ZEd4YhaQPHIE3Y6CHd7dkkt3iwcpRRQgppAQ2JIm
 +/ua8H3kJuz26qBgk42Hv5nOgx8fh2KFWaYKTPyPKNPginVMqYJ9iZSjtgapiKzDV/SBk6Cr4Qd
 Dwc5UM7zOJ4qbJtKihCU4w6NOEztUqGXPdnMyG0vsgynDxuV9TwqkY8AZLKuvnEFdKBZRnpgKmC
 iRk0VbALaoodnnH9chkWrpO6J1SF4yeYa0VEykmnm9jdSlF87dog30uIETc9DbfrC15CNXRUblJ
 exHrvjdSNwwvWzYnkrY5ua8LGrVRpRDhsMj/C2VM5WYlt3UWEcWCAKwbnkfE91Ulvl5niC1nunb
 pkiCTUpP
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b93e9c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP data structure for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..b70627d40dc4c671b8a855a17d4b8ca2dd9952d5 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -236,6 +236,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.34.1


