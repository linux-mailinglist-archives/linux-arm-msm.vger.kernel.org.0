Return-Path: <linux-arm-msm+bounces-54-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 862577E39EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66601C20C52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402702943E;
	Tue,  7 Nov 2023 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHPFyqoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D95D28E06
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:35:52 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42974119
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:35:50 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5446c9f3a77so4498533a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699353349; x=1699958149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RrPqf9g6vZzcW9B3QMf8ZEkIBfqDLbMeI1GDD+TO1g=;
        b=XHPFyqoZj2+I7AXmweLb/Gp8LOQM58Henj8XrzxE45jgXHSVBxeQkPsUuiB11T/O2X
         8qQkOATMlHO0FwO+WNMwsKYZFjXuJNKalPzvPnmYv3Mhry8WFrjMoPwbu6oOewBpjkN9
         IcXJD5+gb8O2bx/JFgaGyx+wG7c4ubS64chE0Q8DOUD/cDXNPOOeZKrFZLZ6qBqf/mF5
         HOd0QTrOKCbvHuVJtg/nD5//nHXX6Faj/yXZPYxwfOHWKLNfCWje9xrDsJ6yfmetmnpa
         4REaSL3kdu6q/vDdJjujlFCNPnRJxp4C5sBCDC4YaLnMLFgPx4ZUNMckIE10V01LwhFn
         57XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699353349; x=1699958149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RrPqf9g6vZzcW9B3QMf8ZEkIBfqDLbMeI1GDD+TO1g=;
        b=wScHmrJGLT/8XciTywzuZobM1eB+R/yu6H53XdJCsJ5IvOEyWQ4uDXYwupoB1nSu6j
         VAq72EbGXO4Xzs13qkhYDB4ib2bf2P6JspwDxyQglhlW/v4Spaw5yxiNLT6/PhhV+v+v
         uqH0tBP9YhtVtYJWQqYf+KCBJ4FekXeD6lQcfNt1Vdd6wKA5uJP6VJ4ElAG41pasLut/
         6fAR3WDpKOah6+rsul24TYoSymYQEWVseAmm+A7gvy+WJg6X+ssAmyXdZa+8eu7ZMJ5L
         H1vT8ruFP/vgwQ9ghs268/9+SsvF5Q8QsC4nMmtl3mHrETIKO6Vv0PPToAQnR5njSdRL
         5Jvg==
X-Gm-Message-State: AOJu0Ywd0LFrf+SMq79BMqIr3pZbadQ97RO+IMXMhUOJb/HzCLAUwUCB
	LXpZu8+DijApx93/MlHYptv3UQ==
X-Google-Smtp-Source: AGHT+IHgBuwwDy0kLA8vjtnt2Po255HyzaI87LRZNoYTmqYcCe60gxNsiaYSoPz7l5WzxwxGpI8sew==
X-Received: by 2002:a17:907:7fa9:b0:9bf:d70b:986a with SMTP id qk41-20020a1709077fa900b009bfd70b986amr17238224ejc.13.1699353348764;
        Tue, 07 Nov 2023 02:35:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u21-20020a17090626d500b0099bd86f9248sm882998ejc.63.2023.11.07.02.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:35:48 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8350: move DPU opp-table to its node
Date: Tue,  7 Nov 2023 11:35:40 +0100
Message-Id: <20231107103540.27353-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org>
References: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm MDSS bindings expect that DPU opp-table is defined within
DPU node:

  sm8350-hdk.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('opp-table' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 58 ++++++++++++++--------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 6424a3ebdf5b..d1a28cd0ffc5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2438,35 +2438,6 @@ mdss: display-subsystem@ae00000 {
 			#size-cells = <2>;
 			ranges;
 
-			dpu_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				/* TODO: opp-200000000 should work with
-				 * &rpmhpd_opp_low_svs, but one some of
-				 * sm8350_hdk boards reboot using this
-				 * opp.
-				 */
-				opp-200000000 {
-					opp-hz = /bits/ 64 <200000000>;
-					required-opps = <&rpmhpd_opp_svs>;
-				};
-
-				opp-300000000 {
-					opp-hz = /bits/ 64 <300000000>;
-					required-opps = <&rpmhpd_opp_svs>;
-				};
-
-				opp-345000000 {
-					opp-hz = /bits/ 64 <345000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
-				};
-
-				opp-460000000 {
-					opp-hz = /bits/ 64 <460000000>;
-					required-opps = <&rpmhpd_opp_nom>;
-				};
-			};
-
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8350-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
@@ -2495,6 +2466,35 @@ mdss_mdp: display-controller@ae01000 {
 				interrupt-parent = <&mdss>;
 				interrupts = <0>;
 
+				dpu_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					/* TODO: opp-200000000 should work with
+					 * &rpmhpd_opp_low_svs, but one some of
+					 * sm8350_hdk boards reboot using this
+					 * opp.
+					 */
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-345000000 {
+						opp-hz = /bits/ 64 <345000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-460000000 {
+						opp-hz = /bits/ 64 <460000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.34.1


