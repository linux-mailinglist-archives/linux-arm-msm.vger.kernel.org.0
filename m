Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD47AF6AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 09:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfIKHRE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 03:17:04 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33809 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbfIKHRD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 03:17:03 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so11080863pgc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 00:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=3aqllZnhirWen18NJ9rLavBCP+/YOWA9zZa8CCtZyTg=;
        b=L3wGd7LB0bierPG9sbQdy13pJdxcVz2jCSo3BbxJYYWTs+0POADWJOxwUle/17TUzo
         nqLzYwD7X/sDwdnvK0tGeWCUrP5jVynB9yFyIiRf+/k46QIGkYxJmLeiedtivkGraazl
         i3nqMnWRkTPMiDBcLXyLkP+HbwVzO+u2wLRHtnzRxLKNkO5MHbk/k2q9v118eDi/ikPt
         zHlHdbNtsXVBE0hkfKlWJsAG5RlNxGxH72czlbwKJBqh0gVWQDsB+dVFrNhRiVqgmu0c
         +Z1d9pdiyZA+uVLxRAKVFrGN1NJohaQMQlasvruHAqtTBXLiFWOBJKSD6X+8gUiKo/NS
         ZBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=3aqllZnhirWen18NJ9rLavBCP+/YOWA9zZa8CCtZyTg=;
        b=JozUkQINKN5SidRAmdIjB6GZYdEqXEB4SBhRFW/VZR5tcCsTRQ+11GR7mktPi8mX7H
         IHKI+SM46MEz184Dt2CaxY370H8pAfzuZ6OVciZSyswAQw7hpSEqAjZ9AyTUDwViseoW
         KhBFVRLNxNExJaJqPpF0ZKdPr0F8xylEoOCLcJOHRKAddUUeBnrsFKbAgN2/AUOutRUq
         XlAzZqUXyh9+sEwqA1qym/F5va/+T8j5nApHtoirNBmRn/hLCW1nt+Xpc5VXCm+0IXAY
         2QlYgGnP1INgWprGHmmwE21Z3jce7+4AImo/Wj4E4GXK6ySh4QsQV2N9yQ8Mlp674y1i
         aOVg==
X-Gm-Message-State: APjAAAUrmxqM205wH1o4YhgpATVcN9k9p1RvVg6GiT6vFJxN/QYbzGAp
        xaN98FlAy8rliyO/lhs3kGwL/g==
X-Google-Smtp-Source: APXvYqwLGTmWnztX3+l4zBFHblSob682uzYu6tFIpr+t1m6e9BiXASPtmZln57+ZOh2b7p1jNtkysg==
X-Received: by 2002:a62:15c7:: with SMTP id 190mr39946864pfv.107.1568186222731;
        Wed, 11 Sep 2019 00:17:02 -0700 (PDT)
Received: from localhost ([49.248.201.118])
        by smtp.gmail.com with ESMTPSA id b10sm152893pjo.1.2019.09.11.00.17.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 00:17:02 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v3 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
Date:   Wed, 11 Sep 2019 12:46:23 +0530
Message-Id: <47305ec06a4b76a79aa073e4c0202a27a853a700.1568185732.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
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

