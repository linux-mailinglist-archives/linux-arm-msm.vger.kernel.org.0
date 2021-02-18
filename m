Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4614F31F29C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 23:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhBRW4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 17:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhBRW4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 17:56:11 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB45C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 14:55:31 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id cx11so266517pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 14:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJsWZPsjAvkS9M4UJZDTVheggzJRLXODUCXr3rDhMIc=;
        b=mBtZCpmyFyj/HF1O+hiWaHTGDHtbjFm/eK7texjxvjVDQl/gGnW2sAY580Tcj1p0hC
         OkM4uMIHAY5i3KlmV5I7oVdR/anPUeSbeBoqkDSknnB/S35Og858yCBZwvfLH6qYfQqt
         peraHOGjdEpScSwHFV/ZboaiHeyteolD8z7TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJsWZPsjAvkS9M4UJZDTVheggzJRLXODUCXr3rDhMIc=;
        b=ZvAczPpDLaUZ/Dy3K+XMXCuNgSzkd6oWcnJ1sxR3D/cTMKKkzM8BJ6NNlA6mmcki16
         +/fb17oIOJu/Nj1Qouuw/BONfKwb0fwUuVdqN9Lj3qlO7WFEMgokBhyCn9sBIeS5UXet
         D2sSpiapzGlgxbbGOaCHy9d+U0w6MpcAo4Yc0cchOrsyqWZuS3eIE6qFXENiJgjyVQUd
         7BJGbigkra34T5XoLOBqGZ+/ew6mKPtB7zW+ZQs1YyLL65+pPDOH9kxL4Ztx6InV+86G
         QQWSNrGxyEx14PyWWnVUTs50/2hnooncfgr0sZpawgKXMoPSlZ6v2Yr86SQwLH8WOm5Y
         zcWQ==
X-Gm-Message-State: AOAM530/bwFhlGvTgBPMClOEqmyKoU2MAGVR7Or2QZCGmTykR0lJgV3p
        gxg7k9PewhctbM4K7wEuv6Z4fA==
X-Google-Smtp-Source: ABdhPJxrFexxJr1zX/X/iHVI3+f5tp6DY/SUfCp54QUf91xqTsVNxyqry+UTpv3W1GOZGtk/H85PJQ==
X-Received: by 2002:a17:90a:654a:: with SMTP id f10mr6027043pjs.202.1613688931007;
        Thu, 18 Feb 2021 14:55:31 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:91a:d4d0:d2d0:9d1c])
        by smtp.gmail.com with ESMTPSA id x15sm6483563pjq.47.2021.02.18.14.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 14:55:30 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: Avoid glitching SPI CS at bootup on trogdor
Date:   Thu, 18 Feb 2021 14:55:09 -0800
Message-Id: <20210218145456.1.I1da01a075dd86e005152f993b2d5d82dd9686238@changeid>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At boot time the following happens:
1. Device core gets ready to probe our SPI driver.
2. Device core applies SPI controller's "default" pinctrl.
3. Device core calls the SPI driver's probe() function which will
   eventually setup the chip select GPIO as "unasserted".

Thinking about the above, we can find:
a) For SPI devices that the BIOS inits (Cr50 and EC), the BIOS would
   have had them configured as "GENI" pins and not as "GPIO" pins.
b) It turns out that our BIOS also happens to init these pins as
   "output" (even though it doesn't need to since they're not muxed as
   GPIO) but leaves them at the default state of "low".
c) As soon as we apply the "default" chip select it'll switch the
   function to GPIO and stop driving the chip select high (which is
   how "GENI" was driving it) and start driving it low.
d) As of commit 9378f46040be ("UPSTREAM: spi: spi-geni-qcom: Use the
   new method of gpio CS control"), when the SPI core inits things it
   inits the GPIO to be "deasserted".  Prior to that commit the GPIO
   was left untouched until first use.
e) When the first transaction happens we'll assert the chip select and
   then deassert it after done.

So before the commit to change us to use gpio descriptors we used to
have a _really long_ assertion of chip select before our first
transaction (because it got pulled down and then the first "assert"
was a no-op).  That wasn't great but (apparently) didn't cause any
real harm.

After the commit to change us to use gpio descriptors we end up
glitching the chip select line during probe.  It would go low and then
high with no data transferred.  The other side ought to be robust
against this, but it certainly could cause some confusion.  It's known
to at least cause an error message on the EC console and it's believed
that, under certain timing conditions, it could be getting the EC into
a confused state causing the EC driver to fail to probe.

Let's fix things to avoid the glitch.  We'll add an extra pinctrl
entry that sets the value of the pin to output high (CS deasserted)
before doing anything else.  We'll do this in its own pinctrl node
that comes before the normal pinctrl entries to ensure that the order
is correct and that this gets applied before the mux change.

This change is in the trogdor board file rather than in the SoC dtsi
file because chip select polarity can be different depending on what's
hooked up and it doesn't feel worth it to spam the SoC dtsi file with
both options.  The board file would need to pick the right one anyway.

Fixes: cfbb97fde694 ("arm64: dts: qcom: Switch sc7180-trogdor to control SPI CS via GPIO")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 27 +++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 07c8b2c926c0..e6c58d12dacd 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -768,17 +768,17 @@ &sdhc_2 {
 };
 
 &spi0 {
-	pinctrl-0 = <&qup_spi0_cs_gpio>;
+	pinctrl-0 = <&qup_spi0_cs_gpio_init_high>, <&qup_spi0_cs_gpio>;
 	cs-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
 &spi6 {
-	pinctrl-0 = <&qup_spi6_cs_gpio>;
+	pinctrl-0 = <&qup_spi6_cs_gpio_init_high>, <&qup_spi6_cs_gpio>;
 	cs-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
 };
 
 ap_spi_fp: &spi10 {
-	pinctrl-0 = <&qup_spi10_cs_gpio>;
+	pinctrl-0 = <&qup_spi10_cs_gpio_init_high>, <&qup_spi10_cs_gpio>;
 	cs-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	cros_ec_fp: ec@0 {
@@ -1339,6 +1339,27 @@ pinconf {
 		};
 	};
 
+	qup_spi0_cs_gpio_init_high: qup-spi0-cs-gpio-init-high {
+		pinconf {
+			pins = "gpio37";
+			output-high;
+		};
+	};
+
+	qup_spi6_cs_gpio_init_high: qup-spi6-cs-gpio-init-high {
+		pinconf {
+			pins = "gpio62";
+			output-high;
+		};
+	};
+
+	qup_spi10_cs_gpio_init_high: qup-spi10-cs-gpio-init-high {
+		pinconf {
+			pins = "gpio89";
+			output-high;
+		};
+	};
+
 	qup_uart3_sleep: qup-uart3-sleep {
 		pinmux {
 			pins = "gpio38", "gpio39",
-- 
2.30.0.617.g56c4b15f3c-goog

