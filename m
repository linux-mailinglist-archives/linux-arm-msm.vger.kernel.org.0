Return-Path: <linux-arm-msm+bounces-76116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E9BBFA89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 00:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66E7B3C3CA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 22:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6011E98E6;
	Mon,  6 Oct 2025 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPSHGI4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968D19DF5F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 22:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789213; cv=none; b=aWErdOfbnr0RiPtoLxE1DhKicfiEvAnZEtx4tS4O60v9eCOKwPbpSeXpwFH32g8qjX81AqyLI5CyUry3vU6TQfcb4PJ1bZnPzPsWmAZkdLnatORv77sS2i1sf1j31/LFnaelddovwLo+gspSVEwHw+jie9PqcckLwx56FnxtdB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789213; c=relaxed/simple;
	bh=WfcBDR9DIRDJLIXrzb9ShDflaFdoNyv5c5lXHKgErm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gGDakd0fxAfEa5vmdjuOw/Oe8/ZhKhl6g3ZHKvks+NTDX73l7YGg8FGp/rVNl5LnHCapQBlExJp2rLF9H+Pa8E1yRvEVqv+sZACPJy+eSNhSYtcrgGGFKcYBzlFtfz2BXRLRA66B9XjVg2lgt0aRcYYw/xt6dvbu5JiWcsYEwWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPSHGI4n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596Evj4H012589
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 22:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kwVAXCKZYFJ
	vmBevVk49WwQx9cQq3YCpTTCCiPQjazY=; b=BPSHGI4nNgZYIza6e2xmMVNUpKh
	AgFkqW9hMAneI4jZIFgIcS7cEooZYKTK637AE/muzQkBEC84tZ6pe11M07C5HWTI
	2xrMwQWOP+FQ9mxK1fQdpzuwOaB+frF84SHXDxZQvi2evIVsqYhuXWAPZ3kUNp7w
	HX2likY0LEshp2HRmJMklrty+/QQBw+sntnrTwYG/ZJQFRufrPEgoD4FXj9oavO0
	2lkV/nYw3vrwvzntqXTwOUuMGh9IWBk0U5wJJ5H3vXplWuTjgy36rcfm+DpSrkEV
	ZNFULx97kOltnHz19G97iv/XhZD+SFaLrk1jfA/BvtkSmkMA0SrJ2IrEBcQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu5bve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:20:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781253de15aso9242381b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 15:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789208; x=1760394008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwVAXCKZYFJvmBevVk49WwQx9cQq3YCpTTCCiPQjazY=;
        b=kF30gCSriOiM9ZKzAM4+BbdDJKYcPNFoEj67hEACMqgkP2HtnXDU/UMZ1gqitdJTFe
         0yXQAk8Gz4/NFl+LyKpEweyQVRjANR8lgouiYEr9wmi62rNlyf+QCW37deiKLneAfum8
         gYv4KydvkvVgIGVB4H4PQC1vJp8dhDbEt6ExtGrvUuIiP59GgHOmzwSjVJsLFjeRtJWx
         SkxfVTGK7SdjXHB4FZeUVsVe7mUijPCthrzuGuN39tHm3riBASmr2708ykXYH2B3bcNA
         OExjGGPpM8RSGCicHzI5w47B9N6U2ekH1stn4cSXK498dK73Ve8yha2m2A/0nBCPDQEV
         a5GQ==
X-Gm-Message-State: AOJu0YynO/I+3QvtQAtbc5y2KHd6SyKi1dG2SrFv93Nk7MTKXVM6jRPB
	pSdPEByWnHd0XxgSmTUr1s4hKi3CdWLid1YLjQBHjxXwCV/l4Toyhts1GF4rcBRSBxxh7hXn2vO
	5hSbFXe8OWLGjcrNx3FbFgl8Qa9Dn/YRgC8GU/90xnzAO73VzAMN7/KOOlKcbxI+ryHg6BaChsu
	SZ
X-Gm-Gg: ASbGncvLjr0UPfx590uQ+t8VeTz6MejJcfeOMWz3a51gU3H4FEVXvsMo7u8ch4g3+tg
	XDG281NUAVPQ8NdBIDiegEQEzQwWHMBW8VSgXkD1PVngC5BVcARZ3RjKmDgxwgWrdt4ReosLTlt
	8F0lxCsqDiqotgkAGiXfLw1q/q1/qz5VeSgLeeXG7EVweiNNNGRNHxE5qZD3nKm1AJSpo+mRjhK
	86itTPM9xqbRzWFj0ONgws2j8+xumEBjNJrLAhdooY8WQocuYp7Nq+sxiKh/AKisbXSUvP4y8df
	KbK4WXR8nOKKvyUjvmUE8xBhXGqwTBUG3rRoc6PeU68pORzikSGY0s6z7lsWJLGkq58+vT701z9
	5667LYfvSKf64GYecF1vxug==
