Return-Path: <linux-arm-msm+bounces-20122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EAA8CACCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 12:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D48C1F22D41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 10:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095DE7580E;
	Tue, 21 May 2024 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gzGpgTcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64F73186;
	Tue, 21 May 2024 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716288959; cv=none; b=d4Q1JX8wM/EdMb1ClHlNwrsO6zhJjjlGgvqJPb1yZ4D8sYX1kUkn12dYH1ElmgctZ/w3tZkvHb6FuROXne2tlzwx9CIg2w7piOAJiSVDVi5zPwNhQiBm7cSJ3XqxwsoCuKE2o3dq+a0oJMlzQbONuGgu+WftYu26UIjzvJyIsIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716288959; c=relaxed/simple;
	bh=ImhDpqVIl/uwnAVkut4Vb5tY8zW7+T/6QL2m9Hx4PKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fC46QkFXez4HFUADb3D6t9kL96fQcA/7CtZFoCj4N35WRRYgzVeADcZdZlK2gz5cpuIyb0FNrUTmwKkeAddW0g68QgTKvW2VACD9iQq8W1JqNZ40/J/ASyPPFeRV3fEStnW3t7bAYK1bFrbFkocm3rYbxptwIy6178O/qmPEnqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gzGpgTcF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LAFSZO010132;
	Tue, 21 May 2024 10:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=Jm5HOXh
	2e639lEbrPeLJLOXt/sC9rcS+bD16FQlbAUw=; b=gzGpgTcFL+cKFdAlQDP4T+S
	2J3oGkrR5vbS2O91O79BOJse0JH/vSBgvnK2AHhNzZ/IwhgJdCeuYVF5oLuPsqFF
	JvaJTva9hsyirC6jSCRJzbDeGcvf1TMCEwQPb1VOQCYdHwpSZAVdOdOcRG8djflH
	7j5a0b8JJv/B5PKz9rPYXfo00LiYL12CkdsOls1WoX5+hEFOe4/Z/jCfdzEtxGTD
	kww9f3d36fX+2Holv9B3EASykY4+KI1DGRnKYpUQUj289RZcbtaIFvVvXgLsGxO/
	GjVZpOVopcGPtUbOnWl745JOWEO4Sui7OE3vFqSeLFSxSDskPmzVDstuzhuyNAw=
	=
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqanf2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 10:55:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44LAtZd7024601;
	Tue, 21 May 2024 10:55:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3y6ndkytmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 10:55:36 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44LAtajT024637;
	Tue, 21 May 2024 10:55:36 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44LAtaAl024630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 10:55:36 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id 3101841587; Tue, 21 May 2024 16:25:34 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        quic_mdalam@quicinc.com
Subject: [PATCH v6 5/8] drivers: mtd: nand: use FIELD_PREP and GENMASK
Date: Tue, 21 May 2024 16:25:29 +0530
Message-Id: <20240521105532.1537845-6-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521105532.1537845-1-quic_mdalam@quicinc.com>
References: <20240521105532.1537845-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8wOkTb79LeuRQWKD5f5ccLePqWD54F_m
X-Proofpoint-ORIG-GUID: 8wOkTb79LeuRQWKD5f5ccLePqWD54F_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_06,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405210082

Use the bitfield macro FIELD_PREP, and GENMASK to
do the shift and mask in one go. This makes the code
more readable.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
Change in [v6]

* Added FIELD_PREP() and GENMASK() macro

Change in [v5]

* This patch was not included in [v1]

Change in [v4]

* This patch was not included in [v4]

Change in [v3]

* This patch was not included in [v3]

Change in [v2]

* This patch was not included in [v2]

Change in [v1]

* This patch was not included in [v1]


 drivers/mtd/nand/raw/qcom_nandc.c    | 97 ++++++++++++++--------------
 include/linux/mtd/nand-qpic-common.h | 31 +++++----
 2 files changed, 67 insertions(+), 61 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index cced35d6d870..5028969f2fbf 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -274,7 +274,7 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
 				(num_cw - 1) << CW_PER_PAGE;
 
 		cfg1 = host->cfg1_raw;
-		ecc_bch_cfg = 1 << ECC_CFG_ECC_DISABLE;
+		ecc_bch_cfg = ECC_CFG_ECC_DISABLE;
 	}
 
 	nandc->regs->cmd = cmd;
@@ -1485,42 +1485,41 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	host->cw_size = host->cw_data + ecc->bytes;
 	bad_block_byte = mtd->writesize - host->cw_size * (cwperpage - 1) + 1;
 
