Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8046B04C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbjCHKk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:40:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjCHKkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:40:23 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E089F054
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:40:20 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so929677wmb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678272019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XIMBXfDU/R4FYmgYxRTe35TNzbPerUdpZusJBGj0r4=;
        b=WPlJXNPq9weQmaEHgmjFJqNEIJhCryuLWGg9i1041Fjka8OA5GMo6pXBj1IJQlSiRL
         AbtBd0QcetWoI9Z+XqSO25tjY3EMAzWnaCfv0dDnCJZ2sb13NGnP7iO0aP1yW27pXs2G
         qfZIi37a1RXG89V9AU3wE1zP9EyIcHFIfqWxe49WgZCufesqr6Rkuso75qSSUTUurvfw
         b2btVOzU0TbmQFGKtRVTpCmFq6nAo+tGGottBBurUXU9BZ84CgZSqQvmu4LCM7neHPO3
         MNNn4qUHS1YoJwJVRDamckpDyQLH4ieTK1HWraR6U0EHHJDwurX6HcdmB9vWuYp63Q5m
         Bnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678272019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XIMBXfDU/R4FYmgYxRTe35TNzbPerUdpZusJBGj0r4=;
        b=XuezqpPSN9OPpyR1mHdHkSeWhafihI4YuYKcJ/Rg1sA3HKvDhxgFbc2cxgzLAVatXC
         5F6hLZyYZ2EiU9WZRymESkYTo0rx9jBGkKp/JyGoIwqKgXetdNOO4ULKEyHagLKX/MLr
         SDut/duvAizHtPUEPAFS77xi2ByMtklCz8WAlVNQLIayOOmbOMkSAIZEpP9VmDb2Lm5J
         JgjE6KKa5RUKIZj+apTU2DkBPUYe22cbK8Af38ezYGtVzv03NF7EHd1jxP1dSYD+tGgO
         rOx2tbDQWW2ntyB+17porfBcmChe1JA0mWthawidBmDPg13nIVQzCAzAHFDu8/DQKbrD
         avaw==
X-Gm-Message-State: AO0yUKVjZittW44Y89Z5+a7n1Y/xlaK33wy+HVmJA+9SuFGSuqWcA0kC
        pp7wm+TKC0sWYyUfGYrM++5HGQ==
X-Google-Smtp-Source: AK7set/bQAmklfNm/duJj4RVLMLptZ+d6QumFEID2d6XQ4+C3YK3EZoh8a94Zl/N3Jhx336CdvE/Rg==
X-Received: by 2002:a05:600c:198e:b0:3eb:36fa:b78d with SMTP id t14-20020a05600c198e00b003eb36fab78dmr15272995wmq.23.1678272019563;
        Wed, 08 Mar 2023 02:40:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2326:fd4c:82e3:7e07])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003eb0d6f48f3sm20664135wmn.27.2023.03.08.02.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:40:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 6/9] arm64: dts: qcom: sa8775p-ride: enable the SPI node
Date:   Wed,  8 Mar 2023 11:40:06 +0100
Message-Id: <20230308104009.260451-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308104009.260451-1-brgl@bgdev.pl>
References: <20230308104009.260451-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the SPI interface exposed on the sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 5fdce8279537..d01ca3a9ee37 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -14,6 +14,7 @@ / {
 	aliases {
 		serial0 = &uart10;
 		i2c18 = &i2c18;
+		spi16 = &spi16;
 	};
 
 	chosen {
@@ -40,12 +41,25 @@ &sleep_clk {
 	clock-frequency = <32764>;
 };
 
+&spi16 {
+	pinctrl-0 = <&qup_spi16_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &tlmm {
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
 	};
 
+	qup_spi16_default: qup-spi16-state {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		function = "qup2_se2";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
 	qup_i2c18_default: qup-i2c18-state {
 		pins = "gpio95", "gpio96";
 		function = "qup2_se4";
-- 
2.37.2

