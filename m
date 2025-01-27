Return-Path: <linux-arm-msm+bounces-46246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F10A1D731
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06FA23A27AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1171FFC65;
	Mon, 27 Jan 2025 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iHGXoLeG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B3C20110B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985699; cv=none; b=hECqOxWnKmeibFaWsuwJ4MfpXMFJkCgi6GObyby0z6srUzgM8sYKhEvKkugXh6VUFahB+TFS28XGjNWOacWElvMTFWctt63OsdTGsTOn5L0ZYTe9QnvotXXK6/0onF/Dg7xEGh1ESKvUjBSm8v3W8GNG+sgAL+yelvUI7SgINi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985699; c=relaxed/simple;
	bh=GA1k8TYbedpcAFsOCae4GWSSdJdm/ok0oyOAciynePg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3UTFRCvtoFeGWnpUX6KL/X97lQMo3PE+Hjc5As9MaRbAqUxl/hH28pcEg8FZzhTh+lwxwPn1e9Tas5DFqcfOfwSIuBKUC+FBKNZGKHVgrrczbf/GPyDWz5AaKsXCi81MrdqrMRdnxULvu29FKy9FozxZLRMvRO5i/+3NcDe2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iHGXoLeG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso3932195e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985696; x=1738590496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwUBZyq+pVmnivBgVi2ugvPHF9cV0ulYZgN2tN39zds=;
        b=iHGXoLeGTftx/fetx0u1eG67ahL5WKu4qWo9xRPnrncqzplqfx06AQBZHx6TmnAO+H
         PqBH/wNCpFPiC2Te+YiTGSxXSw+oCADbwayQMIW5L/z81ZbQGKg4M9p4qFoAouUM8Mrj
         s6Hy/2EvHMVosCH3usFNKs86S7S2KubXBKAJ8G7EQgF9GPPV/0MBKHr7vyNEfSyu9RhC
         +Drt1ejYJvU7fDjxIM6WiYWTyMdFp0qQk/pgfkquZdBG6fX7i6+PD/LTky61aX0+gyR7
         AXYHQuvtGqDNPVsdo1F2GllDcjYGqQo0EtTzaHkY0jSCyjJTUU2+O8BtXhp1YVYgk/mR
         TSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985696; x=1738590496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwUBZyq+pVmnivBgVi2ugvPHF9cV0ulYZgN2tN39zds=;
        b=dKytqnhsuCnGcHGLBndIAvyULPSQdrq4lFBPFJW2hiSONLfEM0MJu8Vsd5cwEnyjUf
         VuC7A/zii9OZOVw1h2qDe2kqQpci4sXBeauIzB4jPCqKhOW2JTs5wDXJRCxmBg4Sgbtw
         wv55YdNO2SXjZuSHVmkSiX+13mgMJ1R9i+5O6VHGuwcY2XBwewA8cGMw9s4b86TkqBNd
         8bd74Eo6X6FdWDJ5BrvR7/4G8Cy5FtdqbuG59gQ8vqZjKou5f2goNfR9ov29o5Dbgbns
         vdj1Q/tA4N4kaSjHP8vzxg7wRYAcC1kkMv8Gjx6d3/0MD2bTIbWAQOAYGGKXFVmZkwWG
         2kEA==
X-Gm-Message-State: AOJu0YzcBLkgHhT50Zwf2E7V4C2AH0s7JTZHA7IseB/5hqWgyA55UbPs
	Yf0I/pElUv7nWKUCgEQysIlH5hVXGg80cGyg01lVDrgp/p7wPMHr2NlV7u+OfzQ=
