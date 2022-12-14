Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F2164CEB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 18:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237658AbiLNRNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 12:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237963AbiLNRNf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 12:13:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAD128719
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671037923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wGzNrd9cHTVZR3qKpPDKVgr46mZSxiCfmWSct1f/p6o=;
        b=MJFrW9KX6Uu/UVQQM5NX2edX122AAj9v8aOIggaGRDTRbiP7juSA+zjjBPMe3dbMdZHi6C
        /Jkp0ab4JBbXn0aYS95h5bVlCjSuexkRQRTxcbcaBFigCArhS6ejFTgZFW5TlwgPHHyk54
        /G7tXfYD1uSwFrYFocze7LKnkhHJjV4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-NE8ffWQMPsSbVujdrqZbHA-1; Wed, 14 Dec 2022 12:12:03 -0500
X-MC-Unique: NE8ffWQMPsSbVujdrqZbHA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-36810cfa61fso4824707b3.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 09:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGzNrd9cHTVZR3qKpPDKVgr46mZSxiCfmWSct1f/p6o=;
        b=BQ/35cFaI9oUsm+vrynzLBQCDZMWXk2ODW+p+rQblkOJzmkLsH6YuuX+0iASK28nMg
         cy91fBpo7PO+JrINbU6PSaHXfElydCeKqS6CiLt/xamA3VAq1OKTJ8NPKilgaPDjPsu6
         gEYaaRi7ObbgHMwFacMAH0ueW+PoCdVkSl6Tiiph+2j6a50e+Nu4yny1thnWletOah8+
         G6iqC61Uy628hPahoegU8IdkmfLOL21SwWOacDPB4eSI0csDeS9D/jd/BY/dP8TkUykE
         BGtIPJv/P5Bllw93nivVHclXjUMEg7q9COSAuovRj8o2+PHuXtNiNux9LU+TpM6FAkph
         wQlQ==
X-Gm-Message-State: ANoB5pmAJNC+xlMFCMqibUvCfNO7l7bHwtDqpicvlknCErek48lkF0sT
        v5XV3YkHA6cdwLSw9wWoCPpAA6Af/aBreA6mt178wc31foqBu7QF7xYR8/FotZmxlUytGWK3Kg/
        U6bK2T/qeoC+VBhG8ocucOhKdrQ==
X-Received: by 2002:a05:7500:2d3:b0:ea:80e1:4bca with SMTP id i19-20020a05750002d300b000ea80e14bcamr3251833gai.27.1671037921905;
        Wed, 14 Dec 2022 09:12:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Xqzgq1xYXVyYWkrC7Qt86MNHLejECkmNLTH7/ZmDIhQ+buRpFm+SApvUvLXIgJIKI82SV/g==
X-Received: by 2002:a05:7500:2d3:b0:ea:80e1:4bca with SMTP id i19-20020a05750002d300b000ea80e14bcamr3251777gai.27.1671037921173;
        Wed, 14 Dec 2022 09:12:01 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id t30-20020a37ea1e000000b006eef13ef4c8sm10305477qkj.94.2022.12.14.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 09:12:00 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com
Subject: [PATCH v2 3/7] arm64: dts: qcom: sc8280xp: rename qup0_i2c4 to i2c4
Date:   Wed, 14 Dec 2022 12:11:41 -0500
Message-Id: <20221214171145.2913557-4-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214171145.2913557-1-bmasney@redhat.com>
References: <20221214171145.2913557-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for adding the missing SPI and I2C nodes to
sc8280xp.dtsi, it was decided to rename all of the existing qupX_
uart, spi, and i2c nodes to drop the qupX_ prefix. Let's go ahead
and rename qup0_i2c4 to i2c4. Note that some nodes are moved in the
file by this patch to preserve the expected sort order in the file.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Link: https://lore.kernel.org/lkml/20221212182314.1902632-1-bmasney@redhat.com/
---
This is a new patch that's introduced in v2.

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 58 +++++++++----------
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 58 +++++++++----------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  2 +-
 3 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 0de1bdb68e2c..c37a9d93a2a8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -228,6 +228,27 @@ vreg_l9d: ldo9 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_default>;
+
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
+		vdd-supply = <&vreg_misc_3p3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts0_default>;
+	};
+};
+
 &i2c21 {
 	clock-frequency = <400000>;
 
@@ -334,27 +355,6 @@ &qup0 {
 	status = "okay";
 };
 
-&qup0_i2c4 {
-	clock-frequency = <400000>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&qup0_i2c4_default>;
-
-	status = "okay";
-
-	touchscreen@10 {
-		compatible = "hid-over-i2c";
-		reg = <0x10>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
-		vdd-supply = <&vreg_misc_3p3>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&ts0_default>;
-	};
-};
-
 &qup1 {
 	status = "okay";
 };
@@ -494,6 +494,14 @@ hastings_reg_en: hastings-reg-en-state {
 &tlmm {
 	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
+	i2c4_default: i2c4-default-state {
+		pins = "gpio171", "gpio172";
+		function = "qup4";
+
+		bias-disable;
+		drive-strength = <16>;
+	};
+
 	i2c21_default: i2c21-default-state {
 		pins = "gpio81", "gpio82";
 		function = "qup21";
@@ -598,14 +606,6 @@ wake-n-pins {
 		};
 	};
 
-	qup0_i2c4_default: qup0-i2c4-default-state {
-		pins = "gpio171", "gpio172";
-		function = "qup4";
-
-		bias-disable;
-		drive-strength = <16>;
-	};
-
 	tpad_default: tpad-default-state {
 		int-n-pins {
 			pins = "gpio182";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d7af2040cbcb..ec06b6216408 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -282,6 +282,28 @@ vreg_l9d: ldo9 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_default>;
+
+	status = "okay";
+
+	/* FIXME: verify */
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
+		vdd-supply = <&vreg_misc_3p3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts0_default>;
+	};
+};
+
 &i2c21 {
 	clock-frequency = <400000>;
 
@@ -554,28 +576,6 @@ &qup0 {
 	status = "okay";
 };
 
-&qup0_i2c4 {
-	clock-frequency = <400000>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&qup0_i2c4_default>;
-
-	status = "okay";
-
-	/* FIXME: verify */
-	touchscreen@10 {
-		compatible = "hid-over-i2c";
-		reg = <0x10>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
-		vdd-supply = <&vreg_misc_3p3>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&ts0_default>;
-	};
-};
-
 &qup1 {
 	status = "okay";
 };
@@ -698,6 +698,13 @@ hall_int_n_default: hall-int-n-state {
 		bias-disable;
 	};
 
+	i2c4_default: i2c4-default-state {
+		pins = "gpio171", "gpio172";
+		function = "qup4";
+		bias-disable;
+		drive-strength = <16>;
+	};
+
 	i2c21_default: i2c21-default-state {
 		pins = "gpio81", "gpio82";
 		function = "qup21";
@@ -801,13 +808,6 @@ wake-n-pins {
 		};
 	};
 
-	qup0_i2c4_default: qup0-i2c4-default-state {
-		pins = "gpio171", "gpio172";
-		function = "qup4";
-		bias-disable;
-		drive-strength = <16>;
-	};
-
 	tpad_default: tpad-default-state {
 		int-n-pins {
 			pins = "gpio182";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 929365cff555..f1111cd7f679 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -858,7 +858,7 @@ qup0: geniqup@9c0000 {
 
 			status = "disabled";
 
-			qup0_i2c4: i2c@990000 {
+			i2c4: i2c@990000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00990000 0 0x4000>;
 				clock-names = "se";
-- 
2.38.1

