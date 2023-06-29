Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBF2B742F34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 23:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbjF2VBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 17:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjF2VBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 17:01:07 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A1030DD
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 14:01:04 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso1511765e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 14:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688072463; x=1690664463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBj+rJH2j5vVoNfRRhDYszSDOPJsaOPVyB8jxg7+kWM=;
        b=Xa+jZMRUqdMvima7ecc5Cp6++AjMIPXlD3xpw0JVmm4tc52sMny1+00VxtOtlc5cZR
         QnVH3kOw/ys6bYbrwPu3rFlvvibvVDXodArU5okBcxJ4Tq26MleGoTd6Mof0gMgDRnT+
         KrPoixw7ewfB9twBrPWFYAp7/KsJdPV7goadnkbKRoGy3Is21hM7RcaAFtlHkZac9nS0
         BX/ReOHqvhcYLQI+iRx460uP6RZEZrSm0Wsd+L/IRC0ybLKFlr0eAKDGR6KDySVdpsTO
         QuXylq8zweOYgrrh6L3uxoGdE9jiqjm+V/EuMP1rbIiF2RZsPl2Sv1eirk4vgqLasmmN
         m3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688072463; x=1690664463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBj+rJH2j5vVoNfRRhDYszSDOPJsaOPVyB8jxg7+kWM=;
        b=IS54bXYsUb+9SqWXeddKjJdKppc9U78GBCQYkdLr136xuqAjWsQ/zXOEMa4FPnXnWW
         enkM1UGIfcjl8/uWTdMPpzef7GIgnNWNdxC5xnNegRJZNvR8y1pZm1OUrD9poJteOOfO
         Hhu7P/lvEu1U1jQ2+/uzUuFJKrK3XIeDbOoAyjTr/2/PwQAjRp/eQ3VYtJZqJmhsG2l0
         d9F6zUSPwpLLRfO/YznIvsi/gyEaEp0O3wTelq8uF+rIucVqD4OiWBc670i6IqXJtkBA
         bTvpZ5UHryB/QYP02FQEhR7mlEzI5ZycTmfB/q8dqzf2wx9vOF0rsGqgajD5V4/k/WDi
         O55w==
X-Gm-Message-State: AC+VfDyECeCF0Q7wpMqIMDxqH+IxzVwhV4FtI1PlOU1xvW8KPIE0ihSt
        S87B5DjXlir+Y3IWQpKERLAchw==
X-Google-Smtp-Source: ACHHUZ7dXQTFOtiNw0Z88mb81Q81IxPrHY2cqINAThtL9rYgPjBsxOL4gIjfRejOzZckkt1YJzv8Eg==
X-Received: by 2002:a1c:4b05:0:b0:3fa:96ad:5d2e with SMTP id y5-20020a1c4b05000000b003fa96ad5d2emr356472wma.19.1688072462791;
        Thu, 29 Jun 2023 14:01:02 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b00313e4d02be8sm15745722wrs.55.2023.06.29.14.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 14:01:02 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Thu, 29 Jun 2023 22:00:53 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: c630: add panel bridge 1p2
 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-c630-uart-and-1p2-reg-v2-1-496b581935c1@linaro.org>
References: <20230627-c630-uart-and-1p2-reg-v2-0-496b581935c1@linaro.org>
In-Reply-To: <20230627-c630-uart-and-1p2-reg-v2-0-496b581935c1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=L2itCOUfvSzeXSASQubMcjpUvnUlL8UMtdvpzAwhCKM=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBknfEMJxqxd24gGIVNHXSSY3H2LmK0s0cNftoX1
 L/C5SKUyAiJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZJ3xDAAKCRAFgzErGV9k
 tu64D/0XmgmNjI40YvCMuw+w5Cc+zpXx1VymQQXb/vjlmJQXzKNWlzjh8MII3e3BShGXQdf0KCw
 71BuCQiecPNudev6Hru2zh+2Ov5edxd5X6q8VB2p5rF3uFQ54W9ltW/e4Wc68JAH6IfVTISo+mo
 1hKgKPe+bvUymey19Py/pGP9d58Vsqo/lC7Ae6PXzxSWRQt9dI1NUTjPjYybsqJrl39m3ep+4r5
 9ViBNMecK3G0U0TzU4bY2japo2+gbMt4zOj293sJlrCwhXp1gn2QDLTE5ozFrBPW5igsjDJ+7Wv
 Ic5hhIoLjFM5AOMK05cfsU9A+KH2aGpZ7NGyNT8yPGL2sFa2fMxoLHUT1P5d9eIDxg9cL+7aW16
 3FG3zrfy7UqEqFCXQb3ZE+kMurFysmn0ugrBVQfbFJQgjgQtvilyUQ9gkqmIQxVlTesF+HfNT1K
 EB3DGnFXf9WKpH8t+KYPM9gs7XsEsubbVPJKQ1NwNLuW85pkE8V1H94LCNNYIl6P8IG8qDmemkd
 2VwhL8mdRlU/iKY43bymD6X0qy7Y+IRsQSnNaPlCuE2ugrXm61w00asX1T1RtaQvF9HNo2/42Hj
 JRF86v6I5W3xkB5QO1nkMRxD9YTRnGcUkyfqupWR5TDPDdSQdNfgh5zTyjDwp3isLOXfx+dAVfb
 G7/aoqfeidt1y5Q==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The VCC and VCCA supplies of the DSI<->eDP bridge are derived from
vreg_l2a_1p2 and controlled by a GPIO on the PMIC. Add the regulator
here so Linux can control it.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 22a7d997cdb0..86030771d685 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -80,6 +80,22 @@ adsp_mem: memory@8c600000 {
 		};
 	};
 
+	sw_edp_1p2: edp-1p2-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "sw_edp_1p2";
+
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		pinctrl-0 = <&sw_edp_1p2_en>;
+		pinctrl-names = "default";
+
+		gpio = <&pm8998_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l2a_1p2>;
+	};
+
 	sn65dsi86_refclk: sn65dsi86-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -425,6 +441,8 @@ sn65dsi86: bridge@2c {
 
 		enable-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 
+		vcca-supply = <&sw_edp_1p2>;
+		vcc-supply = <&sw_edp_1p2>;
 		vpll-supply = <&vreg_l14a_1p88>;
 		vccio-supply = <&vreg_l14a_1p88>;
 
@@ -500,6 +518,16 @@ &mss_pil {
 	firmware-name = "qcom/sdm850/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/sdm850/LENOVO/81JL/qcdsp2850.mbn";
 };
 
+&pm8998_gpios {
+	/* This pin is pulled down by a fixed resistor */
+	sw_edp_1p2_en: pm8998-gpio9-state {
+		pins = "gpio9";
+		function = "normal";
+		bias-disable;
+		qcom,drive-strength = <0>;
+	};
+};
+
 &qup_i2c10_default {
 	drive-strength = <2>;
 	bias-disable;

-- 
2.41.0

