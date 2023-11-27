Return-Path: <linux-arm-msm+bounces-2063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14AE7F9E72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 12:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFAD11C20C96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 11:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238C0199D6;
	Mon, 27 Nov 2023 11:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfgOWrr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D409219A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 03:23:37 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a00c200782dso596111466b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 03:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701084216; x=1701689016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tG/eml13csvxIp1oMDXpaSHee6jGTwYfsVkZCG1NSN8=;
        b=KfgOWrr4O9usu7DOTUJmpw/sdcN5gc9FWta5OoyBH6sk3cWRBOp0pFyYC46QlStN8Q
         XNTRbSlVDBy/ZFYcB8Qm0NpgY4HvlNHpUQTvGDPBxQJSoOaO6DLTtibZbB6LP5OCZRmv
         fd9DXG6iq6zNUTKZLbIWCQbhdBE3+IxE2j74mRYPaOe4dtr4RYSNT3PRe5EfsXRD/IE8
         QyB6tjZhLVhKQ7y3keJnAV0uU3L/SJp+ufKqDLSexXXbX355kLdCxD4ABAbkUZqox0wx
         UpZjXruj+jnl54cEGXeEn1wF6uZytlDPVZhlyt5n3SZDyBKDuWwBxWWwIIisk4/hWvJ0
         ghFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701084216; x=1701689016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tG/eml13csvxIp1oMDXpaSHee6jGTwYfsVkZCG1NSN8=;
        b=Wp4ong8A1IQapjv1eZxjNOSc8UOExhdPjuZKXEUTLKcuG2ygjxz1RaTCLZ+vkdMDjW
         TFnKMdlvvP/4+65Q7R/8wK41AwukS4JpHEezkF/xX0XXS9Pl/0frIGM3rotZB2OYLyla
         Lm6Ge4/xNO1aRzLTYtefrr4JdDpz9WFtZPSo5NRoZ/eTiJyauPjPl2b84J5eCAPjusxY
         JHqt5UKOZ+IMmjLUZeV6I1eYErSP0WKGeNJxzvrfaR7UpGVh6vhwd9lxjy4lvJouhtb6
         Lpl53vIW61CSSHYQwgHibF5D6gVHrlihYTiLUFTU4Gqx+u+4edfvpMW1kWNKkvauCXo8
         dBYw==
X-Gm-Message-State: AOJu0Yy+zSTrXIrfK8hFPrbSlvYAQb8r+AIYseLct/zSQIWcRmy0uPWH
	BreoxmJvM8tLwSU4joWAMQOgGg==
X-Google-Smtp-Source: AGHT+IHVC3pNIVeD6T2dC9GgHQlGs4DIuaGWm69uRn3RdKePYr3AHpkd2fzbVwdmAGkghGV8VVDMDQ==
X-Received: by 2002:a17:906:2306:b0:a01:8957:7c75 with SMTP id l6-20020a170906230600b00a0189577c75mr6727359eja.11.1701084215850;
        Mon, 27 Nov 2023 03:23:35 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id oy9-20020a170907104900b00a0db5da857esm1804866ejb.217.2023.11.27.03.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 03:23:35 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 12:23:27 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm6115: Add UART3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231120-topic-rb2_bt-v2-1-4bbf266258ef@linaro.org>
References: <20231120-topic-rb2_bt-v2-0-4bbf266258ef@linaro.org>
In-Reply-To: <20231120-topic-rb2_bt-v2-0-4bbf266258ef@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701084212; l=1620;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=kYyiyFCu+n/yVlnn1CSwFTlalzCOHYGEMtzMtZRhGhI=;
 b=Var6ClDM79jvegu831olSzRh7LYB42zq/l205tA37Oif102CfzMuic2pxTVWa5oRDYzGQ2/+l
 NE/8KZ74Xu+CYYfvD3Dp4ojAxgbXJYqJ53e7xiXJ4/Go2+uXamzAtcU
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Hook up UART3, usually used for communicating with a Bluetooth module.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 839c60351240..0d13d7bf6bd1 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -273,6 +273,25 @@ memory@80000000 {
 		reg = <0 0x80000000 0 0>;
 	};
 
+	qup_opp_table: opp-table-qup {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmpd_opp_low_svs>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmpd_opp_svs>;
+		};
+
+		opp-128000000 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmpd_opp_nom>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -1208,6 +1227,17 @@ spi3: spi@4a8c000 {
 				status = "disabled";
 			};
 
+			uart3: serial@4a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a8c000 0x0 0x4000>;
+				interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				power-domains = <&rpmpd SM6115_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
 			i2c4: i2c@4a90000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a90000 0x0 0x4000>;

-- 
2.43.0


