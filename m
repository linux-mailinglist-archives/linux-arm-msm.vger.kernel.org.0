Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165FF547CD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 00:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237012AbiFLWdd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jun 2022 18:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237514AbiFLWdM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jun 2022 18:33:12 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7429F1928B
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:10 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x62so4967474ede.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4nJEq+0F6Kk8Ge3MLggAIqmACf86QHCZyLCCT4E4CWQ=;
        b=hW24e/VAQZnxK1I15mgerWtrXu7REOsHGwRMjz5Cju/IfqimQ0m4ko9tvi9gOecUmO
         Gvb4VyInGJFktcU88SQpRG08A0WjL9G64Y6YbmX6tWoV+q4AWRG1P0r5h5UZNyU6iYWO
         JM6M7TdccyNDB8zDpehOPzY4J5SsPsG2zGogk5mEZeReDdWyU/ar7LtWQzW1pRghADRP
         /ey6Nd3hd24Hi3ylnJEbpdDQvNXqLIeF74LPsI5bf0nFgnkbPzqULfffgP+bU8l6oWDR
         0sK1PLusEoEnJp2IIJwvf5sNrhsUM/9BfpPAJCyiKAIPU/86oZVv4sGkihkGG7RN8abT
         a+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4nJEq+0F6Kk8Ge3MLggAIqmACf86QHCZyLCCT4E4CWQ=;
        b=5aaF9vckjpjzbWKx70hhrvmKrPkBkbJJv7dUk/8A7nCPwLLjn7dXSJP31iZnfyLnkk
         //zwXz0wQMTKQ9dSFB0f2RPysZ3LJOWGpKu612FRA2UJIZyf26jWMwQJS4QCHmV+dVtW
         gidRX9Cz/5Fs9slAiNB+q2fkZzoGEN24tle6um8/rUf/WmuyvZg0iTNPErfuMxdhC3sH
         NruyMauuNbjMfcOx7AMpiDHm6gl+Frh5Qcymo1F98JlnisOv1FIv0VQ1oaAM7kC69hfc
         F51b1npySXSjJLytCn/JxK4pTbcqmmGtoCbuztRjp+dumInPllmRX1rXrK0yPVa1yVrD
         bYzA==
X-Gm-Message-State: AOAM533v/usmf12lO95un73q0Q6OazltlHF8hHQrbrkCb6tREL18jb4K
        DqOuf5xnLkMc5cpONsYtd/fm5A==
X-Google-Smtp-Source: ABdhPJxpX0mJKgMB5LTCM0Ad0hLLNGFtaBXZ5buJwb9RS3/hnzB7Uv6+BRAUihiZS5MkLfcuoJwR0A==
X-Received: by 2002:aa7:c14b:0:b0:42d:d763:104 with SMTP id r11-20020aa7c14b000000b0042dd7630104mr62964220edp.104.1655073188982;
        Sun, 12 Jun 2022 15:33:08 -0700 (PDT)
Received: from bismarck.berto.se (p4fca22cf.dip0.t-ipconnect.de. [79.202.34.207])
        by smtp.googlemail.com with ESMTPSA id e3-20020a056402104300b0042b5cf75d6esm3766559edu.97.2022.06.12.15.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 15:33:08 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 6/6] arm64: dts: ti: Add missing space around properties
Date:   Mon, 13 Jun 2022 00:32:01 +0200
Message-Id: <20220612223201.2740248-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
References: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing space around properties before the typo spreads to other
files.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           | 4 ++--
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           | 4 ++--
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi | 2 +-
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi         | 4 ++--
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     | 2 +-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    | 4 ++--
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    | 4 ++--
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   | 4 ++--
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index d08abad0bcf4e58c..df3b9883e88753d5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -144,8 +144,8 @@ dmsc: system-controller@44043000 {
 		compatible = "ti,k2g-sci";
 		ti,host-id = <12>;
 		mbox-names = "rx", "tx";
-		mboxes= <&secure_proxy_main 12>,
-			<&secure_proxy_main 13>;
+		mboxes = <&secure_proxy_main 12>,
+			 <&secure_proxy_main 13>;
 		reg-names = "debug_messages";
 		reg = <0x00 0x44043000 0x00 0xfe0>;
 
diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index f64b368c6c371757..7bfddd35eb93e4e8 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -174,8 +174,8 @@ dmsc: system-controller@44043000 {
 		compatible = "ti,k2g-sci";
 		ti,host-id = <12>;
 		mbox-names = "rx", "tx";
-		mboxes= <&secure_proxy_main 12>,
-			<&secure_proxy_main 13>;
+		mboxes = <&secure_proxy_main 12>,
+			 <&secure_proxy_main 13>;
 		reg-names = "debug_messages";
 		reg = <0x00 0x44043000 0x00 0xfe0>;
 
diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index 6e41f2fa044af9f3..d050c410c6917a8f 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -574,7 +574,7 @@ &mcu_spi0 {
 	pinctrl-0 = <&mcu_spi0_pins_default>;
 
 	#address-cells = <1>;
-	#size-cells= <0>;
+	#size-cells = <0>;
 	ti,pindir-d0-out-d1-in;
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index 9c69d0917f69ac9c..fa11d7142006a72a 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -12,8 +12,8 @@ dmsc: system-controller@44083000 {
 
 		mbox-names = "rx", "tx";
 
-		mboxes= <&secure_proxy_main 11>,
-			<&secure_proxy_main 13>;
+		mboxes = <&secure_proxy_main 11>,
+			 <&secure_proxy_main 13>;
 
 		reg-names = "debug_messages";
 		reg = <0x44083000 0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 57497cb1ed68ecb3..048228c89d5b58d7 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -330,7 +330,7 @@ &main_spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_spi0_pins_default>;
 	#address-cells = <1>;
-	#size-cells= <0>;
+	#size-cells = <0>;
 	ti,pindir-d0-out-d1-in;
 
 	flash@0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
index 1044ec6c4b0d4b10..ff13bbeed30c91e6 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
@@ -12,8 +12,8 @@ dmsc: system-controller@44083000 {
 
 		mbox-names = "rx", "tx";
 
-		mboxes= <&secure_proxy_main 11>,
-			<&secure_proxy_main 13>;
+		mboxes = <&secure_proxy_main 11>,
+			 <&secure_proxy_main 13>;
 
 		reg-names = "debug_messages";
 		reg = <0x00 0x44083000 0x00 0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index b4972dfb7da815a0..df08724bbf1c51c3 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -12,8 +12,8 @@ dmsc: system-controller@44083000 {
 
 		mbox-names = "rx", "tx";
 
-		mboxes= <&secure_proxy_main 11>,
-			<&secure_proxy_main 13>;
+		mboxes = <&secure_proxy_main 11>,
+			 <&secure_proxy_main 13>;
 
 		reg-names = "debug_messages";
 		reg = <0x00 0x44083000 0x0 0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index 6c5c02edb375db32..4d1bfabd1313a560 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -12,8 +12,8 @@ sms: system-controller@44083000 {
 
 		mbox-names = "rx", "tx";
 
-		mboxes= <&secure_proxy_main 11>,
-			<&secure_proxy_main 13>;
+		mboxes = <&secure_proxy_main 11>,
+			 <&secure_proxy_main 13>;
 
 		reg-names = "debug_messages";
 		reg = <0x00 0x44083000 0x00 0x1000>;
-- 
2.36.1

