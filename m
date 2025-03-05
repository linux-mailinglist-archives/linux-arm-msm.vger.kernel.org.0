Return-Path: <linux-arm-msm+bounces-50350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A1A4FE2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 13:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1A581894B7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 12:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE570233728;
	Wed,  5 Mar 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GlQ9POr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BAF2063F0;
	Wed,  5 Mar 2025 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176275; cv=none; b=mATBRqJ+X2IOSmzjWVzzNielgubGRE5G3JUAtExqEeFnj9RF3se0gK55I7h1TOMcBU+ZhHs0J4rIkHsmSHERygAZeD66LlnMr1zWjtNZCYe0B5Ya9I+uLSDwlK0wNHN0W5bOy9crVYm+c2o0wkwaPUKIVHGQMPfVj0AEViSJtJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176275; c=relaxed/simple;
	bh=BdEVNPZ7zBgPDFaAYqSLHhtQC6Dn7yhuFcTHVNCseII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qoB2BG6kmduE3IA761jlyXSvYSwLWo7TuzTRu4ZLE7wa7VeKbE3iHDW6sDU+b0vsJSmqEkvf4kNGYuHwR7IeoIx0Ihg+IbwEjkbPqRK4JtWFfnWDckSYRUXlY7/NYYIdKHkg/gK00GtOXKmwXoX6X6zMvbxpXdt75tLTW4/twbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GlQ9POr1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525AiZZQ006385;
	Wed, 5 Mar 2025 12:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W9Lp/8wCdWEMaYrXSvuGTqe/
	8nxYZkyxEvfEAcfmbwA=; b=GlQ9POr1Ft0S5+bq9vU5ApAedBVVeEQUnG5ywA1b
	lMYz7NMYbE55Va9YwA8D0wHaj5sDfC7i5Zssfs8+PmlZxuvPLXjYSd/mTqUThG2I
	zSsBF8jVFMo3VODnNXqZCwDIYHGEmzxL022e4DbCjT928voE/fDJq1AGI/pl7+Wr
	w8cQ0AG97l+GkW5VV3RnEUib3zwMlSN/KHWBDjN33M87qJDnJEmqSJRRFLOrCGxo
	Bm4CSucGjDWXWVb9fNDfEfctdDmbUY6bW46uUcB6Ik1aAqrjW5GPlPA6u/GX/zos
	ryugzycEeV4QBQnMhSKbG62NzpaOZQX5iaPPrZVLcDP68A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tn7pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 12:04:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525C4SsD011041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 12:04:28 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 04:04:25 -0800
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V2 2/3] scsi: ufs-qcom: Add support for dumping MCQ registers
Date: Wed, 5 Mar 2025 17:33:54 +0530
Message-ID: <20250305120355.16834-3-quic_mapa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c83dcd cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=haWue-ocSk40ZxNO7cYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: teqbHAC1-rlgurIcFVgsLaKcVOOCjsx6
X-Proofpoint-ORIG-GUID: teqbHAC1-rlgurIcFVgsLaKcVOOCjsx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=854 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050097

This patch adds functionality to dump MCQ registers.
This will help in diagnosing issues related to MCQ
operations by providing detailed register dumps.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 59 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 61 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index f5181773c0e5..7daee416eb8b 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1566,6 +1566,52 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
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
@@ -1624,6 +1670,19 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
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


