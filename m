Return-Path: <linux-arm-msm+bounces-35788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ABB9AF95A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 07:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 411511F22FF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978B01AF0CD;
	Fri, 25 Oct 2024 05:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G1iZ+atP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7513B199FD0;
	Fri, 25 Oct 2024 05:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729835488; cv=none; b=Th6bn1bpCcgaKYIFPHxpo9iEy1zPE54FZkYimHLkc7QJlgSUvGE3DejAFoUP8U8JrXcrulVRs+fWFvutSfsNbp4jPWaSU2ZKSgPmltpZNvk0hWkyW6PAl6HM/Rm9zD2M5ZzixJqTxRxUtSXInT46sHxuydJR8ZXa2RSWVaXyZMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729835488; c=relaxed/simple;
	bh=GPBy6kdBvN1KZ4MIjCoX26n3jnLMyKq4Hl2VmpvLf3Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tnqr2ZanCYitIcpUUgty4gRYrLq/V0eMO0sAoH/x9bOgIzSg+vcKFwEV3SmGYT0TkOv4d0SYrvPR7pY/PhRoU7DN9AVspvNcVAwkZuePkunGB+/3beKa9vQrDalyneBpJpvQPMaWYg7ga+cRAmG/Kn7EgEmiWJOspZ74/1eR0Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G1iZ+atP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKirwS025421;
	Fri, 25 Oct 2024 05:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x1UY2Ic8sJA9DfBbhNg0Sc4B
	oNMDf6vWEhSDfDn7zsg=; b=G1iZ+atPJwz2KPMWizMk1PtvYga3KlWearrBs+Pi
	KiYpWFaLiMMFZai87PMf7qRxWlvXo+1dDQPdClW97q6yvDY5bODjaVIGqq3jAjp9
	S1NNQuxG1h4yD6CT7G63S1z6zfxD6sLSwqPE6fWNRnBPTWpHB4L41oi5k4+SGLZG
	+AJ92Wsjder6PsbpdQ2tjUFrb/Cm2MX1qWw51e9t5kmtUeuhWMGKj0lDjl4fPDAP
	Rek3e8+oJ7W0QL04cyg5YVP+c70HhEDUr0+5h7b/FR88gm5GtuRHOKMRbu/QTkow
	1zbfY53FrBxPpDCfWD0yNJB+cB3uojhAm4yhGiZsWrL9bw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em40fw1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:51:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P5pFUK027944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:51:15 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 22:51:13 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
Subject: [PATCH 1/3] scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
Date: Fri, 25 Oct 2024 11:20:52 +0530
Message-ID: <20241025055054.23170-2-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241025055054.23170-1-quic_mapa@quicinc.com>
References: <20241025055054.23170-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _REksGp5h6hcK0FfV-7xQnwI3LEPqDh3
X-Proofpoint-GUID: _REksGp5h6hcK0FfV-7xQnwI3LEPqDh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=772
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250043

This patch adds functionality to dump both hardware and software
hibern8 enter counts. This enhancement will aid in monitoring and
debugging hibern8 state transitions by providing detailed count
information.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 9 +++++++++
 drivers/ufs/host/ufs-qcom.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index a5a0646bb80a..4752311b1f76 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1487,6 +1487,15 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
 	host = ufshcd_get_variant(hba);
 
+	dev_err(hba->dev, "HW_H8_ENTER_CNT=%d\n", ufshcd_readl(hba, REG_UFS_HW_H8_ENTER_CNT));
+	dev_err(hba->dev, "HW_H8_EXIT_CNT=%d\n", ufshcd_readl(hba, REG_UFS_HW_H8_EXIT_CNT));
+
+	dev_err(hba->dev, "SW_H8_ENTER_CNT=%d\n", ufshcd_readl(hba, REG_UFS_SW_H8_ENTER_CNT));
+	dev_err(hba->dev, "SW_H8_EXIT_CNT=%d\n", ufshcd_readl(hba, REG_UFS_SW_H8_EXIT_CNT));
+
+	dev_err(hba->dev, "SW_AFTER_HW_H8_ENTER_CNT=%d\n",
+			ufshcd_readl(hba, REG_UFS_SW_AFTER_HW_H8_ENTER_CNT));
+
 	ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
 			 "HCI Vendor Specific Registers ");
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index b9de170983c9..84e42fa123d2 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -72,6 +72,15 @@ enum {
 	UFS_UFS_DBG_RD_EDTL_RAM			= 0x1900,
 };
 
+/* Vendor-specific Hibern8 count registers for the QCOM UFS host controller. */
+enum {
+	REG_UFS_HW_H8_ENTER_CNT			= 0x2700,
+	REG_UFS_SW_H8_ENTER_CNT			= 0x2704,
+	REG_UFS_SW_AFTER_HW_H8_ENTER_CNT	= 0x2708,
+	REG_UFS_HW_H8_EXIT_CNT			= 0x270C,
+	REG_UFS_SW_H8_EXIT_CNT			= 0x2710,
+};
+
 enum {
 	UFS_MEM_CQIS_VS		= 0x8,
 };
-- 
2.17.1


