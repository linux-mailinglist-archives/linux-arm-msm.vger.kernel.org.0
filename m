Return-Path: <linux-arm-msm+bounces-38797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC869D5B6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E811DB229AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE1D1DE2AE;
	Fri, 22 Nov 2024 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W4YTXN40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADA91DD55A;
	Fri, 22 Nov 2024 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266020; cv=none; b=G+6vqD8DHNmO+X+2Kalt0yXnEDzz6j+hKEEXtshZVZZmhXnXEdSUaV2iwaZvxGBv/7mG8ySvASn6gG1cty1zwjChbQFNkm94WBRvUefdRAFNtaUtbcEtxWWgsLQTyrg12ezqZVGA1qOn1eoO1qgOTTwmkUL2gX08xphGFBxI7aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266020; c=relaxed/simple;
	bh=s464gs4DI7paebfDghYbA6dIdZv01O8xRzvIPM+5cjg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvP0xDXBG3fu9b7TNo4WcihMgRX4ZMC5MuCq7lbiUnf2StvBZ26W7Bgik1YwXpAFvbvX4Og4KlSSkI9F+82vRXlShYGJo8jEBDkDgT8cymyrQr399mgMCF1FKNPCBEa9XQZ+k70AHtCRFTyKLWLI0dB7n9r3s2WznsPI5qz7sTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W4YTXN40; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2NM1c029328;
	Fri, 22 Nov 2024 09:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkHS7Yzau84UEPEUeytcDhNp5BBXrcXJE2ofwaLbCrQ=; b=W4YTXN404PFFtj3T
	6oYEURHK1yoVcgb+7JwGb2AtWgV30WzRPg965M9SEzmmcd5Znxk6qL+3pEaR/9zf
	wHcEqP9LU7k2bZNmsMH3LjvKirZOHCKJPKJwhspsLuUuMi1YYENimLRhT1at5OhH
	+gKIAEnLNTauZde4bXKxygvogVyV7HCZ8OXy0e3KjMi6jm1mso04CMKmBtkajn8N
	GKDVMn304ewO9gGw7rSKlRax9DrfxBwRbdF6fd8T+A++6B7Hw6kGMSg6AbEZMfkm
	DfKens6FQ3ghFmZ3j6xS48+X7KXtngBPDgcwVklPPGilVwCADIJOF99JT96APmWe
	VwP6Ag==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432h4drvc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:00:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM908Pl008109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:00:08 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 01:00:03 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>
Subject: [PATCH v2 3/3] mtd: rawnand: qcom: Fix read len for onfi param page
Date: Fri, 22 Nov 2024 14:29:33 +0530
Message-ID: <20241122085933.2663927-4-quic_mdalam@quicinc.com>
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
X-Proofpoint-ORIG-GUID: EdIk7u9Ary1X47T5c_-drj4TLUmdqQDR
X-Proofpoint-GUID: EdIk7u9Ary1X47T5c_-drj4TLUmdqQDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220075

The minimum size to fetch the data from device to QPIC buffer
is 512-bytes. If size is less than 512-bytes the data will not be
protected by ECC as per QPIC standard. So while reading onfi parameter
page from NAND device setting nandc->buf_count = 512.

Cc: stable@vger.kernel.org
Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* Set buf_count to 512 in the parameter page read

Change in [v1]

* This patch was not included in v1

 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 31ec3db1246d..e1dca4857754 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2926,7 +2926,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 		write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
 	}
 
-	nandc->buf_count = len;
+	nandc->buf_count = 512;
 	memset(nandc->data_buffer, 0xff, nandc->buf_count);
 
 	config_nand_single_cw_page_read(chip, false, 0);
-- 
2.34.1


