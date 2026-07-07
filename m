Return-Path: <linux-arm-msm+bounces-117432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SvXbJCyOTWpL2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:39:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF3D72070D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:39:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="qjId/E7C";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117432-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117432-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6C45303A735
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 23:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0CC390226;
	Tue,  7 Jul 2026 23:39:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF76379C32
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 23:39:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783467551; cv=none; b=mMnMXcuStIwS8z6qLNU/McwYDLpOjCxWeZYwkgYXbohgvsFGpcz1CUotKe3eeVEi3WAQMCwBSzyHHrFOzYY8lE7WMYab8o0Gt2gYtzQuYkyp69C6fQovxq8s25Zr6gKQCZFcRdv3soVqFzAzTVMVq//Qgbb+GZ+Td6rHx60vW6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783467551; c=relaxed/simple;
	bh=Z3dSfJX0MhbZYUDQBTNiVmFR3GkvAfvU8jIVz/5tEaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ikob4giotM6kyJEDTrgvFuu/29eh6PLEsuPNAikrQ47hcpAv09lhoK23uhjrcdnYqJ2djJq80dBi+8PBvgserGfdHkIdGJMVjKhg2oCl1FRXbzHh1YC/JoZP2fHdLEPVJkjfdHC67VYU8qzQ5129QJV5y2Z9XfY+SDQCEqmxL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qjId/E7C; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47122683cf3so45291f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783467548; x=1784072348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZ5vky0kSKG/2XGDPEUJ8CMT7pfEAaXySWSVtHtS8uk=;
        b=qjId/E7CCuSEswF1E1jPRFhXNo0rgTkP0ymnmVJEkZvGqloxarnKWiDCM5QZRtFfrj
         cdQ9OXdAcl8CLIfY1KUVhWyzx//Fw0Tn87Sn0XO81vta6/9auXAXk6IvRyoHfV6LIULT
         1hcEYOSQBDx5PQIAshFXTwwLPgbfWLsz/xpopShrywFbnVVxGCdHFtt5ZhFmvVoj1Q1A
         4DTNKZsuNpqXbE16BzAqiq1yMmxTIL2F+bgldsxiAps5d3kIo1OJ7kOZknAey1GWIRw9
         lavCUbm9NFTdeFirQkd5+wjRnj01iJ2oPmskrHzopTMI4oQF0M0uTFYyYAQ/SmlLWE64
         x7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783467548; x=1784072348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZ5vky0kSKG/2XGDPEUJ8CMT7pfEAaXySWSVtHtS8uk=;
        b=N28oXdBUYGxxUiCrZulaE/1G4SsEs8pisQZf2XWvgBar07MkAx11CbVScuqDY6rIEC
         1zeq4WFW7Qru0DMxoG5t0q4v30uv3BsnGhVTQk165naRJVsaW+495/N0tQV5d0OaXvrY
         BlFXaqNFZtVjBdHop4psObmlGsgkqXHxcA0kqIpK1qXXI3nUR8lTDWBHZpUv+RLOmU9v
         YMeemNjhbZb6ewYFSnlMO5YqmkEAS5kUtSLeyshy7+0uKXL3SB4Ix1XdCSTienxho1Bv
         IBFyYeAsIDenvu3pZtz1n9FqPOZ7IvIK8XzBUjfqe5XBEIsg7Xxiv46jHNSy53FnGa1x
         UClg==
X-Forwarded-Encrypted: i=1; AHgh+RovTsNXuRIdotybR3HDwos32yvY6S11NjuXqCAGJEaf7F1AG9RCjQkZ3qzzlwqmcpMtdJEnnjYb9GNOjjCe@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwdc1bJX38CfcfQrSBNa4LkuV+uyE+0jfSS/fyFPd5KJ9kPam
	bOJSYzGPxePWSlmyQNVGKup+E7+YE/ErXnde6L1gVMYu0u8LLpZhn2/zo1hnKbuRiKA=
X-Gm-Gg: AfdE7cldx4TOYdiLbFNdHcNvqc5LhixYZhGLtonx5VJMZUgZCSYBB2WXNhZh0ZZVyqv
	AlLBLYyaEgIeFKxeuEI1yWVPUtZls0WyhHj3JntuHdOuixRdPkHFnGOX8Gll/DZ2TNhRqcXEQEw
	6g2rBp198h7a9rJBPz7pjUlWOmXH+vKKFkWpGY9Qo0qfgUQMggpgZYDewEOL8Hy+J49TA1kvimL
	YMTObX8Mhrup4XAhWs6FT03pOiLcumRyZd82+vEyOzt/cpKpp5ENheKESrydwvvlgnqNNKoNgbr
	w4ZKMISL8j7jfpQ12ILCUgj4Swt6bC8zt3OYXZoO/r/vh1h8/aUS0lBKAcCg3sFSXA88IChFhXr
	Oj7fuoZV59fINlEZfzVvT095+uBGF+iiyBI68TF5gIMsSLqp0kZ9dlgMti/Yc5uP4JkJ6YkgVNV
	SB8EdvGFe3c43lMLVh3sd82ck=
X-Received: by 2002:a05:600c:4e93:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-493e67f7c3emr986055e9.0.1783467547855;
        Tue, 07 Jul 2026 16:39:07 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm82398655e9.13.2026.07.07.16.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:39:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 00:39:02 +0100
