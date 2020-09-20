Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4FF271515
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgITOuA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITOt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:49:59 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77930C061755;
        Sun, 20 Sep 2020 07:49:59 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l15so9925851wmh.1;
        Sun, 20 Sep 2020 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wf/sNUKlRf/ALlFecYdtWbVPMhCjaOaenlGyzJQwOtg=;
        b=Uxy5FI6yj+nZxHEZUECEtVRHtpbVlA4Jg6LX9FTOQOBYodcckKNyRzMD72pbWd3TAY
         /O7KO5bxSM177gwvtekWg7S76nGki2oXM22A7pAOFjZwIqlzLbCiHCNuyQvlGVxKVZhI
         9wh0LL0Wpq17s7hWKZjrnLFJTEMQj2+ITi6NAR6jOVZGcgH2+gfF0CXBu2qEPmz16JZV
         rA9gIHRiehyf//d4axn/zDl1HCKkE1IXYp85VppGAC2nhHi6Qs+kNXNUh6OFPxokEUXc
         XcfExI+OOBQnu7gT96/LgG+wEbicKhaCjt21iidot209+lB74Q5TpuO6FHjgxiG0+re9
         zplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wf/sNUKlRf/ALlFecYdtWbVPMhCjaOaenlGyzJQwOtg=;
        b=LSRX48uw5Bvd3KjSnakAVz6NDUIdbUPo42uxjiTU+JG7/BYmiSbD/IOZ2BCzfbkt0c
         s2Nb1TH44Rl5MuB6DHv+6ELngka91LtFWTbcUxFG3Sw3xGo+l0C0xji5AEVsYPKc3KJs
         WakzvZIn6vlppLdh9ev4jGpgsA9VPLnXmtA+fiHOQkyW61dI9n1WCo4AC9vpRPZG0UjN
         19tbkyrOcL5vAfAwo4ZASH20ZUQ4qzd69MbNYXp1z7GaZHHD7MGDELbBGiDdcNtdC6c3
         vthVct6I7xRlp0luE+73/KRoam7u/NBiteltkndZKGp2yfRzDm8Hp9iIPCS+8KtR+hGS
         n+eQ==
X-Gm-Message-State: AOAM532HSdoIrYNb8HchRxXU/BywdUxQMEly23t08POtHo432euXbVOW
        RCAI7tEvaOezO6v0K83CuR8=
X-Google-Smtp-Source: ABdhPJzG+5YSLkg9krJZtj/pMR4YCiUZ0VzyLOg+3FgNX35aUi9QMEla7B/jtw4rE+8YKVuCmMYQlQ==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr26051249wml.149.1600613398189;
        Sun, 20 Sep 2020 07:49:58 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id b84sm15932017wmd.0.2020.09.20.07.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:49:57 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH RESEND 3/7] ARM: dts: qcom: msm8974-klte: Add support for touchscreen
Date:   Sun, 20 Sep 2020 17:48:55 +0300
Message-Id: <20200920144859.813032-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920144859.813032-1-iskren.chernev@gmail.com>
References: <20200920144859.813032-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the touchscreen found on the Samsung Galaxy S5.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 750e2f261139a..085636f182d01 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -284,6 +284,16 @@ cmd-data {
 			};
 		};
 
+		i2c2_pins: i2c2 {
+			mux {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
 		i2c6_pins: i2c6 {
 			mux {
 				pins = "gpio29", "gpio30";
@@ -342,6 +352,42 @@ phy@a {
 		};
 	};
 
+	i2c@f9924000 {
+		status = "okay";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c2_pins>;
+
+		touchscreen@20 {
+			compatible = "syna,rmi4-i2c";
+			reg = <0x20>;
+
+			interrupt-parent = <&pma8084_gpios>;
+			interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+
+			vdd-supply = <&max77826_ldo13>;
+			vio-supply = <&pma8084_lvs2>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&touch_pin>;
+
+			syna,startup-delay-ms = <100>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			rmi4-f01@1 {
+				reg = <0x1>;
+				syna,nosleep-mode = <1>;
+			};
+
+			rmi4-f12@12 {
+				reg = <0x12>;
+				syna,sensor-type = <1>;
+			};
+		};
+	};
+
 	i2c@f9928000 {
 		status = "okay";
 
@@ -460,6 +506,14 @@ touchkey_pin: touchkey-int-pin {
 				input-enable;
 				power-source = <PMA8084_GPIO_S4>;
 			};
+
+			touch_pin: touchscreen-int-pin {
+				pins = "gpio8";
+				function = "normal";
+				bias-disable;
+				input-enable;
+				power-source = <PMA8084_GPIO_S4>;
+			};
 		};
 	};
 };
-- 
2.28.0

