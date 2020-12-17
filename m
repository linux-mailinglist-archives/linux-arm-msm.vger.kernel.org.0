Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81C52DD3D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 16:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgLQPNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 10:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgLQPM7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 10:12:59 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B640C061794
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 07:12:19 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id j22so20389257eja.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 07:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bsmxj4WXk4Q4NSFr6MB9LgmIGzcP4uZ3YJ5A+DlLg9E=;
        b=gb3M5Uw2+fnPw987oP/ibgwGoGtabUek1i6UIEPlB+vpfzOA6d6LqZOWeLLOYm8+0r
         YeM6Q1lPKF/omgdAaWz6ekd+8Om7F1WRXqZ200ICRcN2c7mWUimMGcCxcQUefCK1hsQ3
         rQRDFNfCwIjo5zv7Z0SwxHGyFjQAMNsS5dYm3X8kmrMBTRmbS6izs/Wi1sgqVmIPrbKq
         NRKV22qtDPM4Zyq+aWE9lMaGqdU/aONTqWznYMIQ3X7KVrNUxY6vLQtEtxtzPbXwbs25
         V6MO7I7sk8Ayy5zYx6Z3EkwJP9VgaFuKuUiYU5KOgDnM8Le5Xk99EP8qPsVupw2p8j+c
         tXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bsmxj4WXk4Q4NSFr6MB9LgmIGzcP4uZ3YJ5A+DlLg9E=;
        b=F0qmadhzQMvgSJW7XqOsrBHKsEO1xwIef4SXPoo9l9kmr4Ta2ZdA4HVAbjnSa3qsMf
         SwzHxKA2/NpLUSQlrrVPxHg3eavfyBAC4Xoxe2LuuRNIG/sAxLSM/JZSkxBPPMWO2iIg
         48hF7e6RdyjnK9yCcuZ9/gYVsOlUjKA5p/wREX+EzTPs06mCBSL4OKYkCelBjEteGDUI
         uTsrkJPJmM4cE+eauNIUrv3OROkDYY7ZbenepT2o70tRDj3VmkUcjAqWjNntO0ZKNCDF
         dMF0XQVj0hywFNKiyWs9t6uVT980wAbYRmsN8FpczLixv6Q2izc3xtMKQ6nQIO26o0Tc
         /+2Q==
X-Gm-Message-State: AOAM5300ojJiSPsWnPv9Oxy326d3o77juXmmDj8b+f/LyPnPBP09n93Y
        qq7UpYZIdtcTAUAKgK0wCcSvQg==
X-Google-Smtp-Source: ABdhPJwvTqroST8YwDqTK1rv4XcaZ5omqWIg0pGRgVbScNy/rP6f5+ATMOp3a3ZZfGf8wZJHYPRJtg==
X-Received: by 2002:a17:906:43c5:: with SMTP id j5mr36863773ejn.530.1608217938104;
        Thu, 17 Dec 2020 07:12:18 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:f0ff:2796:69b1:324])
        by smtp.gmail.com with ESMTPSA id k21sm3915267ejv.80.2020.12.17.07.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 07:12:17 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        robert.foss@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: qcom: sdm845-db845c: Fix reset-pin of ov8856 node
Date:   Thu, 17 Dec 2020 16:12:00 +0100
Message-Id: <20201217151200.1179555-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch reset pin of ov8856 node from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW,
this issue prevented the ov8856 from probing properly as it does not respond
to I2C messages.

Fixes: d4919a44564b ("arm64: dts: qcom: sdm845-db845c: Add ov8856 & ov7251
camera nodes")

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 7cc236575ee2..a943b3f353ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1112,11 +1112,11 @@ camera@10 {
 		reg = <0x10>;
 
 		// CAM0_RST_N
-		reset-gpios = <&tlmm 9 0>;
+		reset-gpios = <&tlmm 9 1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam0_default>;
 		gpios = <&tlmm 13 0>,
-			<&tlmm 9 0>;
+			<&tlmm 9 1>;
 
 		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
 		clock-names = "xvclk";
-- 
2.27.0

