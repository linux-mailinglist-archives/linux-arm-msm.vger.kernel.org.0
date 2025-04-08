Return-Path: <linux-arm-msm+bounces-53496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A62A7F9F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD891884A4F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7B6268FDB;
	Tue,  8 Apr 2025 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoKGBMiD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADC9268C6E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104782; cv=none; b=DAW8HE4aNuKDCRHpHN5C9DqaRCcRl+LKts3D3cUzAlEKtUV2BCXWXuS1WHK3kT73OQHXAAUKbINI6s48U2OSn0Y27iouHU0/6byKiiBRAupYEH4UpowFz2e01UOPEGYotTtyFX1yNuqvvofStkPSmbcCrixcEyN+GdT6CKfYHFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104782; c=relaxed/simple;
	bh=nuW/vxcb/ZKgkR3gzpTaJBTlNLt2STmXWCfO+HzV3Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gzeGF3t80ZJY+mEknwWIyNxIzvi9QZB+YWhHQwC6Hk63BoERgpS66mDC3sjyePJ1iQ6wyt9kyicMuhuI40AzBK5p8Pt7zol9XQ7YzzAUvrZK83OLfSKRX4iax6Fkc/yZD8GbF64Ru2D1AD9RNecI4UYkHSagOHE38yatQhRV+xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoKGBMiD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf861f936so5231265e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104778; x=1744709578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+XprdFtgaQu6ySSqwjo1DQRvEYVehxDPmieYGF7z3g=;
        b=MoKGBMiDMEztAEhztk6221joM1dExCWfYh1mTx/uNeljbD5/g4DdYXH0Twwsfh1ehu
         hROof1PxeO49Y6FZamMuZFR6m/gc9X7fC66bNxZOUeS2J+8gtf7K/k2uP5JPLlM8bW+F
         aM74UXOLBveLiiEgxEU18Fi0Q43abz+0zjcR3eCEUo3tSPz+OVdxM/0DUMCxVf66UaW1
         z5kO5W15y2whfMj3pgtWrPb1EPnndC/747tfh7n2ilLgI+WCwg88LhIJU2JHdn+ekYiw
         K74FK6Gx6amA+dUUa+CTG+T5XYgDvARYXFVw3i+0BbN1OqFMh3D1LacB/zMXIucCFT5O
         GfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104778; x=1744709578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+XprdFtgaQu6ySSqwjo1DQRvEYVehxDPmieYGF7z3g=;
        b=Wxjj/NwOVxTwie04e5YaXkpKgVr4Di8oJXUC4dMoKzyd4dORLIkxLYAQdzb/T/30BK
         S4dvR/7DtkTzSi5hhsXv73goJjIEBAh9L5b9WmENU6G04ijRUYraCMaLsPMZVPd6znFi
         jr2rKxs2VzWtu8L44QtaAC73aQlLDkAnnZzj/BXg8Q3BuJBAM6p9crL1UFkk06s8MNhi
         NMuPmOqAAD06b115dJeM3pfwPa29NYA8sUo2BJA3SEoXHUHAVbnMlH6Ia3dMH/cm9nFH
         sjyVUeWKJu5ZtP04KdLO4fFewhSHtKySGvHGOUk8L/TGgsunulpMnjcnC/ZKZwSRJZF6
         QKjg==
X-Gm-Message-State: AOJu0YyBX+K7Zb3u9x1NZpAUpgHMtjkSaPK74SWYPh2xw4Vg7Fua29ZK
	q1DIbdx0vqHu/JKUfr8Ebh0DqZ25uZQPE8K7S4dPO3F5a4ZjSN+7wS1acr0DiR0=
X-Gm-Gg: ASbGncuOSW+J5KLTvmskYfScrl1lmCfMSDG1uNtVtjVOa9kuMDa6+eYsfTvxr0RcHhz
	crtxJmkRpsCZDgWC7qDJ3eZgkzjTeVXr8OdSH9jXcbbYsbPJr45RTTgkyNDiHFhEq7rDeg7//B+
	0A0235U6Rr/sTpnYvqqXtRuKErcQuddBisnZltHXWChxshTfbuMMbCi3sgjddFR7rLCSugOE24i
	J7nJMbXzSifQJnlJprzddOsJiGS/lpUdA93tpn4GIOkm4jeBSxmWPpUP7cLADxTPVdOKBxq7Elm
	1gvjllyGFpiyirDxcJ88toXMQOFQnE8Nz29iRqH91kc558AfIgzpmcfhqSXkKmw=
X-Google-Smtp-Source: AGHT+IEAlvKsvmekTE8MbaYfld0A5jk8A0PjrBe0iOBb/4upO1FB706dd+fBeOivbMd67C6ajFF/0w==
X-Received: by 2002:a05:600c:5247:b0:43b:c228:1ee0 with SMTP id 5b1f17b1804b1-43ecfa45bcfmr54294495e9.7.1744104777933;
        Tue, 08 Apr 2025 02:32:57 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:13 +0200
Subject: [PATCH v2 16/24] arm64: dts: qcom: sm6115: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-16-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nuW/vxcb/ZKgkR3gzpTaJBTlNLt2STmXWCfO+HzV3Ts=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0k6k41a2POziiz2ffLEe8lnNt7dHRTGtgR1
 K0f0LFD1UGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtJAAKCRDBN2bmhouD
 1+LoD/9Bi+gLhxWqfVCROZ1sIcikTmFnb6M+cl5wNUVy1E2zuDro3WQ8j8ICGwAWtQMwUrjg4aw
 yokzxLJEExG5wh26JuMXo/b6a7iU9Keezzct0cS9a3kAwraJ4pT6IGJXQ04If6p0MDpyrz+U12M
 cMsIU8c0pNCzwXalVDcc+LERcoVZX3xqKnBXHE8bbh7NsZ3ZJPVEjwwZgoEovWHp494EWNL0QNJ
 /bmjGFu1Rq4uwRdE5JfSl5/KBMh41ArrnEh0fuy4UiStRJp7F7oNxhMapUWM9o7zLeHHCwFWySK
 DmsdbU5MykDe63g0WchN91YQnagZEORXZKxW36pnOvUCdauEVlcA4Ii/mykqysciVEckyjwwij7
 8DALEXUqmeEJ53cqQjD7MRH8Gc0esBmQuJ92jRUETu8gsOBOWlUqoW7SQFjSBGKt20zrvdFt5I2
 apYl9K2ZGdbboAI4+v4HfAzxryoHowFnEngX39ORMT+OYkF8s3EnWkc6thBFStE7dU7Cgvkq38C
 q1mfiPukyw6lP5sC09OO7y+AvawaZGJAXpn/hzOdx5lJUxHE/Nm9RtcLRZ9IpuB8H00B7Ewn3hl
 X44S91XN5ya4tkTDP5AwZWGw4ne1Q7k/Z7OcjfkzVlWc+sXweH9Q2HJSFE73ff+eMO42pbr2RQz
 c5+QjbaSTGTd0wA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 94c081bf7a892654e684ad806621a14dfd4407ab..55a0db0ed9cbfa2560e94ca8160a31ff3f1efc25 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm6115.h>
 #include <dt-bindings/clock/qcom,sm6115-dispcc.h>
 #include <dt-bindings/clock/qcom,sm6115-gpucc.h>
@@ -1960,7 +1961,8 @@ mdss_dsi0: dsi@5e94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmpd SM6115_VDDCX>;
@@ -2034,8 +2036,8 @@ dispcc: clock-controller@5f00000 {
 			reg = <0x0 0x05f00000 0 0x20000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.45.2


