Return-Path: <linux-arm-msm+bounces-33149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382E99100E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 22:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBF991F27442
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 20:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5021DACB5;
	Fri,  4 Oct 2024 19:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KZ4CEaZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C37F1C7612;
	Fri,  4 Oct 2024 19:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728071560; cv=none; b=M2+wztAaX3qJQtVSz2lynjSLXeWgO3Ypxu/XBr3K3ycQEwrCu1BI9RgIPzMdzlwW33Ha6wH1wtAaskbbq4bEnAlszquat5+aW8ig0U6aKm6V7FWs6QILIyornVo6OIg+Q7q+ZHeMOr+IkmjR296jehhTtZXq9rj0nWNge4aIpnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728071560; c=relaxed/simple;
	bh=3Qf7N7Oa/RYSFMHjnt6wKKxCvCNRpA3mIiiOY1vPB3k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sd/ZNbrcTM9sgPDwUelnX4Mjo6EwLvSZtjCtp314UjRB9HIGJxTtqg4GzDs3miWKDh93NGQviSsA+MiDxf/juHQkiOQzgth+DOUfHVulp3xuFO9YNrY0wJCov13VHrrhQh6vUJS0hONO0V7i7KjXIazoRq5un9fEYL/4XQC8jq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KZ4CEaZL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494BWS6A022414;
	Fri, 4 Oct 2024 19:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GX4uEn00zKw7iT53262MrW
	2Y1ED50HxMbsaFMpip2ds=; b=KZ4CEaZLqHvVxH6vhNSj6XYglGAZlrODTU34SB
	6yXNkufsxK/2zrZGKTKvPruIdTnK9LxcHRDoFE0jLKtyYpaL0CZQuY8VN1P0UMGb
	BA2JBQ6Cos0bC9d6/vZy+SUFz9W9KwD9b6+6DJ0v3TF4vkMVw0nnQ8vG0MCaeNdt
	IAN8QPrCpx0WUJuNyGITA35Z+6HbtZx4A+eRoGFT8NmJWR0eaZc5SelpMr5y8oxl
	oOAg6AqEvkA+Cbw4gAHuk8sus0IGfB2UvkmBSNoz/UaRQ5xmJSzMxC6CBG8ywoTE
	ubVaCQ4YKV57NwQaG6oeoJcUR7KcWLiWSIg4WE2sTM2TEfdw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205ku5r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 19:52:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494JqTLM004674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 19:52:29 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 12:52:28 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
        <jacek.lawrynowicz@linux.intel.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Troy Hanson <quic_thanson@quicinc.com>
Subject: [PATCH] accel/qaic: Add AIC080 support
Date: Fri, 4 Oct 2024 13:52:09 -0600
Message-ID: <20241004195209.3910996-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MB78KD9SVRzxncK9GLChfi3s8JYb-VI4
X-Proofpoint-ORIG-GUID: MB78KD9SVRzxncK9GLChfi3s8JYb-VI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040137

Add basic support for the new AIC080 product. The PCIe Device ID is
0xa080. AIC080 is a lower cost, lower performance SKU variant of AIC100.
From the qaic perspective, it is the same as AIC100.

Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 Documentation/accel/qaic/aic080.rst | 14 ++++++++++++++
 Documentation/accel/qaic/index.rst  |  1 +
 drivers/accel/qaic/qaic_drv.c       |  4 +++-
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/accel/qaic/aic080.rst

diff --git a/Documentation/accel/qaic/aic080.rst b/Documentation/accel/qaic/aic080.rst
new file mode 100644
index 000000000000..d563771ea6ce
--- /dev/null
+++ b/Documentation/accel/qaic/aic080.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+===============================
+ Qualcomm Cloud AI 80 (AIC080)
+===============================
+
+Overview
+========
+
+The Qualcomm Cloud AI 80/AIC080 family of products are a derivative of AIC100.
+The number of NSPs and clock rates are reduced to fit within resource
+constrained solutions. The PCIe Product ID is 0xa080.
+
+As a derivative product, all AIC100 documentation applies.
diff --git a/Documentation/accel/qaic/index.rst b/Documentation/accel/qaic/index.rst
index ad19b88d1a66..967b9dd8bace 100644
--- a/Documentation/accel/qaic/index.rst
+++ b/Documentation/accel/qaic/index.rst
@@ -10,4 +10,5 @@ accelerator cards.
 .. toctree::
 
    qaic
+   aic080
    aic100
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index bf10156c334e..f139c564eadf 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -34,6 +34,7 @@
 
 MODULE_IMPORT_NS(DMA_BUF);
 
+#define PCI_DEV_AIC080			0xa080
 #define PCI_DEV_AIC100			0xa100
 #define QAIC_NAME			"qaic"
 #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
@@ -365,7 +366,7 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
 		return NULL;
 
 	qdev->dev_state = QAIC_OFFLINE;
-	if (id->device == PCI_DEV_AIC100) {
+	if (id->device == PCI_DEV_AIC080 || id->device == PCI_DEV_AIC100) {
 		qdev->num_dbc = 16;
 		qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
 		if (!qdev->dbc)
@@ -607,6 +608,7 @@ static struct mhi_driver qaic_mhi_driver = {
 };
 
 static const struct pci_device_id qaic_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC080), },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
 	{ }
 };
-- 
2.34.1


