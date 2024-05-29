Return-Path: <linux-arm-msm+bounces-20947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE48D39B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7E5F1F25521
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5B01667EA;
	Wed, 29 May 2024 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFBLOhR/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BECE15AD86
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994029; cv=none; b=q+2JRgVHdQXPOOTtInHkLEVHnRsMDBCeLZ5BCiNJDIDxoz6v+txhA2ebzmaenfA/oquIoSIY72pHwQPU7ghs9qxDaHt78Qugog61sWdkLZTh9pKrvUm8a4H+/t4S8QxKIF4sAd1mDoR1Aevf13DMJ2kXerJ9+CGJoPL7JI+4w70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994029; c=relaxed/simple;
	bh=bPqr/tmpdzAZE+dapnS+SoTmYdokt2fvmiYpWrU8c/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JddlaGE5LW+ZzGyy9RnvlOPKz6DKxMWA2lH9cS55f56QfabiDAqwHl6jXv4UEG474TNw5TBOrj+RaoKhM8L80cQAtvme/sCl7LDjPe6I3Zfznya9cmhYClqybf3O6HaiSAZMjRrLxG78pbOrHiK7Xa/QSdFtNO4rNDw8WuIrooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFBLOhR/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e95a60454fso23917121fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994025; x=1717598825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iV1CplXnM0HmK3FY80YwCL19FmVn8mvSIiRF/iA5rfg=;
        b=BFBLOhR/Zij59156Hb1C7PKH2149oAMswdWUEcjc0racCxqO/C5UB97L2eG+TkxIvu
         a+xOVYpQ45cQl40HHi0VHGhz9MMN/ArQf2e1ygy6WDxdeUAD9sKT7DX/OVxu1BhnFhQw
         jAWVA3xGk1oU0FZ9WPo478cjVwFqaKxij5sO0MDSTOzh8XbME4usoNZiz80KmDogsSah
         XicK9x8VmGmfquyx5sugIxlnSdfrhGWWFNxqn7rx3UIDbzoZcfR2n9vnD/j01b9hqHqa
         A8CxrelfA738r9ZhEKp6GD3dttfhRGHeQYC9YPXdO3abVGqpAtV9uwWF2YjVwrmkZ45y
         BXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994025; x=1717598825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV1CplXnM0HmK3FY80YwCL19FmVn8mvSIiRF/iA5rfg=;
        b=iAAxWxqY+hsHK+4nNsfKunIUZy6G8oBCO6FE+aXKOyabmjYu8Uw9gtO/QSzAXZCQ/q
         xZTQFzHYy0Twgxtkfi+uCT+Qt3MEDU2dHa9zLhRVF708XkD1OtIvTyPhgS5r9Jme50Ol
         s8eN4Na2FaleX1kYfx/zxnQNNeDSlzKK3bC10JzELyEFbS1qYuSsMsOj3C9dNvMHrM3I
         hnAaWE39L8g3C3EgFNRlVg77BSstdI/esXP/4/8FLCbaDijdWH6QQeZTf6tqR9gUw86H
         kmL3J0cTeqBV1NnF23+FFOhrb6ghfTpNYNtBxY/V/vwy+bGWd3sSPmAZedSAJAyEGM15
         wLFA==
X-Gm-Message-State: AOJu0YxYRqC1sHvTD/ifRPwd3zV900pOlMQ2wRHK/vJlj1zggeinoEGQ
	UwW6FoZ0zUJjHwjIl3E8Nr4VKMiy79WgzBpToJKPNIpzRHs7CZK5i5iA95VfC/Q=
X-Google-Smtp-Source: AGHT+IF05m+ZUE7mbx5z1Xq+BF5EtX7fisErTuIdHuYqx4cdxnMDVqS7M4RMBOojxLK5Ef06ZJPODQ==
X-Received: by 2002:a2e:990a:0:b0:2da:b59c:a94b with SMTP id 38308e7fff4ca-2e95b1dbd90mr92946751fa.25.1716994024707;
        Wed, 29 May 2024 07:47:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:00 +0300
