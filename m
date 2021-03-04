Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0564D32D93D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 19:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbhCDSGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 13:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbhCDSFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 13:05:44 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBA9C0613DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 10:04:32 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 192so12496919pfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 10:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bP6h4jaGCKzDr1wOBYS4+X9av0wf+oSnSRtoXz7PDLE=;
        b=YGQMfD9hxLCbXep7E1Cu3JBBGm5eqFAOcphkbIXYPlcttRTvh317a65aaShNUWQQ69
         6h21+uzs8yNzMdhwp8Qr6RPwOgCNCZEbe4oPPV3AC7FTysBPYmELwqwslfe2Feg2JMFV
         E5KEmcXUDSILiW939SWWrSbQO3mVc35d2AIE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bP6h4jaGCKzDr1wOBYS4+X9av0wf+oSnSRtoXz7PDLE=;
        b=aAX1L3CG+hFoW9yWuma4HyNuWilQE2YvSiauzOS1HL2/LG3EvDX9LCRKajr3vjyh8W
         8o2dvX3DBPTSzjVzoeava3fIZWV3j5QrTBudg/p8OEu0S8yN6lHuzJpzySE3ovYao3EE
         lfcgnbzGgf3eEDekKiukzE3p/PG8x1krHVBW/s/HlKs+2Q+hxxF/jRBcG5B9GTnsdgxh
         DbrnP7dOxSYAIfCLSp/pjdByS3IKUeLU3cAp6/R4HndIc+JKextY2i6kPUtbshQRiR2E
         Obp5wjxBRH+hiynURe9azQpuTBMsoxxkqUGQWs/0IeuXZ7RYb1+BqsmaiJUu2bZSk8tC
         nmXQ==
X-Gm-Message-State: AOAM533K6qfIyJYP256ANopJLrNUkcvnf1S2QLxrtS5wk9oQVpa7sDox
        WVvXbhvBWEYCo3h6xJ06eZlMRQ==
X-Google-Smtp-Source: ABdhPJxpFJ7F13e8lsFYoJ817KdQcTW9k3UVpySLVh1qY0Ya6oqkKHgJD/x4gxpQ0Hft1DZEPnbAwg==
X-Received: by 2002:a63:dc57:: with SMTP id f23mr4678332pgj.276.1614881072096;
        Thu, 04 Mar 2021 10:04:32 -0800 (PST)
Received: from localhost ([2620:15c:202:1:69fe:a9f8:ca53:af2b])
        by smtp.gmail.com with UTF8SMTPSA id w8sm107260pgk.46.2021.03.04.10.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 10:04:31 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sc7180: Disable charger thermal zone for coachz rev1 and rev2
Date:   Thu,  4 Mar 2021 10:04:15 -0800
Message-Id: <20210304100341.4.I95b8a63103b77cab6a7cf9c150f0541db57fda98@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210304180415.1531430-1-mka@chromium.org>
References: <20210304180415.1531430-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CoachZ rev1 and rev2 are stuffed with a 47k NTC as thermistor for the
charger temperature which currently isn't supported by the PM6150 ADC
driver. Disable the charger thermal zone to avoid the use of bogus
temperature values.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts | 9 +++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
index 86619f6c1134..c6b078e70d31 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
@@ -14,6 +14,15 @@ / {
 	compatible = "google,coachz-rev1", "qcom,sc7180";
 };
 
+/*
+ * CoachZ rev1 is stuffed with a 47k NTC as charger thermistor which currently
+ * is not supported by the PM6150 ADC driver. Disable the charger thermal zone
+ * to avoid using bogus temperature values.
+ */
+&charger_thermal {
+	status = "disabled";
+};
+
 &tlmm {
 	gpio-line-names = "HUB_RST_L",
 			  "AP_RAM_ID0",
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
index 4f69b6ba299f..67c31795a566 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
@@ -13,3 +13,12 @@ / {
 	model = "Google CoachZ (rev2+)";
 	compatible = "google,coachz", "qcom,sc7180";
 };
+
+/*
+ * CoachZ rev2 is stuffed with a 47k NTC as charger thermistor which currently
+ * is not supported by the PM6150 ADC driver. Disable the charger thermal zone
+ * to avoid using bogus temperature values.
+ */
+&charger_thermal {
+	status = "disabled";
+};
-- 
2.30.1.766.gb4fecdf3b7-goog

