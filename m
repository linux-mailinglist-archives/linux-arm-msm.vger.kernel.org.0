Return-Path: <linux-arm-msm+bounces-94305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JnPKNpZoGlPigQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:34:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 206D81A79FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 297D3310850E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DFC3D523C;
	Thu, 26 Feb 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5PkBfRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A3C3D3493
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116131; cv=none; b=KtnnNNrBuIkryqF2ZdlxVbFZSo5808GdntQX9Yn9m25mUXiQO2Xsd0yGeGna0p/0AaQu3mFQO/MYr3kaiXWo2tPpTfjPZ07tCe/u5CJ8znYi6P19QbuNQ2eiMSKaJeUjEIfXl431LSUjTD4ds/RQmDD8SFqilDHL48uXH/UfYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116131; c=relaxed/simple;
	bh=Qn38MpcT3X5Uop/ohxc7EbyGDk10OdmDudGcFnhPjxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOnWr5e8avzRO304dgj1IRBZHnaTNtsAzgT/ePj4reMdWjp2PpuOm7kAdOTelevyWljF0XRC+EAjULxFW66NTO9Rie7elavJ8V9OfSZVWSbHEChg4NYOjuBxGw1hWGqy23S1uCTJNB9/7wNY1XtdwSp6Jue0EXd39I19CaUjFx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5PkBfRk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43989bd056bso794191f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116126; x=1772720926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAf7469QLdF9nEYEeORB29gZq4TsObx9AWVyJ/rds9w=;
        b=k5PkBfRkAgezcT43OXqr98+PeNadlKfc7sjS0aQqrQlKtOv36KwCEbjD+q/ZHT8WyV
         j66stZhmV2U4omDu6GKL5Afn8Pq0LYr/DPa1QjWzpFFiIR08ObhnURXKO3n5fK3OZRxh
         3nzVDtq4H0wHJV/7+kG5saNwj4+dbHpGgW+F+JMrnF3OaDpbTSQARAD073BcBqDFxkhN
         x2X8QRoCs+I0jNSobMiWnHT6NTjzd5/xVgoCvOHa4qOVEiCJfq6ynP0Cl3e1wGHprTRV
         +AeqQCfONyYlhDpqXOtZtfrl0EzfKyjxLOKKWZoB2MF/g5NOIAQd+12kthay4aX9htpS
         DWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116126; x=1772720926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gAf7469QLdF9nEYEeORB29gZq4TsObx9AWVyJ/rds9w=;
        b=UKo1RMT6PdBXhVem29Rj0FyrCharfa0RV0EZjGLySsbjf3E87rsRy5TXXxTGAVvb02
         NVyI83HTZE3h3Yue2Xe71DUgwL3rOrEzQzVXtLldnZN5GYo7Q9SNQXm34wT4/pkZjNUI
         4pLwDQkDJqpjqgpv847IWTFEpWilolSjlHIFQtFvQOAV3Sutvgg5GiciRxwO041cWWtQ
         FnoHJdPd7iSgm6QwG4NpdTeahI7YeLkkIaHRlgNokjrneFrNFvTXCpC5KIQCZkw9w8EA
         PYCmeBci3rhQ6kydbNJuT+ejEuDGihhIdwuCLXFacYHOUUgZrXLTpZH0nQd49TCEATho
         T/bg==
X-Gm-Message-State: AOJu0Yy1DYMMd+DQBlOpKG+SQCljBhkV3oswPAGu1rS3lVEPkocvl8XU
	HPsvCDwEAhcGVa7AEoYUvLAEq1XzOofx+YkcGPV2Bo63yWhGED5xZccQcXaN0OFMh6ZiOk0mUkc
	FvN1N3kI=
X-Gm-Gg: ATEYQzx1VXnVpiDh/T0xSZ1Qca65m2AumzypjBRR54XRIfSEkAVP+MB4VC3dGJjzAZ+
	vMssPajNpkprokW/OYDZLR8lPiBH2muOJ2eKZmIIMvvnoMEsN34rB0CkAtP5by1zruEf/71CfjP
	LUOBAjcqGR32DSv7tU5x6vjnif0YXS5OwZ01rTaK2QOobEqWZLZaN8cJ/+RLj2XGnh1NRIQZpvd
	n4iRw3fdHXyAC2UBx7H7tvFmELA7c6RRscUcPagzDUO2MjeiOyAjNGHWlUe/s8SizmC4JjHfne0
	jJF8/sZObdgefq6qnZWLQc7TSrnYs515SnPb3mlqGZwIx8Ut9mip1t4xm2f3Wx3BAU5PdwDnjwf
	G889w3hy1AxWvdMEnuAwkw/wFz/spwp2xu2eIXJAacVQH/jT8ugjKbeGQd7NSsiW4W1U8Jj4WYv
	UOhJYGK8VyHCgW/0sidJ7Uz4z+djceQ/qJEcCGjS98p406HzSMKZatCdNajKo4jnqS
