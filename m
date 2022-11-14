Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A199F6279CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 10:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237036AbiKNJ7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 04:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237034AbiKNJ6l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 04:58:41 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C381EC4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 01:57:15 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id c25so12437257ljr.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 01:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLJtGqbbAuvt7hlzediwejrBOt3AE1EPLmO7ITdmCW0=;
        b=VwezdBBBBhMUCoZtkjAXloTyM2ZV+O+pBIbLLMCGBn3L7cK7zzR7XwviANcdIpQhHg
         rKWoexfpEICTZ8UoRj2j972pt1WzvsP0AN+JnyHPo82y2v5YJ0fKRYTKtA6MIH5PuI3K
         IZq+FumssAVx2Iu7dIkllSMZGlYPxTMN++24I+lY8ghsozFUswBbhm3oTt2J+aMn9XGn
         ++skQDS1I4NB3Hzyv0RwfaeyyPmTnpu1mo+iSdQPIKY2Ts7ipKnwRT2iFWDbyGOZnQuL
         sX2dqYWvFKEfikzpnv/WkDCkCTkDvTOWQVYa61sWrCbZOkDJoX2D0USbQ4sQ+hTiF8Og
         y3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLJtGqbbAuvt7hlzediwejrBOt3AE1EPLmO7ITdmCW0=;
        b=dWHKT1Eo6IQYqBIAMiIg6GwPR/63PGqNa5WOgRmUxzCEgCDlXmyl7vbLf1WLD5dSFb
         kDPHCU40twIEDMqHcPFAL4o4+OTikf+xN9EQgjQoY+fa4s3lkYfxkU/B1KajAZCUhYOz
         SZlcHWG4QuPn5hIfD8D19NlXeMAVqFS0WREnQTiDeWFEqnmm60emX8O/B9yqzgtA4IG6
         I7TnyURo0KCcUw+9owjQ9Zgyjq518mjwEFflbcD7v0aZUI/6TmxElUL+4nT2gUNSCCfU
         99qC+7f+1tTVd1Ea/zvRtRhb0CoEKq0RVblTF32OY9s8kvXNv6U2v4l5KihfxoLP6zAb
         nS3w==
X-Gm-Message-State: ANoB5pmdhbRmk76VGUG9HET9Qv9zSfA7clNlTSRh9VN1gzok4LYbyg4R
        qIMN3KdBIzNy03r5xLWdfSzgbHdVWq3NzphW
X-Google-Smtp-Source: AA0mqf5SqUNrdMbnYxgvsQNWerF5Az4A0cIwG0rn2W6UM9NvXMLW1ijKLtdIqTQT6DF+mAFU4FMDYg==
X-Received: by 2002:a05:651c:1988:b0:278:f1a5:a365 with SMTP id bx8-20020a05651c198800b00278f1a5a365mr2623603ljb.29.1668419827443;
        Mon, 14 Nov 2022 01:57:07 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id p12-20020a2eb98c000000b00278e7800715sm1832012ljp.16.2022.11.14.01.57.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 01:57:07 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8450-nagara: Add Samsung touchscreen
Date:   Mon, 14 Nov 2022 10:56:54 +0100
Message-Id: <20221114095654.34561-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114095654.34561-1-konrad.dybcio@linaro.org>
References: <20221114095654.34561-1-konrad.dybcio@linaro.org>
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

Add device node and required pinctrl settings (as well as a fixup for
an existing one, whoops!) to support the Samsung Electronics
touchscreen on Nagara devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
No changes since v1

 .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
index 0d8d1519a23b..38256226d229 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
@@ -435,7 +435,22 @@ &gpi_dma2 {
 	status = "okay";
 };
 
-/* I2C4 is used, it hosts a Samsung touchscreen, but GPI DMA is broken.. */
+&i2c4 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <21 0x2008>;
+		vdd-supply = <&pm8350c_l2>;
+		avdd-supply = <&pm8350c_l3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_reset_default &ts_int_default>;
+	};
+};
 
 &i2c5 {
 	clock-frequency = <400000>;
@@ -566,8 +581,16 @@ &spi10 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>;
 
+	ts_reset_default: ts-reset-default-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
 	ts_int_default: ts-int-default-state {
-		pins = "gpio23";
+		pins = "gpio21";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
-- 
2.38.1

