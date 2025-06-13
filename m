Return-Path: <linux-arm-msm+bounces-61234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF75AD8EFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 015E51BC2AD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724A02D9ED5;
	Fri, 13 Jun 2025 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzWy+4yJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8FD2D5C7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823477; cv=none; b=Br2wkPb3mWC6YUG2pDPKiMpvEQVzpiuwkzfeLcjTJ08XbNp6d6F7hTjirFkFgqQpksu96wcS0lrBG5cU5DOM+KI6FyG5oEURrr4FQPF9djRSp8yTCOmr+jBH8boGY5t2LW/5NJmLHOuhGygZUezPzjCU/VYQ7vn+tc9I3Q5JaBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823477; c=relaxed/simple;
	bh=R3NiWYA6kgddHMiBWO3ir8vpi4s+0r3d1/p6pCY92uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nFLfJqAmsm9Bx2b7hE7j1hBd7iLBHsQf4kJ+IeGatmfTVAikSfvgw+hl4wTEK/1EmgSdsCBAwdWlUUQd8aztGiSH2swQJJ+xWvmHnxUONmJ6n1P5z30XhOz4iO+S9anKiU/0kUnr9oXjh933MY8kuUcZkJMOZHhIgO5TXZltjbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzWy+4yJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D94Rqv027178
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imWvnWvbJlX
	5oc0s6sKOCcLJcc3gmwA4+SPySO+ydLU=; b=YzWy+4yJeRfNTX8XeSouAcdGnAK
	ZrXS5ggkFYyeyAwXXTzDhxZLoWYnExFjDok5ED5s35S0U4dMbFyTgNQgDcRT7mfG
	0LAQrkbHp4cZ0IqSxE6SqDBHh3oFBhF2ZLzpGtetLq6uI017RsGaj5OK4HbI1VJF
	FYxv/tPg/tHOw6ececAec4SnCzl/CBCzm0gwGv/kr6rex7K7eS98yxdk8F9FE1pi
	TDYqrCmWKxMYZ1EsndJ/ofBXcqHa6I58LtdHhTeUfrPCc9IqlkQKth4WPRAx8qZI
	A+SMry/TNpUUp//k4OduMBukFWfWzrDd/QaRrDj5j7OFbW890kv8oows/ig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvkmf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234b133b428so15438455ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823474; x=1750428274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imWvnWvbJlX5oc0s6sKOCcLJcc3gmwA4+SPySO+ydLU=;
        b=mBKKk7srHG1UFSJ62ab69TDKq2nuMsTrv153B033inzq7hzulhXJSe0E8K7bFBiyli
         TCB1Xf40WZxx3baU3nE0E3Hmu4/+rEffpqoIAYsphbJLcugij5jx72VC5lNLUcUKKhzJ
         tEnr6wsN7ByKRfh4QzJhDcdrlhIO+iXv9HAO/yYa53X/H88jvnSYPZk23NrIbhCZPUnN
         kFmpEAhmzYIA4Li3nYMMDqAoh4lCuCjNOf4sGjbjg5LFnZt0pqU0PvW7bwOMf2dWMaN0
         7AKDl/syAMsT3qoHnUJ2Sd7Pe7x99o5v9NaK8EYv0FhOFqi/Vdo6dhGUfRx9AkDTzVbs
         thAQ==
X-Gm-Message-State: AOJu0YyjdMtRBDbLBm7M7kLiCRh9OCQcSLNepKMIqLjdMK1t4BNy3AVe
	OeWUtxfUOaZwg4Id4iTNmbVZGdwu9LlmZMjygk1IhQq1PTgGSAqmiz0+wHpEiSuWsn3MnHV2CRe
	6CKHFqiJ5wXjkgfjFm0unWPLilnH+Kcxpd4IpL1hv1ucMvSw0rNySOw9eYJ1t51t/uWcW
X-Gm-Gg: ASbGncuc+OwKLH98ucJ0TKQb77csQpk3KQusAvGIxA7oNyLRLtAGt94oeOEI38pqMES
	dd5NHxHwsjbN8SfM4QtnxsHPWzLoyQUETQ1REkrkd5VHcn6cTbX75WdQTlQA0qVq8iE3lHLuW6g
	LnQzPUymjlhQz0sbqFUvdoS8OBO3wTlK06CwaWxrv+ZVKIyKxQ8RPv8IAPK+Y462jXWVJMsIEA0
	VkIzmeij9g2wYKE88lGOzGDdZGjGBH1Y16WaJvk5SdLAAeBKIhsJUzTHQjIs+mpmce4WeDza+8r
	iuyD0nkFVTEwI/aczfYuZNdzsHY7CV5kaAWoCHhl8bkO/+Yplq70n36iNKyJcwxPdZZlTwwhIiF
	c
X-Received: by 2002:a17:902:dac4:b0:223:4537:65b1 with SMTP id d9443c01a7336-2365dc34597mr46376365ad.36.1749823473111;
        Fri, 13 Jun 2025 07:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGokbzd2JnXLw/G0v+GhIQGYqaRbjI8iFogXgFN8uc9fiV1mee+ivB1odTvwJXOn83pvOiTng==
X-Received: by 2002:a17:902:dac4:b0:223:4537:65b1 with SMTP id d9443c01a7336-2365dc34597mr46374855ad.36.1749823471406;
        Fri, 13 Jun 2025 07:04:31 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:30 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Fri, 13 Jun 2025 16:04:02 +0200
Message-Id: <20250613140402.3619465-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E3swj1Hoya8L7sN5XfnYat0S6EsAnE_y
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684c2ff2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5jRkx2jbz5RiTHLqnWMA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: E3swj1Hoya8L7sN5XfnYat0S6EsAnE_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX6AXzteA5QFFY
 wPfIAHLNvjkgUePVWF/GMPSOqA0VD4vWCQrQWbQkJ/0VYVxQSL7wY2XACcT2E1XwCm/vVe/c7xi
 tnTiqH7xG36LZeSbG3QdnbA+JcmYGfOvG8RLJm3h476A834+LzorOsLG0nEAkMlXnxfuUgsvM71
 9hNhNgOxirUfM0lzvncpXx+51CBuoBVdcQY/1HjNij/WvkmqKR+F3z4WjRbUmRqhabBZV4/Dghd
 q+LbPRMLCdVVng3dEEhx2c3GWcZiTCt8tndfswgGp372TX4iD2xslzx/+hD8T7nNyID4go9D4ww
 e/FkmCK3d6vUOPh+1ySybpp5YUxdlDCKSv/wq8RDGR1xpB0fya7mhfsXkjxn3k2vSN35fyAYNC6
 pxRZ3ixTwH80dFJbZQEZLpnLMKPIJRRtcGQ515BJkTq8lZ4NKguPnerFHS0ZYPi4pE3yGl4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103

Add a qcm2290 compatible binding to the venus core.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 736ef53d988d..f1f211ca1ce2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl qcm2290_freq_table[] = {
+	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
+	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
+};
+
+static const struct bw_tbl qcm2290_bw_table_dec[] = {
+	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
+};
+
+static const struct venus_resources qcm2290_res = {
+	.freq_tbl = qcm2290_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
+	.bw_tbl_dec = qcm2290_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
+	.clks = { "core", "iface", "bus", "throttle" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx" },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_6XX_LITE,
+	.vpu_version = VPU_VERSION_AR50_LITE,
+	.max_load = 352800,
+	.num_vpp_pipes = 1,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/venus-6.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.34.1


