Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF38243ED9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 20:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgHMSaj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 14:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgHMSaj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 14:30:39 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22A1C061383
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 11:30:38 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id v5so834788plo.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pM9K305gwu8RlzAPQvohHtve+36DV7y7hr4S9W7Zm3Y=;
        b=YoMMQhWR9TeO1U0zCVSFy6Foz723aPw27dBj+vjMRJdGoPZvXr47oDHsP+QEi0u+ql
         M/zsf/PFuPAB3OjbQWHqg7L6nEszjqBgocL3Nr1RcofM7qL0OyCKXty0iDp4kAhXwTBC
         hzvIMmhFkPH1l17BZVR4wqb6qjwTDSd7QMBNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pM9K305gwu8RlzAPQvohHtve+36DV7y7hr4S9W7Zm3Y=;
        b=AsrxPV5i1syZcUYlrwzF5nExRpyC8NIykSDIZRWhdAwh2ZVNdmMd0e/R+TznD7Vy2j
         STJZPaj/JzbOIHAPWhAQ2FXi2gw63XDmRzFRWEIJMRv8JYCY4QeRN2Pc4qHsDd5+FjZx
         SP1Kfkd57PIncGKTZqcs6LKuQxOkR0hsbrRGCy4jJbYWtYIEfueX2sA08EplnuN5oYvO
         1WjNidHWr/RIlLY8y7Xh5qC+xtR3cy0OiHM1vZPU3fisLF/mUgAZTidW0ortXI1v11ne
         nEFPrA4o4BcYwJ4jS6Ab7dlKqpVlTrpdG/y8heLF2ZsK/wlDOQCs9T5bhNkCS0sQcrpO
         Oe4w==
X-Gm-Message-State: AOAM531cOOX9Rvvrenb9WCT5r+9ry8DSPbqVLCyIDnuRPeoWizg5xtxA
        Kny54A8zJCUZrhZKjJVt95EnEQ==
X-Google-Smtp-Source: ABdhPJwfUsLTxn6iHL5pLE4vvpb0tGBo8GEBl2HKgqY8vZ6GoQ1i3GnogQaDyl8Rh3qoKuJwPWiJ4w==
X-Received: by 2002:a17:90a:718c:: with SMTP id i12mr6421314pjk.101.1597343437308;
        Thu, 13 Aug 2020 11:30:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id z9sm6231843pgh.94.2020.08.13.11.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 11:30:36 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Add 'sustainable_power' for CPU thermal zones
Date:   Thu, 13 Aug 2020 11:30:33 -0700
Message-Id: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 'sustainable_power' attribute provides an estimate of the sustained
power that can be dissipated at the desired control temperature. One
could argue that this value is not necessarily the same for all devices
with the same SoC, which may have different form factors or thermal
designs. However there are reasons to specify a (default) value at SoC
level for SC7180: most importantly, if no value is specified at all the
power_allocator thermal governor (aka 'IPA') estimates a value, using the
minimum power of all cooling devices of the zone, which can result in
overly aggressive thermal throttling. For most devices an approximate
conservative value should be more useful than the minimum guesstimate
of power_allocator. Devices that need a different value can overwrite
it in their <device>.dts. Also the thermal zones for SC7180 have a high
level of granularity (essentially one for each function block), which
makes it more likely that the default value just works for many devices.

The values correspond to 1901 MHz for the big cores, and 1804 MHz for
the small cores. The values were determined by limiting the CPU
frequencies to different max values and launching a bunch of processes
that cause high CPU load ('while true; do true; done &' is simple and
does a good job). A frequency is deemed sustainable if the CPU
temperatures don't rise (consistently) above the second trip point
('control temperature', 95 degC in this case). Once the highest
sustainable frequency is found, the sustainable power can be calculated
by multiplying the energy consumption per core at this frequency (which
can be found in /sys/kernel/debug/energy_model/) with the number of
cores that are specified as cooling devices.

The sustainable frequencies were determined at room temperature
on a device without heat sink or other passive cooling elements.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
If maintainers think 'sustainable_power' should be specified at
device level (with which I conceptually agree) I'm fine with
doing that, just seemed it could be useful to have a reasonable
'default' at SoC level in this case.

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b3833e52f..23f84639d6b9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3320,6 +3320,7 @@ cpu0-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 1>;
+			sustainable-power = <768>;
 
 			trips {
 				cpu0_alert0: trip-point0 {
@@ -3368,6 +3369,7 @@ cpu1-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 2>;
+			sustainable-power = <768>;
 
 			trips {
 				cpu1_alert0: trip-point0 {
@@ -3416,6 +3418,7 @@ cpu2-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 3>;
+			sustainable-power = <768>;
 
 			trips {
 				cpu2_alert0: trip-point0 {
@@ -3464,6 +3467,7 @@ cpu3-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 4>;
+			sustainable-power = <768>;
 
 			trips {
 				cpu3_alert0: trip-point0 {
@@ -3512,6 +3516,7 @@ cpu4-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 5>;
+			sustainable-power = <768>;
 
 			trips {
 				cpu4_alert0: trip-point0 {
@@ -3560,6 +3565,7 @@ cpu5-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 6>;
+			sustainable-power = <768>;
 
 			trips {
 				cpu5_alert0: trip-point0 {
@@ -3608,6 +3614,7 @@ cpu6-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 9>;
+			sustainable-power = <1202>;
 
 			trips {
 				cpu6_alert0: trip-point0 {
@@ -3648,6 +3655,7 @@ cpu7-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 10>;
+			sustainable-power = <1202>;
 
 			trips {
 				cpu7_alert0: trip-point0 {
@@ -3688,6 +3696,7 @@ cpu8-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 11>;
+			sustainable-power = <1202>;
 
 			trips {
 				cpu8_alert0: trip-point0 {
@@ -3728,6 +3737,7 @@ cpu9-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 12>;
+			sustainable-power = <1202>;
 
 			trips {
 				cpu9_alert0: trip-point0 {
-- 
2.28.0.220.ged08abb693-goog

