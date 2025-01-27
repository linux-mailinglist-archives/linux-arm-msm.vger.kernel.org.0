Return-Path: <linux-arm-msm+bounces-46262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF01A1D769
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CBA6165431
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49033205E1B;
	Mon, 27 Jan 2025 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="buoeUXe6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0F5205AB6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985719; cv=none; b=ZYLkyZTvLUI1zZMl4YS/4OxVFdUR5VzaVuucDwQtpfitTbM6CyEcj8ynPJcWssz6MQ0jjnKoESGnYUr7Sy9G1ymKRjscjoz/tk/3amW28RLiMCCzPoiCL17mXTGWcXBZjrcyGvpdvDfemTdeXb/xzkmC7iNcIURgp089o/kfPqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985719; c=relaxed/simple;
	bh=TZWn+bkA4sKfJBmjubcf0b04gWs2OCwTu1WFNr9cbI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvmhDxQ/J+VAmljCGTSrr7BTlUCQb0mfhj4D54bdeFNq2i6GGHo4X9Ol3pWtSXPWskZ1ATWgYdnx7krdpZt5ugvMjos/gnw1lLQtBiicRp+9yqvGBTs+02550pOE6Y0FgsaRqLUoHFwNaQisvjO7Zc3HYpn3n96meM3FUwnAiqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=buoeUXe6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so7279345e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985715; x=1738590515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJC2kYYOv6ZshO1xsuu53XITiI1GXSohd255ycEyB1E=;
        b=buoeUXe68limynUK5rL+0ik82oC5mjoOgXKbdLBWsBpdYKpsSxSDqmX4DjJDbx6rVL
         v2fnvKFtWXv7vmjNEr6ff7Wt1GKiHSACx7QeIymkbiPjbYAFhy04WaZHeXonJiRqihuk
         FWtamhDAut10enrQy80Wxs2r+vLc2cZ0eOo1kONcMLPl3X18BAnmpHqBqMOzwR1Sv8oe
         luNZzpg2sB9y4gG5ylUDEt9XsVhfapvyfaWxQlvlHwHeAoC4hZ51TmocHr9303aEoPdT
         g05bPHFeZT/+XvMcsrOhKINvh+v5MJ7G4K5/xIDn2Sgy27XpUNC7kG+NlL/+lvFh+YpW
         /zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985715; x=1738590515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJC2kYYOv6ZshO1xsuu53XITiI1GXSohd255ycEyB1E=;
        b=GX1Tl8DgNw5pJPFJ1eUYG3QkUHJLpPQqhWnRM0pWz+OQ5CTNFsiv/oirXec6XQ1q32
         Bcqd0VTm6h3YOJqIqVapUSDPBe6000ObxEv5D8Kh9HbBvhXZ2De3b47r4Mf8p2fCBiTB
         LEuMAOv2zNGIdm7Ly6EIBnn4g4PgEowqrLxk1osbH1pRg9M9eYAyS7wS5zejHpYw8GzU
         IBkdNVJFXsJTqz1jItL+mDo9kDs2gz4nFXRO1uFnFBy9jU8nEG+Pei/CE29TqbMuwxVW
         fxMk4dfZXfdwO3RGahOOraxyZ7PmqoYXOH0Ti7l6l66cD1DwTRilf6r60M8lzudPQqsd
         mTvQ==
X-Gm-Message-State: AOJu0YxRKWrigFbGZXsufP6T33gYDwBwSBgU3f5GQ75DC25Nne7MwmuB
	E81FYW3QbBCkkdEnpNcZweBUFBHJttoNyT6HP5udOWfqh1wfM7Q1JA+oGzkUnB8=
X-Gm-Gg: ASbGncsUMyuqINFSQkEa0QEakWjcX6V+k+WOXyWxykoczQTodH30cph/fBUKNOlaVAZ
	uZc1GUXFwucyG6dRC1CoHE4WlS1WV128kZdKK5SBCRWmGhWgVM+y0VpUHFyVnQaaGBMzsta3llm
	KEOiDU3nAH68DE4DeXmPcv6hZF6xca+4jP/qEcanVCUMqmAcvaYKXfzAyeB+L8k4XjkMPdQRzLs
	OnS4Gk36Cudth1sLdyumqbRGMFMB7FvffeLfTJNx9Z3MtdhFiJ6ZDgj2QafpMPj64yVk+5eCPi0
	dvdjUKDj+z5BYruS7CE=
X-Google-Smtp-Source: AGHT+IGV9U/ryY+IuCqgtrArEagPcJ12P7J2i2wOTS21Qzy1wp79fRu39odiyFWEyQhBYtJoWtCn5A==
X-Received: by 2002:a05:600c:1f10:b0:42c:baba:13cb with SMTP id 5b1f17b1804b1-438913bde31mr148681365e9.2.1737985715519;
        Mon, 27 Jan 2025 05:48:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:55 +0100
Subject: [PATCH 22/24] arm64: dts: qcom: sm8450: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-22-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2652;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TZWn+bkA4sKfJBmjubcf0b04gWs2OCwTu1WFNr9cbI4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46SfWrrwj09wB1bHNKEhlezCf9etsQY03TV3
 lKpUc3DSKGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOkgAKCRDBN2bmhouD
 14zuD/9oO5OaKY4JTePK0xMmOU01XfToGD8etGjW5CpC0fK06N58/7zDPKZj9xGrp5nYdhiK/Wd
 Q3UbjklHYkLaC2JRu81MQW4uLwKrEpQAz4AJh+gGiNKXcBhSl+pNGYw4V0+XIrSdi66yZ3UscQQ
 sahkQuO3JmZSWwVMk4tLv95iBzMbpLMmH/cgOPgA+r4uitMetchmqRibHg9ZzV9SWyaR+nKm9Ls
 zEhdm9Tj8FwyiGGUActNIenc1Irb9X0ZKap+L6RgYT6fYjFdoRT7c1z9SQmHKrE0B4Z86Vcu5uz
 Nzh5pILpwXZk4lLg66GRwBE3bVBSHfTbV41N4qIG9mUitmViUzwJPQLGKvU5X9+XKhgIUVB7AV8
 K1Yay4GEC11dBUSszUyfqKDS1cp0CIUN86FtTp/Nnj42x39OgBPjM/IdwSJIgGml/ReBQZm/jHW
 Pq6MQTce7NTgyQf1ZLWl9sEPEsHcLvbIVtpaql9f4VDMv07oa4DTgxRV453sGVvAzHLTG+X7X06
 HOPet8WBoP75zSH/vv0lQzrM7FE4nTVv1AWAu2mQCSgwfOynBX1H7QvFvVtcbJilZt1G6s5/yMq
 2mQy7/9FE9oemLniK8A0asX+z/XlZnwXU3zaV9hNb9Z5nRhdhX8mH+O96TXQVLuT/bLSCwpEZGX
 w+AEbLgBJq/ri7g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 9c809fc5fa45a98ff5441a0b6809931588897243..02ffbf129f2feab29998273e9e38669101e26f8c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8450-camcc.h>
@@ -3456,8 +3457,10 @@ mdss_dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
@@ -3548,8 +3551,10 @@ mdss_dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
@@ -3608,10 +3613,10 @@ dispcc: clock-controller@af00000 {
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>, /* dp1 */

-- 
2.43.0


