Return-Path: <linux-arm-msm+bounces-38292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E719D225F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 10:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1ABB1F21F0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 09:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998CF19AA5F;
	Tue, 19 Nov 2024 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="batE1SnC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54811547EE;
	Tue, 19 Nov 2024 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732008112; cv=none; b=PIXd7cUp1nBDEOdtlobNF945VWKyvihnMko9+DazYxnCMrHlOTYVuWDM2Wd499wGBLM3pN2MSKqXtx6276/b+WvTISF7S7ZrbjwVKnogMwEioIm2laZswm4B+AuQgWQHKrO+erLF3IgjI80pB227lHN5QzLzj6LMqUcpDYnOZBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732008112; c=relaxed/simple;
	bh=/j2I4g+rYH/3a114FWr77p/Yykz/1Ov8o7JDJz0SOk4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YHw+FMecoPmVfOXO4T7/yEKQelIb9/6lYaot4F1HhhTKb2jxFXyLUg2LfsihUJf2BUSis7veWtUutjSIyiu6JgmnIQHuFLI28tLApoY9ZLPH7R/z4pNSlOxaZ5z5hRBlUDcB5C8e7sNKLVEEhYGqabHEDYJAfcS2t4h6xAXxguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=batE1SnC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7iGMc027069;
	Tue, 19 Nov 2024 09:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LhSesRt9sczyMSScMRjjR0dE/DjPc0iZVrdlhVF+k8=; b=batE1SnCyNsZpjIx
	e4vL8j5Q8NnzkXEj/8SjvN3pPC9v9t9VwqyVIZUooUlUFw5Y8m3Hr2IG0Gd7k3/z
	0b0ce5hKOUR1dpHHgCvoImoehhJm7qnwYfvzp4e4pUWw5BKYTLGBMe3aSG0WvFW4
	cQi+lp6WEzEt3zSeviRJiDH1ygtQ7rSDZPnGJuxc136qAlkYiaAtdng0tyUIHKIa
	F1ZaH1QvaOMWshYqnuLjfaoj1302xEq0GowrV/WLkD094MEeoVo1d1972STISz0v
	nqjYMEfHdVozc2GsCIv91Uz+n435ubbMlPALTQga7EKRgcXsmwb0kUmiopgVdzN3
	BV91AQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7t2vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:21:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ9LPXF011340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:21:25 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 01:21:21 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 1/2] mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
Date: Tue, 19 Nov 2024 14:50:57 +0530
Message-ID: <20241119092058.480363-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119092058.480363-1-quic_mdalam@quicinc.com>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RNnmaA8_DdGfWm1N8rfnBU5KbuoQws6U
X-Proofpoint-GUID: RNnmaA8_DdGfWm1N8rfnBU5KbuoQws6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190067

Currently we are configuring lower 24 bits of address in descriptor
whereas QPIC design expects 18 bit register offset from QPIC base
address to be configured in cmd descriptors. This is leading to a
different address actually being used in HW, leading to wrong value
read.

Older targets also used same configuration (lower 24 bits) like sdxpinn,
ipq etc. but issue is masked in older targets due to lower 18 bits of QPIC
base address being zero leading to expected address generation.

Sdxpinn     : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
Sdxnightjar : QPIC_QPIC | 0x07980000 (Lower 18 bits are zero) Same for
older targets.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b8cff9240b28..34ee8555fb8a 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -207,7 +207,7 @@ nandc_set_reg(chip, reg,			\
 #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
 
 /* Returns the NAND register physical address */
-#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
+#define nandc_reg_phys(chip, offset)  ((nandc)->props->offset_from_qpic + (offset))
 
 /* Returns the dma address for reg read buffer */
 #define reg_buf_dma_addr(chip, vaddr) \
@@ -561,6 +561,7 @@ struct qcom_nandc_props {
 	bool is_qpic;
 	bool qpic_v2;
 	bool use_codeword_fixup;
+	u32 offset_from_qpic;
 };
 
 /* Frees the BAM transaction memory */
@@ -3477,6 +3478,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
 	.is_bam = false,
 	.use_codeword_fixup = true,
 	.dev_cmd_reg_start = 0x0,
+	.offset_from_qpic = 0x30000,
 };
 
 static const struct qcom_nandc_props ipq4019_nandc_props = {
@@ -3484,6 +3486,7 @@ static const struct qcom_nandc_props ipq4019_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.dev_cmd_reg_start = 0x0,
+	.offset_from_qpic = 0x30000,
 };
 
 static const struct qcom_nandc_props ipq8074_nandc_props = {
@@ -3491,6 +3494,7 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.dev_cmd_reg_start = 0x7000,
+	.offset_from_qpic = 0x30000,
 };
 
 static const struct qcom_nandc_props sdx55_nandc_props = {
@@ -3498,7 +3502,8 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.qpic_v2 = true,
-	.dev_cmd_reg_start = 0x7000,
+	.dev_cmd_reg_start = 0x0,
+	.offset_from_qpic = 0x30000,
 };
 
 /*
-- 
2.34.1


