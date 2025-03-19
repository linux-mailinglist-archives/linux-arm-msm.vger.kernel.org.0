Return-Path: <linux-arm-msm+bounces-51897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4092AA68519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 07:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05B727A5906
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 06:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FB524EF9F;
	Wed, 19 Mar 2025 06:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l8PY9ycC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD236AD2C;
	Wed, 19 Mar 2025 06:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365870; cv=none; b=gFIZiVkN7VUIXYS1kplLwh4Tdjb4n2SYgQpYRN9ixZDrzK5yoveAPTal1poL8utNe0os+BVje+c/puQNxNgWfzxNB8gW7T5oJN9TPSmUjdlaC8jalOic9rytD3kHWE2wM7jAUuleYqzd8ng9LK47qTrqqsXQqvZ6kP1iI7W7rNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365870; c=relaxed/simple;
	bh=s1NI9v1v3pCeQ33EV2B8Vu1jg0vdxJA9rFGEfRlypBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bpiw9vt1sa7bDepPZNHV+MjDVgk3iLTzAO6NcQ+FOkJMg1hnQHL6Moy2Hb/KIGy1/OZwI5vN6qRtqn8LM7rUu0YmIob+H/j3EwBhoKKw2BCMbhJ8helqJdhbML4eERUaDsHFoZC99RiBgasp8FOciE0frfS4hM8NC4dNKfMux6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l8PY9ycC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lopH020878;
	Wed, 19 Mar 2025 06:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6RPq3pJezxIOuvpsjGJXF3MQ
	z7KVplk1zMVNymFIXps=; b=l8PY9ycCzEba920861EYAGqpmieb9uGxCQgsybth
	2u6aDEdaN9J/Wl7I+uC1FgxJEaDd/0Z9pN1SKVhw+2bV6WM49v9p1UEXtPdoJtp3
	Qwh1EIJrB3Fu1lxOmJll5Iyj0B+oBS9KJ7KkGx7QqgIOfYbATp1X0wmV0SxXb8Z/
	e380yIAkDxm+tnFTrp9XamWLWCTTTYc44H56C4BZEY3BdENyNOulWUe2Ivc0FJNX
	AAuub+a45MWx88bph0GPzXlZza0itT1lxvdzWr52DHicKkwUzI+221BSOL90ZapG
	6kNhDVigwDxtApcNRDWTkSEAhNjGH1l0cHf6htWuo2gFAA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbm8bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:31:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J6V3eH022762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:31:03 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 23:31:00 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V4 2/3] scsi: ufs-qcom: Add support to dump MCQ registers
Date: Wed, 19 Mar 2025 12:00:42 +0530
Message-ID: <20250319063043.15236-3-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250319063043.15236-1-quic_mapa@quicinc.com>
References: <20250319063043.15236-1-quic_mapa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67da64a7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=HeVDo3C4yyPodjHEHq8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bFm6JdA3m054wZPFXv-WsuCpLKXarH6y
X-Proofpoint-GUID: bFm6JdA3m054wZPFXv-WsuCpLKXarH6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=702
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190043

Add support to dump UFS MCQ registers to enhance debugging capabilities
for the Qualcomm UFS Host Controller.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 60 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 028833acb3db..fc9e8d0ddc92 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1542,6 +1542,54 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
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


