Return-Path: <linux-arm-msm+bounces-104794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJlpC+2j72kcDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:59:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9863477FD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E5083008318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47B53E8C7C;
	Mon, 27 Apr 2026 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbmt1lMc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8993E717A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312726; cv=none; b=SswLsJnFLzuaRmFZHaRHffsF3prixkPLrrmGn7GMjXAw51RiofX8SJee86ciK+V/iJX61dWOkogM+eILH0GsXI6vTBhXGll3+0vrKMI0v2aCBnw8DZD1RbQoGNzqC6GsmZ1Cs2GHwfSGXE5wO5mSEkbJC7H49Rh5nLQgq/2V3J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312726; c=relaxed/simple;
	bh=sFgdCYiD5TfywfevqOqs8Vz5/tI6iCmjO2YFGeFbPAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJKBret2wgVS9mXyhjms6l6JwkbbZzBl5Jg3XWYxhEvr+HhbKxwRw+7PqqntOhcttMB339iP3nToeNyR3pKOjA6Ho/DnDwYrpvItSikH57EsVHRLruWKyhaD1H/vNVYAVovnQ8oKxkXpj3C/tZn/VxsHO4ZynaJNTHFYAE7Dfgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbmt1lMc; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986e0553bdso98558977b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312724; x=1777917524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=jbmt1lMcDni+FMLlmXV1JnIKbnb9nmT+Tc4zIBEzUfTNHhzDWBK9/lga5UNB8HNgmi
         /SAf7OxUU7aoxa5UnnqRGo0RM8qDo1lrUny5vKlCxMl74A1jwZ1xnAMR6x4qxSn3j1xv
         n0BB2hXST1dNNaZHpp92GieQG6JfnOErWeOYazczv/zpnOgvTQnkMXPjLEEFoXUF3iSj
         hVrISl/ZgGvXIKdD6TyMWMTxz1HbrlhEt2fIDk+/Zol9PCp1AaHQsraG48xsTdd4P/4x
         zBYglmkPsY338RPYTWH7iTvfu/2MojG/c2J5VGpC3tT5p3C7U3RKdYFOcH4LWyoxmPh+
         FZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312724; x=1777917524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=MdZdfOnMgmzSTtTeIyCVuLEoNT9vkDukmOXsIT6FRSgbSsOgMcxZ+gvo3EfEFmQ4tm
         kqA1Dyd4Tpsq8pM1wBiilGxGij1VZKuxIqvW4jxvcVYdy7bZpnhbSL7O9CdsiklX3L70
         SV9H5OO4SVRCGt7jIbSHzk6WLZK2ibSrwyOKH+do789TaxRRNCV0sTzbkNolO074PrtE
         zUcTmMpuba7lP/DMaRDtfgD2QMo6L65NKW/80Ip0irdO3rT6eJTuO7/DXb16UoIm9iGx
         Cb//ecjfH/pi8MVDDo6re7AS/D0nsugr1RnKr01cGYYPpJFlcIJL4nVN3t4Sds/2CCl4
         8HsA==
X-Forwarded-Encrypted: i=1; AFNElJ9tRbiPXz7ig2QsZVAeQZJVBzh9GGtSxMnzeyVzMy9Se6JjzYawNOXEFZvm/NXeBc/6h9BnkaTRXJQWEQ6h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzefs7QkQrYsnUm/7YswsxQOzuU8F+MOjolFPHLP2vc2f5aP7jg
	BrUPGQWV6o2zRWgrp90L+SGhe9JJg6CSphh72qRLwzEDBZvpYhPZLfmjim8oVUf24jo=
X-Gm-Gg: AeBDiesAV+op8XIzRPnLbkMYE3QmRQQLhS96KmKXdBxJCWjjBve8ViKbTzCzjgHdvpU
	P8hXAR6JmLjXdX2uScHIjsYG0LFIbncAXLqC7CH62LDLHzypanDTFCiHvQCqADeqPWtHksszw7+
	4vfgyHdST/j/KQXtNE9CjT8HtXPuMreymceXv43fg/qY7c2rmzYzKp/trC6wG0qa1F1pEfZTS0z
	d8IkLbVDbciHEa9jVEZd0hXjUXbt0cY8+dXqMeGpgziiwuypgfBTPrxz/pGyW+ciQ0LSJurY0x4
	tb3uj6t05Y/SABDm0vNwwAe4oYhmp0jEvXIFVQq6BEA6Apv99ROOGty8ZjB5WPCxeYQBcwudC+X
	LJeBRzrwrx+6yLUlNBepz8jmdRG6xHq0Hun6pdR0LBcqD0DdF+qACqxj96szqS3FvOHqLRWKFNu
	nfwscA8QXO4TkLqe/bX8lAkwcWrfVuPdTULUed
X-Received: by 2002:a05:690c:6811:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7bced8dc69amr3553787b3.6.1777312723838;
        Mon, 27 Apr 2026 10:58:43 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:43 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:23 +0300
Subject: [PATCH RFC v3 01/11] media: dt-bindings: venus: Add qcom,msm8939
 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-1-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: B9863477FD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104794-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1d00000:email,apitzsch.eu:email]

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..5790b3bf5aef
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8939-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8939 Venus video encode and decode accelerators
+
+maintainers:
+  - André Apitzsch <git@apitzsch.eu>
+  - Erikas Bitovtas <xerikasxx@gmail.com>
+
+description: |
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8939-venus
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+
+  iommus:
+    maxItems: 1
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core0
+          - const: core1
+
+      power-domains:
+        maxItems: 2
+
+      power-domain-names:
+        items:
+          - const: core0
+          - const: core1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+      - power-domain-names
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core0
+          - const: core1
+
+      power-domains:
+        maxItems: 2
+
+      power-domain-names:
+        items:
+          - const: core0
+          - const: core1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+      - power-domain-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - iommus
+  - video-decoder
+  - video-encoder
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    video-codec@1d00000 {
+        compatible = "qcom,msm8939-venus";
+        reg = <0x01d00000 0xff000>;
+        interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+                 <&gcc GCC_VENUS0_AHB_CLK>,
+                 <&gcc GCC_VENUS0_AXI_CLK>;
+        clock-names = "core", "iface", "bus";
+        power-domains = <&gcc VENUS_GDSC>;
+        iommus = <&apps_iommu 5>;
+        memory-region = <&venus_mem>;
+
+        video-decoder {
+          compatible = "venus-decoder";
+          clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+                   <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+          clock-names = "core0", "core1";
+          power-domains = <&gcc VENUS_CORE0_GDSC>,
+                          <&gcc VENUS_CORE1_GDSC>;
+          power-domain-names = "core0", "core1";
+        };
+
+        video-encoder {
+          compatible = "venus-encoder";
+          clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+                   <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+          clock-names = "core0", "core1";
+          power-domains = <&gcc VENUS_CORE0_GDSC>,
+                          <&gcc VENUS_CORE1_GDSC>;
+          power-domain-names = "core0", "core1";
+        };
+    };

-- 
2.54.0


