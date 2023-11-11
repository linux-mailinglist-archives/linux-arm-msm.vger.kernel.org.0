Return-Path: <linux-arm-msm+bounces-485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D27E8A0B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 10:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BAD51C20400
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D3B1171A;
	Sat, 11 Nov 2023 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aX/h6miS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB37611707
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 09:46:29 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C2C3AB9
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 01:46:27 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so38127671fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699695986; x=1700300786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVTtu6pYkR0UVEWdHben4O/LG/815s2RPg8sTMtWYG0=;
        b=aX/h6miS8GIX1ZqLQdTQnIJFOrRp+Yh+gJHkquxLun1HP6tNXdLEDOHj04ZNuyOS2o
         z3xY3EewxcCt54GTcuSNehVEFTngByzBt1LmSaBKjjWE93KY7MokriWwWDKIgZI8X07E
         6A5oFj8yjNAL0BySsjoL/R/PSr0gqC0Alvd32MsyXfv0OZ6F6WCw4P6aeCLD1tHs686F
         LS+XAR68BTfRTkAePV2tu4EbkluYEc2PZtzzXxtwEmgNpp1j/vR3vRrXN60TzXyYuI4z
         EdVa2S7BTDOStYrpn1K2PnbXnxIvf1x5wI793i2yFmLFDS4liXbkhnbSKxeoEAt8Shyv
         v9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699695986; x=1700300786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVTtu6pYkR0UVEWdHben4O/LG/815s2RPg8sTMtWYG0=;
        b=tYUHYQJi2RefrJzDNd64X7+9C0D2TNJiFtxZQM3LZHDcvoy4ZE0m3DjQX1ocKXHZYl
         hcodvFyWskbNByINKutb+TT2YeQhIcYpsj1LZVZc0xWLSQJKRcy7U51ippjeg6dxdWBN
         8gEptUdzNO3vTnJV7N8LyeczvIwh5WO0X/7LYfRsQYGhemt5oDFtxw396TnFLg7ZJ1r2
         Ov2ASz5NokoW5GH8HbpHtBx42yGCE5F0FdCH0Qs/qcxnbg0uFtDjCZrGkDqyhhL2cs49
         gB7bTiP0ARB4YACgFXyHQx/JNY7o9TwHkR17wFTAcckzeQ/EqgHsadYyp0fpq7uUVRLN
         D7TA==
X-Gm-Message-State: AOJu0YxVlQrbYD6HKZoB4aeLHAgKSiXb2/csz7LVnGFiL5L0Y5dOQ37z
	H1P6RLz+hwCdLaXhlrvAt69bgw==
X-Google-Smtp-Source: AGHT+IF0eidGM7AYzIhV9yHBXmFKLt3sGRz9bIZrJcfxgiQ2gg4MZdPcbDoNPd4tb0nwmba7lVRVRQ==
X-Received: by 2002:a2e:9915:0:b0:2c0:52e:eafa with SMTP id v21-20020a2e9915000000b002c0052eeafamr1064875lji.29.1699695985873;
        Sat, 11 Nov 2023 01:46:25 -0800 (PST)
Received: from krzk-bin.monzoon.net (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id p37-20020a05600c1da500b004064ac107cfsm1695052wms.39.2023.11.11.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 01:46:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qrb5165-rb5: correct LED panic indicator
Date: Sat, 11 Nov 2023 10:46:23 +0100
Message-Id: <20231111094623.12476-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no "panic-indicator" default trigger but a property with that
name:

  qrb5165-rb5.dtb: leds: led-user4: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)

Fixes: b5cbd84e499a ("arm64: dts: qcom: qrb5165-rb5: Add onboard LED support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 3bd0c06e7315..e43f73f1be1b 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -64,8 +64,8 @@ led-user4 {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "panic-indicator";
 			default-state = "off";
+			panic-indicator;
 		};
 
 		led-wlan {
-- 
2.34.1


