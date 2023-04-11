Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 826516DE39D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 20:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjDKSOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 14:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbjDKSOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 14:14:50 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0090430F2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:14:48 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a23so12059715lfk.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681236888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAFw3fMJjti2alnnAGY+IeTKktvF3qFkCOaKWG5QWSY=;
        b=Yswc/IHCubTP0CsltoJiXaszgZRI0RYaEZHke4WZj3gxUKLWci7OiHYytCMbOuVGjS
         K90rM8wNY6cAVtWxuhRWb4M0bxXfKzvRP88tIC0EpFnEkeTrqoYMR4U2p95iMJEmKuju
         6qzwmYIpoORRObkDsgowiapiq8o6Mtg+x/Pnc55T5IiWOBv4tH0tV8Q+wZTnDHeQM8Mv
         XUWEgPdETvvhgA8tDOykLf7zS0sC8Aq4Wop8Gjt4Jbar7v/Wbi/VRVHYjAkWtTAwR1T1
         EDaWTlLKTQRdzTdbBCVkCeeD3iG+TPsvnbzlAZxSSP6e4rqSIaqA56nGH5UbesP2dwOP
         AFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681236888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAFw3fMJjti2alnnAGY+IeTKktvF3qFkCOaKWG5QWSY=;
        b=E9dTsx3K/Qvs4KtUCT/rkCPHucpbdhY+l8S33qDiVSkq4DqZjeLFocar2P7uC6SH5x
         fFMMAF5mxqxuUJOMtvCAqUmBf6pNNF18MmGszlY23x7CFpjyAOu4/CTyq4ev34SJc92t
         amlzBkRmZpRxQiDWq50S51Eo/SZDwfoJozPH7unpamar08MEJJEcx9hMBsplN2Bn1yfM
         9JoPsGEtsdOuYmHBFXQJsPTmSZ8/J0KetRHfSx/OI7UE/DHngnKD2HLyYb+VWnmjR4dM
         0hy6ZTo6th4DpHLi2wZVwyEWjBZVkUI/OvgCT+VpvM3oBYjvB7wAm55TANoro2GI+L8G
         1f3w==
X-Gm-Message-State: AAQBX9difa4KGlaKqdOZ3/f+/91slaSoafR4YS1/8wQW4n5NQnOfBjk9
        IY6/AVgn2ftrA2K5ETJL5sWYHJDAdIz6HGY+lK4=
X-Google-Smtp-Source: AKy350a3hw/EROXDGXjg0SlMggcsAyPxM8d5+aVinWA7teMcvkJdew2E01u+DQLVlEGaBm5HuqGQWA==
X-Received: by 2002:ac2:446b:0:b0:4e8:5392:492c with SMTP id y11-20020ac2446b000000b004e85392492cmr2834579lfl.43.1681236888236;
        Tue, 11 Apr 2023 11:14:48 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b004da8168eba2sm2593868lfl.237.2023.04.11.11.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 11:14:47 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Apr 2023 20:14:42 +0200
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8150-kumano: Add GPIO line
 names for TLMM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230315-topic-kumano_dts0-v2-2-0ca7fa521b86@linaro.org>
References: <20230315-topic-kumano_dts0-v2-0-0ca7fa521b86@linaro.org>
In-Reply-To: <20230315-topic-kumano_dts0-v2-0-0ca7fa521b86@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681236884; l=4866;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ya68rGYBf4fVp2YMimU7MDqmgtfsOC1t4pU81IxkjEQ=;
 b=pGlj6Yxi0zGhIdo1d6MsF467jCC8QIwthQ5drGmEJgys5D/DrE9/BgBNCxtBwDb4vWUfF+YvhCK8
 tSuD8JLMCnFqaAAiTtBMn3pNntsuohvA2suWbt6iUHCXFleQxrZb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sony ever so graciously provides GPIO line names in their downstream
kernel (though sometimes they are not 100% accurate and you can judge
that by simply looking at them and with what drivers they are used).

Add these to the common DTSI to better document the hardware.

