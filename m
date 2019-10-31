Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C019AEB736
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 19:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729453AbfJaSiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 14:38:17 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40927 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729429AbfJaSiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 14:38:16 -0400
Received: by mail-pg1-f193.google.com with SMTP id 15so4598676pgt.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 11:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=3aqllZnhirWen18NJ9rLavBCP+/YOWA9zZa8CCtZyTg=;
        b=o+V8mfJnGcNRBIysUz3ogBIYyeQLpvCAokFHFk3CcXJmiW1VMtm8jwXgA9ITcdbOCI
         dpipZiut4ELq+5dqxkkwzdTUrXo7h8QuxnXI7Gk9WFX9dM0I01JlXFDJ26LjFH/S9WFm
         0OpbVc819QkOksWL7iNk56Dz0bIIFCZHmNaCURmU4P6hhV839a0frnrjNgJBdQxEqJI0
         L98/m2btd3eRB44eNjWZcgdA89ZGW1DpgTK8oZ3bImEfQmqlBIL/h74wiRaJWWgUspXO
         qrXrNDh7dmNhxFZzL8ZmQcDW/K9VCUYJ4Wd/NbDhtvguNXKWvXIbKRbCvsVDTcKKhCH8
         hSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=3aqllZnhirWen18NJ9rLavBCP+/YOWA9zZa8CCtZyTg=;
        b=d2XFd9gP1Pi1SppiQA79uPWAREHfIQFtg5mZgR3ZZmhSEifFUQsW1qwSLhHS2Nck9I
         cKTmGRZXg9ddc+HEIqMaM6XmQOIEHnrhkprgA4P/xgknGSEGJO9Y30a9Uj55HrflRrt5
         5ydHepmUbMeUjxjF+V7a5sLeR7OTO3X0XW9K15sgyEcNHUHxJs6iwNhFxlvX+os3vJuf
         YgDwYBIUKV2ZsfVVp1XJYMae34S5ZesL9jqXdy93NBO7JuZIN35tvaaNEM0RcKP1SACA
         a2Hievi6rMFwyxeT6Bf14UHJC41eh7bK9DIxUCwACJv8DSd8FOs9YG1LRG9LwSfAzrPc
         RYAA==
X-Gm-Message-State: APjAAAVfeE4dEdQFwycA3gwcdj2rC7HC8XTtE7jHmv1VcZh2K+ppBFZK
        qEGXy2WhBuTkq78d4sETwpFsVA==
X-Google-Smtp-Source: APXvYqzaApqXtEra28Hi9Be4UqLrpLV/oQdr7G+MWkAtzVgUBjSh8sBzdugn282PcVCuk+CWFPHaJA==
X-Received: by 2002:a17:90a:9201:: with SMTP id m1mr9657985pjo.42.1572547095176;
        Thu, 31 Oct 2019 11:38:15 -0700 (PDT)
Received: from localhost ([49.248.58.234])
        by smtp.gmail.com with ESMTPSA id c34sm4206329pgb.35.2019.10.31.11.38.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 11:38:14 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v7 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
Date:   Fri,  1 Nov 2019 00:07:30 +0530
Message-Id: <1726fdbf7cf7200ac5dc2a4c811aaee7edc47fd5.1572526427.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8916 uses sensors 0, 1, 2, 4 and 5. Sensor 3 is NOT used. Fixup the
device tree so that the correct sensor ID is used and as a result we can
actually check the temperature for the cpu2_3 sensor.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..8686e101905c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -179,7 +179,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens 4>;
+			thermal-sensors = <&tsens 5>;
 
 			trips {
 				cpu0_1_alert0: trip-point@0 {
@@ -209,7 +209,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens 3>;
+			thermal-sensors = <&tsens 4>;
 
 			trips {
 				cpu2_3_alert0: trip-point@0 {
-- 
2.17.1

