Return-Path: <linux-arm-msm+bounces-35789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 821899AF95E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 07:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E88BAB22813
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896EC1B6CE9;
	Fri, 25 Oct 2024 05:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M9klRg9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7755E18E021;
	Fri, 25 Oct 2024 05:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729835491; cv=none; b=nfbbqqG9USTw7YsMby4WEPAb5DTecLD2RXPi5yHSV0LtP/HTlzlkTDrv8Wixve0bxOTRMu5dhErK/Il9oVJhNZGuRb/+IToXw6ZB9beKxuo7K6lJckfWUoPg4/I3efXBnGl3Pp8zHKjPl/mUW76TKqu76emVjrpSTHanxpX/Mp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729835491; c=relaxed/simple;
	bh=j6lsn9Jd+sVX1krTeFigReo6vtbNb7CvUjR43vNZF/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEjvyRJM8W/yR1QKZvB8orln45ki1JZGBn9hpBGPvCjyRu+srTVzKYocrzY+P4O1AmCRN34YtwZrHaZCvmWnQ2NGdWcCr9sUF1sCI+aTeVSYU2DCzCILz4cvgh4/0OG9hwdyaHmjPuQwNfeTfnmcSJNVvGg7/RYVgb3/pZHFpuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M9klRg9n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2hgZe028787;
	Fri, 25 Oct 2024 05:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TD7jmJ4DWbGgfIzArLM3SkA3
	f5r7fS6AzI6IPQgRx40=; b=M9klRg9nCBTAU+n/H+3PfaCKzRQDq1D2/TpKYc4U
	3QdKFutUKL8UC5VN+w+Z27XcCpUb11EwWTe4NC2+RVF05wbIQcpFvgbbT88z+2gc
	ZDk057vDvDs9YcUYcud27LUqlcHfQADPXC8I7r+XgLFlnMNWia3VlOVrtBLF57I0
	0Ilm53bzO8fKMtlQmjVOAzaXVm/pKHRUG0jfZKJANoc7rt18fXOPe9AcZ2FSd8rE
	SGxnV+1hi50T11DOvy5vWFohpiidDkdhNV2DxlXuIds5B7LYwtTZT9jQEhoGpiNp
	KLmZYDGZl1blsdvgC4Tbxe9ZzugwX/H3emnQhxKFcy8MXA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fdtxkrpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:51:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P5pIkv010410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:51:18 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 22:51:15 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
Subject: [PATCH 2/3] scsi: ufs-qcom: Add support for dumping MCQ registers
Date: Fri, 25 Oct 2024 11:20:53 +0530
Message-ID: <20241025055054.23170-3-quic_mapa@quicinc.com>
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
X-Proofpoint-GUID: k1RulalwYd2ahtiPKGUNTVeUX3GbsYtn
X-Proofpoint-ORIG-GUID: k1RulalwYd2ahtiPKGUNTVeUX3GbsYtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=826
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250043

This patch adds functionality to dump Multi-Queue (MCQ) registers.
This will help in diagnosing issues related to MCQ operations by
providing detailed register dumps.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 59 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 61 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4752311b1f76..a43e818a7e14 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1480,6 +1480,52 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	return 0;
 }
 
+static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
+{
+	/* RES_MCQ_1 */
+	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0 ");
+	usleep_range(1000, 1100);
+
+	/* RES_MCQ_2 */
+	ufshcd_dump_regs(hba, 0x400, 256 * 4, "MCQ HCI 1da0400-1da07f0 ");
+	usleep_range(1000, 1100);
+
+	/*RES_MCQ_VS */
+	ufshcd_dump_regs(hba, 0x0, 5 * 4, "MCQ VS 1da4000-1da4010 ");
+	usleep_range(1000, 1100);
+
+	/* RES_MCQ_SQD_1 */
+	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ SQD 1da5000-1da53f0 ");
+	usleep_range(1000, 1100);
+
+	/* RES_MCQ_SQD_2 */
+	ufshcd_dump_regs(hba, 0x400, 256 * 4, "MCQ SQD 1da5400-1da57f0 ");
+	usleep_range(1000, 1100);
+
+	/* RES_MCQ_SQD_3 */
+	ufshcd_dump_regs(hba, 0x800, 256 * 4, "MCQ SQD 1da5800-1da5bf0 ");
+	usleep_range(1000, 1100);
+
+	/* RES_MCQ_SQD_4 */
+	ufshcd_dump_regs(hba, 0xc00, 256 * 4, "MCQ SQD 1da5c00-1da5ff0 ");
+	usleep_range(1000, 1100);
+
+	/* RES_MCQ_SQD_5 */
+	ufshcd_dump_regs(hba, 0x1000, 256 * 4, "MCQ SQD 1da6000-1da63f0 ");
+	usleep_range(1000, 1100);
+
+	/* RES_MCQ_SQD_6 */
+	ufshcd_dump_regs(hba, 0x1400, 256 * 4, "MCQ SQD 1da6400-1da67f0 ");
+	usleep_range(1000, 1100);
+
+	/* RES_MCQ_SQD_7 */
+	ufshcd_dump_regs(hba, 0x1800, 256 * 4, "MCQ SQD 1da6800-1da6bf0 ");
+	usleep_range(1000, 1100);
+
+	/* RES_MCQ_SQD_8 */
+	ufshcd_dump_regs(hba, 0x1c00, 256 * 4, "MCQ SQD 1da6c00-1da6ff0 ");
+}
+
 static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 {
 	u32 reg;
@@ -1538,6 +1584,19 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
 	reg = ufs_qcom_get_debug_reg_offset(host, UFS_DBG_RD_REG_TMRLUT);
 	ufshcd_dump_regs(hba, reg, 9 * 4, "UFS_DBG_RD_REG_TMRLUT ");
+
+	if (hba->mcq_enabled) {
+		reg = ufs_qcom_get_debug_reg_offset(host, UFS_RD_REG_MCQ);
+		ufshcd_dump_regs(hba, reg, 64 * 4, "HCI MCQ Debug Registers ");
+	}
+
+	if (in_task()) {
+		/* Dump MCQ Host Vendor Specific Registers */
+		if (hba->mcq_enabled) {
+			ufs_qcom_dump_mcq_hci_regs(hba);
+			usleep_range(1000, 1100);
+		}
+	}
 }
 
 /**
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 84e42fa123d2..980af902bab5 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -50,6 +50,8 @@ enum {
 	 */
 	UFS_AH8_CFG				= 0xFC,
 
+	UFS_RD_REG_MCQ                          = 0xD00,
+
 	REG_UFS_CFG3				= 0x271C,
 
 	REG_UFS_DEBUG_SPARE_CFG			= 0x284C,
-- 
2.17.1


