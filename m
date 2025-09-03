Return-Path: <linux-arm-msm+bounces-71740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4DB41721
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 518D717A07F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3C92DA777;
	Wed,  3 Sep 2025 07:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocF+Vy1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220512D4818;
	Wed,  3 Sep 2025 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885708; cv=none; b=Uv5jFOp8cRN/ikq7GB2msj3TqI9PILAI8CnSXYgmQ4cxZmeb/xLC9unJ6OQXXHOn+JqZHskjLXnhMmOHrIZip8luL87wSHeyTtOTp+R/C4aO3P0JuXi8/PJF03iQuEPN0OvZspHvtd8ciQfN6Cg53wQhHkoRIT3zI7aPukwvlrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885708; c=relaxed/simple;
	bh=bzrfZszG4bWxM9GMkcwDsX81/KwgJq05nciWmAOqocU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEvoOQHt3NuSW6lisKkxgWXDYIyBAcyr9ZNKuonRf9SSuR01azEglIcewfHANkK+R/nWkQ0hc/SMqLeOLtbMLlYjSop2YfmAKHDW3AcaosEZHvljzxw9NZYqPhgaU4mHC37IsbuDfrzJZrkWBFi1dsBp1wGuSmXe2V1ADMBC8BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocF+Vy1/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832BE58023692;
	Wed, 3 Sep 2025 07:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e2Vs5uZsc+1
	8PkOfpN7x032DmlsrIqdtYfMxYXx5G14=; b=ocF+Vy1/UiogLxacmrBJYL6kFPO
	St7cW6isTQn/Vw7do0X6JYXFON+k0s7s6ce1VxW85/tCAscI7kH4NdPjkAxSUAUY
	n06oxu8RfmJME68mpaqCYVJdGz8TVwQzapN6mDE4378vfH8W+iKUqedDGqpUtfSU
	ooZz/G6/Jbli74oaK1VBb2eND7oMc59U+BJY3vh2AI1/l9A5GD8/VgYUT67GUwQ5
	6bGUUCXElcTIUGAE7Svo/s0QliZhrdFbl8AzTvoL0g8XGZaTNOsGVIIp8BIKwgAb
	Bruybk3m28ZPRYYvC09N7KOT5zIrpdFxgmc+jckCI2Oun7t0zOpZOzjsrcQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpaun0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 07:48:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5837mIGd002102;
	Wed, 3 Sep 2025 07:48:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48utcm5cy7-1;
	Wed, 03 Sep 2025 07:48:18 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5837mIFR002094;
	Wed, 3 Sep 2025 07:48:18 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 5837mI0Z002087;
	Wed, 03 Sep 2025 07:48:18 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id CAFE861B87A; Wed,  3 Sep 2025 13:18:17 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 2/2] ufs: ufs-qcom: Refactor MCQ register dump logic
Date: Wed,  3 Sep 2025 13:18:15 +0530
Message-ID: <20250903074815.8176-3-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com>
References: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dV84zc8pQasd9xpi6LB0IBOuRog45g8V
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b7f2c6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=Vs7wVDfjhEDCw-gDrcsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dV84zc8pQasd9xpi6LB0IBOuRog45g8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXxvPHC9AdlVCv
 4HeDLkiDYI0Xb8YdLesIiBmN/K4RcAwK46BkXFWqpa6/Q1nZiAAGpNjCx+cKhtnTWV/AOnS7iAT
 axcXV6tSyFNqbS4CILtdKFznIjuKyvyqW7ckRRSIrhMItOKj1CgMl9cFzNzzEyDVzuni86uDvY2
 RgrEePUMf0gwbwcR+Fztpd/oP7QfUO7pE7of3/vUFj4FFn3fD9ln/Xw+PZxefoigyRjfmyTSfZJ
 5myPVFdiHlvCSxWiLUMIoXXT9KDDr9rvOoUUtFklnEIYYFSNHTJC0BQkI8WwM37TAHXyQ8sVE6m
 6j9XfvzphxOjVTr4h80qH/UP2TKpdGojUE88KmBuG78MZY7dS0JbOV7PlsRvsiuhZYcR2yFFnw3
 wkEWFVkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Refactor MCQ register dump to align with the new resource mapping.
As part of refactor, below changes are done:

- Update ufs_qcom_dump_regs() function signature to accept direct
  base address instead of resource ID enum
- Modify ufs_qcom_dump_mcq_hci_regs() to use hba->mcq_base and
  calculated addresses from MCQ operation info
- Replace enum ufshcd_res with direct memory-mapped I/O addresses

Additionally Remove the ufshcd_res_info structure and associated
enum ufshcd_res definitions from the UFS host controller header.
These were previously used for MCQ resource mapping but are no
longer needed following recent refactoring to use direct base
addresses instead of multiple separate resource regions.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 34 +++++++++++++++++++---------------
 include/ufs/ufshcd.h        | 25 -------------------------
 2 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1383538b1ed8..52625b49029e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1742,7 +1742,7 @@ static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
 }

 static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
