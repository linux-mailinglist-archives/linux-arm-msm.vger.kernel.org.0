Return-Path: <linux-arm-msm+bounces-54016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F528A85CC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2020C7B7957
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A7529CB4C;
	Fri, 11 Apr 2025 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U01Y1yOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1EA29CB3E;
	Fri, 11 Apr 2025 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373658; cv=none; b=QNN1qz6icoyCXc/nnQ7hYUiIrcbODYae/SwMHQIzjJXSM7mbf1Z+Wuv5O66/MgD1L1MKxCbkC5/djnFgHdnCKZIt89mQ2nRwD3PHM3ZY7Kbxhdll3gyCqkugFha2AmFdQx3NdUvlXFps4vfWKJlFhz9aFMVIEqI7w39y3UXAYx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373658; c=relaxed/simple;
	bh=JncCVhUvgdSsBtFzZTzk+3FmETmaQBkzwaDlunKHgvo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJtfAJd8z+y1G7poyEeHS/dVPsEC4qo3GD0cgIMsuPPTDzTqbfAqpUNj8wpEBiV1aCS803bWi77gbh3brJ26Uwyw2Lpbo01w+OEy+w4HpvYT6jOO3huxrDTGTzNuyCRBKQMC5HUapqleJ5FnLpZ+FGZoCatW7W8dlyYvSuYt2q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U01Y1yOr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5Zuch013884;
	Fri, 11 Apr 2025 12:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9hXxCRu76BCnne0NVFOTBDEG
	T2iGfZoZPEWP86nA4VQ=; b=U01Y1yOraWozbpmCf9HwImM1BpY+vFLZLyYDsNh1
	zvNgYMPPN6HfT5hJ7L2kkfaXK65cwqCcf4os0mw9on+Bo79ur7TvvjzMqRw9MvFU
	wK+egFW4vEtvZEDXfI+u9cJwfkP1Ql4Odu2cDPWIvQDOx+3AzL37yv+xDNLvCmh9
	5oOPO0R++XHS2/hQTc4dUx5dYze1y27xKeQTrTnuOoCDP/xOYeyE6vZn3ycd/3yN
	1RQlkavEH/xNPKNLoxn9zuktC/HI5HV36t8lPrS1gDk19CrjS7dxwGBooR4t7nTW
	AkNp+nRvMBuptrLIfZluZrjVw7oYUsMk+/gz0e6yMSIhbw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbejcdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:14:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BCEBKE012028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:14:11 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 05:14:07 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V7 1/3] scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
Date: Fri, 11 Apr 2025 17:43:43 +0530
Message-ID: <20250411121345.16859-2-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250411121345.16859-1-quic_mapa@quicinc.com>
References: <20250411121345.16859-1-quic_mapa@quicinc.com>
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
X-Proofpoint-GUID: _5U-hPM3NzC5H_uADwGgHtapiL-4nKJg
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f90793 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=4NJo2GNobTQd3EOrCF8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _5U-hPM3NzC5H_uADwGgHtapiL-4nKJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=940 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110078

Add support to dump HW and SW hibern8 enter and exit counts to
enhance the debugging of hibern8 state transitions.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 9 +++++++++
 drivers/ufs/host/ufs-qcom.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4c05b2dbe231..b779607a00e8 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1573,6 +1573,15 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
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
index d0e6ec9128e7..792a68c2ca95 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -75,6 +75,15 @@ enum {
 	UFS_UFS_DBG_RD_EDTL_RAM			= 0x1900,
 };
 
+/* QCOM UFS HC vendor specific Hibern8 count registers */
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


