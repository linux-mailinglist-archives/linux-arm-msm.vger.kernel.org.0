Return-Path: <linux-arm-msm+bounces-73110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5E2B5304B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A0D71BC6136
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4675A31A576;
	Thu, 11 Sep 2025 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etRA6v05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B276031A560
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757589883; cv=none; b=N0nam/r5LgNyly9p+4ZMkRhN4+Pz2TBMC6+daGXQyF31IEhg8TJiG+nY99srLZBl/PFisFcra4Xab71ypvW8qo8Giqrx4PiGesp/F0xJqSEsvIHlVJ6BnHK7a1FTD85oMwgbueVm5dlW8Wg1d9qbAhDc8WtfnWU7JJX+7fwnyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757589883; c=relaxed/simple;
	bh=FEUevD/Bir/UEqCMgp3K3Th3lwTSdx1DDp6SRzW1JOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTr4pl7Twmax4dDF4DSTEeUfxMCz8LiHlqV9QCy6GXPuNRRuotCphyNNrOa0AEHKLFZp6BT5IBboxqw5bTQtaxp7khQCFArd0X5b1oDdZC+4M3NIVdFR350iOyF6W0Vk8dayOwxr8Yb/xMRMq5MeQLtNkWfUnQhUIf4tjEWfB44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etRA6v05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IV0W016087
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPoNsm7+PfZj4+jNLDfDUvmKCs26wErm+BDKGeJyvf4=; b=etRA6v05WeY0gSV1
	AAGw3riumuoDZwva/V+yCG332jRGagJmA4AgeLpwLY563RooGGZ1XuNz8HUmeJeI
	0UoVxqnGG69PnFQgn7yXxrzpO44azNFFeMW3uMAED5FvVX0hi/mV5yy6o3cNkpcN
	w4pnvyC4eEYc4FQnw0QxHaCNVMOXIVnPlujc455XJL2o912sWcBBAHmJGOVvs42J
	nNa6J7t0cf6JYtYwyDURzqfuOz6xhKvrdCUeLh6qeb1kaJxGrDBZI6fBpVesv27Y
	PSHe0daUdZ8584T3TA+P1PEQVtpbPCtjmZk9k4OihnU7usNSXzUhVH69bJ/rLI7B
	IyZTgQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t383u9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24b0e137484so5802855ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589880; x=1758194680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPoNsm7+PfZj4+jNLDfDUvmKCs26wErm+BDKGeJyvf4=;
        b=OvhPwc2cpGAEOwtFtyoCJU6qJal95DD0g5F2k2IEftaSa6E43erxPXcQeB4l5pnUOm
         eU4FCMlxvG9cubNtAIdQARUP0lJzObDpSX3YhgkHn5RHeFROwxya8E+1evj+LDBM3tr4
         bcB5J/jTCBCRDXAiXoW39qCrSE2RIyQYBi98CRxciQVS48+8PGfzLBUPniToXGN0AuEe
         D5gxsoA8ViE673E9RnrwOPaxowffIbOoOMUovna8KyixPRc6TaMHHkIPdatzYCCAcICf
         q7cN81gD0IWJjwRwgiIBb9Wnkb47TqCn7N/H7aeJlEmivYJI4PCSVqsk07PKmbOtGkI1
         lEmw==
X-Gm-Message-State: AOJu0YxEEY2YX4qSPSGvyZDSU6jYFowHmYbyWqMn9RvJSIHKKXMf9JGq
	/eTd2DxrnsJrFnMyHIvkxSbXdta+ihCz3OJm8tHTXMzLmG5NLtWJMy3cg/CJJS+2DQpoQFWTnR3
	UIFr4Jy9WUGkjw7bBLlCkwzaiEFg5ebUj4Bth/k4tfu84jN4bqMUdXR+Ii3ofbFJCXJxo
X-Gm-Gg: ASbGncvug0snRTYs4XNxMzPzxV5eqvp8v4EYEA+I7tJHSL1n6cMIhwiFdX66lbauinz
	MckpHRxFfN4ic5DTIvxDmjAgKePkUFLjCvq0HNJxMILICtPJ7ZBHFQXkk2fG7fPjtzuEqiFJ0I4
	UlABc6wo9tzjg40riOibUvgkERNiSemy+vNXh87FVDZlYSCb83nVAx0bOpDsw9hwFLwFoMZFNUN
	3QA+oaWYoh14BLp/vby8rJppYN0P15qvkRsehxFjWj6nNPEw4IhycPjifERFU7F3e/pkNZqAq7o
	jiPYn/EZwD6OxPQnPh4E7WRSLVfPzu0yNykwGW4iFV9TY53kutQzAECNmDNDLlS3O9Fm4HpQnfK
	Ypw3S2Q9tL0H/d5QyVI4kflczLkEni96r
X-Received: by 2002:a17:902:ec8f:b0:240:9dd8:219b with SMTP id d9443c01a7336-251737d3ae0mr251493745ad.49.1757589880213;
        Thu, 11 Sep 2025 04:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVej9XvECHnfJ2giLr8gHJUx8kOwiI628UxF466o3mzUJFirfad/bnLhSvmHcgicqE/EARkQ==
X-Received: by 2002:a17:902:ec8f:b0:240:9dd8:219b with SMTP id d9443c01a7336-251737d3ae0mr251493285ad.49.1757589879637;
        Thu, 11 Sep 2025 04:24:39 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:24:39 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:04 +0800
Subject: [PATCH v12 4/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-4-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=1133;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=FEUevD/Bir/UEqCMgp3K3Th3lwTSdx1DDp6SRzW1JOU=;
 b=lwy7m2h+u6LYki4ZBIiHe1vbQcfyvBfzCTgg7t+cwNsq18RqfOCaBQmsaMuuol5n/cguidvXZ
 XJ/cgV2mfRAAaS/OKzigEqVCv9kz/eEdFiKFaNFufM/k6rR1v1W/tSL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: pjO8C1UafJNJOeUUFopMg8H1c8d0ZaiG
X-Proofpoint-GUID: pjO8C1UafJNJOeUUFopMg8H1c8d0ZaiG
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c2b179 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX30u6979SsZl2
 qMobyLzsgPwiV8zR7K3w9AnbMSKM/zfW04Vs11HealcHVqcj5XWTPSvNedL8asTzCjVrrIzng9/
 dLR6V5MslCXaTPsLO+mGB2Ievh4vBqt5NBUsjgNYj9mhk2byAckTurCXyOnoyOb3cgmi9mUB3gK
 eDRNOgnWKAo5UeKD9CkdmvOI5YSuK1uIy3Tuf2RUSA6xeN8+/pto+EKWq0z62mjiNzWfzpfWCFj
 zfGU9w1yJaDldeo9ixyk2WjWTnkLrQO8WburZJ7isIQrXG1PevvW0eTXD703WkC8K9oleibL7Jg
 cjzZzCRYPXmztXWj772vfqW5vZPaZ3TqXNMsg31t0d9dZZ1cDTTMm9X2Ph4RxFZ3CLWZIzDS7QN
 rLApAKfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP data structure for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767..b70627d40dc4 100644
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
2.43.0


