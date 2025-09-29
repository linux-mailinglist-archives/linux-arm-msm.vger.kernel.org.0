Return-Path: <linux-arm-msm+bounces-75512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F61BA9848
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 16:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D42D316A2FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 14:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9297B309F15;
	Mon, 29 Sep 2025 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4z1hulg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F191C309EE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155441; cv=none; b=CK8mLeKvgkrNTpkVsqD/6u1dOcqPUl2v7yyaIsker+via/63/XAIp79m0lsPIDgoPpYeKx8g0OCiAdXRuM51DFALPIAEk9hXa8iAq89Z7Ory4pP79H0IfuW7nEqhC//wxM4/4jkLCJ12GqLFbF8ZKfnZQwU0A9OsNlU7Y18+M7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155441; c=relaxed/simple;
	bh=u5cNG2Ln2eATor8RQIMsdKn7Fix2w6G9k7RgS5STwA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0W3YPyzRpKohWtZ0I7FcI7d3tpqCRq5c0f1pdhKGjrVphggilQ1jJn1rcZi6DtZqW9bsufw+0eskkMVZWwifxKR6rQkBy5BCI0t0GghdO+I8cdpER8Sg8R9EaRqkhd6Ej/sTCUMUs2AEYx+BlaPHlEThWXiodW2Vzcirko7FjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4z1hulg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TAGhKe027018
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 14:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLsnlOo21G1qIqIJj+gUab2xf+5Tsw86JCxBxDRSXCc=; b=b4z1hulgFMIiVNhh
	sRnUD7WvBq0y07Ftndun0zRDTpx2DT4ECPKw5oLThsFgFAuRj1OxU3LTwyzmqvyj
	m3WU5pL24J3XWwhkPJcDk0tl2DVmRhSN0eKGOikkCpGey6Dr7IVo3SpPtMyP+Knq
	vE8hkiKFJmK3ro8IxO9ffVtuI3vX6wQSNRvCpgVylLXON/Nxx+IdeFOFfOUzae4b
	lOoJaGiDENSNAjpoKDZ4odZQXi0eybdo7go8PI65f3VuLqZfApcysBn6HuVFbASC
	higlqmP1VMZwWLK7WxC+iwdUe+oYH/krtRHd2gmSxXyCFk7H1FcZsUyGFKD+Hq6e
	i3MXhA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hdan2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 14:17:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781269a9049so4163532b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 07:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155438; x=1759760238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLsnlOo21G1qIqIJj+gUab2xf+5Tsw86JCxBxDRSXCc=;
        b=L9vYsmCdN88urrBg7I3r2EzaO2qwbK/EtoICU0ZOFeXS5VdCMniH5NZ9cyCwhMMafT
         iUM/GhX2hzepJwRhr9HY4YnNj5mV0TFAhLU/Q7fLtNAQDUpDjEJ8yHpIHA15IwW5uRHm
         Fcz670QQIMLSo5Tp2+OcYjdEnK06rTvp67jMWNDmGYQvQAdm8JC0mRaJ4LjDD6sf+J35
         geK5v5j19cVM6CuFpBktoZ9jOEQDZX+nKzCaWMRm+I2aIMs15ECadpKjMUfQ4bb9lvPV
         7JtnfxdRsN0qWgZn2YXpB3Y1kFeni44st9gbOl14P7X8V2nDKclnMznCjfD8G4l3IPXc
         1mlg==
X-Gm-Message-State: AOJu0Yz1Poqq03Z/w15JGr+B3ToawqIZ5mjyTmHRjgRpjaqbKqxBYQUc
	28PRQ2yIE56G8NzpB9WvKrqOSyyMbTibnjjXH140yY6C+de+/3AxViMVG5NAw5fIn7jmpfNSrHZ
	9KkIsD0ZaipijO9KriKCsCYySCSoOn0EerWh8S2DeJ0thCVULkJmyY0CxBbx2zutpHbguSZqAZZ
	M2
