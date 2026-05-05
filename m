Return-Path: <linux-arm-msm+bounces-106021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BBnKx1l+mmnOgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 23:46:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 690124D3FC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 23:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 683E63025AFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 21:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD2F4949F0;
	Tue,  5 May 2026 21:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNHnRT/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699A422126C
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 21:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017554; cv=none; b=NJkbdUwfTs6gXGRKP3PrC5He0XMVdd6k/sQkTZxWOft4TDVjf4K9R07MsvZpoIoMtRal68OomPryJouJLO9kiFptVF9hdQeTP91O7TqOx0v7fMExcfutd+3fdRFGr9mxhODsiKITNc9a/n0/DTDa3P1t7vdaXN8ZlzMjqdsQtWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017554; c=relaxed/simple;
	bh=mQCFWruCA9liz8Y7GOoawRK/Gn5yRlh1Erqdlb2XZyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfVxTznYQ+awjZIa6DPL52bwDqpQjkmv6Y0Qmq7pzQ2MbDNRjf9Mm4YNHDHbivoUZcAFH+kuJjvS7QmXapyy0R5t/uii2bt5Kvgt6YwzPErQm/9w/3aFSWMI47/v2qNybSVMkAi2KAXxaLjwzF8muM6i9YsE2uk824rt9GNyOm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNHnRT/N; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-651bc83e74aso5291832d50.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017552; x=1778622352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbs3u+DXgi4DxtN9oIYsEpuaN0QPP3RX4y66RdmEGMA=;
        b=TNHnRT/Nknr+M7o+u3vPxEzlufKtVzUBeBdW5EwJ0WPUSe5/WAFcniNu+jJ/UybGDQ
         Sv9zBUM0CdldDdaBCCIbD0UH6HvYlWM5H66NAJCl8zZRRA8yHvH7EGXAWR/18fg7vSf9
         1kLM1X5WPKs03zKYyBoDEe8Eml+atnvXQbdP039lEk48A6Fjrcp4lw0RCxQZahqQgpXs
         SfdgayYrwdyJ05YY6jg/edszQdo+Zsecpi3KQnwUsgrx25qxN6dNGzxIldwAJhSDoRUS
         KJGRTTOAeMCpRZdqTvKJ9Gmpda0quwSRKMBs7Z/pZuYLLjTPzyhyiSKYoZ2tX6ASEoeW
         6kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017552; x=1778622352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gbs3u+DXgi4DxtN9oIYsEpuaN0QPP3RX4y66RdmEGMA=;
        b=AcomS+CMcgx4jGcX4kKyGnU4mtLd5Mbey6jjloQoh0Bt4EDNlaIx0jcs5l6z4SnDnZ
         4dEaGJrfaIqOcz7senUzLS59cRGiuaLMbcYvfNEsRj2AzwWRz7XvugAZ+S//lY7CWtG0
         lzrGg0rkqz/ZaTold6p7BiFtz1pZt8Y07M4/JKbFFW/sjNLcVBojnGcF3tgZv4xOwyvc
         xzmxjELhwoodIDYpVXSg3HP4q5FBPyMCjx9qXLhYnp8RJB/zDCFtg2JS2quuWVBfRfud
         W40TsbB/LG8pN+IF8g5Hb4WcOd7Kgf36nS0UTO65GLwqb/YLg34K8bYKBJYdsqzaDcnt
         lyQA==
X-Forwarded-Encrypted: i=1; AFNElJ+1W/f4D8COtRfwVnfDYh+nkohExBwfWoH7DaMuIk85AiixE7IEJPZvVpaSzxW00CYE5eGb67LtbjPHIJ2A@vger.kernel.org
X-Gm-Message-State: AOJu0YydukYOm0/Shgo95hG+T4V/37DPrI9+7gr8mpo5I7Gt/2s+nuA4
	LLhTQH+A6f6hl8EMi7QsTY84fYq09n+HDMXZXEsB2H5ZX4Qe+U0GZ5eD
X-Gm-Gg: AeBDiesjE9WHCptbXiWjZPkQoW+U8L5KC7fsZwoSh2GVxKAJjLQwKBDPA/vkQF1eap6
	hmMGnwqBPIrUSO2FRIFnqrTm/i1nozO9gN4b/Vkfb50Wb0g2UmeWrgwHh+NgDnC/1FFiK8ARQjG
	FIgiPcoXv2Gdlfk4GuA0vGDWeQZY/QlOtPJxiaTptXt5sreZAfVCpT44Qf4pGpLXq2tyDybe/De
	hwJug+UV+Vt8cR3ftmIwLf/F+q9cbRpxea7Jzk7wwZGLbJ6nv45lZqH9HMmS6k0EhUB11Y9JYB9
	82hiZGGblyvy16ELw2nUmzAqHM6XAhHrAc2nQcK8QcdnewfBPiIv/pjM2Erk4uaaQTb+pGwcFDE
	tAh8D4AA3Msk5M6pX/MI959q+7b7ukXOC9UeM/Ux1xZ96+EY6hZv/Ip1H/+t7CyDwWRf4wKwzIX
	y0Z+Hg+oU/zqc2YZZbmQYvPH5oJcfOUUNQ3wEYNmMCUwkbS1w=
X-Received: by 2002:a05:690c:690a:b0:7ba:ef98:9719 with SMTP id 00721157ae682-7bdf5db9ad1mr12857667b3.10.1778017550719;
        Tue, 05 May 2026 14:45:50 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:45:50 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:38 +0300
Subject: [PATCH v4 1/9] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-1-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 690124D3FC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106021-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url]

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..5bbc7cfb61c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,75 @@
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
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: core0
+      - const: core1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: core0
+      - const: core1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    video-codec@1d00000 {
+      compatible = "qcom,msm8939-venus";
+      reg = <0x01d00000 0xff000>;
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_AHB_CLK>,
+               <&gcc GCC_VENUS0_AXI_CLK>,
+               <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+      clock-names = "core", "iface", "bus", "core0", "core1";
+      power-domains = <&gcc VENUS_GDSC>,
+                      <&gcc VENUS_CORE0_GDSC>,
+                      <&gcc VENUS_CORE1_GDSC>;
+      power-domain-names = "venus", "core0", "core1";
+      iommus = <&apps_iommu 5>;
+      memory-region = <&venus_mem>;
+      status = "disabled";
+    };

-- 
2.54.0


