Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DE14005C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 21:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235422AbhICTXZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 15:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhICTXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 15:23:24 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5DEC061575
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 12:22:24 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so268989pjt.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnF/e8xJrhWD/AMGCg/7SFP6mcesPXLBhPMYKZEsbD0=;
        b=ZCwFCmAKuzG3/8lMrM8j7z+BXXwcnXWvFGj+OyDjT6nP3X8EZHJdf22Ic2ME0ZQdoY
         tpV1i4j6yE3tOb8MhNm/bwdZOH+AGSh6h40Y4yRwZ4v7MUE/2z397obUKPMzmN0RNw2r
         eRjZDjSSKKB33XD+1KdBlWQCp1dYJbhRRvRdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnF/e8xJrhWD/AMGCg/7SFP6mcesPXLBhPMYKZEsbD0=;
        b=f0YTEwxI1IZF9v0jBYxiDwsmSysUUKMbCqiJxxGx17Ihzta5gHC6pRiRACrMfzl+uZ
         6EJnCdpmn7HkdZxetlLn6eVAfvWGuHeJBJ2CC3r+nkFeys17VI0tnA9XMsvJTq6sxgG8
         9xribOrv1UqsRW5EfXATlTZ2gIheRBcKPPdtj+nhj21jhqmnovuFRb2COIojY2LczLGj
         vxuuhYjT3sECGPcvHYgsmdEELdq7YbF1kVsrVz+4tf0OoQc38zvmF3d8/gtu7XuMtDS5
         lYNTwXOjnI3dkP3ej9BNvYMj/gKgMkz9qRuCTRxhpI3t23RQRs3iX/00dpebaLs4F/Io
         oe8A==
X-Gm-Message-State: AOAM531gS77rdLShFuIZtrhuaMHZmJ8d9BHsYgH9aOQI+Y9duWz+i/IX
        7Pj8zBIum7qVOh8GR9LatuE5MQ==
X-Google-Smtp-Source: ABdhPJwTznSK9vHgWZB8KCDbKVhij7pJCfTjoVIotQRhjy/j2avQBgQDFYT6cBkwCOe2b16hJ7lDuA==
X-Received: by 2002:a17:90b:188f:: with SMTP id mn15mr499401pjb.154.1630696943938;
        Fri, 03 Sep 2021 12:22:23 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:80b3:9f00:3170:fd8b])
        by smtp.gmail.com with UTF8SMTPSA id r13sm129013pgl.90.2021.09.03.12.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 12:22:23 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180-trogdor: Delete ADC config for unused thermistors
Date:   Fri,  3 Sep 2021 12:22:19 -0700
Message-Id: <20210903122212.v2.1.I9777d0036ecbb749a4fb9ebb892f94c6e3a51772@changeid>
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

For Lazor and CoachZ rev1 also disable the PM6150 ADC and thermal
monitor since none of the ADC channels is used.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- also disable the ADC for Lazor and CoachZ rev1
- updated commit message

 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts     | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi | 12 ++++++++++++
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |  8 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2.dts     |  8 ++++++++
 4 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
index 21b516e0694a..8290d036044a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
@@ -23,6 +23,20 @@ &charger_thermal {
 	status = "disabled";
 };
 
+&pm6150_adc {
+	status = "disabled";
+
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
index 00535aaa43c9..86c9e750995f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -54,6 +54,18 @@ &panel {
 	compatible = "boe,nv133fhm-n62";
 };
 
+&pm6150_adc {
+	status = "disabled";
+
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

