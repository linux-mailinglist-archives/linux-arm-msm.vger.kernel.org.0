Return-Path: <linux-arm-msm+bounces-86778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 315A8CE5F70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46836303B7CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 05:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D9A2C08DC;
	Mon, 29 Dec 2025 04:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jh3s9UuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJQiVbQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE3529DB99
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984181; cv=none; b=rpxo3ZjxHSa2v/HVwRsziynaL5FwUP2CWixSPVWK76F38vf3MihcF8WuNvg3zgIch3EMqFP3HMy/tA2/yaBC+7aNVrG0WTGpdMyYm1uuFJlZalcr5ay+L7Tzn8yEjlU4bgNujuSNGqKla9xLtDGNvsrwTiXK8aGEcMauNMI9mAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984181; c=relaxed/simple;
	bh=xDkyBPuRfFQUeONjgjh4SZDmWk1ekP9KQszR2YZ49MA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eOBcYeHzFcWBb+xeDeHEHlBHMtmFgvjR9EE37aNToyUfrsF80h1meo9q54xKQjzV4G2Rs0mr5QNX1jo4NufdWYXPekZD0TIaD4c1NKPHgPsMYQoyvgxr9244luCNYm+QiSRlDgd2BiVStuVDvS7fbDcgK83pW95QHFtL2vQ9j9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jh3s9UuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJQiVbQc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNujJC003811
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DgcATLdadUu
	BZeeDX28NTXhmDobAIOP7dtiFb52lyrc=; b=jh3s9UuM8CnyWgQNvy5UeW28/oU
	nx9/Rv/xjMTHQ5Tn5I6ruZFjL4J53wqMuhMgLs6tDFKGKnKNFOQO8b0lCbzxvOlJ
	oJPIGVQNWnHDZx6gUA75k4tzBmKTnpEbXi4/zVr9lT5Tj2ntU1mReyQBpdVibJeF
	if/OGtH/YshB4tUS0BpEI6YJOnLOOmues14z3QcjZdTT36XRIMchaUZuIcBR8XWn
	nWRhA7OirRjQ2MzDvEE1hAYb/dh4nV1mHUUyyzhdkmM+4d7BU9BqP6dD1QTwa2mA
	J+cO1t1/aqThFvNP+HjkT4jqRNSMpRu3LpgJUhGw1sRHfqa3vcl76m0dMUQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsbcu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:56:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b80de683efso16709187b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 20:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984176; x=1767588976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgcATLdadUuBZeeDX28NTXhmDobAIOP7dtiFb52lyrc=;
        b=CJQiVbQcgcBiB0Q0Jyhqmh9gmFmVzAURdZGkKYCCtavmLy/vMsoT1k1P5PiWXAoOjH
         aDAYk4XAUoh0cEJAPDHlX2bCvxcnvViqm+zBEqtSzcUprZDKJqVSAS2gPsNg327YVs+m
         64bWogFibeDlmuMBlyc9g0iiK1DtHHd5wKFJRDGIKtiSLDtzYlbTQ/IRunW9QnIgeoIY
         HpEF1ZfYDs/zh5PZxnUSwZuLX3w1l5AkTRqhJc17bObXgNH3ySbRW9tDpqpjFCg7pwCd
         /gQ3qhoJzJ4tu0Ts0l4s1C/NxCIuKaUAwOQjEdZZ4XN0PZSCzX9TbQml+EjTY+lQZLlx
         k9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984176; x=1767588976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DgcATLdadUuBZeeDX28NTXhmDobAIOP7dtiFb52lyrc=;
        b=srzuVyt6bUgVnSiW0bpXH3hoaYFe+F4eSvKsMLPjLgWP4NThvxXw+usXptkcnXN4D8
         fSEoPHeQuBpjhxseitR6BEeUP9m3uL7SnBtzGLJnwhA6RyuL81WMiAa0gsRWTrTMWUXW
         tWFe8lFHPM96sqnZLqcUc/axhW+S08PIiYqPX9lonBlLX17ZYoqD7zF3tLweQLLLxX0b
         pxngEm8q5fxTdp+gR0p0YWwubVnrjI7OFA2+M09Dk3quy8NX1vbfrUbk4a8GSBhFgUzF
         /Vnup6vYWvRQn3DUfaL55OU3kD7Zv05vwSKECYEdhqxAP1wZp+J5+wwetEGqE4FmKQ2K
         LxtA==
X-Forwarded-Encrypted: i=1; AJvYcCVoz8eWUFKnR3H4KoN+CR9WEsGPF+tV0Bn0gRNJiaQb2eUPx8a47fBxPWR8bYXehLVdj0HqwwA04HseEn7E@vger.kernel.org
X-Gm-Message-State: AOJu0YxU708ib+lG8KY2VXy1gsDxaL8nFs/qA28TcF17cUe8r8SlQOFP
	fKKfWym5qhi0T4LGjtOjbolsbDsXOdHHXNVcSzvC51sk7SZOfrh92JFYDzwqy7k6sOMG4N+j9aI
	VBno2HsaL+lTgddlFptxryj3uY/+G2RDMKBzPG2pkREUPoAQAoBR1FDpM+fFgHKyaM25/
