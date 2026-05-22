Return-Path: <linux-arm-msm+bounces-109349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEhSOsFtEGqgXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:52:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E90D5B6820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C98630942F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD76466B44;
	Fri, 22 May 2026 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVTbKYwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40234657C8
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461120; cv=none; b=hDK3Lb84sfgEb512IG8CDhF88MxOIgtYFBocWu+gudMde4wtHPdvLtI1Fy6YkAMD1vDHlDVUYUDBKcHpoAN2vMRUBT2eIE1mm8nPKMzA6fg2iYTAGaTWKG+HsVAIgibwBhY+HK6Ze6jdRrAVWFtKkzPzGXo0Ldy5ecGvU8QQyb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461120; c=relaxed/simple;
	bh=6FQSjzpZ85H0H8/KZhvDbUD3HpBQdLWzOHK9E8PPfk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQjuI3DcvkfCr0NDtKtUCc70pTlk5AFprW4Q+tI/uMCe4XZwQaAYz83wa2rF8gubvK5zdnow0inuNVdmE1Me+melnUwxrqxJrEKEcZ6MsthLKiI4xxACU0W0ZPYOLAmhCzz70gJQ6Wwe14NgxqkBwY3KiKZ1j7oHLYemZi12SD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVTbKYwE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d146705b4so79645425e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779461115; x=1780065915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2gvxuovNu+AY1L3n53aamPpT24oQM4VlgVPffxR+hw=;
        b=IVTbKYwEd0V0wj3SUD7m8G2cRtWv7g++i4uSzUJtIXe8XCBBWAsfnz0eJIGBg4zbTW
         PhMUY0CP/0XyhSRmjy4ySKqS6gx96wkWWD30itPbK/C1a9czVguJax/foJnX8wr9/jGA
         b470noJ0TuDhx10/KEmraZoc3vaoF5tZEqQQTHRLbR9et74yFGiPl6r+DhoQsJK8q8PK
         AyE+oehHHmYvhZVi8yey5B+vPNF+dbQwKIbnQM1ma18/IOvWEoltUKa5LPUvqpeg6Wsi
         3AIMpjXiLkL+qB199ad+1VWnGY7vLKNss2zGO0Bn30z1ovEW1U88pQ6vW7FFS04IRSt5
         Wf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461115; x=1780065915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k2gvxuovNu+AY1L3n53aamPpT24oQM4VlgVPffxR+hw=;
        b=pt4qQs+f4GFInAZw/rdovnGXfUNDgw7tySmHd0CTLh9gq/K5FlZQVEk6uhkW3JjU0e
         es5L6ELKRbLGbwYZrd79rgikHhulIs3roI4Q5jPtmtN3WCzkAiyI4hd9JxLfoktQGHbh
         SZ31KtESiBNPJofYdJCPNntaKIXE66RMEUZUs4P3eP2oKf0J8UPSq9RSH1Fn+WvFw0F0
         xhtVdU4WMbS+WxA7OmDdHfbzM2Tar6UJvDuf2/BzE7bamaaF7+VQD2cLhDvMezJtDDxo
         +jpkKTYrWWZWPsl6D1QpLeCu7Odoci+ia4UHJBzfrugviQWLBNZyIzm2TDVxqU3URkc+
         nB9w==
X-Forwarded-Encrypted: i=1; AFNElJ+FiD1ldfZt6FkW6NBG6XwYrXOFalXWmcbWLdfibeTuPmciZuHtUgV5+V+cGc2mrDEV/h2ILAN/MMzmpYqL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qC3JCuim5Iq1/UmaPnlCsXM4MwZhV/BqoPwEbtFs1ij3SNK4
	CYCaf7W40ixjfLo3c8PxKu6vvm6TUoYnWFkl+5xLeUGe8rjZTyTaNuATDqO+jgYiJRs=
X-Gm-Gg: Acq92OGa2PL2Oru6L8hpgHd0V21tdGF+QbddZ56IQqaRkmRAL3dV7TSbVRVkh4qP+ak
	PEKwk7SZKAqr0g2c1t1h4bX0YJfjktwP2hUGg4H7dlgkITXKviJUgqol+vA8tKzLvDkwDUkxqPQ
	1tGyNRHNvcxeVXa/G5SsKnzkjeioE47GgRAEr3AJ9EWL1BiRBDaM8kVltTv3jkUlg8NwG+1h9Au
	iuU5g5McUjzV4btCqOX9bi4yPOUqav10W6e798Yd09xWStZBwu1+jLBXAlED93K/3228SHnky30
	6S3/PXLvq3A5RAK8cfHT4QcGk/dFRssuT8e2qEIpF4F59psip0dN1xYehOYbVuCHiTQ3os5/nOf
	FY2l3jOBzcgfAxGMo5A0BZEN6me182ek3MCHXttzGDPh/RHJnpBuY2oBz/AkokWCDqKil4fcJkn
	PsCmIXYvAHeSGS61KRH2LrbEYdPQqsc16DJ+g=
