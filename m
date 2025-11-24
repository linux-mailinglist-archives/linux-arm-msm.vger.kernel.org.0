Return-Path: <linux-arm-msm+bounces-83027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7F7C7FB12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D47023A59E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0F92F7475;
	Mon, 24 Nov 2025 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBrX0STT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXgntJ7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839DA2F6929
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763977540; cv=none; b=kEMVsF9RIZvG/qlcJK/+TfsSutkxvjUF8Hx4eIqcysm9joxzpr/JzhfdERr32ytP6QJUSLcrPxqcJq0vE+PoesAelK6LZq5pxmEf2M1wgrnTiVG2PSmQogoTsIZhEQE/6y4aoWQXOe0TiBPkkt/uuDjFadG6GoIHlFTEbqGhtOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763977540; c=relaxed/simple;
	bh=6vXLBAdNnQs6XK2/kBB51qbuJfb3m5+9fYGBSdIIrP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P8Fdk5UlM4tLPj/YG3sAm0r1osMVZmeZvbmmET0Y99VuDhdVE4tmeRqj1R9ny3opg/WQvlq5U6Tqp3SJz9nr5enfN++XsueAclmJBAZ1bzoc0kjAu+qC05TGSEKfRzFdmlAltkbwzOk7T4ZDU2+ARI0dFRSAhujttTUhu2njaYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBrX0STT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXgntJ7m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8bcPC2570986
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcJIkYTMqA6r4Axp7R45E+Pedh3qwOHwhj3tSvKpYsk=; b=FBrX0STToejJxtDP
	NDiZuqpq1DzsTyqJbJeUmzi4/4AQXjc2IpmqLeSpZR9SiATNSglq+JpIMfaVnPhh
	B9qbEF9uM948jHxvBkNSrMajCCcM9PfADgLamtII7nLELTFja6TgiyQDIpb8oyeu
	aDmaaLt8BR5UbxlSe7WPDW1Kq4IkSEr27VD8614XN5CHTv5Avjel+jMEHFeQjSTW
	rZxGtgMQLMAU909W1iFupaRnYs+9aro/p60EVGr53frd6WqJoXrgoHogpPKldTiW
	iFM01HW6bmqkzmvNMj/3KJHpHfvhDLLZ+M0q2DHrThkAER8z7KJxxCjyCH5X3Won
	3f7jUA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ffcgwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:45:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b90740249dso7681125b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763977536; x=1764582336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcJIkYTMqA6r4Axp7R45E+Pedh3qwOHwhj3tSvKpYsk=;
        b=WXgntJ7mm7i+Eh0ZhpZhl0mXAhEtCUjOFGzqF/cig7GrcHxH8SffqyPLL0pPnLfMw/
         5cOVraHtEH2b3QiXD4Nl+JttYpwL5nIX08ZfbOvTUTTGoEA2Z+pSKsVhMupNQj7l0T9V
         PzzYhdoIbuplLBu0sK8k6jfOguGBiYjUIhFaYB0FzwmbAKFUpxtcDc1Gm3bjaYO3bOai
         leEyULt+sjEci+QHhgNCKGXftm2h7q6AFfCxvHKgeMo4c1iVfIjjlYk8mm8EAdOHYJjL
         zEK2Gq7w5M7vqkbFqAu7mF/CYxoHION1xU1886UbJP/xqy0fauY+jYZU77O1wXAC2Mm4
         LfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977536; x=1764582336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bcJIkYTMqA6r4Axp7R45E+Pedh3qwOHwhj3tSvKpYsk=;
        b=tCdSS274QPp3NViH8ETLtStw5l7wQzFtYD6uO9RXtqd5cybWcbVnYHmOK0HzhK5Kkx
         NE/yWbVT7dGRrGva+EJViyfJGDVB/ZJr3ldqG7QELrySRCvgTALwQNoX7WsvbcBEKN8w
         HdCHXGW20D/2o7AB6ra/iKGkBK5Zk66l9MUtiWBfybvYVPhiyi6bDV9XK7KkU2yq49Ge
         EhlMbzY+1oL0h0jB06tprRG6NavyveYYRdC6suqjv82mA7FgYWqFe823S6WBRiHWxQHH
         00Do7rnfnyphcQd45dSQuAL/QAqz+bGYmDLyaVBwHm+MiM5YxmaUJ32pDtR+2yWX55RG
         KArg==
X-Gm-Message-State: AOJu0YyKovxoVqRJe6GfBBaVhgNgrnk6R43le7+mAJGFB3isKCU8dA8j
	0/PZFVEjlNVbsQCeSgwFGhbwS62IXEQN5AV533NYXAcQkaVR87OXvq2zCY7vg1ig3tWwkNIoO7k
	YcHhaFgb4S7tB8l206jcW21cUBhyavEpJhn7GuITo3mJueA1mTnshV6gO10NVhN2cK1sT
X-Gm-Gg: ASbGncsXQUWFNhQIkEE4YNa+K2ViJZUFN1Pn2S6byquu8u5yYrD9zoJOw4zcdZv84l1
	buH//0dV+VhHIEroyx6/eDvy/J8ASh2I0tC4BcrfZS3aeyWcf2/l5ACZw0vPX/hcUHmny0rUZpi
	JZ3cKwI/NvxLP0HUlcv+sC0+efkovuLF8tT7kub3vkw9d+AD44goVmXehTa+oFdC7MLsuRy+3i2
	RdRYEGCrQQILQ2utwbJmziALhQodUrqnVxAmFcQfEAC8O1R5IdSfe9HkGN9ftYV7U2gOZnN+ab7
	33SDGUpdyXfyEx+66PNx37aPYcpb2LXe7RTf6/03CMYm/ymxSYkMbdSOIsKi6WOvJ/tKaGgqeJA
	2HWXbi2/gVBol4sj9+hCCHrhERsN7rdijmDc6fAZnfjrI
