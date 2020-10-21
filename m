Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5901F295355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 22:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505160AbgJUUL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 16:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505134AbgJUULz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 16:11:55 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BABC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 13:11:53 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id n3so3473616oie.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 13:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h3IjEKBycl4AdV4pHmY8x7WaZ0Ptwe7SpKSP+5fA0v0=;
        b=Bsil/4/VIe8KiAFM+fsJ3dsLu5fJ+LYGHFp8iH99zcx6Djp2uzo6FD2YjXSd82lkVg
         piz/Xirt+WifCSz0l7gLClPZiP14tb0WYUyQ1zMTlVmshXF5Pz67/vDfyp2wt9XTPsFA
         Fki4xWfLpSGf3CdTu/ToVli9ItQoWdBLKslbw39xMVutqkMO5lA39tyHb0vI3OtID41X
         G7EuxKdKKEWeAa1c1hB4lNV0Et9TDTU7mqWIovKwHX1KCyWvWgOWqKJpPaMRWW8ursu2
         CFBMyaLzPkkNQwauUzoy+G+anTLhUQY3fTNYAeSL6JKYR/OZo6RewIblcuW9ngtEzREg
         XCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h3IjEKBycl4AdV4pHmY8x7WaZ0Ptwe7SpKSP+5fA0v0=;
        b=kFQXaaTBEKZM83DfTSX5lP5mgCEjUMJcnvcDp0q/cco9MdCsR5nkWMkeJfJeixUmd0
         o5IaEI4QBLS4gaGZ75PgBaItDbrx718SLd87qUiAzCSP7LdcOLqJWrEi85MNYjSSTGdZ
         2G0RAz0HcwgeILYeP27ODJYAT6SgyDp/RzA6yXNttkzQ714Rrl6aL41r3YDrwQrqq50r
         MwPZSHT22AtLDGVHtDNt/WLqWsGMn1wl+qq7UimNc3AA8XqbhLwJq94rDO2/Wx9MmqwD
         KvOdGYIruHq39FXNRItdWksOtkr7NALfKibzif1qQyJZ1lstozob9I7qkc67PkF1sgl2
         DlAw==
X-Gm-Message-State: AOAM533Uq9hHopE32/JvlsD18Fa7yMJKf1Q+EzvKtc4EvklteqNLBP6W
        s9JAWddmMJ1U+7TGNUPOoWd3Jw==
X-Google-Smtp-Source: ABdhPJwpXwGpMMY0lOzWhIQyAznwBP9uD5c44odQWyNTc7tB26G8V2bFUSw/A6eCXg3EraLWJUhDoQ==
X-Received: by 2002:aca:442:: with SMTP id 63mr3195841oie.111.1603311113085;
        Wed, 21 Oct 2020 13:11:53 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t5sm838166otl.22.2020.10.21.13.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 13:11:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Martin Botka <martin.botka1@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: [PATCH v6 4/4] arm64: dts: qcom: Add user LEDs on db820c
Date:   Wed, 21 Oct 2020 13:12:24 -0700
Message-Id: <20201021201224.3430546-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021201224.3430546-1-bjorn.andersson@linaro.org>
References: <20201021201224.3430546-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The db820c has 4 "user LEDs", all connected to the PMI8994. The first
three are connected to the three current sinks provided by the TRILED
and the fourth is connected to MPP2.

By utilizing the DTEST bus the MPP is fed the control signal from the
fourth LPG block, providing a consistent interface to the user.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- None

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index defcbd15edf9..7e51677d256e 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -8,6 +8,7 @@
 #include "pmi8994.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -682,6 +683,54 @@ pinconf {
 	};
 };
 
+&pmi8994_mpps {
+	pmi8994_mpp2_userled4: mpp2-userled4 {
+		pins = "mpp2";
+		function = "sink";
+
+		output-low;
+		qcom,dtest = <4>;
+	};
+};
+
+&pmi8994_lpg {
+	qcom,power-source = <1>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmi8994_mpp2_userled4>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led@1 {
+		reg = <1>;
+		label = "green:user1";
+
+		linux,default-trigger = "heartbeat";
+		default-state = "on";
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "green:user0";
+		default-state = "on";
+	};
+
+	led@3 {
+		reg = <3>;
+		label = "green:user2";
+	};
+
+	led@4 {
+		reg = <4>;
+		label = "green:user3";
+
+		qcom,dtest = <4 1>;
+	};
+};
+
 &pmi8994_spmi_regulators {
 	vdd_gfx: s2@1700 {
 		reg = <0x1700 0x100>;
-- 
2.28.0