X-Received: by 2002:a05:600c:4ecc:b0:490:3c15:7146 with SMTP id 5b1f17b1804b1-490426cd872mr54962835e9.19.1779461115243;
        Fri, 22 May 2026 07:45:15 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.110.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490469f61b0sm12216385e9.5.2026.05.22.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:45:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 22 May 2026 15:45:09 +0100
Subject: [PATCH v7 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-x1e-csi2-phy-v7-1-79cb1280fad6@linaro.org>
References: <20260522-x1e-csi2-phy-v7-0-79cb1280fad6@linaro.org>
In-Reply-To: <20260522-x1e-csi2-phy-v7-0-79cb1280fad6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7181;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=6FQSjzpZ85H0H8/KZhvDbUD3HpBQdLWzOHK9E8PPfk4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqEGv3DnjlUxOxA6VAlJjkdTuzr5//ImpXwdsRD
 Q+xWibDrriJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahBr9wAKCRAicTuzoY3I
 OkZwD/9f7D8OK7lD7tRhv+TyIHmS9OvOP1jcm1VQFAD022uUt8ioZFC3SVJd1XoH16TtxNJUM2a
 CrFe2mW9wFtzo1VdP1N7wCr0AFbtzPWpwwi0mHkZxJuDk5Bp1yUzIWm4++GNbYYBmzy4GfDbfDd
 7zJjmrVO7nMvyzaQH6BgsxNTU65f7P5Zo5obeoexpq1RAW1DX5S3mJC9nPDY3FtgSMhyech20TU
 iPh0qZop4u9DjpOv2camdVgcQqb6GnOOtQeVMLVHAn++5bpTTVuegrBbSPqKUZSEL2bp8uoif48
 Cd/zhMbwCY/78oqtwSYB7rmUWTQTpEZe45cTNGB6E+w7eqpLn+h5O2BKeE9RwW4AxfS6oaHLIZg
 z/kwh160Wqw1s1a6YgITws7qNi7yXW3SjRpVTYwv12oon0eI8eL1H2pf0p47+fhTYhMtn9KpduY
 mxAPMTB5isOR2qS2WmX2Go1J4XudxoOUPSAmLCcEA5gBDlIFeDQyyt8hGdoFcLmf5Y1wqpbrdeY
 whw1EqoCOOu6CVZErN1zhSG7WERNiWj5Lp2lkb1dNOKHQiQDLKq7/2+SQ6nqRp16W4DLB+oxde6
 rRXAk1akMSsgtpT0DUqSC8WFQ4y+Hz7lLKyw+TxfY2RNCWrW5W/UCbRDernNATdckVnBdGdgzs8
 QgKSvOrggao+TiQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-109349-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,ace4000:email,linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 5E90D5B6820
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
PHY devices.

The hardware can support both CPHY, DPHY and a special split-mode DPHY.

The schema here defines three ports:

port@0:
    The first input port where a sensor is always required.

port@1:
    A second optional input port which if present implies DPHY split-mode.

port@2:
    A third always required output port which connects to the controller.

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
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 208 +++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..f434fb04447f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CSI2 PHY
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
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: MMCX voltage rail
+      - description: MXC or MXA voltage rail
+
+  power-domain-names:
+    items:
+      - const: mmcx
+      - const: mx
+
+  vdda-0p9-supply:
+    description: Phandle to a 0.9V regulator supply to a PHY.
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
+        description: Sensor input. Always present.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+              clock-lanes:
+                maxItems: 1
+              remote-endpoint: true
+            required:
+              - data-lanes
+              - remote-endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Second sensor input. When present, indicates DPHY split mode.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                maxItems: 1
+              clock-lanes:
+                maxItems: 1
+              remote-endpoint: true
+            required:
+              - data-lanes
+              - clock-lanes
+              - remote-endpoint
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Output to CAMSS controller.
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            properties:
+              remote-endpoint: true
+            required:
+              - remote-endpoint
+
+    required:
+      - port@0
+      - port@2
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
+  - vdda-0p9-supply
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
+    csiphy4: csiphy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+        #phy-cells = <1>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "core",
+                      "timer";
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "mmcx",
+                             "mx";
+
+        vdda-0p9-supply = <&vreg_l2c_0p8>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in_ep: endpoint {
+                    data-lanes = <0 1>;
+                    clock-lanes = <2>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                csiphy0_out_ep: endpoint {
+                    data-lanes = <3>;
+                    clock-lanes = <4>;
+                    remote-endpoint = <&controller_in>;
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
+
+        opp-400000000 {
+            opp-hz = /bits/ 64 <400000000>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs_d1>;
+        };
+
+        opp-480000000 {
+            opp-hz = /bits/ 64 <480000000>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs_d1>;
+        };
+    };

-- 
2.54.0


