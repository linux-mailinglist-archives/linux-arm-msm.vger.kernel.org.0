Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5487EB995E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 23:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbfITVxu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 17:53:50 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39620 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbfITVwy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 17:52:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id s17so2322257plp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 14:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=3aqllZnhirWen18NJ9rLavBCP+/YOWA9zZa8CCtZyTg=;
        b=wMrJXc68v9aJdzo+OnA3Mz2GYM11Il0OSp6IHgspaSr06VpOzVb7sLTylltNESBLoC
         /HNxT10D3zDISc0Si/wgimue3I/rZmmXqn6z0/VNgLPiEIWyMLyoyoXr/JUoTGVcUcXR
         /3zzsloGsSoGS1QTraOgpflGRpkx0KVor9OK631UYpJMJiifbHkzN/K/WieFPavf+DMj
         ZaUOxBvV41ataIyI1u3dbW4OoEGNIgVV3/bQLUx5b8Djrc9e9FGbZ6l9isNROYMxZV/T
         1AEv1MSaqLKAung4VS4+Tkxzuflh8kG1SdW7a6BMUHuxSzr1w19zlmxy+/b38m2a2tEr
         0b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=3aqllZnhirWen18NJ9rLavBCP+/YOWA9zZa8CCtZyTg=;
        b=E/TrzH/sYjux2YbZfkIgOCBRMV4/3+ps4v/xpQB56nkNHo9tCb7+AGp9GUmwbwtK9C
         fR0FMtDahhrc0zeVZO5td7cvE/5IiRiFBWknMdO134m0crZAaV8fmgE2iBf1QltlsAe5
         KOUANkyU+9YGiDj4Z1bq8QhVHKJFf6JF26nGrZqoIbSSv7ruC9cnjkw4xPXZSVo7Wmah
         52r7YupM0F7zSU4i3H+GvseIT34c44BUP6CLZ61eCO+378GVczJypLhMrg/2N6T29ONX
         Jle8LruD8ldtDZ9GjVnww399v0rmvkpw4ZbET6a4+Fwpz+ZfPRkOTDSO4VjlJYjMwXVA
         dM4Q==
X-Gm-Message-State: APjAAAVwzil6/+bO/cmhd+TGdbIyka/lgj6ycv6/tivkkEJe7xST0N3k
        n3fHHA9/JuhSUp/RflUzakRCFA==
X-Google-Smtp-Source: APXvYqwlLxc93paCbeuMzIk2hs9cdgFkfr/7oa6SsZqeCYmXLvQfWKFlwMvlclJqfQG3y9jtwdWqWg==
X-Received: by 2002:a17:902:59db:: with SMTP id d27mr17849375plj.253.1569016372972;
        Fri, 20 Sep 2019 14:52:52 -0700 (PDT)
Received: from localhost (wsip-98-175-107-49.sd.sd.cox.net. [98.175.107.49])
        by smtp.gmail.com with ESMTPSA id c8sm2795740pgw.37.2019.09.20.14.52.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 14:52:52 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v4 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
Date:   Fri, 20 Sep 2019 14:52:21 -0700
Message-Id: <47305ec06a4b76a79aa073e4c0202a27a853a700.1569015835.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
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

