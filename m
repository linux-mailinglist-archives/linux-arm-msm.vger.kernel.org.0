Return-Path: <linux-arm-msm+bounces-21717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 266588FC58E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A48141F22319
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E5B4964D;
	Wed,  5 Jun 2024 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/9rbLuO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A6A3DAC04
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575014; cv=none; b=IzHpwtW3ssozfGK1jtcLDXzhTfrmWmpQmlAN2TTq3ErsrxwmhJJT6DttXv1MTgoyrzoQXnI/Q2Ailu7yYTDNE6PjjSK2b95wdkkPIYI807tnHjODxD3LYFxxzFVTHHOfVCAvr79yWzO4hp1RUe4kwzHutKnqnc5/CoLovg9snog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575014; c=relaxed/simple;
	bh=AGTfLar4oAV2Ne0OClxPkNjzZiHlRjlP4j1hOqGkZKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFbLAcBYGxkufd+G5368GIT1on91/POoto/MHWPzTb1YTPVcLr6ecQK9gxzEJ5W1D4BGqjaG/isN6pM5Y8v0sxYLRg11jpwJMRDb6/I1SyL9c0jeCwCcu2oIa0/Ima7cbu26bFahHMaZK3mErcFlMZCOYa5BIlqAl2mZhGeoMbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/9rbLuO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4214f52b810so19550665e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575011; x=1718179811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvHPBMJYc3fSihEtaYPXW49OF8VK3ATZHtgBNQtQ15w=;
        b=h/9rbLuOb0QoUD0yZKXbJjgB9EW7/uwyl49IrgXi85Zp+s1QWycO5svBdX6cNMi4Ls
         l8XElrZpfHBzXztAcMsyxPUo5rxtXa3wXp/nHzE2pVbi5MEMiD52lZA/zxMO1Axz7JmK
         HA+Qb6Aj229Y0mcy0wNs9e82xqX0MuDG0KYmRWD8hZhNO+SWOKNhPkZ6Sm2CvNJtD3Lx
         6bmUAv7CZsTcnazdBB/YFyq2M5gbkS7zu0bmkZzzZBolzaiKz87Yu+Ud7IXejKR6uuXw
         KI8TDCYrDnMwWsyVWSPtRil0eW23Jg6UFKd8dp8YrAQlXzsbn/49muT3gDJQ67cUc6xi
         iR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575011; x=1718179811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvHPBMJYc3fSihEtaYPXW49OF8VK3ATZHtgBNQtQ15w=;
        b=p8LjfuWED0cohTgPqkw2TPezLPgxzhJoy+8hVZvF1TBvdLNamqDcXmofxHGP22qy8R
         P+Ql5GzisXFCymTapAe/IMKbT94uPcLrlD+VHORLOW7bqs+RHK+sd5/p8dajXBBDWN+Y
         Ljdbn1ZRJBorJ3LXMjFMb4I5/QFe+aa0ac8wdXdW6zNmUQfI6aD4JPF6mmrqZTT+rN24
         8Z0Lm+joUBUysW7uMeG9dX7lCNhQEJDufISSh94aelW2Uv5e6q7bE6K6u6slvLZV1AgW
         e51yR3cOqbH0UyUhKuLrxMDEf3bYT18+NA7lXf5X2iCe+v00s2R47UT/I0JlON9bzp87
         90ag==
X-Gm-Message-State: AOJu0YyVgyH1mNQLuIIwc2MlcR9vWZu5C+z0kg4WztsRDRNWR+NHN5qV
	rf0r2hl4Z4Usa3YEBC493EfG0FYhmBIHiruaf++tmAy1vdjYKfNNAu+wAZO5xhQ=
X-Google-Smtp-Source: AGHT+IF52TKlmcLZb1jI34lj4vch/X1phj2qFkMp9zKadj9G5LDX3cpc6f5B/x/CyYjzg27/+G8rdg==
X-Received: by 2002:a05:600c:3c9f:b0:41c:2313:da8d with SMTP id 5b1f17b1804b1-42156260335mr18104885e9.0.1717575011315;
        Wed, 05 Jun 2024 01:10:11 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:34 +0200
Subject: [PATCH v2 07/16] dt-bindings: clock: qcom,gpucc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-7-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1440;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AGTfLar4oAV2Ne0OClxPkNjzZiHlRjlP4j1hOqGkZKI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1OfuEsIG6eA8G5fmbwPB0xsKwZwW3Vsaz+j
 2s4aOI2tf+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdTgAKCRDBN2bmhouD
 18kPD/9uQkW4P/8VRumFM4q5lvK/0WpoQd8q1YalXDa2yMFQxC27lDTJTIVf+Eh2bhUjFxq+lGM
 9j53XYM7S4AiSpsZKBnyt1GrIRCXTh7rbmYPnWzArs/lFues51K4kHUuU+Q6OyWDO7BPkvxpPDc
 a0gx+9aCxn22d0RqVAoIzOShILGXXVD6t3tfyC5dv48pw62QsYYKt2TxdSvu8kO4MqncdoA0nGB
 QVbWLmN3XggZC8gBtJRm1EQFhtb/8HWxu7WEF+pdl/YqJbB7+pkgDLQ8VosFszGF5VqyZvIRWwV
 fBcmHpUNdou+VhjknITd+YYDLZTZz4VW8Df2g1PiuSdW96/fT5U2AftsWzPEWmcazT+rv0Kyrb5
 4a486MikTvz9gGQhL+dYcVWPKLmAEUvlEOxzRDmODnxOoG2ej951nBfzWW+/NgbEQVvHjeowSoU
 G4VNFF7jQnxbqmCLrXwNDhJuydkT6mgI3TnQB0UhSnc0Olccx7Yz+ch+UJ2amph6QF3XPxbr/TU
 bs/Owm/DLmVvkwIPV/WobrJTqp2AgWUwyH2pyF9sF2t3nMXGn9DzxXu+L0X3rleGImXhgcCqLt9
 EK+w7ylOnI+l0sTqsq7FsopQRdreNJIoR4FxSr/gxD77pFBMZ+2NucMdOJbc+uuIYmDbpUgGrb9
 ij3Sj7fX6ODRCYA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml        | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index f57aceddac6b..0858fd635282 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -56,25 +56,10 @@ properties:
   vdd-gfx-supply:
     description: Regulator supply for the VDD_GFX pads
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
 # Require that power-domains and vdd-gfx-supply are not both present
@@ -83,7 +68,10 @@ not:
     - power-domains
     - vdd-gfx-supply
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


