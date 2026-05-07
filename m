Return-Path: <linux-arm-msm+bounces-106296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH/xAS9R/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:45:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F8B4E50CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5A9630E0E46
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573EA37266E;
	Thu,  7 May 2026 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQzrPws0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5B370D79
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142825; cv=none; b=lbyt9o4czQ46Z9EQphaKOEHhXFcS06x6H5P8tKQO1+vyq3WAWFGx6g93gvppBDJaE5OwEVW/V1P50ZZw+Dw0Jss0FbRvqMtuPg+B09p5Se99QwmvxwGPwMYEve5AN+b7HxJJ284zHXP4DyYN+qpCQ/pLjJziOTsqzGvjYDnSKfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142825; c=relaxed/simple;
	bh=hz+cNuphYh6KctNuqq/sr0jPhnDlQYgLMJefeaQQJQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYME0MpNALWHpyuibuXOpBo7BXLPTw/27H91w+tUhqzthYx4Ob1yLSUXtbCcdk3xrce64Cs61PbkiFjMvopp+o/jck26eL2/cU11TFmMGwlwXEiYIL/bO2ExZK7JbB6LNl3rXc3BTQGB65RKMqrayUynoHGMwiTfuFU1ybidyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQzrPws0; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7bd8cb26219so2654887b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142821; x=1778747621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvsb4xAKNE4uvpqV7KegL5UeBwHdlxGrU0IdXDSSfC8=;
        b=cQzrPws0vQoL8Ol0o5jhHXB3lUmPUP+5BsXTh5gkChFo8TlyOyRJIpevwZE53SLlx3
         HqBKHB9ucdxVtNnuveD8zVoxO1qjzXhJ8mNpX72NOp2TmzOeSM3fFYRyOsGElbCJIFh1
         cUd5DSGympqBzL75EX5yICGhAm1YWxEOiwGWdF4a/16LDB5FvlpCdqgVDDK3TVlTdNfB
         lEmtFTWkTqxQTnml/mwOyIoQt6PZH2oOwJd3NXrQoVXWprDrXgZzee/Izz4QlQOtrQzH
         7bIFLcAShu3gLYjJDTRKCQaxIOgRGoiCI2Kk+7smkn0pcwKeZWmlwSprJRyAUMb28tb0
         tlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142821; x=1778747621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvsb4xAKNE4uvpqV7KegL5UeBwHdlxGrU0IdXDSSfC8=;
        b=KNjeOFn3w1/FX289720c+fWBiVzSlWXWW7M7N+D/piwFRnkyoeQ1y3BUQCe6Dc5egC
         23FzbVrH93Oc5w3wpst40D6EumsJ0rjPvocT0daawIEjDtURSPDlZt+mt+zvSvyJpmxn
         lYIEAF67tPwvGvFaKBKbBhVq27UOF2BERUz+L4UQMtWieB1d2bvH2WGtatfGtob8HaoD
         3PW+Qy33qtYSD3214rFEpa12Hj1EdqqtH7Nge04Z+R8GjJNit9Qo4mSz4tjNljclCNaV
         tK/yLG2iqW1qiZ0ZCf+J/vo56nqSqw+3Iqp7TQd5LHiZOs8KeMA+3OlqM9vccRR/LxD4
         GMLg==
X-Forwarded-Encrypted: i=1; AFNElJ90gUHebklA5Y6rEFNdbcyTyJIGLsrsm2kL6tHNVXb1W3onjVsEyN31cBpogCMVId2b+KwYDc3bATKjaA/F@vger.kernel.org
X-Gm-Message-State: AOJu0YzOlTxbFtmK29qEhff1sBzyM2dM0ZoiU3jISWefyWUooNumTyfj
	mtaqhSBth18eaVjwAOa5IF//vDBs+CAyGwGSyMKzI9LgtL6K3M1iNvjI
X-Gm-Gg: Acq92OHLeTDW4pjrvQBdJXVQDCA2u42sKE5pJVdtVYim+BX2MX/9x5fe/h7K99yTzVj
	yTrkb3/70pVxMlRJ2WYD4oW3CQW09s1w1Cyh3fN3ReSKfPvol2HSYYTMsMxElOBcjr+5mSzPxKh
	BzFouOz9Va4htRou3NO+Vfn1M3z6fayHjP0YT94u1VDgz5zFvilxV2/SNGLb3REHV7GIROOBIfL
	dwmMfq3UPDgBSyDQ3HQ3Ipu4NEeo+L4PNcesBD4HHZ6bCPd2ggZIuxYgY5I/xJM+ED5vV+d4OIp
	r4hjnQJut8ZGPb3qNQvsFrucgcbNCsum/36AlVzdTcX271W7acihUdSPIy7AxG3PbCTa9Ff1t2s
	rD3r5NAv4mml/HRSpJgXEOeMhbHDu6G1VomFPfsFfntI4o0OPXXXDCzrEco9Lnadrc0Dn2dYYum
	BQ21iNtBH1pniKnFR/W0X0pYkya9l2IeVLfhCrmkgSDi434FI=
X-Received: by 2002:a05:690c:38a:b0:7bf:f88:2e0f with SMTP id 00721157ae682-7bf0f88440cmr1443227b3.25.1778142821098;
        Thu, 07 May 2026 01:33:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:40 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:16 +0300
Subject: [PATCH v5 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-1-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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
X-Rspamd-Queue-Id: 79F8B4E50CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106296-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apitzsch.eu:email,1d00000:email]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..10a50a410748
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,79 @@
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
+description:
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
+      - const: vcodec0
+      - const: vcodec1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: vcodec0_core
+      - const: vcodec1_core
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
+  - power-domain-names
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
+      clock-names = "core",
+                    "iface",
+                    "bus",
+                    "vcodec0_core",
+                    "vcodec1_core";
+      power-domains = <&gcc VENUS_GDSC>,
+                      <&gcc VENUS_CORE0_GDSC>,
+                      <&gcc VENUS_CORE1_GDSC>;
+      power-domain-names = "venus", "vcodec0", "vcodec1";
+      iommus = <&apps_iommu 5>;
+      memory-region = <&venus_mem>;
+    };

-- 
2.54.0


