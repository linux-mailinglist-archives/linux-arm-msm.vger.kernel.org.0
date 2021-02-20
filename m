Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746DA32030C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Feb 2021 03:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhBTCM3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 21:12:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhBTCMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 21:12:25 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185F7C061793
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Feb 2021 18:11:06 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id b21so6451132pgk.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Feb 2021 18:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w1gRU/WYbri3EwXTe4FbkyvuqvAR1wAq7srUEoRk6sk=;
        b=hDTLFmvlhfZanu6EuAo/OJ8ZvDEKmLQm4vfPLHFJT9Lbr7+f7Z0v5NjAkFVA/zz51D
         2VeVjtKcGSnOu83C4WS2B2l/h4sqeMsFrsBjzJRmzTs/OTbbLkVeAUYRBbUe3CKaBHV9
         NzE/7efnv/goVjG8ADhfrqOCiUEZq115nYIBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w1gRU/WYbri3EwXTe4FbkyvuqvAR1wAq7srUEoRk6sk=;
        b=Ons+KBH3aXu1e8bqGrCQaiygDhX3e/I3stualtZ88TPzkxZeVVifkTRQbYik27E5or
         cpYqS5uPDoKk35J4rjSwuZdGUhNjO/RmlE4M5CTll3OupLWT8q2I+GRh4YnA5pY7WDTQ
         gAZERByPZ2c7wFWFgeonEcyu+Btph8tyoXk8m5+f69/XcKqDIRqC+C93W3qz0LaxNdE9
         R3MNL76u377qJbhVHsjZZbe/4p1d1+DRmmUx+JsTeyuPe+xAiQsW5zeWhqqQcCE0kZQl
         UgyK8Uvebta1Bvda4PVSopbrCHDFbBXw5OV7hl2aw+LMJnzm4Uml3xvGGZ6ICBaeMS7c
         8LPg==
X-Gm-Message-State: AOAM5302mcoT8s6p2DNEpZpq2g2bqknGtgChYN2FO9eAgrmOQNPBCOBS
        FHH0nf6EBrYxLMB1mfgF2h6rpA==
X-Google-Smtp-Source: ABdhPJw/LTi6lJs19ovtnX7AsyqYHx50Qrk/Z00W/+WxrCA0ZrX9WGeVEXSv7rHjGT+gSMMkbIL9dg==
X-Received: by 2002:a63:bc02:: with SMTP id q2mr10938131pge.198.1613787065676;
        Fri, 19 Feb 2021 18:11:05 -0800 (PST)
Received: from localhost ([2620:15c:202:1:bdfd:8eaf:bd48:f73e])
        by smtp.gmail.com with UTF8SMTPSA id j34sm9893062pgi.62.2021.02.19.18.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 18:11:05 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sc7180: trogdor: Add labels to charger thermal zone and ADC channel
Date:   Fri, 19 Feb 2021 18:10:58 -0800
Message-Id: <20210219181032.2.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
References: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some revisions of trogdor boards use a thermistor for the charger
temperature which currently isn't supported by the PM6150 ADC
driver. Add labels for the charger thermal zone and ADC channel
to allow the removal of these nodes from affected boards and
avoid the use of bogus temperature values.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 07c8b2c926c0..fa996387715b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -15,7 +15,7 @@
 
 / {
 	thermal-zones {
-		charger-thermal {
+		charger_thermal: charger-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 
@@ -706,7 +706,7 @@ &mdss {
 };
 
 &pm6150_adc {
-	charger-thermistor@4f {
+	pm6150_adc_charger_thm: charger-thermistor@4f {
 		reg = <ADC5_AMUX_THM3_100K_PU>;
 		qcom,ratiometric;
 		qcom,hw-settle-time = <200>;
@@ -716,7 +716,7 @@ charger-thermistor@4f {
 &pm6150_adc_tm {
 	status = "okay";
 
-	charger-thermistor@1 {
+	pm6150_adc_tm_charger_thm: charger-thermistor@1 {
 		reg = <1>;
 		io-channels = <&pm6150_adc ADC5_AMUX_THM3_100K_PU>;
 		qcom,ratiometric;
-- 
2.30.0.617.g56c4b15f3c-goog

