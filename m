Return-Path: <linux-arm-msm+bounces-69645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1019B2B79E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 05:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A40D11B63C70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E4D2E22A8;
	Tue, 19 Aug 2025 03:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hrtw1sKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F762BCF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574466; cv=none; b=JBwkdF1htWiZK5uOeyhtaVDKEhGqIlnz0XU0ROI3IyX0fJWMxbRUL5iZW4F8lqrxPPy9MViVxwEj/LdUPmLjwip6RYCJiiSuP4XeDLzv/tpYA0A5wC5yWh/U3smGglslL4q1FmHUF+1QPwj/p+FYBLb+EvvYeksz5OGg98Lj49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574466; c=relaxed/simple;
	bh=jOpI4nmnKEmv8uXLQgSky6yvZ4rqxGLbRu05MSmbQfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AInGmfecyPoK38evi1LrG9M999K5TP3vyxjHccHAMzDHLdxWGvtcwgKjSSQRwNSjcXimhD1SV2zg/c0fE5WBYOSvthk5OlxcFSSK+8jxaLEFJ5OCS6J2quipVeEnzOB3RaHuaQG4nZ0GZ9DBj4maTvX+ySPVHnydHNlQbYj3Bbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hrtw1sKo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J3CP4E017560
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OPWsmdBgWK2fzbiKII489PmVXT2aCRqmtO36lTZIRwY=; b=Hrtw1sKofE2SkRn5
	eqE+EmbaHH+lURmilUFvUpZOSNvIo9oYtSr9HmBzIzK5XT/hDatw2LTi3QhFyeQr
	/xRh6j0VCu9RpRN8SPs8Mgar6t7snovEIyvU1i5aX29NaQQfrZ/XkkDanmRCg7Qs
	2RatRD4vD32mevX4ZVbsBjTepv2qbeF9cE2aDrn9fndepz6HheVzcTNeekZ+pLIT
	J+mEkbampmGuOOOquPe5d9NpXu+V+Zbw5G31MxLUBa6HwCWJUWQZ7Wv5DTGA2tNq
	R97EkBtJsMzxwQgg4txqtvcjntPr2qAr8C4yIPSbjivGQSp9zDnv8rZBe1jhbV9V
	aacaCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh07725b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:34:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445806dc88so121733435ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 20:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755574462; x=1756179262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPWsmdBgWK2fzbiKII489PmVXT2aCRqmtO36lTZIRwY=;
        b=Y4tBYtzaudK5mDfJ01oO3pyGR4g0drEJMrAfmNDRjkdJ/L2TBWrlIEtugzb/VwB4Nz
         e3Bq02Rv73mmKAZ/rT4UMgQ2MnocFaPGgudq9yYx8PHqV4TiEB5Jq+uU+GOMIr7AZptz
         LXIs6B/SEWCutviDjk1Q8Jhyp4IVZbL7t/FFbzAsbrHyHXzV9PQ2/7W+L2QKXXfvQIoj
         RSKuvwlekgG2RqBiw+8Au3y8PVWc7hEfDk4c27D3OhjwJz1k0oqp4aTlDJM3iskx60YE
         hCtB4+PE1/C8zHPOWKo76kdLi3iUZx4FGljvjJsX+VSErbRbgFOAB1SPox1Jjm3dRsZF
         MOrA==
X-Gm-Message-State: AOJu0YyCsvIfRzGTsY2QI6mZ0Z+V0Jbo2ytW8rwZW8itn+tjOp7/D+Ry
	GNUGOwCaiZGWFmvmhfDw9lX9KaU264t/BoKwU6sg9aqEIeCQKfMBVRaUenGVFio7yFwe+tSEIVp
	PML5A8KPmvhBdskZJF4alEk4KE4OFrLRtJKssZ9eQqG5znjwHVS1Fq1VoYUUtuD/zI1uK
X-Gm-Gg: ASbGncsmszSt+TykqXVs32pIfU81HV98ZbwNeMSwrJWzmOj37K0LY0GFSGBvk/GTgXs
	xK++oa2zfwWuLuuf8zCiWzOhLjXdyUQInLGx5IIl4xpx4u+/Da6Ce9ogW1S9OGRpptllE5z2AlG
	S9EZFi/zi3W+CVXrOTdqR0Q099DVSgeYo5pD8C7QRvL/x+s3Ptv1aYjY2SJorgWmnC4TfiFs3qK
	kGd7xvhDR/RWmGkvUCGucmnNJupe8ueQMDb39VTXbgruz040drSDFUtfGuRrPh3zJHLAzFFv3X5
	M4bp6oxjzkmZlREbiEkey4TNxPHgdSFOHkq4HWEkq5Ql1ktEdmvmg4PEB/PQBo5VQ9MkEhw=
X-Received: by 2002:a17:903:22c8:b0:224:23be:c569 with SMTP id d9443c01a7336-245e030d92cmr15552985ad.22.1755574462102;
        Mon, 18 Aug 2025 20:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE13BxWQaZCSpPUM8Su6OLbnLn7Jh+VfY1RtFqcYmy31G07dgHHw7LC/2QnlPkdHOv24QeTAQ==
X-Received: by 2002:a17:903:22c8:b0:224:23be:c569 with SMTP id d9443c01a7336-245e030d92cmr15552605ad.22.1755574461668;
        Mon, 18 Aug 2025 20:34:21 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 20:34:21 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:31 +0800
Subject: [PATCH v7 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-4-49775ef134f4@oss.qualcomm.com>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
In-Reply-To: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574427; l=1186;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jOpI4nmnKEmv8uXLQgSky6yvZ4rqxGLbRu05MSmbQfE=;
 b=Mhpyzs75r/w1fcnROY7DFyp/qHvsah/YEHiiC08YAODExISlfqMhgNgkJqs5WTOYQff50uSim
 Ynx34vWm+hVCP/Vw/bmQ/fifpDV9h6NMxRK+9bcfEyVEpmAPeZNaa9g
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: E5sUpvQ7y8unPwFNJdoO-zQ-R8qFyzJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXw3yZNvLK8Lg2
 HYojefP/e2AV26gPKPHpO+DsQfMS5Dn8e9En4CigEj+5PodEWZt9rSAIwwfsvbm3HyRpItriYcU
 opn9SWfGR6V3noBFXERq/4fdvm4DeCEveD4m9v3o11EDrg6xUZ1XXjxxM88gOfKwEVPPy8wkoZM
 RHO0C09nSixJT1P1DqW63+wy7KIN+KIFaBJ/XlEgr+fKpRPI2T+xF2Xj28uuhTokxrHlG/ziQBl
 1AFygRX0G+5Ski/2TAUqmAnZ56BmN+efDuRiCadjZwcXVNkZVgVWA2J/zbjo2WuHVzGG+CyBuzB
 dBU1NV0lw1/yskrcVz7ctXhJFjAmObRJ6362O+Or743kbTZzEJkaxYVEN5zpnrbamqZYx4zQ6Dy
 lvVtVpn0
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a3f0bf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: E5sUpvQ7y8unPwFNJdoO-zQ-R8qFyzJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP as fallback for QCS8300 according to the specification.

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


