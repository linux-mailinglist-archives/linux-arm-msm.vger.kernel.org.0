Return-Path: <linux-arm-msm+bounces-53034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3696A78DB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1886E3B4D26
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 12:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D505238144;
	Wed,  2 Apr 2025 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AwwuxVpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0630239573;
	Wed,  2 Apr 2025 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595196; cv=none; b=GK75E+d6tTsnsHy4X2iyi1bC7voE0z6RqdeU53SfEMMVxOIKZfd+n5cpDPgwW3yqhggxwTQIxqy3FDXXANUeaOMcZiSJZn0zvuyNODlbTdI4M6iG9pGQU6nqrUzSoP5YVUOT14xjouXIVauNMP5zxkARd5ju7LpQZRPfxE4HVXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595196; c=relaxed/simple;
	bh=UomvtRaVQvKXGkLI9oTllf24CuDph+Iwos9dpxe8iNo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FYooeGK7xU7R1DvumUzKsoddK8sw7gPDctpy5Sl3S6IUIYC3sxmu077DSMoE0P1gg549UfShonmJpRXxYdVuHgYyYqs4Pseb6gCJ+nnD5EccR5LjYRfhNSjhM81fAPcdqW9avvqfDqJGBs9LgTDy+J8q9/Z426D5jSVsUsyOjDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AwwuxVpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532BefSv014509;
	Wed, 2 Apr 2025 11:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yDakDeFU2i9+g07fpSLqSdac
	c41dk76/PoPqSnEaokE=; b=AwwuxVpyPvmuLPXlPLDClWrXV2vNDZM3nJ9Qi848
	ug/GWHg5cKO5v2O3v5pybmw9et6pl0gUnc/uf/ccDvpoE+/R73fplII6706EolwA
	kLpPWHkBv3jtu+QusXyQQpacpaBffyJg1VPm5p0M67nzPfijnILn/SWsXbUFduqM
	J3GbxqwA0xMJvn5BJaKonZFBfrPqJBvXPpmbRNxabUq8zQ7wqJ+PQ87xagmvN+SN
	NEBUqni6BcAOMCZIS6wh6zSGczU83IDm1vdTq4WD/qpb4z/ih3EXc8JwgBKviI3/
	+b4vyCspewfGopujw/BJ6Kf6hsFfzTbXhqczTiskMIAobw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvkb0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 11:59:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 532Bxnln020036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 11:59:49 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 2 Apr 2025 04:59:46 -0700
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
Subject: [PATCH V5 2/3] scsi: ufs-qcom: Add support to dump MCQ registers
Date: Wed, 2 Apr 2025 17:29:21 +0530
Message-ID: <20250402115922.27874-3-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250402115922.27874-1-quic_mapa@quicinc.com>
References: <20250402115922.27874-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ed26b6 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0WX24kOGjoniB14JElUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XC53MhWI4AZA5s4ZKHg2ojGMNP1462yG
X-Proofpoint-GUID: XC53MhWI4AZA5s4ZKHg2ojGMNP1462yG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=721 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020075

Add support to dump UFS MCQ registers to enhance debugging capabilities
for the Qualcomm UFS Host Controller.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 60 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 028833acb3db..22720ea761d9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1542,6 +1542,54 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	return 0;
 }
 
+static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
+{
+	/* voluntarily yield the CPU to prevent CPU hog during data dumps */
+	/* RES_MCQ_1 */
+	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0 ");
+	cond_resched();
+
+	/* RES_MCQ_2 */
+	ufshcd_dump_regs(hba, 0x400, 256 * 4, "MCQ HCI 1da0400-1da07f0 ");
+	cond_resched();
+
+	/*RES_MCQ_VS */
+	ufshcd_dump_regs(hba, 0x0, 5 * 4, "MCQ VS 1da4000-1da4010 ");
+	cond_resched();
+
+	/* RES_MCQ_SQD_1 */
+	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ SQD 1da5000-1da53f0 ");
+	cond_resched();
+
+	/* RES_MCQ_SQD_2 */
+	ufshcd_dump_regs(hba, 0x400, 256 * 4, "MCQ SQD 1da5400-1da57f0 ");
+	cond_resched();
+
+	/* RES_MCQ_SQD_3 */
+	ufshcd_dump_regs(hba, 0x800, 256 * 4, "MCQ SQD 1da5800-1da5bf0 ");
+	cond_resched();
+
+	/* RES_MCQ_SQD_4 */
+	ufshcd_dump_regs(hba, 0xc00, 256 * 4, "MCQ SQD 1da5c00-1da5ff0 ");
+	cond_resched();
+
+	/* RES_MCQ_SQD_5 */
+	ufshcd_dump_regs(hba, 0x1000, 256 * 4, "MCQ SQD 1da6000-1da63f0 ");
+	cond_resched();
+
+	/* RES_MCQ_SQD_6 */
+	ufshcd_dump_regs(hba, 0x1400, 256 * 4, "MCQ SQD 1da6400-1da67f0 ");
+	cond_resched();
+
+	/* RES_MCQ_SQD_7 */
+	ufshcd_dump_regs(hba, 0x1800, 256 * 4, "MCQ SQD 1da6800-1da6bf0 ");
+	cond_resched();
+
+	/* RES_MCQ_SQD_8 */
+	ufshcd_dump_regs(hba, 0x1c00, 256 * 4, "MCQ SQD 1da6c00-1da6ff0 ");
+	cond_resched();
+}
+
 static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 {
 	u32 reg;
@@ -1600,6 +1648,18 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
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
index a5bf1282ddbe..6087fd1534b4 100644
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