Subject: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org>
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
In-Reply-To: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7167;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Z3dSfJX0MhbZYUDQBTNiVmFR3GkvAfvU8jIVz/5tEaE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTY4Yi4SlrGsBQVG7CawSL3tFYZHaXSjQWFzgS
 9LKmbLW7TOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2OGAAKCRAicTuzoY3I
 Ok0UD/0c/Pudn4Ji4Y7c7c8BYMfTNR/LJXpXhq7a7KtdQNv2ZnYBznA3qKjud7E4Q7FCF2F0bg7
 GxPDe6hY9a3cjN2zEmFa5zvEm/9e8TDhIj6XbY6yQ5OxgMmq38wnesclpSJaHr+YNn/+tHNuHnd
 IxIF+XXlSJ61ZXJAJyAp6RKUdC1dovxfuTClphgZ+En/1Tpx2/f4Z3btjRo7SFo5rlYBQ++bT9L
 e4De4NPnmXk2Jnp4uvkrOk8bLeP31xMgorv4kIQI9CkwCvX/9Q7zLTqQKqdI0P9ko+DDO88ibgT
 emxLQ6o91J4GcND5Pq4Xpgck0Iq7Tbr2sUPDgfARTUabGS7fPMS8h9ADtTCvxL/IYmr4Hk2zSXk
 MBQbo2CsnXsOfn5Whk6Jsn8PfI1jMv+Vhv0iNkn81LGjttSCvn0C2FT2hHBZayoS9bEgP6mzgTN
 fVgoRdVXKqG1psQzV+Krvx08USpkBikS/p9ZVV5nlLLYSnTrKIpqN5o4rLUjbc/NoFbVvJlNIIg
 V1eUXUvLHHj39Unw5j2bSBd7g9D3o/Qs+8+oBkNA45gFN+9St8Mvn0zJFGLMQM1jU/LoCKTLxpL
 aFq35GzZS57iEdJjiyfQwIvtPKnrDwlxjj2nB4d5mUtRWYO4XOCWtk7GzXPiYrrV5SQ63JFC3qQ
 Qq0AZL4RJReCMxQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117432-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAF3D72070D

Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
PHY devices.

The hardware can support both CPHY, DPHY and a special split-mode DPHY.

The schema here defines two ports with three endpoints:

port@0: Sensor input.
          endpoint@0: primary sensor
          endpoint@1: optional second sensor, implies DPHY split-mode

port@1: Controller output.

The CSIPHY devices have their own pinouts on the SoC as well as their own
individual voltage rails.

The need to model voltage rails on a per-PHY basis leads us to define
CSIPHY devices as individual nodes.

Two nice outcomes in terms of schema and DT arise from this change.

1. The ability to define on a per-PHY basis voltage rails.
2. The ability to require those voltage.

We have had a complete bodge upstream for this where a single set of
voltage rail for all CSIPHYs has been buried inside of CAMSS.

Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
CAMSS parlance, the CSIPHY devices should be individually modelled.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 202 +++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..a7fbf6804cd9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoC CSI2 PHY
+
+maintainers:
+  - Bryan O'Donoghue <bod@kernel.org>
+
+description:
+  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
+  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
+  modes.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description:
+      The single cell specifies the PHY operating mode.
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+      - const: ahb
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  power-domains:
+    items:
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+      - description: MMCX voltage rail
+      - description: MXC or MXA voltage rail
+
+  power-domain-names:
+    items:
+      - const: top
+      - const: mmcx
+      - const: mx
+
+  vdda-0p8-supply:
+    description: Phandle to a 0.8V regulator supply to a PHY.
+
+  vdda-1p2-supply:
+    description: Phandle to 1.2V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. Always present. A single sensor is described by a
+          single endpoint with one to four data lanes. DPHY split mode,
+          where two independent sensors share the same PHY, is described
+          by two endpoints; endpoint@0 with exactly two-data lanes and
+          endpoint@1 with exactly one data-lane.
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@[0-9a-f]+)?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+              remote-endpoint: true
+            required:
+              - data-lanes
+              - remote-endpoint
+
+        allOf:
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 2
+                      maxItems: 2
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      maxItems: 1
+              required:
+                - endpoint@0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Output to the CAMSS CSID controller.
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@[0-9a-f]+)?$":
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            properties:
+              remote-endpoint: true
+            required:
+              - remote-endpoint
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - interrupts
+  - operating-points-v2
+  - power-domains
+  - power-domain-names
+  - vdda-0p8-supply
+  - vdda-1p2-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    phy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+        #phy-cells = <1>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>;
+        clock-names = "core",
+                      "timer",
+                      "ahb";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "top",
+                             "mmcx",
+                             "mx";
+
+        vdda-0p8-supply = <&vreg_l2c_0p8>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    data-lanes = <0 1 2 3>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csiphy0_out: endpoint {
+                    remote-endpoint = <&csid_in>;
+                };
+            };
+        };
+    };
+
+    csiphy_opp_table: opp-table {
+        compatible = "operating-points-v2";
+
+        opp-300000000 {
+            opp-hz = /bits/ 64 <300000000>;
+            required-opps = <&rpmhpd_opp_low_svs_d1>,
+                            <&rpmhpd_opp_low_svs_d1>;
+        };
+    };

-- 
2.54.0


