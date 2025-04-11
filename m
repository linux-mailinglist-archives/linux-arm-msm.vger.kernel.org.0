Return-Path: <linux-arm-msm+bounces-54018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BAAA85CD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 708F39A4961
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D543129DB9A;
	Fri, 11 Apr 2025 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iu7WX7+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04ED29DB9C;
	Fri, 11 Apr 2025 12:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373665; cv=none; b=fHWMFB1sHx5aGBuKUdUV4T1Lfy+QhY9uq7zX2+u9/3E7XLDsht9Gfs8py9PmkVbUj5XBm6Akfp7dlYDjTQzkiHZitNjO+eqRtMs+OujRPZ1qVCpPZv2H9P7NvgfAyezoMfAxwPNraVYy9Jvr/IZ2whnsOx3+AbXfyDJ5TCMTQGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373665; c=relaxed/simple;
	bh=V8IEbrrIKcRvYY5Xac9swmexAXB2Rf4t8KhLPJnZEcQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=glyBWdt6xzaXHdBTrQA3CrwY+LQgY7P7MJKbMOIhEj8/iQVH5WPduoHchYsBREA584Hk1Z17rThjaxhSxo0F0q0ruP+6BwCZAUwXsRon7XHdDqdvGGV093j3UyEIbhDwRfN1/LTbGDbf/JaTe1MXXhiNyyJCL4g5buMmyAsPevA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Iu7WX7+0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5eCpD000333;
	Fri, 11 Apr 2025 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3tSblUWUAqbLhb/ax47oFkaQ
	Hzs6gm5u/BMBh8vwrvo=; b=Iu7WX7+0rVMcbB/9R7KIfgHiQxjluEAw3DYxk7sf
	J8708DZR0JReRMm2gcmNFkXtwZPjCvmEZZpzpD020jJKyFo9ZwgC67tTlGn0PHKs
	okFd4jc9xf4bKGokJ3w6X654dbDKgW+bXbdXrRaQmrS7yH57USWHy+cRXXkioJ3u
	1RV3XmynuNiUg1tGEVIriMYjpkXbglYUUEDiY9cYAMJtRFhsa6iOVPfEZ4sY2W+z
	57sdbUCTXyFt9V9DVBSTlR9KHriFnrBk9iBiPiM/XOHR7EqSgpbraB9MIWoQd4E2
	rUlfs6YkNfMZLW7AOAlXmx6cE88XOoX+h5QDRm1hxnyf6g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkt3w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:14:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BCEIVO022063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:14:18 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 05:14:15 -0700
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
Subject: [PATCH V7 3/3] scsi: ufs-qcom: Add support to dump testbus registers
Date: Fri, 11 Apr 2025 17:43:45 +0530
Message-ID: <20250411121345.16859-4-quic_mapa@quicinc.com>
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
X-Proofpoint-GUID: JnrVdh8EWZQqvokpsjyIJGHu7H7G2f_m
X-Proofpoint-ORIG-GUID: JnrVdh8EWZQqvokpsjyIJGHu7H7G2f_m
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f9079b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=oU32yFmJg_HV1qE5Ry8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=939 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110078

Add support to dump testbus registers to enhance debugging
capabilities for the Qualcomm UFS Host Controller.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4c0fe80f65f9..d879f1290046 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -5,6 +5,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/devfreq.h>
 #include <linux/gpio/consumer.h>
@@ -98,6 +99,24 @@ static const struct __ufs_qcom_bw_table {
 	[MODE_MAX][0][0]		    = { 7643136,	819200 },
 };
 
+static const struct {
+	int nminor;
+	char *prefix;
+} testbus_info[TSTBUS_MAX] = {
+	[TSTBUS_UAWM]     = {32, "TSTBUS_UAWM"},
+	[TSTBUS_UARM]     = {32, "TSTBUS_UARM"},
+	[TSTBUS_TXUC]     = {32, "TSTBUS_TXUC"},
+	[TSTBUS_RXUC]     = {32, "TSTBUS_RXUC"},
+	[TSTBUS_DFC]      = {32, "TSTBUS_DFC"},
+	[TSTBUS_TRLUT]    = {32, "TSTBUS_TRLUT"},
+	[TSTBUS_TMRLUT]   = {32, "TSTBUS_TMRLUT"},
+	[TSTBUS_OCSC]     = {32, "TSTBUS_OCSC"},
+	[TSTBUS_UTP_HCI]  = {32, "TSTBUS_UTP_HCI"},
+	[TSTBUS_COMBINED] = {32, "TSTBUS_COMBINED"},
+	[TSTBUS_WRAPPER]  = {32, "TSTBUS_WRAPPER"},
+	[TSTBUS_UNIPRO]   = {256, "TSTBUS_UNIPRO"},
+};
+
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
 static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
 
@@ -1566,6 +1585,32 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	return 0;
 }
 
+static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	int i, j, nminor = 0, testbus_len = 0;
+	u32 *testbus __free(kfree) = NULL;
+	char *prefix;
+
+	testbus = kmalloc_array(256, sizeof(u32), GFP_KERNEL);
+	if (!testbus)
+		return;
+
+	for (j = 0; j < TSTBUS_MAX; j++) {
+		nminor = testbus_info[j].nminor;
+		prefix = testbus_info[j].prefix;
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
+}
+
 static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 			      const char *prefix, enum ufshcd_res id)
 {
@@ -1688,6 +1733,11 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 		/* Dump MCQ Host Vendor Specific Registers */
 		if (hba->mcq_enabled)
 			ufs_qcom_dump_mcq_hci_regs(hba);
+
+		/* voluntarily yield the CPU as we are dumping too much data */
+		ufshcd_dump_regs(hba, UFS_TEST_BUS, 4, "UFS_TEST_BUS ");
+		cond_resched();
+		ufs_qcom_dump_testbus(hba);
 	}
 }
 
-- 
2.17.1


