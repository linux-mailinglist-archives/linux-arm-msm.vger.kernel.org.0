Return-Path: <linux-arm-msm+bounces-53502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22131A7F9E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7A86174ABA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA151269AF2;
	Tue,  8 Apr 2025 09:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgkcWH80"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263B266B59
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104790; cv=none; b=CucVkpVxJqxRdbT6B6X/8E2LZ4NcSPDZSMVc0WeNHW4IoTFyv1fjAYNbgdu+Gv/hfT3NWgV3utRSIOC7ZgWqiHkaXp6XN4k+Ir+oBSnKsughwqxk5fYE9lx8iLDbv9FHXj9O0tluG63wJwMwF0GhKk472ripsPqQwAJh5Me8ra4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104790; c=relaxed/simple;
	bh=ugLpRJRdk7cDWz8R72pGsFHS9vPwfXUk7nvd0BavrPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VgrU+AYVCcXm0ByeM0IRvyeNtzC7s/4eR54WmzZHWfpqovU85ohdm+iExB7VnQuzTwqi+8gJbpY6c9G4Rb/ThfWQ6PMFvCV5bcIw5OSNXH/xguLJyJ1VOq00UR3BDCqQ8B3TSwjrwE3PZQxz+yu0J4OUHbV60lEsnHTuWXkfuOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgkcWH80; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf861f936so5231455e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104787; x=1744709587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVgHl0wPF6wZgaYxStYLFo/u9tpBoOB48+g/MMT1aZU=;
        b=xgkcWH80ZfIdDInylFgD4djeiBtmxJ/zr7B9z5mdIFrQBtBhHif5fOs/GJSBnhBC5y
         o+I7283NTylGtkEIFeqDZe6XTB/Is/S/x+P87F8jOtOhIGGUadHrMMB9wKcszayGXd29
         tjF+7nFniEmvql1zCDpv2mhRHZ70GOeXsy7LXlEFcAIvuZC3/8F3RENFpPSE86SZ0Nxz
         R52lkjlcFjiOXVro8u5ss+RP1fd+oMe0Cw1wJwlDh0Oz3ok1vCYUwVei45+54vBmUedM
         rXjQq8wWtovSdCmmiEFOecPtighpFcuP7vI0BTRAoxt5w8aqXEXk4SdGVVNlorYupDij
         uezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104787; x=1744709587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVgHl0wPF6wZgaYxStYLFo/u9tpBoOB48+g/MMT1aZU=;
        b=kYpgabrfksKEXZuKlBuqbUa2OQ0DMx4YtIBcoL6BMSPq5IuQdODVweklQ6y175MYPd
         YYhc0ULoEI/lejfN0gJnTQmookq6ZwXuL9grIFqoLtoz2PWF5wXp7rAacSTrGcryM6/7
         7vgyC+ow0AlG7zQ/mrnvrfiNaaG9OBYF7Qjf2wpo5i/oywGctxnfWW3l4dKH0jpagjzh
         vaXvw3AltRWGVHsbY9aODAWcXQMZgsVE7OnhBodfxgv5O/dx/s3g+WDDPGQwwCHXfHsw
         RNh7Nn7u1uRf/AaHUlgPkzHEf/AvQexSHOf8aO3mT+lSihWTvz9TrTgOfqjyRn8mkGK6
         9hIg==
X-Gm-Message-State: AOJu0YwtU3CElfXuZxmxIR6gGs4RDy3Lmblv1GocoC/cyFfYqW1Wlyo7
	xnTkU7LHeb3n5epQpkZmbncRYsjaN6HyHOde3h7h3CEb4KtsMqr+BIm2c2RDDaE=
X-Gm-Gg: ASbGncstkI3BVNBzoZLJkj2QpcITFxALmbwHjM52neEvYQLDQ/d7WagMmPSS54Y9UPc
	ZA7qga0+H3YB+kPegJoUQqAkyNn7RZS2VWxCn2jQOaHF0ry86qkkpzMvsSDva7A0FPb/YznPA+P
	p+NhBQJ9St4Hwi+p/4vRd2Q4oQlfMq1AojuW0fv11NQ6EGg1kVbgNvrBAkq/myArJNpwWrP8KTM
	3vXyoFCp7smDDw6zzYO78h7Dpyn5GYXx5YL7rY3wPFGTBgsGKZNqxAWUtWttnpWLqkaJOkBcITF
	yE4w+qD3asMJ+DpBRNWuo5+yiX4bRRqKnHw3ZgK6ji9Tii1x15z5HJKLhxHIDbk=
X-Google-Smtp-Source: AGHT+IEHB2SdVgs2u9Sqr5VxgjF95MMdoKTM6l6GeAz4+UOVU+sZKZjLqQCT4y76weGe/rboJOgSew==
X-Received: by 2002:a05:600c:35c2:b0:43b:cd07:92fb with SMTP id 5b1f17b1804b1-43ecfa43d05mr49322645e9.6.1744104787265;
        Tue, 08 Apr 2025 02:33:07 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:33:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:19 +0200
Subject: [PATCH v2 22/24] arm64: dts: qcom: sm8450: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-22-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ugLpRJRdk7cDWz8R72pGsFHS9vPwfXUk7nvd0BavrPo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0pVNe6yC1do4qOq/ey+5fmHAqNQ4xjlMFi8
 C5K+iIGgOaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtKQAKCRDBN2bmhouD
 10IwD/9aS5ZPEYT4ouqg1A25TtpCnEOb4r2j3AD1ro8m7it1BWSE7tKokTB2VrY9YRcItdnzD5H
 MuIYrr9LJpkhyHLvJ6Gy57TzkF6Sx1+jPMgH1MHasmE7aN+AQMTMjXQaYy4QiIkxqNg40hP82vG
 XjLBWmjcUY7p8qVbXeevUUhY7+wcrZYJaB7gz3zeg9j+cxQdYrGX52py4XB/uyLoAeQ36x3xIWu
 8dWh7BBQaVx+Tw2KaQp5shpz44nKMuIdUjLtx+a7kgzQceief5mhL9GxyCZcPsVXF1LPp3ploZH
 u4RgNeeMg9unsTmmg5dfHcRRuESqN0mVAsaVQiKbM16TnikgmcDOx7FKh3PPKN7w9g0iwEAtQie
 qWZuKXpFZPORzhOGDaQMxRZt6HMLl0RoPDkNij/MSMD9YlTtnA9Y0hF0aD4aPkZqDS4JPwOtUly
 jq86pveZmWzVcXfLHNhRFLrOIwhE1SSRp/Ll84hicr9A0ce9+zdNkkfvthflqglcJ8W3JEB/BBl
 U2gLwHYPn70KnvFZUS+Gcny407yoWApEu90/1rT732NrMN57SJnbCRoAlTHGgu6g6JQmD0paE85
 0Y3+jIBa50XJV7OaeJel4krHlZ0OsDwxTfj+o2tAT7Rk37kuMufcSIrNWR55ZYoIPjSiBAilEZ8
 6KyQORvbFHvFd0Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 0b36f4cd4497ecffe0a15cd6102e9d9ac62a7425..edfde85a2d0c7d6ed572e8e5363e348a516cc45d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8450-camcc.h>
@@ -3518,8 +3519,10 @@ mdss_dsi0: dsi@ae94000 {
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
@@ -3610,8 +3613,10 @@ mdss_dsi1: dsi@ae96000 {
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
@@ -3670,10 +3675,10 @@ dispcc: clock-controller@af00000 {
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
2.45.2


