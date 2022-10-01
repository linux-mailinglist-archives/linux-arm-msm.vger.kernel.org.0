Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 423D75F1EC1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 20:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiJAS4n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 14:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiJAS4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 14:56:43 -0400
X-Greylist: delayed 192 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 01 Oct 2022 11:56:41 PDT
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94572EF0D;
        Sat,  1 Oct 2022 11:56:41 -0700 (PDT)
Received: from TimeMachine.lan (adsl-dyn13.78-99-1.t-com.sk [78.99.1.13])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id F337B202E4;
        Sat,  1 Oct 2022 20:56:39 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
To:     martin.botka1@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jami Kettunen <jamipkettunen@somainline.org>,
        Paul Bouchara <paul.bouchara@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm6125: Add i2c and SPI pin configuration
Date:   Sat,  1 Oct 2022 20:56:27 +0200
Message-Id: <20221001185628.494884-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds configuration for I2C and SPI
pins used in SM6125 SoC

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 547 +++++++++++++++++++++++++++
 1 file changed, 547 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 85c52b64522e..350713742ccd 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -445,6 +445,553 @@ data {
 					bias-pull-up;
 				};
 			};
+
+			/* qup_0 SE mappings */
+			/* SE 0 pin mappings */
+			qup_i2c0_default: qup-i2c0-default {
+				mux {
+					pins = "gpio0", "gpio1";
+					function = "qup00";
+				};
+
+				config {
+					pins = "gpio0", "gpio1";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+			qup_i2c0_sleep: qup-i2c0-sleep {
+				mux {
+					pins = "gpio0", "gpio1";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio0", "gpio1";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			/* SE 1 pin mappings */
+			qup_i2c1_default: qup-i2c1-default {
+				mux {
+					pins = "gpio4", "gpio5";
+					function = "qup01";
+				};
+
+				config {
+					pins = "gpio4", "gpio5";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+			qup_i2c1_sleep: qup-i2c1-sleep {
+				mux {
+					pins = "gpio4", "gpio5";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio4", "gpio5";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			/* SE 2 pin mappings */
+			qup_i2c2_default: qup-i2c2-default {
+				mux {
+					pins = "gpio6", "gpio7";
+					function = "qup02";
+				};
+
+				config {
+					pins = "gpio6", "gpio7";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+			qup_i2c2_sleep: qup-i2c2-sleep {
+				mux {
+					pins = "gpio6", "gpio7";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio6", "gpio7";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			/* SE 3 pin mappings */
+			qup_i2c3_default: qup-i2c3-default {
+				mux {
+						pins = "gpio14", "gpio15";
+						function = "qup03";
+				};
+
+				config {
+						pins = "gpio14", "gpio15";
+						drive-strength = <2>;
+						bias-disable;
+				};
+			};
+
+			qup_i2c3_sleep: qup-i2c3-sleep {
+				mux {
+						pins = "gpio14", "gpio15";
+						function = "gpio";
+				};
+
+				config {
+						pins = "gpio14", "gpio15";
+						drive-strength = <2>;
+						bias-pull-up;
+				};
+			};
+
+			/* SE 4 pin mappings */
+			qup_i2c4_default: qup-i2c4-default {
+				mux {
+						pins = "gpio16", "gpio17";
+						function = "qup04";
+				};
+
+				config {
+						pins = "gpio16", "gpio17";
+						drive-strength = <2>;
+						bias-disable;
+				};
+			};
+
+			qup_i2c4_sleep: qup-i2c4-sleep {
+				mux {
+						pins = "gpio16", "gpio17";
+						function = "gpio";
+				};
+
+				config {
+						pins = "gpio16", "gpio17";
+						drive-strength = <2>;
+						bias-pull-up;
+				};
+			};
+
+			/*qup_1 SE mappings */
+			/* SE 5 pin mappings */
+			qup_i2c5_default: qup-i2c5-default {
+				mux {
+						pins = "gpio22", "gpio23";
+						function = "qup10";
+				};
+
+				config {
+						pins = "gpio22", "gpio23";
+						drive-strength = <2>;
+						bias-disable;
+				};
+			};
+
+			qup_i2c5_sleep: qup-i2c5-sleep {
+				mux {
+						pins = "gpio22", "gpio23";
+						function = "gpio";
+				};
+
+				config {
+						pins = "gpio22", "gpio23";
+						drive-strength = <2>;
+						bias-pull-up;
+				};
+			};
+
+			/* SE 6 pin mappings */
+			qup_i2c6_default: qup-i2c6-default {
+				mux {
+						pins = "gpio30", "gpio31";
+						function = "qup11";
+				};
+
+				config {
+						pins = "gpio30", "gpio31";
+						drive-strength = <2>;
+						bias-disable;
+				};
+			};
+
+			qup_i2c6_sleep: qup-i2c6-sleep {
+				mux {
+						pins = "gpio30", "gpio31";
+						function = "gpio";
+				};
+
+				config {
+						pins = "gpio30", "gpio31";
+						drive-strength = <2>;
+						bias-pull-up;
+				};
+			};
+
+			/* SE 7 pin mappings */
+			qup_i2c7_default: qup-i2c7-default {
+				mux {
+						pins = "gpio28", "gpio29";
+						function = "qup12";
+				};
+
+				config {
+						pins = "gpio28", "gpio29";
+						drive-strength = <2>;
+						bias-disable;
+				};
+			};
+
+			qup_i2c7_sleep: qup-i2c7-sleep {
+				mux {
+						pins = "gpio28", "gpio29";
+						function = "gpio";
+				};
+
+				config {
+						pins = "gpio28", "gpio29";
+						drive-strength = <2>;
+						bias-pull-up;
+				};
+			};
+
+			/* SE 8 pin mappings */
+			qup_i2c8_default: qup-i2c8-default {
+				mux {
+						pins = "gpio18", "gpio19";
+						function = "qup13";
+				};
+
+				config {
+						pins = "gpio18", "gpio19";
+						drive-strength = <2>;
+						bias-disable;
+				};
+			};
+
+			qup_i2c8_sleep: qup-i2c8-sleep {
+				mux {
+						pins = "gpio18", "gpio19";
+						function = "gpio";
+				};
+
+				config {
+						pins = "gpio18", "gpio19";
+						drive-strength = <2>;
+						bias-pull-up;
+				};
+			};
+
+			/* SE 9 pin mappings */
+			qup_i2c9_default: qup-i2c9-default {
+				mux {
+						pins = "gpio10", "gpio11";
+						function = "qup14";
+				};
+
+				config {
+						pins = "gpio10", "gpio11";
+						drive-strength = <2>;
+						bias-disable;
+				};
+			};
+
+			qup_i2c9_sleep: qup-i2c9-sleep {
+				mux {
+						pins = "gpio10", "gpio11";
+						function = "gpio";
+				};
+
+				config {
+						pins = "gpio10", "gpio11";
+						drive-strength = <2>;
+						bias-pull-up;
+				};
+			};
+
+			qup_se3_rx: qup-se3-rx {
+				mux {
+					pins = "gpio15";
+					function = "qup03";
+				};
+
+				config {
+					pins = "gpio15";
+					drive-strength = <2>;
+					bias-no-pull;
+				};
+			};
+
+			qup_se3_tx: qup-se6-tx {
+				mux {
+					pins = "gpio14";
+					function = "qup03";
+				};
+
+				config {
+					pins = "gpio14";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			qup_se4_2uart_default: qup-se4-2uart-default {
+				mux {
+					pins = "gpio16", "gpio17";
+					function = "qup04";
+				};
+
+				config {
+						pins = "gpio16", "gpio17";
+						drive-strength = <2>;
+						bias-disable;
+				};
+			};
+
+			qup_se4_2uart_sleep: qup-se4-2uart-sleep {
+				mux {
+						pins = "gpio16", "gpio17";
+						function = "gpio";
+				};
+
+				config {
+						pins = "gpio16", "gpio17";
+						drive-strength = <2>;
+						bias-pull-down;
+				};
+			};
+
+			qup_se9_ctsrx: qup-se9-ctsrx {
+				mux {
+					pins = "gpio10", "gpio13";
+					function = "qup14";
+				};
+
+				config {
+					pins = "gpio10", "gpio13";
+					drive-strength = <2>;
+					bias-no-pull;
+				};
+			};
+
+			qup_se9_rts: qup-se9-rts {
+				mux {
+					pins = "gpio11";
+					function = "qup14";
+				};
+
+				config {
+					pins = "gpio11";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			qup_se9_tx: qup-se9-tx {
+				mux {
+					pins = "gpio12";
+					function = "qup14";
+				};
+
+				config {
+					pins = "gpio12";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			/* SPI Instances */
+			/* SE 0 pin mappings */
+			qup_spi0_default: qup-spi0-default {
+				mux {
+					pins = "gpio0", "gpio1", "gpio2",
+								"gpio3";
+					function = "qup00";
+				};
+
+				config {
+					pins = "gpio0", "gpio1", "gpio2",
+								"gpio3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi0_sleep: qup-spi0-sleep {
+				mux {
+					pins = "gpio0", "gpio1", "gpio2",
+								"gpio3";
+					function = "gpio";
+				};
+
+				configs {
+					pins = "gpio0", "gpio1", "gpio2",
+								"gpio3";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			/* SE 2 pin mappings */
+			qup_spi2_default: qup-spi2-default {
+				mux {
+					pins = "gpio6", "gpio7", "gpio8",
+								"gpio9";
+					function = "qup02";
+				};
+
+				config {
+					pins = "gpio6", "gpio7", "gpio8",
+								"gpio9";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi2_sleep: qup-spi2-sleep {
+				mux {
+					pins = "gpio6", "gpio7", "gpio8",
+								"gpio9";
+					function = "gpio";
+				};
+
+				configs {
+					pins = "gpio6", "gpio7", "gpio8",
+								"gpio9";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			/* SE 5 pin mappings */
+			qup_spi5_default: qup-spi5-default {
+				mux {
+					pins = "gpio22", "gpio23", "gpio24",
+								"gpio25";
+					function = "qup10";
+				};
+
+				config {
+					pins = "gpio22", "gpio23", "gpio24",
+								"gpio25";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi5_sleep: qup-spi5-sleep {
+				mux {
+					pins = "gpio22", "gpio23", "gpio24",
+								"gpio25";
+					function = "gpio";
+				};
+
+				configs {
+					pins = "gpio22", "gpio23", "gpio24",
+								"gpio25";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			/* SE 6 pin mappings */
+			qup_spi6_default: qup-spi6-default {
+				mux {
+					pins = "gpio30", "gpio31", "gpio32",
+								"gpio33";
+					function = "qup11";
+				};
+
+				config {
+					pins = "gpio30", "gpio31", "gpio32",
+								"gpio33";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi6_sleep: qup-spi6-sleep {
+				mux {
+					pins = "gpio30", "gpio31", "gpio32",
+								"gpio33";
+					function = "gpio";
+				};
+
+				configs {
+					pins = "gpio30", "gpio31", "gpio32",
+								"gpio33";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			/* SE 8 pin mappings */
+			qup_spi8_default: qup-spi8-default {
+				mux {
+					pins = "gpio18", "gpio19", "gpio20",
+								"gpio21";
+					function = "qup13";
+				};
+
+				config {
+					pins = "gpio18", "gpio19", "gpio20",
+								"gpio21";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi8_sleep: qup-spi8-sleep {
+				mux {
+					pins = "gpio18", "gpio19", "gpio20",
+								"gpio21";
+					function = "gpio";
+				};
+
+				configs {
+					pins = "gpio18", "gpio19", "gpio20",
+								"gpio21";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			/* SE 9 pin mappings */
+			qup_spi9_default: qup-spi9-default {
+				mux {
+					pins = "gpio10", "gpio11", "gpio12",
+								"gpio13";
+					function = "qup_14";
+				};
+
+				config {
+					pins = "gpio10", "gpio11", "gpio12",
+								"gpio13";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
+
+			qup_spi9_sleep: qup-spi9-sleep {
+				mux {
+					pins = "gpio10", "gpio11", "gpio12",
+								"gpio13";
+					function = "gpio";
+				};
+
+				configs {
+					pins = "gpio10", "gpio11", "gpio12",
+								"gpio13";
+					drive-strength = <6>;
+					bias-disable;
+				};
+			};
 		};
 
 		gcc: clock-controller@1400000 {
-- 
2.37.3

