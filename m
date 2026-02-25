Return-Path: <linux-arm-msm+bounces-94147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M4SC3EUn2nWYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:25:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D8199909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D94A32022FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D783D667C;
	Wed, 25 Feb 2026 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OwFhsUFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD373D6491
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032294; cv=none; b=IjAMrlEwcZxcsAn4cHdLegtj2zjpyHLIgZFwFIyHjUAe8eNQxbaGXRv0t9GxhxATIK51MaD1OcbhqXVTb8Eva8FpGc3n8eig+8W2n+ed2Ab5YI0LrN+vN3rGMFNP25z/Um/EHVPydLkLud3To3fXD2O41I5qEwPlag8pix6FXaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032294; c=relaxed/simple;
	bh=8iHwDAFeh3bdWbZDpz6LLnQiR8yaROrs4IIiP2W0Lrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h99U4Jb8VyxCGWe/+/OSM16DH07RSARDzQGJF9mNAU/MgfoCPFxA1XSebtRxFL+I8yBPbmiKbARQxjoWxvqaHpaLnh28bW9oXzQjk5s0bcM3Y3sbURNSYLqzzz95GF7+RkqGUvF/5aT157s8lVGkishW/BmH08+r7jLXfcZNxZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OwFhsUFq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so74996495e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032291; x=1772637091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFhoyoZ5mmYQSa4jSzB6G1OXMNz5eLbE8bJsbkX9OmM=;
        b=OwFhsUFqYqmjv5U6HZl+PjME1XOFj1lHDaf5lLhjPYtQtC5MaA5PEJunQxVhpDWrv4
         zok5iKLtLybiP1W2TImMuTu+R3rgHxMjeAZonrefOFQ8PdJmvQ3f+03rDmY2jr+ZXzBQ
         YRZP9E57zx9V3dwnBst31PnhQ3is+y5/VeKXizRW3IunnCafKjf5hPA82FT0rGFu+ALE
         YOI+n9YcjtGpxu5DS3kIwxd0qExlMmn0pANDGzzP2RLCdpTFYnD814pEohczFJLPwKlo
         8wRexmaiJ2aRftugAlZKfxRsvME1zdrZp5XevYOHson6qivTl5ePlHUpfcGARGIy5avT
         QH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032291; x=1772637091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EFhoyoZ5mmYQSa4jSzB6G1OXMNz5eLbE8bJsbkX9OmM=;
        b=B7SzHdJjNQ4L8ffA47Yr1t1MAMFfUtch/EJop5W/P9XeyWH+zwEiRaiN/nPiYZ9oIr
         h8rXWnbK5sn3YE+aIsCBpWJ9cjoWZamW7D7R5O4C30/V4Hw6UyehWrMgpVDsUqWE1whN
         5L9NHISru3YMAf7htbjNjQY4M92W6uX+okyE7DZJsc96BL/1k7CQkAWrfNFdLgcez+9v
         IdrixX5cjqCQftg0hIqPdF3AESHwXXgigmyBYc5H8Z4lrDvnZAGdEFoZJye5GFUfZDkE
         spEs+CGnzBPLbzIZtcNaaEVeqpnt5OzPzf4ML6YDTgxz0YM2gTHUCfCSdd7MxmISSbEJ
         X3bQ==
X-Gm-Message-State: AOJu0YyDO1OHgUuuMMDMmP4KB/D668+TcCRYaoCO/8ro1JsoPpD7YVH7
	ouRTOZJBpxWKY0Xx7HLVPhgxJZyqpefLRK6Nbgf6TRG8KCqpxvO3+O0+D2uHoGleS+Q=
X-Gm-Gg: ATEYQzxxdT/cTP5tUJckK5h8De8/BkgKj0guD+KnWFOdc0wzYWnGD8FxMCqHtGz51e8
	hihYUISfTWjVM/Elh0gEUir5hoTX0jr7S40OZS9rwIuCBo6fyhnT9hje1SAH9BnGQg/bUmMzYTh
	Hx0pBmBOTg4mSI5Ms3ERxwuy6M0jUfSSn7O/C0RDrS5TOTmDn55YV6Q/H7903JmiN+2SoopVdIO
	swRy7jKu+p+pA9F7tTPssV0H52KtSaTAE99k4FRv0cGJ7Kfh5Q3mTWufknPZJ5a0Pp59OeieqHc
	QUtRAyvtBBnd4LSMYAUUeffsluiyOcWYTcv/Kal6x8VrDcVqJqisAG66YAy6EQMhGF1u/HySqXH
	aEcsUblNeSMJRQjj+7xMZ1Hp0x7SSVTF4GTaz64iIHQ1jrVoYlU/FYZEPn/2LKl8uDp6wCMLtW9
	g8/1Oy3iAv7DlyaCPOeSdmY6bRXcrXaAYZvp/CZVeVf0AwFghNFpABAPd2JeHRmKak
X-Received: by 2002:a05:600c:609b:b0:483:7eea:b172 with SMTP id 5b1f17b1804b1-483a95e9a11mr250826995e9.23.1772032290703;
        Wed, 25 Feb 2026 07:11:30 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:29 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:20 +0000
Subject: [PATCH v8 03/18] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-3-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
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
 bh=8iHwDAFeh3bdWbZDpz6LLnQiR8yaROrs4IIiP2W0Lrw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEZfAqrg+6o9JwIBouExCj2iZtuYoDj7MT64
 mw7+39Du8SJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGQAKCRAicTuzoY3I
 OlW8EAC6WYNUmhnZg2iZIY1QfSdjjcBX4FkMBeKdmGCo4NSwHRPctsjH6JOwltuJXYiMpxx7Sj5
 ptpKmhtrFfPKcZAC++AyOpcI/9DJbx4IpPtuHIVP6EidIrEZ1AodoESIKxlRHFJEhoMpbRnkCi3
 xZ2XW+S3xAmt/nzgNC3g13pVRd5E7p+fSilNRxi9y+ErTCZS5DTlVBbCBJINoQUCAjHLoz6Bggq
 c1bl/aF1iLeGVBeScR/G6W5JLB0BdfKil0DfuSCRg8DLrPr8URohqSGmk8CaT9Sr9g77zs1p/6x
 Ij80/SUutD9tPWT2JzyquFR/MYZghwvcmXAVJOPWIsHB80SKq0F1gNILXjJF5NWQKizAZf9tK+l
 BuqgSluYYFD4guDGZ0A4VO5G1kDa0gnxwX9dfIVhq3k6ERj5D0hSxD9nTUCORl6PWQLXPuqCixA
 G3ohy/4Tpw4bo5jlo9aynNYto2uV+zqhhOqbWAdOdn3+KW7+KiMdAryOM0Bd34mi+nw4BNL8a/0
 yGmBcrLHE7VrcKPqji8LF51OE+HWQtQA/CggTHD+hIgDKnA26E4qfYZqAIy698l1wkk30tpYdZD
 RYiyDF+xJP+14HEc6V4x3oP4WRk4/fgOOwF4Zt9qM3ZY2NppdaJg1QKr2RiBFBCJDMXIhEkMIsz
 j2Q8PWCPRk/8ACA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94147-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 642D8199909
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
index ff14a8248321e..462b1355c9fb7 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -116,7 +116,8 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
 
     description:
-      CSI input ports.
+      CSI input ports. Supports either standard single sensor mode or
+      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
 
     patternProperties:
       "^port@[0-3]$":
@@ -124,26 +125,86 @@ properties:
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


