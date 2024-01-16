Return-Path: <linux-arm-msm+bounces-7310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A155C82E7AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 02:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 169CAB20BB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 01:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DD220DC6;
	Tue, 16 Jan 2024 01:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZGtM+g3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C4220DCF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 01:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd0f4797aaso99834811fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 17:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705367477; x=1705972277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RStsOu+xacQMgJbS/MXyR2aPxlxf4VUezrxj/3wNsBo=;
        b=ZGtM+g3EZe7jEsisf1riGT5iM06fUtIRW/nD2vbvNQV+Q0FnOCg3IBF0rAqo1LyE92
         t8rmiu4QpIZ3faUsa8U/GHwyA9kHMg1q0OxZTPgUCFkWRB8NyfknQs1y4bWmj0B+8zP9
         sTyXancP0tecfLfluncGzb6sgge04uv44TUhcSd/zzOhuOlaIRlczQiKdMl3AkCp7TTs
         G+JbmUwL7F6ifJtXxHexuZzr5tMX6OEdg1RwIDGbDau8TivjF+ORqBiQeuqbmAlYIZJJ
         5wns+SHS6Bw2Fql2HyxrHQrTDMKeLWV8LGY2DjY/NJCtDxYq3qbjK2WhQVxWqDc24KIx
         qKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705367477; x=1705972277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RStsOu+xacQMgJbS/MXyR2aPxlxf4VUezrxj/3wNsBo=;
        b=u+4eGAstgw1NzMstBBUPUkL+7dBs0pcRsodUFjWHnfvjJMG3vDDGBZ9AcTA1g7Iwp0
         qGuClA2O6xeZjD5EfgPRJsYb6yduun4F3mLgGn+3UV9HnoyujHsb6Umt9/PfRMZI1+HM
         R2/tOAULAOIw68MGCiDjhsoI9mJlDNGadSyN/2eNw5atihKC5MP6w9rP8QPL9DG9Y4fR
         wSwRcaQG+alBdHXXycW0vVktDFnSzDYDe1vOpzgMXbDYQXszAL0U5W+GWU6xNfaXj4Rh
         wvkkDIE0OK6+XVZs3iV4/rUsCOPlW99aTP9wURSF4aW8lHjBjtrzqrLDDB2OqTNu+5g/
         qJTg==
X-Gm-Message-State: AOJu0Yx3X4+vDddAbUXn9n+IyrXO3XlHHZAOmAbNyrLVHBWyWOmhmHd+
	1txonfCD9MhGWPvcV5qjlciuf2JsYJQJag==
X-Google-Smtp-Source: AGHT+IF9QTTC5raiMne+yAWfQBinTWrTQZS+iMZiQlovjnYcHgehvOq/I4moxnNElTukvTobtkTSNg==
X-Received: by 2002:a2e:8e68:0:b0:2cc:6d87:9a91 with SMTP id t8-20020a2e8e68000000b002cc6d879a91mr2614457ljk.72.1705367477059;
        Mon, 15 Jan 2024 17:11:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q15-20020a2e84cf000000b002cc7a2f7a9asm1513414ljh.98.2024.01.15.17.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 17:11:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 03:10:57 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sdm630: add USB QMP PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-sdm660-usb3-support-v1-3-2fbd683aea77@linaro.org>
