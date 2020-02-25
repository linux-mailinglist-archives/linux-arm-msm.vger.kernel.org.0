Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5D916F3B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 00:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729606AbgBYXqv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 18:46:51 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51750 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbgBYXqv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 18:46:51 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so1070743wmi.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2020 15:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BucIs76BJlau9NCsGrtA8TwA9hcR+pRMGii5xstBwn8=;
        b=wzceJTsbO+TdAD1Cyu8CIArkKYxAT4kIWMrsPNw4gSGcXpDEenp71agJitRrCXHFyn
         9o3rXuvGiE045zMRDbJSicui7t2CJ/ksZyAmPgdxl1+knGxo0hwedGO6NfTEaGV8H5t4
         dgCn0i8vR55Jg1XjP0ybrZoPAcWgmucAmNFNXfZQ04bPB/w/gKN5vtzJVL6BAsVCzPsK
         BElY1uNGTzTEy/TFcGPivSk7BlhvowmL8MGsbFcNd5/HUGB75i0ti5IGu8xVhVczTPTb
         bHr+ZAGvSmvHUxGasLKSzgjIHInn6W9jyG6c8DEfO+nQoJgTS1y/ZcXwbvV2lgYf87I7
         z1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BucIs76BJlau9NCsGrtA8TwA9hcR+pRMGii5xstBwn8=;
        b=Ofy+3f5yTwjenOF4plJkHdfLPTbH14acAiw7MiJaYIPaJ/PttHgS4OZT58bqgJxa+I
         UHAbN6xBHQLg6xKfJ8IyU+WFxsAiiaj+L/xF4XKdPQiLdwErwd+hlJ18BngK97MDUJyl
         0FyAdodnzXhFO0UQAQf+U9AaysHLIo70TF9jJF8BOcjzA0VWWDrTGGpwVlPODuZ6/gX6
         es+bnc8Xyt/ZK3A9lzpyQNfwHwO9j1+r7wio/9WNLq1OT5QR3URKWmvuQijd4IaVUdm+
         KT4EU2aqx4aOP1tTWamzJ+iby7sRGUPt2JUqgCwrwHXRO5BmNs+8RTfMhmAjGy9wDEQL
         DBog==
X-Gm-Message-State: APjAAAU+P+hbjP/INAZokonVgNPBYz/gMJ0Au3mZ8gXtdJuPELCR7PgB
        c++xjyAFs91nIl9ujJU3QQvqkA==
X-Google-Smtp-Source: APXvYqxXwufDMPen0Os3XKpr8yPA7jzlpKAFED+1rNntaV5cx/AhnzCfSXa2mq1QbkR9fG45ilgHOg==
X-Received: by 2002:a1c:208a:: with SMTP id g132mr1462656wmg.143.1582674408254;
        Tue, 25 Feb 2020 15:46:48 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:186c:5f6c:221d:5ce])
        by smtp.gmail.com with ESMTPSA id t133sm356278wmf.31.2020.02.25.15.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 15:46:47 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v10 12/15] dt-bindings: hisilicon: Add CTI bindings for hi-6220
Date:   Tue, 25 Feb 2020 23:46:08 +0000
Message-Id: <20200225234611.11067-13-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225234611.11067-1-mike.leach@linaro.org>
References: <20200225234611.11067-1-mike.leach@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds in CTI device tree information for the Hikey620 board.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Tested-by: Leo Yan <leo.yan@linaro.org>
---
 .../boot/dts/hisilicon/hi6220-coresight.dtsi  | 130 ++++++++++++++++--
 1 file changed, 122 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
index 651771a73ed6..27f067e87601 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
@@ -213,7 +213,7 @@
 			};
 		};
 
-		etm@f659c000 {
+		etm0: etm@f659c000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf659c000 0 0x1000>;
 
@@ -232,7 +232,7 @@
 			};
 		};
 
-		etm@f659d000 {
+		etm1: etm@f659d000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf659d000 0 0x1000>;
 
@@ -251,7 +251,7 @@
 			};
 		};
 
-		etm@f659e000 {
+		etm2: etm@f659e000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf659e000 0 0x1000>;
 
@@ -270,7 +270,7 @@
 			};
 		};
 
-		etm@f659f000 {
+		etm3: etm@f659f000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf659f000 0 0x1000>;
 
@@ -289,7 +289,7 @@
 			};
 		};
 
-		etm@f65dc000 {
+		etm4: etm@f65dc000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf65dc000 0 0x1000>;
 
@@ -308,7 +308,7 @@
 			};
 		};
 
-		etm@f65dd000 {
+		etm5: etm@f65dd000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf65dd000 0 0x1000>;
 
@@ -327,7 +327,7 @@
 			};
 		};
 
-		etm@f65de000 {
+		etm6: etm@f65de000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf65de000 0 0x1000>;
 
@@ -346,7 +346,7 @@
 			};
 		};
 
-		etm@f65df000 {
+		etm7: etm@f65df000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0xf65df000 0 0x1000>;
 
@@ -364,5 +364,119 @@
 				};
 			};
 		};
+
+		/* System CTIs */
+		/* CTI 0 - TMC and TPIU connections */
+		cti@f6403000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0 0xf6403000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+		};
+
+		/* CTI - CPU-0 */
+		cti@f6598000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0 0xf6598000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			cpu = <&cpu0>;
+			arm,cs-dev-assoc = <&etm0>;
+		};
+
+		/* CTI - CPU-1 */
+		cti@f6599000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0 0xf6599000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			cpu = <&cpu1>;
+			arm,cs-dev-assoc = <&etm1>;
+		};
+
+		/* CTI - CPU-2 */
+		cti@f659a000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0 0xf659a000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			cpu = <&cpu2>;
+			arm,cs-dev-assoc = <&etm2>;
+		};
+
+		/* CTI - CPU-3 */
+		cti@f659b000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0 0xf659b000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			cpu = <&cpu3>;
+			arm,cs-dev-assoc = <&etm3>;
+		};
+
+		/* CTI - CPU-4 */
+		cti@f65d8000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0 0xf65d8000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			cpu = <&cpu4>;
+			arm,cs-dev-assoc = <&etm4>;
+		};
+
+		/* CTI - CPU-5 */
+		cti@f65d9000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0 0xf65d9000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			cpu = <&cpu5>;
+			arm,cs-dev-assoc = <&etm5>;
+		};
+
+		/* CTI - CPU-6 */
+		cti@f65da000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0 0xf65da000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			cpu = <&cpu6>;
+			arm,cs-dev-assoc = <&etm6>;
+		};
+
+		/* CTI - CPU-7 */
+		cti@f65db000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0 0xf65db000 0 0x1000>;
+
+			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
+			clock-names = "apb_pclk";
+
+			cpu = <&cpu7>;
+			arm,cs-dev-assoc = <&etm7>;
+		};
 	};
 };
-- 
2.17.1

