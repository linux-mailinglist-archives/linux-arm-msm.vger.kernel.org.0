Return-Path: <linux-arm-msm+bounces-33438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A29AB9935FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D48921C23B2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815791DE2CB;
	Mon,  7 Oct 2024 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hwKNY+Mk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A47A1DDC18
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325387; cv=none; b=iQ2q0D1B7+/GClBxyNfa0B55k6LI80+mt9zOBVrIzcZR2O48ALEl9S/le5E6EQD3q9ZO3AOmOBLvs9YHgVlQxjvP4N/Gx2xkx7Ig/98is6NqBJDqctU87LV7Amtfktmd7Wk7fUmOB24n4zRT+qoiSWgFg/+L7DjVtCdOnsX6uhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325387; c=relaxed/simple;
	bh=U3MoflWSS4X7ojpD9s6AHdoJKHKG92yadksJttRFSWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkUdBpXFLg1LgfAiKFHf9tEqlzwGYzUuWgelrvBbIy46TpiS+4Sj4TCZmfCKK7PCk5x1BG2rtmQyGwiTjUHRtyicAunZ9REvR3D8A6agtLg3aAjJThlT1T0JPVdm1JxvINleKb9xeDmKp3DPcHvOG/OHck3QjOd6s62ZNCCvuwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwKNY+Mk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a99415adecaso346122766b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728325383; x=1728930183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TV6+Hn2cOZip0zLKLF+j4ubTHiIZhcY3cY83jYd7n5I=;
        b=hwKNY+Mkz+mJvfO68KHlcbfKsOO4xsz2gJ95BPmCquQ85Q+r8go2F10w/4kWclvBdc
         46ondUzPmW7N2PweDZc/CISwmowfYVuetBARq9n9vQm44uMlWuRuvoxXTiqPq2FMWzDs
         5HVRci7y8AB5ElFwtyfovN6r0Oc5UQRVvxkVDyuHdETW8QrDIkMX1YKpMCdqgGyMeAGj
         rPK2D22vFprd3v0TtlvsqHPCpMklOmx71Wp8qzwr1Pbgn0bA/f9g14/HA/zjHYZ26qjf
         1DGM3GmZH0gXBpAVIUaifBosBRAXG+b0gzLKxki1L1sILU76MOmCWOhRyPxtlrzctrNL
         z+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325383; x=1728930183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TV6+Hn2cOZip0zLKLF+j4ubTHiIZhcY3cY83jYd7n5I=;
        b=BLJkTrmYbzYrusPd43HDLug4UaxQL8HsR36zh3liw8VY9gKk1BXMxVv6dt7YclcTgv
         UzdQaVKyKuglr2G18Pzodn+sPEezN/8SO9v7aYNMQNquHQjyRHbjxDLUw+Wi4G66vWsH
         6dDesqxR4WOEz+WdTYr2nwUSugRM0BJQOaZZhEYgiuENvBiTBe0AlffLtHV2faTGRTvJ
         ujLWPTbcGqlhzzIPJi4wjCjKTF4pWtfzNRfR+fcnMRnT8EgWh+RMsg0x5CvXqnmGncuM
         RSkWBU4VsjgkWZDE/yvbz+TlFg/KtjNA8r8Rmi917c8wlaU+Y0KKJJGRVSM/SooMQtIs
         +kaA==
X-Forwarded-Encrypted: i=1; AJvYcCUk6BgiqxFfUd3puf/a+X+lTxmYI5XkgRNo0ATJqTg9a7fSiz+qWkT3tETUdqqBZN7c5SuwdyGncFrOEdfB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0X5scc8BEJgahKyWbIbMc5lmUjJ34SMs8JvZS1rGLUMTJzrH0
	DXOM1karpoTO/OYThxi5vFN4EJJq5ItJ53U+Rw+vNQcdFhiE3WycS4s+so09QrA=
X-Google-Smtp-Source: AGHT+IHeeQ8fqyML5vW9K4B8EifeafJ+qeRRkbLMNV6XhNuUaFFWRAutmIl5tcg/2wYLm2oHU1Fn1Q==
X-Received: by 2002:a17:906:f5a4:b0:a77:ab9e:9202 with SMTP id a640c23a62f3a-a9967856408mr51484766b.4.1728325382797;
        Mon, 07 Oct 2024 11:23:02 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:4109:b8c2:873b:4a28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05eb34csm3452963a12.59.2024.10.07.11.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:23:02 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 07 Oct 2024 20:22:26 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100: Add uart14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-x1e80100-pwrseq-qcp-v1-2-f7166510ab17@linaro.org>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
In-Reply-To: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.13.0

Add the uart14 instance for X1E80100 (typically used for Bluetooth).

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 06d27c65dc11..185bb15c2945 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -1991,6 +1991,31 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
 				status = "disabled";
 			};
 
+			uart14: serial@a98000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a98000 0 0x4000>;
+
+				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+
+				pinctrl-0 = <&qup_uart14_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
 			i2c15: i2c@a9c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00a9c000 0 0x4000>;
@@ -5802,6 +5827,34 @@ rx-pins {
 				};
 			};
 
+			qup_uart14_default: qup-uart14-default-state {
+				cts-pins {
+					pins = "gpio56";
+					function = "qup1_se6";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio57";
+					function = "qup1_se6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio58";
+					function = "qup1_se6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio59";
+					function = "qup1_se6";
+					bias-pull-up;
+				};
+			};
+
 			qup_uart21_default: qup-uart21-default-state {
 				tx-pins {
 					pins = "gpio86";

-- 
2.46.0


