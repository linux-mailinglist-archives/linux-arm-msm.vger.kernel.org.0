Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C94F502DFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 18:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355969AbiDOQtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 12:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350532AbiDOQtc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 12:49:32 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E028DDD96C
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 09:47:03 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e21so11236381wrc.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 09:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hABzIMEOhhM37fzkgMVGRIotHTAtLjUxj+/0GDBlE3w=;
        b=cB1IdQMFOmuNR8Xl8nfA3mgiLjaRAcwAVlJ8IzQxLk9Q3sBsXQMoTnX7FR1G9Akpof
         bqRjntapA/zXCw86pFGQgRrIummmIESWjbP1jhOpTCVNmLw2nU35EPuEhnlrRYYbG0XU
         kASAe4K2vsSXzt6ebLzI3bW6QOGhmHuMRuaSnLzbWrJUQ+tZYd9nEWRbWcNyDxvcfQcT
         2EyP20Ye5GRYTraVnMQUfPTOOy87wtm6IsTS5PDj3884aW6ZLxsoWPew6LOlW+jzOLwJ
         DtGwc2E6lO5Dyj2aXOYvbF4CWHGTaHqYMKcqtTIFEhvK+8NeigbI8A6vM0OqmtJPzBUK
         SWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hABzIMEOhhM37fzkgMVGRIotHTAtLjUxj+/0GDBlE3w=;
        b=SHuxD7xl5SX4jC1h0lu0iy9ksHCufzd8JWfxWgHDvC0Ce6Dff0u7ZUwvsAyQv6Fx8p
         2KyML/KvOHiU7oZXzGIxiZBPXXoHoNrtziRqhq7R7NwNByryc1G21VyfOqjOngWdLi/c
         sYVkzgy3mroZWkRRg1cGyf9wT3XaDPSJ3dOaTWmePt+5FQi8vRaWqQWOzb4iwZ58TVFS
         k43Yq509mr4mhEg9Pffqvabz+7QG4lOrD6MVz0smXIr33NYeeZM4zCLRhSMtkNrqN+RB
         21e4ii0PBt8C1VW4Zbl8+r/rh7N9fb9PisW4d8DNeMXeKFiCkrlV1q0zko8knRQQ+D6l
         ZT6Q==
X-Gm-Message-State: AOAM531QHjjtEZ3HHRRyiJ73iE9TL3W6dHdzkglQ0uOpStmjuy1TvDTS
        vCsHvj6OxDo4icZU9Rte3McV7Q==
X-Google-Smtp-Source: ABdhPJyW3+ymC3ml/wW3Etuj/tKGoqmmYj75nWYTYO5+sH2iIvkbchIEbxxkShXcwenJyZ7GqRoZQw==
X-Received: by 2002:a05:6000:1869:b0:20a:78e2:522e with SMTP id d9-20020a056000186900b0020a78e2522emr73269wri.340.1650041222495;
        Fri, 15 Apr 2022 09:47:02 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b0038cb8b38f9fsm9180041wmq.21.2022.04.15.09.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 09:47:01 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     vladimir.zapolskiy@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8250: camss: Add CCI definitions
Date:   Fri, 15 Apr 2022 17:46:55 +0100
Message-Id: <20220415164655.1679628-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415164655.1679628-1-bryan.odonoghue@linaro.org>
References: <20220415164655.1679628-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

sm8250 has two CCI busses with two I2C busses apiece.

Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 162 +++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 2ec9adeb2e66..b08143ba096d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3150,6 +3150,88 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac4f000 {
+			compatible = "qcom,sm8250-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0 0x0ac4f000 0 0x1000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac50000 {
+			compatible = "qcom,sm8250-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0 0x0ac50000 0 0x1000>;
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
@@ -3688,6 +3770,86 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 181>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default {
+				cci0_i2c0_default: cci0-i2c0-default {
+					/* SDA, SCL */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default {
+					/* SDA, SCL */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+			};
+
+			cci0_sleep: cci0-sleep {
+				cci0_i2c0_sleep: cci0-i2c0-sleep {
+					/* SDA, SCL */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+
+					drive-strength = <2>; /* 2 mA */
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep {
+					/* SDA, SCL */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+
+					drive-strength = <2>; /* 2 mA */
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default {
+				cci1_i2c0_default: cci1-i2c0-default {
+					/* SDA, SCL */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default {
+					/* SDA, SCL */
+					pins = "gpio107","gpio108";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+			};
+
+			cci1_sleep: cci1-sleep {
+				cci1_i2c0_sleep: cci1-i2c0-sleep {
+					/* SDA, SCL */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+
+					bias-pull-down;
+					drive-strength = <2>; /* 2 mA */
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep {
+					/* SDA, SCL */
+					pins = "gpio107","gpio108";
+					function = "cci_i2c";
+
+					bias-pull-down;
+					drive-strength = <2>; /* 2 mA */
+				};
+			};
+
 			pri_mi2s_active: pri-mi2s-active {
 				sclk {
 					pins = "gpio138";
-- 
2.35.1