-	host->cfg0 = (cwperpage - 1) << CW_PER_PAGE
-				| host->cw_data << UD_SIZE_BYTES
-				| 0 << DISABLE_STATUS_AFTER_WRITE
-				| 5 << NUM_ADDR_CYCLES
-				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_RS
-				| 0 << STATUS_BFR_READ
-				| 1 << SET_RD_MODE_AFTER_STATUS
-				| host->spare_bytes << SPARE_SIZE_BYTES;
-
-	host->cfg1 = 7 << NAND_RECOVERY_CYCLES
-				| 0 <<  CS_ACTIVE_BSY
-				| bad_block_byte << BAD_BLOCK_BYTE_NUM
-				| 0 << BAD_BLOCK_IN_SPARE_AREA
-				| 2 << WR_RD_BSY_GAP
-				| wide_bus << WIDE_FLASH
-				| host->bch_enabled << ENABLE_BCH_ECC;
-
-	host->cfg0_raw = (cwperpage - 1) << CW_PER_PAGE
-				| host->cw_size << UD_SIZE_BYTES
-				| 5 << NUM_ADDR_CYCLES
-				| 0 << SPARE_SIZE_BYTES;
-
-	host->cfg1_raw = 7 << NAND_RECOVERY_CYCLES
-				| 0 << CS_ACTIVE_BSY
-				| 17 << BAD_BLOCK_BYTE_NUM
-				| 1 << BAD_BLOCK_IN_SPARE_AREA
-				| 2 << WR_RD_BSY_GAP
-				| wide_bus << WIDE_FLASH
-				| 1 << DEV0_CFG1_ECC_DISABLE;
-
-	host->ecc_bch_cfg = !host->bch_enabled << ECC_CFG_ECC_DISABLE
-				| 0 << ECC_SW_RESET
-				| host->cw_data << ECC_NUM_DATA_BYTES
-				| 1 << ECC_FORCE_CLK_OPEN
-				| ecc_mode << ECC_MODE
-				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_BCH;
+	host->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, (cwperpage - 1)) |
+		     FIELD_PREP(UD_SIZE_BYTES_MASK, host->cw_data) |
+		     FIELD_PREP(DISABLE_STATUS_AFTER_WRITE, 0) |
+		     FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+		     FIELD_PREP(ECC_PARITY_SIZE_BYTES_RS, host->ecc_bytes_hw) |
+		     FIELD_PREP(STATUS_BFR_READ, 0) |
+		     FIELD_PREP(SET_RD_MODE_AFTER_STATUS, 1) |
+		     FIELD_PREP(SPARE_SIZE_BYTES_MASK, host->spare_bytes);
+
+	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, bad_block_byte) |
+		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 0) |
+		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+		     FIELD_PREP(WIDE_FLASH, wide_bus) |
+		     FIELD_PREP(ENABLE_BCH_ECC, host->bch_enabled);
+
+	host->cfg0_raw = FIELD_PREP(CW_PER_PAGE_MASK, (cwperpage - 1)) |
+			 FIELD_PREP(UD_SIZE_BYTES_MASK, host->cw_size) |
+			 FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+			 FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
+
+	host->cfg1_raw = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+			 FIELD_PREP(CS_ACTIVE_BSY, 0) |
+			 FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
+			 FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
+			 FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+			 FIELD_PREP(WIDE_FLASH, wide_bus) |
+			 FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
+
+	host->ecc_bch_cfg = FIELD_PREP(ECC_CFG_ECC_DISABLE, !host->bch_enabled) |
+			    FIELD_PREP(ECC_SW_RESET, 0) |
+			    FIELD_PREP(ECC_NUM_DATA_BYTES_MASK, host->cw_data) |
+			    FIELD_PREP(ECC_FORCE_CLK_OPEN, 1) |
+			    FIELD_PREP(ECC_MODE_MASK, ecc_mode) |
+			    FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, host->ecc_bytes_hw);
 
 	if (!nandc->props->qpic_version2)
 		host->ecc_buf_cfg = 0x203 << NUM_STEPS;
@@ -1874,21 +1873,21 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	nandc->regs->addr0 = 0;
 	nandc->regs->addr1 = 0;
 
-	nandc->regs->cfg0 = 0 << CW_PER_PAGE
-			    | 512 << UD_SIZE_BYTES
-			    | 5 << NUM_ADDR_CYCLES
-			    | 0 << SPARE_SIZE_BYTES;
+	host->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
+		     FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
+		     FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+		     FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
 
