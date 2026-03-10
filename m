Return-Path: <linux-arm-msm+bounces-96425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qENYB8pyr2lYZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D3B243835
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F3C3307E088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD99527CCF0;
	Tue, 10 Mar 2026 01:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlKjsGly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A142C08A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105853; cv=none; b=IZ/MNoNSjv3hQsm0/+9NW0hChHdQTpQb8vpMVU3QoFvYAURFJu6lVqUFPHSjimFwDbkVe+DmRK4J7XeddiIHrdagdvnKdo19agslZzD3wkEpRgrO7i7FzVNj+02hqea52O5MuBiCYosyHgNKZgoThhSN+ZRNSUH0YOX+1n1QwhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105853; c=relaxed/simple;
	bh=eefoE2/jnfXAd5ZwciSBK5AkUaw4ydMJne1QeWmfh54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=litZFsJTJTQh0nqwwbff1HfLKDTwzq+eDySQma1A68Qv6WfveoZWzxBl54ZHqztFETUWjCrAQ8XZt29FnjqqMUziAXdgvcS/Q4tj3Yd3hz5ChBcylN3xKMAlcPwQ3HmrrFRUuEAsdv6C0S+m2ds6meOX/Bw0oBzkmutyz0PXN4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlKjsGly; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cd7a75c680so220987885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 18:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773105850; x=1773710650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpLyTYVFGXE2glJ5ECH5NLKz7sG78XOrtnMCJzmIFwE=;
        b=AlKjsGlyiFUfkncd1NsyOzMynHHUc/zCzs4FeyZ4djgHhzBPNZAznbZz6P9v266mKG
         AwdriKno19JfcCyR4hhuckY6kQ2L8JqfYrlxaXinbikQvnB9XrYu4YbzE6yguy3RmB2n
         e0fFwozctiOC8dDPS/OG4Wi+AXv9xc29BvC3Fwb3NrtEyyk7j8LXsDYJ1QLUzFlTXdnu
         ll95EIFZyB8b1F8ZesdnvsfmsOSZW1QBkJIUIVeVMk5Nnl43DHi3//Gd2AxZBah5Vlzh
         CNAudEWjLxfacehmr7SMmRT1Cty/oNM3AvzOmJG23m/pKYhFqqPW+y3zCabO57b7ggxc
         FgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105850; x=1773710650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpLyTYVFGXE2glJ5ECH5NLKz7sG78XOrtnMCJzmIFwE=;
        b=A7YODl+as+j0UIxTV2lxNlyXWK2eCCErDQdCclNetYEOzVwZP7AcACgC2W0gxeznVt
         XSisc4EYhb/jCF3tkZkLH7/AYh2BUmqz1XYphyy4TKcyLedYbj3oyVfo6bBLLYq+RMzQ
         VwidUsvufocvZ+zxk02Cbt8ROVZlkTOq5zLm1wKUkv0y/9z8ec+4H0Zgs74RBwXly57s
         v65ZntRN5mXmKd2LDhrm71LVCwEJL/miH3CVfKeX+j08ygNkPbIOqSMYCrNtCugbmP83
         udVBWEIECMsaGBHF6EDCTj3EnLk/Xy4icSb3OqyUItS9LPvSlzcRl5z7RKBpdXW6PTPV
         8DmA==
X-Forwarded-Encrypted: i=1; AJvYcCUPv+11CXS8DxIJZxGsQbEqy+jD6c1dCB5U5fKxbBGZoGNPtaueWeluum/zLrh2O43reGUm8sua37JAtXjK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl2r/McQr2Wgl1ynacP5Z6nl5C3U5+2TJysrmXhQY+E0wSJ2QL
	WbQuTeCbPOMBO85gjqI5ahhPnU7WFArvxumXzsvBbph4/8aRWTtbE4OE
X-Gm-Gg: ATEYQzyuV/l8q9dUQvutxhYU2KK8WZczDTsel2EPJJxTcnuQ5dKro3hByqTs+T3N+RF
	sdLqSPGuZazMgGtcwQADcx6d04rNzxU5IgnmNAH/MKywhSrM4JhofmzIDCGElAyq1i4o7kAI3ot
	IwMD/MjCLOLhcjny4g3kQ9knxraqiE6pY17n2hpTuEm1YmSMmk4Q2nsMjA5+vCtGt0FsqSMXNKJ
	J/0J3gashoPp+1ZE1qZm4fRbcvQXlR3De6htE9l/NpYPEkNbBQ4X480VAK507WeJWlnVg3LKKFs
	ROmnO2Fm/mvkg+hd3d4ESqe/ptdv1/eU7CmSgVv98fO5y3o113r0GQNK+cldfX/lkDvbegJ4lSG
	+gK9RrMGX2wI9F/TewVRtilaBQ9OKINhArJwjkk4dUH3Eal/zYzi4RQcoTi8x8ihyC845/Qy3GC
	xcZuPQF4zOiXIR0UabJOyznok89nVYxyAiWa6uw4yZxHZ6H6sxon3cVLZzhBiUIBNC0Zt5YcODm
	dM7wcN7wffkzyc=
X-Received: by 2002:a05:620a:191c:b0:8cd:8f66:c9e1 with SMTP id af79cd13be357-8cd93b4cefdmr209686785a.6.1773105850007;
        Mon, 09 Mar 2026 18:24:10 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd830a7f05sm391481285a.15.2026.03.09.18.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:24:09 -0700 (PDT)
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
Subject: [PATCH v2 2/5] dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
Date: Mon,  9 Mar 2026 21:24:43 -0400
Message-ID: <20260310012446.32226-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310012446.32226-1-mailingradian@gmail.com>
References: <20260310012446.32226-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 72D3B243835
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96425-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,62b40000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

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


