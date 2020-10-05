Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641772838D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgJEPDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgJEPDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:39 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA839C0613A9;
        Mon,  5 Oct 2020 08:03:38 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f21so3718981wml.3;
        Mon, 05 Oct 2020 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FEaaguoxx0tgPPKlx5prvmaZIBE9frxLnNIvkIs7Y5A=;
        b=AkqNCmTNQ7mRbJLXIg6kwnzyA8Z0z1LqgJ0S2BlWhwz4uAXhlC9qOFmPTpZkdOA+vI
         bniMPVZGjf723lDMCdaunYeqkWA6dI7ehG8XgFXPBSMb6vNe4ZhO1Wk/0K+V9sMJKDmt
         SmkltQNJoOM9SKZnWrraV8qz4uqSZRNvC3jE3ynxeksAY4TFDN3neNnUgEf5RrRCu3gS
         jer6P7IG3w35rSVzqZtmLOU3QXKmFk1OTr5/8d3GMuhxBAT9XAJ2Yi9plbjzF8RRt398
         gNhbR1WLu5gt42JNUNOnv45EAwVFcS6sHN5URhES1EGdo4GW6QMDrxgFccYf1FMfTyu2
         binA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FEaaguoxx0tgPPKlx5prvmaZIBE9frxLnNIvkIs7Y5A=;
        b=KsNf7H6ttTslEwWFgB2Mvi7Lj03ywsEtTtKAHpsR73iXoiqJ5tU/0h8m4j2qfYCqjn
         Y6tSzfa5D65Au72YPI/nC3Gv6WWDM9RCGmDlzi9zO3KPqYcSkq6PBTX0J2CwI0oCaDFm
         m8rCntBRJBdwIPFeBmg7zXiovp0Y+LjouCXj7uXomOB83GNYvJjtoEBlA+nz4j5dLuk+
         H4GCxJh6bmcbyQZ5OQzwFXJ4+3fTIYjc7My/jli0BCNRyTmQNdlVaSBHBNIRmmsKxjjO
         i75EP/HI3tg5pDakrZFSxLvomav2wJqDGwJMKvgtUJT9ppKrYJVAW0JnvA0Gd+xGWeqD
         z5Aw==
X-Gm-Message-State: AOAM530riRgxtrcNgVL3oUo6AwqBF/100IJlTjdMu1JUh12SZuqWcz9Y
        rIWszmKQvE1hHIOkj3vFFvFsHrK8fFsx+w==
X-Google-Smtp-Source: ABdhPJwIpFLsIq95CNywJkEc2B9O1lagHt1+zOkXHrCn0ipCLctFzLpqMwrh3b7NX5rB8ByjU32+Dg==
X-Received: by 2002:a05:600c:c5:: with SMTP id u5mr62901wmm.14.1601910217450;
        Mon, 05 Oct 2020 08:03:37 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:37 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] arm64: dts: qcom: msm8994: Add SDHCI2 node
Date:   Mon,  5 Oct 2020 17:03:06 +0200
Message-Id: <20201005150313.149754-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SDHCI2 to enable use of uSD cards on msm8994.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 6707f898607f..65089d7670f6 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -305,6 +305,29 @@ sdhc1: sdhci@f9824900 {
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
+			cd-gpios = <&tlmm 100 0>;
+			bus-width = <4>;
+			status = "disabled";
+		};
+
 		blsp1_dma: dma@f9904000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0xf9904000 0x19000>;
@@ -683,6 +706,42 @@ sdc1_rclk_off: rclk-off {
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
2.28.0

