Return-Path: <linux-arm-msm+bounces-3324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9B1803956
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D7901C20A26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B1C2D051;
	Mon,  4 Dec 2023 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ovEabB8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF52EC1
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 07:57:58 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a1b68ae40efso165999766b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701705477; x=1702310277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXiExZXT3jiK99FXcsrgF/kysbafhPV92GlI6Y+M7JY=;
        b=ovEabB8d9siDjDzfG4CR/FH8RADEtJ33jpHr3ErAJbT9GQGplTyqJi8eCLCID6bRXQ
         HVla9Y/ShJmz3cfoDeG25PJf2MbwVw4vru0W1HKCMNtL3HUNybjCF9hiSi4b6PlluE4I
         Sp5+mZRml7dPrbuBNhhvOoTdnSsevwMu7BdGXcx4WUjY9PPc6+qgeRCnMiAZmHfVmnR3
         F9ydB7bVBslCjE+LETacyiQ2w6nOH+FHZv84yTrS6011v1mqz/XECjhrdzW1UmNlZlQF
         T+t/KlMoiiwk12rogaU8CGSl4nxK046MFOCwLrS0YzjCu8S6dyW85vSMimptEQcfRwBH
         xAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705477; x=1702310277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXiExZXT3jiK99FXcsrgF/kysbafhPV92GlI6Y+M7JY=;
        b=FYw/kIh3z8shs/yh0D1dQR+uMFCPkzsZ0FF/dTd7FR7hCpw29HsG5tnFLVLZa/7IZG
         0gASpYI0Bq5UeeqCKIyrhoyDiG2TL99FvblW4nMRdNDiLQhtU6DS+9G0j273Tr9WiPhE
         xnCie1jFg5k5j1FTXjQdcgOBB0OPtbAd27RmJLoRYRELZi9UE3Y0l36OZ1XN7uDQ24eG
         5wT9YzSqwNQd6GexIDPMKhQqvQUYjT0i+1G4xG6luLYRU13TOZ7Om98ib3fHiFmjSN4G
         esmIMixNtq3cX3+I5tpwX0KopN0V73DzNOi7B6/MHIWT4vQ2yJATKr87R+q2+eTn7csU
         hnlA==
X-Gm-Message-State: AOJu0Yxi8nOvzeLpYt/X1UEFP5FP0U23Fdfp6Y404uNCTb3uDKqXwggF
	I9Pc2LDvqS+Db9KaYP3lmlIqKw==
X-Google-Smtp-Source: AGHT+IGR+TMm+f3WtNIG4ICe7cOSnOhA/mQqgpW9et2qTwzWCA9fYe5zaxWjGAg+5XSVopn8d/csig==
X-Received: by 2002:a17:907:2da8:b0:a19:a1ba:da60 with SMTP id gt40-20020a1709072da800b00a19a1bada60mr3664010ejc.135.1701705477580;
        Mon, 04 Dec 2023 07:57:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id q19-20020a1709060e5300b009a19701e7b5sm5429304eji.96.2023.12.04.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:57:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: qcom: sm8650-mtp: add WSA8845 speakers
Date: Mon,  4 Dec 2023 16:57:46 +0100
Message-Id: <20231204155746.302323-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204155746.302323-1-krzysztof.kozlowski@linaro.org>
References: <20231204155746.302323-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for WSA8845 speakers on SM8650 MTP board.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. pinctrl-n/names order (Konrad)
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 48 +++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 656cdbc6f234..9d916edb1c73 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -434,6 +434,16 @@ &dispcc {
 	status = "okay";
 };
 
+&lpass_tlmm {
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -580,6 +590,36 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lpass_tlmm 21 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l3c_1p2>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l3c_1p2>;
+	};
+};
+
 &tlmm {
 	/* Reserved I/Os for NFC */
 	gpio-reserved-ranges = <32 8>;
@@ -611,6 +651,14 @@ mdp_vsync_suspend: mdp-vsync-suspend-state {
 		drive-strength = <2>;
 		bias-pull-down;
 	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio77";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart15 {
-- 
2.34.1