X-Gm-Gg: AY/fxX4q81mVMa6mr0qRgG0WfFenaaD7pXaMRyJrh19faEmPIFVB/PE9AF9gteKYKvp
	USfWUK/3UcGsZbWsNLfTgfD/3/rgJZlGj7TCpE97ndqZPw5iONqUmY27hCtJQMqKtVi8rB/dS5y
	vY+Q/t1lJHr9S+Sp5cx14nI0MZXJ6v1mD2lEhaZ0Nw4Qc/2UxSw2sjJ48bARgI0OennZF6lUvf3
	6t/acrLiRiI1iEdA+B4QrT2EshsttBUO0aOoQKMuEwsIKdgAp+ixhFpTOY55IaMBsCe9cRjELpo
	HP5siUolGG2KABuyo5/zKNveKqxAs0uMNumdCUbcKu+l7Rcgzozx59ad3Guq02BOaQa4h2vF/sH
	VLNRhAEc83EHFFxnrcDiyzyja2Gd6kpDBnwV2C0jP7S8=
X-Received: by 2002:a05:6a00:35c8:b0:7e8:450c:61d3 with SMTP id d2e1a72fcca58-7ff66d5ff5bmr23897076b3a.67.1766984176262;
        Sun, 28 Dec 2025 20:56:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFQFtgkijnRI0mbZgW3UPaNSQWjaMGruw7XwhywjVT84L5lVpGyF1tXtPyD5vbzW9JZbPW7w==
X-Received: by 2002:a05:6a00:35c8:b0:7e8:450c:61d3 with SMTP id d2e1a72fcca58-7ff66d5ff5bmr23897058b3a.67.1766984175702;
        Sun, 28 Dec 2025 20:56:15 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:56:15 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v2 11/12] i2c: qcom-geni: Store of_device_id data in driver private struct
Date: Mon, 29 Dec 2025 10:24:45 +0530
Message-Id: <20251229045446.3227667-12-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BWn3jkX4VGKBsuLLd9zmxOZVI1ioETp6
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=695209f1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mUiiJuWc4wU39pmrI74A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: BWn3jkX4VGKBsuLLd9zmxOZVI1ioETp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfX8pKhBaKFqv1d
 hNPmIkmxeKyt0N/PtMvbH/QhpIHPY6zz6X29wyP1UKp6vz5cQ3h7M07+g2ZP4ZLEerthT+z480D
 YPezvhgtfTuGbqoZpvg8s8jjM/Eu48VgYYNSXrgU+w0Cr4iIEHgMQ+Z9LlKI5DVB3HZDdn4KboP
 r6FD5G+e/5no7HFsPAkFygDekv/ITr3c9H4SiuXIWAuIjjCtD/yEdy0P+f8dx9m/N6DVrgE8VUP
 VC4HmS9u4gsXJSisjOvp9plJprjKFXafvTiIGZatqgujam7cDI0aUMlZMzzuPHgsZ/s4x4r/l7i
 TARMjcvy4SgAY0Pj+eVLwvZ5oJFpezPcBqHoZ89TYx47sbrwXEyyMt01PBmpyF2TdQ9KaihS4up
 VACYZPIv5zqnRRY4DgW/NFhqqxVWb+uV7x15PNu8lRN8xodN6+qhfw4Lpq4JexXS4i4qewMtFAS
 cgyfk9cEHkk9uZi8QHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290042

To avoid repeatedly fetching and checking platform data across various
functions, store the struct of_device_id data directly in the i2c
private structure. This change enhances code maintainability and reduces
redundancy.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index b0a18e3d57d9..1c9356e13b97 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -77,6 +77,13 @@ enum geni_i2c_err_code {
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+struct geni_i2c_desc {
+	bool has_core_clk;
+	char *icc_ddr;
+	bool no_dma_support;
+	unsigned int tx_fifo_depth;
+};
+
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
 
 /**
@@ -121,13 +128,7 @@ struct geni_i2c_dev {
 	bool is_tx_multi_desc_xfer;
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
-};
-
-struct geni_i2c_desc {
-	bool has_core_clk;
-	char *icc_ddr;
-	bool no_dma_support;
-	unsigned int tx_fifo_depth;
+	const struct geni_i2c_desc *dev_data;
 };
 
 struct geni_i2c_err_log {
@@ -978,7 +979,6 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
-	const struct geni_i2c_desc *desc = NULL;
 	u32 proto, tx_depth;
 	bool fifo_disable;
 	int ret;
@@ -1001,8 +1001,7 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		goto err;
 	}
 
-	desc = device_get_match_data(gi2c->se.dev);
-	if (desc && desc->no_dma_support)
+	if (gi2c->dev_data->no_dma_support)
 		fifo_disable = false;
 	else
 		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
@@ -1020,8 +1019,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 
 		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
+		if (!tx_depth && gi2c->dev_data->has_core_clk)
+			tx_depth = gi2c->dev_data->tx_fifo_depth;
 
 		if (!tx_depth) {
 			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
@@ -1064,7 +1063,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	struct geni_i2c_dev *gi2c;
 	int ret;
 	struct device *dev = &pdev->dev;
-	const struct geni_i2c_desc *desc = NULL;
 
 	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
@@ -1076,7 +1074,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
-	desc = device_get_match_data(&pdev->dev);
+	gi2c->dev_data = device_get_match_data(&pdev->dev);
 
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
@@ -1215,6 +1213,10 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+static const struct geni_i2c_desc geni_i2c = {
+	.icc_ddr = "qup-memory",
+};
+
 static const struct geni_i2c_desc i2c_master_hub = {
 	.has_core_clk = true,
 	.icc_ddr = NULL,
@@ -1223,7 +1225,7 @@ static const struct geni_i2c_desc i2c_master_hub = {
 };
 
 static const struct of_device_id geni_i2c_dt_match[] = {
-	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };
-- 
2.34.1