X-Received: by 2002:a05:6a21:6d86:b0:340:fce2:a15c with SMTP id adf61e73a8af0-3614eb18510mr10163493637.9.1763977536256;
        Mon, 24 Nov 2025 01:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjGaFK76LFuZwaN2Ie7ODhBONbjRlLuRGsF/oO7K6cKPHPah2rHCsoIlXXLo19sSpDsmhOVA==
X-Received: by 2002:a05:6a21:6d86:b0:340:fce2:a15c with SMTP id adf61e73a8af0-3614eb18510mr10163467637.9.1763977535737;
        Mon, 24 Nov 2025 01:45:35 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75dfed99esm12668291a12.1.2025.11.24.01.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:45:35 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 15:15:10 +0530
Subject: [PATCH v4 1/3] dt-bindings: spmi: split out common QCOM SPMI PMIC
 arbiter properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-pmic_arb_v8-v4-1-d91dcbf097c7@oss.qualcomm.com>
References: <20251124-pmic_arb_v8-v4-0-d91dcbf097c7@oss.qualcomm.com>
In-Reply-To: <20251124-pmic_arb_v8-v4-0-d91dcbf097c7@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763977527; l=4414;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=6vXLBAdNnQs6XK2/kBB51qbuJfb3m5+9fYGBSdIIrP8=;
 b=KB8AyxL5H7fzUz7q7nPI9AN28kt8Vqb3i8DbQtoKhPQZ9Xn4UapC3YtAnRPHqo+Zf7OfvrNCC
 nWV/3AYHzQtCGW7HmSH3u0q9fL6mMJzYjCYvf3YLKpoL43x33tPb7PT
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: Oj1epWaSYQxsmPSoTnWaJEzbAnw_Cc-g
X-Proofpoint-ORIG-GUID: Oj1epWaSYQxsmPSoTnWaJEzbAnw_Cc-g
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=69242941 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=w24Q35eUI-_Cj95TU7gA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4NiBTYWx0ZWRfXzDD9u4jeQtmi
 3HCzsjGBRPDKezP3eBk7hf0cyM4Uz2OlVAnKosbWdw7+NXLt7ts+U3LpMaT3Otl+kmcACbOP7rO
 LHetF6+GJMUJmeu3AyEXgroMSEj8X/V5NxF1wvacrI6JGcKSBM7VSt27EryUBsXoepIJRTzJTLv
 +S8QxL8QomMzRnmjD3LWmJ70q2EOQxII4rQUyLTJMUJXicMrdmzzDfSAfbVm6nqyer4g5Sxeaxm
 +DrBsFph5G6EUoNHK/d/Q37B1WKGQiSX+JPHR9xmVQFAPSG9+Ee6Om9hZex6jSZuGuAHbqttn19
 VHJjO/tAkjiFJZMuH7qr3Bu7uVnt5wUgN0SxzSNs8RIws1HsVfkOGc4KKkvT4b8Lv6qbByqgaE0
 DXGRA9nDT4SO+NFVQ/rvVuK7bioMuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240086

Split out the common SPMI PMIC arbiter properties for QCOM devices into a
separate file so that it can be included as a reference for devices
using them. This will be needed for the upcoming PMIC v8 arbiter
support patch, as the v8 arbiter also uses these common properties.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/spmi/qcom,spmi-pmic-arb-common.yaml   | 35 ++++++++++++++++++++++
 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          | 17 +----------
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 21 +++----------
 3 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-common.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-common.yaml
new file mode 100644
index 000000000000..8c38ed145e74
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-common.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SPMI Controller (common)
+
+maintainers:
+  - David Collins <david.collins@oss.qualcomm.com>
+
+description: |
+  This defines some common properties used to define Qualcomm SPMI controllers
+  for PMIC arbiter.
+
+properties:
+  qcom,ee:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description:
+      indicates the active Execution Environment identifier
+
+  qcom,channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description:
+      which of the PMIC Arb provided channels to use for accesses
+
+required:
+  - qcom,ee
+  - qcom,channel
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
index 51daf1b847a9..d0c683dd5284 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
@@ -19,6 +19,7 @@ description: |
 
 allOf:
   - $ref: spmi.yaml
+  - $ref: qcom,spmi-pmic-arb-common.yaml
 
 properties:
   compatible:
@@ -71,20 +72,6 @@ properties:
 
   '#size-cells': true
 
-  qcom,ee:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 5
-    description: >
-      indicates the active Execution Environment identifier
-
-  qcom,channel:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 5
-    description: >
-      which of the PMIC Arb provided channels to use for accesses
-
   qcom,bus-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
@@ -97,8 +84,6 @@ properties:
 required:
   - compatible
   - reg-names
-  - qcom,ee
-  - qcom,channel
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
index 7c3cc20a80d6..08369fdd2161 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
@@ -17,6 +17,9 @@ description: |
   The PMIC Arbiter can also act as an interrupt controller, providing interrupts
   to slave devices.
 
+allOf:
+  - $ref: qcom,spmi-pmic-arb-common.yaml
+
 properties:
   compatible:
     oneOf:
@@ -45,20 +48,6 @@ properties:
   '#size-cells':
     const: 2
 
-  qcom,ee:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 5
-    description: >
-      indicates the active Execution Environment identifier
-
-  qcom,channel:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 5
-    description: >
-      which of the PMIC Arb provided channels to use for accesses
-
 patternProperties:
   "^spmi@[a-f0-9]+$":
     type: object
@@ -96,10 +85,8 @@ patternProperties:
 required:
   - compatible
   - reg-names
-  - qcom,ee
-  - qcom,channel
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.25.1


