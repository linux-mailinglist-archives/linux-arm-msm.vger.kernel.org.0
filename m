Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB833807B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 12:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhENKvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 06:51:17 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:23411 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhENKvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 06:51:17 -0400
X-Greylist: delayed 358 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 May 2021 06:51:16 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1620989045; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pmq7QYHzo+prEMJrMP2cDyBfw41rlani3SzajT0L8ncBkD9Yw6ZtDV7zrYwmSnVCtg
    HTz6Q48+GynS8gcCOUZ5sWuFgvqchkrHuHxOyOAEjVAn/qDoCjgsHE+AaH0F1Uv6eY+a
    Hytj7vWJiGKEUEE4DwInz1Oqgih4l6RT0qS7tZ/t2OwzDYOznUN7ALEBFuk/F4mXTArB
    SNGm2NEORL2rRk8ikqL+PhXxSVSPlQMagQilG5PSgomfR60i2K6e7VaK9FY7Sfz6Lt3G
    iphiMeGHQarsDY+/K4V4N+bhtSQofGG/KGB9ENaDMRdvY4GYveIQ9k/eNlvgJZcQrGnY
    +ksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989045;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=onZ1ndtHrNRFqAtDjGioRxEfQXLifJXbNhb184j8N9g=;
    b=VajhScdtRyhKsBH+lcw6FglMqIysujkiluQYtWQUJFrRQDOL8A1RyHwrIJHVRNm4Pz
    moMw0y4fkSXby+Rwu3hBtsSwFO3zZvK8cCJ3bJ8EMW7fnwL0GgJr4eFvYXrEAutHqD9i
    DXqt+MPVzzwX6rbOb06XG+lf6rihO75BFquDDolMZQcw+8r2ufxg8GuXTPNAqE/+co+a
    8hiLctbPCuoxUp9n5Hh5MU+6wIBXLa6tzHoKXw6qI9/F+5x+GHwDKoOZJj7g2Qzuqzif
    k+zekgwXcO9ceszHjQ0yxnIqBYHyk+lAEfCHJPYOkSFjk4O0kPx6AEhSdncmHrgWdP5m
    4gDg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989045;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=onZ1ndtHrNRFqAtDjGioRxEfQXLifJXbNhb184j8N9g=;
    b=AECLsnTsmsdgQelCoRn/ViLk9exFytmnpVLLEPz1lGdLdx47TNKmi7Ajjrc+KZGnWE
    C7B/K3DCZoVBHumhiYIXP8YjOAlbDf4Wny4sBxNJ+uPSTyWLXus6Vf5wj1BDcYqNQptE
    JjwrxGX9vscbBqhOxM5/mCX2X0+W31rYuaKVFmm/3oWdxgIfayqgXi30P0BwmY2cVcgx
    wiZCBjapX5n0a7exGaxoUBKYh9UH2gsmC1yOxcbcEJiZuCaEUtG84IajIli0rl8XU/xh
    UZVI8vY1x6ms9Bl/kcjjmqMXkVS974z8Xfc91cHoue8BFt6TtaZkoemtnw2AmVjJ3Zy6
    Sh9Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6OWA=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.25.7 SBL|AUTH)
    with ESMTPSA id j06c13x4EAi4Fyo
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 14 May 2021 12:44:04 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 5/5] arm64: dts: qcom: msm8916-huawei-g7: Add NFC
Date:   Fri, 14 May 2021 12:43:28 +0200
Message-Id: <20210514104328.18756-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514104328.18756-1-stephan@gerhold.net>
References: <20210514104328.18756-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Huawei Ascend G7 supports NFC using the NXP PN547, which is
supported by the nxp-nci-i2c driver in mainline. It seems to detect
NFC tags using "nfctool" just fine, although it seems like there
are not really any useful applications making use of the Linux NFC
subsystem. :(

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index 5ad4e921b110..e0075b574190 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -193,6 +193,24 @@ rmi4-f11@11 {
 	};
 };
 
+&blsp_i2c6 {
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <21 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&msmgpio 20 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&msmgpio 2 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&nfc_default>;
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
@@ -378,6 +396,14 @@ gpio_leds_default: gpio-leds-default {
 		bias-disable;
 	};
 
+	nfc_default: nfc-default {
+		pins = "gpio2", "gpio20", "gpio21";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	mag_reset_default: mag-reset-default {
 		pins = "gpio36";
 		function = "gpio";
-- 
2.31.1

