Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCBF19CAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 13:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfEJLaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 07:30:22 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34449 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfEJLaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 07:30:22 -0400
Received: by mail-pf1-f193.google.com with SMTP id n19so3098561pfa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2019 04:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=vYKcDNOYSaC2OexnBDBqxk0MAwfNb45aOaOob4rH19c=;
        b=fs7Rtp7XMf+d3tnALRhBbpN9j7rlJ+iUcIzlz/u6nzfO2mv8FW3FT1NoOB3KADrDey
         t/ilbNCMjBOFA6b4L0JgDKu1LLpWBg/WpyX/jenE9l0P5EA6rY9G3FI2yE6MFHwBsF2c
         ilVObwL+oWzveslyQX302NlxxN1HrR+i895B/+v9DjRck8stXO9MGdi5CCjq3ah11GRi
         M1iZHKG+Omz7VJicEMmUMwS22N475rMKXkjiO6JOVXE9PJsm+WQcWeShnGIH5IJrf0ut
         ixgCXeDzFYYzdsO19Q7Cc61yhbqde/BQg03HBT0IW+98coF3WNRBL8k0tF+RxxF7hgmA
         sK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=vYKcDNOYSaC2OexnBDBqxk0MAwfNb45aOaOob4rH19c=;
        b=MEYMyvVF4r9ORax/pdvN4nSCFc0OMKzsybwvIwhSheFxl8Ol55D3kG6BzPIYk1+pv5
         lHDy7VOSgN3Pz2cQg2ShCFjHKMiEMgSlUcojzwTPoMdbDG2dNIFVCG1u2eCvtwaMGmet
         RAZ7iyYEwM967KB6uPjHD70IG/ipSdnfuzSSYVWsNhpnDBh4iDOCVJktyiB0SIHwEMs9
         P7fRrcakJsLfCwD573p5mVpMNuZZJtH5tAFhwAzk3N0wXg+ZqeIEyHAtUWRwD9cWXD4K
         tx+D/XtqfPJVxRClz5MTJtzV8GYKFkCdVhMbjI9MVpkEbI2saACAQSlPkNejnQSl4Vuq
         XbYA==
X-Gm-Message-State: APjAAAWU4yXBUEVX+WdSb6KzuZRugBq/UUqyWXXye2YDrPkNiGaJuyts
        6KCFUA92Y4XntdIiz1KtKmYEmw==
X-Google-Smtp-Source: APXvYqy5nGoB92TIf3LdNJP1CZohRoeZIvAFyGQ5InRrSWHHmkAjkzxJRQc1v1EWsFPwjaeEK98HjQ==
X-Received: by 2002:a63:8149:: with SMTP id t70mr12932306pgd.134.1557487821288;
        Fri, 10 May 2019 04:30:21 -0700 (PDT)
Received: from localhost ([103.8.150.7])
        by smtp.gmail.com with ESMTPSA id k63sm12757528pfb.108.2019.05.10.04.30.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 04:30:20 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>, devicetree@vger.kernel.org
Subject: [PATCHv1 7/8] arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
Date:   Fri, 10 May 2019 16:59:45 +0530
Message-Id: <0afe77d25490b10250f9eac4b4e92ccac8c42718.1557486950.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device bindings for cpuidle states for cpu devices.

Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 3fd0769fe648..208281f318e2 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -78,6 +78,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
@@ -97,6 +98,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_1: l1-icache {
@@ -112,6 +114,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_2: l1-icache {
@@ -127,6 +130,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_PD>;
 			efficiency = <1024>;
 			next-level-cache = <&L2_0>;
 			L1_I_3: l1-icache {
@@ -142,6 +146,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
@@ -161,6 +166,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_101: l1-icache {
@@ -176,6 +182,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_102: l1-icache {
@@ -191,6 +198,7 @@
 			compatible = "arm,armv8";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_PD>;
 			efficiency = <1536>;
 			next-level-cache = <&L2_1>;
 			L1_I_103: l1-icache {
@@ -238,6 +246,30 @@
 				};
 			};
 		};
+
+		idle-states {
+			entry-method="psci";
+
+			LITTLE_CPU_PD: little-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <43>;
+				exit-latency-us = <43>;
+				min-residency-us = <200>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_PD: big-power-down {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <41>;
+				exit-latency-us = <41>;
+				min-residency-us = <200>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {
-- 
2.17.1

