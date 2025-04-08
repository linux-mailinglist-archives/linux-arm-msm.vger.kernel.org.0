Return-Path: <linux-arm-msm+bounces-53492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF3BA7F9CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C66317470F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1925A267F79;
	Tue,  8 Apr 2025 09:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkuSyAWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A61B267F58
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104773; cv=none; b=EBokraAp687/rlVEUZ2KHYT91qCTvsrF4Op5vGuUgtU6tsIaqWBZPjCDPDSHPAHkYVvpnBMYVjSQoyGe03nD/vOomiu/KrGqa5lGuiFuJLOtgScSLnZCqujlC7Xkhm1s+DxYb9FT2HGH2LesaZCGkRSJgISKSzolgJEoud1CiX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104773; c=relaxed/simple;
	bh=wrALnxrPHUXPgAdAIi61FIS6cjVsAHrdY0OAJGvKs+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoeTCEYjXmrLqrUa+J8oXiS1+zZLf3BslmXTDkUaiZJxtnoOR1q3f0CEvxwgkAO25IyZdjLDuVtJvd8PeaAx3RxEbkKme7HQRlWsIzDUlMoD3cMvqFnitp5hjrepIXBHzVp5nVgry0TjlQZiF5OrKowkZYog/C0bo//LQW8TQl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkuSyAWA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43f106a3591so838695e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104769; x=1744709569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxO5+JoEiCzlmQhedz8IDum/Hr0w5nRBROvtuW53UYU=;
        b=NkuSyAWAE6nSagkDHFe9zvRzaLKawRqKlC/GqulydQgP/wz2y0C/zWrmGGE+slcvdB
         Laf5U89U8zPc867ketdjoDZwcL6TdL2IiNCHst3IZcfpsDRtRGcXDdTrvoJbK/J4c27E
         9jzR9LjOjkVFQoDF56hbo7/QmNd0GdqnBwWiWiqrz5C89fPVS+fDF1mwDlT3YKzrnrCw
         ZcCOvNfFjvtgyP6qX0NYrUeAJKgz7Dc5ZyizV8m5iuRDRxkTCqv5sPVMv1f1xh7x3k1z
         e2b70tOEOFhu2MRUsP0ZWdhxMQPzr4o+xLOsudPtCnQuY7/C8HcS+rU8GiTTmwiZdkap
         1wTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104769; x=1744709569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxO5+JoEiCzlmQhedz8IDum/Hr0w5nRBROvtuW53UYU=;
        b=X60XSWjqGrMj+dI6lmAZT8IFt0nG5+a1wubvXd8Ael0PlcqxcfMWMPihz52sVOJiMo
         QTjFfGIJsdmc0j6vylcl/akn+HJ8+Ct0VE6UkiX0C1nP5IBLvSnzfcNebk4C+EwPozP5
         GPpnL9wGyrnEuAhlIgJjRVf/zWKjOauPfmltz5DfQiqngvD3tkIGTdzndosGtzryQ3jU
         pb0CXVa+PS6+EGw3UxK5BGQiqml9gCm2JQ35IIaIgJAkOMYmUxGQJ0WOd46UiE+rTR3N
         5wyrw6T3h9RU6YUAHigpK4cPfXgBGLThuklUX4yEVtWnypX5+8fSNntHx3SADFL9yWe9
         vxfw==
X-Gm-Message-State: AOJu0YwJrUKPJnfCoV0jTtO+Fra8hpVccEAcUqMd6J7vDSnmx5XHvSxr
	wTDyRcJP2Rd4ePrZz7anS4RGTnta9QL6ktFmcaLBw5kOvz/xpDmKTx0FWSNc6xo=
X-Gm-Gg: ASbGncuykP1pWMb1Zq9p8/hi8J37ROkHSAlY7B4lv2cX+lnc+UVn4vG0taWrazh1nEq
	vs6X3q4aN8WuKhxE5SnuXKyXIuMRZt2drtNklZV+mEGke6+cDawB0psxESGqgFPkiruIKxQ6ONV
	b6Z+bzA2FYVikS5JqJyEp1K6DUk0XPl0O//ki/EQwS3rj06mll6qWVHLzQ4mB1sRxJ7nY8Sah6t
	JMFDekh7iarJmFlHkObqbNq7f80Ji0M0rvbao/dgRxsCTJo33ItxEXVdTEE7kdWwCrMdp/QKG1x
	DWlIWkZwGgyPXSsoZf6uqFgaubohlRUQdYvytrP9Th2HUUh188JOb42d2U1ZDG7ls9cEZ7kXCQ=
	=
X-Google-Smtp-Source: AGHT+IEhqJRPG6jiXOM4M7EtymJybaJJaVAr0n8j1sg1vCzP02cienEQR993Mp8jqHgEpk251RiiMw==
X-Received: by 2002:a05:600c:8488:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-43ecfa05efcmr52827275e9.7.1744104769614;
        Tue, 08 Apr 2025 02:32:49 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:09 +0200
Subject: [PATCH v2 12/24] arm64: dts: qcom: sc8180x: Use the header with
 DSI phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-12-73b482a6dd02@linaro.org>
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wrALnxrPHUXPgAdAIi61FIS6cjVsAHrdY0OAJGvKs+M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0gCno9j3rBs6lVgvbMvXZl47cJ3JVVya8fm
 N+o1EoSU82JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtIAAKCRDBN2bmhouD
 17O4EACYJ6gNVD+8NUzbFnv+DaCuI3AxBbsSAaFusRUDf1sgrf+vZ6XV/7Ai/XMf7h6+y+0ax1m
 EaNuN7ijLoeQVPkWietQeBLL45UQKwZnjcd7qH5Gha3IjaDrTXuui/mkMWSUisKz9eqQDhwsKiT
 eAopAH18+Z9O3FKlIbN5zhgt/+zl4I8yLKontztD5QYhzPmROvsimJdkQSgdnKEi7r5gDuVA3Y0
 P8KifghGDBNNeOjIuW3SM+k2Qe9/ZhylcBILt56otfZMrY5TBgRh6OeaO988k7tqs6vO/Db+z2s
 J7KKPRbFB8hIbuE0R4j9AfDzCJWoEBnzrlp/WDzpwGnnTnl0F6IDWZloR1WbC4DzooFvr6QHnrV
 cbQaLtkuDI6AcvQuCPLOgJMd6mbWMWDAYRC+SlE3I2XD1OHYMLC3Kk9hmN/f2W1w4x2PsMRXjBF
 Zm43Oi4vGImC+fHhZqNJFQuNjP0AUteDatirsBGpMTBWMOZJVXKaiQam1Z46I+/uKdwmyKy4S24
 L62e9ZvaOCKsO+6bY7ZNw5lZsIjdqECuPNXS3fnP1Ce7b4P5GgA/dXroTxm542Zm2/HE222pa24
 VrtbRfqDh6HRyDQ3GZT+9y10aYO1swiISvy8cEMl/JiqmKlBPgF2TbDsPPtMj3p2vF5tKh4+Dup
 wgIiGe2WIPKN0mw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f142eb63b8d7f443a8df2334cf3c205353762893..30b8a666561d7b56009db988fb70bbac402a934f 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -3465,10 +3466,10 @@ dispcc: clock-controller@af00000 {
 			compatible = "qcom,sc8180x-dispcc";
 			reg = <0 0x0af00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <&edp_phy 0>,

-- 
2.45.2


