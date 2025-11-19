Return-Path: <linux-arm-msm+bounces-82449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 32452C6D7FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 20CD634C5F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7783043A1;
	Wed, 19 Nov 2025 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W41HWWO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869BE2FE564
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541950; cv=none; b=MB4d8OSCRqB19TPQ4JsJOAvYHjh2X89hYfGhOmPWIaHJLi3M0cQs/O9Pe07U7nKi6iUXQj77TFlRscSDnrEOYIODHY9+gcO+qUyks532ZpDBzsNJdWf44D5KnARAJc/k9HRL6WtAe9X7BUvzKIAQYf6EhQRX0N7JN/gpg+yRffU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541950; c=relaxed/simple;
	bh=Wwhv46WDe0N83GsQcFn0TZLW8DtrCuNOWijlSA0+FNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eIiHFwntdc2K+YrEi/xiv0V++Ip00olHyoxDyJPozjdwGKHr0OuoAzzmRi5WJX4lnrIg4czuLw3qjCkfoRdi7EoQzoXOO+HVXFjBllV/xn7jcDezx4DTWd95NcNaOX9u9+YBaDfLA2+8uNikHyns4ZusoATRKFxwyxlo3WD6IPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W41HWWO1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so395380f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541945; x=1764146745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRZnHA1TGMwuASpPE7D+kKGJIb0IcO74PDiT85kyX1U=;
        b=W41HWWO1u31JzaOnENzEXWfS7EsE68G1lK7Xm41D4ZgIGgaM55VlLI5cp/S5yFM0Hp
         uANQs6iDH0gE5Sim8tcTikPYPOCMCP682ce9wYj3WYvgvTcFN9nkklX1TUAt99FVPZIV
         GdjSNXgwUMPKSYRT2Z9YttjVRo7puFteGUj4/c5ephDcNgFf45K6fl+b/DXqT1I3LcPl
         aA1P31EpjQ8/NoAdKhnKO473BYsmOE4sIM8+u2NBI5rpDxC9+D0do1GCH5FFaBxaTV/f
         frucBvWXmGG9KxPkE8z+yNld0OoL7J3Sk2k4NINYi8hmy7rJP4fnzMHqeLnyFsIDAxJx
         itTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541945; x=1764146745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KRZnHA1TGMwuASpPE7D+kKGJIb0IcO74PDiT85kyX1U=;
        b=Y/EMG9lCqHHOKhf1YpYju3vJOyU3krLn734LINBLa8D7VdnR0wy2BLGi6DlmQrwggi
         /DRm8JQj5Zx8b9BehZ3qwZQ/IWUA+arlwQ5TukOlYr4Xa39hb64gavS5C0FrOljPQdNF
         TUPOnEljU7l9IXBjrK0o1Ju0A6QvVKkDWUIfd5b0yNUFVF42dyRL7aO/r4opNJGOoUyK
         5Wn++mTClhsvwtOKcq+j7JGWkRSNVyQaZR9ek5XvHgSXiqiEb7Q6rD4ZxWdCe2Ix62cz
         IjwWvcuQJsW7o9KY4ZPGYKuCIgDM27etraFFk2GO7IJg5CpS0a3bx+Ety3z2GzgCkPmP
         jQ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGCYv4RRWHW5JZqFY2C9y2PqXFiluehXxJwwNg7NcKsEmZR9/TlzON3/scyBvTYhZHt+epkdfCwBPvarJf@vger.kernel.org
X-Gm-Message-State: AOJu0YwprM+5JBxAyXv9AtWMDJP0eVuGKcjht8SK89Ko+TMjp3hRtsLZ
	pI00IUK0qUC4KFNekNnzkzUKMp7u7X6BDLCr/Baqvvu8gRCvDjd92uAWYSv/7pNGOyY=
X-Gm-Gg: ASbGncsXJEsTxzwtLlP/IggUq5WswpIgNSqgFxUofbtHTFkX122x2jgxJpzcxFQbfsE
	Ektsy1U+AeeDfUwqRU2hRqZ/G0yxiYerIWqhWHBuTSJkTqMkriY+LA9YWadhRMtVNjNp8Q0Z2h2
	oYKPl39crk0bVpAhUeqIh1x8yFYM/I6X5Lk6drCmklL1N4TpHIH42yeWLn7ksPP0BeDJYVI6Jyh
	M6IYD6loNe8JxYSgsZ5cdGHWZ9KVAxBC/QKxJTB3fljWQECtvou6ei+QMCmrA2XlBP94OyunlQn
	aBekwCVaGndkqXb02/ezR9w+lwltvMxhAt5KKRDBytcx6N2C8jnBrgzmHLZt/xaqgXu41nU8qlv
	OwdMI6nwij82OLhNtB1FpTScRKap4tFbwhV1Js5kns4ghFKjQVkNySbajMFQeK+YL+Ym0PAVFIo
	UcW6REwp8XdKM9IsIryE9GSB9csg73iO4kPy0Px+QRkA==
