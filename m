Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F5E32559F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 19:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbhBYSg3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 13:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbhBYSeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 13:34:31 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A796AC0617AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 10:33:51 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id w18so3662480plc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 10:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JpUDXb+08O73zaMFvPArwT11W4r8PqHrJ9N7vVR10KU=;
        b=M82C3UnDP8wzdzQ+dqrcf1VmMJ8J+Mmayd4/zcdCx1c2dDyJ1zBWOL51jVynxPbMWo
         fnzrMrZ8arDWhM3KoXSxaep3ladV4mZDHYRopeiiGjOH8aRdbEyHTi6ITSQPWWDpcP/C
         jWwEtAmdI+DInbIndeW0v4hNmAz5EnTBbVvj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JpUDXb+08O73zaMFvPArwT11W4r8PqHrJ9N7vVR10KU=;
        b=qHj8Tm/ej3HgDO844evVWnxLC0kW3M3gTpeYbex2ak94XKeYtvWKu3SbDnJCfMriFY
         YMc+HgNE3z8/FdG9QUofta/Am8tOT9x7cufYULZe0CDADhFOZdrDCFeJpDzcCp23X2oH
         0fq754TIUNv+dTE9nKbLUSb8+Bbdbid2wsvdS8vqlhZcwH7/FPE9gsSQq8te0DR8BUOB
         BNrJyT1+kc1CMsdd6IVtVicOS5vm4MfLE7gyTRy0QhS/uVU/+4lKIbWyZqjjJ+oBiRQl
         RK4t0QFBaT2xbyEzopH317XGgM/G/jzN06OALsn0Sopr99AlH/diUAFCKG+9WZd0eEv6
         VZgA==
X-Gm-Message-State: AOAM530zTva8QbXeFcPkDSXJ3OO236bK6dz6+GO0l2dgVNO2cSD8iWAt
        u/dIXdAjA07uOFhl/TI73HiYag==
X-Google-Smtp-Source: ABdhPJwxxmKD5BkvQ0tPShEjl8xcqLMiOSez7ywyUWkxzveGyfx8EpKbj0qiKYEFiy2tHZWLk46r7w==
X-Received: by 2002:a17:90b:8a:: with SMTP id bb10mr4648192pjb.207.1614278031222;
        Thu, 25 Feb 2021 10:33:51 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1d8:8d0c:f75e:edd8])
        by smtp.gmail.com with UTF8SMTPSA id js2sm6581089pjb.54.2021.02.25.10.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 10:33:50 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sc7180: trogdor: Use ADC TM channel 0 instead of 1 for charger temperature
Date:   Thu, 25 Feb 2021 10:33:37 -0800
Message-Id: <20210225103330.v2.4.I67e29f2854bad22e3581d6a6e1879b9fc8abbdea@changeid>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
References: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On trogdor the ADC thermal monitor is used for monitoring certain
device temperatures. All trogdor boards have at least a thermistor
for the charger temperature, optionally they may have others.

Currently the ADC thermal monitor is configured to use channel 1
for the charger temperature. Given that all trogdor boards have
the charger thermistor it makes more sense to use channel 0,
and then let boards with other thermistors use channels 1, 2, 3,
rather than 0, 2, 3.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- patch added to the series

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index ab4efaece5cb..58e127b6ba1e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -19,7 +19,7 @@ charger_thermal: charger-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 
-			thermal-sensors = <&pm6150_adc_tm 1>;
+			thermal-sensors = <&pm6150_adc_tm 0>;
 
 			trips {
 				charger-crit {
@@ -718,8 +718,8 @@ charger-thermistor@4f {
 &pm6150_adc_tm {
 	status = "okay";
 
-	charger-thermistor@1 {
-		reg = <1>;
+	charger-thermistor@0 {
+		reg = <0>;
 		io-channels = <&pm6150_adc ADC5_AMUX_THM3_100K_PU>;
 		qcom,ratiometric;
 		qcom,hw-settle-time-us = <200>;
-- 
2.30.0.617.g56c4b15f3c-goog

