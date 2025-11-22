Return-Path: <linux-arm-msm+bounces-82938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F09AC7C7A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 06:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9EC9935C4BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 05:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44F32D46C0;
	Sat, 22 Nov 2025 05:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2A9yWiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYT2vFif"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E852F2D46B6
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787708; cv=none; b=kaHd6iTKqIkT83dWl9oYyxH55I+pC0LAb4F9Xaixv5x4DeMJD20VGbjCsJ96X5kadVjD6btZZEsvEgK9ZEBnwJZQoaiH6VpRUimQu27e/P71b61r4GCcgfpvvViaLBdjN9xtFZb5dRyJn0/paTJEKR/ynIZwubdAdESaB3mWMrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787708; c=relaxed/simple;
	bh=mbJR727ggrtrvgHXfUkmla3xXcuIgQNfVcXl74QOnS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bvkPBbV383TVErjNKPvcE/c/AlKCFKIzGJ+4ZKGEeK8b0HA2oADaECVZ9le1/HIMlaccf9ykgrDfHYO4K9rAwKh75jf2NdxP1p8b+jwYLmdh8yyP6FtbXoii8GXJ2So4tW/70S4N5leng/YJ4Q6ZpOgrdrz0Dj9z1zDZxiAozwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2A9yWiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYT2vFif; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4buvh1585240
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cYCVHWiTnrq
	EYRLdnl7gmKSduhx1q7VxqZ9bihRVOkM=; b=Y2A9yWiH2h8PnKlKwMmELGn/esn
	4YP6EU39sTHCsSRqvo/cuRSZg+yrY5MxHmJpbHiOy3QqeGNjgt9rOROTNLpt+f6K
	w8ZOqGKEMObVdf2EKkWDFNfUcU1tFA9d3wBH4+uNbATFmVOV30JeokbKx3oh0RRa
	vq6U6S/ptnBdwH6HdG7C9BYbbELwZx8zMUPQLtz2h8HejgYIX+tfgbg0jwdvwbkn
	zh/3E/MDnupynFWrk5D5i6bsh57gp5j5rvTqzhOxSe0alwozGx2rXrZB1bImnMPR
	3sx/sctzhpg0hmZCE4Dhp3fsYdbGdTUC+53pIBOFmkwkk4ro5F2VsSgP8HA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69er19n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-298535ef0ccso29235525ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787705; x=1764392505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYCVHWiTnrqEYRLdnl7gmKSduhx1q7VxqZ9bihRVOkM=;
        b=HYT2vFifSwdIHkpKVzdByw77aKDuIh0hhPeRbUjpXn7yhEnTZ1jBXFrO3syX88g8Uz
         lkbdWz3H+MBdLdgAybSvstXIYNFGdy/H1V9z09ny0y4IC2+11gPN3+IWnmQCW1h643Uq
         3D3RUcWooWPsMkMyQL8RiDTF94Oq9esM09c8L3bLu2VtqevUZcH/Wf0B/b2qqVbo7hcN
         EUauQr6T2Im7l2MEsi64PwE3ajjoRCqnZG2fmx7jDJRsT3BEjAd83Ds4qPr7MEnj+Vj6
         nRxjj9kDM9E2yzlp9bMl6iF1rcqJMwlxE/gkI0QCt2Myq5d3BeVMmXDfmaXPhQX4/+3P
         /DZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787705; x=1764392505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYCVHWiTnrqEYRLdnl7gmKSduhx1q7VxqZ9bihRVOkM=;
        b=FoRDp3A2kmyjvT57ZntuUKSvkU3unEO96z1B9cdg1XGVjIe//tZgGu+3xn4y8Ik8w5
         dlMpTJeiX/sHACEslYtj8Wjpk/AKk6UYExtYof9js8XVBCV2LMRJSUowGmWZD+5z0Hcy
         FcorbLZyE9QEFIrAmjjuoCDzjQ3QURzSHAx9ax19ZU+xKMASg6V/EuXHDiKwmR46/XDO
         VcmEwtElxEIhzE6O4N1Hb7Tr1Yq6Y9UDO9j/ku8aKEYVIE5v/IE1zLQ/eY2ocK8XdlCV
         2hue2PVOP36fvuBruHDOVvLOFBDskw4uF6YacSMWmo/zxxy9dAMKZszBKlxLJLruhRuL
         X/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHzhd9E5GUHN84Zy665RvrdmwwMIgnFlV1Har0rJWU05G+VBa9E50IQalpZ+Ohuh1uFTEzv3q1AQtrP9+s@vger.kernel.org
