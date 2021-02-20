Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D9632030D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Feb 2021 03:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBTCMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 21:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhBTCMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 21:12:25 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED87DC061797
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Feb 2021 18:11:07 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id w18so1218655plc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Feb 2021 18:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T/bcmgFG5Q/B+6/HjkjoWIy++Ai0witxQcUitgDw+g4=;
        b=eRMxvTRh3HWfGoRuMVVLNT1xvUOCKcAvZTqpYvGnv2gaTMGTWW7XKM8/Xx5WDISdR+
         XKRwLK7ymE++esbSiXOycOJqCyl/poIunZtOuF25vCKgpFbb2jKdxOrMMoIxirXs84Yy
         Zg/GrVxZk8MHhhndLmeBx5Nvc9pSNXdCCga9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T/bcmgFG5Q/B+6/HjkjoWIy++Ai0witxQcUitgDw+g4=;
        b=SKXrnwNcUOAhs2m0Ird6bXeUS3iMnL6x2qREY/suvysCFFvgnLksNUycmT5fJZZ/R3
         TYzutYBsTPX+X12Ej4ZaogC8cQ9hnP+AZ5luEHp2mFZVxDUWG0vnmiLDhoxFNkmirtjZ
         nE05xM3HldGbRZriwc0GbJd9vqB70IbpTNMPzFCAtyibysrHSBMJMe5YC5dM/sItqOR6
         4w43Exa/PALNvUKrhySOJSL0MTucjb+qh9SZ5c6K0l8HxYK+Nhu34yPwqcNa5m3bumAC
         TAiPKbyidoW8lzWkcPRQQLiR7XM7kLK1KUAgYkkLDGbe0nSZZ/XYtCZhD0fhtxvrh2YL
         2gYw==
X-Gm-Message-State: AOAM533Wnz2OcZ0kYpEB0gvX7geudA66R/2oR9mjdoVYe9WKrWBP3tkp
        OPW409/4R9j++vW3aPYSGo4JuzitgG3FSg==
X-Google-Smtp-Source: ABdhPJzP3ewmp+T7JsEUpOd4wjUq4O4buC6eZbE+P/amgOtYEdsAckKh6zEdRG95+GTHN8EfwMsXYg==
X-Received: by 2002:a17:90a:ab8b:: with SMTP id n11mr11634378pjq.109.1613787067582;
        Fri, 19 Feb 2021 18:11:07 -0800 (PST)
Received: from localhost ([2620:15c:202:1:bdfd:8eaf:bd48:f73e])
        by smtp.gmail.com with UTF8SMTPSA id ca19sm749988pjb.31.2021.02.19.18.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 18:11:07 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sc7180: Delete charger thermal zone and ADC channel for lazor <= rev3
Date:   Fri, 19 Feb 2021 18:10:59 -0800
Message-Id: <20210219181032.3.Ia4c1022191d09fe8c56a16486b77796b83ffcae4@changeid>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
References: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lazor rev3 and older are stuffed with a 47k NTC as thermistor for
the charger temperature which currently isn't supported by the
PM6150 ADC driver. Delete the charger thermal zone and ADC channel
to avoid the use of bogus temperature values.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 9 +++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 9 +++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts | 9 +++++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index 30e3e769d2b4..0974dbd424e1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
@@ -14,6 +14,15 @@ / {
 	compatible = "google,lazor-rev0", "qcom,sc7180";
 };
 
+/*
+ * rev <= 3 are stuffed with a 47k NTC as charger thermistor which is currently
+ * not supported by the PM6150 ADC driver. Delete the thermal zone and ADC
+ * channel to avoid the use of bogus temperature values.
+ */
+/delete-node/ &charger_thermal;
+/delete-node/ &pm6150_adc_charger_thm;
+/delete-node/ &pm6150_adc_tm_charger_thm;
+
 &pp3300_hub {
 	/* pp3300_l7c is used to power the USB hub */
 	/delete-property/regulator-always-on;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index c2ef06367baf..0381ca85ae97 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -14,6 +14,15 @@ / {
 	compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
 };
 
+/*
+ * rev <= 3 are stuffed with a 47k NTC as charger thermistor which is currently
+ * not supported by the PM6150 ADC driver. Delete the thermal zone and ADC
+ * channel to avoid the use of bogus temperature values.
+ */
+/delete-node/ &charger_thermal;
+/delete-node/ &pm6150_adc_charger_thm;
+/delete-node/ &pm6150_adc_tm_charger_thm;
+
 &pp3300_hub {
 	/* pp3300_l7c is used to power the USB hub */
 	/delete-property/regulator-always-on;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
index 240c3e067fac..b9473bba8f4a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
@@ -13,3 +13,12 @@ / {
 	model = "Google Lazor (rev3)";
 	compatible = "google,lazor-rev3", "qcom,sc7180";
 };
+
+/*
+ * rev <= 3 are stuffed with a 47k NTC as charger thermistor which is currently
+ * not supported by the PM6150 ADC driver. Delete the thermal zone and ADC
+ * channel to avoid the use of bogus temperature values.
+ */
+/delete-node/ &charger_thermal;
+/delete-node/ &pm6150_adc_charger_thm;
+/delete-node/ &pm6150_adc_tm_charger_thm;
-- 
2.30.0.617.g56c4b15f3c-goog

