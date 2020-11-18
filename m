Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E792B757F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 05:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgKREy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 23:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgKREy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 23:54:56 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C0EC0613D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 20:54:56 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id mn12so1352606pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 20:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=moO2QhNnqIGWOkMHd95f/PelXhTS60oiUOB6MIxsOtY=;
        b=KJgiM8UwlUWQO8p9WhLRYJs69GRYY7ASWc7B+IKX2wDbM/9TGHQ2DMAK2lMze3on5t
         VLc1ukbdFUes3cGxqq1273FEdH7V2rrO/p+mhtgOa24whGVgIIbSBWFkZ5j4lmPC/Z0v
         jrndjRGxl1zmKY74hYID/A9wMDZ6ppnbCiQk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=moO2QhNnqIGWOkMHd95f/PelXhTS60oiUOB6MIxsOtY=;
        b=oK5qqi2GlZQTTkesGVqx2TusJfTwI/E6uqvx/Qi3TeIw/vNLZxX1zAzwaMpJIobY/K
         Ou4h89CtDwZE0fw7RY9/WeNtaC5/xEY+ujx3NLcmyCwO0kZ/rHFpRV95m0F4kl1oNpyw
         ZtxySQnQFisfTjkmgsnHywlTHAdrAkwEcEoxBU3jk49hFKnXvEGt6lC1z3MzYxcl8Vyx
         catKBdpMSPyG+eIiayrqnDKM0G1tsAWPFpx6sv/xx41uq7PhGTPV96HHe3GsptXNXeIw
         ltGKF7Nqb17BH7vs6Kfx4tMuCv4HLd/eE1/R7Rr87GqqkXtB/dnfoDKMMxsz08FKz7GH
         Fo+Q==
X-Gm-Message-State: AOAM533Ydl2Z6DFd6Q+g9P5Gqv1C4C7Oiio3yDeqb5PO5ceV+hEM6d7o
        8OepngULKM846KIseCjlg8GY6Q==
X-Google-Smtp-Source: ABdhPJyWsv8OrsRh/Xsuzi+ygcgvXgaBBy4c00ZRCo1S3sE7OOLuluGTBnUcbOZ77IlCgpDNJgIUYg==
X-Received: by 2002:a17:90a:8543:: with SMTP id a3mr2408228pjw.13.1605675296251;
        Tue, 17 Nov 2020 20:54:56 -0800 (PST)
Received: from smtp.gmail.com ([100.99.132.239])
        by smtp.gmail.com with ESMTPSA id mt2sm834690pjb.7.2020.11.17.20.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 20:54:55 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Add prox sensor to LTE SKU Lazor boards
Date:   Tue, 17 Nov 2020 20:54:54 -0800
Message-Id: <20201118045454.2503325-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
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
index 180ef9e04306..89de69b60609 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -30,7 +30,12 @@ panel_in_edp: endpoint {
 };
 
 &ap_sar_sensor {
-	status = "okay";
+	semtech,cs0-ground;
+	semtech,combined-sensors = <3>;
+	semtech,resolution = "fine";
+	semtech,startup-sensor = <1>;
+	semtech,proxraw-strength = <2>;
+	semtech,avg-pos-strength = <64>;
 };
 
 ap_ts_pen_1v8: &i2c4 {

base-commit: ead9f7d7ea9e20843e29e688b53859cea20044ee
-- 
Sent by a computer, using git, on the internet

