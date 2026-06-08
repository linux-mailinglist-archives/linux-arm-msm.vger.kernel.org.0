Return-Path: <linux-arm-msm+bounces-111889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LHsHGM7BJmpSkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:21:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFBF656919
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:21:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=YmOhBNrB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111889-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111889-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D784301584B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE643803F2;
	Mon,  8 Jun 2026 13:20:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED5F257851
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:20:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924852; cv=none; b=SNlDOBvc1qWCiVz3UCcgXKaFr0Kdp12p13UwuBXvFfjwbQ/Vj+Vbv1PiPGmgcFjBrgQVqu5cnV/EunWp+TJr9SQe04H0fO3EmJMizLiDO4YWQ3TZNdt/GIakSeNJ4oOzSzM+vqyrtbow+qPiQaK0RZuLBA6Af1WHoKNHglUNerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924852; c=relaxed/simple;
	bh=AkVe5DSt4bAITD9z7rfDJdmTW1lvBQDnLkxEcgwcdfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xc6iaUxW/xlhAgAB1g/M0N8DGnKBN+BbkMU4iQY/PZEuRgon+ZWe8JnqnPIY8wZM7hxi0Y+pyWBjvycbd0OXJH8BOXoahoGBZJOT8C44wPeIO5aR9935iw1B66QWA5N9PY76MhhQPWB4p0KLecE8+WBYkwgmkJJQpaNMvGwcsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmOhBNrB; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b3637b90so36836635e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924848; x=1781529648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTitixK7p5wGlkH2q+LYGHH8Q5benyrXkOJwJBLEA1g=;
        b=YmOhBNrBOIBuG/5UmPz9b77OLR5KfT7K1VTBved8s0NTm3pDXG9IoPK4lpiNs4XJje
         zys1NFG2zb2Xd4hm+i0AacGnw7ozxj80AHeqJHI9AIyk32K2Ic9a9ZqwkcCK5s3s02HD
         K3jJgzTJtHP0IHW5ZRgc+75QlrTQPuRmapHipYtl5yYFEqDy3sx7Roj+C2p3zXDlh+I4
         +Z6ZsmxQ8It40Bv+NgISpHvCrcnFsnRpHwArn4hosZ4001t/IJKBB8NBqtTvqB0jrvG0
         +PxhrKRimLIXDarHhM07mwu/4GBNyzxcQVjsQhSAVNDoQPIEuF2DkbdDKWz1INb8gwU1
         dQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924848; x=1781529648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nTitixK7p5wGlkH2q+LYGHH8Q5benyrXkOJwJBLEA1g=;
        b=Bvcqdsg3/4at8PuV4SA9B1UcMbVORIElJwz62DCCMkIrGwn9a/5vNVa5OGCGTIFmqi
         1qtKQWPMQomwFuc6tijP4ldNhjr7A5zF/ANQ0RhxNINmb/sZb7r1xqTU+NhbPP5+qmZE
         yCyWfWh27x2WVuKi24v6gfaKKNM1kE5rWH/Ba24EKsDkj4ciUqhjW9juzEekGs+QQ6AI
         4wgh97vYwd2xNQ4yTxsR6clE5j+fYUr3mUmgTPwQzKatGzqMqTEbckJFH0Kevw8JqcRP
         8Yh1r5/tdfw+2zUhWdoSFODpnA6uPpIEiqw94i/2jo090jysy64dqfPcCDSRQSVuYX3X
         uMpA==
X-Forwarded-Encrypted: i=1; AFNElJ9LSnWO+2o9uFR4vGHPimAK8jOvBjAG+pE7HB1S8yUByUs3m9taT05MX4IU9nHybP0m1CP/G/DvFOHXgDhB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Div9fp7Wy8mbNLWlWGhZdU6GzEqTWEDxwXQT8Ac00tG6AIzJ
	IMC5Roc7TNIWLMY72zvrj5GcKTklF13jTY98pAvwZNd+zwfB0FvE6tUswnOmjGSEdt4=
X-Gm-Gg: Acq92OFEX6LchAS6bQs0NnIOecjnwEdcWoLp9+1s5YlrJ/mbUTfg/Badx5SBIcGCJ/R
	4hj+q0jGDKduHMN71MJ7ayD+GAdR5zmOSgIrWp6V6ON8HLcpK4LbDnGbL6+ocY0nfVaKqyYNRzm
	YEO7jdIXm8xDpUYXaBUPgpR1Ro3gVzMpOoj33qphVPeFj2bY1y7QBBhYFZVrozUkCjvEEZw56LA
	zW1GMUR89gyDOnkSOW8cuqk9Xgp/GKvQPZNOmuHc39OjHmQTwKe8hDe9UHHUUohWvTebyXIJjBB
	5JfwdUmh5XkJNA4Jhse0dUvtes0BzU3f9Tc81PCrL3h0g01ImYdmiekCWI/WOFRt7Qwe8dSCyE/
	3BO6IjOljAE++rhYq701bb9h+10TufwksMUZMtkuA08OIoVSQQIOqbxSWp89gP4BgsczbpAquP6
	WKQ4uEmEJKrmseUcY4V/m/2vQFKdKLBpXdgBU7JARliX3MOn4=
X-Received: by 2002:a05:600c:198d:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-490c25baa0bmr261899205e9.14.1780924848315;
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:47 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:22 +0200
Subject: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111889-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AFBF656919

Add the qcom,mdm9607-nand compatible for the QPIC NAND controller used
inside the MDM9607 SoC.

On MDM9607, there is only a single controllable clock for the NAND
controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
around that by assigning a dummy clock (&nand_clk_dummy) to the second
clock ("aon") that is required by the dt-bindings. This is not really
useful, so avoid doing that for new platforms by excluding the second "aon"
clock entry in the dt-bindings.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 5511389960f0..4a9ba32cbddd 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -22,17 +22,20 @@ properties:
               - qcom,ipq4019-nand
               - qcom,ipq6018-nand
               - qcom,ipq8074-nand
+              - qcom,mdm9607-nand
               - qcom,sdx55-nand
 
   reg:
     maxItems: 1
 
   clocks:
+    minItems: 1
     items:
       - description: Core Clock
       - description: Always ON Clock
 
   clock-names:
+    minItems: 1
     items:
       - const: core
       - const: aon
@@ -101,6 +104,26 @@ allOf:
           items:
             - const: rxtx
 
+  # MDM9607 has no (separately controllable) "aon" clock, only "core"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdm9607-nand
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+    else:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -121,6 +144,7 @@ allOf:
               - qcom,ipq4019-nand
               - qcom,ipq6018-nand
               - qcom,ipq8074-nand
+              - qcom,mdm9607-nand
               - qcom,sdx55-nand
 
     then:

-- 
2.54.0


