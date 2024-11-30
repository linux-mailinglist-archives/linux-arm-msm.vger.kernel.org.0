Return-Path: <linux-arm-msm+bounces-39670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A489DEE50
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 121FA281C29
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C241AB52E;
	Sat, 30 Nov 2024 01:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Laew7HcZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E871AAE2B
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931133; cv=none; b=t789h2HriusBDcvcugpVXU3XBFjdm5Qq9UO33ym9x+6ks2DOHR4TiirWbaoyQJNoof8H1ryleF7I1uVtzSsRI/S4kuleUWMwlsgVTmrhIeq2XmAT/KUB28EO8f4VfmgVc7Yl7F0Q5LtjNr9SCd7AaVBiwioV2vI5pI62sYgsXzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931133; c=relaxed/simple;
	bh=Uy0U0ERr39hDg3O49x0h3zoYcwr/oL9Yd1/e2vOTYSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n15fwy3CvWveKhkXsPKH6mEG4pZ0gQ0Db4zneiHBWMgzIPU+GbIO5YjI1irJZvS6BEQXAwtjf3ZgDyWnVf2vNFhsARnK37ZWvUrY5Hh2KtHLJwQcC6eGOn4s8sW5FdLwvi35lv1GVT7/O3eu1nCojhGSyhu2oWR6L+upsi/48/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Laew7HcZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso32056871fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931129; x=1733535929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+c+RSzytJFjx7MIg7eaSWg+rDoxb8wPpF5exbHH8xTQ=;
        b=Laew7HcZpjdbEBEVqR25FXOxYoGuOecpOFT2mupokanPRnN5XknJBWLHGPnVEC5a2B
         pQLiab47EFwezf2ucR8bNz8qYPm7A6oNm/qk5htbNlgPP+7q4ekCINbZijAWz3NwJl7s
         mthPYTAp8pVgkoJEzVgKM9Xn3+j04RIZRidycSD6CGdySwf61K3BJu/m+jEUIOVekU+t
         sfdVKzmrwHgXQrDTvZ1Y2pi3klOjDQKpf6HmMDB5RDTO1atT8DBZ9AqR5KBOaVLuLolP
         2ZMo7yEf21xqiMlFVzji683muN3OW6IdRmQgSU5nRj3ytJ3/piMCAY5PfI0uQE8xAX24
         kU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931129; x=1733535929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+c+RSzytJFjx7MIg7eaSWg+rDoxb8wPpF5exbHH8xTQ=;
        b=RJUvXLaaQ3Ga52WGxqhSsMuVouqEc2bHAkpaRc+Xs2HybUPoasJRg14MPJO1NzulIJ
         kKBcedFumMEpKFrNCb9WtDj61NfAnBazfab8lNWW6062FpScPoyUWHJnaIm5R8TD87Lr
         V7t/0CTHGqCJTVXBpIMAhz/nxQg+OYnP/a80qhDsNRZeftHfqTxfUjdCDzY+rZREzKhv
         AkMJhw/vtIEfbIQcpl4AlcNO88t+wRnYDPYEk6dLjyxqN1TXnKPQe3oHDuKBC6BbET4n
         kEKEGxCMcH1AuM5Q/KP9alIM7/WpthF4IHHrHsk2VE1SPuzEkrcCax5bduvBiKCP9RVH
         IlBg==
X-Forwarded-Encrypted: i=1; AJvYcCXV2UTlmZf6OcV4jF/9X30416XiacbvjLIWQdfzTQlTSuTAm7Zz/WkcpszKh5SGCpjvoDBKPxMaqm8im7fd@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2wtgueVNeTEYdDfysYYg2IoyCtGpt6tEWDze1zbroJmag4if
	MMGvgRXaW4aR5ZbfnENrKr041M/z3ZG9I39y9fzYkdO6dU6TKbsYiyShcBUd04U=
X-Gm-Gg: ASbGncsyNPPLFsEXPE7GPnXZC0ZZRO7xCj+UZSFO3ojk+5TqDtXgS3TZqei0lbO0mk/
	WJL+A+Pv/fZxgnOW7y09o0MuVZaleGUsqKW0uzaEyiX0QdluOdIiW9uUZrWWKLHrcQlV0cGaG3P
	ioUbQQYqutAcdBDxEIYLEvvaZsaSdD4jg9yqt5yAdc6Tz4bUjmH27s8kwLRAcCNOrbQBlBlRLUj
	MsrsCwANSF12QPpHcj+Wqdwh43fxsUy/3VtGbN5N3qV/kvKbiYpuojy5Q==
X-Google-Smtp-Source: AGHT+IE8uRm6rHrMw7TRWbEpQREzwmtNJXmz1+qCsTtCPbR+h6nvAVNL03Sp2DPMtIyUiP1Re8AeyA==
X-Received: by 2002:a05:6512:3ba5:b0:535:82eb:21d1 with SMTP id 2adb3069b0e04-53df01178e6mr9262667e87.57.1732931129250;
        Fri, 29 Nov 2024 17:45:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:45:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:38 +0200
