Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C9D642D35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 17:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbiLEQkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 11:40:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbiLEQjY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 11:39:24 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F0420353
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 08:38:09 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id b2so29186510eja.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 08:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH0W6Q+n5Go7kNaJjIz/J403hZWvc6cemePnkkWb/v0=;
        b=dZ4M1LL8Op3l+Rb8bBfN0q3fnNSQREE29DUO9Src6RwketawSB+KCCxWmTz1XoEeIM
         7IkHQFGPFjOhFQQsWIH+nij37ov6ACjsk+PksuLwcZecwF3I0PI2F21jOvSP2KhYHven
         A8se9P304w8a4t+ahScyVp+u5BFw+zD16CNnrpt1iZQ85wEyyt+ebDGmfqDwy5zVF/5m
         Sx/Bk8CkBgRij32jE9azfx+0UD+GJvh8cGUpUPDyGGP0Esmhakl/67RqS1hroDNQZWIU
         uarwxX/J0oTWzJ0c/9CLImURo8hpkgkMT2IKwxyeiS8NJ5e0nGBhiKGKwnOSpp6mPWvw
         5hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tH0W6Q+n5Go7kNaJjIz/J403hZWvc6cemePnkkWb/v0=;
        b=8C8Iu5jDFWaQfVt6Svi0OvcU3bCufR7Wp3VGCuJYH73dMti/WTpqPhzw+ybUmmrFC2
         Vui1zrZg1fbhHGVuwlymKxc4lMdEgpRv1uNm+mCkOL6olX2wB5cFKKLOEdouMdWTmdsr
         ZKstT99rKCEfzsq2GBS5bx0HTEyMVCZsfG4yvwNyCgEer8xMdEX/MC6TJ2IGfw5MTZSE
         qsftrlJ5BM8C3RBF14GF5yX9sWjUw5WhF4OcA68jXT1zj7Wa56+r8D9lt/YU1Xqv6T12
         a9JLoRx03OLR0ZErkVtixSJg1DimWGABLq6zOAG9ip7rGLw67nunxZfURf9dZdXGWNHN
         A/Cg==
X-Gm-Message-State: ANoB5plIUyW1bWZvlM2B/klrA5MyRnUtoTm7SzztWa5YXI1QctdBl0+7
        UalwzscT4tNp5VY4ypftICmiOA==
X-Google-Smtp-Source: AA0mqf75RDx/GQjdWXXRJAAYmDg1BAnjFPqibz4mqRABC7pDEDjOLBigXiI2VW5EKb4pvAFS4zlvvw==
X-Received: by 2002:a17:906:5055:b0:78d:cdce:bc52 with SMTP id e21-20020a170906505500b0078dcdcebc52mr56413954ejk.469.1670258289023;
        Mon, 05 Dec 2022 08:38:09 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de. [95.88.243.100])
        by smtp.gmail.com with ESMTPSA id e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:38:08 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
        robert.foss@linaro.org, loic.poulain@linaro.org,
        swboyd@chromium.org, quic_vpolimer@quicinc.com, vkoul@kernel.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
        quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v3 06/11] arm64: dts: qcom: sm8350: Add &tlmm gpio-line-names
