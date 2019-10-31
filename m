Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4AEEB74D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 19:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbfJaSir (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 14:38:47 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34484 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729510AbfJaSip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 14:38:45 -0400
Received: by mail-pf1-f195.google.com with SMTP id x195so1476185pfd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=03jpeb+1aJx4bxpcdPiavfJJhVJ5WBvL1EOxBoz3J+I=;
        b=RTUBszU67tqZ647YAjtR79n/WWBxY1HEukkB6UM1peWi8r/b2lP0Eyh2P0cCN4kKn1
         NUfwptQ2NjOPM5cy6SVYgu+ai6mR0vN1OUWQCkX/Z7L7CK0RUxSLyp1Xa/UGynADu+6T
         gTtH9bjlwXH6yDaY1DuoXgc5aWjCfHGw24D8mMfxSHrn5L4WqQJOtPt0MUeS1tTP99Nc
         cB2ZarJKEK0tPnsgqcPLZxPG1Xmy4Xcko+DumqJZn0OX3JCBGJ1khx6mrXX/XYLiCb06
         V6BHD8ept9ZeZnOZ0vQLVy+NPXanvq2zhBIYYdt+/fq9lAPxIHr9RTVZnNKjMTnUbdIe
         G5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=03jpeb+1aJx4bxpcdPiavfJJhVJ5WBvL1EOxBoz3J+I=;
        b=pESmkcIqdfGEV7RA4LxCzQZJhqGmRxniqdkQr3a0P3QoSueZRMK0tzZamt1u62lmyT
         e0SxtaJ+yUhrVQG3YGO/UaoM5zSl4bhwS//M/pRvqPcbJ/3ELuAFyJYkv8c11+qgW6eW
         pLDZyO0qfJhGT7MSk07ZQE9Rc4Ho3TsvNeXdpFhi8thGnS2mW9s6yWPgPsdOlANhfsUX
         eIq8erzCoSXtNkXUA1AnhrCvQawGY1FZl++aJOPa+luiYcN6CPp1JkvbexBL3amPbfcG
         NXp8ZpVdu0ekv4Txdx3CaELfEVgJPSza1ASKTWBH+6u5r9k+38ACtFGleEpClT08n4bb
         GGvA==
X-Gm-Message-State: APjAAAU3a7fR+xH807nJWcLPYChRwG4ayLLhmWyONMjHFf6fRqhsEJKu
        2eIQ/ogzbCxDGPXHIyBwv0U2Ug==
X-Google-Smtp-Source: APXvYqzEcRi+F8ZAgoHWdox7T1PyBtvSF3v9hYfswzbx6+IYRJtrIN2pdTZF9J4y8pgh1MuIm+obLQ==
X-Received: by 2002:a63:c411:: with SMTP id h17mr8279122pgd.360.1572547124803;
        Thu, 31 Oct 2019 11:38:44 -0700 (PDT)
Received: from localhost ([49.248.58.234])
        by smtp.gmail.com with ESMTPSA id y16sm4297238pfo.62.2019.10.31.11.38.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 11:38:44 -0700 (PDT)
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
Subject: [PATCH v7 13/15] arm64: dts: msm8916: thermal: Add interrupt support
Date:   Fri,  1 Nov 2019 00:07:37 +0530
Message-Id: <88eff964b708c8aff57b24370d2e14389ace09e9.1572526427.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupt for the tsens controller.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e101905c..807f86a4535e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -816,6 +816,8 @@
 			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
 			nvmem-cell-names = "calib", "calib_sel";
 			#qcom,sensors = <5>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

