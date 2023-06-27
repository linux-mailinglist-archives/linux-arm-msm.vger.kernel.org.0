Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4780473FFBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 17:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbjF0PcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 11:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbjF0PcW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 11:32:22 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324E82D4B
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 08:32:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-313f363a6f1so2318400f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687879939; x=1690471939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0ZBGd7YKXQ+7JJGnVWF+JcYqAtSrGs+/u/C5tnBLuU=;
        b=BclnX6uBfSiyRTC/yZKBTLPIs6TbxMLJaDwNujrh6UmHHbC3dEJO3r1iEScsmwATVU
         0gADNzItEgbShzI4yAkJi1LfcTkwtnWlj8oCd1syqfHeD47mjuWPTmhLaVspDm1DooGv
         1rgD2WILDm9Nzqv7FFMaAQafSzByUZHVgqFPG33BPVdM6yq7+7oVf044BBQR8qdUEq58
         HgAsSQtwQ5ryLfgTL4hUbGdRxmYknH4SoDHLQ85bXGRlNCFsgnGcaI96zuoDAKL5kiP2
         Sg7c3XYqSTie9ClLJEqVpsFtBkLaRYd7l8G3CC0iGsHbj5Ax6vJDWaziBa1Lgjkk7e89
         EKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687879939; x=1690471939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0ZBGd7YKXQ+7JJGnVWF+JcYqAtSrGs+/u/C5tnBLuU=;
        b=LvxdsSAvFvqdl1IQVAFVz/DQnRzY0hMC6qE0RACs1ooOv4jXLOdqziaolRC4FaFwvz
         Fv0l+WyhR1wVQWZCVVcYkrtvO964eLyWsrvuAyur1s6iDBuABCikyXyIK+Y+tpgNCpAo
         NtiwIFtZT/9efxtr3Raq9wAwhjwpFk0DOc69XydVcGmrqItmQE9GUl6zamiLXDV8T8ug
         RBDtIfhZaIMXwuGKg3erQUGTOx6FDyzZRTA2OTvuhIn64PrPSo4c9i/3GcUrCu7txjjG
         8Jt3IprDoxLg1iYSxLAPeyCe2c2WPJ9h/OoNe6ZcqphNQnyqZcc/JvCWsn44PcZsOSkk
         a0qA==
X-Gm-Message-State: AC+VfDxbwRB9ouh8yHC5mbyVh8OGUkf42/nbz/3I1T0F+Emrqg61SRTl
        7qMfQ9JtVA3Jr8zeCbXvR3VbnQ==
X-Google-Smtp-Source: ACHHUZ78PzoeHvYXfm+l/i28Dj4YRa596IuBoEhjDP4z14zEX6l5stTw7nj9Vrk18BeqptDaQCvd6w==
X-Received: by 2002:adf:e441:0:b0:313:f45f:74a1 with SMTP id t1-20020adfe441000000b00313f45f74a1mr4191185wrm.51.1687879939707;
        Tue, 27 Jun 2023 08:32:19 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id c25-20020a7bc019000000b003f819faff24sm14089214wmb.40.2023.06.27.08.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 08:32:19 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Tue, 27 Jun 2023 16:32:16 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: c630: add panel bridge 1p2 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-c630-uart-and-1p2-reg-v1-1-b48bfb47639b@linaro.org>
References: <20230627-c630-uart-and-1p2-reg-v1-0-b48bfb47639b@linaro.org>
In-Reply-To: <20230627-c630-uart-and-1p2-reg-v1-0-b48bfb47639b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=+WJcNXowsCpb5IqqsxVaEzf1xlcF7Pi9NpneNQQm3q8=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkmwEBVFBQAnyx94gDeDwfZQmv3xJsRwQG79gxm
 GeJnQQDBtOJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZJsBAQAKCRAFgzErGV9k
 tjt/D/9AsyUW+K9EtWZ9osxBp3dV1dgC5WXPYUSEMOkY0MIkUMwmaZSvioFh1vN68sQapKD9hxT
 XxArIV9WHMo27YEcMyPGopushrlxKOfVxZqchwpdmay8FFNfh2ov6rP1mwzmoVZhix9k+r6LYGM
 AEmNYq1kNBd+td/FG6KZ4gTq/nx4YyFvrDmxMH0iWbEyv66XIL/3y6G0fcGbIT6yrd3oCeeS872
 oweJ0IDZwTX+wA0zKo61MfmhzRYjnnKfLStxKO1bLApydGnyynnbnjhjqpP3d9/obCfpOdUZqte
 vmVutCJj9Qd/YjKO7iqVL/QH1P0qNazLnI5lKM1CNtcsbaSVE3nTKxj+PHxEYHmErfd+VfIDWHY
 zrd8Psq2Yht7K7MTShDzfaz8r2CX6uYpU0nZqDTOAruMEfutKJKTFo2nv6FDhuhPGuc1NksWaif
 CM3Y1ZZPnqpKESnINsiYNVZ31LS2gK6Dp2EEOng58/yWirhI6d3SNJiTqnZ1KQ2cFYD+d5oo52z
 MBmHaw0nePljPAOkyPJqMo7cbAZvoTUroxApNlg5ITeip3qbmWS64pp2WvPF2ak0fyNtlu7vFx9
 6vy7INiPlkF7pvR2RUQg84xHW1WZcMS2E0CU+BruMFopxMif0kn83sC5vBFUwR4unnQUzFHgm7E
 f5ErUgj5h3V1tug==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 22a7d997cdb0..94e37e5d2177 100644
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&sw_edp_1p2_en>;
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
 
@@ -500,6 +518,18 @@ &mss_pil {
 	firmware-name = "qcom/sdm850/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/sdm850/LENOVO/81JL/qcdsp2850.mbn";
 };
 
+&pm8998_gpios {
+	/* This pin is pulled down by a fixed resistor */
+	sw_edp_1p2_en: pm8998-gpio9-state {
+		pinconf {
+			pins = "gpio9";
+			function = "normal";
+			bias-disable;
+			qcom,drive-strength = <0>;
+		};
+	};
+};
+
 &qup_i2c10_default {
 	drive-strength = <2>;
 	bias-disable;

-- 
2.41.0

