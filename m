Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D796A19CB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 13:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfEJLa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 07:30:27 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38170 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbfEJLa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 07:30:26 -0400
Received: by mail-pg1-f194.google.com with SMTP id j26so2896121pgl.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2019 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=QcC1kcPYlPfO0O+8tY4nav6bCdNp5fwmjBI0DJl29qg=;
        b=io1my0Ecix2JJ3oJcqZjL6zpswZC8ld3VfErZ6eDNNxCA01YaHqdUdn/oWDMxEX49y
         Mzz8f+TACjsxP7NDAjihlYBO5ZDxcc+Pze5vkvIRLQ1JAHpzcefCYFvWF+RrLCP7A+xV
         L0+Lcik0PbyhVg4LQML5NeoVM9v/BCBq11lgm+COePLxVdRqh3kHG/GrzA2YGpxBfKOV
         /sCsbkV6UjRzhO9FkkldIPhsvZaJdh7v58HP/nyDWIsYiQmB05OtFLDvlRqSBuIXfUKu
         Yb/YRz27i7bykpJAj24CJJRtU1c7575KRyf4lfznr2Zn+WAzuRb/8JGeXSKK1qNwDSwB
         5A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=QcC1kcPYlPfO0O+8tY4nav6bCdNp5fwmjBI0DJl29qg=;
        b=QpGVo9MFwgKmcgGutsGcczPnkvXeilnaiP+Q5YU92ypE7ziW8XHS7SCJlaK6lFVOdm
         GC/1mT7TuJds0LIwWfcdg32LyrQYHoQRfcv54oeP+ULo/jDhlrH1qB8uBH4ADOfn9EaW
         1xIzVRcCZvgJx/b+Xz2cAd92o1fe2RFpEzEpj3jLv3UmPHDWumTIljPXblUobpPK+avT
         WzhcuD4y2051+yM48DRAUlH+hfs14IWwlD/WsXYJtn5u8p10SCLWgH75wY1fFmD7Oyuu
         oPd2u5plH8gNCjuRjI6oB4i66vIhN7ZRu0llXHCLaWHUhzIU6RkzDc2BIRBmdX5UHhb+
         vLWg==
X-Gm-Message-State: APjAAAUQx99h/frxrNtDY75ftfck2gkIminzJ9gidtOh0OYhrygQL8kM
        /lo/8LX4SlZghS7ryxf94h+Gxg==
X-Google-Smtp-Source: APXvYqzUUod/Y38ROUcwM4fnyX/MngcJLhZ9Bb+r9dNOUDjHmL1UQEkIsHNGzTQGaBBX7NjJE9bDWg==
X-Received: by 2002:a63:fa4a:: with SMTP id g10mr12780794pgk.147.1557487825600;
        Fri, 10 May 2019 04:30:25 -0700 (PDT)
Received: from localhost ([103.8.150.7])
        by smtp.gmail.com with ESMTPSA id u6sm6546596pfm.10.2019.05.10.04.30.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 04:30:24 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>,
        devicetree@vger.kernel.org, mkshah@codeaurora.org
Subject: [PATCHv1 8/8] arm64: dts: qcom: sdm845: Add PSCI cpuidle low power states
Date:   Fri, 10 May 2019 16:59:46 +0530
Message-Id: <044cd74e461a1dd7934f44531802f4b557264365.1557486950.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>

Add device bindings for cpuidle states for cpu devices.

[amit: rename the idle-states to more generic names and fixups]

Cc: <devicetree@vger.kernel.org>
Cc: <mkshah@codeaurora.org>
Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 62 ++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5308f1671824..2c8c54e4bd77 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -119,6 +119,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
@@ -136,6 +137,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_100>;
@@ -150,6 +152,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_200>;
@@ -164,6 +167,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD &LITTLE_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_300>;
@@ -178,6 +182,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_400>;
@@ -192,6 +197,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_500>;
@@ -206,6 +212,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_600>;
@@ -220,6 +227,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD &BIG_CPU_RPD &CLUSTER_PD>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_700>;
@@ -228,6 +236,60 @@
 				next-level-cache = <&L3_0>;
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_PD: little-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <350>;
+				exit-latency-us = <461>;
+				min-residency-us = <1890>;
+				local-timer-stop;
+			};
+
+			LITTLE_CPU_RPD: little-rail-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-rail-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <360>;
+				exit-latency-us = <531>;
+				min-residency-us = <3934>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_PD: big-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <264>;
+				exit-latency-us = <621>;
+				min-residency-us = <952>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_RPD: big-rail-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-rail-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <1061>;
+				min-residency-us = <4488>;
+				local-timer-stop;
+			};
+
+			CLUSTER_PD: cluster-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x400000F4>;
+				entry-latency-us = <3263>;
+				exit-latency-us = <6562>;
+				min-residency-us = <9987>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	pmu {
-- 
2.17.1