The pin assignment for TLMM is identical on both devices. Great job!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   | 175 +++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index 6753c65d75bc..d1a3ab836019 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -541,6 +541,181 @@ &qupv3_id_1 {
 
 &tlmm {
 	gpio-reserved-ranges = <126 4>;
+	gpio-line-names = "NFC_ESE_SPI_MISO", /* GPIO_0 */
+			  "NFC_ESE_SPI_MOSI",
+			  "NFC_ESE_SPI_SCLK",
+			  "NFC_ESE_SPI_CS_N",
+			  "NC",
+			  "NC",
+			  "DISP_RESET_N",
+			  "DEBUG_GPIO0",
+			  "MDP_VSYNC_P",
+			  "TS_I2C_SDA",
+			  "TS_I2C_SCL", /* GPIO_10 */
+			  "CAM_SOF",
+			  "CAM2_RST_N",
+			  "CAM_MCLK0",
+			  "CAM_MCLK1",
+			  "CAM_MCLK2",
+			  "CAM_MCLK3",
+			  "CCI_I2C_SDA0",
+			  "CCI_I2C_SCL0",
+			  "CCI_I2C_SDA1",
+			  "CCI_I2C_SCL1", /* GPIO_20 */
+			  "NC",
+			  "MAIN_CAM_PWR_EN",
+			  "CAM3_RST_N",
+			  "NC",
+			  "CHAT_CAM_PWR_EN",
+			  "NC",
+			  "NC",
+			  "CAM0_RST_N",
+			  "RGBC_IR_PWR_EN",
+			  "CAM1_RST_N", /* GPIO_30 */
+			  "CCI_I2C_SDA2",
+			  "CCI_I2C_SCL2",
+			  "CCI_I2C_SDA3",
+			  "CCI_I2C_SCL3",
+			  "NC",
+			  "DEBUG_GPIO1",
+			  "RGBC_IR_INT",
+			  "USB_CC_DIR",
+			  "NC",
+			  "NC", /* GPIO_40 */
+			  "NFC_EN",
+			  "NFC_ESE_PWR_REQ",
+			  "BT_HCI_UART_CTS_N",
+			  "BT_HCI_UART_RFR_N",
+			  "BT_HCI_UART_TXD",
+			  "BT_HCI_UART_RXD",
+			  "NFC_IRQ",
+			  "NFC_DWL_REQ",
+			  "UIM2_DETECT_EN",
+			  "WLAN_SW_CTRL", /* GPIO_50 */
+			  "APPS_I2C_SDA",
+			  "APPS_I2C_SCL",
+			  "NC",
+			  "TS_RESET_N",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "HW_ID_0",
+			  "NC", /* GPIO_60 */
+			  "QLINK_REQUEST",
+			  "QLINK_ENABLE",
+			  "WMSS_RESET_N",
+			  "SDM_GRFC_8",
+			  "WDOG_DISABLE",
+			  "NC",
+			  "NC",
+			  "PA_INDICATOR_OR",
+			  "MSS_LTE_COXM_TXD",
+			  "MSS_LTE_COXM_RXD", /* GPIO_70 */
+			  "SDM_RFFE0_DATA",
+			  "SDM_RFFE0_CLK",
+			  "SDM_RFFE1_DATA",
+			  "SDM_RFFE1_CLK",
+			  "SDM_RFFE2_DATA",
+			  "SDM_RFFE2_CLK",
+			  "SDM_RFFE3_DATA",
+			  "SDM_RFFE3_CLK",
+			  "SUB_CAM_PWR_EN",
+			  "FP_RESET_N", /* GPIO_80 */
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "DEBUG_UART_TX",
+			  "DEBUG_UART_RX",
+			  "DVDT_WRT_DET_AND",
+			  "NC",
+			  "NC",
+			  "NC", /* GPIO_90 */
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "UDON_SWITCH_SEL",
+			  "SD_CARD_DET_N",
+			  "NC",
+			  "CAMSENSOR_I2C_SDA",
+			  "CAMSENSOR_I2C_SCL",
+			  "USB_AUDIO_EN1", /* GPIO_100 */
+			  "DISP_ERR_FG",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "UIM2_DATA",
+			  "UIM2_CLK",
+			  "UIM2_RESET",
+			  "UIM2_DET",
+			  "UIM1_DATA",
+			  "UIM1_CLK", /* GPIO_110 */
+			  "UIM1_RESET",
+			  "UIM1_PRESENT",
+			  "NFC_CLK_REQ",
+			  "SW_SERVICE",
+			  "NC",
+			  "RF_ID_EXTENSION",
+			  "ALS_PROX_INT_N",
+			  "FP_INT",
+			  "DVDT_WRT_DET_OR",
+			  "BAROMETER_INT", /* GPIO_120 */
+			  "ACC_COVER_OPEN",
+			  "TS_INT_N",
+			  "CODEC_INT1_N",
+			  "CODEC_INT2_N",
+			  "TX_GTR_THRES_IN",
+			  "FP_SPI_MISO",
+			  "FP_SPI_MOSI",
+			  "FP_SPI_SCLK",
+			  "FP_SPI_CS_N",
+			  "NC", /* GPIO_130 */
+			  "DVDT_ENABLE",
+			  "ACCEL_INT",
+			  "NC",
+			  "MAG_INT_N",
+			  "NC",
+			  "FORCED_USB_BOOT",
+			  "NC",
+			  "NC",
+			  "HW_ID_1",
+			  "NC", /* GPIO_140 */
+			  "NC",
+			  "NC",
+			  "CODEC_RST_N",
+			  "CDC_SPI_MISO",
+			  "CDC_SPI_MOSI",
+			  "CDC_SPI_SCLK",
+			  "CDC_SPI_CS_N",
+			  "NC",
+			  "LPASS_SLIMBUS_CLK",
+			  "LPASS_SLIMBUS_DATA0", /* GPIO_150 */
+			  "LPASS_SLIMBUS_DATA1",
+			  "USB_AUDIO_EN2",
+			  "BT_FM_SLIMBUS_DATA",
+			  "BT_FM_SLIMBUS_CLK",
+			  "COMPASS_I2C_SDA",
+			  "COMPASS_I2C_SCL",
+			  "SSC_SPI_1_MISO",
+			  "SSC_SPI_1_MOSI",
+			  "SSC_SPI_1_CLK",
+			  "SSC_SPI_1_CS_N", /* GPIO_160 */
+			  "SSC_SENSOR_I2C_SDA",
+			  "SSC_SENSOR_I2C_SCL",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "SSC_UART_1_TX",
+			  "SSC_UART_1_RX",
+			  "WL_CMD_CLK_CHAIN0",
+			  "WL_CMD_DATA_CHAIN0", /* GPIO_170 */
+			  "WL_CMD_CLK_CHAIN1",
+			  "WL_CMD_DATA_CHAIN1",
+			  "WL_BT_COEX_CLK",
+			  "WL_BT_COEX_DATA";
 };
 
 &uart2 {

-- 
2.40.0

