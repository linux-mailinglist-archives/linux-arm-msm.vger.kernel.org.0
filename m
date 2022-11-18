Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBC9630672
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Nov 2022 01:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237613AbiKSAKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 19:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237478AbiKSAJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 19:09:49 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C66A65A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 15:33:03 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id a29so10583605lfj.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 15:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZW/KVp2AUxGQEWc2f/qSxCfb9I/iYgRFf9DDe1VokY=;
        b=jeYxOBAae0nkZMhCajRWxNl4BsHIp/gJUcfUlzn4W//+IRNZdt4c+u4xkFcSSrbpF4
         sh037Zjjh6OBFnXtZv+L9j+5jwN0QKPZYxbyNd0iVqa6l+skXoNYza9N/xnry4guT1n1
         JKAYszaPm8LSW405Fg3GX108MPQgibCf63zG4K/d7lfbEBaF/OPiBxSqiEQDyWn0V89u
         3s/LkPs2lOO7+dT0hFtLBww8jCLoHgxPEgyNI/Y2eBpse3FLvWGxCCOhrA25KKbVtkLp
         ICnFJYDcnPyMQ3lTLyzzP6PnPu0dA/hI/rzUWoZ52tMD651+ax1umuzGfsq5zPTCwWLM
         zhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZW/KVp2AUxGQEWc2f/qSxCfb9I/iYgRFf9DDe1VokY=;
        b=le1pgzey+mduR+nD574qHs1BIGnryubppp0OSdlUAtFktz9bE80zSwcHqzjhDZieio
         O7xZMKmMsb/fknIN8+oLZ5Jk9G2xW2VF3VJPNZ9pJdZU8zFW+Tctap2mW+iuuZPYsvGp
         OZbEZN1u03Gjp4lFYKEseqWcMzutXwrgW1PZhqZYGGvBUht5DXeUANMAged3lDQt7SIi
         7IVwTEfaNE9uEFtXuwquC5dKOJ7YXdXx6cKwdFGeATo5R7bIkLIoSaPVdYpsjOfX081O
         owAiL0D37PyCdZsHFq5GAj4DpwYuCYcTtWBJHmHjztVbzw9kYHK1rPioaNj+aBXegd59
         WkPw==
X-Gm-Message-State: ANoB5pmKYmbH6j7msMO2+BKhbNvMq2t9Ggg/8i6UrU3/w4wTEl/yXnxB
        Tp2nTWBQHJXNlGVaMWzzToxTEQ==
X-Google-Smtp-Source: AA0mqf4jXbJTDhzUsg9iV+s2DbbmtyvSGp9egr4e4Kb0jNBK31FGHn1NPHnPzzzMdZbTag2CRNWLMA==
X-Received: by 2002:ac2:593c:0:b0:4b2:2cff:8448 with SMTP id v28-20020ac2593c000000b004b22cff8448mr2869937lfi.252.1668814381687;
        Fri, 18 Nov 2022 15:33:01 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id k13-20020ac257cd000000b004947f8b6266sm843900lfo.203.2022.11.18.15.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 15:33:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 8/8] arm64: dts: qcom: sm8350-hdk: enable PCIe devices
Date:   Sat, 19 Nov 2022 01:32:42 +0200
Message-Id: <20221118233242.2904088-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221118233242.2904088-1-dmitry.baryshkov@linaro.org>
References: <20221118233242.2904088-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIe0 and PCIe1 hosts found on SM8350 HDK board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 80 +++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 69ae6503c2f6..bff75602303c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -234,6 +234,39 @@ &mpss {
 	firmware-name = "qcom/sm8350/modem.mbn";
 };
 
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_default_state>;
+
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_state>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -245,6 +278,53 @@ &slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <52 8>;
+
+	pcie0_default_state: pcie0-default-state {
+		perst-pins {
+			pins = "gpio94";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio95";
+			function = "pcie0_clkreqn";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio96";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		perst-pins {
+			pins = "gpio97";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio98";
+			function = "pcie1_clkreqn";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio99";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 };
 
 &uart2 {
-- 
2.35.1

