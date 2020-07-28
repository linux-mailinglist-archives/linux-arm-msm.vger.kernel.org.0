Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CED0230969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 14:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgG1MBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 08:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbgG1MBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 08:01:15 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8211AC061794;
        Tue, 28 Jul 2020 05:01:15 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z17so14575479edr.9;
        Tue, 28 Jul 2020 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/lXxR/NY5u0DlFOjxBacWTF69g+Zu3unhXyQAhYQnSE=;
        b=seTbJ4DV+V6KNulh2RG4Eue7x9j0lC0LmTz/F7K3QzpMEeGi0cF+huT6e/p3tC36rR
         1cpGVbpGXytvL4Yj3oZE0l6EsWSQJfFC2j/YLBkVEBx3MjDLrf5NA9onyV0xsscDGj4r
         8vA+uFR5lFfE3ab0AxarhOEg8KQcB94EW2W7kZ7EI5Qw4kXotNrnjYi1OKlm4NfwvU63
         aeyyQjKFoZZEMJwedwf8c3RHTReSKSTkYyh+AsZewa2TFbDtILPRMdOF9MfcrvLaYuSG
         m4xLFcFo6TPDrTp6IY5Ur6tSJilNoIT+l1K4PzVWUaG34q/o9/h+83tdXtOC5V9jgOF+
         R11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/lXxR/NY5u0DlFOjxBacWTF69g+Zu3unhXyQAhYQnSE=;
        b=N2CniasuBL8XC4MFCVBvNdEtWis8o2+SRBFoBQAUHZ/hvSRTPzkWzw3qcsl61PCicg
         QGiYlsGG2AhW2RUiaUyJHJxq5Lfv6NaGr/L7rId2PLsWLcEM34lA1146l94BV1oHJJ2a
         SYiNKerehrZS+3ZU+sp++no84wQ+GWfS0lw5Il7MMx6ml3TXSWbcJ3s1vZz4uE1MBzYh
         ho1g2/qcrhaIo9M19JwxtGLT9gV62pGUnIdHwsocqu4ebMMvHJVacIlpq2XrGri7uyIw
         BwGwplkl5Hooq+X4sfV4qzRr8jTvUkH5vgb/4WYcNq5TFv3xyMpkUhp1uzscN/nkGTC5
         dAdw==
X-Gm-Message-State: AOAM5316+Qz3O2j+sCiZdtCpwXsMJqF77uaMDnpPa1h7JYvIZBckK86o
        wjlHAb01njUPY03HJMComcs=
X-Google-Smtp-Source: ABdhPJwdLg1+fyHCsAbEt9grpZefQKn8cJqncGT0WM4xgb00xnJWNKOn1P6Ozu4L/VdD2y3scmeLbg==
X-Received: by 2002:a05:6402:c86:: with SMTP id cm6mr8022220edb.205.1595937672297;
        Tue, 28 Jul 2020 05:01:12 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id m20sm9066959ejk.90.2020.07.28.05.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:01:11 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: qcom: msm8994: Add SDHCI2 node
Date:   Tue, 28 Jul 2020 14:00:47 +0200
Message-Id: <20200728120049.90632-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728120049.90632-1-konradybcio@gmail.com>
References: <20200728120049.90632-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SDHCI2 to enable use of uSD cards on msm8994.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 58 +++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 69c99a4cd817..58fc8b0321c3 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -336,6 +336,28 @@ sdhc1: sdhci@f9824900 {
 			status = "disabled";
 		};
 
+		sdhc2: sdhci@f98a4900 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
+				<&gcc GCC_SDCC2_AHB_CLK>,
+				<&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
+			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
+
+			bus-width = <4>;
+			status = "disabled";
+		};
+
 		blsp1_dma: dma@f9904000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0xf9904000 0x19000>;
@@ -714,6 +736,42 @@ sdc1_rclk_off: rclk-off {
 				pins = "sdc1_rclk";
 				bias-pull-down;
 			};
+
+			sdc2_clk_on: sdc2-clk-on {
+				pins = "sdc2_clk";
+				bias-disable;
+				drive-strength = <10>;
+			};
+
+			sdc2_clk_off: sdc2-clk-off {
+				pins = "sdc2_clk";
+				bias-disable;
+				drive-strength = <2>;
+			};
+
+			sdc2_cmd_on: sdc2-cmd-on {
+				pins = "sdc2_cmd";
+				bias-pull-up;
+				drive-strength = <10>;
+			};
+
+			sdc2_cmd_off: sdc2-cmd-off {
+				pins = "sdc2_cmd";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			sdc2_data_on: sdc2-data-on {
+				pins = "sdc2_data";
+				bias-pull-up;
+				drive-strength = <10>;
+			};
+
+			sdc2_data_off: sdc2-data-off {
+				pins = "sdc2_data";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
 		};
 	};
 
-- 
2.27.0

