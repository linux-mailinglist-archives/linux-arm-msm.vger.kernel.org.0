Return-Path: <linux-arm-msm+bounces-103421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNK7CdHn4GlInQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:44:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11C40F0EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE9DF302612F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E6A3CEBBA;
	Thu, 16 Apr 2026 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQm7r3qm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E33CBE6F
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347061; cv=none; b=T/mYPwnIC4zDL5+8UXZ+3wnXZl9nECSlrZYlQXd2PEgZcL1+9h3AfQPwZ5LFxCQyVeOd68yF01TuUfPfWdret8GGH6FOUg7j3MRpfTSaexz0x4rSfULEFM/dXUgdDAdsRoFRK2yXsTNhXXZUFdjqStIMBtLFOSUNE/R+WCMOS5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347061; c=relaxed/simple;
	bh=RzS5JmKjsOZYW4Pwddl7sWCABCvZEXMZ2Ju+Ufxr438=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i4TUds0KE7ptjNqM7Oo8TES+GS474NPSX34hgh2RoTOY/pgr0aXDJdYXfFxDz4a0m0LkTJLNDZwUmd8fM6uAIiJN1do7mCLMSa6vUWwir6qjxcF71/1KgfU2OFmGnq7EFglh2F7WmTpOYOM5x64xm1JwsqWJ5PInzPCNtmUFMn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQm7r3qm; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7b37d84a6b3so46481437b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347048; x=1776951848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywTUM+tHj4kZ/RlgFq4JcNm8/09Xy2NM9dmr9xVBZQg=;
        b=lQm7r3qmUTW7uqxhtlvQQNCq1dO28ZJuQlEhBhTcdWvpUwjAOwiWeDIQl+V8y80Iqt
         pxE8how88qyvJ4tuNQHOVWcNRr0thrbYXWH8ps2FetmX/5y1mDugFQgesDiD9oT1b+tg
         phH7o3HlJJDla4YlINQtkmceqUvCTaH2tEe7xtHTTvY6DTCDjNO1PTFswgfcmg5wLASH
         wYjUJchPrv5FK08gGFxa2b9s4suw4Jr+HU5mTdr3awtA8Eg6yAJeGoCI/QzCMLGjOvZ8
         uILRJIZV2dGP6TE95Owu77KKS668zdzpbmvNk3/6yUkoYyZEsDPP7yNRruMx713GeBen
         V0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347048; x=1776951848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ywTUM+tHj4kZ/RlgFq4JcNm8/09Xy2NM9dmr9xVBZQg=;
        b=ndH/dju1XBzZILI2l6sOWslknW0m6dGF15LJekiQPZfAvQtt9BCowovg8iFpL1xUbE
         F7M2gWjPGkc+VEq9fpwdfxk/oOkAvU25HQ3WTilYmIcgHKwbbw1cT1nGwxflvR/Wd0bO
         3GwuiYqFOgsSPuH/TUjjKW42ZTkEQ9VGKVp31XFCM7VOwgdmo5pZsJgvxya8doFi+ZgE
         5zP4mlPa776tWvSOt0t6XWHTEsMY64lAN6jbS8pS16Nzb1siEF4EQ1O8qJNZaSC/yrTU
         /w+Thmlb4C7MNexfUnnRCwkHI6afMUeJDo0yZEpvVzw58mHmMPkU85Yhe81wjLNTZMzd
         rOzA==
X-Forwarded-Encrypted: i=1; AFNElJ9X1GuKcs2khMxWK0eQMwxRRcnLFzcgPR5z7gSOdcVVEepE5pr2tvUD/ZWKQcbsh5EXndhrpzgKkT/f/kK4@vger.kernel.org
X-Gm-Message-State: AOJu0YxzzkGeQfr8ZvQ9zP+mGaR4cBJqwkOfB+1u6yA1721DgLjSwe0Y
	s7toi1lJsQIemv6kVklQHeP1hnBKDMNHSjz1xbF41xV8up0cwLOBaeNC
X-Gm-Gg: AeBDieseHxZ7UpNnza+kWTHJ6uV9Zd2VV0rUvKoue2E1BjjTvQRd3bXiKX0tKQjRKri
	uB5LIYMDdvGtBQ9eJcjOGE1t/oqPZpzhgfkgEL95Xaw3W4XbGtHxVcRwfFDC89Xe7+k6uoBqr4B
	YriM+IssBuwA+stB7BhLhmLZptybRIjfBQ46KJF62dw6aBWdwuT4sanaAEIG3lCq5RBRelAiVAl
	2Zh10oclUvmdEW3DawAXqfBb8zmlgT9Cr7wcmzhuDDbI7Ctu74nsXmoOaWwqMMBUFpLuBQSBxlF
	eGxrDRKtz0bHm02Fsb9Fmtfu7tG2vMYUVWzvjcXPYATpCyMB3Mf3DNmC+pBw9lHYB83bPYXA0M3
	A/j3PK7cJHDa9KDNo6opxEwEX9rvCHcvqZkpB/M7jvj4AITDN4f4x1ewSLex+2KYEGCLlkyC3PJ
	741RPUwI7W9HuUN7yrllO/o8CZXhB+fvuDRpcI
X-Received: by 2002:a05:690c:6609:b0:7a0:afb5:6876 with SMTP id 00721157ae682-7af70f92567mr262065907b3.31.1776347048274;
        Thu, 16 Apr 2026 06:44:08 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:07 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:48 +0300
Subject: [PATCH RFC 01/10] media: dt-bindings: venus: Add qcom,msm8939
 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-1-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103421-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,apitzsch.eu:email]
X-Rspamd-Queue-Id: BC11C40F0EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..730473cfcce4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,104 @@
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
+required:
+  - compatible
+  - iommus
+  - video-decoder
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
+          power-domain-names = "vcodec_core0", "vcodec_core1";
+        };
+    };

-- 
2.53.0


