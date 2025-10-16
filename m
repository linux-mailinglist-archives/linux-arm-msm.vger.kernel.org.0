Return-Path: <linux-arm-msm+bounces-77506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B218BE1902
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 07:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E565480DC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 05:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03739242938;
	Thu, 16 Oct 2025 05:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yd67VGBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6140323C503
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 05:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760593780; cv=none; b=Xm3mzdurXCxcTmRUlw6N/mkV41aVZzQXimv/2eflBtUsMk/BoF5+TuL69+XNhXDpx4/sN/+1ugPlaCcCM8wGEwGwqzTCf8TgE3L5CDxoumcmdR2KHiYIAmZYuO5eFDSFtrPCnaguOxNn7rrdzktBAWsXv8A/6SNe5UhizTKCxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760593780; c=relaxed/simple;
	bh=Y867aF4IBjLOR2gpmZC8PqfLpe9/4Juk6DhmSLbLZ8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SU9pY7zFsQkUiJ8jl6yC/3dHRhekTWS83f3NkmR4qp8RaUEqwoKaNyI21E9hXdJj1DFe97VOcjJBQIhJQm0z8HvPj4qoPLMHpLCMSXNiiDlVFsETiq3ynEH1YPQs7ddWRm73HTdxEyo/gTmm9z44mTrsFchhFShqoGXnh9xHOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yd67VGBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FK5J7t010182
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 05:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=; b=Yd67VGBI58dErsGh
	isd/1zx7yOpKb3m7HkpVF+9HJkwanhUQqM3yBcXDQV/LrkBkq7jZk0l/KCjKCzh3
	kKjRccqkbEk3KgXbrEqIxDXWn4d2Lsi2gKhkIBbyHfR3hJRwYKtNdFC3griq9xbw
	oM8gLtFl+vfCQDahH37taNmXBIUdHlWP98Ty8bhlbGeaLPoOXd9/W2WR324LYwDs
	61Q2yuQfGEbjzxaMDxY4iYsr0Qdlf+8adhxqBjtpr7AII56dASlgx+8JlP7oQ2zf
	qnZj6+sQjJY5XbYr+4WiocmcZM/F9ib73WDke9TrtOKjXwt41yQ8gQ3CrJssQXc5
	zfqbHg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c7086-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 05:49:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5533921eb2so245697a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 22:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593777; x=1761198577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=;
        b=AiazGMj+NjwUDFfvvQ5+/flzRoRfwX0H8goPwNFaqCchxlA28uFyOrRmS7ZPBUNsKM
         n3dnN4dWfu7IJg4cyY9WynxlIHIIQ7xkJv/flwBjUyO8WYu9vd4/NNy/WixE8RPAgrD8
         N+2BfG0sNG1uKJ5Fbho6warCqeT/cHvL6lVHgim9rQDFHAWPyA4NmVjt5KnPEV/xDQvh
         fpV2nK22gEMj66t7CTJd7FlPFAJj23sAKovsJMcbsJhFTq9fyIro9qxlv5WzZtMxGqHr
         E0IkGf4oAWbcWfPGprx1kRlZB67V8+FZXDu6D4EKIbAmWC8afBpTFbSPvRkzUfe4UfQh
         AzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFFZzIOsT1YrL5tN01mwI+7LFlokzfV/ZHVmm4SQ5aI4rv5JJTtGhAgDXCvzMYiGazACcGIeLxrrh8Q1ix@vger.kernel.org
X-Gm-Message-State: AOJu0YzF6gc/RmZZN1NU3wB4uOWGkw7tvo48nVuqbXIE9esZ9wAkAlwu
	eSp2P2vbKkgArDPX8STroDWfZd2FGyhOXFo2/h6DDqMDcPVZgGwU1l8aeVbI3Wuxd/jtPPCcaeV
	Oi7EVbUojN6m83gmeOTtJoD/xCfGnBSyE6QqpeEKAQR6Q7YrgFcd+chhtn2AzsMqjuEb6
X-Gm-Gg: ASbGncvcU0SeDu8ZouIpT+VRdYGOOvY/kC6T34LA3cQQItrzuPrkradzrp4gVKycBc8
	XgIQG7ql/F0baPxYLs/5YU/MO+LUjd870GSX7rfyTEYpK6/S2CYlPtVVHGk2J/mYB5rpgdxiqb1
	G+kp0YOA6gJgnXrowxhp27wMGqEARkUCqzhG0GtiMMGxh6Om7hJFWy8UMjP3GmxCWfz4/1nCnsV
	CFE9KATa0vvYwpASJKcx31C1YuJfUidwyi4XSZt4UI7aAvDrMbN8C3OBstlSBxCl3KBvPewKxgk
	jzcIZ81/PnKOzonyP9pMZIjjtTX+fcYDo0gMkAiYYw6A1AILDHgJ7UsK0Rx+gQW4NbhCEwWHxhF
	jRTYplrCoA8TQlhSv0CehJLewCWAaiKaR1X6athF6vnYOCiROQXW/mQar
