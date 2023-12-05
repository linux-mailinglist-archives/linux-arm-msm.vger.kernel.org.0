Return-Path: <linux-arm-msm+bounces-3393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6B80463E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 04:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E29761F213CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033338F79;
	Tue,  5 Dec 2023 03:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7rgCvVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA10C113
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 19:25:58 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c9f84533beso25565401fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 19:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701746757; x=1702351557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpCyJtkUXbvzGNWp2jcEZsxHIJHL5PcmPFAe6pFPi7k=;
        b=L7rgCvVtcR6RRT8fdi6ZxSFTM6oO4gi5M6oRmwlDi+IBBR40HxH6/SEl27H9nJIJEu
         f8ryw0UoWWsb6dPX0iGmG4z8Gu63BW7vIkv99V8dbWNVuNLAeDmeY7kWM81NgEhNSG2m
         DU2SbLyV9R2J++wL9MW53g0GMUKopHOX4DFcxFYAsHM09P71O9sjU8ICcuCobW5CAZKW
         u6f1ux5pfmvZ7+uL3EOYSR4OlbG0ulbhoGk5G2gcTOEEE4ddDTqLvRm9fOarlhjkUuHa
         wNkEuP+yonQDKT9QQmCNbpQ5uamsbFID0z1yxTYZi5tCdcUCThX7TlTf2wPY2F9QjxfF
         AXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701746757; x=1702351557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpCyJtkUXbvzGNWp2jcEZsxHIJHL5PcmPFAe6pFPi7k=;
        b=BO6KPWGsoXB7ZLajZvjYXm+S7EnuempvTUHEwkXaAgL51IpHQCqnDPHndI04Eg2YVS
         6IqKhsQ5oOyBE36Hp3ePd6vwMAMeHX1qfMpD4JaTVg+L1MgLvQkcIW3YVSP8O3uFm6I1
         aij5RYX/EyMjIy6wPaeiUDVmkbDKJ/eUnPOJ25/Ra/eOQq83RZBMOsRIygi0trlon7Ry
         Jd+kJGBrV+zcB12HPG5nEqfSgDzKTTITNEvfAYv3jvE/LyCFAdQSlWYB3eXSYrPKiraA
         NRsJKjFVugda1z2CefNNQI61jOaYBqNtAaAVd92vORLG7hYrki7FyhnaX1oo9hgGhzEw
         2TpA==
X-Gm-Message-State: AOJu0YzBNck6LGCkTSWIKe3cRbCIOPLpor7gAGq7Icu1BB6foKKgAfYn
	yGgVeKkgZ6WGDOJJbe/TzE438A==
X-Google-Smtp-Source: AGHT+IGqD1/decjIziEwSl1q6CO9oqqnpP84s5A7bAw9a3V3GZX1LVgrbI4qPAP2AE82aep230VH5Q==
X-Received: by 2002:a2e:a3c6:0:b0:2ca:d47:c99a with SMTP id w6-20020a2ea3c6000000b002ca0d47c99amr813256lje.73.1701746757257;
        Mon, 04 Dec 2023 19:25:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651c04d000b002ca12be2b63sm127277lji.18.2023.12.04.19.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 19:25:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/9] arm64: dts: qcom: sdm845: switch UFS QMP PHY to new style of bindings
Date: Tue,  5 Dec 2023 06:25:46 +0300
Message-Id: <20231205032552.1583336-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205032552.1583336-1-dmitry.baryshkov@linaro.org>
References: <20231205032552.1583336-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b8d0fa283085..f980492eeaf4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2565,7 +2565,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_PHY_GDSC>;
@@ -2637,10 +2637,8 @@ opp-200000000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sdm845-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x18c>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
@@ -2648,16 +2646,9 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x108>,
-				      <0 0x01d87600 0 0x1e0>,
-				      <0 0x01d87c00 0 0x1dc>,
-				      <0 0x01d87800 0 0x108>,
-				      <0 0x01d87a00 0 0x1e0>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {
-- 
2.39.2


