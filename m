Return-Path: <linux-arm-msm+bounces-54468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558BA8AF9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 07:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7D418901B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 05:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45038229B1C;
	Wed, 16 Apr 2025 05:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ky0Bx9L4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0F2DFA2D;
	Wed, 16 Apr 2025 05:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744780816; cv=none; b=PuNJnoWXOvu7OsfdoqzRnGmi2T3FW6qigk9Wh3XN508xM2LNI5CWz2tGXZZgyMoZ88eYOetXPfOyeWsXJRhzjKZNGSAlaVkZPuF3urvv/q5x3tRXH+KHaLTpiDWzeX+uNEE2+d8nRsrxw4bVjbkDNALukyjvD+oDLDbxrcgaQYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744780816; c=relaxed/simple;
	bh=ESQ2oN9nXm6vmHym/ke59u1wDgpGwgUyr3I2Tc0CH4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=kqQ2QvOvzUjSfaW8+IjhyqbSlTtB/HnZfcFmLt5LyMrw4qJY8ziDZFSAIcGvfURecCqTV37yf5r5cWUPUS1FNv22I5DijJiYOU3Q0kUwbGDhj/IUE5gY5CIBS4dleWsVkeM8q/XzJ8BiGI6+JGb06MhBgAMnoa2fkjx7wf5hKQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ky0Bx9L4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIP3nt002462;
	Wed, 16 Apr 2025 05:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lyCV9w61kezqW+hyxdEuUg
	9aDP3j7LLl+vp6ActA4rE=; b=ky0Bx9L4wOhHdS9wa8mDt4WDXhebFjI16kAoHZ
	B1e4M8VCPxIzCge0M/oi6tEjtaqu3eRUVrTWBFyfQYv6ROeyFKBUQiNJ8i06x256
	KLAGPVeia5wDaFkzjM7zHEHmPF+I4nFKXJxNLsdvHUrzAlkks4Fj9j3ucdee0E3U
	2C+Tx91EgTAo1nUgQdBFjfqlOwqRdKZVjY8hJN+Zi1oDeJd/XrTkqatde3xOjOKT
	lsvj+dpJS0pqX8N7yqqEYtYiD4xPe45tOZ6ruZVFXhsWt4UcEwxWGguMRWgjECtf
	WMlU4IfZjxFQqCxpEBdTjbTC40yDNrLkKYxHDvd2qFdhPSbQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk290n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 05:20:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53G5KBuf022140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 05:20:11 GMT
Received: from hu-skananth-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Apr 2025 22:20:09 -0700
From: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Date: Wed, 16 Apr 2025 10:49:51 +0530
Subject: [PATCH] bus: mhi: host: pci_generic: Remove assign resource usage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250416-remove_assin_resource-v1-1-e92dd361fa0a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPY9/2cC/x3MQQqEMBAF0atIrycQg4rMVQaRaL7aCxPpZoIg3
 t3g8i2qLlIIQ+lbXSTIrJxiQf2paN58XGE4FJOzrrVN3RnBnjJGr8pxFGj6ywzjvQ1T3wfrMFF
 pD8HC5/v9Dff9AIlVy4dnAAAA
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Subramanian Ananthanarayanan
	<quic_skananth@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744780809; l=1126;
 i=quic_skananth@quicinc.com; s=20250226; h=from:subject:message-id;
 bh=ESQ2oN9nXm6vmHym/ke59u1wDgpGwgUyr3I2Tc0CH4o=;
 b=yP8KSspVJGICKxPHH7vOVoW+xBvWQehZ92oeUeXWCI0LfyLCEfhDqUHZtmZNz9L8ZxdF4X/1T
 M95tEU3Gz9VB/QEdkWKW9+nEvl+daMQEYCq6Y1sFyUIx7BXfXSuSqkt
X-Developer-Key: i=quic_skananth@quicinc.com; a=ed25519;
 pk=qK8fiOL1ZTyK9aSlenzVkhU0kUYm7W/FI0bFYebdRHE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67ff3e0c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=kS7YB_3fRQKMopNIP7oA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: U7tJRd1xOQMPj5qG52YpN6d3ZgFu-Jam
X-Proofpoint-ORIG-GUID: U7tJRd1xOQMPj5qG52YpN6d3ZgFu-Jam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=945 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160042

Avoid redundant usage of pci_assign_resource for BAR allocation.
This is already taken care by PCIe framework. Invocation of this
API leads to unnecessary relocation of BAR space to a new memory
address.

Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 03aa88795209..7501abc835c7 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -996,10 +996,6 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
 	int err;
 
-	err = pci_assign_resource(pdev, bar_num);
-	if (err)
-		return err;
-
 	err = pcim_enable_device(pdev);
 	if (err) {
 		dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);

---
base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
change-id: 20250416-remove_assin_resource-aa0db88d02eb

Best regards,
-- 
Subramanian Ananthanarayanan <quic_skananth@quicinc.com>


