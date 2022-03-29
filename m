Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C7B4EB303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 19:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240390AbiC2SB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 14:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240385AbiC2SBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 14:01:25 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F63AF1DF
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 10:59:42 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id jx9so18231094pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9YF6XXQihqxVWO+csSU8c0JrJM+zg+tyEJOkVfyKtEs=;
        b=g7h64b6Y+dJ5cQy8gmrH33sDMO01yUaLnWTj7lzvILDfZ6xXkoSlu229Zli5C7IRQh
         UeyY93QHcjHGKgwO2eTPYfAqMJQJJ4iiC/MGpFYaDLspPD/W/04CjUg23M4bQoY1/7PU
         0V7F8g20MZ79Ij3eaL7rYrHwhqvEDTysDkzj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9YF6XXQihqxVWO+csSU8c0JrJM+zg+tyEJOkVfyKtEs=;
        b=2lDTL3iBkqwkfAXb6jh2bJ1shwGNjgdtNv0iZccUeu9a9g7PIxis+9VvExJsje5GzK
         k/pYUPdCgpR6M9nWWF53AIYaxjZvkoc3HZ1WCqH3VtGb/h7WZJL4HMoIoA9DJEcrbv5r
         yVutKpnevoroEccUFMjzDQD0iziga4MuGFN71AMEvTzTGYqehawiUf2rRr0nBaGg+CTg
         ZOl7UKD8ofujsrkjihrk+K4CeeklW+UoRr7KoCKFZtYYaFnfHjMI2KYJSve706FiFtB2
         EVkN74ycJfFL38ylMdae8n+DKU6SNPh0tmRe87ld5HvFjmas2PMQhlvlAbeF1IqhNlSV
         aK/Q==
X-Gm-Message-State: AOAM533pTwT22m1lUnu1JH3p6gVx+WBpOYpZK/aADtDSq/g6eZHDXop5
        Wrelwty/LjP1/oc8hwjyXfCOaUNPS2hSgA==
X-Google-Smtp-Source: ABdhPJwTr4XgABRQX9wZ76Jc4+pDKE4N2O59jNSTWrdh4Qp85tlIRy47L88ytV187IrIn474tytCZw==
X-Received: by 2002:a17:90a:a58c:b0:1c9:bc35:6ed9 with SMTP id b12-20020a17090aa58c00b001c9bc356ed9mr342930pjq.146.1648576781546;
        Tue, 29 Mar 2022 10:59:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:afbc:b248:b171:4d40])
        by smtp.gmail.com with UTF8SMTPSA id d16-20020a17090ad99000b001bcbc4247a0sm3594255pjv.57.2022.03.29.10.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 10:59:41 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add SAR sensors for herobrine
Date:   Tue, 29 Mar 2022 10:59:33 -0700
Message-Id: <20220329105854.v3.1.Icedb2e3cd5e21f3a4ec535ddf756fa44d053b6ed@changeid>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for the two SX9324 SAR proximity sensors. Not all herobrine
boards have these sensors, so leave them disabled by default.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Depends on 'arm64: dts: qcom: sc7280: Fix sar1_irq_odl node name' [1] for
the second SAR sensor to be probed successfully.

[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/20220324223331.876199-1-swboyd@chromium.org/

Changes in v3:
- added patch to the series

 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index dc17f2079695..812080e6178b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -341,6 +341,43 @@ keyboard_backlight: keyboard-backlight {
 
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
 
+ap_sar_sensor_i2c: &i2c1 {
+	clock-frequency = <400000>;
+	status = "disabled";
+
+	ap_sar_sensor0: proximity@28 {
+		compatible = "semtech,sx9324";
+		reg = <0x28>;
+		#io-channel-cells = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sar0_irq_odl>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <141 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&pp1800_prox>;
+
+		label = "proximity-wifi-lte0";
+		status = "disabled";
+	};
+
+	ap_sar_sensor1: proximity@2c {
+		compatible = "semtech,sx9324";
+		reg = <0x2c>;
+		#io-channel-cells = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sar1_irq_odl>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <140 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&pp1800_prox>;
+
+		label = "proximity-wifi-lte1";
+		status = "disabled";
+	};
+};
+
 ap_i2c_tpm: &i2c14 {
 	status = "okay";
 	clock-frequency = <400000>;
-- 
2.35.1.1021.g381101b075-goog