Subject: [PATCH v2 02/14] dt-bindings: clock: qcom,gcc: sort out
 power-domains support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-2-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=26891;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bPqr/tmpdzAZE+dapnS+SoTmYdokt2fvmiYpWrU8c/w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/kJtry00AUZn3s5bIVqNege8rWx9uZgCVYn
 JWhepWRF/OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5AAKCRCLPIo+Aiko
 1RqtB/96ZWeombh7DDgl1sv0r9qJDIecO/ukfzJe9xJIbh8qaK5Gxx1PBS9xmsFOPO2LZ/ZOGSD
 dLOyKpTVR2hNudWn1Bqg3dqoCxtSoq/Df+gYoGYl7yW/1J45M8YcqPZFL9Fh1QCl/lK1W74u6RH
 BPf57wEzcSOwDOxthPOYEXtLR8q5FQkGbkiIQ4/k7grdTs1qC7xZiv64oe8BojKEYdeK2XF6+q1
 3OGxSmkKonu5O1Q3gkoo6Vv/bHD2zsnYzhzeb0g9NLUvj8bJhwz3w/0aPIov1hY77piPegfXC+h
 lX9agy8RBy4vdcVVpz+wg1TZQ0sie0I1JFB6tPa3XdkCpv0f
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On some of Qualcomm platforms the Global Clock Controller (GCC) doesn't
provide power domains. Move requirement for the '#power-domain-cells'
out of the common qcom,gcc.yaml into individual schema files. For the
platforms that do not provide power-domains, explicitly forbid having
the '#power-domain-cells' property.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml  | 3 ++-
 Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml  | 3 ++-
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml  | 3 ++-
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml  | 3 ++-
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml  | 3 ++-
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml    | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml    | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,gcc.yaml          | 1 -
 Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml  | 3 ++-
 Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml  | 3 ++-
 Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml  | 3 ++-
 Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.yaml  | 1 +
 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml    | 1 +
 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml   | 1 +
 Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml | 1 +
 46 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 19211176ee0b..27df7e3e5bf3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -69,6 +69,8 @@ properties:
     const: 1
     deprecated: true
 
+  '#power-domain-cells': false
+
 required:
   - compatible
 
@@ -81,7 +83,6 @@ examples:
       reg = <0x00900000 0x4000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
