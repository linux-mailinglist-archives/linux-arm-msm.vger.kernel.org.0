Return-Path: <linux-arm-msm+bounces-2754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C37FFB49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 20:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FF2C2829A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 19:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE8452F66;
	Thu, 30 Nov 2023 19:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P5dPOH//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C38D67;
	Thu, 30 Nov 2023 11:27:26 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUEF99W004178;
	Thu, 30 Nov 2023 19:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=S17FyCa7/JKacquJznXxc0KHjJ53rZYY+/m/wOeVpK8=;
 b=P5dPOH//gAxw4fm0fDY2iHV3EXBzZV3dGjoiyRzkFHaHbTpbN9BeDbqOiR+4XzeLZqB7
 ryYo2zQ1jKynB7mAH+AtzmUQcCHL/qHMneSD8YyTUvjIzLxEql3IqWFZ/hm4JbWKdWYu
 xNszs+VErD/p9dnnE0VJDo8ncYD1TAaEbHdFs+Rl6vHfXz+29wayzEA9u19N+sV44Ukz
 sccXWaBMePPvg+ysghOLRkbk11mQ9/smoU3jiIxU2Y2RsZ40ttqNV8ih5Jfh1NH6lB7n
 Sv0fDhvagBrsQ1AdYMGxjVkf0MRigw4XEV8XwebY6oYpJvhR6htiOAoriSUSMdPfyYkB EQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upjdqac9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 19:27:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUJR68o010157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 19:27:06 GMT
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 11:26:59 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <catalin.marinas@arm.com>,
        <ulf.hansson@linaro.org>
CC: <agross@kernel.org>, <conor+dt@kernel.org>, <ayan.kumar.halder@amd.com>,
        <j@jannau.net>, <dmitry.baryshkov@linaro.org>,
        <nfraprado@collabora.com>, <m.szyprowski@samsung.com>,
        <u-kumar1@ti.com>, <peng.fan@nxp.com>, <lpieralisi@kernel.org>,
        <quic_rjendra@quicinc.com>, <abel.vesa@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_tsoni@quicinc.com>, <neil.armstrong@linaro.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH V4 2/5] dt-bindings: arm: qcom: Document X1E80100 SoC and boards
Date: Fri, 1 Dec 2023 00:56:16 +0530
Message-ID: <20231130192619.29702-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231130192619.29702-1-quic_sibis@quicinc.com>
References: <20231130192619.29702-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V-uPOosgLatuniuYTf2zxiqp-XuDN6jS
X-Proofpoint-ORIG-GUID: V-uPOosgLatuniuYTf2zxiqp-XuDN6jS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_19,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300143

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Document the X1E80100 SoC binding and also the boards using it.
Also document the new board id qcp (Qualcomm Compute Platform).

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 88b84035e7b1..6458ed828819 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ description: |
         sm8350
         sm8450
         sm8550
+        x1e80100
 
   The 'board' element must be one of the following strings:
 
@@ -110,6 +111,7 @@ description: |
         liquid
         rdp432-c2
         mtp
+        qcp
         qrd
         rb2
         ride
@@ -1044,6 +1046,12 @@ properties:
               - qcom,sm8550-qrd
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - qcom,x1e80100-crd
+              - qcom,x1e80100-qcp
+          - const: qcom,x1e80100
+
   # Board compatibles go above
 
   qcom,msm-id:
-- 
2.17.1


