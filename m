Return-Path: <linux-arm-msm+bounces-15975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 365DD894606
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 22:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A13B1C21B60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 20:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575CB54F83;
	Mon,  1 Apr 2024 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sVsJfVyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87A1EB31
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712003628; cv=none; b=bJjFUc5C3oq3Dv5fd/++qhu5SzsBKphtXB3tY2bPgkEzsdXdNt5gr3Fy1IsUFLKkqSwBr56C6LKDbcQb6yM/kz6UPQoMnwBpMZTIa75567TDCjCvX5Odq3wC34CQ6xo+VMpaNNhLiO0aq1QJTcreMvYEyFQUgLslsLGOQTpJjas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712003628; c=relaxed/simple;
	bh=Pl/YNaCowSJwtvM5CLxzriI2N0LVr+hVT798TnH3gks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nf9ZpHgLwNLAj9WzrS3WRx69LIew/mXcEB9eg4nmxTreZx+8syNmpcHn9onwByx1owl2CLPUK5nCWGD24roL0ylX2/u2ckmmFs7Km3JKvUvd/R8kgxdNGSC9+h3oIfGY0gxFynXPb4reW4rxbN5tvzEGXQwVII9VxykLEROYxws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sVsJfVyb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-515b3077d09so4811161e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 13:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712003623; x=1712608423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGbtrKVvMS3wVGFki5Rf2NIaUlWzz6uY1OnrfScTkhE=;
        b=sVsJfVybnPY8cFeZSQPDs3wD+GHl6mgFcIBOoOAeo4tK8/p++ZH1TO3osA28iJ97R+
         +k1lYs8x0M4yK1v2x6BHNZL/eWwjfmor0z2vFW2vtdq7HdnCH0aefIUKVgiih8i7FI86
         Pf2rmMfXBhKD6hUWjsuuWqCFEgDDVKR9Yq7YmHfSwtJFIQvtDqq638e20oULsaxIFMZQ
         HbbnwnMVEHED/0AqvAaQ+ZmJFLvBNf3jSU+1lpDcXeuZBCuX3yxEsR4tt3AJZlGKeeWF
         NGPbIQYFcYCbqzwLZj8Yt9shQgzxy+dbSfGgAotcqnW6x3cBUqvj/v9b0WqfnasDFnps
         l1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712003623; x=1712608423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGbtrKVvMS3wVGFki5Rf2NIaUlWzz6uY1OnrfScTkhE=;
        b=osus+yskK3wR5KjphBIvJuG3wYr/YPWDCLSBZzVq4UONW05fFny0lmAZIO1IRHF2L1
         9cZo9Prc6to7WLnjZ1xDR09RjkGacpZOnD5NrUnK/g1Z2bEmvTPV6hc4K2PkGYHuWGAo
         BQbKOAZt34Gnr4IYgGJ08Hbj4ioVn7LxnmQ7mj0ZwrIf55cu9/Y6EGiB7G+h8iNnED+i
         zXKh4R5pjsLooLGQKdUav9+FI3QMdT3i8+2+VZWNNNcZc1H+u9lxtouTfzvdGqE8nh2m
         UqMKFvZOPWZ8qYp3F9PwBjaNuDmDJyiayvPlY5TQzFeLt+UL8TjIhP+i9txDSgSMrg0g
         amAQ==
X-Gm-Message-State: AOJu0YyTKQbXp3dhmHL5+BYAdMmPAz6uEZoZwwas83M5VynHt3Xgdza2
	TVBFiQBvw2VtRDL4uYP7zUVq9TTViRR0XG2nTDy22/ukoL60f2ZO8QpMWitcXnw=
X-Google-Smtp-Source: AGHT+IH2uNAjQtdLIV9R2AZUb19YWzpZ3xw4E10c1gpcShijDXsGOsTcbI0aDwYnvMhmg+49RAowJQ==
X-Received: by 2002:a19:f70a:0:b0:515:c7c9:b14e with SMTP id z10-20020a19f70a000000b00515c7c9b14emr8046627lfe.57.1712003623433;
        Mon, 01 Apr 2024 13:33:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j11-20020ac2550b000000b00515a6e4bdbdsm1478342lfk.250.2024.04.01.13.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 13:33:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 23:33:40 +0300
Subject: [PATCH v3 1/9] dt-bindings: clk: qcom,dispcc-sm8x50: describe
 additional DP clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-typec-fix-sm8250-v3-1-604dce3ad103@linaro.org>
References: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
In-Reply-To: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pl/YNaCowSJwtvM5CLxzriI2N0LVr+hVT798TnH3gks=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxq3lIqm7YesxMjpRxoP5kv2/Ug6lRzhmWB9y8BpTpPax
 PZkb81ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAExk+1kOhokG7wu+yt4UyJ59
 4E/w7Q8fEmbbFn6cHhv2ui3+1pnAz4HeHOalXCt2mao3Wz/8dGbfbWuL8CjldneFWb9U3+Q/FX6
 g9/WNysfIlPUvowRy8jyuZb+w+mLrIrfaoWD7h9jeSzfV3Y/8WiJYOEXC457qfk4bxT3HY3jdmy
 +K3hfnjJvz8UtppVz8n028KskRu/65L/xTbabI/dLI93IB75uH7y09JpRMVQpu0visnFuwVprrU
 UFko68i9yoxozMPNi843iCa3yVtpZL2+oGRDMf7wG9X2Bj8/ENFMm5IRf7/6KlyP7/BedF+ltLe
 W8UbX+6WFT9baTTz7fvGy+tNl+/6mscq9l2c+doZ1XnXAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the affected Qualcomm platforms the display clock controller has
additional DP input clocks, describe them in DT schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,dispcc-sm8x50.yaml         | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 59cc88a52f6b..5831579b572e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,sm8350-dispcc
 
   clocks:
+    minItems: 7
     items:
       - description: Board XO source
       - description: Byte clock from DSI PHY0
@@ -35,8 +36,15 @@ properties:
       - description: Pixel clock from DSI PHY1
       - description: Link clock from DP PHY
       - description: VCO DIV clock from DP PHY
+      - description: Link clock from eDP PHY
+      - description: VCO DIV clock from eDP PHY
+      - description: Link clock from DP1 PHY
+      - description: VCO DIV clock from DP1 PHY
+      - description: Link clock from DP2 PHY
+      - description: VCO DIV clock from DP2 PHY
 
   clock-names:
+    minItems: 7
     items:
       - const: bi_tcxo
       - const: dsi0_phy_pll_out_byteclk
@@ -45,6 +53,12 @@ properties:
       - const: dsi1_phy_pll_out_dsiclk
       - const: dp_phy_pll_link_clk
       - const: dp_phy_pll_vco_div_clk
+      - const: edp_phy_pll_link_clk
+      - const: edp_phy_pll_vco_div_clk
+      - const: dptx1_phy_pll_link_clk
+      - const: dptx1_phy_pll_vco_div_clk
+      - const: dptx2_phy_pll_link_clk
+      - const: dptx2_phy_pll_vco_div_clk
 
   '#clock-cells':
     const: 1
@@ -68,6 +82,20 @@ properties:
       A phandle to an OPP node describing required MMCX performance point.
     maxItems: 1
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: qcom,sc8180x-dispcc
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          maxItems: 7
+
 required:
   - compatible
   - reg

-- 
2.39.2


