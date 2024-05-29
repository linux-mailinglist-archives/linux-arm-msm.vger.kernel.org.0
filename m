Return-Path: <linux-arm-msm+bounces-20919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E5F8D3445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F9E4285CFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D7517B404;
	Wed, 29 May 2024 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E8feXSlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717024D11B;
	Wed, 29 May 2024 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977762; cv=none; b=hgR0tkfaOoRHWRziNpZM55YKSkirqInqz2dJKKRoc4y7b9AY4SHePwAylbNT8CM0JDMjmXgrj5rMxT9k3I/sB3ZfWvU8PzWDCWsuLIJxvzQkWU/1WiQADtsYJUN6laVQLstNStv05yNVDY41sw97RUqohHRRrP8k79O7Q8lstws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977762; c=relaxed/simple;
	bh=RfEFRRd9vI94cT0QpxdtWvq4MDXp4Y5OWr17oVhMZww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=En5UfPmWEnHS8R/O79NS5u4/h1pUGWq5PIWqB2ajEcbXBz9q7UUA9u29ipyswkFmPdqgRkQSDTp+lOqWCB/pCHcqyCoFebgJ0/2wPIgQdGBk4lb0tj7+C0kuBMhyAqq+dFH5omHgfQAESzBz5DsCDB8XF182dNU4NVH5sd/xZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E8feXSlh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TAEA8a001343;
	Wed, 29 May 2024 10:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	meCAq1XHQGhKSwQcEsW5CAuloGIpE2Gw4hEHdDvdrCc=; b=E8feXSlhaepZ4DdU
	OrbGTHpwOLqwjZ06QUH6/gigXtfWdseZpINglK1HGm5bE2wQDIxCp+MdNCKDXkGr
	Zp9Rfk3WKsuUbcAmTnKwQdoWJSN5UCWBUYCZdAiYLItUGxX4d5fJNmFnfMv4TeDy
	h6Oa6N9A6dUszPOyqs1vHUBUV+712ZoSVaMCGQtTs5xS8HmYBNYwayBnv0CVNnX6
	aQMZG8vRjSi6Tr+vpnN1zUev1RpLuk1vW+JFDRdNBr4jMZN5d5fnuNHsbZjamL0W
	Ffh7/jtIG3BkKtjnyYbrOVLaNeec0XUoE0XDsvlg5cnl3VsWJsY8FIOIeek9Psk/
	zhuG3Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0prhye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:15:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TAFvYl021494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:15:57 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:15:52 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 1/3] dt-bindings: cache: qcom,llcc: Add SA8775p description
Date: Wed, 29 May 2024 18:15:32 +0800
Message-ID: <20240529101534.3166507-2-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
References: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: X-MzcpbGwLSc_rmVRsy52MYyZ86r928h
X-Proofpoint-GUID: X-MzcpbGwLSc_rmVRsy52MYyZ86r928h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=975 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290068

Add the cache controller compatible and register region descriptions for
SA8775p platform.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 07ccbda4a0ab..37eada55e0f0 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - qcom,qdu1000-llcc
+      - qcom,sa8775p-llcc
       - qcom,sc7180-llcc
       - qcom,sc7280-llcc
       - qcom,sc8180x-llcc
@@ -80,6 +81,33 @@ allOf:
             - const: llcc0_base
             - const: llcc_broadcast_base
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC2 base register region
+            - description: LLCC3 base register region
+            - description: LLCC4 base register region
+            - description: LLCC5 base register region
+            - description: LLCC broadcast base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc2_base
+            - const: llcc3_base
+            - const: llcc4_base
+            - const: llcc5_base
+            - const: llcc_broadcast_base
+
   - if:
       properties:
         compatible:
-- 
2.25.1


