Return-Path: <linux-arm-msm+bounces-100863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIR6MoWpymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:49:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 514A835F047
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BB7730252A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0853DB630;
	Mon, 30 Mar 2026 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A41TPXXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B737647F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889195; cv=none; b=XInK0oF8XwC2Y6dB4982us2GZR6HvbFsJl089OcaCW7bNwp6ySDk0pq7IOTiWdreEc9BSadjf/qbcmVLa4+dLYqDGGP2qWcLJSluvYHcbBVQh+QvStzW/fVb6S8ipUdC9qijth8YjGJ6GzexGe3cSVhzZhVuFf5J8nfHYRcDGeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889195; c=relaxed/simple;
	bh=UGRFSj5Ba3is397uYXqZUWK6BEHYREPYtCW/7pqYOYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MN1al4ITjTHadr7Ls2T/EDZ9pbZlh2CX9YBfaiyc/T9F224OvawwVwKhIQnnMZmHtdJKvGzW7KmivHj5lRNt2bKWtVm2i7bIXsJvcJrup957QX7wpsrZHzjG0tcGRWTOfgVtWs6d0NfNUkn7LXKJnZAk9LHBS1Z8LA9a370EKUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A41TPXXX; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cfc2d1fdbfso386187085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889193; x=1775493993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbcT5PNKPZsRmJFnWFIOFaq96gfL1gOp/mxwODnDkPQ=;
        b=A41TPXXXmdUc+Q+HfvIhYbOgrHmoapNir8A07oxqfS4AjrhZhXwVUR+vIq4m8eq7Z1
         nQtl8EcjD8z2+XQl96A5xebpWRroHeW4Wx/MPBwqb/y2IhdaC+pGOtrMVzOJNgxcoMxi
         fPMZ59P8LQ4AVkse3xzhJefWdjHx+rPLquUokd74eoEAKeW/3KZQVZu46+s8Sc7VARlY
         hSUNMyAGhVSpZu62iyvkZl86XVkvrFn8j1bXz5D6/9QBM6EotaMwdkrbGHzvkmpVwoij
         ts018aOr/CsjyJOZqcwOI0NTABkclH8elkS9YzMtLMDn/OowcY4qOD9HynzWpHOd0o17
         KI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889193; x=1775493993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cbcT5PNKPZsRmJFnWFIOFaq96gfL1gOp/mxwODnDkPQ=;
        b=fisDA8sFh7oqn6JBPQHddwhJTPa2wOlZwGfyBqaxqbS/GBZg3PyGs3baVF35fHT3/3
         MARRcKRPXi3L3peeNDXnvF5d4KHIgBVsiDr30r32H6wHuUAifDexAq1qDvcOynZ6+OM7
         tw49MfGCs92EMsSv7OwVgHZh1VV0k1xevSAZF+uKT9lhEYlmT5/PWPmv7LyuFsvftisM
         beKxiRhiyZr0IDCXJRARRLowspBW10zmRKh/EE0MmHFo4DbflRlLPWkiO6GG6JpCUYD1
         d/Rj01vb2EJvMeR8xKUOlKuQZ9B0QZpKJd9BGTS7Jvjz94ANtZWdIlXtzYfSv6Y2CZ+0
         4dXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoOPT+/8xIHQ8CrF8bj/2RDtBWtBmXkH2/y3XGkrXVHAxhxVe77r0d/qsGl7hr6Keh/5yEv1ppcUY64ph4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Ges6j5SeZIeRE/a+2qTpex1eDPDJWZ1/6a/aligxYBDHvN0N
	nzntR1chGlX6RdYLxpHxFEnsu+e8UTRC3qMJL2VQO0p44C5x4BBH1GuM
X-Gm-Gg: ATEYQzzNzGLyu/j64j07aNvCRw3A5BW9CMw1qT4JVvuWhTe1/mwza+i1sFv9wZp6VIb
	Xhx0H9V3xpJd3Klg9C2T4QLJVKDglqmk9H2EInIK7bReGoDhfpNPu//Se1VSZh84NYTBJ9LEA/C
	TQfbdzMZa9S2l9DqiZDH1/9oebAuxuZ345PGxOXcAeZgcwTmRRBBux2r88B9vGfM/U8pkDLLoxF
	fU14jF55UA2dvODpMToRDey6bVNjEGp3O4MBG4zWaZILNkrxc6vTbJQYLv5P/RZB6/m1Uuqh0TE
	o3KKEhwLKHXV5Juc0yEnOfx3lubHN/d6xUVhSY5Wj+JEfsT3Gi7JbYUZ9nTPDqthxi0Ug0EiDwZ
	45jjXWyBGUsxGNzOezKPeL8ZKzqQ+84jN8oyq/slr9+mw0tL1QutC9m9rsXE+qMLB+/v2On9yXL
	T7T5yqKWspqxfvbHMS7JqW4+Y=
X-Received: by 2002:a05:620a:269a:b0:8cf:c08e:5f55 with SMTP id af79cd13be357-8d01c801736mr1622688285a.60.1774889193277;
        Mon, 30 Mar 2026 09:46:33 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028095f1csm741102985a.47.2026.03.30.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:32 -0700 (PDT)
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
Subject: [PATCH v4 2/5] dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
Date: Mon, 30 Mar 2026 12:47:04 -0400
Message-ID: <20260330164707.87441-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100863-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 514A835F047
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the pin controller for the audio Low-Power Island (LPI) on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


