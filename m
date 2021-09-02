Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0616A3FF760
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 00:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348507AbhIBWsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 18:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348323AbhIBWsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 18:48:46 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F70C061575
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Sep 2021 15:47:47 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 8so3572382pga.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Sep 2021 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jy5ANyWb/YcsFMt8C4Et+c6YxLRytJdAR1KKLj19Z3s=;
        b=UfgKb8qxp9a5x/tN93DBp6cPxbGhMDB+zOi3444jB2OxZCm+weqtFmT0Qp0vVvuy1g
         C/486g65I0H95AVs90kY1+s0oYH7d5nvzC9v8xkgA5vGdyLO2GtYDDfLTWjDDBpbtX3o
         DJw0sYlPuSR3DS4dfW7kLZSAwhJaHWZyvPusI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jy5ANyWb/YcsFMt8C4Et+c6YxLRytJdAR1KKLj19Z3s=;
        b=qgfOaMp0Vwck7QDg96GEpQWBmGEOXoJ0xcN0ISm7CBVvkVvg9zpQWFj/CIYoaJ7ljx
         rEhCqtn1CQy2jgJ9kAlFbDUmJxmEjKfoL6EnWkOd7391+Ba35v+Plr/9gwPGAtLoXrVJ
         I6JAVR+Obs5IJcs2vy18u1j48i9hiYeVVwCxLFkY2c0gc0xsBUg1GtQIE/ue8Cly24IK
         r8PcF16qqvgEzYjv27Shc7aQgIQpi+mSQqny0u4jOMTWE4meEhpM2IMI71cmTeyTePO+
         aMsm6Eo+rvtfuflXTT1vVP08qWKxCMCkhVNaojPDBQ7FqytwSAFpGDtqj4lgOumrjILk
         5xdw==
X-Gm-Message-State: AOAM530W60JK9V99NsdzPUj2DabDecWd9W5ZJApgFswjJapSeK0QCCnp
        M+PtraEcdFwFKwT+o92rBim4fPdxm7movw==
X-Google-Smtp-Source: ABdhPJy+Wb0gJfRDBhYb9HK63RyiYASdFVz6IgbPQFrlQt+oowLxrFCdOCAzIiP1Flu30w7gT+IoOQ==
X-Received: by 2002:a05:6a00:23cf:b0:3e2:4622:da6d with SMTP id g15-20020a056a0023cf00b003e24622da6dmr491338pfc.18.1630622867065;
        Thu, 02 Sep 2021 15:47:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:76ac:d178:a633:4fb5])
        by smtp.gmail.com with UTF8SMTPSA id lw14sm2895715pjb.48.2021.09.02.15.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 15:47:46 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180-trogdor: Delete ADC config for unused thermistors
Date:   Thu,  2 Sep 2021 15:47:44 -0700
Message-Id: <20210902154711.1.I9777d0036ecbb749a4fb9ebb892f94c6e3a51772@changeid>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The charger thermistor on Lazor, CoachZ rev1 and Pompom rev1+2 is
either the wrong part or not stuffed at all, the same is true for
the skin temperature thermistor on CoachZ rev1. The corresponding
thermal zones are already disabled for these devices, in addition
delete the ADC nodes of the thermistors.

For Lazor and CoachZ rev1 also disable the PM6150 ADC thermal
monitor since there are no other temperatures to monitor.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi   | 10 ++++++++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts |  8 ++++++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts |  8 ++++++++
 4 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
index 21b516e0694a..edfcd47e1a00 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
@@ -23,6 +23,18 @@ &charger_thermal {
 	status = "disabled";
 };
 
+&pm6150_adc {
+	/delete-node/ skin-temp-thermistor@4e;
+	/delete-node/ charger-thermistor@4f;
+};
+
+&pm6150_adc_tm {
+	status = "disabled";
+
+	/delete-node/ charger-thermistor@0;
+	/delete-node/ skin-temp-thermistor@1;
+};
+
 /*
  * CoachZ rev1 is stuffed with a 47k NTC as thermistor for skin temperature,
  * which currently is not supported by the PM6150 ADC driver. Disable the
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 00535aaa43c9..57f7b19f83b0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -54,6 +54,16 @@ &panel {
 	compatible = "boe,nv133fhm-n62";
 };
 
+&pm6150_adc {
+	/delete-node/ charger-thermistor@4f;
+};
+
+&pm6150_adc_tm {
+	status = "disabled";
+
+	/delete-node/ charger-thermistor@0;
+};
+
 &trackpad {
 	interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
index e122a6b481ff..76a130bad60a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
@@ -26,6 +26,14 @@ &charger_thermal {
 	status = "disabled";
 };
 
+&pm6150_adc {
+	/delete-node/ charger-thermistor@4f;
+};
+
+&pm6150_adc_tm {
+	/delete-node/ charger-thermistor@0;
+};
+
 &pp3300_hub {
 	/* pp3300_l7c is used to power the USB hub */
 	/delete-property/regulator-always-on;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
index 4f32e6733f4c..88cf2246c18a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
@@ -22,3 +22,11 @@ / {
 &charger_thermal {
 	status = "disabled";
 };
+
+&pm6150_adc {
+	/delete-node/ charger-thermistor@4f;
+};
+
+&pm6150_adc_tm {
+	/delete-node/ charger-thermistor@0;
+};
-- 
2.33.0.153.gba50c8fa24-goog

