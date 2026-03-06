Return-Path: <linux-arm-msm+bounces-95839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJCsBLfjqmkTYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:24:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476022299A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 116073023D87
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8551F3ACA5E;
	Fri,  6 Mar 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tpHDeP+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E2E38E5CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806944; cv=none; b=qT7s1cokxLd5KAQ3cfdjX/NVpsNzaXtRn5zP3qdoJQOqvh5SeF/hSAD8cN2uLP/QYd1pUGbybH0sBlT4SbCg9zWvAITzg1YdXzxz1NZPiWkWMDIpvYIPxXnKVuA6lDXGGK/YfJBw32jY7/KFdp/fV2uOp2FH00BkZG8Qgxskbfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806944; c=relaxed/simple;
	bh=ZG4vqB20u3oeYRitCqSlm46mL+bG1BN+RLcEZiDnQkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nIn38xjfMUWESvXX1p6ETjNl4K5EvL3F1qZcKo2ErBSjwTgU49FQSbDBPqo4XOz7ZL33j8MrU0C/HPbDgD9Zoe6uktI8tbnilOb5waClhynCZ3c8yWPOQ1OpHa0LsAmRQ48aYshWbekttST1fhke+snNP0vK0P3Gzc83b56yZ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tpHDeP+9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65f8c8c3a4aso17086295a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806940; x=1773411740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GN/9HJvWN9Iaz4c8c0n++HKlIZpjwx7e1ASpMCTtePY=;
        b=tpHDeP+92NVfXnaiidl0+aAz3+9aATkukp/U4M8Q8kCRTKo422LBw49wAgopsonHDG
         hWnsEReJ8XLxYhjtfnLC180M43K5M5Zq8P2k0t0oIamber6aqZCPX6ivKDpRlmx2phs3
         pUbvxXX+x/ca0CefIuB1xD7j8rI/MGGcT/BX7fve+1q7CR6FRucs0ZmBU4gYqcFfbDdh
         gVQGJqoZKqwewXXKbffQCy77sXwsjuNTL+vrVnMSrUkUper+UAEvMrm+7OjdqUew/8mZ
         t/AZJvqoqs5H7yBVkUMY9qqlurlz7fSx8E8YLJoUsRXb8TZjlgoE+WEwHNAaixZV7F5/
         7uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806940; x=1773411740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GN/9HJvWN9Iaz4c8c0n++HKlIZpjwx7e1ASpMCTtePY=;
        b=V9nk66QlLWStwwFzv76267IPgqPI0/psjn2Si0SMLVwskdvc+X8E6gqaiJIqjauRM+
         MDFz5j8Wn6hqulB/ISb1X0C0QDAwQMVBqC7HJWdzmzyyiybfVI1r24qHUFU7QX5T9AFu
         MsPMhw77LX7IWEq+tnVdROL7csKwr125BTsMcTJi9S+4aU9VY/y3NM+2yZB3jb+rKtZj
         dfMZfySvczHLmcr65ao6ORRwZ3Gt17EsZZ0cOY/2wyPIPCQSHE6pYg33pOrWmZEqFJlZ
         usFII5HjaSlnBpn9WArAwYnG2DfEsfe5erTAz6vtf+z95srYlteUMpJ5/SqPfJm20Kb6
         Tm/A==
X-Forwarded-Encrypted: i=1; AJvYcCWkpfX3dAV9paLQzOINOYvGBEz02p8othkGGGVUne7MQN8vHFReziLQAhXqMUG9J0/Oa4IBncFXLH/9lhnR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtc52JHuDozkpDaTFIhFjyvcDqP3OstAXjXHTtLfUAukXW+bUi
	tp+aoQynRuDGNMGmO/JanhLiVpd45QreaSSnn9wFPF9EM9q5m+h7m5lmJ+HsRiWFpzY=
