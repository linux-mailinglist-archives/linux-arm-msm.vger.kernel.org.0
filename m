Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A932C56C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 15:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389988AbgKZONk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 09:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389834AbgKZONk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 09:13:40 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABCEC0617A7;
        Thu, 26 Nov 2020 06:13:39 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id y4so2438561edy.5;
        Thu, 26 Nov 2020 06:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n2eFuuH6B+oZkz8tFDCjc/cdWtzItPupMT/Dcx8KuCo=;
        b=Nl5OeAMCNpcgqycBAmhWwe66S7XeC7eQFHPA9IxKbaTPogfk5Y0MyPIk59W/GKAaM7
         N2rSVXo2j/WLhqYGBNVCurOKqZyyFi77dnzeaJPPpyVRW1NW4GWQWJ/zz8cVie7baKDY
         KWgRRA4KM7QQxx/Z12adUOfePnOE7BTXTwFTGDIdvcyhN0wDcmRUfmS3cdYDTChecH7j
         s0N1gNV+Z0pPLsdDgeAlbwCKXuQIZ+vkXnJgVqDUg0L9v+lHiXmE5+9UT4pWMa82g6oy
         vxp1ys6F0bhjZWF9CoOIuR0TG3MLTledEsr6xENHU+4c0w2KdjcBd6zNSsif79z3rKrN
         mAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n2eFuuH6B+oZkz8tFDCjc/cdWtzItPupMT/Dcx8KuCo=;
        b=SihV0YXL6FzZHmIlf4HdbVdCPgOymU3EOl9xvQAghcBiZeLpnuq9HfTdMiV+6ZuUdL
         HO62sqzC9MrnS/ytxDG4AbIGSt5cYtr16OBi//TQL2riDhk+F5IcxTGAmYUlW6y5vx9f
         Ps7/2biYq/SVD4Y6j+vZKnDTMpOshKWyOkqn9wEGubrm72sms8ROxqLOBWrClywkhUFS
         icXBzsSwzwt6YuMNj7D8eCrMEbIQqf107ISExAZRKA9UxSIczlJkXAotnGurerH2Z1iQ
         N36PQqZeVl/q//xvGhSx84rk8C/iq5nXWM8oNSKUckHcibNgrm0PvdGaJiomUgHiZ75b
         UA8Q==
X-Gm-Message-State: AOAM531w4zto2KE2R5vzRu/bFYFJ60g6l0akj21XiY5aiAwg0xDXM2gP
        HmfRaXQ8Wa6VmRRhIZsWkOo=
X-Google-Smtp-Source: ABdhPJwLr0fIgxvzzYNWHnu63PnUW5t0PdPhxgcvzPwmq9jC7NFcPQj5QbN4emJH0NH0ARe5zqjipg==
X-Received: by 2002:a05:6402:1352:: with SMTP id y18mr2711639edw.378.1606400018672;
        Thu, 26 Nov 2020 06:13:38 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id n14sm3281139edw.38.2020.11.26.06.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 06:13:37 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@protonmail.com>
Subject: [PATCH 2/2] ARM: dts: qcom: msm8974-lge-nexus5: Add fuel gauge
Date:   Thu, 26 Nov 2020 16:11:44 +0200
Message-Id: <20201126141144.1763779-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126141144.1763779-1-iskren.chernev@gmail.com>
References: <20201126141144.1763779-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LG Nexus 5 uses a maxim17048 fuelgauge. The maxim,rcomp value is
taken from downstream dt. Temperature-based compensation is not yet
supported in the mainline driver, but the readings seem fine nevertheless.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 32b474bfeec32..e769f638f2052 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -566,6 +566,22 @@ charger: bq24192@6b {
 
 			usb_otg_vbus: usb-otg-vbus { };
 		};
+
+		fuelgauge: max17048@36 {
+			compatible = "maxim,max17048";
+			reg = <0x36>;
+
+			maxim,double-soc;
+			maxim,rcomp = /bits/ 8 <0x4d>;
+
+			interrupt-parent = <&msmgpio>;
+			interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&fuelgauge_pin>;
+
+			maxim,alert-low-soc-level = <2>;
+		};
 	};
 
 	i2c@f9924000 {
@@ -706,6 +722,15 @@ gpio_keys_pin_a: gpio-keys-active {
 				power-source = <PM8941_GPIO_S3>;
 			};
 
+			fuelgauge_pin: fuelgauge-int {
+				pins = "gpio9";
+				function = "normal";
+
+				bias-disable;
+				input-enable;
+				power-source = <PM8941_GPIO_S3>;
+			};
+
 			wlan_sleep_clk_pin: wl-sleep-clk {
 				pins = "gpio16";
 				function = "func2";
-- 
2.29.2

