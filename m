Return-Path: <linux-arm-msm+bounces-38599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38DE9D472B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E427283840
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071B61C7B82;
	Thu, 21 Nov 2024 05:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IaLPmGWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86EB1C7B64;
	Thu, 21 Nov 2024 05:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732166408; cv=none; b=fpQfEZo0Le8fGaIeX3SUGd5TQQ/6QmhJ9xhZEayPZV2qn3xXqJRL3oMybHBg5rU7UBzr7zgsHEbW5oC7kw8GaujAfnu1RfQmvUHmn3zfOMorbp5xXxP4bxjxxME0bFt8QsuRX1bhAdJNpZJm8TWwCwgAl4Z2rUMUvUGjJzEd2G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732166408; c=relaxed/simple;
	bh=rAAdXcKL4aW74QHGBUAC7vHxnNR95zfxep59wXzgVFw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pal74mggFh4Ijw5MoKiZVoPkcLaTpL3aHH22Sxpkei031kebfueGsy6Xr3aCSuPNzBMXGWZGAjvZAK2Cc4+68tJr6xK6uTt6/TzN29d44eJ5cl+QOaZdCMpGCXnBSkn6CDX5noIfYMSU1dJGxa3ssHS+JbxjmEKR26AD2vQAvZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IaLPmGWs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKLAxnh014446;
	Thu, 21 Nov 2024 05:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIFd3ifkEs+bY8OXaO/Mb5879TwmCxgiwddAEP3vNIA=; b=IaLPmGWszUoiJ2r+
	RAJBmOLqVxioBvJoty164gadBwWmf+cHtKKbSJh0YkbtUiGD7A2FOPj0HaUIEEeg
	kbRxUcHwnDNhusb8FMe+qFGKXcl+azmt/UsTVZWfFzOlcZvCDpoH+h9MAra+sOBi
	nAAJYSLSeW8kL8ap9N5aD1Nvu6H0kj0BENUlG4l6kU8dE00zKwyp2uujyWGEDI0x
	acU/O5eguuTZQKk4o0u1GjR3144THdY68QWqzWvOzAFAJTTq1lXt/ZrFau3FlJIN
	lTrJ8go2/CHQjj09KHxJIG35jy78fcNehzmeLf5iyPGKMHlQFLwCMY8GK8NtztKp
	F3MXZQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y9803v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:20:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL5K2Vp031513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:20:02 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 21:19:59 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v4 1/3] dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
Date: Thu, 21 Nov 2024 10:49:33 +0530
Message-ID: <20241121051935.1055222-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121051935.1055222-1-quic_varada@quicinc.com>
References: <20241121051935.1055222-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EN9aZ-hFqqGLTfpF0b8dHEBC5kMxXAJg
X-Proofpoint-ORIG-GUID: EN9aZ-hFqqGLTfpF0b8dHEBC5kMxXAJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411210039

Document the Last Level Cache Controller on IPQ5424. The
'broadcast' register space is present only in chipsets that have
multiple instances of LLCC IP. Since IPQ5424 has only one
instance, both the LLCC and LLCC_BROADCAST points to the same
register space.

Hence, allow only '1' reg & reg-names entry for IPQ5424.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v4: Fix ipq5424-llcc placement according to the sort order

v3: Rebase to ToT

v2: Add Reviewed-by
---
 .../devicetree/bindings/cache/qcom,llcc.yaml  | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 03b1941eaa33..e5effbb4a606 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,ipq5424-llcc
       - qcom,qcs615-llcc
       - qcom,qcs8300-llcc
       - qcom,qdu1000-llcc
@@ -42,11 +43,11 @@ properties:
       - qcom,x1e80100-llcc
 
   reg:
-    minItems: 2
+    minItems: 1
     maxItems: 10
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 10
 
   interrupts:
@@ -66,6 +67,21 @@ required:
   - reg-names
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5424-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+
   - if:
       properties:
         compatible:
-- 
2.34.1


