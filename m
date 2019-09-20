Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 788F4B993E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 23:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbfITVxC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 17:53:02 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43663 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729629AbfITVxB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 17:53:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id d4so1472329pgd.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 14:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ZwCxmgUQhS9SSaQKkkkSIJsmLTrN1BacMY6pM2O/8bI=;
        b=sHrR167docCdJXHVTdDaf03xJf2yw4xV+1F6MU8K8Q0HAGV7REGkH1/XmSo2VA1BsN
         Ijn7d02eUll0eobiBr74IcbvRpYheIA77RgwfW6gj5nVtHe0NrphY+w+F+3XjQ/j+nfV
         oLsS/eucdmOtM4s5NzDB8GKZJ03rYdxkWyFxqO2TwZu1Ji02YjSuahNYSQSp6Ew4EPK9
         So6NQaAIzqEo7bY9MotYb95MhF8OGUmavXd5uu70ysyA1/Mx7QESgHrvHxJcL08wtpl7
         RArdT4jmauDpu4spqfsUMYmPt84Jbt6z+tFaoqiBChbUne3iPI2smoKpKGEVF1M6w6n9
         eYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ZwCxmgUQhS9SSaQKkkkSIJsmLTrN1BacMY6pM2O/8bI=;
        b=Q6HXsVdbm5ISDuLA4QBIdnV9Y457a6qPbOmwlGJ4jhWbvJ/Eh4V2J5uijr+HQpOMEG
         5Szhx2ReCX79A+kf6+Pq2nOnDlVPH5h4BrD8bpePRxsmiPSVTax9VEu4DRU6N4gWRk48
         KasPKnaXmFdJWm1IRt6nfFE5RI42LkDSt9UJhQleCfZdyXsCMAUqHBMhJlII3bSBKYaz
         jRzyCQR7+lVjp0D5GEfsJLD0ypDFXIJnh4Qk/QTkr+37dpjm9w0U+GYCbmpp0d6TZJ+H
         88CZcxU4qSYvbpUKlpzAKzUaCZIoS2ygr7NHqZm8cY9HeZjxZRvN8Bx5tLU+ague3Znr
         tMuw==
X-Gm-Message-State: APjAAAU42bB5WNG4xN1qquctnv/3l7VVqCZtdGr7OEPoiC57lotEahCx
        bauZCr/HSaBpshOqo1QxUZ4RxRJiSK8cKQ==
X-Google-Smtp-Source: APXvYqx0v985AJJaz9o3vgXkDunjaWsKGIZjYDu51mWQmTrr8MCM1i/rFBjR0rE583N8SY8Dp7jzFg==
X-Received: by 2002:a63:501:: with SMTP id 1mr17148626pgf.290.1569016380014;
        Fri, 20 Sep 2019 14:53:00 -0700 (PDT)
Received: from localhost (wsip-98-175-107-49.sd.sd.cox.net. [98.175.107.49])
        by smtp.gmail.com with ESMTPSA id 127sm2662448pgi.46.2019.09.20.14.52.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 14:52:59 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v4 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date:   Fri, 20 Sep 2019 14:52:24 -0700
Message-Id: <f627e66c455f52b5662bef6526d7c72869808401.1569015835.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 96c0a481f454..bb763b362c16 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -175,8 +175,8 @@
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 3>;
 
@@ -196,8 +196,8 @@
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 5>;
 
@@ -217,8 +217,8 @@
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 8>;
 
@@ -238,8 +238,8 @@
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 10>;
 
@@ -259,8 +259,8 @@
 		};
 
 		gpu-thermal-top {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 6>;
 
@@ -274,8 +274,8 @@
 		};
 
 		gpu-thermal-bottom {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 7>;
 
@@ -289,8 +289,8 @@
 		};
 
 		m4m-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 1>;
 
@@ -304,8 +304,8 @@
 		};
 
 		l3-or-venus-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 2>;
 
@@ -319,8 +319,8 @@
 		};
 
 		cluster0-l2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 7>;
 
@@ -334,8 +334,8 @@
 		};
 
 		cluster1-l2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 12>;
 
@@ -349,8 +349,8 @@
 		};
 
 		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 1>;
 
@@ -364,8 +364,8 @@
 		};
 
 		q6-dsp-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 2>;
 
@@ -379,8 +379,8 @@
 		};
 
 		mem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 3>;
 
@@ -394,8 +394,8 @@
 		};
 
 		modemtx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 4>;
 
@@ -591,6 +591,8 @@
 			reg = <0x4a9000 0x1000>, /* TM */
 			      <0x4a8000 0x1000>; /* SROT */
 			#qcom,sensors = <13>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -599,6 +601,8 @@
 			reg = <0x4ad000 0x1000>, /* TM */
 			      <0x4ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

