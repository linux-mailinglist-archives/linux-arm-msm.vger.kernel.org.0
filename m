Return-Path: <linux-arm-msm+bounces-43489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 610519FD319
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 11:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10C3D18839FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 10:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257AD1F2C4B;
	Fri, 27 Dec 2024 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ih3zLQwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687981F2C5A;
	Fri, 27 Dec 2024 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735296449; cv=none; b=GormBDOE3fqsBBJMFsqMPK6CSCEueIemQE/5yODlzY9KiRHSLyEM41muIVdwM1hRGwOH96XTHEtI05JYyPq+xRyICVj+Ogm6le/ylCOqcc/G90smOJBiU1MvjApomGcEsnB0og0DCmQZkEbz81R2FfC/7bjMTd/texR8h9e3z7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735296449; c=relaxed/simple;
	bh=4qxpLP4BL6tnFXmvc1ewJEyMzQ9O02c+QH6fMlZmgt8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l9WJaZB8/jArw5F7rf4/crll1BclqKeoL7Q76jos6zl2b7OM5NlFDj3AQBYDvXCKXmPAl4fC/fF0N9krDth8JQ2D+GDy9ABvApLEseWGtC+0HD2WWfTlSUnUn1Hya9fQj5dHdPouV8MpdmuEl1lC9Msj/uovUnxPW5zNh/AgbOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ih3zLQwA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR7GkGk027353;
	Fri, 27 Dec 2024 10:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LOvgMEoB5bX6iIAdGfJEOwGI
	oEGrnke43nrVMKJ/VC8=; b=ih3zLQwAxfx1QW4YYSy3blUCl5PNYQfKBlIOG3GC
	3IqIvhbezhb8nnPOr72FZ9N5JCDyfwrb1ZNbGQTSoFhNEMKxV/tHD08uAe1hk75h
	CdmNF7ROnk9VJKjvbfuhCyapM+w3wj5BTRgR0bP8bKeSL9l2Y3ifSSfAFVtVej41
	d4RKZbYbfMUeJg+UO18WAjt5uz0Y0lMuYctcbFtqLNIp8+6CZNienjDROvKSV/4m
	khUfgNOJcsQ30E0VYBG3itTHbree4yZPfB6GJgEw4OYH2gbiC2F3Z2O4VubP/GOd
	9GL8gs03MVKB5VSSn/j6cPhywKeffncN7frY1zO6iEVHhw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43sqq317yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:47:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BRAlNtO014701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:47:23 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Dec 2024 02:47:20 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
To: <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Pratyush Brahma
	<quic_pbrahma@quicinc.com>
Subject: [PATCH v2 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
Date: Fri, 27 Dec 2024 16:16:50 +0530
Message-ID: <20241227104651.4531-2-quic_pbrahma@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241227104651.4531-1-quic_pbrahma@quicinc.com>
References: <20241227104651.4531-1-quic_pbrahma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YfowZIvJk9sb3n8MxXgiyQbVvVbKFyeQ
X-Proofpoint-ORIG-GUID: YfowZIvJk9sb3n8MxXgiyQbVvVbKFyeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=787 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270090

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