-      #power-domain-cells = <1>;
 
       thermal-sensor {
         compatible = "qcom,msm8960-tsens";
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
index d84608269080..0a0a26d9beab 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
@@ -51,6 +51,7 @@ properties:
 
 required:
   - compatible
+  - '#power-domain-cells'
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
index fb3957d485f9..012048921f92 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
@@ -34,6 +34,8 @@ properties:
       - const: xo
       - const: sleep_clk
 
+  '#power-domain-cells': false
+
 required:
   - compatible
 
@@ -45,7 +47,6 @@ examples:
       compatible = "qcom,gcc-ipq4019";
       reg = <0x1800000 0x60000>;
       #clock-cells = <1>;
-      #power-domain-cells = <1>;
       #reset-cells = <1>;
       clocks = <&xo>, <&sleep_clk>;
       clock-names = "xo", "sleep_clk";
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
index af5d883cfdc8..4d2614d4f368 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
@@ -36,6 +36,8 @@ properties:
       - const: xo
       - const: sleep_clk
 
+  '#power-domain-cells': false
+
 required:
   - compatible
   - clocks
@@ -51,7 +53,6 @@ examples:
       clocks = <&xo>, <&sleep_clk>;
       clock-names = "xo", "sleep_clk";
       #clock-cells = <1>;
-      #power-domain-cells = <1>;
       #reset-cells = <1>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
index 93f3084b97c1..a71557395c01 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
@@ -46,6 +46,8 @@ properties:
     allOf:
       - $ref: /schemas/thermal/qcom-tsens.yaml#
 
+  '#power-domain-cells': false
+
 required:
   - compatible
   - clocks
@@ -65,7 +67,6 @@ examples:
       clock-names = "pxo", "cxo", "pll4";
       #clock-cells = <1>;
       #reset-cells = <1>;
-      #power-domain-cells = <1>;
 
       tsens: thermal-sensor {
         compatible = "qcom,ipq8064-tsens";
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
index 2d44ddc45aab..38b9e4283900 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -39,6 +39,7 @@ properties:
 
 required:
   - compatible
+  - '#power-domain-cells'
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index 1264f3d55761..d7da30b0e7ee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -27,6 +27,7 @@ properties:
 
 required:
   - compatible
+  - '#power-domain-cells'
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
index c9e985548621..e03b6d0acdb6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
@@ -34,6 +34,8 @@ properties:
       - const: pxo
       - const: cxo
 
+  '#power-domain-cells': false
+
 required:
   - compatible
 
@@ -47,7 +49,6 @@ examples:
       reg = <0x900000 0x4000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
-      #power-domain-cells = <1>;
       clocks = <&pxo_board>, <&cxo_board>;
       clock-names = "pxo", "cxo";
     };
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
index b91462587df5..ce1f5a60bd8c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
@@ -42,6 +42,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
index ad84c0f7680b..258b6b93deca 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
@@ -48,6 +48,7 @@ properties:
 
 required:
   - compatible
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index fe9fd4cb185f..fe1f5f3ed992 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -42,6 +42,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
index 1927aecc86bc..929fafc84c19 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
@@ -41,6 +41,7 @@ properties:
 
 required:
   - compatible
+  - '#power-domain-cells'
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
index 62d6f1fe1228..cd49704dcb95 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
@@ -49,6 +49,7 @@ required:
   - clocks
   - clock-names
   - vdd_gfx-supply
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
index 8f0f20c1442a..6b9c1d198b14 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
@@ -35,6 +35,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
index 97523cc1ecfb..013fd074a8d5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
@@ -50,6 +50,7 @@ properties:
 
 required:
   - compatible
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
index 58f7fb22c5c4..abae658c0ed9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
@@ -38,6 +38,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
index c9bec4656f6e..38c4c8c61b3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
@@ -33,6 +33,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
index 7bc6c57e4d11..94755465c1fb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
@@ -40,6 +40,7 @@ properties:
 
 required:
   - compatible
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
index 7aae21a76690..1847bbeaa9d1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
@@ -40,6 +40,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
index c4ca08d9ad5a..4e4f68b9f6d2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
@@ -51,6 +51,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
index a1085ef4fd05..b4784ecaf58d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
@@ -40,6 +40,7 @@ required:
   - clocks
   - clock-names
   - power-domains
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
index 5681e535fede..5cfde8a4de4e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
@@ -65,6 +65,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
index 52e7412aace5..724ce0491118 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
@@ -40,6 +40,7 @@ properties:
 
 required:
   - compatible
+  - '#power-domain-cells'
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index 0595da0e8a42..ef0a20456e8a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -35,6 +35,7 @@ properties:
 
 required:
   - compatible
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
index 428e954d7638..30819f3d85c6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
@@ -34,6 +34,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
index 523e18d7f150..915449228668 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
@@ -39,6 +39,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
index a5ad0a3da397..ecb69c707f09 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
@@ -33,6 +33,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
index 8e37623788bd..a5a29dc75ae1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
@@ -33,6 +33,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
index d1b26ab48eaf..2280b859b2ad 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
@@ -35,6 +35,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
index 58ccb7df847c..1dcf97c0c064 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
@@ -34,6 +34,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index 5d77c092be5b..979ff0a8bf68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -36,6 +36,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index b4fdde71ef18..594e87f5ba09 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -55,6 +55,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 75259f468d54..d848361beeb3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -49,6 +49,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index 788825105f24..513d6fd89249 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -35,7 +35,6 @@ required:
   - reg
   - '#clock-cells'
   - '#reset-cells'
-  - '#power-domain-cells'
 
 additionalProperties: true
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml
index ef84a0c95f7e..489d0fc5607c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml
@@ -33,6 +33,8 @@ properties:
       - description: UNIPHY RX clock source
       - description: UNIPHY TX clk source
 
+  '#power-domain-cells': false
+
 required:
   - compatible
   - clocks
@@ -58,6 +60,5 @@ examples:
                <&uniphy_tx_clk>;
       #clock-cells = <1>;
       #reset-cells = <1>;
-      #power-domain-cells = <1>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
index 718fe0625424..adc30d84fa8f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
@@ -30,6 +30,8 @@ properties:
       - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
       - description: USB PCIE wrapper pipe clock source
 
+  '#power-domain-cells': false
+
 required:
   - compatible
   - clocks
@@ -47,7 +49,6 @@ examples:
                <&pcie_2lane_phy_pipe_clk_x1>,
                <&usb_pcie_wrapper_pipe_clk>;
       #clock-cells = <1>;
-      #power-domain-cells = <1>;
       #reset-cells = <1>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
index 944a0ea79cd6..ec349e279480 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
@@ -33,6 +33,8 @@ properties:
       - description: PCIE30 PHY3 pipe clock source
       - description: USB3 PHY pipe clock source
 
+  '#power-domain-cells': false
+
 required:
   - compatible
   - clocks
@@ -57,6 +59,5 @@ examples:
                <&usb3phy_0_cc_pipe_clk>;
       #clock-cells = <1>;
       #reset-cells = <1>;
-      #power-domain-cells = <1>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
index d712b1a87e25..86befef02650 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
@@ -31,6 +31,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.yaml
index 0f641c235b13..addbd323fa6d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.yaml
@@ -46,6 +46,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
index 98921fa236b1..567182aba300 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
@@ -41,6 +41,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
index 5953c8d92436..0ac92d7871e1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
@@ -32,6 +32,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
index 295d4bb1a966..147b75a21508 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
@@ -31,6 +31,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
index 0eb76d9d51c4..4d7bbbf4ce8a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
@@ -30,6 +30,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index 0c706de31cf1..d83b64dcce4f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -34,6 +34,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index b54761cc8674..976f29cce809 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -35,6 +35,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
index 14a796dbf8bc..5951a60ab081 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
@@ -41,6 +41,7 @@ required:
   - compatible
   - clocks
   - power-domains
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#

-- 
2.39.2