X-Gm-Gg: ASbGncvkBJ+RDumfdZGhq2+r5+iV/0ZG7I7jfdFVW/bKDt5X3SyXaeWu23V9kr1rNGX
	Ju1mgKADPe15wo9Z9wJ6g2Gn1JYC2X3/i7G/TgT1IlzDHGfPV5eA+dmHu0TgPB0keNKZAYKQYRh
	5/2307St0Nmwi9DZwDYi+EzvvpL5up4yWdaBI3MxSN7aEUkr0opUzrLZzhTSH89DHRu6szyuExQ
	Zy26VtyR7M5ELk8qt3F/Dzzij0HavGtHaJmNe4fUacIG5S48Y9G6trNy193TpRcGY1DC1gviXtJ
	PWqxQq89cnzQYCEdmxe3RzdHK2EUT449o8MddteIh3sEndpz2jiaB2vzWVUkeP6feQ7xkPH7MYO
	fIv+32VtNw1MpySDBjAXpx8Sfszx0gyRtekip1AVDzcha/AVnYwRrD3IlMMLnAFZdXqHLckfIhp
	0=
X-Received: by 2002:a05:6a00:3e13:b0:776:1de4:aee6 with SMTP id d2e1a72fcca58-780fcec2c91mr14412592b3a.16.1759155438207;
        Mon, 29 Sep 2025 07:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdlNnF6NRjps77bQpCKt1tqZP95RfthHoB22w6sWUcZesCEBU/V4oeksDuzvoGLvP9WKvBaA==
X-Received: by 2002:a05:6a00:3e13:b0:776:1de4:aee6 with SMTP id d2e1a72fcca58-780fcec2c91mr14412566b3a.16.1759155437676;
        Mon, 29 Sep 2025 07:17:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b23a48sm11536334b3a.59.2025.09.29.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:17:17 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 19:47:08 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: add the missing entries to the
 smem image table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-image_crm-v1-2-e06530c42357@oss.qualcomm.com>
References: <20250929-image_crm-v1-0-e06530c42357@oss.qualcomm.com>
In-Reply-To: <20250929-image_crm-v1-0-e06530c42357@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759155430; l=3539;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=u5cNG2Ln2eATor8RQIMsdKn7Fix2w6G9k7RgS5STwA0=;
 b=VQViHskVyyfYtK7gXmHv/Owxq+4rpwvx3SG0n9tp20YLge4pPhZwzTzieSYaTkuqeEESiBzLC
 ExHkGIPciDRCpAyY0UYDw52QHC963saR3G2wl3vz1wFMPUQtuGkEC5i
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX7Azfz4iMYRLi
 kdv2xMuNxZp8X4REP2VQX/JwnsfNzmgZqsyfja/CaMIkLIWctqXzDFB8fSYVElPQEICPWCda8n3
 yAeRNkQBjZZod9r1LGWpn87ScISojGEJhScbtAwxtwOQxUKi9JkFEhB54fBx5KtQ1FSpYo5zape
 kR4btfDAW+22dAXd7bhiPEQAiThnxxf6gnAd5HJBHlTG+bgD+Y7wLirR0TURrwsyS3dSgN82iBY
 4n9og2Hx9jdVAMO3rcJ32hmZDsMiZXPY8CUgIWIphaSwHrIUu/LzFNpnGO/O9gceu6crpn6vn85
 FRXq8mjblQFgSUevpvfLAmj9+g4WpiW2Uif37zXkRCzn7DeaYW3a8/3GrPgJbR3at03Ri/nKC10
 KktZ+4PIGAbrpbzB9v+/E3cMj70tJg==
X-Proofpoint-GUID: 9vyhpEHDXX5oa4IDi1BqMDAq8KXzs9Td
X-Proofpoint-ORIG-GUID: 9vyhpEHDXX5oa4IDi1BqMDAq8KXzs9Td
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68da94ef cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6TZun6eQlh8SgxM3ATMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_05,2025-09-29_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

Add the missing entries to the SMEM image table to ensure completeness,
rather than adding support for one image at a time.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8d25da4c7018452f463c6ff1e7ce605d5d0c6aab..5627fb6ffbdb23338ff5e26a05964a07439aeb56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -37,7 +37,13 @@
  */
 #define SMEM_IMAGE_TABLE_BOOT_INDEX     0
 #define SMEM_IMAGE_TABLE_TZ_INDEX       1
+#define SMEM_IMAGE_TABLE_TZSECAPP_INDEX	2
 #define SMEM_IMAGE_TABLE_RPM_INDEX      3
