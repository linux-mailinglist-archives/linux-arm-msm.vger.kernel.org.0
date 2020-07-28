Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D473A23095F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 14:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgG1MBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 08:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729360AbgG1MA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 08:00:59 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E6EC0619D2;
        Tue, 28 Jul 2020 05:00:59 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id g11so8594901ejr.0;
        Tue, 28 Jul 2020 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TF7XW+i8cbP3gIkhlhIAvvLS4ohbcx6+poBRM18scqo=;
        b=OhIg1fTQdLmmOgTdUB8tQOREg495rzSHC3h+iJ0gdW3qkQHC7lwxz0ya8UmppcA4bJ
         nEbeRRpAdpH9R8I3N7XCaCt0O8jDr+2UyguL3yh2Q+wqIZnJj0ocNQ81CMhll91eQ7jn
         QjX/C8CWu7Eznlhpj5Kg+DLzrfzyaAXyYIyL2a/9a2nUtXeSFPcjicQCU7BakvxVdgmp
         rgoelzIQ3OsDRjHoGQrYCBH3tpBP1o37B5XJ5V5G5oxJpuk9ohYtqdhQqynCVrPw61QV
         pWClnZsfhTlR7AKBr1wZ16nQ450ZDmw7A9CvI01aKTveRkq+jdrQvhKV2DmuN5CNKFEt
         /yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TF7XW+i8cbP3gIkhlhIAvvLS4ohbcx6+poBRM18scqo=;
        b=i29uFnfLvpC4HkbIF9e5sDyTLzPNmyPucE3yqypUtjzgFeS8pRazq0rlHL+3X7lv4v
         C7QQIknIm4K/bxdb73naJaD5Lva/OMQxWVvVl3/ZaXJ6g33RaG5jHTOjUcVRmP4iSvk4
         RxLg54qwO2Fxed1/pu5C6CRLkvb55uFYf1QNDtWjgNE0vAMcZNlIE8NFsGIQejN4+YCB
         YDrkEcV+ux8sNFOUEDUkSkSCl8KlPi4z3dQ5pfKVXjhjOlor1Fmf/z8jA5rYIMYzEvoc
         glo61kPOHDtEecAuOEZVY/LkU4Xq/F+VaZz4ad/DyiY5Gr9E6wOSyNdLTaNk5ioCP9XY
         Akmw==
X-Gm-Message-State: AOAM532NsUtx/h0nLN1X82Tp3KFtb3rctCWJwYN32nRQ94pv7Qw9E+o0
        vvSYf3YvTf47vwvzAm+F6BI=
X-Google-Smtp-Source: ABdhPJzY8o0HSAQtgr/Of9SIxDF4WdBHD1mCWT4iXipAakxc2uo+Z9r7/vYhS8koW+loSkOs1vXSDQ==
X-Received: by 2002:a17:906:cc51:: with SMTP id mm17mr5356124ejb.137.1595937657873;
        Tue, 28 Jul 2020 05:00:57 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id m20sm9066959ejk.90.2020.07.28.05.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:00:57 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: qcom: msm8992: Add BLSP_I2C1 support
Date:   Tue, 28 Jul 2020 14:00:41 +0200
Message-Id: <20200728120049.90632-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728120049.90632-1-konradybcio@gmail.com>
References: <20200728120049.90632-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This will be required to support touchscreen on Lumia
devices.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 9b42ac42b171..c7dc81311f6a 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -304,6 +304,27 @@ blsp1_uart2: serial@f991e000 {
 			status = "disabled";
 		};
 
+		/*
+		 * This I2C seems to only be present on WP platforms
+		 * and is likely disabled in firmware
+		 * (hangs at least one device) on android platforms.
+		 */
+		blsp_i2c1: i2c@f9923000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9923000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+						<&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c1_default>;
+			pinctrl-1 = <&i2c1_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp_i2c2: i2c@f9924000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9924000 0x500>;
@@ -524,6 +545,20 @@ sdc1_rclk_off: rclk-off {
 				bias-pull-down;
 			};
 
+			i2c1_default: i2c1-default {
+				function = "blsp_i2c1";
+				pins = "gpio2", "gpio3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c1_sleep: i2c1-sleep {
+				function = "gpio";
+				pins = "gpio2", "gpio3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			i2c2_default: i2c2-default {
 				function = "blsp_i2c2";
 				pins = "gpio6", "gpio7";
-- 
2.27.0

