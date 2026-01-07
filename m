Return-Path: <linux-arm-msm+bounces-87960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED4CFFB47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0201301B10A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E852432ED29;
	Wed,  7 Jan 2026 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFqIBATB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffGKHDQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466FB3A0B1D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813629; cv=none; b=TWIhk3QEJis1WcPq2bLMABxXxgNM7IJCvA78T6nd+ixtP5U5zwWe2XxjWGqIZ78t5sAvmCkfkHtjpp+CYhdMVRX0m5Bp4CwDExgidHniZwdcpGETIO0phBJnLX0R+tyFKDKQTiIlopLk02MLg3kGNMBjTTZ+32jufeKTfb6gv3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813629; c=relaxed/simple;
	bh=tyP/V/skScf7mp3+WCTbe3wELSTuT9RspJs4XrrJTMI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bDaaB7HxJE7eG0p7msCMrIlJ3S0csjNuDMoqhzyhvHj3cq/del3fnez/1ylk0UdLAxRwjY1tNh+Flv5laE5y5ed+e9JTjkLZkCrxgltGR4B87Hz1T3RL7Vzb45nSOUlm0MfIFDaheN/48inDkGbzwWJek9sO0rw+MeS1qBWLZX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFqIBATB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffGKHDQB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HVW373890559
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 19:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lX6WHCx/JN7
	QHObDYbJg7ZM7OVn3XmiYWVeoPCXFwVA=; b=EFqIBATBVR+lUGbteYFe/wQLaJF
	MdYEZPjHrHpmA4x0mN9CP962Hq/za8Jte4IRFVjoXqnbJDWKc9AiYjZJnoeY8FkQ
	463+elEILdQ7IBjCIQFticFC9RdXkilGnR+grcmOv8j5jimXPbsjhzOXyUugKqP8
	MqxUXg+y8HJLy2d2c9UIKHA3JMKhcK7n4WaF8tDs1qzlY1BZvMCiZr/YIRSRS9Ju
	YoNu+/teFB4XG0rJxwyHx6I26FdXzdLI0szozzHT0FGPAX3TRadGN4NbRCrn0dY+
	WOCDrOUoE8rtQE2xkd/U0LVTQoPWLnTc2GWDHvXrCSMegdwX7dFGTU5KUTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy70bvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 19:20:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34eff656256so3328279a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767813626; x=1768418426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX6WHCx/JN7QHObDYbJg7ZM7OVn3XmiYWVeoPCXFwVA=;
        b=ffGKHDQBPaX93ngmVzHZMPLOKx+jMocJFhIWBThbGRsWGmwElPxO6S5XC7Ci/qBmhc
         7JiLa/BVAacNCei/locYUXBipbWKwUS6/EyiTd4C3t01LNOW2ZS/u0vEsDqyyjRpiDj/
         DwpFi+qquq6K18s7GvR05W0382PwHE5tWC6lsSG5x5d27iNhzqhmsGlPEwFwiCeSfPcI
         Qmxqv/eYwwUw+owJsLqsS1UDDG9S5Rodp1+txZUzTDxjOAMg9McKvak/gf1PWfJu+lvF
         ojM604AJrMVKVRoCzvJ5fLBzwqS1mJgoOVHqEAyJ0JjTH+bCufSP7M0hNaMzM7mVhKQz
         xUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813626; x=1768418426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lX6WHCx/JN7QHObDYbJg7ZM7OVn3XmiYWVeoPCXFwVA=;
        b=uqhqphWS8ox4OMJsb53stWzH90imPxeQQDOMDW7VuxWfRVssTiGH+UGsqMUXA5/mju
         Dk5+MGdNKa5ruvrmMfwXwq9oRnXGrdwP3q2lIhVR3fxdl9E81Edtaup4cJPtiTwoLu6W
         F9HL5b09skizZE0cIsTqfCYDumAf+YhmjUT5mJSjEC2HhTP/5hzByGjcAkWM8P7KjT8a
         my36sS5cgxdZGANgq6WXFwBX0UdydywSPMZYExWfGlY5N5409tUBFuZG6thOh+9ssh/Y
         i0XSZA3fRzDBgEewQEoR67ZLwUNXKovTlSeaNZJJLRrMZYBQh27ow2UZPSrsSjbpyQ9J
         w6bw==
X-Gm-Message-State: AOJu0YzKNoSo3Tnf7BI0qdycuR9sqkyVpK5iRWrSXeK3Oc+tZF4blMsc
	3tQ9m1tHyiRJF4rHI0VEDlrvhYC4jqhZ/qq/85o4w1SO2pufc6AMq/njt+1CDFJjtwP7XjVwgEZ
	yj+m1vu+KqhAxXmISmJMMbr9uSwSbf+RnbwqVM81Ps4n5F9YxctnuexFfd2vIagzpMNll
