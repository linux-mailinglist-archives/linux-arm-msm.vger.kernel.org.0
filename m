Return-Path: <linux-arm-msm+bounces-51220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC108A5EB05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 06:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C3833B94BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 05:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD191FAC51;
	Thu, 13 Mar 2025 05:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g8jLncZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AE1FAC40;
	Thu, 13 Mar 2025 05:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741843033; cv=none; b=oYb+be5lHccIbueJ5ayTT8TpJlZqRKr5pcmk8z04GzJ2RuEytemyt4VRygfaQf8/P5ZQC1+HhErmjnfcII3+D7d2rK3CxDPZqUjYY7pTxAO+P5/gznAmYNkqTCDLJmahzljlwXaGPy8eTaEVmwLBIiiHc4EXzQzvTkyv10oH+3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741843033; c=relaxed/simple;
	bh=D0ceBeY0b8XAMooKQKwO3Au0yYPi68BLD9XI7T+brtU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0ZqHS7HM6dGf54y7TO4/488Fnt4UtyTcqxb5/UDY5aycxEuFRNE12ck/Kzf/SNI7m2XCwpf13PLGEcezqPlZQnKIhPwKdGG99qWCUCTMJkBxUV02q5caBHS6TgqDOBit8nU8HE+eYLHeXhDHA5UCy2OIwIFFt9U5zp83BY1X8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g8jLncZf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CMvKgs020069;
	Thu, 13 Mar 2025 05:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pJwaCAvc95nNBOzj3MrM5Nbb
	x1SJCgxc3f3SqpRjUys=; b=g8jLncZfr59EVXRIDfdksOyI9Bs22GmKBXTcqFlS
	BJrhMcrXsf6R4mZb7K/d0EJtKAovf1tjoj0aUVEA/bmMnyq+8pNlAP19rtPWfQZE
	qp7L7BJg2A9684mRnKwL9u7fMh7ACmPITVDHdT2op+F5rKmfRFgvKmktv603tWUO
	Qwl0oyjC/UuQN4Lxs9whydIpIhXRZ8hynJs30Yh5Ih3qOh/4L9qoyW9VsR5/Hllv
	Wk9QMTD1b9wnqcuQ7wU2jCvC1YqI+tUiG2LCtgd8n9WSjmcXYhDAZt4XnL/mlVAm
	0KYEaBIB25zt0aS+H+S5ihMWL76NtZ9MMpUwCyZVKE5mtA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p4mky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:17:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D5H6Mb031885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:17:06 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Mar 2025 22:17:03 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V3 2/3] scsi: ufs-qcom: Add support for dumping MCQ registers
Date: Thu, 13 Mar 2025 10:46:34 +0530
Message-ID: <20250313051635.22073-3-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313051635.22073-1-quic_mapa@quicinc.com>
References: <20250313051635.22073-1-quic_mapa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=HP/DFptv c=1 sm=1 tr=0 ts=67d26a53 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=HeVDo3C4yyPodjHEHq8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: M50zPTGY4abmJFjXtVVgo3bQhobo_Ll6
X-Proofpoint-GUID: M50zPTGY4abmJFjXtVVgo3bQhobo_Ll6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=789
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130038

This patch adds functionality to dump MCQ registers.
This will help in diagnosing issues related to MCQ
operations by providing detailed register dumps.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---

Changes in v3:
- Addressed Bart's review comments by adding explanations for the
  in_task() and usleep_range() calls.
Changes in v2:
- Rebased patchsets.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/
---
 drivers/ufs/host/ufs-qcom.c | 60 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index f5181773c0e5..fb9da04c0d35 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1566,6 +1566,54 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	return 0;
 }
 
+static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
+{
+	/* sleep intermittently to prevent CPU hog during data dumps. */
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
+	usleep_range(1000, 1100);
+}
+
 static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 {
 	u32 reg;
@@ -1624,6 +1672,18 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
 	reg = ufs_qcom_get_debug_reg_offset(host, UFS_DBG_RD_REG_TMRLUT);
 	ufshcd_dump_regs(hba, reg, 9 * 4, "UFS_DBG_RD_REG_TMRLUT ");
+
+	if (hba->mcq_enabled) {
+		reg = ufs_qcom_get_debug_reg_offset(host, UFS_RD_REG_MCQ);
+		ufshcd_dump_regs(hba, reg, 64 * 4, "HCI MCQ Debug Registers ");
+	}
+
+	/* ensure below dumps occur only in task context due to blocking calls. */
+	if (in_task()) {
+		/* Dump MCQ Host Vendor Specific Registers */
+		if (hba->mcq_enabled)
+			ufs_qcom_dump_mcq_hci_regs(hba);
+	}
 }
 
 /**
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index a41db017009f..03a3fee56041 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -50,6 +50,8 @@ enum {
 	 */
 	UFS_AH8_CFG				= 0xFC,
 
+	UFS_RD_REG_MCQ                          = 0xD00,
+
 	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
 	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
 
-- 
2.17.1


