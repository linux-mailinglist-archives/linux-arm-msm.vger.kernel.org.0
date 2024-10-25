Return-Path: <linux-arm-msm+bounces-35787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D604A9AF958
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 07:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC6F1F230E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADCC1ACDF0;
	Fri, 25 Oct 2024 05:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VJS80HPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381C19993D;
	Fri, 25 Oct 2024 05:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729835488; cv=none; b=PpIcwwXvX6l3cEg46kdLkFd2zqvvlEC3gcR1LB5E+gDKMb1vy4A6wvGECOv8423xarh9Noz5oA0/7alP3POyXxUynOZBYBscVF/yA2L0KQUcCnkS7oz5p5PWWAEtEV7GNv/oQIVmfsYSrirvZGthbRifR4cJwoizbLXibHY3shY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729835488; c=relaxed/simple;
	bh=B7fZ/OVHZX5YlEcaeAx1K3Us1XeKsGEPbqyYp+xcNMc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g0CqeeDxciUrU9NtBAgNO3vmvj2CNj1IvEJoKut8cKo0t8Ur+0WydoDbBhWVMHcUdXKOORuJR7MmhSTjBN/vNqF8hmfCNS+fVoH23TnsNZ82yNyIDSzNoOpwzRo54PQudDj1eYzhwTRgffuMAZr7g6mP9CK7/ZDarQCaH3TNJXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VJS80HPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ONoodH030354;
	Fri, 25 Oct 2024 05:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t2ik2bBjKtCjQZlYdqR9WQdW
	oYdk2eZjcqvDQxiIJxg=; b=VJS80HPhbtIDM7i+2J04Z4oa3nAWi4BJf7cS1/eq
	cEYpnHAzb86GvhJTQviRZ/bSV0xb0UpwuskHZZSR2YiPrp+MzFT2vKH3VOflQKZa
	d14VroMqbtcyUghN0Xd0+i3BBKVu/uoU9Fhn29TwNgo8a/Zuj70DxQDzuv0gU+Ty
	7f9oGzB6ZNFO/Sh7az69Yvif2MKrvFsq4I4A7JjKa4kF7dwHG7QUpvbE32wdKF3o
	a0MjY4Jjsd/0rvVxrGlVS+t++j130gvaWMXMepo6umz2G8w+KN9JyuOyjpYbM0RO
	1pvrey5VxS8mhYyo0iUt0KzLdCggPkI7slqcjQaSQ3Bbsw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w7xg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:51:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P5pLud006404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:51:21 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 22:51:18 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
Subject: [PATCH 3/3] scsi: ufs-qcom: Add support for testbus registers
Date: Fri, 25 Oct 2024 11:20:54 +0530
Message-ID: <20241025055054.23170-4-quic_mapa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ymJLZmPDXWUTFRE6Thok_Zjk7PVfPIpc
X-Proofpoint-GUID: ymJLZmPDXWUTFRE6Thok_Zjk7PVfPIpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=974
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250043

This patch introduces support for dumping testbus registers,
enhancing the debugging capabilities for UFS-QCOM drivers.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 73 +++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index a43e818a7e14..7370b4a3bb83 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1480,6 +1480,75 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
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
@@ -1596,6 +1665,10 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
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


