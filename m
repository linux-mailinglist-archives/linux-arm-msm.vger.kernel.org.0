Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B321833969B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 19:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbhCLScx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 13:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbhCLScj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 13:32:39 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFC4C061761
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 10:32:39 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id x29so16415609pgk.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 10:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1L7uCIaHKpOR8g0x+D9iDBpuyypi12xQoENydadcyA=;
        b=ZTGIwZuVf0u0CLqd0IxlUZkJ7jB92yCD/9d3l7Jtw9rJHY0BWG2oU1Bc8/1vbx13o8
         MDpRuqwKhpRF+pcBPNU+TwXz47+mdC12eKzirypba+KediCKVklkGJnPbw4pxZCK13PV
         MSzAfghka5PhtDmKtQGWxrAS5oPS6FNRxLkiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1L7uCIaHKpOR8g0x+D9iDBpuyypi12xQoENydadcyA=;
        b=prX8JUTYivzOMPtbuePI2rlzF8SuN5FSVW5/mOgK0sFCztcfn4AoVbrG4ZAMKgVWcR
         zcgncauE+OXxhT682xC6iuw1EaA8/Q04BIVBLbB7EpVvR2+MYGAbhfwRh0augjBEPWWz
         VjMc2rXA8WH0pw7VgPex/ArRSwrndwFaK41xw+7j6Vk2qOUxBsKbRHUgNZh2zpZ5cWdv
         4yDUp8o5HY/7X+sprPOxVb5PzaaBTGTkLqSH1cQjXesIarpbORRJq1GC9BX/fTY11GKF
         P9goa03gjlF0QQW0wOpv08x8NFChNPF6syxMQ8Kj2uhQq8hYOMSNU3eZ5Ec5IZyAQbBn
         5z/Q==
X-Gm-Message-State: AOAM532oGDWS6b2CspkTx1FeAeoDwLiS6VYz+EOuYq0M+dveIktRVrOM
        cUnrpLHGx3iPvQqpUa/jhkZ51w==
X-Google-Smtp-Source: ABdhPJxOeqx4M3GWQPJYNAEv2HrjTniAQzKcEz2nIUiv12AFytKW4o+gIko9Jv0ut/Ke1tcV9xNbMQ==
X-Received: by 2002:a65:5a0a:: with SMTP id y10mr12753689pgs.122.1615573958623;
        Fri, 12 Mar 2021 10:32:38 -0800 (PST)
Received: from localhost ([2620:15c:202:1:914f:6483:1dc:1bba])
        by smtp.gmail.com with UTF8SMTPSA id v126sm6029654pfv.163.2021.03.12.10.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 10:32:38 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sc7180: lazor: Simplify disabling of charger thermal zone
Date:   Fri, 12 Mar 2021 10:32:26 -0800
Message-Id: <20210312103211.v2.1.I6d587e7ae72a5a47253bb95dfdc3158f8cc8a157@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210312183228.550779-1-mka@chromium.org>
References: <20210312183228.550779-1-mka@chromium.org>
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
---

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
index 6b10b96173e8..6d540321b4a5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -41,6 +41,15 @@ ap_ts: touchscreen@10 {
 	};
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
 &panel {
 	compatible = "boe,nv133fhm-n62";
 };
-- 
2.31.0.rc2.261.g7f71774620-goog