X-Google-Smtp-Source: AGHT+IEw4Q1mHxyV0GK0EF0R4D5Pe/ENQZYPBdBr/G/MCcXd/j+D5Ah/WQX+wudmSP9Pop/xn4L6Dg==
X-Received: by 2002:a5d:4482:0:b0:429:b21e:49c3 with SMTP id ffacd0b85a97d-42cb2221330mr1506316f8f.26.1763541945401;
        Wed, 19 Nov 2025 00:45:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm38132306f8f.26.2025.11.19.00.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:45:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 19 Nov 2025 09:45:40 +0100
Subject: [PATCH v7 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-topic-x1e80100-hdmi-v7-1-2bee0e66cc1b@linaro.org>
References: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
In-Reply-To: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4548;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Wwhv46WDe0N83GsQcFn0TZLW8DtrCuNOWijlSA0+FNo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpHYO2n8E2xlNYMqA/vWrlycejY8XU+ct7sH6PtbHN
 /QFQdl+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaR2DtgAKCRB33NvayMhJ0clkEA
 CJJ1xBSkwbhKBqobEnJeg2Ffxcs8KjAGRW6ahppQTQkOnVDD5ju3l/aJdhj3RFJT5OQQ4xSTKVrGr3
 5NstALKqjtkMw4CQIuZHBJZIB9uYQShPCY5koRh4dNTLzCZWm02VvGAYwiwB2Y8nYODf9iZYc48fUw
 0txVzBsPT66ICYsF5CdY67molSRvFPUO25LTyAeYBndWLc0LIipqTKY+Ktxe2lETgWrCdv2Qc3Am2F
 FlDeDDZ+q9gzdfvuDd0vb2UuCBlW+fs41+TZmTxEgUd7jWvlwZXtOV90isO158jCOm1bd+G++6MXmO
 GRLBMnTB85QzwobTo7WwdB2T/mPudYiF2CvPoV0fdQKkRiSuCoxOdpHpTRIqDVgXcvj2yhUCRY+x2h
 HWQXIlHLYoburfnA3anl2vtG+H9Q55qYr6+30HBPENQJJoR3+YFV7YIojyqyOk+TBvznUoW7hh5kjn
 9YcceGUb1F0Yu37ztPn65+Q4/Gob1pMdlcBGXM0R7ED6ohMjL5Bz5vVVM8qzkq8gKjsqGOfXEWMfrz
 0mS7tnEEWkn7E+CP9ouBZUKcQOcdGpNkVkEd200qB9FcLk/0rJugj+ps/74tWDVxoZp63ts7xR+RG8
 B7Scz44SzpLCCorqQpqNzdk/2Igjd1RpPBtWnxw2vKOUcwpkdqG+AxunFTnw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

The layout of the lanes was designed to be mapped and swapped
related to the USB-C Power Delivery negociation, so it supports
a finite set of mappings inherited by the USB-C Altmode layouts.

Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
connector, DP->HDMI bridge, USB3 A Connector, etc... without
an USB-C connector and no PD events.

Document the data-lanes on numbered port@0 out endpoints,
allowing us to document the lanes mapping to DisplayPort
and/or USB3 connectors/peripherals.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 69 +++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..e0ec45b96bf5 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -78,10 +78,77 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description: Output endpoint of the PHY
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: Display Port Output lanes of the PHY when used with static mapping,
+                         The entry index is the DP lanes index, and the number is the PHY
+                         signal in the order RX0, TX0, TX1, RX1.
+            unevaluatedProperties: false
+
+            properties:
+              # Static lane mappings are mutually exclusive with typec-mux/orientation-mux
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 2
+                maxItems: 4
+                oneOf:
+                  - items: # DisplayPort 1 lane, normal orientation
+                      - const: 3
+                  - items: # DisplayPort 1 lane, flipped orientation
+                      - const: 0
+                  - items: # DisplayPort 2 lanes, normal orientation
+                      - const: 3
+                      - const: 2
+                  - items: # DisplayPort 2 lanes, flipped orientation
+                      - const: 0
+                      - const: 1
+                  - items: # DisplayPort 4 lanes, normal orientation
+                      - const: 3
+                      - const: 2
+                      - const: 1
+                      - const: 0
+                  - items: # DisplayPort 4 lanes, flipped orientation
+                      - const: 0
+                      - const: 1
+                      - const: 2
+                      - const: 3
+            required:
+              - data-lanes
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: USB Output lanes of the PHY when used with static mapping.
+                         The entry index is the USB3 lane in the order TX then RX, and the
+                         number is the PHY signal in the order RX0, TX0, TX1, RX1.
+            unevaluatedProperties: false
+
+            properties:
+              # Static lane mappings are mutually exclusive with typec-mux/orientation-mux
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 2
+                oneOf:
+                  - items: # USB3, normal orientation
+                      - const: 1
+                      - const: 0
+                  - items: # USB3, flipped orientation
+                      - const: 2
+                      - const: 3
+
+            required:
+              - data-lanes
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port

-- 
2.34.1


