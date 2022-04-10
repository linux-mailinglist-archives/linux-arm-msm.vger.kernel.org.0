Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A79734FAFED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Apr 2022 21:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241874AbiDJUAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 16:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241871AbiDJUAl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 16:00:41 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD2127CC7
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649620708;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=lariGe15ffChJw5ninp2M9SlMA0vagWBeEgnfxRpd2Y=;
    b=osoK8XtLwR4/rQNuzm0tU10Wcuejj5AXnezUF4Bt7R3AoN35Vk+WmfJVvA1iXPjLz9
    1x7PTlOz64ZK8CWk5QsjoouFwaoknMETHOU0KbmtNoiwLQSCndcLj4IUH41Y0Ff4BG2z
    hod772pVSAgf+iKvRMgtwCMrDMZrJH8jMQHmizXa7UaqHwkYAQSXAbM6SmX5A70GaN6b
    or5sphKsThdpEEZDIDk9lRXLzbrd1H6EeUu3IG4SSPJfCqky2p09/LwRJ24ZBp0qDbFL
    ylpj2ti6K16QAn+9APj7whccxC92vbyH98ADKK9WGmIZ/u3TrqhS8wbKj1UIgBU/pRWE
    q2Tg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL/b+s="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.42.2 AUTH)
    with ESMTPSA id u05e50y3AJwRAOr
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 10 Apr 2022 21:58:27 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8916-huawei-g7: Add sound card
Date:   Sun, 10 Apr 2022 21:51:13 +0200
Message-Id: <20220410195113.13646-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410195113.13646-1-stephan@gerhold.net>
References: <20220410195113.13646-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The huawei-g7 uses the msm8916-wcd-digital/analog audio codecs similar
to apq8016-sbc, so we can mostly copy paste it from there to make audio
work correctly. The main difference is the hphl-jack-type-normally-open
property, which is needed to avoid inverted audio jack detection.

Note that at least on my device the jack detection is not fully
reliable: sometimes headphones are detected as headsets (with
microphone). However, this is not a big problem for typical usage.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index 8ad9eb436a0c..00488afb413d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/apq8016-lpass.h>
 
 /*
  * Note: The original firmware from Huawei can only boot 32-bit kernels.
@@ -211,6 +212,10 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&lpass {
+	status = "okay";
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
@@ -255,6 +260,40 @@ &sdhc_2 {
 	cd-gpios = <&msmgpio 56 GPIO_ACTIVE_LOW>;
 };
 
+&sound {
+	status = "okay";
+
+	model = "msm8916";
+	audio-routing =
+		"AMIC1", "MIC BIAS External1",
+		"AMIC2", "MIC BIAS External2",
+		"AMIC3", "MIC BIAS External1";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&cdc_pdm_lines_act>;
+	pinctrl-1 = <&cdc_pdm_lines_sus>;
+
+	primary-dai-link {
+		link-name = "WCD";
+		cpu {
+			sound-dai = <&lpass MI2S_PRIMARY>;
+		};
+		codec {
+			sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+		};
+	};
+
+	tertiary-dai-link {
+		link-name = "WCD-Capture";
+		cpu {
+			sound-dai = <&lpass MI2S_TERTIARY>;
+		};
+		codec {
+			sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
+		};
+	};
+};
+
 &usb {
 	status = "okay";
 	extcon = <&usb_id>, <&usb_id>;
@@ -264,6 +303,13 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&wcd_codec {
+	qcom,micbias-lvl = <2800>;
+	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
+	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
+	qcom,hphl-jack-type-normally-open;
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
-- 
2.35.1

