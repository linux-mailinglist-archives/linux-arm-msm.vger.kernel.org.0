Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D573F7FB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 20:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfKKTVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 14:21:47 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43301 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfKKTVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 14:21:47 -0500
Received: by mail-pg1-f193.google.com with SMTP id l24so10029053pgh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2019 11:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ENjlE2+CrfkXc2Q7mLSVouta0KsTjqmsOLCAhcO+7eQ=;
        b=l0HiMZP+b+mZ9p/Hx0jZWQg6r+cIYVPzDukzFvAkW0W63WUQ6Z3du7s+GssF3kQ0Rb
         fU60AAq2srBAMp6wDzN3IREAiS9O+4RvGJt7uiHp7sTrGseDdNIFnYL0etGEZKLoSedK
         5ZQMUdNtFqsBU+OKopxsWXK4Z+3TYzr52Ls1hpCited7/UsMzMG6n8YCF+WY7bqRxb5c
         mBxp6AKBs0apNa5Ee6BLRbEJ1Tu/r4EUHiht0UfZFp/EvH4jfV9uoErshi0nQgEAChdS
         IMStg6EIKZqBCtvy+QkOZw+etC1HHIPjQlNf6flb9L05SURrheFB0XuG5RSdV/0RBisb
         u0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ENjlE2+CrfkXc2Q7mLSVouta0KsTjqmsOLCAhcO+7eQ=;
        b=etlXRtDY03Txp2hBBHVYPTm6GRa8Nt80AYeDrl8TEHHBAhv9kpFOMNscaXrUzlunI+
         43VtUA14SKtBQeIocL5aYkUhSkIqoDcq+/akLSA23pghaGNUxYitx2/JdAqjUiTDkRG7
         VB6gzj/MFnMENLfLKVG4kgIVqnEnMC5jp1U8yVsmOMmmqTYDD85pNNaNu3XlYXidcP57
         jNHPrkN3KTV2wE+DBOzzAQgKReS0DKtmWOhOjNtL1+HlLlz1JYfuuaHtIdl3PdiBSmd7
         Dtp6D4phcYQbgLd6XGd7S2YFx8Uh6vSXk3Cfip2wzz9atznnHcTsZo34/hwk0j5ri7G6
         pHPA==
X-Gm-Message-State: APjAAAUPTxwtRJyZ1bW8pB7WnSiMIcu/m/tLi1XEpa4ppm0d0oYk07qh
        hzchbN68/zyPrN0Aq/Yy8DS/Kg==
X-Google-Smtp-Source: APXvYqwN5zcAG2LINss6GXyueKmSTOhdlbEsZ/PLP8wu6FsYB5FbGntlXUi6GjR0CKSLO+/zFR7vaQ==
X-Received: by 2002:a63:1c1f:: with SMTP id c31mr11872860pgc.292.1573500105937;
        Mon, 11 Nov 2019 11:21:45 -0800 (PST)
Received: from localhost ([49.248.192.129])
        by smtp.gmail.com with ESMTPSA id b5sm16982813pfp.149.2019.11.11.11.21.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 11:21:45 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: sdm845: thermal: Add critical interrupt support
Date:   Tue, 12 Nov 2019 00:51:29 +0530
Message-Id: <c536e9cdb448bbad3441f6580fa57f1f921fb580.1573499020.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1573499020.git.amit.kucheria@linaro.org>
References: <cover.1573499020.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1573499020.git.amit.kucheria@linaro.org>
References: <cover.1573499020.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register critical interrupts for each of the two tsens controllers

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Message-Id: <3686bd40c99692feb955e936b608b080e2cb1826.1568624011.git.amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0990d5761860..3b643b04ab5a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2950,8 +2950,9 @@
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <13>;
-			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -2960,8 +2961,9 @@
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <8>;
-			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

