Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C48DDE9B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbfJUKgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:36:14 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42060 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbfJUKgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:36:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id f14so7538809pgi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=OduEoDNss3AClsOVOILgd3QefK3f48yVM80qRgfoc6I=;
        b=LCE4IgXYNcL1m1VOeylfBui8KVijCrII8487VyiwvEfW40NyjW8qu2EgExyW4J/7mz
         vPgsQtbeUXljiHns5B6jnN3PheCdbJ3Nmt6M9Em72WHKtTnTVrbgAo4+2hVYuUsDG7nG
         NoAoiInr1+s5gZ5EF3xS26bBKYf5GipeO/AuZh9AR5inz6s2ALimAZBY50qJOQ0Owo3V
         QxKDAWmGpQ5/IHyJ+y5RubsOPzU1y2nU4FxXyE1wr1lwVCv1ClhtZML7bP/Cqmop8y0+
         1BwejyOfLrmCgGzaAxuu1G/VdI4Vmrv5NJ+8wOzZ4zWRunIXpnLnouvpDMsF/mYExgXX
         H1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=OduEoDNss3AClsOVOILgd3QefK3f48yVM80qRgfoc6I=;
        b=ht9BIO2M7zJ6K1myrm0tjAsS+k5hO/GPFeKIOtqWVHFSd+6S+gs9bdiolkT4LemUWg
         bFwurBajd9h7xI/GBmdJjkEK3H12VhYbyv764ItVlxdlOmtPj+V7/pkQYF6ZHZfyi3lE
         dBesU+xGtpKHuWyvrVCKYeTXbp0rfF64ZYV/qJosSfJpwNR3KoCQR2cJGYtIRomdAwNl
         /pvGi4SucDVoeotrM6IkC5mp4eUtT3mFKbYjvgZ0IaIuvnxrSSp3C+cHX89GZFBlOy3y
         ATTfbZNnJUE/LUp7NpuwhT5ICrl7+Q7PQl2CeAEn8zlGSnw8XAYCIbc9HKysBfgb9Q8t
         MHfw==
X-Gm-Message-State: APjAAAWzG7N3c8tgwmLEpTI3MDjVmYOcQWLVBAKt0a7dZ8t6j4z1XJKL
        3sltHoFVBzG/aJV9wfq8ujP9Rw==
X-Google-Smtp-Source: APXvYqycQTj+QhwBKEywkZypXg3RK4vljEXGT5VhZKd6LjB0yUOh2sfc5+n042hNk59RHfelztI9Cg==
X-Received: by 2002:a17:90a:eace:: with SMTP id ev14mr28630132pjb.57.1571654170884;
        Mon, 21 Oct 2019 03:36:10 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id x10sm13478847pgl.53.2019.10.21.03.36.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:10 -0700 (PDT)
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
Subject: [PATCH v6 08/15] arm64: dts: sdm845: thermal: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:27 +0530
Message-Id: <5a96df48e546576f90081bbde218e7cff88ae8ce.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f406a4340b05e..0990d5761860a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2950,6 +2950,8 @@
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <13>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -2958,6 +2960,8 @@
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

