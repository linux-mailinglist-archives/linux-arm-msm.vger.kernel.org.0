Return-Path: <linux-arm-msm+bounces-70045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC29B2EC36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 05:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D3F15E3DD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 03:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B152D3A9E;
	Thu, 21 Aug 2025 03:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUlmt6AA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C612C324F
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755747450; cv=none; b=oTuVAnvSINuGyH2JEkaAfsBdnTuOY2JuZku8nroKZJjNcOzxfgjmSAHCbbNCbxQUPskkiR4S+Kfq7b+bWQvXfeWYosEHbyERnB7mmrhYVFRar6m4OTvk9PTzPpwUW1xLcfgAcAYI7nX/8W+OeiZI0JhUszI+aCqT61iDNEW/Syg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755747450; c=relaxed/simple;
	bh=jx21lmx5MGZ/FfsdeqVGZncpC/OsVU2to6SdDDH2l5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLbxKrtGa4hrfEAZyFYdbMYCtzEYLGyzdpMNFfxPPBKyS1oi+2LSjCWRFC0Vc30ouuaAPbIJ0sAp40pQ7MKHG0zq58UQqR9T/J7LXWliRK/Enmoco/n+sg9QVbmQZHekYaZJezGtNMI/jaZs6enEqWfkotz0WxQcz43LOfqptHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUlmt6AA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KIvifg013810
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=; b=eUlmt6AAuho5wdkr
	o4j6MR9QVgfB9gI8IylgS1vLDVapbYjbRHop+U7w+lk0vgg42JVRmjWb7RttP5eQ
	D2nT/7kULgkVnRetLcdVUfQXH9vvvvJPRZlDsE+3lNLe8U0w+lbrKAwhPvNomZAt
	NhrmDFu+4JLgJlaMTlh8ZW7ZrneTYiwO+yIWyxADuio1HVM1Tz97ly7fD9IG63Ad
	HnCN9IkRdb53FG8VnXbI2zwvjRd2CuFlZ0r4H5M4RoLogny2lpJE4JH/wAgM6YC9
	dhhhQySSNExksxKCuZoPDknaXVDsAsjhYtI9hDmpwCOPlxPyLQ80mXQUyYh0CqFq
	ta4etA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdhq2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b473910af91so1446598a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 20:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755747446; x=1756352246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=;
        b=s+VOaI2gy9VT99oZXZmfpUNU/HdDdI/VSddAOvHzvLD87BMGVhNtMkJgkIhxCkClC5
         XmPrrD3WfpIAyPq5i1rNAPOCjQ++y3maqF9xcMfgyD0/7+sasb/elgCZ0rBxc3xV5Hhl
         TXip6V2f78CL6CXCtDEU+W7CtPP8SiSQ1qcG434LhVifMgsi27TZdxYNNJzb4lT29Rhz
         5diEZM+QuqtGQySS6UIDLTWhlnJt/t1CVonRDiwvxJBH1Iv9O/2TitmVCEL9afesveeN
         f4rzYihPSKpZd4g9uUA57rTdoLBizCNt2cYEMeKbcaXQ99G/MiYvF/olHB7GZ5HowDmz
         MBDQ==
X-Gm-Message-State: AOJu0YwbTyVSTZ3kRgoPQb3U7rPbPeMtIrq0GnTfAlk7A5g6om2SZjCV
	GV/0rxhMvFFjPiZ4K1Fc6O0byt/sG/k8XjB1fiyhuKyCIckaQAYlTuHjbnb9FYG24RlIKNlaFtE
	Bs3U+sKV6ZmHH6T286gq1MteiqGRpl8ONGePZpEVv3DtkWH5MmC3sLujqJtKHvwMLsQi4
X-Gm-Gg: ASbGncsmhkGFrHR3v/2mImILxIptaqfHIc5eJtdOLV/0sNWZrWCBHiT4HXTAUfrkSS3
	OaMGducFZD9CZlHE2LxN4JKAaMSjt9A4T960OHXECzHtDDgLD9Iu56sj1ixmhwpG75/1eJUlvqv
	hvHeSHeSq5hqZ8aQCylFGc1vEvv1l6HD6xJQsKfAmT7QORVhexzk/829/MJMIuUHN5zFVnaEoJG
	UfRsmqh2bQ//KQvpteM6zY07e0DJmF81yOoilOxk169xGF43zFBvIQAUSApzR5HWMYaTgQUBWff
	BcI6EypK3PttIvjeIm5hhthJWrGArENZvH0xEPTEQ0UKkAZpITI0ezb2ahRzamxxZ0zKl7M=
X-Received: by 2002:a05:6a21:6d94:b0:240:1d4f:71da with SMTP id adf61e73a8af0-243302c9111mr1308520637.23.1755747446547;
        Wed, 20 Aug 2025 20:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP7fH3nvIAuguK5uO0nZHBdwSgTrqe9xEtuGpzyBRAGzFnVbJ7eW9pMnJeNufd/3ZYhmSLEw==
X-Received: by 2002:a05:6a21:6d94:b0:240:1d4f:71da with SMTP id adf61e73a8af0-243302c9111mr1308473637.23.1755747446067;
        Wed, 20 Aug 2025 20:37:26 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:37:25 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:36:00 +0800
Subject: [PATCH v8 5/6] drm/msm: mdss: Add QCS8300 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747403; l=977;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jx21lmx5MGZ/FfsdeqVGZncpC/OsVU2to6SdDDH2l5M=;
 b=nIqdK5cwHfKA4OLfWyrt9z/LdtZOW4Iwetkfd1JMz89UozEsjKfrY5moqsraiVywkhgM6/qjq
 uGY5PjQ4rAWAws1iQ4pyqdTzZ2LqTHFXsU0e8v9ZXsffLRA2a9Ne3f+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a69477 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=56KCLgTT6E_AFdM1kc8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: izdWHBSVvqWh9ZYh7sDGkguEsNVyv_ji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfXyPpUC4YII77L
 rFFE90UYwsFyc1RsHfceJpsG3lTn2Amdzw2VdUJPvyBkwExzGsvnvyJ5ZpFltwJTHvqeeoO3M5E
 wFuOPRHV39Nw5DceQSSzQaz+/ONrRbsh/CSnTyeX3sx6X8hCNLEpPZ7qZzsb0xJUJ8LeRPhOvnj
 utYuOzlKwvTw1vfzTEdnXH+rLwq6rBun568u2mF1ma/1JSL7e0MEJT4/4V0qbGdw6ZJS60k720a
 sIMXlOUE610zGXdwLed68G41Yeum59l0uU/N2c4FurqIhZJBF9XB+ITSw0d74owAKJpNMADxiEX
 SUUPs4tfdZXAULvaLfQ8SxpIzogOxo6xLIaHVFLIM5g6B6eTBOEOWoww26eYVBAEZnBBt1baI81
 AV4xFMuggDyAdHpxSK9W2pAWF+MLTw==
X-Proofpoint-ORIG-GUID: izdWHBSVvqWh9ZYh7sDGkguEsNVyv_ji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1


