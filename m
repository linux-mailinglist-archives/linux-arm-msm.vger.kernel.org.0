Return-Path: <linux-arm-msm+bounces-104531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDtTGX8I7WkEegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:31:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 094FA467444
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8EF630082B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93594372689;
	Sat, 25 Apr 2026 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spY9IRBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA117736
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141882; cv=none; b=Z9DwSgqpbAH7IMRCjN5bBjp36mRbetRrgcxcoZPPEgVnVzHikn+cOePS4CRtSL1cWr+KPH0CDbrULYk34aDiyyB2FFXYGns/Veiq/2+ybWRNzOE5du7E6ElYQMg7AE/WHuUN3C3/Rr93H/q4RfMc2xeCVmqt5eCsYeLgHLLyCfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141882; c=relaxed/simple;
	bh=sFgdCYiD5TfywfevqOqs8Vz5/tI6iCmjO2YFGeFbPAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWH+c12ZGEtxEAcSiPK3ppYwUDyYBwuYHyE5higvGhHkldJUVmOfrMZZbGc7DE2SgupM5mWA/QQHaDT9SkX0ASJo+TXAKz3Ad96LXg6YZPNyIPnvJSgAfBNTrAjI+BU8daCYdvyIP2TYTvuxRz+PF+rsZLNErX4LQ7J1Zqvqdzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spY9IRBA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so109036445e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141879; x=1777746679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=spY9IRBAQm24NEyYKsyUxzdxxh7SyRDyR/3fim6JiAnc9mUp7uIklerXnVUh10iZze
         gA7Nnrs6FHLiPl00ffSCDBRXvDWl6Zx0Or81GbvWB9qKPVsO/stMBC46tC0zRwUnnelO
         2D/qNA/L6XOUSjaVCDEHBmZ0QQh53MNodNWTd4KKk1IplhukLUbJ+FKfQj0fwwsFjc+w
         d5NpIr+clY/WjMhb688lstS2GvXdj06SkfwXyDkuXnRCacNMQmmRcmcBGo1ugKrFkGh+
         708hCnIkoGoTukJUlZeZWttzNlJyNjrOGoIvqr+dBtUrFLuWjy3TAHde1ZJ9pQz61Jya
         EabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141879; x=1777746679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=bFqsuWPi7+8lWTsIPXm2uBRbR8K72W31vfSmMpyRHPNP9W+VIU7EODHlyK9EnqHJoR
         YIURw1Q3i/mZRbtdcQELCR7qDCLvvSgjZ98Ld9E71aAddKkVaa9roaoCDNLbX5LVLbZm
         uC/BHEVcjCgteiHp/BlJyPVgOtlfIYcLJwsNU0fjzVlMrTdIZjh1x3rL5QTvSPXlZgpD
         zDguGa2UfHbED1ZXZdkx3fPdPjltjWC+kvxvHST2o5hw8iUYdrzXW7u/UEvZa5fYEuk6
         rps0VuI8C126APp2pUhtw84peUSwfvOKs7eSRF8yfaL8m5eHnR0rQYjiYr0YWvqGPreR
         rY8A==
X-Forwarded-Encrypted: i=1; AFNElJ9+40Jpaoz5RK3IOl/bqqHTMNJcTbhRzNl1bl9YJI4KhYBlTIdAFpVyokhyahiDt3934Dt9Kp7wP3yoOX1T@vger.kernel.org
X-Gm-Message-State: AOJu0YxM4trLJ/qOT+zCpuT95yi5099B4YSCcqqgHOe3BY/O4tgz2Bcl
	cBPs4CY9bOLrcoJu6vs9P10W8hiXF08LTN7nZznszn8Ry1+1VgWCN+gy
X-Gm-Gg: AeBDies5a0GuXr6gaJb1hWWu1xMqgODkcESHnq0AVI7NNeqdB9+2NldP/49pu//uyap
	P7y7f0szIo1GjB62J4tLX50g9zyDi3V6KswuTxpBnTATSfzxqIgEuPeFExA2SBu9N8zyQAocbfq
	miXqSS0+vn0ndoMabzOG4p5b+hwmNSQ/11KwNTf7csUQooi6mFI/pNtGIZIwwAs2QSzSa7fiYe2
	XEsPDvWSQgtBLlURbrm608Kh6XdgicBMt6phlU7WY3q+NZLyPx6MwSqFIRiJoxzxnAQtVyVho/B
	ElBxrKXtKttX3z9NjEBHatDdLgzklnPFovsjNYhJzVtKpvuJeDJCRv4pJUKposO/BJzKS61M0J7
	heEibFZVkrA4y9NJK9DmrcXikgI1c/TuWi3MziLUzuO2/kHClT9NSKWg7KYAUsmHYKxElByE4bl
	aHJmc8GODRk8fmCqOJH8aJSGMHN84ELKmEkRQ=
X-Received: by 2002:a05:600c:c0d5:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488fb74dffemr410723485e9.9.1777141878764;
        Sat, 25 Apr 2026 11:31:18 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:02 +0300
Subject: [PATCH RFC v2 01/11] media: dt-bindings: venus: Add qcom,msm8939
 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-1-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
X-Rspamd-Queue-Id: 094FA467444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104531-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,apitzsch.eu:email,1d00000:email]

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


