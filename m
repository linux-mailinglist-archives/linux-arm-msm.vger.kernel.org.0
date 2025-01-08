Return-Path: <linux-arm-msm+bounces-44430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6CA061AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DB533A060C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 16:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0501A2544;
	Wed,  8 Jan 2025 16:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FLCmzhMj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C978F24;
	Wed,  8 Jan 2025 16:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736353337; cv=none; b=JiZN7NIHRWXefj9cYzchS9mf8VkaeGr66z6wZYKbOiMVpobcCGPuw023424EvS52UN8KeFuhB2E8lz63JDrvdZEF3Vv7N9EfVAMD98tkBPcCb82OgNCMkrq1Hvr/3AFKoFKHusbN+B5FcLET9BWUfeQC4pyoRF61hkrh9sRaM3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736353337; c=relaxed/simple;
	bh=/eog0c9oJxhVe61umLTJvSiOGgnNYFlnwBTP2FARLv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ao5coGdZM35zJ1e+RJXYOXDqVfzWiQ/GraeNRMzmh8vmM9YnM0C9l9h6UszAvf3f5Y+iqgbM5ZyLbCs+IyNKlyQ/u4eJj7tCYl2duWHtNXBkcpfd2r+T2aVmPB37FemX/MeD3Rcpt+Cb9RsBuf7r2RmsrWXzX3rAqojwXddAWMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FLCmzhMj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkVTo007552;
	Wed, 8 Jan 2025 16:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nZjv1ZVKvHU15fL28WHAqc
	SEV1Yo6WljLspxexvmmic=; b=FLCmzhMjiZPY0ppLQ1u8HnvgjZQbJwzxc7f9xx
	UdvM50WAdwtlt2toBiDoWDs7rbUXyXs4BBDEKu0c6FOsmiNcm3OPVH68dOls2zfT
	oG3aqYYEsH3PWG1CUhU+UzwqS7EC4Z9A8yxSJMixXpVkLNjz3WW8E8iPn/F2egIa
	U8777mtXUaQYmlSkrhSWo370ObEeoXcc5QjQ6CATM8nhOTpNkQqOsFZr/Dg9EbkZ
	exhFOh2L8thBMvg8GsAgKcuTUVMFGg65lCnu57h6gMV4pZhRHN7QeG95TKAweqh8
	SJejvogSqsJh1mmZBFZHXgmSd/FXqc0hYBDABrBwuykAmwvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441pgns1v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 16:22:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508GMDuK024480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 16:22:13 GMT
Received: from [10.213.96.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 08:22:10 -0800
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
Date: Wed, 8 Jan 2025 21:52:07 +0530
Subject: [PATCH v2] bus: mhi: host: Enable MSI-X if the endpoint supports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-msix-v2-1-dc4466922350@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAC6mfmcC/13MQQ7CIBCF4as0sxbDILXoynuYLpBO7SwKCkpqG
 u4udunyf3n5VkgUmRKcmxUiZU4cfA21a8BN1t9J8FAblFStRHkUc+JFWO1abQw5OxLU6yPSyMv
 GXPvaE6dXiJ9Nzfhb/4CMAsUJh+7WoT4gmsvzzY6927swQ19K+QJQWr4TmgAAAA==
X-Change-ID: 20250106-msix-a4c5488ecafe
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736353330; l=1200;
 i=quic_vpernami@quicinc.com; s=20241114; h=from:subject:message-id;
 bh=/eog0c9oJxhVe61umLTJvSiOGgnNYFlnwBTP2FARLv0=;
 b=hP8IVucPKj1uk2/9ZJjxHsiKPcCbNIIi1leUomRT4qtXyOir3TenTHRS8vJR+7+7xsSRwh/SB
 3YwO0Pt7Kl+Ae9uIsxOkSLzHAcEEKuVarlrjreEeFItAFDmk34EoLhM
X-Developer-Key: i=quic_vpernami@quicinc.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K-xmDXDB5ovciU3ouDDyMen1pd7joTxi
X-Proofpoint-ORIG-GUID: K-xmDXDB5ovciU3ouDDyMen1pd7joTxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=968
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080135

Enable MSI-X if the endpoint supports.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
Changes in v2:
- Updated commit text.
- Link to v1: https://lore.kernel.org/r/20250106-msix-v1-1-91d7b7143118@quicinc.com
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