+#define SMEM_IMAGE_TABLE_SDI_INDEX      4
+#define SMEM_IMAGE_TABLE_HYP_INDEX      5
+#define SMEM_IMAGE_TABLE_ADSP1_INDEX	6
+#define SMEM_IMAGE_TABLE_ADSP2_INDEX	7
+#define SMEM_IMAGE_TABLE_CDSP2_INDEX	8
 #define SMEM_IMAGE_TABLE_APPSBL_INDEX	9
 #define SMEM_IMAGE_TABLE_APPS_INDEX     10
 #define SMEM_IMAGE_TABLE_MPSS_INDEX     11
@@ -46,31 +52,59 @@
 #define SMEM_IMAGE_TABLE_VIDEO_INDEX    14
 #define SMEM_IMAGE_TABLE_DSPS_INDEX     15
 #define SMEM_IMAGE_TABLE_CDSP_INDEX     16
+#define SMEM_IMAGE_TABLE_NPU_INDEX	17
+#define SMEM_IMAGE_TABLE_WPSS_INDEX     18
 #define SMEM_IMAGE_TABLE_CDSP1_INDEX    19
 #define SMEM_IMAGE_TABLE_GPDSP_INDEX    20
 #define SMEM_IMAGE_TABLE_GPDSP1_INDEX   21
+#define SMEM_IMAGE_TABLE_SENSORPD_INDEX	22
+#define SMEM_IMAGE_TABLE_AUDIOPD_INDEX	23
+#define SMEM_IMAGE_TABLE_OEMPD_INDEX	24
+#define SMEM_IMAGE_TABLE_CHARGERPD_INDEX	25
+#define SMEM_IMAGE_TABLE_OISPD_INDEX	26
+#define SMEM_IMAGE_TABLE_SOCCP_INDEX	27
 #define SMEM_IMAGE_TABLE_TME_INDEX	28
+#define SMEM_IMAGE_TABLE_GEARVM_INDEX	29
+#define SMEM_IMAGE_TABLE_UEFI_INDEX	30
+#define SMEM_IMAGE_TABLE_CDSP3_INDEX	31
 #define SMEM_IMAGE_VERSION_TABLE       469
 
 /*
  * SMEM Image table names
  */
 static const char *const socinfo_image_names[] = {
+	[SMEM_IMAGE_TABLE_ADSP1_INDEX] = "adsp1",
+	[SMEM_IMAGE_TABLE_ADSP2_INDEX] = "adsp2",
 	[SMEM_IMAGE_TABLE_ADSP_INDEX] = "adsp",
 	[SMEM_IMAGE_TABLE_APPSBL_INDEX] = "appsbl",
 	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
+	[SMEM_IMAGE_TABLE_AUDIOPD_INDEX] = "audiopd",
 	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
 	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
+	[SMEM_IMAGE_TABLE_CDSP2_INDEX] = "cdsp2",
+	[SMEM_IMAGE_TABLE_CDSP3_INDEX] = "cdsp3",
 	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
+	[SMEM_IMAGE_TABLE_CHARGERPD_INDEX] = "chargerpd",
 	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",
 	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
+	[SMEM_IMAGE_TABLE_GEARVM_INDEX] = "gearvm",
 	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
 	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
+	[SMEM_IMAGE_TABLE_HYP_INDEX] = "hyp",
 	[SMEM_IMAGE_TABLE_MPSS_INDEX] = "mpss",
+	[SMEM_IMAGE_TABLE_NPU_INDEX] = "npu",
+	[SMEM_IMAGE_TABLE_OEMPD_INDEX] = "oempd",
+	[SMEM_IMAGE_TABLE_OISPD_INDEX] = "oispd",
 	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
+	[SMEM_IMAGE_TABLE_SDI_INDEX] = "sdi",
+	[SMEM_IMAGE_TABLE_SENSORPD_INDEX] = "sensorpd",
+	[SMEM_IMAGE_TABLE_SOCCP_INDEX] = "soccp",
 	[SMEM_IMAGE_TABLE_TME_INDEX] = "tme",
 	[SMEM_IMAGE_TABLE_TZ_INDEX] = "tz",
+	[SMEM_IMAGE_TABLE_TZSECAPP_INDEX] = "tzsecapp",
+	[SMEM_IMAGE_TABLE_UEFI_INDEX] = "uefi",
 	[SMEM_IMAGE_TABLE_VIDEO_INDEX] = "video",
+	[SMEM_IMAGE_TABLE_WPSS_INDEX] = "wpss",
 };
 
 static const char *const pmic_models[] = {

-- 
2.34.1


