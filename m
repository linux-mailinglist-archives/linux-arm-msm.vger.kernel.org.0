Return-Path: <linux-arm-msm+bounces-3409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C390804A00
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 07:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C09281C20CDD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 06:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BF4DDD9;
	Tue,  5 Dec 2023 06:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cPvrQGn0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFBDD7;
	Mon,  4 Dec 2023 22:25:03 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B56CgLs021028;
	Tue, 5 Dec 2023 06:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=tPfUWQLZa2mNmzEpXqOSYGCABiDChHh3pQw2H52jLnw=;
 b=cPvrQGn0vbD36B0URI0usPfaEJvK8uUnQOMD+A4D88QEZvBspDXIDHSnLXa3YEvaEmwV
 kUBqOMh3GeYy6iQ6mUfcz2Pvf7AVJE9VW6cra5OC2zE9kSwx759UBrueFz0izlw4Gk/5
 m0goFkXS01Y2wJiCXyMIGE0dUZrpVbWyjwBM75oDv2ZCqawCncFbGMR2ZGRrEgHjMmm9
 931yJT5q8o7N7atF5hlnbwa6h4wk5NOg/Cth/Ute1hhfLzo+62GO4J0jNL35q06hxHut
 pPkgGUos2S2XRKpBddCxK3EHJp/af7DxsnJ1OBO31IPQwV0bIjBATF6yZ7R3HvVZe439 mA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usuqsga5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 06:24:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B56OfRs021606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Dec 2023 06:24:41 GMT
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Dec 2023 22:24:34 -0800
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
Subject: [PATCH V5 2/5] dt-bindings: arm: qcom: Document X1E80100 SoC and boards
Date: Tue, 5 Dec 2023 11:54:00 +0530
Message-ID: <20231205062403.14848-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231205062403.14848-1-quic_sibis@quicinc.com>
References: <20231205062403.14848-1-quic_sibis@quicinc.com>
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
X-Proofpoint-ORIG-GUID: AQTAVC6SAV5E7xFt5ceLqV3M5p_vrDLS
X-Proofpoint-GUID: AQTAVC6SAV5E7xFt5ceLqV3M5p_vrDLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_03,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312050052

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
index e09745a802fd..f62ce85fc9b9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ description: |
         sm8350
         sm8450
         sm8550
+        x1e80100
 
   The 'board' element must be one of the following strings:
 
@@ -96,6 +97,7 @@ description: |
         idp
         liquid
         mtp
+        qcp
         qrd
         rb2
         ride
@@ -1038,6 +1040,12 @@ properties:
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