-	nandc->regs->cfg1 = 7 << NAND_RECOVERY_CYCLES
-			    | 0 << CS_ACTIVE_BSY
-			    | 17 << BAD_BLOCK_BYTE_NUM
-			    | 1 << BAD_BLOCK_IN_SPARE_AREA
-			    | 2 << WR_RD_BSY_GAP
-			    | 0 << WIDE_FLASH
-			    | 1 << DEV0_CFG1_ECC_DISABLE;
+	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
+		     FIELD_PREP(CS_ACTIVE_BSY, 0) |
+		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
+		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+		     FIELD_PREP(WIDE_FLASH, 0) |
+		     FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
 
 	if (!nandc->props->qpic_version2)
-		nandc->regs->ecc_buf_cfg = 1 << ECC_CFG_ECC_DISABLE;
+		nandc->regs->ecc_buf_cfg = ECC_CFG_ECC_DISABLE;
 
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
 	if (!nandc->props->qpic_version2) {
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 17d9d131639f..efdd7800f428 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -70,35 +70,42 @@
 #define	BS_CORRECTABLE_ERR_MSK		0x1f
 
 /* NAND_DEVn_CFG0 bits */
-#define	DISABLE_STATUS_AFTER_WRITE	4
+#define	DISABLE_STATUS_AFTER_WRITE	BIT(4)
 #define	CW_PER_PAGE			6
+#define	CW_PER_PAGE_MASK		GENMASK(8, 6)
 #define	UD_SIZE_BYTES			9
 #define	UD_SIZE_BYTES_MASK		GENMASK(18, 9)
-#define	ECC_PARITY_SIZE_BYTES_RS	19
+#define	ECC_PARITY_SIZE_BYTES_RS	GENMASK(22, 19)
 #define	SPARE_SIZE_BYTES		23
 #define	SPARE_SIZE_BYTES_MASK		GENMASK(26, 23)
 #define	NUM_ADDR_CYCLES			27
-#define	STATUS_BFR_READ			30
-#define	SET_RD_MODE_AFTER_STATUS	31
+#define	NUM_ADDR_CYCLES_MASK		GENMASK(29, 27)
+#define	STATUS_BFR_READ			BIT(30)
+#define	SET_RD_MODE_AFTER_STATUS	BIT(31)
 
 /* NAND_DEVn_CFG0 bits */
-#define	DEV0_CFG1_ECC_DISABLE		0
-#define	WIDE_FLASH			1
+#define	DEV0_CFG1_ECC_DISABLE		BIT(0)
+#define	WIDE_FLASH			BIT(1)
 #define	NAND_RECOVERY_CYCLES		2
-#define	CS_ACTIVE_BSY			5
+#define	NAND_RECOVERY_CYCLES_MASK	GENMASK(4, 2)
+#define	CS_ACTIVE_BSY			BIT(5)
 #define	BAD_BLOCK_BYTE_NUM		6
-#define	BAD_BLOCK_IN_SPARE_AREA		16
+#define	BAD_BLOCK_BYTE_NUM_MASK		GENMASK(15, 6)
+#define	BAD_BLOCK_IN_SPARE_AREA		BIT(16)
 #define	WR_RD_BSY_GAP			17
-#define	ENABLE_BCH_ECC			27
+#define	WR_RD_BSY_GAP_MASK		GENMASK(22, 17)
+#define	ENABLE_BCH_ECC			BIT(27)
 
 /* NAND_DEV0_ECC_CFG bits */
-#define	ECC_CFG_ECC_DISABLE		0
-#define	ECC_SW_RESET			1
+#define	ECC_CFG_ECC_DISABLE		BIT(0)
+#define	ECC_SW_RESET			BIT(1)
 #define	ECC_MODE			4
+#define	ECC_MODE_MASK			GENMASK(5, 4)
 #define	ECC_PARITY_SIZE_BYTES_BCH	8
+#define	ECC_PARITY_SIZE_BYTES_BCH_MASK	GENMASK(12, 8)
 #define	ECC_NUM_DATA_BYTES		16
 #define	ECC_NUM_DATA_BYTES_MASK		GENMASK(25, 16)
-#define	ECC_FORCE_CLK_OPEN		30
+#define	ECC_FORCE_CLK_OPEN		BIT(30)
 
 /* NAND_DEV_CMD1 bits */
 #define	READ_ADDR			0
-- 
2.34.1


