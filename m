Return-Path: <linux-arm-msm+bounces-45455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C86A1556E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 18:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5CD63A4142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9846B1A76BC;
	Fri, 17 Jan 2025 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XTxdI/te"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E311A7249;
	Fri, 17 Jan 2025 17:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133814; cv=none; b=f1Yr4qPOb6E8fkr+tYZxe9CcMB41TGfiQHLUgd6twcL31Vaed6JIlwU5plrNP1NRcFEjUw6Z9nV31lww09GBbulbM6sGZq8WCRTsHdRoYg5eidVfesPXI6VP9sYMckv6Vu/g82uswZ0tAhT43bAygrewLgzoduIrXB1xQkcUiNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133814; c=relaxed/simple;
	bh=SD1x9aXsESdpqAv7FacSdi71Mww0a05rIoAqg1PPrMM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rEzpH7e5+eg9EppLBwbFbjZP3ZV+h7UF47el/Ac+B8OkUFsjNTBUW4J+N3CJSVZe9lZ0+ldVcaXVbjcOjZ96uhw7ihSh7XeCFTNsiQQ1xFQ3Sq7cAJNK97ZOHDBXoXcZdTj/gmege8JzzeXdg4grnzaM5U6MsiBYCR9Lqu4pV7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XTxdI/te; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H9K0Gf011617;
	Fri, 17 Jan 2025 17:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VPLIqVL8ZjdJpqW8PLWpdf6TK1aQ+tquCYdDMspBgjI=; b=XTxdI/tet9V0dkiT
	8S24I/5UuAERrfLG8PoOyciVvxvSmhNiED2iK4uw5Ge6+OzAyRs3wRxRXhoPsAFw
	7A8V+ssTz0wkXavpNt+4h7cxIWMO3OMaent+77yur4iknePXihRiYmPzrjfhVhj7
	bMx2U8x5q1A5BArum354C/V3yj0Tlzq/0xnC9Q4jbqakdu7/r+R/lz8mtXBbZSiq
	BVAHJSK1BWwaDPUXr9AsqFcasCClvXGYNCUVUfptIW4RDoUflx7h54CybTLYm5M8
	M3WWgVFLU2OHUeYAirCyOmCUOyosNx4tgYP+lfDC+oVwoNt2+iPLlXRDES6uFcfb
	noI98w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447mfqs7ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 17:10:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HHA4cV028645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 17:10:04 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 Jan 2025 09:10:03 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
        <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH v2 3/7] accel/qaic: Allocate an exact number of MSIs
Date: Fri, 17 Jan 2025 10:09:39 -0700
Message-ID: <20250117170943.2643280-4-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: rrzsg8cYZ1_MDcals59ZQE2tm9jMhBoh
X-Proofpoint-GUID: rrzsg8cYZ1_MDcals59ZQE2tm9jMhBoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=989
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170134

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
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
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