X-Received: by 2002:a05:6a00:2305:b0:781:1bf7:8c5a with SMTP id d2e1a72fcca58-78c98a40a3bmr18785127b3a.1.1759789208242;
        Mon, 06 Oct 2025 15:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5R1SLObP0kiPoqDNLoC1YWFmO7iQQWvlu+1UAlluy50qQoqzliZ7CViBxbPnbk0mDKuzpGg==
X-Received: by 2002:a05:6a00:2305:b0:781:1bf7:8c5a with SMTP id d2e1a72fcca58-78c98a40a3bmr18785097b3a.1.1759789207808;
        Mon, 06 Oct 2025 15:20:07 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:07 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Mon,  6 Oct 2025 15:19:53 -0700
Message-Id: <20251006222002.2182777-2-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pVyFEUmXccdsThgHtrGsO7dF4kGDDEM4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX0NE9uivZQyrh
 oT4VyiHtpo5Nn4p6jrrSoTQIdCmkBanSwEDHx69UKRbCsdO3t0mUjNORruJ7kRGdo4YJHSdQfpV
 ExfBPlgVWXa3YO4Dzc7uQy5fP0vT8VPH0ZwUllfwk/tsWB2E4QVeHwDLJpS6jSB8Xc1v5sRXPl9
 W/ramF4kC1pVAgZ0/6FhCfCf8g2qmYhlWNRBknAF5Z9XhjpWGajTMPzmLah45kXkS2WWu7OceUx
 J0s9Pr4jMpmy/hQHU8qqEx2EeF8cqzmXACmevdaVFH/U5PCI4rrDTL+tfG9VxB94lKirOC+mz5A
 LJdbzGoPDPbfeBWm/9a8Nv486omBm/n0ggfKfSYM11R1AirV+s4zPd5QlMZ2F5HdOWSIfyYscoQ
 qMBTN/SYJuTAFxgY/vDezFktToAy/w==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e4409a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=7IGZojk4TMugEFbIs7wA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: pVyFEUmXccdsThgHtrGsO7dF4kGDDEM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  Add a different identifier for the primary QMP PHY
instance as it does not require a clkref entry.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 72 +++++++++++++++++--
 1 file changed, 65 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..315723a87f4e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-dp-phy
       - qcom,sar2130p-qmp-usb3-dp-phy
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7280-qmp-usb3-dp-phy
@@ -41,12 +42,7 @@ properties:
 
   clock-names:
     minItems: 4
-    items:
-      - const: aux
-      - const: ref
-      - const: com_aux
-      - const: usb3_pipe
-      - const: cfg_ahb
+    maxItems: 5
 
   power-domains:
     maxItems: 1
@@ -63,6 +59,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -105,6 +103,24 @@ required:
 
 allOf:
   - $ref: /schemas/usb/usb-switch.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          maxItems: 5
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+            - const: clkref
+
   - if:
       properties:
         compatible:
@@ -117,17 +133,47 @@ allOf:
           maxItems: 5
         clock-names:
           maxItems: 5
-    else:
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+            - const: cfg_ahb
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sar2130p-qmp-usb3-dp-phy
+            - qcom,sc7280-qmp-usb3-dp-phy
+            - qcom,sc8180x-qmp-usb3-dp-phy
+            - qcom,sc8280xp-qmp-usb43dp-phy
+            - qcom,sm6350-qmp-usb3-dp-phy
+            - qcom,sm8150-qmp-usb3-dp-phy
+            - qcom,sm8250-qmp-usb3-dp-phy
+            - qcom,sm8350-qmp-usb3-dp-phy
+            - qcom,sm8450-qmp-usb3-dp-phy
+            - qcom,sm8550-qmp-usb3-dp-phy
+            - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
+            - qcom,x1e80100-qmp-usb3-dp-phy
+    then:
       properties:
         clocks:
           maxItems: 4
         clock-names:
           maxItems: 4
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
 
   - if:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
@@ -142,6 +188,18 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

