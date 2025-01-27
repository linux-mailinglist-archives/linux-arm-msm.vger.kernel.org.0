Return-Path: <linux-arm-msm+bounces-46248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C157BA1D738
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DA111637C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C52E202C46;
	Mon, 27 Jan 2025 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ju/LvIK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2129720124F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985701; cv=none; b=gEq2LekqAZsx5F3FfAtLH8XdEAo3HmJKWPeWranZ5Pf6drQldld9tEb7ek1R6hag/nTgkSJvxN15urYlRBrXv61fXWiIQ7hvKF+H6Hc73lrvm0en+k5DeNodQD4xrZabaWzplEnX7gMc73PnmVpvOmpX2j18cTo18Yh61exY5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985701; c=relaxed/simple;
	bh=mGmkiRUox02m1ce9g+fXSI9Okfurl5mcDze0ywnCPTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fDyiqSpHCBQpP3tmm8oSQICIGypglCOg17tfM4dGhjYk+/QZwafHC5f44MCdtUwtsjkZMRkuVjQlXAzwI0hUgG+38PSGdsdYkXn1WgnCRwJK5uhgpdGz8MBWwfU1T/n55bY1352gc1l9WZrUYYUFJUOlIegazVewE867bbEbEik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ju/LvIK2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso3932265e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985697; x=1738590497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsYdqxLem48YZjot1iomOsSqvGDW5MiQT4ANEtmq13Q=;
        b=ju/LvIK2MREw545RJiVWEqo/OTp/JNn03KcsdADbqgTPKFV7hL+BDKTfPBnz2MZ67V
         CXGyx3zEZiMBUrt8pgb+KaSCzm8y8TLTjRAKseFL95uRVzKgNKUuFr2m/c5L/z0bPzbG
         yG0B4xi/KJQLW5vHiBNdPCakdCSJ0/IMhBRB/bwDgdfZDH/vJOQlxY38ZW/iQKMyqg1W
         0pf8/6nG+HJPi5zERKXoGI2axsrqJiZdhtLfOvvM5RsbwpwsfxQW5ThSyEyZ0ApgFSl0
         5nrYXsq/B5DrFz5QnVEHQScKk2KQpPtvikm8dnxRdE13/8QHOmstiHmGi8VO1TKGizHL
         K1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985697; x=1738590497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsYdqxLem48YZjot1iomOsSqvGDW5MiQT4ANEtmq13Q=;
        b=JskH6NkyWB0hL2L/3GFalKu37X+2klqvGtphYkJPd+YGikv45jnoZL0lZtbTXIc+As
         f689hdLPLIdhwp3irs5Y8ORwDFL9bzyStfp3myZ83NItRs94bsACvCnb+G4gZcSycadI
         /9QQFWkgo9Yq+GQyQhZU8j4pTuc4Arg3tnaKeBq2HpMm1DB3x2/xO8zg3Epu69nQp/Zu
         JTDhs7WcIAb7Eev5tiHWj05wLjBLrZkspb/HoyQ3U6wfhYaT/VmC8gnpA8sOTNuklCOe
         7Sp5PF3tbHLnh+AB2X33wG9z5BBFvVeKusBDU+GDgWBivTeLyxTQ6KI14hxBwqGMLu6Z
         LKeg==
X-Gm-Message-State: AOJu0YzZmo/jeu37bxh814lCqwSYp0oq0dQH00Qd9SPV3KMEKv5Dgqpn
	Q3EQctXOuomCXvVwPErro7OB78T2+kynnK23ZRGVcuDDtgYloArN6D1z0rjmHR0=
X-Gm-Gg: ASbGncs7vr0Hz1rwho8KPeStZquIeb9FzaU7WYQV/L8TKdXmwLJwEjGG/Btx5XRcEsX
	JQIyzhUf5vvxK9w7udwCjNYmKVO2MHuFbm1w1qY1FErjtP1FG6cWXd3oKqfsbFBdKnuQ80045z3
	UwraVyq4ZIlsbbibo+UNmsv4MralWhJJAaLgYOtQ/2DgzzR/z5H4osfOEjRyYeFFW1fgjWU/PPU
	cx7qA63XYiKYkvgfjkhQ74nfakopXwbxqArhv8Htlr66gypWBWtVWgOZ1MUOnvMCPwGNUmZSK5i
	rz2y9eCB6Hhw8ajhTu0=