Date:   Mon,  5 Dec 2022 17:37:49 +0100
Message-Id: <20221205163754.221139-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205163754.221139-1-robert.foss@linaro.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add GPIO line names as described by the sm8350-hdk schematic.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 205 ++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 0fcf5bd88fc7..e6deb08c6da0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -233,6 +233,211 @@ &slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <52 8>;
+
+	gpio-line-names =
+		"APPS_I2C_SDA", /* GPIO_0 */
+		"APPS_I2C_SCL",
+		"FSA_INT_N",
+		"USER_LED3_EN",
+		"SMBUS_SDA_1P8",
+		"SMBUS_SCL_1P8",
+		"2M2_3P3_EN",
+		"ALERT_DUAL_M2_N",
+		"EXP_UART_CTS",
+		"EXP_UART_RFR",
+		"EXP_UART_TX", /* GPIO_10 */
+		"EXP_UART_RX",
+		"NC",
+		"NC",
+		"RCM_MARKER1",
+		"WSA0_EN",
+		"CAM1_RESET_N",
+		"CAM0_RESET_N",
+		"DEBUG_UART_TX",
+		"DEBUG_UART_RX",
+		"TS_I2C_SDA", /* GPIO_20 */
+		"TS_I2C_SCL",
+		"TS_RESET_N",
+		"TS_INT_N",
+		"DISP0_RESET_N",
+		"DISP1_RESET_N",
+		"ETH_RESET",
+		"RCM_MARKER2",
+		"CAM_DC_MIPI_MUX_EN",
+		"CAM_DC_MIPI_MUX_SEL",
+		"AFC_PHY_TA_D_PLUS", /* GPIO_30 */
+		"AFC_PHY_TA_D_MINUS",
+		"PM8008_1_IRQ",
+		"PM8008_1_RESET_N",
+		"PM8008_2_IRQ",
+		"PM8008_2_RESET_N",
+		"CAM_DC_I3C_SDA",
+		"CAM_DC_I3C_SCL",
+		"FP_INT_N",
+		"FP_WUHB_INT_N",
+		"SMB_SPMI_DATA", /* GPIO_40 */
+		"SMB_SPMI_CLK",
+		"USB_HUB_RESET",
+		"FORCE_USB_BOOT",
+		"LRF_IRQ",
+		"NC",
+		"IMU2_INT",
+		"HDMI_3P3_EN",
+		"HDMI_RSTN",
+		"HDMI_1P2_EN",
+		"HDMI_INT", /* GPIO_50 */
+		"USB1_ID",
+		"FP_SPI_MISO",
+		"FP_SPI_MOSI",
+		"FP_SPI_CLK",
+		"FP_SPI_CS_N",
+		"NFC_ESE_SPI_MISO",
+		"NFC_ESE_SPI_MOSI",
+		"NFC_ESE_SPI_CLK",
+		"NFC_ESE_SPI_CS",
+		"NFC_I2C_SDA", /* GPIO_60 */
+		"NFC_I2C_SCLC",
+		"NFC_EN",
+		"NFC_CLK_REQ",
+		"HST_WLAN_EN",
+		"HST_BT_EN",
+		"HST_SW_CTRL",
+		"NC",
+		"HST_BT_UART_CTS",
+		"HST_BT_UART_RFR",
+		"HST_BT_UART_TX", /* GPIO_70 */
+		"HST_BT_UART_RX",
+		"CAM_DC_SPI0_MISO",
+		"CAM_DC_SPI0_MOSI",
+		"CAM_DC_SPI0_CLK",
+		"CAM_DC_SPI0_CS_N",
+		"CAM_DC_SPI1_MISO",
+		"CAM_DC_SPI1_MOSI",
+		"CAM_DC_SPI1_CLK",
+		"CAM_DC_SPI1_CS_N",
+		"HALL_INT_N", /* GPIO_80 */
+		"USB_PHY_PS",
+		"MDP_VSYNC_P",
+		"MDP_VSYNC_S",
+		"ETH_3P3_EN",
+		"RADAR_INT",
+		"NFC_DWL_REQ",
+		"SM_GPIO_87",
+		"WCD_RESET_N",
+		"ALSP_INT_N",
+		"PRESS_INT", /* GPIO_90 */
+		"SAR_INT_N",
+		"SD_CARD_DET_N",
+		"NC",
+		"PCIE0_RESET_N",
+		"PCIE0_CLK_REQ_N",
+		"PCIE0_WAKE_N",
+		"PCIE1_RESET_N",
+		"PCIE1_CLK_REQ_N",
+		"PCIE1_WAKE_N",
+		"CAM_MCLK0", /* GPIO_100 */
+		"CAM_MCLK1",
+		"CAM_MCLK2",
+		"CAM_MCLK3",
+		"CAM_MCLK4",
+		"CAM_MCLK5",
+		"CAM2_RESET_N",
+		"CCI_I2C0_SDA",
+		"CCI_I2C0_SCL",
+		"CCI_I2C1_SDA",
+		"CCI_I2C1_SCL", /* GPIO_110 */
+		"CCI_I2C2_SDA",
+		"CCI_I2C2_SCL",
+		"CCI_I2C3_SDA",
+		"CCI_I2C3_SCL",
+		"CAM5_RESET_N",
+		"CAM4_RESET_N",
+		"CAM3_RESET_N",
+		"IMU1_INT",
+		"MAG_INT_N",
+		"MI2S2_I2S_SCK", /* GPIO_120 */
+		"MI2S2_I2S_DAT0",
+		"MI2S2_I2S_WS",
+		"HIFI_DAC_I2S_MCLK",
+		"MI2S2_I2S_DAT1",
+		"HIFI_DAC_I2S_SCK",
+		"HIFI_DAC_I2S_DAT0",
+		"NC",
+		"HIFI_DAC_I2S_WS",
+		"HST_BT_WLAN_SLIMBUS_CLK",
+		"HST_BT_WLAN_SLIMBUS_DAT0", /* GPIO_130 */
+		"BT_LED_EN",
+		"WLAN_LED_EN",
+		"NC",
+		"NC",
+		"NC",
+		"UIM2_PRESENT",
+		"NC",
+		"NC",
+		"NC",
+		"UIM1_PRESENT", /* GPIO_140 */
+		"NC",
+		"SM_RFFE0_DATA",
+		"NC",
+		"SM_RFFE1_DATA",
+		"SM_MSS_GRFC4",
+		"SM_MSS_GRFC5",
+		"SM_MSS_GRFC6",
+		"SM_MSS_GRFC7",
+		"SM_RFFE4_CLK",
+		"SM_RFFE4_DATA", /* GPIO_150 */
+		"WLAN_COEX_UART1_RX",
+		"WLAN_COEX_UART1_TX",
+		"HST_SW_CTRL",
+		"DSI0_STATUS",
+		"DSI1_STATUS",
+		"APPS_PBL_BOOT_SPEED_1",
+		"APPS_BOOT_FROM_ROM",
+		"APPS_PBL_BOOT_SPEED_0",
+		"QLINK0_REQ",
+		"QLINK0_EN", /* GPIO_160 */
+		"QLINK0_WMSS_RESET_N",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"WCD_SWR_TX_CLK",
+		"WCD_SWR_TX_DATA0",
+		"WCD_SWR_TX_DATA1", /* GPIO_170 */
+		"WCD_SWR_RX_CLK",
+		"WCD_SWR_RX_DATA0",
+		"WCD_SWR_RX_DATA1",
+		"DMIC01_CLK",
+		"DMIC01_DATA",
+		"DMIC23_CLK",
+		"DMIC23_DATA",
+		"WSA_SWR_CLK",
+		"WSA_SWR_DATA",
+		"DMIC45_CLK", /* GPIO_180 */
+		"DMIC45_DATA",
+		"WCD_SWR_TX_DATA2",
+		"SENSOR_I3C_SDA",
+		"SENSOR_I3C_SCL",
+		"CAM_OIS0_I3C_SDA",
+		"CAM_OIS0_I3C_SCL",
+		"IMU_SPI_MISO",
+		"IMU_SPI_MOSI",
+		"IMU_SPI_CLK",
+		"IMU_SPI_CS_N", /* GPIO_190 */
+		"MAG_I2C_SDA",
+		"MAG_I2C_SCL",
+		"SENSOR_I2C_SDA",
+		"SENSOR_I2C_SCL",
+		"RADAR_SPI_MISO",
+		"RADAR_SPI_MOSI",
+		"RADAR_SPI_CLK",
+		"RADAR_SPI_CS_N",
+		"HST_BLE_UART_TX",
+		"HST_BLE_UART_RX", /* GPIO_200 */
+		"HST_WLAN_UART_TX",
+		"HST_WLAN_UART_RX";
 };
 
 &uart2 {
-- 
2.34.1

