Return-Path: <linux-arm-msm+bounces-53486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3601A7F9BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4571D174D77
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4403B267713;
	Tue,  8 Apr 2025 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sl2xGfp7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D262676DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104763; cv=none; b=hd2fggm9dWFdjuIBbeAOyNVUgyHTaKz2NvvVudISF2DqIhUnlVyu8SITSBQC5znreDGFM+Gx66gjpwaWM+gcSulU/8il6aFIxkNukeRmF8LDUUz/ePf6xaSh8oZffMRVLnrdiE7TKuserOGQnP/cXGmXaR/FATtGvYNLsfLWHSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104763; c=relaxed/simple;
	bh=P9DMZnFgYyVfRy0aI2jSnDkuAttRkQgoAaffwn9tW0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pO+0Bp27oFaEi5nN25Vsn+dDm8cvz5kPbRIu5o9ZE9LUpQ/HDiBmDREnLWBiwnlRWHgbmhYOKRxSxyxnGQcY5B4j1OMt/agLzHOhbNhZiHYb4HgtH3NvSBLCrXAKmGz4NxUOyrk+b4KAgWvVm/HquiANkw5Kwm+Tue5wavBB8Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sl2xGfp7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so1879385e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104759; x=1744709559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+qYQJy6thq7w43NVLqs6sKSC6N7VV3dB72aVI9b358=;
        b=sl2xGfp7UrKSViVPqwj4rKxv3sESVsVeRHQZj0my+mX1zTf9mvettyzlBRv4kn5VMs
         DScJnyab/kXFCdTFX0knQ2Eb0sV5QxQHlffX5awPbwzIZQtCAIBtkLZn6t6i5h82CfcF
         niCt1lYdYkoeE7p9S0gpWntkIUkxWgyeYua4wa9t5zTRRibp2xHEdaaZqw9ng9GCi6n8
         ckpi+PPw3FNMB1uyKstQONVsnm8pHSft5Qkceqkew67sEyU5CWqj1qyhbI+HvYBq796/
         HgXk9gMivZ0RjZbV/sR6+EH+KoNKkxSGmlpSNN88FsN0zGnMHSMqWCn3WcPnorFDg0O9
         cGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104759; x=1744709559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+qYQJy6thq7w43NVLqs6sKSC6N7VV3dB72aVI9b358=;
        b=XTcEOHQe+ERCiIBLjhZq2DxTO0dYWwbk0ck/pWnx8tN5OGDdzesd8HZUtJ27oc6Tb4
         oJGzKxLXQwy+ypIla08mYQN8I17bIeZ73AGsDJSiR3iNDzF1dSIQkABvgM3VYxgq/Cw6
         K4dJPs2QUCu0A/sCb7GjTWlx+Jo4XjF7yobvpb8++PJSexx2QvK8rjayFAg9koh5B3U+
         15sMQnbxHeaJ8Qrn5wxVPM1vu9cMfWYPI9RjlSvevgnQedc2aYU96e7vAenyGPIfT2gS
         LhXTT7pAR0erJNEoCklK6+nGIHcfDMXME2VT+Vx7RF9D53Beyvnkcn2mOmvKS/E/dwtE
         tTWw==
X-Gm-Message-State: AOJu0YxyrvmZrmyymR3/8cwztn6QNDD32VG/XbC2b4W5lZycuGGnsO/w
	VMNFESCb0awl6ElKOT+rNkkeOEN6KRltghXwlFckfdNTmBpMPCUgEOQpZcL5EIc=
X-Gm-Gg: ASbGnctTAhuZbxD1RoT9TRX8cG26hN0abc1f8IGNNWG8vfwTQwBrIr4+SGK4dSqXO64
	s009QRzCPXMjT2iAHcH5YsnUjnsKHXtoZL5vLvQF1C5gd5jujAt5iEd9/0q+e+AtxX1Gwv7Co5e
	Fkopp5zNv5YvnT6G1sRYHgLJBbdC6OuEh04oXmWFET5LfssL2PDlfDDgnwFpfxVUIxL6OPYgXUh
	zww8oauyCCPCm886iKQSh1w6DtquZL1uQGQ9XwaoGZzcUhB3kybdfIbaQM4qeDRmuXvVivDCeN/
	1Jf9DDR7JoF431XhVQ40fmJ5HP4qcKgDETntHBHdN2EOxTbMrPst3Kc4m543ZnU=
