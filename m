Return-Path: <linux-arm-msm+bounces-53494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B507A7F9E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75DEA3B9732
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D604268C4F;
	Tue,  8 Apr 2025 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IjEyLi0u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF79A268683
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104778; cv=none; b=SOZFmrdQSRrBPOwdE08V6Bjz1ZW97yzLT34ks2JJ87aq6A6m01n5IwenlrcH54qEWO1Ics7DKhuwqD8aTp2gi8MfSRtTo7crDmKwLu8SkkE8UHfLxoTJq6U0hqu7oTpZchlZTxwHLVlYFjVc5yuPsNTFPexweM6f3RsHR+EE/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104778; c=relaxed/simple;
	bh=fZFbC8k6T5MU+Ow44u3JsSjxzpu0DWJ4yHdQYHPjNAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+DcRoJU5svflCZuguVzD5cM3Q4eDqR0XoXaM5J86hYputBxdTriM4Dtwk1y+YFAc0VKXQAU9rpzmzue0qwA1wqeqzYmGwEBAfbfEsXLwDU3+lRPW6ZCg8PWOYHrGtCmgG9aOGfro7Lp3aj60w+HD347ERNDs3FJfkoWRYT47T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IjEyLi0u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf861f936so5231155e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104774; x=1744709574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QklIp3gQyq6pxiDQB72pDv+w+oBX0RJytSz2Um3s23g=;
        b=IjEyLi0u0vJS67bnt63yTxmENUA+N3My2UUvoRAynn3NcqOA+997LKVw2ilfvKBsip
         6hYbRL6Rd1AaS/QK36ChD4iWlhclAygUOW2/DvvKLfT0bTrfglEZvbyYTIjabRoXdYMi
         9Onggoci8aoMTfGprKynzCcw4mzP4sFajFH4asnc8H1aN1O6+TxliyYUCLJwWikss0pJ
         opDTqY8xxJXler3W7tgJ3cyhYwarECFeBg3QENEvhvdavpgTVMpAaVieW54Gk8FEimey
         WFQ2UjSJXJz0wQdSohTKR56wiL/cA+hcRhII5nrzt2lQva9YhumWGl3k0dzLmsxPcqFN
         Hw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104774; x=1744709574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QklIp3gQyq6pxiDQB72pDv+w+oBX0RJytSz2Um3s23g=;
        b=T/6KVyf8sIApOy7DjfEVPfQCWnoL0r+oyWeiOUpznSaTYxKFfT2X8uuhhmCbt9GPkj
         pzazuDPgQTxlnscHnIDw5pRIiNr+bsbcGcA/He18+csfii+Q21I9Lc8r1s5rZbyFChS5
         4l9lCLMgVCnsAQH0pNz1rBjn7qpGywb91rju8o+ihLorWULzVtJNbL4DsUwwT0Z5+68s
         YpOQODWo/K02PWaiYYzY4fDAhEax26Pf43c/RCklnSZ4/T9JNa3KxRb+ZDDwAozx9DEq
         kzU10jHXo0uqG9TA/eEcRCe3omBppjGM9gpuZXXIww/og4J5RUP01qz9u1D6BHKm66Kt
         5JQw==
X-Gm-Message-State: AOJu0YzzkOPEoTAzYl1rW6skqdGnIrZnQGgPD/8wVG6nWYbmDNffpKDm
	vtE4oQfIaixu6n50nkZxoex7wbh6g8BC5fc+wVCn0smieGFL/S2Zl9Oj7zyIrGE=
X-Gm-Gg: ASbGncumDV0XyzQKZr74RrJLPvYxHyxPIWk7qTerwLEmeRaZW4TIY89MeIF8qleW89p
	SYyNFT96NjrtY4WLBEaZPUfMPHRwacAhgfyP5oGMT4oVSjoT9kKfmguCsqMWTwVJ8CqCve2jfzl
	Z1+FSy/cM35ObqVtXpFL3HKg0m8FnOsqw/7l5Aj9Tc+mWswkm/XzuOYi8BfotXrZ6b1GwqR6oeb
	WHqrOoPBm6oTVmW0FkiiH0mxbeblpEiCLPt/RXIeFC2vW4kRdDGwziXkq1feQpNaMiHUKQ+o4MK
	/d53xW8YMqBSvUCWG1n/sneE/u3R93Yy78s6Qt3/cqpZ9i/MD5zT3CDi79cUWFo=
X-Google-Smtp-Source: AGHT+IEP2VOZqM1Pzgr0xVtzK/PXfvs7NFE5l+7yNKQVcBTdAwjwDPecCJl9XbWdu0FuKvJQUBmrEQ==
X-Received: by 2002:a05:600c:35c2:b0:43b:cd07:92fb with SMTP id 5b1f17b1804b1-43ecfa43d05mr49319815e9.6.1744104774199;
        Tue, 08 Apr 2025 02:32:54 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:11 +0200
Subject: [PATCH v2 14/24] arm64: dts: qcom: sdm670: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-14-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2362;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fZFbC8k6T5MU+Ow44u3JsSjxzpu0DWJ4yHdQYHPjNAs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0i2hjZsgkXzbnYF6c8v2rCWlyShL9ioGmJK
 ui8wbYZ6tmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtIgAKCRDBN2bmhouD
 1/xMD/9Kgx1p13iLJQUDA5c1nzEvhcv+9xRQd4hJWUhnB86Y06PqGYsvrf3qW7mCVuuLw3pbpjn
 p+Hc6+ZJlelRH2YG2YjfOuvdDxaTuUNnw9mvZc0ZfX9GWjjACFlQlGZZJ7ipfI7ceGHB6blAuzH
 zHTrlXRWI3loKMjujEhzZxy0g2i/E7ve1qWF5Tm+yKQtvPsdkq9xI7qtY8QMoHWX+gidZ6fSS1U
 IbE6oS3ZJtSqFaVsPXa3Re0LBhoCMdbzaWAjjSbJNXR6lQYFf7NqkLMAuZ0nmGz054yywF0N2d6
 oFberQaPHaVcoh8qMdYcNrlfWVrU1foGgfwHITmtkoMoaJXi27o7c6ssteKk6A/tEWkgDtk33fN
 YmuuicR9FM0E1ZteOCv/nzk2ZtwfF85Tq7/QMQ6eC4GKzasS2KhNXhItOVwCwGhmE2Ts0JBNqcb
 7mYjV+V68tXF/2tsF3S7ypjycmdQqNC7WobstyTApfg+DufTpf1kWNtZ0Ypj/gLR4IH9itirN6H
 LqM3CiE/SiTKSe8f0WEylHKGPAdFkvh+n6H11H9au2yw/EMBC09v66ynDZbdKE9o/TfVATPug8B
 GY4kL+n0tkOiPgG+BOsaCaSfMA7XGAbhOzWQMlohNw+Pe1trTwnBVNjgYIdkEZyfLoeZms6Bpb+
 UCBb+9sjMtgzLrw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 279e62ec5433af70c0a7c594f2c5241800b465cf..a68ef6741f8d4f875a8897493c9f903e8ed3734e 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -1720,8 +1721,8 @@ mdss_dsi0: dsi@ae94000 {
 					      "bus";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM670_CX>;
@@ -1794,7 +1795,8 @@ mdss_dsi1: dsi@ae96000 {
 					      "bus";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM670_CX>;
@@ -1851,10 +1853,10 @@ dispcc: clock-controller@af00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
 				 <0>;
 			clock-names = "bi_tcxo",

-- 
2.45.2