X-Google-Smtp-Source: AGHT+IGWhtd26JfvnoMF16YXOkVI5YDOFjYutMZkrc7n5pifAjjVTYCTn6T5NLO3rpuXEYUWsS/Dig==
X-Received: by 2002:a05:600c:5486:b0:434:f335:aa0d with SMTP id 5b1f17b1804b1-438913c7b31mr150024535e9.2.1737985697489;
        Mon, 27 Jan 2025 05:48:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:41 +0100
Subject: [PATCH 08/24] arm64: dts: qcom: msm8996: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-8-9d8ddbcb1c7f@linaro.org>
References: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
In-Reply-To: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mGmkiRUox02m1ce9g+fXSI9Okfurl5mcDze0ywnCPTA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46GTwW3fkZ3DvRZsI1kkXZlbt+DCoLpMB+4y
 XRo09ycjEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOhgAKCRDBN2bmhouD
 15CzD/9LFeiQ+bU/RuM3QMVlbdvDAnDcFyHX9WvpMdrfsAbKU9d3eFjVWSAGNwzCfHrIc30OPPp
 RNHzZp/AJvEITda/EEMlK4sYWoNtFVozszvM2xcxZDIc+eaQP19tpfLuLi3jP8CjUE/At/8g8DM
 FhadCgItWKt3a17fSMZHDNzGwUCcrIpEuWOicGtAVavyP7ovDyvFXVQRaTOXcJ7cTKGTF5eUl9l
 l/i0LW0w5siQ+YZgPUeFi66/n/4DXnt0/Gc6T7csd9e40wcOp7PNFpiYoBSr0KavkAY5LD28UCl
 pj8WpTim4GC6pEtx0SoMVamBGaX/W4d6ILEZcLvBBzyP6KTAyaP9/Jr339cPRX2dM/GOXYEvEfh
 BWx/LS9M0KJxvZG5tgc7tOglGXaJM3SHfM7xvhaC+h+x5yfaOh52E+fGNj/pa0BPCgh1jEnpVyj
 1LeVqZ1BihNpbCAW5Q1BVtgZoPlE7hUR3mxJe9kv2ci8NYaHktsIlVtCd/LwUP6e4x86wxCB3mD
 /Nw+rbzIL6+35P8XVbSEVHvZOlNDMZQ0MltctxFqsP5seHGOvg5ewKSwCB2HP9V171aZ4SpstV6
 Kvsmk23tib5XKtZpaOBMEZLJ3Uq5xU5hAK/Y0mu7hwSEhTzki928fqUTKe+/8KmTeCumY5u1bQJ
 WG+eirzkPRCUk3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4719e1fc70d2cb15a6a63d3e28622ae078a367ef..ede851fbf628428f5740ca8add65ffc05360cc62 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8996.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -937,10 +938,10 @@ mmcc: clock-controller@8c0000 {
 			clocks = <&xo_board>,
 				 <&gcc GPLL0>,
 				 <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi1_phy 1>,
-				 <&mdss_dsi1_phy 0>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
 				 <&mdss_hdmi_phy>;
 			clock-names = "xo",
 				      "gpll0",
@@ -1071,8 +1072,10 @@ mdss_dsi0: dsi@994000 {
 					      "core_mmss",
 					      "pixel",
 					      "core";
-				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
+						  <&mmcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi0_phy>;
 				status = "disabled";
@@ -1139,8 +1142,10 @@ mdss_dsi1: dsi@996000 {
 					      "core_mmss",
 					      "pixel",
 					      "core";
-				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+				assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
+						  <&mmcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi1_phy>;
 				status = "disabled";

-- 
2.43.0


