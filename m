Return-Path: <linux-arm-msm+bounces-91007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC1TBO8Aemnq1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:28:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF21A1391
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECC643029AD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A340C34F24E;
	Wed, 28 Jan 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="t3Ihowf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AA34DB4C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603220; cv=none; b=T6GbeLkUYmPpB90jBQ6txTlK/6tvkzr4UsMi9eCjwDRF91eMWl3i4ZkOljmm5DCfdJfO3jEDsNwJDTMdyMayoYzM+WRnVO6qVxCi/t/mYQ/KJa1Sg2UGlEWRB3KNbZg3RlTfQ38zaDaOgLbxU/mRuda9yWBeJ01gJxAWAqNBtBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603220; c=relaxed/simple;
	bh=hJzi+1WVJi3bViEFfHTLerRF56fSuL0dTkBkrX7hZ2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrG+aVafVSYkl7VsnlgmFBpAfUM35+iRRZLjyohBf6mCxvPZFlvnPhoDR5xcDh/rbZJ8bHkGOpcGhQBW7QckRAtur+yhENPPvhcEfsYYDRCcdlS5I0m0fHtTOrI4m43xWhyWSbTLYVRGURIp2xmUUNKgTi5eYyJiKQ4OOMhXla0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=t3Ihowf6; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so9767991a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603214; x=1770208014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmDCujZ3dSL1dQK8DryTjI+m1X8tch6zwLYuMjQ/ExI=;
        b=t3Ihowf6tbDIeZZJU3O9dEWvOEsvEnXmFSMlPXPN7ralfnsrN5OAIjP3nicU5GIItQ
         sAkt0kIwyEs9xph/yYyfawGivgwWQbHFVi6Rzf231ZpyCWs+QrcQZJgHNZ/je89VUPyh
         WToxOHLCO/QEAbckF8V/enRsiNaS0jbAZVrxa+rxS0HkEZtNBFZwCGkdbp8IgkbpjrvY
         1sPhmFegIT4GO3fNEPdTEShM5u6GG1yAMEORdg3tqoVJygY/YS1NvFeg6nUQbpR0Bjuv
         Teb++7fJijigE2uqsmhgBB5zLIrl8ov/GB10Yojfyc6chrWNo+f9orejGAH5k6/w31WQ
         +4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603214; x=1770208014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YmDCujZ3dSL1dQK8DryTjI+m1X8tch6zwLYuMjQ/ExI=;
        b=lUXMj3HwlfMyba70bz8ozGA7jjtp1f22azcy3y180p72dxqu5Rd/QYi58U55Bir08I
         TqFzzkvz6/mMaafUf5XKHp62pZq0fDXMGVWsESoxNQYgaNgrHJeS+SztfJWrY06efmBy
         jjP7Mdaacv7Kh3PVcc5MWXY3+ehJgowGog9W/yIa01DVHSv5NoIVR+Pp2/5NSrgJDCTt
         /B1jk+VS8+2rlwV5jveqKvfO3vcec5+tRjhVHtSOaQuyl9zEnthcYjTBhfQAduys0mmu
         K0yx2+umqD19HIjxMIphRwuMei7aCmzzTG4JoRbvonFf24FyGHpmuXr0mXHtLC477Qu1
         wsSA==
X-Forwarded-Encrypted: i=1; AJvYcCUX9+DJH6kValU/cWFsSe2jfTJIra6DhFYJl7BGnnrmOrbd2LeocV9uhzj1U7kqtFZKDt9yM4wJnJY2y55M@vger.kernel.org
X-Gm-Message-State: AOJu0Yw35gzTkqJHEFTLo0ZMky/dli9r/8X4xcd9ZpkEK6TJ+e7JVHyi
	Y335WGTbAXl1SGq9zZE8U6svaB5gTrGeYOTEUM0ilGB12Cdbm083Gg2nSQvZzQ1TJA0fpJOsIiD
	8dGg5Fok=
X-Gm-Gg: AZuq6aL0WuWHWVDRW8FguPs2y3bwzgLI2KFQjnfEdwzaNlFyOz6PbcQ4MLCwYSoHUGr
	r9PgnOSXm+eGfVJCSbFlP/lkRI5LwUmgJqtUAZfldRyXFil8OZLcB3Un2cEyesDtrFZksSNBQNF
	iOk0BaUFvrb4CMA3vRYH/pSAtB666ypepfrn525zUo0YcUamFr9uJdl80z+JbCqOtfi2BzBrfeR
	m7PrbTyzC9P8UQrNp1qxPt9tUJRBIfouKvHVQbb7pvi1VxO8MFzwaKdCNePOOBz6EAg/H4mfPFH
	4ap1BeCuc9HJTStxScu2ea8hRtUg7Q3i31PAsTsrobHfJKJz5Hh1RsoBg3IbJmQKTxhdBFAcZDD
	XpQP//VKDPVw4+d9wqRkONG9YzR2htkFM0MmyMWSe81qy7IKWkTdsLn6UjU4OdtpNYqREhPu/13
	CVLrKhfcsg1b1u1rJVH42FWmFznvi+L8U9BxwdGdLL5fAe5m5bOg8mWEXesZkrDAPDHg==
X-Received: by 2002:a17:907:1b10:b0:b87:7b75:5637 with SMTP id a640c23a62f3a-b8dab3b00c9mr392020266b.62.1769603214028;
        Wed, 28 Jan 2026 04:26:54 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:53 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 13:26:49 +0100
Subject: [PATCH 1/5] dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm6350-lpi-tlmm-v1-1-36583f2a2a2a@fairphone.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=4248;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=hJzi+1WVJi3bViEFfHTLerRF56fSuL0dTkBkrX7hZ2g=;
 b=lIHYjQ0cXxLLwj1T5hLZ2ritI4/NmHhGE1D5u6eSjvyTteYEuDnEs46ziWjOyej1zWV6sV2uR
 kJu2vPZOI8IAUG7IzFiZCrLTjWVw7Dieku7WJfS80m9UIGV8oXDJyC8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91007-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABF21A1391
X-Rspamd-Action: no action

Add bindings for pin controller in Low Power Audio SubSystem (LPASS).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..2fa2484e7bc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6350 SoC LPASS LPI TLMM
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SM6350 SoC.
+
+properties:
+  compatible:
+    const: qcom,sm6350-lpass-lpi-pinctrl
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
+      - $ref: "#/$defs/qcom-sm6350-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm6350-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm6350-lpass-state:
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
+          pattern: "^gpio([0-9]|1[0-4])$"
+
+      function:
+        enum: [ dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
+                dmic3_data, gpio, i2s1_clk, i2s1_data, i2s1_ws, i2s2_clk,
+                i2s2_data, i2s2_ws, qua_mi2s_data, qua_mi2s_sclk, qua_mi2s_ws,
+                swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_data, wsa_swr_clk,
+                wsa_swr_data ]
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
+    lpass_tlmm: pinctrl@33c0000 {
+        compatible = "qcom,sm6350-lpass-lpi-pinctrl";
+        reg = <0x033c0000 0x20000>,
+              <0x03550000 0x10000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core",
+                      "audio";
+
+        i2s1_active: i2s1-active-pins {
+            clk {
+                pins = "gpio6";
+                function = "i2s1_clk";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            ws {
+                pins = "gpio7";
+                function = "i2s1_ws";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            data {
+                pins = "gpio8", "gpio9";
+                function = "i2s1_data";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+        };
+    };

-- 
2.52.0


