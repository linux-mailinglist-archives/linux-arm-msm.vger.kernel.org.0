Return-Path: <linux-arm-msm+bounces-50351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6885A4FE2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 13:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87E601894BE1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 12:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16CA24502D;
	Wed,  5 Mar 2025 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TWFjbxxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F99A245020;
	Wed,  5 Mar 2025 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176278; cv=none; b=Eb1LXXVWSXsAlSb1YN9aj4tbLH2+wIdxfWM8vEqNymjAZo395GRfzwLlp4EO83Td/9TQpv1yueHzqG6vMGV0VqgXETDejhbP4FaKVkrIWIwumjgfvgmQ4BCO5wS6g2QC+exxgqFaNcInasSW9lVAXaGyDgX3BNXuxsW3nyll/fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176278; c=relaxed/simple;
	bh=ErVlhRlOITXJv12eqa6G92D4CYdlwe6kcdaSN34XyDw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l6QtGBuKKPRKM8UGNp9+0dJ4xYt610+DKaeJbO37VnCjOZoSd9osXipMA8JmpkaYUfKo8qKOjk0ZH4ma8h6xZobPu2MwjJDvtXD3L55Q2ODIjtNynbwRiCiZtMlpkYKRs1/Nxfj6zYjzrILll1jzyjInOE/E4U7TxFPyha9eXMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TWFjbxxA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525AC7uS021433;
	Wed, 5 Mar 2025 12:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dv4qbV3i9JA1z+DV23aji90v
	PBycwjb5im/EhupfruU=; b=TWFjbxxAupGu5f/jXdrfj0/n5fd/ss5LAwiqxssX
	c+2a+kGsdH9FLHndNqpLJtbx6Oj3saL+iubvYykKJfD2LL0Ycw9h1BesyN0dXO2d
	q0UtXYtjAS3DqkwqtKWfRxfgB5e5eervHEhAje09SPnrA2eX1c+TEBaCOfVCsGJd
	7+Pf4PVTn9frTc26NzQjexPjcRBoxx0Xx6ZSklF6/MFoeJw9LxBGogdJmC48QbFY
	6zKpCncH4QmkSE2owYzyg7J8h8EaoCBnfp14p+y6BrCTspyef9gRbP9kr5JFyJpb
	7UGZC6chjYsWMtg3agG4OjkcjvHXikjeUx5FDXgr/qM76Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t59ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 12:04:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525C4VAZ025822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 12:04:31 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 04:04:28 -0800
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V2 3/3] scsi: ufs-qcom: Add support for testbus registers
Date: Wed, 5 Mar 2025 17:33:55 +0530
Message-ID: <20250305120355.16834-4-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250305120355.16834-1-quic_mapa@quicinc.com>
References: <20250305120355.16834-1-quic_mapa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: QMQKD3NBle-q9n7BoI0ch0SNv_sXZunb
X-Authority-Analysis: v=2.4 cv=P5XAhjAu c=1 sm=1 tr=0 ts=67c83dd0 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=dEC2fF6n9rTQXDkRPG8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QMQKD3NBle-q9n7BoI0ch0SNv_sXZunb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=995 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050097

This patch introduces support for dumping testbus registers,
enhancing the debugging capabilities for UFS-QCOM drivers.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 73 +++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 7daee416eb8b..c8f95519b580 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1566,6 +1566,75 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	return 0;
 }
 
+static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	u32 *testbus = NULL;
+	int i, j, nminor = 0, testbus_len = 0;
+	char *prefix;
+
+	testbus = kmalloc(256 * sizeof(u32), GFP_KERNEL);
+	if (!testbus)
+		return;
+
+	for (j = 0; j < TSTBUS_MAX; j++) {
+		nminor = 32;
+
+		switch (j) {
+		case TSTBUS_UAWM:
+			prefix = "TSTBUS_UAWM ";
+			break;
+		case TSTBUS_UARM:
+			prefix = "TSTBUS_UARM ";
+			break;
+		case TSTBUS_TXUC:
+			prefix = "TSTBUS_TXUC ";
+			break;
+		case TSTBUS_RXUC:
+			prefix = "TSTBUS_RXUC ";
+			break;
+		case TSTBUS_DFC:
+			prefix = "TSTBUS_DFC ";
+			break;
+		case TSTBUS_TRLUT:
+			prefix = "TSTBUS_TRLUT ";
+			break;
+		case TSTBUS_TMRLUT:
+			prefix = "TSTBUS_TMRLUT ";
+			break;
+		case TSTBUS_OCSC:
+			prefix = "TSTBUS_OCSC ";
+			break;
+		case TSTBUS_UTP_HCI:
+			prefix = "TSTBUS_UTP_HCI ";
+			break;
+		case TSTBUS_COMBINED:
+			prefix = "TSTBUS_COMBINED ";
+			break;
+		case TSTBUS_WRAPPER:
+			prefix = "TSTBUS_WRAPPER ";
+			break;
+		case TSTBUS_UNIPRO:
+			nminor = 256;
+			prefix = "TSTBUS_UNIPRO ";
+			break;
+		default:
+			break;
+		}
+
+		host->testbus.select_major = j;
+		testbus_len = nminor * sizeof(u32);
+		for (i = 0; i < nminor; i++) {
+			host->testbus.select_minor = i;
+			ufs_qcom_testbus_config(host);
+			testbus[i] = ufshcd_readl(hba, UFS_TEST_BUS);
+		}
+		print_hex_dump(KERN_ERR, prefix, DUMP_PREFIX_OFFSET,
+			       16, 4, testbus, testbus_len, false);
+	}
+	kfree(testbus);
+}
+
 static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
 {
 	/* RES_MCQ_1 */
@@ -1682,6 +1751,10 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 			ufs_qcom_dump_mcq_hci_regs(hba);
 			usleep_range(1000, 1100);
 		}
+		ufshcd_dump_regs(hba, UFS_TEST_BUS, 4, "UFS_TEST_BUS ");
+		usleep_range(1000, 1100);
+		ufs_qcom_dump_testbus(hba);
+		usleep_range(1000, 1100);
 	}
 }
 
-- 
2.17.1


