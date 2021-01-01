Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 068152E82CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jan 2021 03:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbhAACZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 21:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbhAACZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 21:25:46 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4198AC061573
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 18:25:06 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y8so10660702plp.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 18:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BhoRxuko7KSfFYnhq5Nsjj2QrBDkwsvdM4s7SqoC3BY=;
        b=xvUvyjiFavs1GRLLZlSBNqmBGNcJbm/MA4jwf5L+NEADwYI4aweCFXsrrPaMfO3hqH
         lVCqlME/vKsvK7vRAfypJznWHbRVAWCp9/bnPmFiZPszr+M0+wScHirqBvrWJRVMR6QP
         0TKyMuT4LQr7Yd7Mp0LnA4iUA7fpltTFf+EoYwZU3dMA4by9o9J9Dff32HQcqWFYN7Ay
         JQArl9CTHqjPPWjSnTYQF1/8qNzvYO6/KM5iZ3UQIfl3aJbXgp9wsvtKoa6qfKIG5k3q
         G53Bo/skDYOTEvpdHpwNGDVoA7A+Mg/iNskxTcZPy21qUc4UqK+UQOXZg//32HBeXczy
         4iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BhoRxuko7KSfFYnhq5Nsjj2QrBDkwsvdM4s7SqoC3BY=;
        b=ph7+dxZn+xygWlRTUu5tmfI/nz4EDC5KySQOlMPVgytu66kGBSGG6KDNa2xr5jrt+4
         2zKeOyH7NSUoVqviOqiWlE6PljoUP3tl151YqZtVZ2nz9W0l7hvUV0PDEJV3CleWFpHw
         YQVAIa9TUjTtf9I9CFjU5GUyZ0Xg2Jo3UqDzcMfoVYxW24AFwYcx3YGSZZAR+j5+ooR6
         VvDt/1C8Ry07ER4y+Jkb7id9rmQezRO2XdLAo5gUDp0UhYfCe2sg4YcpnM3JUVuak05X
         c7OhHyEwHIV3CukSm+WKOXF7XGxhfnbi0IO3KJiNE9/G7swVas5F0GZLyj9jfTSRTdUa
         ccyw==
X-Gm-Message-State: AOAM532g/Ay/r9CgkIlcd4BNMIio1eF1lkUDQkjF0azikqd0nhUDPLbz
        saXHKyLjMdmPKc8NJY7Rhr6Hug==
X-Google-Smtp-Source: ABdhPJzaU1i3PsIxPoRBvl6XGNpEveuLPgCDAtOWwSG79NgSNt68bpmnEQdZ087aXPMeWV29M8GK8A==
X-Received: by 2002:a17:90a:e64e:: with SMTP id ep14mr15198040pjb.5.1609467905725;
        Thu, 31 Dec 2020 18:25:05 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id h12sm50655035pgs.7.2020.12.31.18.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 18:25:05 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] arm64: dts: qcom: c630: keep both touchpad devices enabled
Date:   Fri,  1 Jan 2021 10:24:51 +0800
Message-Id: <20210101022451.21882-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Indicated by AML code in ACPI table, the touchpad in-use could be found
on two possible slave addresses on &i2c3, i.e. hid@15 and hid@2c.  And
which one is in-use can be determined by reading another address on the
I2C bus.  Unfortunately, for DT boot, there is currently no support in
firmware to make this check and patch DT accordingly.  This results in
a non-functional touchpad on those C630 devices with hid@2c.

As i2c-hid driver will stop probing the device if there is nothing on
the slave address, we can actually keep both devices enabled in DT, and
i2c-hid driver will only probe the existing one.  The only problem is
that we cannot set up pinctrl in both device nodes, as two devices with
the same pinctrl will cause pin conflict that makes the second device
fail to probe.  Let's move the pinctrl state up to parent node to solve
this problem.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index dcfe66f169f9..802966e11152 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -353,6 +353,8 @@
 &i2c3 {
 	status = "okay";
 	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_hid_active>;
 
 	tsel: hid@15 {
 		compatible = "hid-over-i2c";
@@ -360,9 +362,6 @@
 		hid-descr-addr = <0x1>;
 
 		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_HIGH>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c3_hid_active>;
 	};
 
 	tsc2: hid@2c {
@@ -371,11 +370,6 @@
 		hid-descr-addr = <0x20>;
 
 		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_HIGH>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c3_hid_active>;
-
-		status = "disabled";
 	};
 };
 
-- 
2.17.1

