Return-Path: <linux-arm-msm+bounces-43963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F81EA01EAB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 05:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 971153A22C2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCAB1487C8;
	Mon,  6 Jan 2025 04:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aMCRQKg0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02A641C7F;
	Mon,  6 Jan 2025 04:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736138868; cv=none; b=k6w8b3wpLjlW8pG5axVeCx5DLhGixx+LoI/AMoK883XrQyKWucu3wY3VgYPBWVr5WgtAADjDBIrjRFn7C7Y14VnzEyLHekf3pDYuHosGsLVjCEtiz96ORs7Ujmn+KAJs7Eu8Yr6Anh4gZAUyBpVGxNqnQYUt2LW7MUTnp6r5KDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736138868; c=relaxed/simple;
	bh=soAbPI4lwZpccqDtGxlw28hRRqLxQYHtnSWOX00W9rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Lf7DvgE50gjftGUwiXQ8KNs1c93t3OPx2XX/OZeCfG8BHwhAYZxURfW3gY2hrHRCN38XHNOMU5I8ak9NAzCzeet4tS4w6lDfQSieXg4dFmAiGQjSZ9R8gpxvHBevDcSzB2m8BulAyf/K+MFFAQVfPu7HaHZcMyF57rWgVawI8p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aMCRQKg0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063XaGK032557;
	Mon, 6 Jan 2025 04:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/gqpzyT/+Upqt69kg17ewY
	yWAry0qAEIz+6/VMtmYv4=; b=aMCRQKg0d4q7jF1D4KDJV3UC30KLn4GZ5A00qR
	pnK1sp0WxWBz50S/YOzd51U0q0Q5RXm6HA3lGRhtlE8wVHf/xi3SnyZQbmiPgi9S
	Rnq5Z/WoBJjkUBQwtHQ0QvXcjBIELltlNkgE8BGXDFRwWqG6H0279w9PKcoLbMCH
	PkbAJ3lL4X+T7ubD9rOkyEPq+gQJivq9oSWfbuoqxBD8NKFOcJ0B/HajTSOy7nUB
	KzGL2AkJ22IUanrVAviU92CNd84+n9MQa5ppxOqQXYrd0b1acuRYcvvOoP75/SsS
	ZL0ufrg7LlRO1ByMiNVNDnsrb61YODFGPhCYE2dYPnPnYiqw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4407ck846d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 04:47:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5064lcju026186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 04:47:38 GMT
Received: from [10.213.96.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 5 Jan 2025
 20:47:36 -0800
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
Date: Mon, 6 Jan 2025 10:17:33 +0530
Subject: [PATCH] bus: mhi: host: Enable MSIx if the endpoint supports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250106-msix-v1-1-91d7b7143118@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGRge2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwMz3dzizArdRJNkUxMLi9TkxLRUJaDSgqLUtMwKsDHRsbW1ALCUOtR
 WAAAA
X-Change-ID: 20250106-msix-a4c5488ecafe
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736138856; l=1114;
 i=quic_vpernami@quicinc.com; s=20241114; h=from:subject:message-id;
 bh=soAbPI4lwZpccqDtGxlw28hRRqLxQYHtnSWOX00W9rg=;
 b=ReP5n8fYhTrCB1kTmkDrOAzzSy8J7PJNzyW27tvMlnL7CG0OXTF1szqXAPbswnePWr5R8bxy5
 g/HTdN+CZsSBUWDyWhDBIs0lvmFAdwvTKuX543RPgxVSg2on5MrWNxY
X-Developer-Key: i=quic_vpernami@quicinc.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: amOJUSaVx1X_RXVMkYi3Q-NNI2yfiFBL
X-Proofpoint-ORIG-GUID: amOJUSaVx1X_RXVMkYi3Q-NNI2yfiFBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=917 malwarescore=0 phishscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060040

Enable MSIx if the end point supports.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
Enable MSIx if the endpoint supports.
---
 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 56ba4192c89c16b4882d2e7c95f0dc689fd1e267..af1380220904a7e6232ff1b374da0a4ea49cb470 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -949,7 +949,7 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
 	 */
 	mhi_cntrl->nr_irqs = 1 + mhi_cntrl_config->num_events;
 
-	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSI);
+	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSIX | PCI_IRQ_MSI);
 	if (nr_vectors < 0) {
 		dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
 			nr_vectors);

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250106-msix-a4c5488ecafe

Best regards,
-- 
Vivek Pernamitta <quic_vpernami@quicinc.com>


