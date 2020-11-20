Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E23F2BA3C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 08:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbgKTHpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 02:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727256AbgKTHpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 02:45:10 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7F5C0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 23:45:10 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id j19so6597609pgg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 23:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pgm7gas/67hkSnZPKlx52N7rv2QBjwKGfrcg8IcGCds=;
        b=gpAt9BQA9pI0gT8fyq9674Mg5U98TARENbE3Xmpl+WiX2dL76fsYEagSu0e9dgd7Nl
         GK7PzKNMO67jiZ+8GM4wJVqbyxsRQAvHsO56u2PwnWQKPyouAvGBt11CJ2USMRoDRDHr
         oWdk1JuwAjD35theA+o9fh5s8arm9fwDt3v7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pgm7gas/67hkSnZPKlx52N7rv2QBjwKGfrcg8IcGCds=;
        b=LbFhuESeoKCVKZcnWGhH1tMLk7NmIAk0f5RJGK9wH/xtqFXWfwhMwaUvsw9hQ3y2ji
         tCCP6AlTj7Gz9Kwt3SW3wqSJDe2I8RTKpUavuT37/9WpEVCIGVNGFcwJTaRMy/F0lEyu
         Xs4/2o1G82o+xbcK1i90eTzDDqOQ53vNzDUwWoDY0h/IWEAa4qWfO5SKQtaJatoXWV0M
         hmZMxoeakz71BX/9AXRoX0gJ+0/xRswoYS301yzE3igGU6pkBm9hz9HsjnLv52WZ9jzo
         GAMqIgT3LPH66G1UYnZ/4iyKYzOlxnGsOuQ3vwLKRhUmY9D/wC/2LchVa7+hl+cmVDrw
         aNEQ==
X-Gm-Message-State: AOAM531wd5hgocE4ikYPkcUH0BKrKUqjlaYSocM30FS5edK4f0D9Qyi/
        BwjYgXkYQmKSmA0pKpR8gcKHIA==
X-Google-Smtp-Source: ABdhPJyW2AF7LFfGU/tgTvVphv+23N+iGTqWKgCwsWaCaIS1DeBH/FYO25HKYg4KwFN6QNh55BaHkw==
X-Received: by 2002:a05:6a00:4d:b029:197:7198:fc37 with SMTP id i13-20020a056a00004db02901977198fc37mr12010023pfk.7.1605858310232;
        Thu, 19 Nov 2020 23:45:10 -0800 (PST)
Received: from smtp.gmail.com ([100.99.132.239])
        by smtp.gmail.com with ESMTPSA id h8sm2660968pjc.54.2020.11.19.23.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 23:45:09 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Add prox sensor to LTE sku Lazor boards
Date:   Thu, 19 Nov 2020 23:45:08 -0800
Message-Id: <20201120074508.3236616-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's a proximity sensor on Lazor devices, but only for LTE SKUs.
Enable it only on the LTE SKUs and also configure it properly so it
works.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1 (https://lore.kernel.org/r/20201118045454.2503325-1-swboyd@chromium.org):
 * Fixed startup-sensor property to be 0 instead of 1
 * Fixed proxraw-strength to be 8 instead of 2

 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi       | 7 ++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
index 5a67e5baafec..e16ba7b01f25 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
@@ -13,6 +13,14 @@ / {
 	compatible = "google,lazor-rev1-sku0", "google,lazor-rev2-sku0", "qcom,sc7180";
 };
 
+&ap_sar_sensor {
+	status = "okay";
+};
+
+&ap_sar_sensor_i2c {
+	status = "okay";
+};
+
 &keyboard_backlight {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
index 43836fc4d403..0881f8dd02c9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
@@ -13,6 +13,14 @@ / {
 	compatible = "google,lazor-sku0", "qcom,sc7180";
 };
 
+&ap_sar_sensor {
+	status = "okay";
+};
+
+&ap_sar_sensor_i2c {
+	status = "okay";
+};
+
 &keyboard_backlight {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 180ef9e04306..89e5cd29ec09 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -30,7 +30,12 @@ panel_in_edp: endpoint {
 };
 
 &ap_sar_sensor {
-	status = "okay";
+	semtech,cs0-ground;
+	semtech,combined-sensors = <3>;
+	semtech,resolution = "fine";
+	semtech,startup-sensor = <0>;
+	semtech,proxraw-strength = <8>;
+	semtech,avg-pos-strength = <64>;
 };
 
 ap_ts_pen_1v8: &i2c4 {

base-commit: ead9f7d7ea9e20843e29e688b53859cea20044ee
-- 
https://chromeos.dev

