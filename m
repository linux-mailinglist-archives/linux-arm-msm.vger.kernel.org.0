Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D10DF627AC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236201AbiKNKmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236190AbiKNKml (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:42:41 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945601A22E
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:40 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id c1so18553458lfi.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unS8DAja8HA/dIZlSwbV4MAOjYuJmP970JokwE9EcjQ=;
        b=UNJQwlLNYR7SUmnSNDwwfov9iWYvKsfApH3RUCBE+WAIQ9pkM838kV2al/HV9L+Rma
         sTjPuV9LYkZ7g5n2zpeUDRohk/K+oZ2EFgkewQmJN3sDPXgz4Dz+IYXQk0DqB7CHONNI
         j2ABtEAzeoZz8lz6Gbjs+WfN1z80YuseC797iMzxHgbGiqrqXfwW+djS+h6Gsh+Arl+0
         mQmSrWiU3r506SYA5I9VTuGMuoHTNdLFJN01uBuGHi6sJEYCU/B8pyxTbmQCFqhqDzPi
         ms3TnGbbxtgtVSE/u+qDOezMrvBUxoN9p/pIlTm2VUMadvVhkW5GKzKzUCTsVnObW/kn
         V3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unS8DAja8HA/dIZlSwbV4MAOjYuJmP970JokwE9EcjQ=;
        b=GWI9iKRcBMdDhwhqaEaI6WrlfUblDfxMTWyIUBfXvKH9jHu0AgDpx+Go8z1/Ms4YeY
         STAYYYy0a1jaj7CcaZFGL3yPIbAnzy6tfjNTZGl7ppXbPQzQM/1khE/LMvpVOouIjggD
         oH4bjr2SrvssbpE+ZjHUxxYu2sMVRWv5MuDOrqnKxl2cwxXirE0m9JWr65zIHyNHETbq
         tO/+VwHM+e4dwRPEAHIkc6AjbKZIB9eSC02iyFuQrctLk9F+SRhmKNjhA2M6JGvcEwxg
         H19a1LMz/Kpqunn+qgwalQYD0jhUXuARVV+EHDprUEED1PuF68sIGmjjngJM62vTHmYP
         eqXg==
X-Gm-Message-State: ANoB5pnmJ/eIy/pelBxOvHCN1/2HbPn+Qnr3xPH5BG74dp7WXs9v7ZVc
        t6u9oayvA7AHOKoRVfnGxXHqdU0A7qGKSMC/
X-Google-Smtp-Source: AA0mqf6Sg/3A3bq8hfWV0SS4FjBoH20JV44Sex54BsF31TNrR9bjotUs2JGo5/GeQh8V7oW9ly8j9g==
X-Received: by 2002:a05:6512:710:b0:4a2:406d:47b8 with SMTP id b16-20020a056512071000b004a2406d47b8mr3558896lfs.249.1668422558704;
        Mon, 14 Nov 2022 02:42:38 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id bs21-20020a05651c195500b0026c4e922fb2sm1946486ljb.48.2022.11.14.02.42.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:42:38 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
Date:   Mon, 14 Nov 2022 11:42:17 +0100
Message-Id: <20221114104222.36329-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114104222.36329-1-konrad.dybcio@linaro.org>
References: <20221114104222.36329-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the pin setup for SPI/I2C configurations that are supported
downstream. I can guesstimate the correct settings for other buses,
but:

- I have no hardware to test it on
- Some QUPs are straight up missing pin funcs in TLMM
- Vendors probably didn't really care and used whatever was there in
the reference design and BSP - should any other be used, they can be
configured at a later time

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes since v1:
- pick up a-b

 arch/arm64/boot/dts/qcom/sm6375.dtsi | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 62a64dd731a0..952156891476 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -519,6 +519,49 @@ tlmm: pinctrl@500000 {
 			gpio-controller;
 			#interrupt-cells = <2>;
 			#gpio-cells = <2>;
+
+			qup_i2c0_default: qup-i2c0-default-state {
+				pins = "gpio0", "gpio1";
+				function = "qup00";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c1_default: qup-i2c1-default-state {
+				pins = "gpio61", "gpio62";
+				function = "qup01";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c2_default: qup-i2c2-default-state {
+				pins = "gpio45", "gpio46";
+				function = "qup02";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c8_default: qup-i2c8-default-state {
+				pins = "gpio19", "gpio20";
+				/* TLMM, GCC and vendor DT all have different indices.. */
+				function = "qup12";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c10_default: qup-i2c10-default-state {
+				pins = "gpio4", "gpio5";
+				function = "qup10";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi0_default: qup-spi0-default-state {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "qup00";
+				drive-strength = <6>;
+				bias-disable;
+			};
 		};
 
 		gcc: clock-controller@1400000 {
-- 
2.38.1

