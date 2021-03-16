Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC30733CAB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 02:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbhCPBPc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 21:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbhCPBPW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 21:15:22 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2C9C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 18:15:21 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id o3so3049465pfh.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 18:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y4oiw5l02lCvVJxxWld790ooeudMtc7KcnVBjGYfw8w=;
        b=CItATseIb1YCShWtllWfpTlLhqXLMbk/8unNoqBZenpZ/CU0N9LXXGkE2Y8vS7jl8F
         IO04DyILjJK+ebITNX2xbSQX0bN/tXVDK6CuxUufckatR5gHtbePXlfUW5OjXgtBss7G
         ScEb9QkF30kaMhqAHSvmyaYCirRpif4XXk8d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y4oiw5l02lCvVJxxWld790ooeudMtc7KcnVBjGYfw8w=;
        b=p1NNr9VwJLMYTgdxnW91GrThq0Mij3uuJhA90MJySB95Z11Y/LG63R2GYetvb1ht+K
         SjaIw3MnIdIQ/fedU99W6sWu/gtcXFQZE7PbgVn/CICKbiTabsaPiIzI1rSl3eJ+MjVN
         px09qZ8PQJ7ikM9LQrxPfjZ06f7Zw1oYfhHNWiXWCRSkNnKzL3vQscwvsvnVERQt03t7
         L9d/SefJwNv1nt0D5RhauQ4DQYs/rsX/pfUMHhUgyT4TAAvoiYh7t1EqZY6OlFt1Ca8U
         YbwIat0sjjBxzieSaEAb4+O88X0iSRCvTzpHmOot7TA3o/KB7UMx0VnSt9j4+06NsMm7
         tAMA==
X-Gm-Message-State: AOAM532wMnQ2U931AsocomTULtYiGZo5C8KXAyNARxAsXR0MHivQJsvb
        7uUTfWptCaXt+yKbMyARKpsxmA==
X-Google-Smtp-Source: ABdhPJyPKHRxMmfCXqQr3zqzv1iNCACq4CWTGWmlJ5jkVORUwNseW6tunpuIDWNk4+4z40IAA2hBAQ==
X-Received: by 2002:a65:5288:: with SMTP id y8mr1533974pgp.105.1615857320988;
        Mon, 15 Mar 2021 18:15:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:9867:b969:5d4f:e017])
        by smtp.gmail.com with UTF8SMTPSA id 35sm13977751pgm.64.2021.03.15.18.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 18:15:20 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 1/3] arm64: dts: qcom: sc7180: lazor: Simplify disabling of charger thermal zone
Date:   Mon, 15 Mar 2021 18:15:13 -0700
Message-Id: <20210315181509.v3.1.I6d587e7ae72a5a47253bb95dfdc3158f8cc8a157@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210316011516.1314686-1-mka@chromium.org>
References: <20210316011516.1314686-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit f73558cc83d1 ("arm64: dts: qcom: sc7180: Disable charger
thermal zone for lazor") disables the charger thermal zone for
specific lazor revisions due to an unsupported thermistor type.
The initial idea was to disable the thermal zone for older
revisions and leave it enabled for newer ones that use a
supported thermistor. Finally the thermistor won't be changed
on newer revisions, hence the thermal zone should be disabled
for all lazor (and limozeen) revisions. Instead of disabling
it per revision do it once in the shared .dtsi for lazor.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- fixed order of nodes in sc7180-trogdor-lazor.dtsi

Changes in v2:
- none

 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 9 ---------
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 9 ---------
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts | 9 ---------
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi   | 9 +++++++++
 4 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index 5c997cd90069..30e3e769d2b4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
@@ -14,15 +14,6 @@ / {
 	compatible = "google,lazor-rev0", "qcom,sc7180";
 };
 
-/*
- * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
- * not supported by the PM6150 ADC driver. Disable the charger thermal zone
- * to avoid using bogus temperature values.
- */
-&charger_thermal {
-	status = "disabled";
-};
-
 &pp3300_hub {
 	/* pp3300_l7c is used to power the USB hub */
 	/delete-property/regulator-always-on;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index d9fbcc7bc5bd..c2ef06367baf 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -14,15 +14,6 @@ / {
 	compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
 };
 
-/*
- * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
- * not supported by the PM6150 ADC driver. Disable the charger thermal zone
- * to avoid using bogus temperature values.
- */
-&charger_thermal {
-	status = "disabled";
-};
-
 &pp3300_hub {
 	/* pp3300_l7c is used to power the USB hub */
 	/delete-property/regulator-always-on;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
index ea8c2ee09741..b474df47cd70 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
@@ -14,12 +14,3 @@ / {
 	model = "Google Lazor (rev3+)";
 	compatible = "google,lazor", "qcom,sc7180";
 };
-
-/*
- * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
- * not supported by the PM6150 ADC driver. Disable the charger thermal zone
- * to avoid using bogus temperature values.
- */
-&charger_thermal {
-	status = "disabled";
-};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 6b10b96173e8..00535aaa43c9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -21,6 +21,15 @@ &ap_sar_sensor {
 	semtech,avg-pos-strength = <64>;
 };
 
+/*
+ * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
+ * not supported by the PM6150 ADC driver. Disable the charger thermal zone
+ * to avoid using bogus temperature values.
+ */
+&charger_thermal {
+	status = "disabled";
+};
+
 ap_ts_pen_1v8: &i2c4 {
 	status = "okay";
 	clock-frequency = <400000>;
-- 
2.31.0.rc2.261.g7f71774620-goog

