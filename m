Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E748D7CE63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 22:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730775AbfGaU3x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 16:29:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54425 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730640AbfGaU3x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 16:29:53 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so62141216wme.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2019 13:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1eN7cVd81RI8zQ0Y9k2UD2x6CFiI8Tg5XhL9VySum/g=;
        b=YV/R5BSMFAh570iRGRBD+cQsWsJMFzQ9gG4bGL/RfB32IWA8XWQeNI5O0Thy2ZYp3D
         0R9pHt+GGiTfp0GJbd7ldKYk/cGLe4sDDFbAxLUywQ8JpeGf04r2+4aXtZvWA41ZNgOz
         Ga687vg1J/lEgYqb2BK7TqMePNgA5tMCBoqMtIiqAwNmUj2veS08uPt9qYWEw79ufpms
         AMsxqa5tQzIjPGAQZVtrImgh9ifM/d/sWBl+iDfNP3djoNjHT+3jg9gOeiztVzXdAMMR
         oLeGbEuGiUBJv17NIERP3qXzZA1aIXI6F5E9+wMnlf8vPQuU5shUVedUGy5fClF3LwLm
         V/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1eN7cVd81RI8zQ0Y9k2UD2x6CFiI8Tg5XhL9VySum/g=;
        b=srZzhnxnjXHEEcied3nH2lYmMgOuS5rtMYewRpyka1F46u4u6Ok5knr6NHa7SML/U8
         XWP2TXP4QY6m4HhiffT6dK+a5YBWGdVVqKIQ1wmO39Xlw4uXd58eTiEpgDFnqlMqrPOj
         M8f5MNcoBVmtuWXsVMrqF9U945tiRskGtRgOMpiCvQskQiR9iwZaLmFm6IIyV+O6TBAD
         34f3MyGrKA4bhzfUzPBFpoaS0AGGH6GxigI7uJrcEdcL+ZbEx5VE3ZSOI9AON+Uhpdxp
         7+LMBA3nU1lqo0TsJJ2iyG3Xnz0a2g84qGDd6QKGeHkS5zk3OoJDO2LIHM1ip/LEMumg
         C94A==
X-Gm-Message-State: APjAAAW+3yblYhbyuBdwhyUu2amMXy2yYaiOTqGjQic7zR5h3nIL3Qjy
        fYVAish3kZvvQO8gXeSe43rnPw==
X-Google-Smtp-Source: APXvYqzNwzPOT8ikRcH8Z10UCUrFJdD9U7xIkEr2QVEDWI8Dja3e2Osr7FtBYRKIc8wpPjGJiXNCVg==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr37876401wmk.36.1564604991184;
        Wed, 31 Jul 2019 13:29:51 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:50 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v4 09/13] arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
Date:   Wed, 31 Jul 2019 22:29:25 +0200
Message-Id: <20190731202929.16443-10-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the clocks that feed the APCS mux/divider instead of using
default hardcoded values in the source code.

The driver still supports the previous bindings; however with this
update it we allow the msm8916 to access the parent clock names
required by the driver operation using the device tree node.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..96dc7a12aa94 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -429,7 +429,8 @@
 			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
 			reg = <0xb011000 0x1000>;
 			#mbox-cells = <1>;
-			clocks = <&a53pll>;
+			clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
+			clock-names = "aux", "pll";
 			#clock-cells = <0>;
 		};
 
-- 
2.22.0

