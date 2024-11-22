Return-Path: <linux-arm-msm+bounces-38798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5D9D5B6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30D9BB22974
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFFD1DE2A5;
	Fri, 22 Nov 2024 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NXecoCDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290141DDA00;
	Fri, 22 Nov 2024 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266020; cv=none; b=fe+XrQtwUBYbcqaU72BwSgVrc5RXf6BFBbjrB1zqDdKtbVOUvkIdjscXLT/7jYoOXn4kb5qKc8IjUbYLGGHo65D7wRqnCoHYSRksslTx6Z0Zm1NAtXAaUMLGGclpadPz9Xybnc27mHNIG1T/Dfdxg7U6HXJCYVyhvMMgTDWM2sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266020; c=relaxed/simple;
	bh=hD45CYGpG6jUWQUmyN0/v/63OKKyqwATyTFtCQneoY0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=At2HcY78I38GZvQxPEJPusdKUQtJlulhHhIKvzy3n40fXq15KL2WabWvP6zmVe2vx9+Cyttlh725hc2j0jFqfTuuvjgiGgLdMHNJ/zUSeZJRGt5u33CFVxmBEf0IzcL69lctC8ZkZXfzl65dad2zdTeOSz1S8V2BzHC1oPaKp2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NXecoCDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2MwJ9027721;
	Fri, 22 Nov 2024 09:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VONkYfjy0I+6ovntvwwQZ8DWBbOjQW91xna3prVvaKU=; b=NXecoCDYjxzO+O5P
	bhyxazw0ZDw+c5m4FOanWn3412gSHmH1fPYXpl51u7Vv/uBPa6hkg0QjgK4uVf/W
	IF9IlwqoU/qzYLIBEQoh6SPv/L/96wVkFSZxshPGfDWeb7G6BFYarBbi8pAw4BZX
	KoO2jwQywwItM3mWOJJHhzF6Xa2gau1N1qLALqFAhUvSXMPKl0TtN6207p1AhL+9
	BYgqlxNik1CfGo8sJXTP5Kc9EPfI5jYRpksbaNhGCRMFInw0ML0bAXUZ8rn4ifFC
	aqnjy+fNhnTgWxaC238isaZsAiCpNXVIM7rtQKP24UPSQaQI1Ill1A7eispbXVDK
	wxAY3w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432h4drvbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:00:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM8xxee012860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 08:59:59 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 00:59:54 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>
Subject: [PATCH v2 1/3] mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
Date: Fri, 22 Nov 2024 14:29:31 +0530
Message-ID: <20241122085933.2663927-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q18ZRClQBdoAICs92S5DLDb7c-UwB6fC
X-Proofpoint-GUID: q18ZRClQBdoAICs92S5DLDb7c-UwB6fC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220075

Currently we are configuring lower 24 bits of address in descriptor
whereas QPIC design expects 18 bit register offset from QPIC base
address to be configured in cmd descriptors. This is leading to a
different address actually being used in HW, leading to wrong value
read.

the actual issue is that the NANDc base address is different from the
QPIC base address. But the driver doesn't take it into account and just
used the QPIC base as the NANDc base. This used to work as the NANDc IP
only considers the lower 18 bits of the address passed by the driver to
derive the register offset. Since the base address of QPIC used to contain
all 0 for lower 18 bits (like 0x07980000), the driver ended up passing the
actual register offset in it and NANDc worked properly. But on newer SoCs
like SDX75, the QPIC base address doesn't contain all 0 for lower 18 bits
(like 0x01C98000). So NANDc sees wrong offset as per the current logic

Older targets also used same configuration (lower 24 bits) like SDX55,
SDX65, IPQ8074, IPQ6018  etc. but issue is masked in older targets due
to lower 18 bits of QPIC base address being zero leading to expected
address generation.

The address should be passed to BAM 0x30000 + offset. In older targets
the lower 18-bits are zero so that correct address being paased. But
in newer targets the lower 18-bits are non-zero in QPIC base so that
0x300000 + offset giving the wrong value.

SDX75 : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
SDX55 : QPIC_QPIC | 0x07980000 (Lower 18 bits are zero) Same for
older targets.

Cc: stable@vger.kernel.org
Fixes: 8d6b6d7e135e ("mtd: nand: qcom: support for command descriptor formation")
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* Updated commit message

* Added Fixes tag

* Added stable kernel tag

* Renamed the variable from offset_from_qpic to nandc_offset

Change in [v1]

* Preliminary correction for the register address forwarded to BAM
 
 drivers/mtd/nand/raw/qcom_nandc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b8cff9240b28..cc59461df72e 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -207,7 +207,7 @@ nandc_set_reg(chip, reg,			\
 #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
 
 /* Returns the NAND register physical address */
-#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
+#define nandc_reg_phys(chip, offset)  ((nandc)->props->nandc_offset + (offset))
 
 /* Returns the dma address for reg read buffer */
 #define reg_buf_dma_addr(chip, vaddr) \
@@ -561,6 +561,7 @@ struct qcom_nandc_props {
 	bool is_qpic;
 	bool qpic_v2;
 	bool use_codeword_fixup;
+	u32 nandc_offset;
 };
 
 /* Frees the BAM transaction memory */
@@ -3477,6 +3478,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
 	.is_bam = false,
 	.use_codeword_fixup = true,
 	.dev_cmd_reg_start = 0x0,
+	.nandc_offset = 0x30000,
 };
 
 static const struct qcom_nandc_props ipq4019_nandc_props = {
@@ -3484,6 +3486,7 @@ static const struct qcom_nandc_props ipq4019_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.dev_cmd_reg_start = 0x0,
+	.nandc_offset = 0x30000,
 };
 
 static const struct qcom_nandc_props ipq8074_nandc_props = {
@@ -3491,6 +3494,7 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.dev_cmd_reg_start = 0x7000,
+	.nandc_offset = 0x30000,
 };
 
 static const struct qcom_nandc_props sdx55_nandc_props = {
@@ -3498,7 +3502,8 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.qpic_v2 = true,
-	.dev_cmd_reg_start = 0x7000,
+	.dev_cmd_reg_start = 0x0,
+	.nandc_offset = 0x30000,
 };
 
 /*
-- 
2.34.1