X-Gm-Message-State: AOJu0YyHoYpehRWD8VFwqOPdvFOiz7TmvMs2tsrpLnpMbMREWBwxw+sn
	s+0kTCTqPWdGrTk0O7mNgmZz/N/vkELUabzYVTO4mwh+YaR0ijE3XEjBfOAvnbisBuMKEuchPyL
	o+mJhhKxNYGKcszmjH9qewG1cuQHwxd4DWfaGwtrhI2rvbmSrl6Pf8QpahOUx+26R3bE1
X-Gm-Gg: ASbGncvpiIYZ+PPKwpZmNIQE5/pDpjxY4wAFixK2S4h7QrJJ5ThYYpyTCrp0tz+pMi3
	nj1g1g8BthcooBpreV1Jj/6cG6YfY3SyYMZ1SqIeR33F6tbcCA+hU9DvKVztSU1/jMTbYofXSwR
	2HzkhltZTfI0J76druP5ugepVbF3L5cc02EpiYP+4jjL+hEcpYuMrJ22lb2awEVezcHrfi6ZF5D
	sj8oF5rJWv8GjsmaGCqP5H0ArvExvoPrL0EJZFbzkvLgxyh6B4ek+kDsVZo10fR2By6YxAiX8W8
	bEh/skzcnlvcdWVf4HCblP0FZqq1KSuiTRe3jPQ494n2ZLRaSKyrqQSwpQWqdOQkVo4p1J5z90T
	N4HFJKR6zi6ZOa3li+GflCrCzl6MPS3w8B//8ELvW4BU=
X-Received: by 2002:a17:902:d588:b0:295:c2e7:7199 with SMTP id d9443c01a7336-29b6bf38528mr51869615ad.29.1763787705417;
        Fri, 21 Nov 2025 21:01:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8OAiROK7F5GVWbTxASpswDLwPXSs+Afy8DSzGXuPGImfgg2wHiAcv4P7FgsnG632nij/7gQ==
X-Received: by 2002:a17:902:d588:b0:295:c2e7:7199 with SMTP id d9443c01a7336-29b6bf38528mr51869315ad.29.1763787704849;
        Fri, 21 Nov 2025 21:01:44 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:44 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: [PATCH v1 11/12] i2c: qcom-geni: Store of_device_id data in driver private struct
Date: Sat, 22 Nov 2025 10:30:17 +0530
Message-Id: <20251122050018.283669-12-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX3W8iCPy7udI5
 FYP4eylVfR9IKj95E53czqiYyGuDTy5Sg/0Fq2X2RkBu/xi8kiU9xxX2vFwA7immlSoDK7OqbAb
 UCCSe/m9ENawvIZOltWalHuLBn/oiLS1H7rNcnVleSwDjwy1k/QC6zjRrK2II7+KVpZOCSyq+dk
 VbZfL4bqJggm2yog+gNG+rs7bZW1gR/aURJUSgrrqdejOzbXIS0T3EusVNwsazHii4xG6ZAj59f
 D2NBagYfN4s/n9nJ93GwTMFasFE4yQ6QeG8o1d2KeCQhxCTzSNpnbAcWh0cZHHL5gpFcZurmiPM
 OKtPFjUnuNR4sv5VoMk2wKjcuxGoeem0JdhebFJVGm4GE3k1L24BKOd/HH2jxt7MDvXFhdtPvx3
 R+ABW3PfLIiFMZlTJU4CGKd2+GwUIw==
X-Authority-Analysis: v=2.4 cv=cMjtc1eN c=1 sm=1 tr=0 ts=692143ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mUiiJuWc4wU39pmrI74A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: cd47KM1paFn-LNRgUAx5u371mWbAPMOL
X-Proofpoint-GUID: cd47KM1paFn-LNRgUAx5u371mWbAPMOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

To avoid repeatedly fetching and checking platform data across various
functions, store the struct of_device_id data directly in the i2c
private structure. This change enhances code maintainability and reduces
redundancy.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ea117a4667e0..a0f68fdd4078 100644
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
@@ -1221,6 +1219,10 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+static const struct geni_i2c_desc geni_i2c = {
+	.icc_ddr = "qup-memory",
+};
+
 static const struct geni_i2c_desc i2c_master_hub = {
 	.has_core_clk = true,
 	.icc_ddr = NULL,
@@ -1229,7 +1231,7 @@ static const struct geni_i2c_desc i2c_master_hub = {
 };
 
 static const struct of_device_id geni_i2c_dt_match[] = {
-	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };
-- 
2.34.1


