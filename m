Return-Path: <linux-arm-msm+bounces-100522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA78FNQ4x2nSUQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 03:11:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E034D03C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 03:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD58A30479D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBC7355F46;
	Sat, 28 Mar 2026 02:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fb5n2/cG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9E351C09
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 02:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663828; cv=none; b=RZDJG8+uGSWU8zKsX+NnGwB0eKKWRwLBTR+zGOTh+ZZ7aUvtlZnYYGO6DzDlrtwa37jH+VOOQ50en0gV4ODYS0xJlbHQJDmcIOSDogkTHxpdIRzzGQOhE5ohE3F/lpJS3Wi0Jss9tm3kVq93KZN8r6obOppStlb5ku5hOYcN/ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663828; c=relaxed/simple;
	bh=eefoE2/jnfXAd5ZwciSBK5AkUaw4ydMJne1QeWmfh54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4+BOKmrIAX4UcSXqwpFwBYOZGGToqfJCzn/byuANfcM/B1uz/LiTetKgPe42E7k6Y5uNmP6f3vIvEXjNW5OxGoDEDlL+9gU4ByrTK8Q6vUUl4MEskUKgNX9E+iB/Da77HtxkSG+fNXCEikHsYPqutqT+pujbj6j5i9q0KtyF3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fb5n2/cG; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50697d6a69cso14861041cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663826; x=1775268626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpLyTYVFGXE2glJ5ECH5NLKz7sG78XOrtnMCJzmIFwE=;
        b=Fb5n2/cGUg1ZHoO+g3SVWIgk/v4csL3Apn3ZyuUULQAP6xfQXnlnx0t6TGTZLOqv0q
         cbFQ7X9+3rIS263LKNIxy99ZuKq/ok8WkwL/k3ktEuKCW2c07fNMWBtUpKyeWSv6XEeu
         Y+DSk1ILp2p4dMufSyyOXBkJl9GjdP9U/3/CGVBjzsJfSnRx20/H5vcxg82Mg8sud22H
         4urBAD3RXjZZ4WkpSeGH0NYmkalknlVq5U/eDQWtgv/k/SA1DGAp+AecW+TUDRAr2BQS
         M3+jhH+tPSapYSrAFcawbeQZ72KNkFnlMXvWD05u6LpKRixRfMQ2U72WmBBLpTtYuVO6
         djvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663826; x=1775268626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpLyTYVFGXE2glJ5ECH5NLKz7sG78XOrtnMCJzmIFwE=;
        b=Gv1b9fX2vNbvVl94IeSdBoUbOoSQPvFjbMT75JM+gGSsIZeArZ4HiMQi2sQOvgTiny
         ukTKKK0Tb2WNA+YXP/PUDLfseszbDsDqO3hvT+VyiGfe0Gxb7Qmlc9AZyhj8IEtwhKhe
         NfuCvoHrW8HSYJdO/DdN7km2GuUwnmw6Zg69p8CpFKXRJmN+hQu79fYwOvONR3MDwNIs
         jWCvKYu+YpXyJRwrBkz+CbOMlznq70GJsm/igGBWtoqmL29IiXLHnUes88m1c0VYbPZ1
         nwsesFlocysklOUW5Lz/4v6WCfq1gusKetQW2BnKzgyIY7Kdy3C2QL3k2dLx+5/nvK08
         7DRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdzypF7G8z7ROTcxfXOWBZp4zRCLj5tIQAMC+7fX5h2Y61AFGva7XgRyg8vIavYFdEsSCOjFAMHN97zgBO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfh4kPznLIQ5qet8lfcOySPOM0+KJv36TTBQoUZWLyQeJ79BRd
	DHCQMNfrny8YLJH20Z3tF4SIk6yKJWN0x8D1K6BvJ1zjFrSwh/IDqfA1
X-Gm-Gg: ATEYQzwPMpUpPV6LghIUEtrPTMGE68MqNryJbaTN5v9pJ9JfI6zHD5plZHT+SQPRfka
	1GWP0wkaIfEd9vZoVi1EGicaA8Y1LFlsdTfG2J/INiAgpdA7Ml4d9BRpzPffB8lH49MehM4GiQU
	QN2J/ZaFPtyZNECkyGFJHyqtjN7OBRvIGLLCBP6kQCMkNfncssPZA71xS16rkQCjCN4XMI336P2
	LsYusbFyavf38a4hwN4kAEHX8SdSxZikWXXQ1xpaRT+FKPS4DAxM6ssSuAHyQ+l+LyvaS9JF3SD
	QeenkcxEVNPLYtNXFG4x3BuAh6D5N3iTjgCOLsmAlyr+UJz81DD5aW4DrupTlWcmrE6ZkN2Viuc
	knLQl9HSMtXMu7FD/Ib/ln6Sp+7qlC1VnRc0I/N3ODhyhLhhzi2clbTgmaS5USePRt9OpTlIOxK
	lp/byVizp4a8na24JQUM+VeWU+aA==
X-Received: by 2002:a05:622a:5917:b0:50b:8b0b:11c4 with SMTP id d75a77b69052e-50ba380b4f9mr67449431cf.11.1774663825800;
        Fri, 27 Mar 2026 19:10:25 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2ddb083sm8167131cf.15.2026.03.27.19.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:24 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 2/5] dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
Date: Fri, 27 Mar 2026 22:10:33 -0400
Message-ID: <20260328021036.85945-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
References: <20260328021036.85945-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100522-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[62b40000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: A49E034D03C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the pin controller for the audio Low-Power Island (LPI) on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..c76ad70e6b9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM670 SoC LPASS LPI TLMM
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SDM670 SoC.
+
+properties:
+  compatible:
+    const: qcom,sdm670-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sdm670-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sdm670-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sdm670-lpass-state:
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
+          pattern: "^gpio([0-9]|1[0-9]|2[0-9]|3[0-1])$"
+
+      function:
+        enum: [ gpio, comp_rx, dmic1_clk, dmic1_data, dmic2_clk, dmic2_data,
+                i2s1_clk, i2s_data, i2s_ws, lpi_cdc_rst, mclk0, pdm_rx,
+                pdm_sync, pdm_tx, slimbus_clk ]
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
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    lpi_tlmm: pinctrl@62b40000 {
+        compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+        reg = <0x62b40000 0x20000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+        cdc_comp_default: cdc-comp-default-state {
+            pins = "gpio22", "gpio24";
+            function = "comp_rx";
+            drive-strength = <4>;
+        };
+    };
-- 
2.53.0


