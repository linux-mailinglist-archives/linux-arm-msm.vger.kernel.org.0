Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B33CCD89A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 09:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733261AbfJPHeq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 03:34:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43637 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733052AbfJPHep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 03:34:45 -0400
Received: by mail-pf1-f195.google.com with SMTP id a2so14145018pfo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 00:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=3aqllZnhirWen18NJ9rLavBCP+/YOWA9zZa8CCtZyTg=;
        b=nN/f9lTgLnFe//TUKI8fJUpLDvb37TlumYOdeXiseUghsV12NwceaVk6fdI+9Hg1js
         QU0JA9GxvzOETosIhcMP9n+k7TyYT66Jvy7WCKCPLjjrlBRrVbM8w/uka0wSomrmqZ+g
         Ley+D4JU0NqatwT5HjVn4XtSjUklR8x+Ksbzx6HtRnM56MXtv3StN6tZBcJXERSeQ1RS
         9KlaZholTc00ZiABPfX8daUvs2nyS8rVMr0JGaRCmWsuvVGVnslvua0gmdE8AQlkwKFI
         mwKQM2bd/QMC9wEI3sDpEGrTkyKa5mXFbyHFYsVdDphL2bqo1NBnv8jw6ZyKnWc+umXt
         UbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=3aqllZnhirWen18NJ9rLavBCP+/YOWA9zZa8CCtZyTg=;
        b=lwwttTnjHloUpordcM7KloN6HpN5xaGdK5Tud9WAbjOERF8HoTr6gjU7ZygaMFzl+R
         YaAQBqwTVmsDvG8bZE2dETRjAiyk1HQYCe8VvWW27c7LK1B6hWPqMao3r4sBDszggKL/
         BrBWtjhlNPWaoKgMNNaQknPAIdFt0pgNzeNQAzR6Xf+emVhzxoz0CqQMuMiJsyjvEw+6
         zv1a/DX83qWVttQHBLm5iplj91H2obSTK2VSwvtf5qGRuN7tfJS5g+AGg+vldvg/vA0x
         W9rNqnaHmxoSl86fZ0HlU4G+95efxy2/7x6xfNvbnhwCrQMQEZKieEf+t7pC5LpCjdBt
         2V2w==
X-Gm-Message-State: APjAAAUA3LpOUb7nvCaMWqPwnVHksgS3E0gjIA07aeLn2edkRPob2qNH
        2cR49lwIKybcBZGIrARAuCwxjg==
X-Google-Smtp-Source: APXvYqwfte9XhdSYM55DyFdMc8EXjE8ALAxtD3g0A+FhtCl+sngVHAXe4ybUq6Y3bphE2tbcyYrwaA==
X-Received: by 2002:aa7:96d1:: with SMTP id h17mr43196272pfq.187.1571211284804;
        Wed, 16 Oct 2019 00:34:44 -0700 (PDT)
Received: from localhost ([49.248.175.127])
        by smtp.gmail.com with ESMTPSA id bx18sm1468650pjb.26.2019.10.16.00.34.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 00:34:44 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
Date:   Wed, 16 Oct 2019 13:04:05 +0530
Message-Id: <1726fdbf7cf7200ac5dc2a4c811aaee7edc47fd5.1571210269.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
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

