Return-Path: <linux-arm-msm+bounces-92373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1S30IZ+TimlvMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:10:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E5116270
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BF5030067B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D602D0C94;
	Tue, 10 Feb 2026 02:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWtnpZh9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E906E2C2ABF
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689437; cv=none; b=aroUsFaLd7UKiSKP3VhRINjzIOzsTJcIsjh9hi1XIW/ozbZ6dwsXx1fzcKHQY5OWY4pGY7ncaCYD0Fyz8/dQXV39tsa1Xw1vzinOvWlKVyHoYpMPNV+Z8Wrur5YMPAUg9SKVUVfP8Dxstky67qAkTtTIdvqiEBr7UiPy1R0BMOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689437; c=relaxed/simple;
	bh=gAuhlX8TxqpHMMWg03KEEJo34V06DiDhUjyg+cFVFGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwMjgt7UEByW87MqyGYZ02brK5KNxnzYuz6b6XD0sqSG3TWENf2xu+WQx/eqTesxYKXtidC9/8+cnjWVJ+W7PJgiwTiAbdxsY/5hOvjj/FcQAZfSnGXV6g4+6PQBMJ59vSugGLxgZIt42rdylSXHiOC5qBmuTVew73zPRV/id60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWtnpZh9; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-505aaab61d9so2874891cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689435; x=1771294235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgCet5GEIn/MU9+jS2xsEMyF4DqXP/WKRLxFg70EPyQ=;
        b=VWtnpZh9ZLF36XFgqcb/rMLMK4gqQixmbqFmnTbydzALwDKiKnJ2rwGyufd3Bla/Qc
         Deg4yOX/11hD731sH3LIN4zewkz0aXGHVDmDqWY4ulfwOYrd5gmywKBAc6oOxcnLHohm
         3q5LIGuB7FmwDa3rFVxCVfProGvaEwvxE+YsiSeYLV17i+/nDWY8ngALM82iQFDvVz4x
         hl9GPKL6u7fi8ANLS5Xrh1JZdFYykwNk2JL+zQBvrPdRFwIcRO8N9eBiBVbo+W/Ypfnu
         OgHkq1HJnDI1qRww16B5kF3PgIsn+N8/8xbdZb9VUaAXp0T//6iZ266mLBWKK74FTdE3
         1RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689435; x=1771294235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WgCet5GEIn/MU9+jS2xsEMyF4DqXP/WKRLxFg70EPyQ=;
        b=R3Dc+J0eIH/5jDQncgUT8PrDpFhc8Y/bPYA5DTrB1YIaBSxCckD4LfS/v5HbGv4PSR
         6/VFBnJxmncrDcxYfKORwSLAjH7LiFknVw8Yg7EaXVW80l32FJpFnccirm2z544Lfd3E
         cMBbBif96jzcePAnQF+DYCNzjQHzexsEkIopByLbFeDPwFGgRKhj5j4A6ALMs+pJHPX6
         fl0aaI5KGYV15kxnZJSO9QkQU38LI/nyqXExDVZCh+X66aswfD9mECnHCO1O8/B/VR/M
         HDQW/g/WlIqQw7SHa0yRjUVRrBaOvoK3bfpYCg0TZLjvm3BIlhfIRpIgXUSOpyZo9jAe
         ce/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfbuwxrxJm7+jysaI5h6hak1ZJ26mdFEvqvW0UoIpnx48SLXKpv8uztnQX4+NBH2DSbWYGAr1bIlPCHtC8@vger.kernel.org
X-Gm-Message-State: AOJu0YwYbjjsrLJKX+nz/p9W8wyM2n+J9SzKRVTIqWXPJkLo6WcoIEj6
	zuaJ1TMLJjahOJczHHeYCz0gqmUNwbedGUyJ+6uXnm5fvPj6gSbKk6QT
X-Gm-Gg: AZuq6aL8QT8V1Mdn6EC+Np1p+pSkAZAl2BQOEFFsa7NtEbJFAPIzsY8ZlUoUvs2nYs4
	C8B5LPe+/1XCRRaeQ1N6QjPy4aT+JHHGi3S3FtdEh4OsxdfGgV1YqVnENTR6S5o3L6wqKgOnxa7
	kGB0/+ZN1Lzph9kN/UgcT7YF6/7cQim4y+Mea7J1802o7dLDainOtA8WgN1nb5NydJCF/Qk0xyL
	Tc41MGEbSWEdMBVwOKhhXTdJue1/yaYr0hoGqFY/6Lezy9YmXh+bQSJRWC+JhFWTDbhzVzv0LXb
	bIeJ14Hb/4z5uYCOATq/EEqk5F/c8r7kZa7Yk6h6XTfCPih8QKXlxB7rTCrM2dyZwbx2aJWCZa+
	P8fae5ib6lC9j0h5eX/pokYvtHdWz2BcyUmmJLJgXUBNy/ZCxDCY2xtszIpft7nZ/G9CJglSMNA
	CQqE0YsbTsscpBK8fe7a7jTB0nbsLoY1GPikw9amRqbToz3BrLgCzZ1oPZ3H3qV2DGWbJgfzwiw
	nF/xKln9rch2Ec=
X-Received: by 2002:ac8:5acc:0:b0:4f4:ee07:91b9 with SMTP id d75a77b69052e-506399bb6e1mr181615591cf.47.1770689434951;
        Mon, 09 Feb 2026 18:10:34 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89546b09f87sm75306686d6.34.2026.02.09.18.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:10:34 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: qcom: Add SDM670 LPI pinctrl
Date: Mon,  9 Feb 2026 21:11:07 -0500
Message-ID: <20260210021109.11906-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021109.11906-1-mailingradian@gmail.com>
References: <20260210021109.11906-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-92373-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,62b40000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 239E5116270
X-Rspamd-Action: no action

Add the pin controller for the audio Low-Power Island (LPI) on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..125f365d11fa
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
+                lpi_cdc_rst, mclk0, pdm_tx, pdm_clk, pdm_rx, pdm_sync, sec_tdm,
+                sec_tdm_din, sec_tdm_dout ]
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


