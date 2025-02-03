Return-Path: <linux-arm-msm+bounces-46695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC63A25229
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 06:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9AE1882A68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 05:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE7A1ADC94;
	Mon,  3 Feb 2025 05:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WInzdb9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842AE184F;
	Mon,  3 Feb 2025 05:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738561658; cv=none; b=BudBEnx1EgTWJbK62QIGOVC2IV8vaIUMZELYbMyUaQ3ojJQUXgJWrfPDvwO5hWLe9TYv5xAmQHOoYXN2blO3hhoSUrnsP5AQnhz6KdPj4d0wi+rFijAjByQi90srQjLoBPcG7X+TI6X4v3cP5eVfr5o/k8dC5UC4QtjItFxvbQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738561658; c=relaxed/simple;
	bh=PwPs+GNNpY7tL5KTtexek1KcnldeKWBfrDorxewc4fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rKgWHgY/5puEkeu02/bjbFgcXDwxwbtKnujX/Fb9eMTpikA6TeEQRZ1NPzUtARD6FRw1wc4HSZRPC42Q3fRkfqeiDqbeh5nLehxrOL8UQXsy77bi8FQJq2ydNw2l0uyXkyOaqQSvSNBcOWwpmZgXgOW6PdKxoDpfj0ej2t6KgIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WInzdb9j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512N0Zf2007832;
	Mon, 3 Feb 2025 05:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wAMNkaLpLRnVz08FGxjiocHC74acXvxCjV+I7fHh70=; b=WInzdb9j22/Ut2CT
	oi+SoZ5P9ZAz21zugDCXKFFWBGQ1IJbz17r21fGmyvSaFcRdm42u7GX4Q7cjHBf8
	CcEjOSFKGwT1YnuyZfULsQDwBX6ijWYUqIsXaF5ByJK/iShNRO2+B7ksql3of6U8
	TVc35z4+E+VB5M4K9tg9/CycVQuJIWPdDwqpCgaL7Ehxo7qe3ovtueypQSsT4eWh
	VaxRSSgtYoaauBXCEQQAOinL9R02COddCJkNzSGrH/WtLSkNU2WCdo1htp8cAclI
	SIakWpfNwKlXyXBTWSEWi7X+MmBfqdm9snwDJ3jkxPutmHJZEMkzmNGYOg0fo+hc
	N7Sv8Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jd428rm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 05:47:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5135lQB0017286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 05:47:26 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Feb 2025 21:47:22 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Mon, 3 Feb 2025 11:17:01 +0530
Subject: [PATCH v4 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250203-b4-branch-gfx-smmu-v4-1-eaa7aa762f48@quicinc.com>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738561638; l=1546;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=PwPs+GNNpY7tL5KTtexek1KcnldeKWBfrDorxewc4fc=;
 b=Sa8sIZPt5gMMG62yAvrif98Kl/Q4co4oMU0gVEq6/3AYVdIAXKwppyVHtbh9kmiS5rlTgBODQ
 +/HO8e9DTv4DkeBFy4RazSYRJP0caMk4pQmQ9BDYynJ0+6g0/SQWg22
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IE-Mrq591AMxYJ4L2A39E_vgiEvqqZKS
X-Proofpoint-ORIG-GUID: IE-Mrq591AMxYJ4L2A39E_vgiEvqqZKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=847 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030047

Add the compatible for Qualcomm QCS8300 GPU SMMU. Add the compatible
in the list of clocks required by the GPU SMMU and remove it from the
list of disallowed clocks.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 032fdc27127bffd689ffc23630c9978c4460b336..7b9d5507d6ccd6b845a57eeae59fe80ba75cc652 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -90,6 +90,7 @@ properties:
           - enum:
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
+              - qcom,qcs8300-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sar2130p-smmu-500
@@ -397,6 +398,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sc8280xp-smmu-500
@@ -581,7 +583,6 @@ allOf:
               - cavium,smmu-v2
               - marvell,ap806-smmu-500
               - nvidia,smmu-500
-              - qcom,qcs8300-smmu-500
               - qcom,qdu1000-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sc7180-smmu-500

-- 
2.34.1


