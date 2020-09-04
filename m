Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6382725D190
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 08:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729626AbgIDGhm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 02:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbgIDGg6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 02:36:58 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97280C061247
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 23:36:55 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id n3so4777467pjq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 23:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IE9lC/ixMfDRzfRHZzChsL/a0bDv+YouA1+ToO8AWbs=;
        b=P711tSb8oZkiFFHqJquyTmI1rawAgNdQXCfBhLwlW44YmlFr/yIJYbHmRasZ6QdRX+
         8aZTXKdEwLxq0AFqBaJ1OU0oikaP/MNpv8jtKgy3hIYY8zvIr/TlvHgojDVxL5Dm1je9
         risAO3AgTP7W/vWG94KI3XEzFmEmq/XlUaOjfw9Bh325kRkX8fgFxXh/OBpUFTnMwAIE
         BDkys3h13VwEBtabYHEvyN8A1rNqkY/ETRPPGSsLEF0hxwJPhC3nZAJpzzE0n9VLIFmu
         DNx1So9l2+TvJRT//p0mlCyJacFMvCr7rdKbbKK8S77kU9mTSexv/MlHGauk9eVZUmgZ
         LQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IE9lC/ixMfDRzfRHZzChsL/a0bDv+YouA1+ToO8AWbs=;
        b=CXlVP8lBBow1HOVOjNID1CvAasUuy/9lrueao1edKzANrY32NX0VTV6KZNs7WD00jU
         /PUzrs6ZGLM0CLBFHm113UyW7XWl60Ip2wrP3DWgD2jzdL3Ia3o/RupTPmpVsj0yU8KW
         fGvbqh5Xvuluq9ygG4qYe1HOcYJ7PEyNLjTpsiG3K+HCz/bg2weAiD+aB6VsvL08jTbP
         0XsXLVeNOPxDQB6arURoMbgqnKYR+icqa6Uml4QGMyBlVEi8/Mgxwhs/CqcNjZ+5xIAT
         mSVFyG38//yFR3pAb6VbrYWaHUQbAbvv26X3jNonT3LlpHQDX8iv2in58axe2yS+ovI8
         3+rA==
X-Gm-Message-State: AOAM533V70+TvQpg6UFjK7uYu7Z5SJIusnnEBlKQNDayBh9HqGEUa5+3
        e2oOy7Kk8sqTQI38ZfyCSHO2
X-Google-Smtp-Source: ABdhPJztmhDnQBwOzeK9jF9q/IZuFV8bNxbb0eO3QLPkHByHO8bfVMdfmJ2KNJFLjPquwT42CMi7vQ==
X-Received: by 2002:a17:90a:dd45:: with SMTP id u5mr6895996pjv.198.1599201415111;
        Thu, 03 Sep 2020 23:36:55 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 143sm5315040pfc.66.2020.09.03.23.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 23:36:54 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/6] arm64: dts: qcom: sm8250: Rename UART2 node to UART12
Date:   Fri,  4 Sep 2020 12:06:33 +0530
Message-Id: <20200904063637.28632-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904063637.28632-1-manivannan.sadhasivam@linaro.org>
References: <20200904063637.28632-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UART12 node has been mistakenly mentioned as UART2. Let's fix that
for both SM8250 SoC and MTP board and also add pinctrl definition for
it.

Fixes: 60378f1a171e ("arm64: dts: qcom: sm8250: Add sm8250 dts file")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts |  4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 11 ++++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 6894f8490dae..6e2f7ae1d621 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -17,7 +17,7 @@
 	compatible = "qcom,sm8250-mtp";
 
 	aliases {
-		serial0 = &uart2;
+		serial0 = &uart12;
 	};
 
 	chosen {
@@ -371,7 +371,7 @@
 	gpio-reserved-ranges = <28 4>, <40 4>;
 };
 
-&uart2 {
+&uart12 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 377172e8967b..e7d139e1a6ce 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -935,11 +935,13 @@
 				status = "disabled";
 			};
 
-			uart2: serial@a90000 {
+			uart12: serial@a90000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart12_default>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
@@ -1880,6 +1882,13 @@
 					bias-disable;
 				};
 			};
+
+			qup_uart12_default: qup-uart12-default {
+				mux {
+					pins = "gpio34", "gpio35";
+					function = "qup12";
+				};
+			};
 		};
 
 		adsp: remoteproc@17300000 {
-- 
2.17.1