X-Received: by 2002:a05:6000:144c:b0:439:909f:c594 with SMTP id ffacd0b85a97d-439971ae7f0mr6470219f8f.10.1772116126101;
        Thu, 26 Feb 2026 06:28:46 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:45 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:43 +0000
Subject: [PATCH v9 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-2-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3883;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Qn38MpcT3X5Uop/ohxc7EbyGDk10OdmDudGcFnhPjxg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFibxmwRG4nV42g91OU5baGAhb9UrprB+WKHZ
 UeLkd9iB7CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYmwAKCRAicTuzoY3I
 Oi+PD/9pCn3AIL9kKnZr+D3tr8VDBReN+w5AWVk8KycbgwU8ryeqALkr54fryKpzb5jZLxqiovX
 XRRXh6gUpyCYAsBNfDKD99+C1uDy6YaOfmLip+sWsa/YYfLje0G9J0s8nuxFmgQU53kCY+olg0W
 qm1fIye7dXW6MHXJvjY9K3+P0ie8VQAVR39n+HI5NKxuzeAazFwckTgzTA/wY0ozthnlUk4zYvZ
 dCQYhxhFSQ+HjQRbGjDacjka+2hfFzwwIS+twt00NY1UNyrHhhN8AzI7fI/q09OZIwMmg2OMYFd
 aK9j+1XCrt+1IbOTXllrz/Qk//rQ/B67gbWGP2ZnWpbubpq1La1SWk4mx695AJqshhMN3gk32xl
 9gBOCeGLsAVT/accM2oAlSwtzDQQKjNDAAT42AEjKmSC2SKcj4sFmRtIeuVsHio1r2S0RB1lGsb
 ZLNVjcUhda1VM+54Cu4wLj1J5isHMcjKDlrHa3js5qULzYADANUnNlGlIa8CC7ZlRhiyL/20471
 4JypF6hC48KNZm8bFNSCivfirLRbzWYCSoNglj/7c6WZcRvjSru0yaoYcigurZ3RlHFyBVBDQ1k
 i0gSTKwDMHzDFJNi/tG6mpHyWD8kzmz1jwAyUwgOBVngydEzIcB1lnlFer44PxJPeuHTlTF717Y
 Vujn/s5/5pYyA6g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94305-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 206D81A79FE
X-Rspamd-Action: no action

Qualcomm CSI2 PHYs support a mode where two sensors may be attached to the
one CSIPHY.

When we have one endpoint we may have
- DPHY 1, 2 or 4 data lanes + 1 clock lane
- CPHY 3 wire data lane

When we have two endpoints this indicates the special fixed combo-mode.
- DPHY endpoint0 => 2+1 and endpoint1 => 1+1 data-lane/clock-lane combination.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++++++--
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index bb18236b4f344..8dbaab16b11d4 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -140,7 +140,8 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
 
     description:
-      CSI input ports.
+      CSI input ports. Supports either standard single sensor mode or
+      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
 
     patternProperties:
       "^port@[0-3]$":
@@ -148,26 +149,86 @@ properties:
         unevaluatedProperties: false
 
         description:
-          Input port for receiving CSI data from a CSIPHY.
+          Input port for receiving CSI data.
 
         properties:
-          endpoint:
+          endpoint@0:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
+            description:
+              Endpoint for receiving a single sensor input (or first leg of combo).
+
             properties:
               data-lanes:
                 minItems: 1
-                maxItems: 4
+                maxItems: 4 # Base max allows 4 (for D-PHY)
+
+              clock-lanes:
+                maxItems: 1
 
               bus-type:
                 enum:
                   - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
                   - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
+          endpoint@1:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            description:
+              Endpoint for receiving the second leg of a combo sensor input.
+
+            properties:
+              data-lanes:
+                maxItems: 1
+
+              clock-lanes:
+                maxItems: 1
+
+              bus-type:
+                const: 4 # Combo is D-PHY specific
+
             required:
               - data-lanes
 
+        allOf:
+          # Case 1: Combo Mode (endpoint@1 is present)
+          # If endpoint@1 exists, we restrict endpoint@0 to 2 lanes (D-PHY split)
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 2
+                      maxItems: 2
+                    bus-type:
+                      const: 4
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 1
+                    bus-type:
+                      const: 4
+
+          # Case 2: Single Mode (endpoint@1 is missing)
+          # We explicitly allow up to 4 lanes here to cover the D-PHY use case.
+          - if:
+              not:
+                required:
+                  - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 4
+
 required:
   - compatible
   - reg

-- 
2.52.0


