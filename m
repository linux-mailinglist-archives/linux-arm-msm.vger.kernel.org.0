Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C70941A5355
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 20:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgDKSWN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Apr 2020 14:22:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40296 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgDKSWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Apr 2020 14:22:10 -0400
Received: by mail-lj1-f195.google.com with SMTP id 142so4950100ljj.7;
        Sat, 11 Apr 2020 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bOxfbv/Ciuh7Y4q8Zjx3IHokX/Ks6vT2KzIOjwmY+B8=;
        b=Jygbu+3tPUKqOqaKziwUpUsb/cgk2d7vossa21X73oEjr1d/9xmDVPUi6Af8mdbjkd
         S/KSbUxx1liCowmHPOpXqFGmTHXHTihj1yZPOs4yfHs5aSJcco8saHBhGqFOwj37uHp5
         uNrNw9Z8+lUYeYkZA0WmLN0lnJeUW2hThVwDnbXvRGjcfFIIVRnEEgqtPfA1Qi2bxj1E
         IPMP3XYa/itq8dObS4eli2wKVUJXxx/RybwafC965w5jb800eRE/yxZZPn+zxCTlXe9s
         QSLYtPmQp/TxTD7N4pvJqUtrALUUycux83tvwqdMmwMqTDdbpujb2Vm2OoZ7Qm/YaZdZ
         /fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bOxfbv/Ciuh7Y4q8Zjx3IHokX/Ks6vT2KzIOjwmY+B8=;
        b=dIlvueVx9c8JY3rvJYGa8wKuD6EIW1Cvi1OTYtHx1wCg2fJ/D2+VGFkkXgATxHd8zZ
         x8JXmLnGYQA1pK3YMFWowh9CbP52eCEO5rSyRZCpqc5/MP/PPPNAYvqThioSEbO0SxHI
         Npg3YLaxjS2u5nSnwT1ik+QNZRVPADR9L8ywTKzglNZYAO1O2oDZk1SA2B8WBhPbzJMd
         c5MHwtpBOqg5c4HzZGY2XnQ/pm0pgdzEOaU+QJ4SqLwC1zUHIOakRmXNjktBvaGQNUTI
         Tce2sX/rLiXBBFC9ecPZl2N3+FgMlzHxO4tWvJ4pbOS6pRbAhpYBpGilJohT8CxujjIF
         sZYQ==
X-Gm-Message-State: AGi0Pua9Q+dBsJwoJMwgwCf8UB+K3Mu0eHqqtEboCT/F1hOtyf5+Epx/
        L/MPkiRj9lEavLBsiv1Bp1mz5t6yvYjwmQ==
X-Google-Smtp-Source: APiQypKlF9K/OEy64Bzqeayt5kKdbvSmUDabujd1geATcFyv4epSF1oplqQXKGkXamjCE9FnaE6qtA==
X-Received: by 2002:a2e:a548:: with SMTP id e8mr6235426ljn.151.1586629328169;
        Sat, 11 Apr 2020 11:22:08 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id h21sm4323517lfp.1.2020.04.11.11.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 11:22:07 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 3/5] ARM: dts: qcom: msm8974-klte: Add gpio-keys nodes
Date:   Sat, 11 Apr 2020 21:21:20 +0300
Message-Id: <20200411182122.2677248-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200411182122.2677248-1-iskren.chernev@gmail.com>
References: <20200411182122.2677248-1-iskren.chernev@gmail.com>
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
index 36ad8ff071ca..752ab9e99a8c 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-msm8974pro.dtsi"
 #include "qcom-pma8084.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Samsung Galaxy S5";
@@ -205,4 +208,50 @@ serial@f991e000 {
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

