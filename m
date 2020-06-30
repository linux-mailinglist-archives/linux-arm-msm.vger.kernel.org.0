Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51FE20F6D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 16:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388764AbgF3OKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 10:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388729AbgF3OJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 10:09:50 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B5BC061755;
        Tue, 30 Jun 2020 07:09:49 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id b15so16357922edy.7;
        Tue, 30 Jun 2020 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZ6EA5FNrJjXMrMBZwxAfBnL6L5p1y0KiK8AwGx10HQ=;
        b=tv8C/UYYGPn7oGsWntvdusvYlJg7c33gM2oBNJAgGEDWQ/mDXtwVH4M8u8sDE5hMEh
         yc1ESDsG95rSCqFCRJ68ggKSyVuLB6/7HB2FAh3Us74P4DUKItUas7un7ve2NPdQ0snD
         xjfLeraiBmdHFpO4ZdeqzZroe8/BVFTqSas6MZLGuBg/8FjfY+mhu9YbL20BxOMYm39q
         MxQaMM7vGHddChXTRz6fq2CfiDy/jvqxSNdDD74w6Ti8V2T3OrYt5LRZUN+FinTx/igc
         p9GDSAjkWgkbZjN9GtiuMZsAqXDP0vQpfXyiv55SQCQ1hCP5fn9SBra4IGRodO3PuJ5X
         Y/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZ6EA5FNrJjXMrMBZwxAfBnL6L5p1y0KiK8AwGx10HQ=;
        b=fanM4ZZhAERBwvEj1XNBqjJcDnHATHk7ajxgG5IYsBfkuSikCYpEQ9qIR2i/J8WrsG
         Oo+JTJabXeX3kLHT1cCUTiA7Nq9piY3lPzeMIC0GKh0oS0XeH140jrKS5jDt9MXdhabO
         T++Q5Ky2QwnFB8pGC06us9Zj65MKZq3GFwO8VPHn0VJBOIEk5NXgTT4ttV4EYediuhuG
         l91qoXwFQ2QQZBTonne77eam8gw86cHQ6Afjk5796hZZNuJkbmGbxwPJh116FiJFlT77
         3rx6fgWXJvRkoimBS4WRFlmoiTCU9ajAFI7fMXZzrPe6Ag1MV5Y+bOr0nTZ5JTnKfLGD
         lEhg==
X-Gm-Message-State: AOAM530OjIhduC2bB6yQUVgW9HW3JYn7ijt9z7kx+tfRmNlsKOxCs78h
        vOHNBWib8Aw2LlVhUtnaG8w=
X-Google-Smtp-Source: ABdhPJzUc/AlPUjCu8xEJyv2O/B2cKzBvviK5uXiBogcMciemzbbhXPpqbyrUBv3NJ+NxHkAdd6Gvw==
X-Received: by 2002:a05:6402:1597:: with SMTP id c23mr22301422edv.243.1593526188104;
        Tue, 30 Jun 2020 07:09:48 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id d24sm2564876edp.83.2020.06.30.07.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:09:47 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 7/7] ARM: dts: qcom: msm8974-klte: Add support for SD card
Date:   Tue, 30 Jun 2020 17:09:12 +0300
Message-Id: <20200630140912.260294-8-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630140912.260294-1-iskren.chernev@gmail.com>
References: <20200630140912.260294-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy S5 (klte), has 3 SDHCI nodes used for internal
storage, WiFi, external SD card slot. The external SD card slot is
similar to the internal storage.

The device has support for CD (card detect), but if enabled, the card is
not initialized properly if present during startup. That is why CD is
disabled and polling is used instead. Related thread [1]

[1] https://lore.kernel.org/linux-mmc/491cfef4-4a97-b6e8-0f41-d44e1c73eea4@gmail.com/

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
2.27.0

