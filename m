Return-Path: <linux-arm-msm+bounces-116925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0je2HCXMS2rEaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:39:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F77712B58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:39:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Lv5C1wzm;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116925-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116925-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2293130300DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1E23A8756;
	Mon,  6 Jul 2026 15:03:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F46F3A2572
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:03:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350186; cv=none; b=hGGvCC3asCYFxQGY4bYeShVkn06FVSk/52SlgUzVsuIgLE4cah2V8mzL1Aj0G4PGVGacp/XjqoYO4sgWtRp2Wb2bSAmOa11d1ZltJ4LPm3xqunL4JTxaBrKIz2kgZEp+pLLYCilLulevU4ruEDOu+UOjPy0TGIpOrc1p0sTycZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350186; c=relaxed/simple;
	bh=I99MGLT4D47BThz6SZfrpPwMy7BbAelylwfqI+dkqnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4RgFw+IpMDwzGvT6ml3jGj8AW1f4mQjz9pohrMylYnY4gzHM+Tf1UiZfEdNJbYrJey3MHyOalVHRiiKp5IZUHaPumJB5XYuD09MkIBXcNFlaQ1DN7v0RDJ/62xVMZBu0tn9aIibB8gHqMd0Ujt+mYQe5o7bbH2eA0a3snJVM8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lv5C1wzm; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so21817405e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350182; x=1783954982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyrVFx05JE+my29Owh+QhOGqArzBrtII5yeMh1a+E+o=;
        b=Lv5C1wzmDWkdpV2A6yKDsPu84EQDMWeB2YMg+7q4/TDEDFjmHhtzUuGtkXsRUVGbJ1
         4ODA/MFxJYwfaL/dhS5yK/AxgFC5o22f+JTQ2qL9oQVPdNkSqBqrmTrGBBGCogEfBPlt
         X0dcEn3ppKIQHAvTMxxVBudNVDfp4s8IYjJcZ9slhSUYX67VcNTvDVMYUG3B//kkjyWv
         cGL37liS5eUD17pnX8IF8gAqKfn3AUeQ3jvdfbr7oUMATDg+y62iPDNJRoXVd0Gxp5lT
         9YkxRPpB4mRiS/zagxP/yP25slHKfU6+TIkxk8CT+Yo6mP/dL+/heguuKkApNV3mmR9f
         14JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350182; x=1783954982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyrVFx05JE+my29Owh+QhOGqArzBrtII5yeMh1a+E+o=;
        b=q1Narjje6HYcKrjCVGHf3vKrjwO9N/iWElmdQG03b142+4t0M/rQVEFS8pOud3mT5g
         u2t3z+7KNpcRcrEGtPlmT9AtV7qvXuZZqtFT0vUi9ry3FxL1AuoIDiwM8ympE2xB0fhK
         A+0QZepeayc/auTuX740WMchlMH7e0sLRIvo0BUwElGsaDdybj9Rh+WUNJ2cpmKnCCYs
         s3t3Ta/OtqSTCUfu4PkGlntVBcdhtdIrHpyf2RVS4LLlHBi7VGcVTdjC1rGs0S8PvS5F
         l9VDhBsdRXKkupQCmXmaBpSMSqIpC1+iAMkOUEC8SsCZ1uwCoZMx3NWUemycYaqH8FvY
         qYUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rphka+EhPNAzHlUKgt8vJyvFmRVQKq5y+NT/Gj4EYEl1fB9eQpLF98XluzIS71JrfL/sd9MgVTkGVBf94lx@vger.kernel.org
X-Gm-Message-State: AOJu0YxpQtqMnVVZnv7RaEH+krjgu40S9PUApiPfqRwgyGr2AeppKIg3
	IndTAXwcNACP/Gt2puDuIgs4LVemn5uRoBk7HPyUE7xwDndM+nVB1pRJOfl6Vkp/8Vw=
X-Gm-Gg: AfdE7ckoL387sZ85AOGKYqR02Hwsoguv3jLh+E8TGIOKhTMpPa452Y5QzDdz33GE8dr
	NYoFoBtXMsVrn5N6a2k8mZN6wFU2eklZE/wK2ToLjJntVQXJmlWgT3TxRtYwF819t4KtvlN16+1
	/rXtSjSVFXtz7RKTuit9JPyf/2NMbOV2RenJ6MV6LiN3x/5+tbplRnOk7TuMiTjEunGdaccvzfM
	qVlTu+GVX8AZ9elRvcTAsOttZOS7IAYfP04q2U45hUjoIzAltKFr2z0Ls7HVuL3M4Vsm454d8R4
	rI7UuwG/j2rwFf3R0BiFU4CwcSXYLD+FJM47J51i+sjPQfqLK97ZAKsWXiJtX6tNS1YbM9kS+dZ
	WFrc0pfDKPGx+6XjSlGgsEbjZMlJClQnUjfaslze2BQxbz+4iJxOhR78g8AuxP7jdwdpI6JVZ+V
	JhDRxMlHPPk47Qm+6stBHbACb+TA==
X-Received: by 2002:a05:600c:4747:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-493df0559c1mr11645015e9.2.1783350182313;
        Mon, 06 Jul 2026 08:03:02 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:01 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:17 +0200
Subject: [PATCH v2 10/12] dt-bindings: clock: qcom: gcc-mdm9607: Add
 missing "clocks" property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-10-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
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
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116925-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0F77712B58

gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and
"sleep_clk" clock source in the device tree. For some reason, this was
never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
dedicated schema, so we can just add it to the properties without any
additional conditionals.

Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


