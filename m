Return-Path: <linux-arm-msm+bounces-42123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0F79F1816
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C4F27A0309
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 21:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD07194A6C;
	Fri, 13 Dec 2024 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bu5obHVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9602192D9A;
	Fri, 13 Dec 2024 21:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734125655; cv=none; b=AQJvNXyxPe9OBLafMSG4xl1LFHeB8DvXherOqQmyYogMVjds8DQl2K0PwMJQr85b34p9vtsGf55bCABUHWtB5/tdEE+0FnkvUZYhWVcLxjpAsKKL//6roAzPqp+uPnynVl3BdIeMqWxSEhNErCB115sYOF9Oj9114acvqFsQ4fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734125655; c=relaxed/simple;
	bh=0urrsYAD/jIdrUL+GqIAUWogIHQ/tA0WEmOA2OAI4tQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzZpDjvQd76Fpb0PMSdUMeTsAUMkp2J7Q1/GqJ8iXXUqB3Bc6f1Uc4mopckgoEpIA0CWRbQ7bpTCQbOrEGFBonf4jbRofyDjI1RRcMTHEQxgAygvOcDXNlEZa7Vak6tm48lB4xOJrExLUFaH7GMmPBf4JM2WwMf3h/sfybMNa7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bu5obHVu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3xWd013192;
	Fri, 13 Dec 2024 21:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZVM/haSA3wAHK0jz5IG4KCEMlBgCUMsrWv34C+WOO4=; b=bu5obHVuiEd7Wgi2
	D2S+XzwCe+It9PgSjqNC8tRwYevSncFPajcs+6L7s4pjf7jore2BvjOiHx85Rftl
	fypl5Rtj6coCLEjIEmeE+RYE8UmfT+sRMpsXHTW/Ofhbs0wGXdY/balLkGWKMDu2
	k/kitRvZo8rODqVHOew7vWVI2SdgGAG/lM0v2xVRuUjVq+PMAAV6X9qB8T949smz
	ZFku3E51u698YbF583EZeNzqjqWZgkHbSd+OR8P4KY/JJ2wVyPIdHFz1LXVS4aaQ
	V5cKiJZoVZ+b2aNBZpVT7qwEmnh9q350CuRhXI/dVi8DYN4K6NkOihiwY+uerJaT
	cdp4CA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudhp1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 21:34:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDLY4ua010850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 21:34:04 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 13:34:04 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
        <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH 3/7] accel/qaic: Allocate an exact number of MSIs
Date: Fri, 13 Dec 2024 14:33:36 -0700
Message-ID: <20241213213340.2551697-4-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: ALqaDEm-4uBumoxPWU29WbM9-9aEPb7X
X-Proofpoint-ORIG-GUID: ALqaDEm-4uBumoxPWU29WbM9-9aEPb7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=998 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130152

From: Youssef Samir <quic_yabdulra@quicinc.com>

Devices use 1 MSI vector for the MHI controller and as many vectors as
the DMA bridge channels on the device. During the probing of the
device, the driver allocates 32 MSI vectors, which is usually more
than what is needed for AIC100 devices, which is wasting resources.

Allocate only the needed number of MSI vectors per device.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 81819b9ef8d4..6e9bed17b3f1 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -465,12 +465,13 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
 
 static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
 {
+	int irq_count = qdev->num_dbc + 1;
 	int mhi_irq;
 	int ret;
 	int i;
 
 	/* Managed release since we use pcim_enable_device */
-	ret = pci_alloc_irq_vectors(pdev, 32, 32, PCI_IRQ_MSI);
+	ret = pci_alloc_irq_vectors(pdev, irq_count, irq_count, PCI_IRQ_MSI);
 	if (ret == -ENOSPC) {
 		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
 		if (ret < 0)
@@ -485,7 +486,8 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
 		 * interrupted, it shouldn't race with itself.
 		 */
 		qdev->single_msi = true;
-		pci_info(pdev, "Allocating 32 MSIs failed, operating in 1 MSI mode. Performance may be impacted.\n");
+		pci_info(pdev, "Allocating %d MSIs failed, operating in 1 MSI mode. Performance may be impacted.\n",
+			 irq_count);
 	} else if (ret < 0) {
 		return ret;
 	}
-- 
2.34.1