-			      const char *prefix, enum ufshcd_res id)
+			      const char *prefix, void __iomem *base)
 {
 	u32 *regs __free(kfree) = NULL;
 	size_t pos;
@@ -1755,7 +1755,7 @@ static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 		return -ENOMEM;

 	for (pos = 0; pos < len; pos += 4)
-		regs[pos / 4] = readl(hba->res[id].base + offset + pos);
+		regs[pos / 4] = readl(base + offset + pos);

 	print_hex_dump(KERN_ERR, prefix,
 		       len > 4 ? DUMP_PREFIX_OFFSET : DUMP_PREFIX_NONE,
@@ -1766,30 +1766,34 @@ static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,

 static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
 {
+	struct ufshcd_mcq_opr_info_t *opr = &hba->mcq_opr[0];
+	void __iomem *mcq_vs_base = hba->mcq_base + UFS_MEM_VS_BASE;
+
 	struct dump_info {
+		void __iomem *base;
 		size_t offset;
 		size_t len;
 		const char *prefix;
-		enum ufshcd_res id;
 	};

 	struct dump_info mcq_dumps[] = {
-		{0x0, 256 * 4, "MCQ HCI-0 ", RES_MCQ},
-		{0x400, 256 * 4, "MCQ HCI-1 ", RES_MCQ},
-		{0x0, 5 * 4, "MCQ VS-0 ", RES_MCQ_VS},
-		{0x0, 256 * 4, "MCQ SQD-0 ", RES_MCQ_SQD},
-		{0x400, 256 * 4, "MCQ SQD-1 ", RES_MCQ_SQD},
-		{0x800, 256 * 4, "MCQ SQD-2 ", RES_MCQ_SQD},
-		{0xc00, 256 * 4, "MCQ SQD-3 ", RES_MCQ_SQD},
-		{0x1000, 256 * 4, "MCQ SQD-4 ", RES_MCQ_SQD},
-		{0x1400, 256 * 4, "MCQ SQD-5 ", RES_MCQ_SQD},
-		{0x1800, 256 * 4, "MCQ SQD-6 ", RES_MCQ_SQD},
-		{0x1c00, 256 * 4, "MCQ SQD-7 ", RES_MCQ_SQD},
+		{hba->mcq_base, 0x0, 256 * 4, "MCQ HCI-0 "},
+		{hba->mcq_base, 0x400, 256 * 4, "MCQ HCI-1 "},
+		{mcq_vs_base, 0x0, 5 * 4, "MCQ VS-0 "},
+		{opr->base, 0x0, 256 * 4, "MCQ SQD-0 "},
+		{opr->base, 0x400, 256 * 4, "MCQ SQD-1 "},
+		{opr->base, 0x800, 256 * 4, "MCQ SQD-2 "},
+		{opr->base, 0xc00, 256 * 4, "MCQ SQD-3 "},
+		{opr->base, 0x1000, 256 * 4, "MCQ SQD-4 "},
+		{opr->base, 0x1400, 256 * 4, "MCQ SQD-5 "},
+		{opr->base, 0x1800, 256 * 4, "MCQ SQD-6 "},
+		{opr->base, 0x1c00, 256 * 4, "MCQ SQD-7 "},
+
 	};

 	for (int i = 0; i < ARRAY_SIZE(mcq_dumps); i++) {
 		ufs_qcom_dump_regs(hba, mcq_dumps[i].offset, mcq_dumps[i].len,
-				   mcq_dumps[i].prefix, mcq_dumps[i].id);
+				   mcq_dumps[i].prefix, mcq_dumps[i].base);
 		cond_resched();
 	}
 }
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 30ff169878dc..2f0bbb196577 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -793,30 +793,6 @@ struct ufs_hba_monitor {
 	bool enabled;
 };

-/**
- * struct ufshcd_res_info_t - MCQ related resource regions
- *
- * @name: resource name
- * @resource: pointer to resource region
- * @base: register base address
- */
-struct ufshcd_res_info {
-	const char *name;
-	struct resource *resource;
-	void __iomem *base;
-};
-
-enum ufshcd_res {
-	RES_UFS,
-	RES_MCQ,
-	RES_MCQ_SQD,
-	RES_MCQ_SQIS,
-	RES_MCQ_CQD,
-	RES_MCQ_CQIS,
-	RES_MCQ_VS,
-	RES_MAX,
-};
-
 /**
  * struct ufshcd_mcq_opr_info_t - Operation and Runtime registers
  *
@@ -1126,7 +1102,6 @@ struct ufs_hba {
 	bool lsdb_sup;
 	bool mcq_enabled;
 	bool mcq_esi_enabled;
-	struct ufshcd_res_info res[RES_MAX];
 	void __iomem *mcq_base;
 	struct ufs_hw_queue *uhq;
 	struct ufs_hw_queue *dev_cmd_queue;
--
2.50.1


