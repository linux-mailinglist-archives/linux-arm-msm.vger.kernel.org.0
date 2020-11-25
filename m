Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F432C38F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 07:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgKYGIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 01:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbgKYGIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 01:08:41 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432B0C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 22:08:41 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id f12so1214230oto.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 22:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VaBKKtVpxSZ3Ss3dI1KLi4Zn07ADzR3ErIEYv2rzINA=;
        b=ZPWNeabsa3es0f5hvmx5rpmvmadljn1fx39W2nxEFiM6S1awRNFuoojfNdTjaXefcx
         qdlVfthusC/ycUW1ZAt4iwkKKweZOwN9uNKXrMlpNR/68vbZCsifsgwdjjvChJ39QxBt
         7nmpFeV+pRmJrNPi0GsuseRXiiepBWPrlyTPRkUz+eKzn90HVvd/6Qx2UQZW241R+ZWU
         SMnuvCO4V4FwJbAMlfr2GVEuMpNIqJ/91m8erkPv2wXks6m+BOk1SnBWBJfdXKTkj+2Z
         ByERmMqbyE7hFS+PU4aIHFss8Dw+MvLG5Lxl2hoaKNhFvphZQxJ8YAj2JerX8Z7tNTU+
         p5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VaBKKtVpxSZ3Ss3dI1KLi4Zn07ADzR3ErIEYv2rzINA=;
        b=iVvYXUNYHSp+87TmJKUgvyuyKI47xAcHLObaahauiGSbFSuTNpolxlgiyPLYHj/9gG
         ymiHYS9HMldC7WukCcxlJTuMWAItnJB1SlvEWmFpfoYdowviwx4ZueZTdZwPbgNBV39b
         TLibod+/zhBWAph9yXyTrRFU1pSZvZGfWNhIz/qHYoDsBRJBzoEZwTVzo2HruRIBfHRA
         LntvgXIQutvbqOKQb8ZBl0A7i7gL35CckK/1c5By8H3AgmL1vFUD7AliPt1v0g8M0P0I
         3lVuRjgMhTWLp9g/f28TIznWkOIBnJNrMW8fYJV+tmEKJ14f21hI79bghWNbyaMB1ccQ
         1JEA==
X-Gm-Message-State: AOAM531Wh6Dtw1+x99mY4dMHWzaydPqNvMlt71nZtbm3+re5nfoOeBkj
        nyqE0kKS06xG5MEfDexwXXFifg==
X-Google-Smtp-Source: ABdhPJyXMGNAdk0LYHAP1IoQUMUGQadeLXFzjB2mODbIHaVopvUFo1lp+iWoI4MvfkZqkOuLblhkCQ==
X-Received: by 2002:a9d:6212:: with SMTP id g18mr1704768otj.89.1606284520272;
        Tue, 24 Nov 2020 22:08:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x9sm765968otk.9.2020.11.24.22.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 22:08:39 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: c630: Expose LID events
Date:   Wed, 25 Nov 2020 00:08:38 -0600
Message-Id: <20201125060838.165576-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LID state can be read from GPIO 124 and the "tablet mode" from GPIO
95, expose these to the system using gpio-keys and mark the falling edge
of the LID state as a wakeup-source - to wake the system from suspend.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index bb314973eb0c..f956dbf664c1 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -8,6 +8,8 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -21,6 +23,27 @@ / {
 	aliases {
 		hsuart0 = &uart6;
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lid_pin_active>, <&mode_pin_active>;
+
+		lid {
+			gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+
+		mode {
+			gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_TABLET_MODE>;
+		};
+	};
 };
 
 &adsp_pas {
@@ -466,6 +489,22 @@ wcd_intr_default: wcd_intr_default {
 		bias-pull-down;
 		drive-strength = <2>;
 	};
+
+	lid_pin_active: lid-pin {
+		pins = "gpio124";
+		function = "gpio";
+
+		input-enable;
+		bias-disable;
+	};
+
+	mode_pin_active: mode-pin {
+		pins = "gpio95";
+		function = "gpio";
+
+		input-enable;
+		bias-disable;
+	};
 };
 
 &uart6 {
-- 
2.29.2

