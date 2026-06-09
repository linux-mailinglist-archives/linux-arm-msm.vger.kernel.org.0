Return-Path: <linux-arm-msm+bounces-112201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1EHeJNQhKGoN+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:23:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E0D660F60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:23:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=oexFxqjs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112201-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112201-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2C3130DA125
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB38357D15;
	Tue,  9 Jun 2026 14:15:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FE2340413
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014529; cv=none; b=ihZ+I1SYMmOVipjxdL9vk2YlEX0+/DZBIEleaoPP/oo+gas0WJres7KPbiHWozUAgcjUK1Zx3ILWoqMhmLavwQBELFH6Qd5FSQFuPDZrWHD1/rs7flWqAMWvFHmFkuaAQfbY6bqZ+RGXhn6mohHm1moyJwypruUbsK4/pZtlFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014529; c=relaxed/simple;
	bh=jGtdpE9UwjNX62OhSgQUXvi8hpltM7Py5hhv+eS3ZaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHhOqycCoclcqQA3gGENTdwK4bjLv8wi6Z3PhzF2qiN9p4F4gRtIPzaoOz899EiY2MtRa+vEp0w8WznH4hq7b4hP3GmndKAgGjoEQBLKHfcHx+IGIO999w7bxSzYmoO8WZLBUUqIAZFghv2DgPAcCcO/ZRNM/LLywIz6cSj9ME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oexFxqjs; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so61756795e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014527; x=1781619327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Svkh8TTwOpP5Nz7RAVeXNEyn2CeMCjSVCIOtvFwRCYs=;
        b=oexFxqjsDP1oZULIvwZodHEJfP75K9rHjFar6ls5k4kxtdW/gIY2viNH6pjavFCefD
         JE+qaLyzfdVXePHEBOBXmAVZ4euMDwwMSvjQ4CqQNf6eD9ozvgoEC/9nccs7FGrTpLRb
         FErk8D/yCOJi0WXOYldFyoE32zNQ/SZHiiFGhuj18mUkV07dsqYpYkY/j8Do3MZcUmi3
         qNH8d10WITKPxiBD13qDZJ17lI47CFs/ZGxKFLkGD6TFpVRm+1cQUCQzxsglUaNeW+tD
         WHDxrE/0Kn01KbDoLhdJ2V4kIfVVRxyDUEufhPdFyj+AB7R6xFUn2ohaoP9vhTKpBLEz
         +nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014527; x=1781619327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Svkh8TTwOpP5Nz7RAVeXNEyn2CeMCjSVCIOtvFwRCYs=;
        b=Bw0tzXTca20YvlxVsJjgo6ZIcWzdr826SlviGdmC3AgTjJEgwilp0aqCZcCmQ7Fxca
         9Fnd/VWy7Xf4jXJCMv8herE2QWSWURdEb3YzhSM26/vqvDb6MvWTxiTMgkPCmz9aSWQJ
         +MXO/LaoQX02f9HwmCm8XIWACcXbUDY9A33R7KKdhc5cK4TKnjmpxGLr6sTo1fPzYGBB
         IEXUm2EcCPyRJq06jYi179IZJhtcgCSDTI44lrBw7vWUpWTNhfuKq4CcmWcJTHmzZf1k
         Un+yjoaKcWgG+M6qqhrYnSDv4892jl7lR2thUDeXpJsUOJa9uydWsvxf41HzJLHTgmy8
         iF7Q==
X-Forwarded-Encrypted: i=1; AFNElJ++uM95teuvd5Rvs5zIBsd8yb3Ki3ZvXEtS3LRyi02eMHOEgKiCAi6fX+8zsTCMtijMrgDTw7vxGAGQjmhi@vger.kernel.org
X-Gm-Message-State: AOJu0YwH05/n5Kk82bM1TTTacKTQvJ9ili/8alUj5NicYk984wbWgqBN
	etXK1MwoksuCvhbjbnFUWdDcJey6tOA6vtqLMmORAobMj+3NKpGsBKvXplr/GnzGKxg=
X-Gm-Gg: Acq92OGA7OAMe3zTkiGwsulJCoJG+zWqXhQkxVLwWN0QJZtOKqWIQzFYFgPwYue0s5I
	ji50qRsl7Q9FzvV8XSrLDYTOplaXj4Fp8Ua3kJt53QXMoe5lvYOefDSh19m/IEymBFDRZ59R1Ib
	l5xrJ3uhS0WCMaaCsPtObGXfDzUbGwR8Hbbk0CXglFtUYLKk5JWZImASdoeYN6hj1v++r8aSy3l
	Wpx8x2D8logJpxDgAm7Bj4+sUcsBAjXuf4qxuFh+kn76Lv+d4yPWLCtearhSxX8CEIPgDBQdM/o
	9xa0oV+lKOLmKVmbL2nuFsHoZxa2ZstrWHwnAnh9bsUNmRBVFqeg54QSUs01lcyWo6PBJpq/zxz
	oTWDzkL6DAC98puXLlEVxbJIaXtPoJKDDjuRRIfrO4HSK3IMkku8GVeJu3mm3JFDMBLVBiRSw5U
	NtgbokMOfwUDclylAjshifnhseBSp+myfwJGmrChl1TM1tIkk=
X-Received: by 2002:a05:600c:1d27:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-490c25dd709mr356932685e9.21.1781014526601;
        Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:46 +0200
Subject: [PATCH 10/12] dt-bindings: clock: qcom,gcc-mdm9607: Add missing
 "clocks" property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112201-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7E0D660F60

gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and
"sleep_clk" clock source in the device tree. For some reason, this was
never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
dedicated schema, so we can just add it to the properties without any
additional conditionals.

Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-mdm9607.yaml        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index d7da30b0e7ee..ef4b274b5c09 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -25,8 +25,20 @@ properties:
     enum:
       - qcom,gcc-mdm9607
 
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+
 required:
   - compatible
+  - clocks
+  - clock-names
   - '#power-domain-cells'
 
 unevaluatedProperties: false
@@ -39,5 +51,7 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      clocks = <&xo_board>, <&sleep_clk>;
+      clock-names = "xo", "sleep_clk";
     };
 ...

-- 
2.54.0


