Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85A1271523
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgITOuV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITOuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:50:19 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8927BC061755;
        Sun, 20 Sep 2020 07:50:19 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l15so9926204wmh.1;
        Sun, 20 Sep 2020 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SteKMBpmBrguVd23I5meuDfrBnRPfbmSgXwQWs0dPQM=;
        b=tvQ5lupA7UglXX89heGIad1LEEh8JvWmpB6SnN/WFOKmPhkdXpu243oNWa/FmzVzso
         fMHhv+e/PSE9VKuQYHuv5j/Q7oiCD9u0/q/wJKBTTfMWtHYXciVVo7Cz7aGiZX4bu6Gq
         2L7jLR/oBk1aGgl4bo6wTVgkid5QwDmCCydqJ3AHuG+arslEMn8q0X9RH7QjxE11HQR2
         cCr1XYUKLRZkXTL4mekIfh3AXNe5H6jXCoboLqFI9w7Jy1wWiGngntXvd8i+XR1e+zYC
         Mbnj+2Ounm6/s7Wu9DK74Ue1oL2T38TVXME1xtThscKDhv8bEs/3axwTXWCnPClksZxA
         iGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SteKMBpmBrguVd23I5meuDfrBnRPfbmSgXwQWs0dPQM=;
        b=s4albZ3TaYk6aqDdjTyjVnFsiHXDeTmkgZeuk2CgFJ2Rbt6oJI5wjHC4KV1ktJ3igD
         NnKsiN4xeGjCgPNXJdi7wZdh3zQwEhO+xQqMv6ejU1J0gXh1bftbjV5hFj7NRYs5GJBh
         Sb/pfkMaFhIAY43+pME2Ze6rcw+FGbioOWEP0rw1VxptueHjfImm0rooW56elfHdGK8e
         MTpi+5y+HmZbnu7ubfvGeC3+1snIoCiPqQN2Oirrs1czmdgqV97r9F/HDWDfbwgj2J1I
         R88PTHcJ5846D6GJFO9I8E0yMhu2Q47Adsy7Un6s9NGBartyVf3G/6Tk7xQri8Au9ctC
         7aHA==
X-Gm-Message-State: AOAM532RIqCsqITVIFJYzZNQdEKiqJ1asxTWwgEX9wKNXVMvaI/Pj42B
        FB4DWRDotEISG8eSeCv0lHkvHlAUpyCx8fKK
X-Google-Smtp-Source: ABdhPJxlRO8KW5JdN4Ie/Lh6Cx9T0AbI9tJVN6s2v+EhCFUxWJvy9Exom5byY1PBmuSuDrcVPIR0HA==
X-Received: by 2002:a05:600c:21cd:: with SMTP id x13mr25626226wmj.63.1600613418253;
        Sun, 20 Sep 2020 07:50:18 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id w15sm14985282wro.46.2020.09.20.07.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:50:17 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH RESEND 7/7] ARM: dts: qcom: msm8974-klte: Add support for SD card
Date:   Sun, 20 Sep 2020 17:48:59 +0300
Message-Id: <20200920144859.813032-8-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920144859.813032-1-iskren.chernev@gmail.com>
References: <20200920144859.813032-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy S5 (klte), has 3 SDHCI nodes used for internal
storage, WiFi, external SD card slot. The external SD card slot is
similar to the internal storage.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 989447beb4319..b0899107f3ced 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -12,6 +12,8 @@ / {
 
 	aliases {
 		serial0 = &blsp1_uart1;
+		sdhc1 = &sdhc_1; /* SDC1 eMMC slot */
+		sdhc2 = &sdhc_2; /* SDC2 SD card slot */
 	};
 
 	chosen {
@@ -161,6 +163,9 @@ pma8084_l20: l20 {
 					pma8084_l21: l21 {
 						regulator-min-microvolt = <2950000>;
 						regulator-max-microvolt = <2950000>;
+
+						regulator-allow-set-load;
+						regulator-system-load = <200000>;
 					};
 
 					pma8084_l22: l22 {
@@ -349,6 +354,24 @@ cmd-data {
 			};
 		};
 
+		sdhc2_pin_a: sdhc2-pin-active {
+			clk-cmd-data {
+				pins = "gpio35", "gpio36", "gpio37", "gpio38",
+					"gpio39", "gpio40";
+				function = "sdc3";
+				drive-strength = <8>;
+				bias-disable;
+			};
+		};
+
+		sdhc2_cd_pin: sdhc2-cd {
+			pins = "gpio62";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-disable;
+		};
+
 		sdhc3_pin_a: sdhc3-pin-active {
 			clk {
 				pins = "sdc2_clk";
@@ -422,7 +445,7 @@ int {
 		};
 	};
 
-	sdhci@f9824900 {
+	sdhc_1: sdhci@f9824900 {
 		status = "ok";
 
 		vmmc-supply = <&pma8084_l20>;
@@ -435,6 +458,25 @@ sdhci@f9824900 {
 		pinctrl-0 = <&sdhc1_pin_a>;
 	};
 
+	sdhc_2: sdhci@f9864900 {
+		status = "ok";
+
+		max-frequency = <100000000>;
+
+		vmmc-supply = <&pma8084_l21>;
+		vqmmc-supply = <&pma8084_l13>;
+
+		bus-width = <4>;
+
+		/* cd-gpio is intentionally disabled. If enabled, an SD card
+		 * present during boot is not initialized correctly. Without
+		 * cd-gpios the driver resorts to polling, so hotplug works.
+		 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdhc2_pin_a /* &sdhc2_cd_pin */>;
+		// cd-gpios = <&msmgpio 62 GPIO_ACTIVE_LOW>;
+	};
+
 	sdhci@f98a4900 {
 		status = "okay";
 
-- 
2.28.0