X-Gm-Gg: ATEYQzy2n/OhXNflKOemCzmaqDd63eZ0f4bM6pINR7/AJOA7cHtI7d18xAC8w99y/nI
	m9n4yX9SpIwfjoWGnbLucISxPKsIGoV0xTygUL0bUIygfhvtaMhpTW6RgYUV/rMrJ7oOfQu/90F
	k0QvcgoNIl+eAIA6YbFl/+B1Bmkw97CKgrMEIWeyHMZidhunysjm/Q96G6ZeOWMAytj3rXoVJvO
	4zFRgJ/u87PwfCFpDoU5cbq/e9rnhqB58Kao9pmhgFSP/luWg5+bYOOnebIRjYa5j/ODwg1jfIf
	8SybN1We3l+FM7mIZ3I9yo29DtdwcgXSHZQyXEZZaT1ZnT6Y5ZM664cwXhD+MMuoiOmIyemhIGa
	/JbaUP3iXFnz+kx2q+F1uYhnLgIKN3nD0KRD3gbZi/cQWSu4fWxrEGGW5RlNp7jRTr4yFcH754E
	WXStNwAVU0h/eGV192iE4CNPWX0zddcE3uEml5UeIq2X0pXRHUg/7rSt+zqpoqSRUv8O+vAe09V
	55o
X-Received: by 2002:a17:906:7307:b0:b8f:a26e:dec4 with SMTP id a640c23a62f3a-b942dbce6a2mr137162066b.7.1772806940159;
        Fri, 06 Mar 2026 06:22:20 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:22:15 +0100
Subject: [PATCH 1/4] dt-bindings: pinctrl: qcom: Add Milos LPI pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-pinctrl-lpi-v1-1-086946dbb855@fairphone.com>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=3950;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZG4vqB20u3oeYRitCqSlm46mL+bG1BN+RLcEZiDnQkU=;
 b=OAJkK1lyilgTaVbUADvWkxNsB0geeBBFLPZb9wjke7dZCGjzcAgc5fzWmWQBfKECKiMnjaKMS
 bSFHpto6X04DKRly3wX4Z4F/zi+JWIE7pZ2R+/kbML4z4GzqH9M38jG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 5476022299A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95839-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c15:e001:75::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.208.47:received,144.178.202.138:received,100.90.174.1:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,0.52.125.128:email,devicetree.org:url]
X-Rspamd-Action: no action

Add bindings for pin controller in Milos Low Power Audio SubSystem
(LPASS).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml      | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..73e84f188591
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Milos SoC LPASS LPI TLMM
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm Milos SoC.
+
+properties:
+  compatible:
+    const: qcom,milos-lpass-lpi-pinctrl
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
+      - $ref: "#/$defs/qcom-milos-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-milos-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-milos-lpass-state:
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
+        enum: [ dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
+                dmic3_data, dmic4_clk, dmic4_data, ext_mclk1_a, ext_mclk1_b,
+                ext_mclk1_c, ext_mclk1_d, ext_mclk1_e, gpio, i2s0_clk,
+                i2s0_data, i2s0_ws, i2s1_clk, i2s1_data, i2s1_ws, i2s2_clk,
+                i2s2_data, i2s2_ws, i2s3_clk, i2s3_data, i2s3_ws, qca_swr_clk,
+                qca_swr_data, slimbus_clk, slimbus_data, swr_rx_clk,
+                swr_rx_data, swr_tx_clk, swr_tx_data, wsa_swr_clk,
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
+    pinctrl@3440000 {
+        compatible = "qcom,milos-lpass-lpi-pinctrl";
+        reg = <0x03440000 0x20000>,
+              <0x034d0000 0x10000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+        clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core",
+                      "audio";
+
+        tx-swr-active-clk-state {
+            pins = "gpio0";
+            function = "swr_tx_clk";
+            drive-strength = <4>;
+            slew-rate = <1>;
+            bias-disable;
+        };
+    };

-- 
2.53.0


