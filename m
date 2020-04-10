Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB40E1A3E4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 04:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgDJCct (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 22:32:49 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40128 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDJCcs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 22:32:48 -0400
Received: by mail-lj1-f194.google.com with SMTP id 142so615995ljj.7;
        Thu, 09 Apr 2020 19:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WbfQJnH6RMbPR4Tuk3580npqQDobRyP1jPZtOu/Ghcc=;
        b=QyeRCji/WcqVGUHvdf8W1orbFoexxlm7dh9Z95ODigM+MYexOTa6Oduxg+i0tH6zo/
         kIxAVId8ouCPBWXRJAGIGI8Suv3Wrfjr6scNcH8sbWIYzxJl3m6stdPLy+mN9s3Bfray
         kdt2G2aVOScIlCcziSOzRW8Eyy9ve6QbtDtObZ9v6shI7g3kyE0+g9XBpdFnT/GLj5PL
         xF0v6qoIZqwJ8eeMq+nK5SW+PQhwj5R0iec4UcZ3JAH8PuPdinIziOBJzDZpORwkfliy
         LnK2biCUym6lf4P5rtNKSuMdlN/0lyLwGZjCt1xBfhG0bhCwKi8F4XZAHeTwGVqtPhfW
         do6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WbfQJnH6RMbPR4Tuk3580npqQDobRyP1jPZtOu/Ghcc=;
        b=UtztMntSPUiOY34z2GU3EHr/13wuFaBZt8lqv9Qb5G5o/VySltpQ2OWYV3w0U47Oon
         N2AXXQfMo7OOiajKVio8yrWDqIb2ymaXGDcuSF6QEqPuRz6+dycWNoWaAIzpDiuzTQ2R
         fRf/5z0h4SSiMQQjD6OVQLL80Y3QOsZtS+ECHmfMi5PcG2oyWwT+duTnXdXqR/3BsA0F
         To/O5kRTidOdAeEMSH9ijbvqV2fgBCHosW7Ohh+kT16ka/FGGxwejeTzVOA9zrmzz3GO
         OOT0EFY4lXcfFlWMdk4+t06DBy2IxFGk9uc56/FqYDd0xv77ufXIIk3IXYGwh0gn/ln3
         TBFQ==
X-Gm-Message-State: AGi0PuYYFNs0gKzrKxVsWqQh/D4Jcv2i66nCc4UKUopgK1DBHiIjCvtq
        9s8LDlVPPv41d4MtDjcFUQXbeqU8cAsHEA==
X-Google-Smtp-Source: APiQypJ8qmC96lKSJTFD2dHk2PtFiCANE21tJ3bjp4WgY8iJMmXHMu9aK9kXSo5F6H19/3JkmJL0wg==
X-Received: by 2002:a2e:a365:: with SMTP id i5mr1628618ljn.246.1586485964943;
        Thu, 09 Apr 2020 19:32:44 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id b16sm268446ljh.20.2020.04.09.19.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 19:32:44 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 3/6] ARM: dts: qcom: msm8974-klte: Add gpio-keys nodes
Date:   Fri, 10 Apr 2020 05:32:00 +0300
Message-Id: <20200410023203.192048-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410023203.192048-1-iskren.chernev@gmail.com>
References: <20200410023203.192048-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Daniele Debernardi <drebrez@gmail.com>

This introduces the gpio-keys nodes for volume/home keys and the
associated pinctrl state.

Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 6b184819f1ce..21335999a024 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -3,6 +3,9 @@
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
 #include "qcom-pma8084.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Samsung Galaxy S5";
@@ -197,4 +200,50 @@ serial@f991e000 {
 		status = "ok";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pin_a>;
+
+		volume-down {
+			label = "volume_down";
+			gpios = <&pma8084_gpios 2 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+		};
+
+		home-key {
+			label = "home_key";
+			gpios = <&pma8084_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		volume-up {
+			label = "volume_up";
+			gpios = <&pma8084_gpios 5 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+	};
+};
+
+&spmi_bus {
+	pma8084@0 {
+		gpios@c000 {
+			gpio_keys_pin_a: gpio-keys-active {
+				pins = "gpio2", "gpio3", "gpio5";
+				function = "normal";
+
+				bias-pull-up;
+				power-source = <PMA8084_GPIO_S4>;
+			};
+		};
+	};
 };
-- 
2.26.0

