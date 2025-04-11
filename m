Return-Path: <linux-arm-msm+bounces-54017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C210A85CCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E98E167C2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C1A29DB64;
	Fri, 11 Apr 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m0louII2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BCF29CB49;
	Fri, 11 Apr 2025 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373661; cv=none; b=F8vnp4ClUGm5RJ0RImv1GQqCJktXKzi0m6+YDrkYLdKS1+7gJdzVh+ZpytrbAPndL8tIXdu1xJgrIie7puVXycpnjOmbA0djcYv9ZNOgzgAxuMQx/rs/bqoQs85mdLppWTsbTcFQZAN/O35KaSJQOCk12HkFGdJdccGrctmmkUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373661; c=relaxed/simple;
	bh=HTIcepBU4Rtdj1Y9oyDHHgf6Sg/FMxvSDfMWK7q1OqQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G/PnbY07LMnAA+PwdUYSS8/LAo2XaWmna0BHIvg+YNmUEcAMvb2K+MEmgkO/WF0qdc3nt7rn7EgaI3MeiX26gDCcr781tDdayueF5NG0nvYp64TQnbGlHWIRedoihxPSTxY4vAwDkdovaZfpNirWV66YphAoBtZfVCrJnUr9m0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m0louII2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5017b013878;
	Fri, 11 Apr 2025 12:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ngnpcapL8lchYX9bhMY9DoA
	q4fucFPIUmREv8RgLfI=; b=m0louII2R0WdHvxaMjoO2e+ol3t6dmrKWO1Ijep+
	EzBSXWD8QnWUFWYeOfyE9MLM68BMoSKzIjMvRZhZNlwnvIiOmf2arMPshweUTmLN
	tnsO7O/wytKf94b1MY9Aobpg5/FF2Wzy7CFt+2thHQ89QVLVzz5KrdXxi3EPudcM
	xEZLEGlGxtCC5KTM0s/nFu1Z4RUl5/8KvJ0+6m4UqBDHrNnsomfJb9K/Kbj0xIYz
	hhemd8Jgcz8XGug2uj8+8O4z469gH/hteRnn48qf/7nuiQIywdXNFWas7vIR1o0y
	qEmGMEDWtFcrV5IeVXMNHslKh+yrR8yPAjzOHXhxhVzXTQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbejce2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:14:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BCEE6B027696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:14:14 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 05:14:11 -0700
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
Subject: [PATCH V7 2/3] scsi: ufs-qcom: Add support to dump MCQ registers
Date: Fri, 11 Apr 2025 17:43:44 +0530
Message-ID: <20250411121345.16859-3-quic_mapa@quicinc.com>
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
X-Proofpoint-GUID: qRVFfFgNYB0u4RT66I1y2wFODJtnVgls
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f90797 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=lwTu3phbQa7vK8uf_6sA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qRVFfFgNYB0u4RT66I1y2wFODJtnVgls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=868 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110078

Add support to dump UFS MCQ registers to enhance debugging
capabilities for the Qualcomm UFS Host Controller.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 65 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 67 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index b779607a00e8..4c0fe80f65f9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1566,6 +1566,59 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	return 0;
 }
 
+static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
+			      const char *prefix, enum ufshcd_res id)
+{
+	u32 *regs __free(kfree) = NULL;
+	size_t pos;
+
+	if (offset % 4 != 0 || len % 4 != 0)
+		return -EINVAL;
+
+	regs = kzalloc(len, GFP_ATOMIC);
+	if (!regs)
+		return -ENOMEM;
+
+	for (pos = 0; pos < len; pos += 4)
+		regs[pos / 4] = readl(hba->res[id].base + offset + pos);
+
+	print_hex_dump(KERN_ERR, prefix,
+		       len > 4 ? DUMP_PREFIX_OFFSET : DUMP_PREFIX_NONE,
+		       16, 4, regs, len, false);
+
+	return 0;
+}
+
+static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
+{
+	struct dump_info {
+		size_t offset;
+		size_t len;
+		const char *prefix;
+		enum ufshcd_res id;
+	};
+
+	struct dump_info mcq_dumps[] = {
+		{0x0, 256 * 4, "MCQ HCI-0 ", RES_MCQ},
+		{0x400, 256 * 4, "MCQ HCI-1 ", RES_MCQ},
+		{0x0, 5 * 4, "MCQ VS-0 ", RES_MCQ_VS},
+		{0x0, 256 * 4, "MCQ SQD-0 ", RES_MCQ_SQD},
+		{0x400, 256 * 4, "MCQ SQD-1 ", RES_MCQ_SQD},
+		{0x800, 256 * 4, "MCQ SQD-2 ", RES_MCQ_SQD},
+		{0xc00, 256 * 4, "MCQ SQD-3 ", RES_MCQ_SQD},
+		{0x1000, 256 * 4, "MCQ SQD-4 ", RES_MCQ_SQD},
+		{0x1400, 256 * 4, "MCQ SQD-5 ", RES_MCQ_SQD},
+		{0x1800, 256 * 4, "MCQ SQD-6 ", RES_MCQ_SQD},
+		{0x1c00, 256 * 4, "MCQ SQD-7 ", RES_MCQ_SQD},
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(mcq_dumps); i++) {
+		ufs_qcom_dump_regs(hba, mcq_dumps[i].offset, mcq_dumps[i].len,
+				   mcq_dumps[i].prefix, mcq_dumps[i].id);
+		cond_resched();
+	}
+}
+
 static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 {
 	u32 reg;
@@ -1624,6 +1677,18 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
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
index 792a68c2ca95..3eed369343eb 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -50,6 +50,8 @@ enum {
 	 */
 	UFS_AH8_CFG				= 0xFC,
 
+	UFS_RD_REG_MCQ				= 0xD00,
+
 	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
 	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
 
-- 
2.17.1