X-Gm-Gg: ASbGncutnBy2jXnS2odf635vsLoIEAgtIhOt97fuigqXfNQaljeODuVdFEGQgnqja6M
	6hWJ4R4OcAzRCfllmzI6xbA9os/ntZ9EfLv0uTrNqbOoiZzEO9NMP3REqKSb7lzcD5LKHe7wpAb
	Qybu5TXHF9X8pwS3Anmip0Yv0J3VY1zVup3QJETZqFpNDt4KihDbIXqKGTwR62O5G9GWSy+GbWe
	gvdWq9202hU4NrdsmWtoTAGYsCr46R/Y3t4HOQkwB3l6NsBkR0kfNtI2aMsTuBRnUwhuKwJyTjo
	FcqFD43az1/y0dVBCweETzEUZMOCuQ==
X-Google-Smtp-Source: AGHT+IHLil/27HCqKNAZevv846pc9FZqnVTEupmYya5yOik+b/4NdA3/ddeiXQh1gyGr4PPfZthNbw==
X-Received: by 2002:a05:600c:cc8:b0:434:f5f8:22cd with SMTP id 5b1f17b1804b1-438912dba99mr143207065e9.0.1737985696075;
        Mon, 27 Jan 2025 05:48:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:40 +0100
Subject: [PATCH 07/24] arm64: dts: qcom: msm8976: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-7-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GA1k8TYbedpcAFsOCae4GWSSdJdm/ok0oyOAciynePg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46F6+M33UWJHuGIzIjk0esSv0a9tNawykT6t
 vmL+Wo9PoGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOhQAKCRDBN2bmhouD
 1yALD/4oY0EU3aV49UdprPBoJMGzxI3560YdaB4nqKSa/SpNL73kXUgMONx7OF8fBP/WjvbLMi/
 qrM6OXo7FbNXKE/wC8fY6aBasP8jrH1K919YGLWbRgY6HM+ql2dr23IHbEGhewwKFaoAtuOMoZq
 i0+rlCsSZC578z3mmH9ytYytvs/Q/b44ScNM5JkBqkWYvar3QyU1pGBV7tCL6KI09/6oIRL3k/M
 zEt2N+Ciq9FWTC2t5Eq6GqFvFLh5y7SEopqKiZqTKDiN1Kp5zEs91SzrPS4fbzdFyfpr/J/ypKx
 OwxAukbd2cuAX6bFVZUR9jwXHjiNFmSFD0m6gFAKJVKAWgaRO9cWFIttg3tlwjU44ShOrYE1e36
 +sXZDZ0HLyp1XvjYad0GbyGC1Y0NjW/24TLufN1liY2IK2hPxC33n5lr7LTXit9GrrYGXQHclXE
 9CHYeLA/dK3shNObEs7B+5BTLKTKviKvuSsd8tn2wVL2AEi17zoUG/7ge+gWaECQA/cNzhq2Uqw
 7k2bpGD0/cVZ7CdNgbihIDjVVONqblPwuQAY02/atH0I+OsQ5/oalltY5nhVQ3Z308NjRI/WWwx
 GYDQ1NytyKxcIJIVIOf1rX4UPUCLYkqLipcflc7tTZMREijlTN33bxx5oHQN20lv1l61sBdHcvW
 P6BRYGdYAzCIcFw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index d036f31dfdca162debe18ed6ed9a7767a34aced6..e2ac2fd6882fcf47e846a92d45e0fcb9beba633a 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -6,6 +6,7 @@
  * Copyright (c) 2022, Marijn Suijten <marijn.suijten@somainline.org>
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8976.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -824,10 +825,10 @@ gcc: clock-controller@1800000 {
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi1_phy 1>,
-				 <&mdss_dsi1_phy 0>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>;
 			clock-names = "xo",
 				      "xo_a",
 				      "dsi0pll",
@@ -970,8 +971,8 @@ mdss_dsi0: dsi@1a94000 {
 
 				assigned-clocks = <&gcc GCC_MDSS_BYTE0_CLK_SRC>,
 						  <&gcc GCC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi0_phy>;
 
@@ -1046,8 +1047,8 @@ mdss_dsi1: dsi@1a96000 {
 
 				assigned-clocks = <&gcc GCC_MDSS_BYTE1_CLK_SRC>,
 						  <&gcc GCC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi1_phy>;
 

-- 
2.43.0