X-Google-Smtp-Source: AGHT+IHfIFPgVYOpLKM/P1V6Qg1mQL+GDVEWRMSEPUF2vzOFVIx3Hdfudn16BsNPqn4AFsdPzkJUew==
X-Received: by 2002:a05:600c:45c8:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-43ecfa492eemr54972425e9.8.1744104759609;
        Tue, 08 Apr 2025 02:32:39 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:03 +0200
Subject: [PATCH v2 06/24] arm64: dts: qcom: msm8953: Use the header with
 DSI phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-6-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=P9DMZnFgYyVfRy0aI2jSnDkuAttRkQgoAaffwn9tW0Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0bOBfAEqOnBBvCdCylRL9GPe0FxsZwGnNlP
 Issal9zSiGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtGwAKCRDBN2bmhouD
 1x1sD/9Ei/L6zhqAFV2CnyiwQhChD+yWPixPmi+4Ph4YyzGzbEN7XiGXA+3BlWUmuD2rkyKm6tC
 AccD7/TPyJogy+yRX4Qioydh8lHc7ZxWiPLxTZTsUuhNdXDlXAF1wnUYVkpTpiTBH6PL1sI+8OB
 EdBt494ST00Q++LAZxIBkD6yUG2CfLrhAk106TA4I8TVpwHIqhbapfINnqCN+QV99g7kVNvd8LE
 cqk0QdgFS6bSDHon956yVWcMYSYAGgFyC9VyrJIXcdvN8+WmWKSecSaQLytgOIQ/qx5vAwi+2mG
 WeEf52Jgm+qELEyzvq20jfOfuDR8nZUQZ/ffeDbc/TBhOakCk5WXerIL33joS+aCFdu+6z6Fj66
 8I+Xsswqi9vVXG7NUgMO4gYzl70lhRzjsStEaDRLPb3uKgGSQKvFYhLrxoGtrdcFRrUsplI+/lv
 /bzmr1wBQlDyLVd0fb0BpPwQTr7Tdqet73Rt48y1Hl+c17oAg0v1SIR8JF7W5btKTfykf67+ZEd
 GU/BEK/3uH3DkuQckvEkDyt4YFcsyC7al1FH6rxD9CRrY0oEKewIlhDJTZAFCVP64PiykYlHJod
 a5tGAzf3wSkr4ZRNIO+VYaW4Lctb7zInPRpLjV7qTgTcNoM8BSpCCaA4BhKu4A8G/5VdHoM6RoU
 oVOs32GnMuZk2Xg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index af4c341e2533ef2cca593e0dc97003334d3fd6b7..4793a60fa946195d3220b6c44dec170d443f56db 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /* Copyright (c) 2022, The Linux Foundation. All rights reserved. */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8953.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -807,10 +808,10 @@ gcc: clock-controller@1800000 {
 			#power-domain-cells = <1>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi1_phy 1>,
-				 <&mdss_dsi1_phy 0>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>;
 			clock-names = "xo",
 				      "sleep",
 				      "dsi0pll",
@@ -917,8 +918,8 @@ mdss_dsi0: dsi@1a94000 {
 
 				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
 						  <&gcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&gcc GCC_MDSS_MDP_CLK>,
 					 <&gcc GCC_MDSS_AHB_CLK>,
@@ -987,8 +988,8 @@ mdss_dsi1: dsi@1a96000 {
 
 				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
 						  <&gcc PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&gcc GCC_MDSS_MDP_CLK>,
 					 <&gcc GCC_MDSS_AHB_CLK>,

-- 
2.45.2


