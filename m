Return-Path: <linux-arm-msm+bounces-58407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C027DABBA4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8EEC18912B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 09:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BBE1DF755;
	Mon, 19 May 2025 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEaZjUp1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B9226F476
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648072; cv=none; b=iCaa2ycTxXrDb3Su23w4kUlpPeHkIBXDr6P/UvA7ZnCX/1/qXwrrxMDKFgAgSzvNVGghlhh4hiB5h/WOfV97gg1dactiP2PFJOOwMOrtb9J0eKE4h0ht0RwMpU05SY2MyyzyuQYVWJxRcxwY+X7vfRtstw67hqJ/Rz9H4oTTmHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648072; c=relaxed/simple;
	bh=bTMRlUg8gGDU4gh+pkb3AegCsq7QQeq9LoiypQRoc/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ocP2RX8vhzXBoF8jnLr/ZcNQDZh+lWRBRKL8pWdLA7PMVG3yJ1r3AtweQl3jRUSfqrox/TIYqVsfHTFzt/eRLVx8Rw5VWkFL8xnPK7zhzo1D7mJDso2sGoog6o7pS4OM8qJCa1blxJOoqYglihmNQRiwBg7yXZuNLReEoGtrrJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEaZjUp1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8fe3t031683
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5wZN4QwiiDh7CZQZWtWHLOO5pZhg4NU9nBM
	vPrkxGUI=; b=IEaZjUp11f6tzylWGMQ+CB7zq8oh3q23XSz3NifgkMa7ohIrU75
	BuTEnNdxUCW8uVIf1lXMtAXH1MUKYO/uaoux3h/pE4rBuxi7PXJTTg1/VHxHXf8x
	T9XPh8dZFg+oNMaCi07whmJAAUePGDfpmazQaPdbCARRHrIUY4+Afj9jkeweEv+D
	u9/JJHkLXh47jlkttgGA3/d3YM8flwRykrOVle6MKzAghDk5f+OTH8nkw2GnQ4i/
	yhNYUlEZtVEZmpoxmc9/e6cQuwTPHYe1P1h/YZ+HIkF9KM6HycWQ1AAtX08kQKbK
	FBG+QOiSwsSsVekxcnsbNAUF+4KIFTIu95g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkykyx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:47:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso44298566d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 02:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648068; x=1748252868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wZN4QwiiDh7CZQZWtWHLOO5pZhg4NU9nBMvPrkxGUI=;
        b=P1mtMT6d7wsirKw3ieTXK30WkFLVyOBcIma8fe8OsAZZqkZ8qMV84yBoj5bdOPt0cO
         KR0NAGWlxEvHorUPRfdY4P65f5g73t37P/qLVo/01uo7QoXhDYowjLXhOf8TdI8FRPkA
         jOcoIYbLmvBEbETEPjuku3BvcFubCOs44WjHVdSbdqsOVxfp7L96WYMoeMtsWb+K26gx
         IL1fFVVVq+JLfE5HJWBwWi4BIQkytZsFBjRzufOkVFJkmivsVFLMdOat8Mv1YCXwjqJi
         20y1CH0JW8BiPyyFFnlsrkdrC+Ziv9x7gyVypm2bLeZATomW/+zBFDihQ7DBP1m9ftYX
         bG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTp/RC2YhsueBCrzUyR6dVj+vKOv26lLgohsgKEpBNN+EA3eTNUaqjABuBoqOMsQDLVbZHtXkI9/XaU5eX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7MhmMV0VB8VtT+4MAHlc+HytT5O2ujioIbvWNfwqHW6mhQDt5
	EAK9rotwqNvHNnNp2OshesKKmT0xej+J8bzeMoJR8/OxoCLaWXcKVx8k7g7l5L8Np9T55Su+x/O
	ougsOxgU0XCvycD5dQ2Lzq/Q8GLMk/wiabtpG0KT4Esxj333EFqtJEiW7MX7Yb83V//HF
X-Gm-Gg: ASbGncuqYeqhHNP8GViPnhE3Tn1SfNMvWcRhB4GKEZrHtFZpsZm3XMJ9tGsdFAWiDIn
	34EX2dK1YDPaTXkw6XwZhVN5McPhxEjjFVue01eP2XpZNZlRUTYYX4hNajdvs+UxmPHygRdSNUT
	8IsOkNOTeuJ+83q5abkMhqJDwMyo6Oc+2pQh3zYFFACChD3zGhMym0Q+F7pAPWFAWAYJ+q5rS9v
	Y3bj43CCPhXhUWY64UsZkmioexHJ407VjO+YKvIY8EbDiaQeE6sNLg3lhdtlIuvBaQ0iVBUodSq
	M44zdpvWo1pcFMpJB6ErKKfpuUC33EMzYL8QHTw7AAkIHoQ=
X-Received: by 2002:a05:6214:528b:b0:6f8:c23c:5278 with SMTP id 6a1803df08f44-6f8c23c8524mr138859366d6.12.1747648068394;
        Mon, 19 May 2025 02:47:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsNDW7YAAg+IYbOh6WTNXEz8eXGB3AYdSOPplc6+3gHrYcspZExavw8no8LzsHgeCqcfXMRQ==
X-Received: by 2002:a05:6214:528b:b0:6f8:c23c:5278 with SMTP id 6a1803df08f44-6f8c23c8524mr138859036d6.12.1747648067830;
        Mon, 19 May 2025 02:47:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e5bc:5c94:e4b3:3c4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498d05sm572185166b.149.2025.05.19.02.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:47:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: rfoss@kernel.org, andi.shyti@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Mon, 19 May 2025 11:47:44 +0200
Message-Id: <20250519094745.32511-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gGm31zVLBulBNj2a2a40ITshWshrr63p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MiBTYWx0ZWRfX9Z1is/G7oGGl
 cvEYizC2QBe9iORzPhkqNrmNTqTSytBHb/0RtE/RRj623JbRi1ZxGDG3XZ+KSEr1mCjUm+ZcYBA
 ky/ovhQ4yyYQIr7pQQAByA064r1oZ2YthHZhV3PZ/jEehsZ1+enLKIgrgBIiCMKmQBG06g0Kv6L
 qNUPJIlHWCTKCKZpFmrMBokxSDbhhrk10CmxBrHbAmCdo7/omP4bnmgyxhJCmD96Gn4Djj8laDT
 /xo+4qq9cWVRiErUcgPhpVTKokwYz/6EV/5Zx2jVMBd4Xu4+T4Xpshlb7se/KcB+9R2nOXeGC9R
 Q/CDrzobgabJ9M31z/oBTxAacjQSbv2T6e4Enhxr9X1gLnOU/AHMrW9s9gVK2nfDBQuM91ysgiT
 m6BF4vmWCO+8Q+9Z12Eut8AwQgULulNHc+wogtPPcZYQU2LBkQ5bHmVcxTAd38w/7Od8dEJC
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682afe45 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NlPZ1nVzr820ScHG1asA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gGm31zVLBulBNj2a2a40ITshWshrr63p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190092

The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
It requires only two clocks.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 v2: Reorder commits and Fix binding testing syntax
 v3: Add clocks minItems for msm8974 as top-level minItems changed
 v4: change AHB clock name from camss_top_ahb to ahb
 v5: No change; Resent with missing recipients

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..83b13370ff6c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcm2290-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -44,11 +45,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   interrupts:
@@ -113,6 +114,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -120,6 +122,22 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-cci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ahb
+            - const: cci
+
   - if:
       properties:
         compatible:
-- 
2.34.1