X-Gm-Gg: AY/fxX5Ay/j3iWHu54qrgZeD/Z6eDBJH3kfFddm+vnF5Dk/qvfDiU5FUVkptab0o3iO
	uVSTOyZ1ASmoAo3bOodoJjVJXJuhH6wXxaaDvTGzz+dJuWwLURyNS952nD4f5gLuYWGahsXbaG/
	1UaebQHCjf3N5s17C4j+3ADZnINU1OCa0y7nbqDVQFA08ob8obIZOk8t8WpLWsbJaVWkv9aSjiS
	W/A50aAubkPkdhco9SwimC1uRo8rvHV9ajXq6z6+t5xdiXWht2GNaQnLyrPZut3NpezGoccvUQD
	yuI0jV16irYCj+2KLBbFOqIAiJIDySpJigK3VLZyShrMZVi6LD21EJd8FQbZdXAj1rOdeFNUQSV
	eWNoscOBStk7cLV+BfhpRztBt4jZXCwpyAE9KxObqcdtfsw==
X-Received: by 2002:a17:90b:5884:b0:33f:eca0:47c6 with SMTP id 98e67ed59e1d1-34f68c27d86mr2989815a91.30.1767813625530;
        Wed, 07 Jan 2026 11:20:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr0EmpIL15U+IbCIlvrn3vzsxZIsZrdOIKp6bfOdosBumro4P26Dw1embFFuQ06lzk4B7wnw==
X-Received: by 2002:a17:90b:5884:b0:33f:eca0:47c6 with SMTP id 98e67ed59e1d1-34f68c27d86mr2989791a91.30.1767813625012;
        Wed, 07 Jan 2026 11:20:25 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7c4141sm5756375a91.6.2026.01.07.11.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:20:24 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P LPASS pinctrl
Date: Thu,  8 Jan 2026 00:50:06 +0530
Message-Id: <20260107192007.500995-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MCcP6PdQuwipiDVm3yKl9FK5jQYdeySK
X-Proofpoint-GUID: MCcP6PdQuwipiDVm3yKl9FK5jQYdeySK
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695eb1fa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE1MiBTYWx0ZWRfX6ybsR+mMqyRL
 qm7tfxbCyLrpL0jftng5OgIpyQppWTn9IB3UEcH7lph1pJx2Tc/q8cA+EU4LcydkPZOIyVI+EoI
 /dVNbMtmTZOwiWr9RPALKB9ILpzSXxzx+vFNIzu0cZhgyn/hkKXMyHOY+AgWqzSnULPC1r+04o5
 jCdEz0P0vMLRySgcSmUnNMTJ5DNsj/PWx468rlljW0HrsjXRggAlsrQ+tnVGLM/sX0fDJoypWP7
 uvJ2pGg+fL2E/YZHbha3x7zr2/HKxezExPoueKvSorYcmmI3FOVF7Sz868HudXFs0NsZzHLJEhl
 z23TBHKfslliq101gWMvNmpc709TAGdozW9kWEINqkckN9r/lLf8DCRje6NeTy9Hh2x7SKZNEVp
 dWAMeD4KTwXPZtYZpkk7dHCAMLAa+nSDgg8W1ocrbM0upQ+Wnxwdqy9fW+ABT1T4ZEB1d1L1Fr9
 EpqbeZTCQmKb7LWGlDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070152

Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
of Qualcomm SA8775P SoC and also document the compatible for Qualcomm
QCS8300 SoC LPASS TLMM pin controller, fully compatible with SA8775P.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../qcom,sa8775p-lpass-lpi-pinctrl.yaml       | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..4442f376a7b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8775P SoC LPASS LPI TLMM
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SA8775P SoC.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,sa8775p-lpass-lpi-pinctrl
+      - items:
+          - const: qcom,qcs8300-lpass-lpi-pinctrl
+          - const: qcom,sa8775p-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+      - description: LPASS LPI MCC registers
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: audio
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sa8775p-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sa8775p-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sa8775p-lpass-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|1[0-9]|2[0-2])$"
+
+      function:
+        enum: [dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
+               dmic3_data, dmic4_clk, dmic4_data, ext_mclk1_a, ext_mclk1_b,
+               ext_mclk1_c, ext_mclk1_d, ext_mclk1_e, i2s1_clk, i2s1_data,
+               i2s1_ws, i2s2_clk, i2s2_data, i2s2_ws, i2s3_clk, i2s3_data,
+               i2s3_ws, i2s4_clk, i2s4_data, i2s4_ws, qua_mi2s_sclk,
+               qua_mi2s_data, qua_mi2s_ws, slimbus_clk, slimbus_data,
+               swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_data, wsa_swr_clk,
+               wsa_swr_data, wsa2_swr_clk, wsa2_swr_data]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+    lpass_tlmm: pinctrl@3440000 {
+        compatible = "qcom,sa8775p-lpass-lpi-pinctrl";
+        reg = <0x03440000 0x20000>,
+              <0x034D0000 0x10000>;
+
+        clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core", "audio";
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+        tx-swr-sleep-clk-state {
+            pins = "gpio0";
+            function = "swr_tx_clk";
+            drive-strength = <2>;
+            bias-pull-down;
+        };
+    };
-- 
2.34.1