References: <20240116-sdm660-usb3-support-v1-0-2fbd683aea77@linaro.org>
In-Reply-To: <20240116-sdm660-usb3-support-v1-0-2fbd683aea77@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4024;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vROuTM9nsbcJ2159YURKAEnKyZKiaf/PSfxNouUCVmU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlpdex4RZUyTpfyKAR0l1z9mtwjfi8RAfh3fnpQ
 i2EL6HKaaSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaXXsQAKCRCLPIo+Aiko
 1RL9B/4q7I8AvvEE5rhJD8I+RlFZpuAGL8KtxWu/fIt3Mi7wRKBiALt44Pk/zwNDYTCG1sfCKLH
 xDl6ESkv7X5HGAqUwszMQ2qZL/s+lb2Zi5gM7Q2g6qT1MuWK/Wf1El8a9e03GSmUI6zZzOi7cYu
 THZTZY4eyWYEnJt5oo1mfj9dqAI3cMxFamNheWkzzq4FLo4jokTo/yTGCMh+JAfzwvN7B7lomCo
 doPShrWy5ZUX3Kym+yimdeEdatoW8XE3s0YTCGVl3ivVugDW7F9iskso+RMf9bsHG7IKxEw9b04
 mCWxg7B8S/fM8Izmn52q4SgOOYR0O78KC7sG2wWIo8aALEpi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define USB3 QMP PHY presend on the SDM630 / SDM660 platforms. Enable it by
default in the USB3 host, but (for compatibility), force USB 2.0 mode
for all defined boards. The boards should opt-in to enable USB 3.0
support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  6 ++++
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |  6 ++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 36 +++++++++++++++++-----
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |  6 ++++
 4 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 2ed39d402d3f..90118f133961 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -454,10 +454,16 @@ &usb2_dwc3 {
 };
 
 &usb3 {
+	qcom,select-utmi-as-pipe-clk;
+	
 	status = "okay";
 };
 
 &usb3_dwc3 {
+	maximum-speed = "high-speed";
+	phys = <&qusb2phy0>;
+	phy-names = "usb2-phy";
+	
 	dr_mode = "peripheral";
 	extcon = <&extcon_usb>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 87d0293c728d..f06a9f0cf97c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -658,10 +658,16 @@ cam_vdig_default: cam-vdig-default-state {
 };
 
 &usb3 {
+	qcom,select-utmi-as-pipe-clk;
+
 	status = "okay";
 };
 
 &usb3_dwc3 {
+	maximum-speed = "high-speed";
+	phys = <&qusb2phy0>;
+	phy-names = "usb2-phy";
+
 	dr_mode = "peripheral";
 	extcon = <&extcon_usb>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 513fe5e76b68..28489fb58b20 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1286,7 +1286,6 @@ usb3: usb@a8f8800 {
 			interrupt-names = "hs_phy_irq", "ss_phy_irq";
 
 			power-domains = <&gcc USB_30_GDSC>;
-			qcom,select-utmi-as-pipe-clk;
 
 			resets = <&gcc GCC_USB_30_BCR>;
 
@@ -1297,17 +1296,38 @@ usb3_dwc3: usb@a800000 {
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 
-				/*
-				 * SDM630 technically supports USB3 but I
-				 * haven't seen any devices making use of it.
-				 */
-				maximum-speed = "high-speed";
-				phys = <&qusb2phy0>;
-				phy-names = "usb2-phy";
+				phys = <&qusb2phy0>, <&usb3_qmpphy>;
+				phy-names = "usb2-phy", "usb3-phy";
 				snps,hird-threshold = /bits/ 8 <0>;
 			};
 		};
 
+		usb3_qmpphy: phy@c010000 {
+			compatible = "qcom,sdm660-qmp-usb3-phy";
+			reg = <0x0c010000 0x1000>;
+
+			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_CLKREF_CLK>,
+				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "usb3_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+
+			resets = <&gcc GCC_USB3_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			qcom,tcsr-reg = <&tcsr_regs_1 0x6b244>;
+
+			status = "disabled";
+		};
+
 		qusb2phy0: phy@c012000 {
 			compatible = "qcom,sdm660-qusb2-phy";
 			reg = <0x0c012000 0x180>;
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 3c47410ba94c..7167f75bced3 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -413,10 +413,16 @@ &tlmm {
 };
 
 &usb3 {
+	qcom,select-utmi-as-pipe-clk;
+
 	status = "okay";
 };
 
 &usb3_dwc3 {
+	maximum-speed = "high-speed";
+	phys = <&qusb2phy0>;
+	phy-names = "usb2-phy";
+
 	dr_mode = "peripheral";
 	extcon = <&extcon_usb>;
 };

-- 
2.39.2


