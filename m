Return-Path: <linux-arm-msm+bounces-43492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BAA9FD356
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 11:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08679163A12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 10:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D6E1F1305;
	Fri, 27 Dec 2024 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CwE4mNPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF25C42A83;
	Fri, 27 Dec 2024 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297137; cv=none; b=OzI13YzUOA4cVYnKGEj6C1exk0MSWcD2ulPGUrKUbuOrwsXvMJ9uH3TocctX5x7e42nqL8QORCHHVww8Lc5gqe69HUe4PyNYrcwDb5OQ0G3e5L7LNp27l+ZBQTBGuYNeprTfQg1DyqcAY6otJXpPagD/n8GrmWObBFjZW0/+Msg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297137; c=relaxed/simple;
	bh=4qxpLP4BL6tnFXmvc1ewJEyMzQ9O02c+QH6fMlZmgt8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4KTxw2Kzo923Y+aPAqvPg7gwKU4A1FifKnb34TqWJ/R0C/d6SumpHEB6pBcnaxT7WS3X4nxkCNhXLwMsbPbm1GojYkQEjC4acm/K8HLx8xhfKSQto3wr/PjttWKGMxDp7/V1hKjtISTWJ4Zj+C9PFZ7Z7eCOWZ3mk4P1cecFOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CwE4mNPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR8c56V000592;
	Fri, 27 Dec 2024 10:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LOvgMEoB5bX6iIAdGfJEOwGI
	oEGrnke43nrVMKJ/VC8=; b=CwE4mNPUwPd9fZbHCJGpqA4NE49GPZ1z1wnUBi5g
	0leAg23a/6UP8ZHfuRdOndJ3641wp1j6K5KEP42HNFbiUNwtryBZzf6GSwxz8JJ3
	P9waQV12a0USzqDLvPNh9QS+M5YfZflf4wEMg+Mfaa+cQGgyG8yQdyzJMPhG40ox
	161nlhFsIRp/LSKwDn2actY8TpWpEBKr6Y5s8Wd3M2sIES40VsgRSEuvLEYkq0E4
	9RW0WqLKx/fyZP7Lx7hxKvbJBIh72Y49cgOAQPxBxeR4Tldy+Tn0peM9z7N6yqR0
	AMCY/tPiNUKqfUjhBsxtxm4wAwnWBP4KzzEdlW+m79VsjA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43srw30p75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:58:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BRAwqiq007223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:58:52 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Dec 2024 02:58:49 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
To: <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Pratyush Brahma
	<quic_pbrahma@quicinc.com>
Subject: [PATCH v3 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
Date: Fri, 27 Dec 2024 16:28:17 +0530
Message-ID: <20241227105818.28516-2-quic_pbrahma@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241227105818.28516-1-quic_pbrahma@quicinc.com>
References: <20241227105818.28516-1-quic_pbrahma@quicinc.com>
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
X-Proofpoint-GUID: c_UO8nBMQNDO3rjVrpO6P1iFDTAAg1mL
X-Proofpoint-ORIG-GUID: c_UO8nBMQNDO3rjVrpO6P1iFDTAAg1mL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=787 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412270090

Add the compatible for Qualcomm QCS8300 GPU SMMU. Add the compatible
in the list of clocks required by the GPU SMMU and remove it from the
list of disallowed clocks.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index c1e11bc6b7a0..1a1b2263fe69 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -88,6 +88,7 @@ properties:
         items:
           - enum:
               - qcom,qcm2290-smmu-500
+              - qcom,qcs8300-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sar2130p-smmu-500
@@ -393,6 +394,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sc8280xp-smmu-500
@@ -560,7 +562,6 @@ allOf:
               - marvell,ap806-smmu-500
               - nvidia,smmu-500
               - qcom,qcs615-smmu-500
-              - qcom,qcs8300-smmu-500
               - qcom,qdu1000-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sc7180-smmu-500
-- 
2.17.1