X-Received: by 2002:a05:6a20:918d:b0:334:a261:862f with SMTP id adf61e73a8af0-334a26186b3mr150093637.26.1760593777488;
        Wed, 15 Oct 2025 22:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRjYvscNvn4E0vQBfwvASCV4Pqf0m+pOtdqzRYlI5lGMnrf4heuypJ8w8YWbvPn9A6D3ZaOA==
X-Received: by 2002:a05:6a20:918d:b0:334:a261:862f with SMTP id adf61e73a8af0-334a26186b3mr150055637.26.1760593777038;
        Wed, 15 Oct 2025 22:49:37 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm20657931b3a.59.2025.10.15.22.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:49:36 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 22:49:30 -0700
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-itnoc-v5-1-d7ca2b1cc6df@oss.qualcomm.com>
References: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
In-Reply-To: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760593774; l=3075;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Y867aF4IBjLOR2gpmZC8PqfLpe9/4Juk6DhmSLbLZ8U=;
 b=cliWJQ3cCm/Fg7j1zfG3GF1la0aaPjQALYORA+TGbWnntK956NJJ0g8VbCrYQRc+v5A9cc4jL
 zoeEtsiuSbLAXyvjitBHF6kaYuoH4vz3sV7bCFgyhDTdYSQhvw9uak6
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: DeRTFPea7hPGf56dvE5GAeKjRBcvm9wT
X-Proofpoint-ORIG-GUID: DeRTFPea7hPGf56dvE5GAeKjRBcvm9wT
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f08772 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-QmmxQN2S_yWG1-YAlkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX7jcPCocs9QyZ
 WWvgIWtI0iaxT1u8BZU7TH/USpEmIwl+i272UQ1gH0lM2tqu7TyPgxBl7I8jjBtPGDFUQV9FchI
 c3b0hFJX5g77CZVhxSW9DQRGiydpAffD5lSVm5gEHzbtOPctcPYKRY3/YPh1iEISp2KuDo7i58g
 FEDpzIp4nViBnv6VR6h+nmd9YHVCz8BuCSecQOP15ds7Rt/2O/a/AugqK6L2c0tp91/Hsd5Ywlv
 ZWL2rcoMTcSCAUDczQ7LE5dJ9nuv6FbXjnK0+HWkXidin3SN1ivhKrSRq374dt9iZwOdMGvsspZ
 /2km3iwIy5gatJ/gvsA3T6N5SoPlGw7fRzbmzSXB4xfIWnKEv+ZExUSaukjGS9Ax2zQ8W6cdLaz
 s8iB5FQ+v+2otjqZBZcgBHblHAFxjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Add device tree binding for Qualcomm Coresight Interconnect Trace
Network On Chip (ITNOC). This TNOC acts as a CoreSight
graph link that forwards trace data from a subsystem to the
Aggregator TNOC, without aggregation or ATID functionality.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/qcom,coresight-itnoc.yaml         | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8936bb7c3e8ea267ca66e0cc3fc4dac33ba6de30
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-itnoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Interconnect Trace Network On Chip - ITNOC
+
+maintainers:
+  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
+
+description:
+  The Interconnect TNOC is a CoreSight graph link that forwards trace data
+  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
+  does not have aggregation and ATID functionality.
+
+properties:
+  $nodename:
+    pattern: "^itnoc(@[0-9a-f]+)?$"
+
+  compatible:
+    const: qcom,coresight-itnoc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port(@[0-9a-f]{1,2})?$':
+        description: Input connections from CoreSight Trace Bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: out connections to aggregator TNOC
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - in-ports
+  - out-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    itnoc@109ac000 {
+        compatible = "qcom,coresight-itnoc";
+        reg = <0x109ac000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb";
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                tn_ic_in_tpdm_dcc: endpoint {
+                    remote-endpoint = <&tpdm_dcc_out_tn_ic>;
+                };
+            };
+        };
+
+        out-ports {
+            port {
+                tn_ic_out_tnoc_aggr: endpoint {
+                    /* to Aggregator TNOC input */
+                    remote-endpoint = <&tn_ag_in_tn_ic>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