Subject: [PATCH v2 26/31] arm64: dts: qcom: sm6115: move board clocks to
 sm6115.dtsi file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-26-b9a35858657e@linaro.org>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
In-Reply-To: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Joseph Gates <jgates@squareup.com>, 
 Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, 
 Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Andy Gross <andy.gross@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 James Willcox <jwillcox@squareup.com>, Max Chen <mchen@squareup.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Benjamin Li <benl@squareup.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3935;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Uy0U0ERr39hDg3O49x0h3zoYcwr/oL9Yd1/e2vOTYSE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm33+KjqyOEr/xJY9QiDeHeTCec5MxeXer3v3
 /563gSdcqWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt9wAKCRCLPIo+Aiko
 1SHpB/9HXYBNkPzn7RniXXS5K8Hjs0qzQAZvGwSnyAEaIVO595wk5rkt8gtsNyzffh3xH/XX2vC
 fmaEx/jrdtVetRV5IGsvfcCVIG7r/5sdf/kr2vyvKC6ahlTdK9e5wVElry+xK1nWvWtNtDiksz6
 74/1NdXFLvAVzaUiNH0FkBPSMsXAbDx/m0P9FjxedLtdEb7UrY+x2lUUN+GkJNoqxAWGvC+kjL8
 5GFGQB3iEsBRhR4PmKGMEeJMerHCk2Gj4lPk8VG59Rg9rHUAiFiDhnW9AyVDeSN2ffhx2QwsuM3
 jSdV1z8WhzA4GmoPbz9DQpLR8N5iSku9fvE9Ea5NidYBLOKP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

SM6115, SM4250 and QRB4210 have board-level clocks (XO, sleep)
definitions split between the SoC dtsi file and the board file.
This is not optimal, as the clocks are a part of the SoC + PMICs design.
Frequencies are common for the whole set of devices using the same SoC.
Remove the split and move frequencies to the SoC DTSI file.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts            | 8 --------
 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts | 8 --------
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts     | 8 --------
 arch/arm64/boot/dts/qcom/sm6115.dtsi                | 2 ++
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts   | 8 --------
 5 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index d8d4cff7d5abed405d1b4cdf9ab8264aab076830..675f9057ed442fb4afd22064b4022df5ed8cb882 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -544,10 +544,6 @@ can@0 {
 	};
 };
 
-&sleep_clk {
-	clock-frequency = <32764>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
 			       <56 3>, <61 2>, <64 1>,
@@ -695,7 +691,3 @@ &wifi {
 
 	status = "okay";
 };
-
-&xo_board {
-	clock-frequency = <19200000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
index 9153a5a55ed9fe82ea6771ef87dae5620a4fbf2f..ae65dc2abe510d35f1aeeeac5ccf5c576d688734 100644
--- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
+++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
@@ -193,10 +193,6 @@ vreg_l24a: l24 {
 	};
 };
 
-&sleep_clk {
-	clock-frequency = <32764>;
-};
-
 &sdhc_2 {
 	vmmc-supply = <&vreg_l22a>;
 	vqmmc-supply = <&vreg_l5a>;
@@ -254,7 +250,3 @@ &usb_hsphy {
 	vdda-phy-dpdm-supply = <&vreg_l15a>;
 	status = "okay";
 };
-
-&xo_board {
-	clock-frequency = <19200000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index f60d36c03b9b51d1ba5fb2db7d619916fe42f084..5cf0d2383019abec53f875c727e86656f3ac4478 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -471,10 +471,6 @@ &sdhc_2 {
 	status = "okay";
 };
 
-&sleep_clk {
-	clock-frequency = <32764>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <14 4>;
 
@@ -570,7 +566,3 @@ &wifi {
 
 	status = "okay";
 };
-
-&xo_board {
-	clock-frequency = <19200000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 9b23534c456bde8c400cc331e847f0f84ae0b74a..29eb179ac519dd0965977902ca0edf6a06fa147b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -28,11 +28,13 @@ clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <19200000>;
 		};
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <32764>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
index 9d78bb3f71901705fd22d88b472f6fc1d0c0fffb..27936023175bcb73e73a85b463c4b9f5c00541cb 100644
--- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
@@ -305,10 +305,6 @@ &sdhc_2 {
 	status = "okay";
 };
 
-&sleep_clk {
-	clock-frequency = <32764>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <14 4>;
 
@@ -382,7 +378,3 @@ &wifi {
 	qcom,ath10k-calibration-variant = "Lenovo_P11";
 	status = "okay";
 };
-
-&xo_board {
-	clock-frequency = <19200000>;
-};

-- 
2.39.5


