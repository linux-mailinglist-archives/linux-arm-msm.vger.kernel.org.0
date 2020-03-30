Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 548A3197856
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 12:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbgC3KGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 06:06:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45309 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729095AbgC3KGr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 06:06:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id r14so5865761pfl.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 03:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t9nTriwKRskndC3FQU+CejJdO8RJWivFT2/XH3sqCgc=;
        b=qycWlmyESLgLrT4nBdwQKfJ43Gle9E/5kZIqRHWRE24o5doKCQr+kEm7uUJfHT8mpx
         N6UleKO0sqfV1PajKsw9SuZEdQ2zPTwDZVLcFdtlTFVudX2eeLQWzUkpIcDJczGNy2tK
         /3THT+R7xHQTDzvSkVaupeN2bKbcUaU2qJhT2oNwdfoVfKKFyP6M7+ej/YE1bBil3vQS
         V8yUQMd2cy+49AHgqHt+1XA4VWVDwV1TnEJvHj2qZvHPd8vnyL3kzxfdmu3q6Y9Bn+L2
         jeiSB0iEeazCwJN60NdquCx3mNymm42sq8CyqNrdg2ppa2qmW2FgsDpiGNBwWbvGxn6U
         q5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t9nTriwKRskndC3FQU+CejJdO8RJWivFT2/XH3sqCgc=;
        b=oAin1CqImXgizovthxebMhOy1apUhwf6NPV7OfkG2OdB9Anf4FILg9WUrA/uIC5dX2
         aTZaVue6/k10mXD/hUh08lBjMS6WJGJXpaZXsbJmwA4FM5aDK5yvom+KCMgckNaBuYWy
         xVc19QTRrZyatpoQMagDAxdwQQYi+I8K4hMCO5rZt33ACU4CLMH3JKCfIP+xObG25wSg
         1tzYPHrdU4ODmfa1/gy9HZ9O2aylx5SUhVa9GDYnUjOZuW70HtXHoTgMLRCKnHt8Qlsn
         tdkR/uxPDrMIMblu/n4RSPE0Knh44gEddTia37Dx1zLFe+iosxqT7+z2+TUx7J1LBxW2
         C5lg==
X-Gm-Message-State: ANhLgQ2+V6KPHp7/XYhhALxrYdhg7B/U/GIA1rdqFhfS+/9qq9e+cu2H
        NiPP5Rr6IpbhTuN6TQB5GeOecw==
X-Google-Smtp-Source: ADFU+vs+qAml2X+oV6c986AFWU5n2cg6AJNpIpPui0EVRhYl7gNk/82abDdsDutvg0KcVnLBoAyXQQ==
X-Received: by 2002:a63:704:: with SMTP id 4mr12118395pgh.294.1585562805534;
        Mon, 30 Mar 2020 03:06:45 -0700 (PDT)
Received: from localhost ([103.195.202.48])
        by smtp.gmail.com with ESMTPSA id c8sm10277816pfj.108.2020.03.30.03.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 03:06:44 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: msm8998: remove unit name for thermal trip points
Date:   Mon, 30 Mar 2020 15:36:28 +0530
Message-Id: <cd6f0c7298437d35642b35c9ede9064c247d6090.1585562459.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1585562459.git.amit.kucheria@linaro.org>
References: <cover.1585562459.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The thermal trip points have unit name but no reg property, so we can
remove them. It also fixes the following warnings from 'make dtbs_check'
after adding the thermal yaml bindings.

arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
cpu0-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
cpu1-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
cpu2-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
cpu3-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
cpu4-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
cpu5-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
cpu6-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
cpu7-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
clust0-mhm-thermal:trips: 'trip-point@0' does not match any of the
regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
clust1-mhm-thermal:trips: 'trip-point@0' does not match any of the
regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
cluster1-l2-thermal:trips: 'trip-point@0' does not match any of the
regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
modem-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
mem-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
wlan-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
q6-dsp-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
camera-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml: thermal-zones:
multimedia-thermal:trips: 'trip-point@0' does not match any of the
regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'

arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
cpu0-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
cpu1-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
cpu2-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
cpu3-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
cpu4-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
cpu5-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
cpu6-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
cpu7-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
clust0-mhm-thermal:trips: 'trip-point@0' does not match any of the
regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
clust1-mhm-thermal:trips: 'trip-point@0' does not match any of the
regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
cluster1-l2-thermal:trips: 'trip-point@0' does not match any of the
regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
modem-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
mem-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
wlan-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
q6-dsp-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
camera-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml: thermal-zones:
multimedia-thermal:trips: 'trip-point@0' does not match any of the
regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 38 +++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 91f7f2d075978..074c4b614d221 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -500,7 +500,7 @@
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
-				cpu0_alert0: trip-point@0 {
+				cpu0_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -521,7 +521,7 @@
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
-				cpu1_alert0: trip-point@0 {
+				cpu1_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -542,7 +542,7 @@
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
-				cpu2_alert0: trip-point@0 {
+				cpu2_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -563,7 +563,7 @@
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
-				cpu3_alert0: trip-point@0 {
+				cpu3_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -584,7 +584,7 @@
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
-				cpu4_alert0: trip-point@0 {
+				cpu4_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -605,7 +605,7 @@
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
-				cpu5_alert0: trip-point@0 {
+				cpu5_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -626,7 +626,7 @@
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
-				cpu6_alert0: trip-point@0 {
+				cpu6_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -647,7 +647,7 @@
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
-				cpu7_alert0: trip-point@0 {
+				cpu7_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -668,7 +668,7 @@
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
-				gpu1_alert0: trip-point@0 {
+				gpu1_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -683,7 +683,7 @@
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
-				gpu2_alert0: trip-point@0 {
+				gpu2_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -698,7 +698,7 @@
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
-				cluster0_mhm_alert0: trip-point@0 {
+				cluster0_mhm_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -713,7 +713,7 @@
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
-				cluster1_mhm_alert0: trip-point@0 {
+				cluster1_mhm_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -728,7 +728,7 @@
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
-				cluster1_l2_alert0: trip-point@0 {
+				cluster1_l2_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -743,7 +743,7 @@
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
-				modem_alert0: trip-point@0 {
+				modem_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -758,7 +758,7 @@
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
-				mem_alert0: trip-point@0 {
+				mem_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -773,7 +773,7 @@
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
-				wlan_alert0: trip-point@0 {
+				wlan_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -788,7 +788,7 @@
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
-				q6_dsp_alert0: trip-point@0 {
+				q6_dsp_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -803,7 +803,7 @@
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
-				camera_alert0: trip-point@0 {
+				camera_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -818,7 +818,7 @@
 			thermal-sensors = <&tsens1 6>;
 
 			trips {
-				multimedia_alert0: trip-point@0 {
+				multimedia_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
-- 
2.20.1

