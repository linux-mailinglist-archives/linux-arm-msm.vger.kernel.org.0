Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652E42838CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgJEPDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgJEPDi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:38 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F55C0613A8;
        Mon,  5 Oct 2020 08:03:37 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id o5so9964571wrn.13;
        Mon, 05 Oct 2020 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E4XyE66T2J1HSRX1OawRh9+7lK9LP/p7OLEfyYWRZYg=;
        b=UfBsPRDjRfIUEI/OnR0F/++GkUfSUixKTjRVox9+fqHSsvpFzpG+4RWP3nNuFis+SQ
         0CeVpQxhvAAt6uGIBaFK6PxjNkiNbBMywVIWg2JYFyQtuDw7CtzTgFPZvvbdbW+nmfKl
         KZNmfLS5zlzAdABOA4NnKXIlooiSKktlYW8uCVuBgTZiG0TpXz4xQcGAHDCXEW2y72eg
         YKnDai+sdQnwqA70WMiXHawzFnVVId+WzIHm6X6/5Rh96udR+G9OfyXkYTbpvgjjMK/o
         ctPOdPY15090citjJGJOpNyu/wC8QdainJG05wkAVzcO6jw7nTYGJprXE/A5SqIuSg/4
         cs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E4XyE66T2J1HSRX1OawRh9+7lK9LP/p7OLEfyYWRZYg=;
        b=WHCVfufTSLXy1DL1EwbeS9hEcE2dCVgft4TZxYQn4O9y3m9i6tbA+v4lq6iF5vHUFB
         r+uHX9BKqPa3uZcCbQjaQcpsUUscY0ZIO15Na8CJnDLpdqonW8D+p7bB+YgHMkJy8+5w
         bBXJgYQl6wfUCNJO6g1sydNfvsy8MUTZ+yeCIiKrTq/ak5JPcICclyc/6DHmRVc9fvys
         1gE8qZyBouAhccnsWmqZ0ui7HHF0N5GE4JHjBkX+QPJ0zVYZCxChrB9acLmPPgjyCDvT
         4t871OnCmZ510nxUwM8RGzvMJ/z4G5rLcmdPxBMjYtnHvLhWuDP1ZhSi5YxrabHY0jPL
         xVKQ==
X-Gm-Message-State: AOAM530O54L6bpytA/ctmsZWy/cDcgtaifhN4NUALBjHCMbTEhzqolQM
        o4IUBp+7tUV5Kpzb6adnoUPvwL7x+uNh/Q==
X-Google-Smtp-Source: ABdhPJziLw7STBhrJWZQvZt+Upb4ujLNQjruebPI+NeHnziCQanwtvLV1ELVf+8jVXTPS9KZiioJmQ==
X-Received: by 2002:adf:9e05:: with SMTP id u5mr12083749wre.78.1601910214936;
        Mon, 05 Oct 2020 08:03:34 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:34 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] arm64: dts: qcom: msm8992: Add support for SDHCI2
Date:   Mon,  5 Oct 2020 17:03:05 +0200
Message-Id: <20201005150313.149754-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This will let us use SD cards on our devices.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 8626b3a50eda..6242c56a2bfa 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -269,6 +269,29 @@ sdhc_1: sdhci@f9824900 {
 			status = "disabled";
 		};
 
+		sdhc_2: sdhci@f98a4900 {
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
+			cd-gpios = <&tlmm 100 0>;
+			bus-width = <4>;
+			status = "disabled";
+		};
+
 		blsp1_uart2: serial@f991e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf991e000 0x1000>;
@@ -573,6 +596,42 @@ i2c13_sleep: i2c13-sleep {
 				drive-strength = <2>;
 				bias-disable;
 			};
+
+			sdc2_clk_on: sdc2-clk-on {
+				pins = "sdc2_clk";
+				bias-disable;
+				drive-strength = <16>;
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
2.28.0

