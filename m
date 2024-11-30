Return-Path: <linux-arm-msm+bounces-39673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABFE9DEE58
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2DF4B22D1F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6311AF0D2;
	Sat, 30 Nov 2024 01:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggyEIC6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E301AB534
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931140; cv=none; b=caXHxq08arac7zYfc2UVJfgd/Z32pLh15KpnFHbLNfmBhLM+07nklWzD2BYMD9eq2bjFcuMvhGQ2A4chuM3XtTaxmc4+WzyVk219E9T6/fiJKFHnpm05wqzEGIwVC4+l4dHjWykmpGjETa4rNajgK/T9SU7XB3iyFKgrz9pASHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931140; c=relaxed/simple;
	bh=mtCCW5ebfpV8Y7thaprvn+r5wXgk5Z84tH2knZkid3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPgNtIFZJLs7tR+wBKyTlk0g1mvC+d07jDK8gzMwYxQjEAGOnZYIdpC4cW1uohUIEdInNC1gVSceM3+kYWI0NKbEa1Ea92+7yxRp+VLBkqNgHcYq0Yu8ofkYgoBiSN+HKCjzjisbRxEyBFj5xGBVstfKRh7zeRL6vTO2EkekxUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggyEIC6Q; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53de8ecafeeso2738617e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931137; x=1733535937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJrh3N4TJd0G0j63cOhg+qBWqNJSKnxQJYR2H3XOGLc=;
        b=ggyEIC6Q7bwQLbrZ+8UgoVcsOSjmzqWgRIIZ/y09gyVnYKNlejabdCQU2Sv9VKJIab
         oRi5WDOWaUG97VwFL2EXAkKGdig36m9P9tI/7bm70NGzScgbvz9ixta/kmLrHn8siQli
         sCJwYa484K0Rymr3/lGjCSlOy1scTCkNSyPKvLgbnLi2lKPEyymjmGwgD6qIEJqN/d1c
         /L/YRbr0858LiNVjW7JVC78m8RASaNiK7j14Wn1vxx2gEo29hwLIgiJDb/zcJCvbhX3G
         u1uiKP+eS2ANqcnnSxESglefKUTEExfM5BOz7dTJsaM2N5GihLm+Cb2h1CJQD/Pr3gnf
         YEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931137; x=1733535937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJrh3N4TJd0G0j63cOhg+qBWqNJSKnxQJYR2H3XOGLc=;
        b=olK9ZqZBXVLTl4VpGP+ChNASj36T1uCDWidyVOvYLksfC/0h9tzugUGg3xLVJWLdr1
         9iNYQ/s2LYa5zfaPd+JMozVSw7/f51iRlEDW1hrLyQVTVS4Jbi5E61iHlCZiscH/uSTA
         AkqtvAJqdiX9HoT3pGYTZZnwj+o3cfSFwc2p+l6x1E6nzLRZWBJUY+yRD0OzaANgtp7b
         U1GZ7/Vi+H5aYeAGo8HhlCj991OXlFemM3KGoEDtybS5EyTHwwAU9Q1yHqCvOxkVh+lz
         nBV88SL3KT6osqq0Cr2yzc3roVV8sRQ4pZTL7iNlPNv8SuzuodRX17MkQn7vUJNmQqdS
         OqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb6rTV+uXtiHUovOegmkcFnadruwJkjAnkz4H4h6b/CzGcxRTvN7Rp9/ePR6AnBDkeee7DRx865XhiW8Z6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3b0/PQEELHPztUGorcicjjwRAiNfCBNzNd3dP1fpnD/LrlImQ
	4iBnsFSCqMQ8cQrHgmd5eurYX+ZljRTAgYhveYC1LguuetCd0kXDhysQ8+Q5I9A=
X-Gm-Gg: ASbGncvjEk+kfAxsTQhwEh7pA6NQFMEH7L+D4kr7GFTio9ac+BBp5qBsfSv913JIJw8
	pjBNrygNarKTgkEXrP8AYq7URIA8mGIoews3E1bJotVTMmBvkSY1o/bEqzIIf+HD9mFYqYg2jgJ
	VQYrPg5QjlCs33WpRe/8pb8Z/FOuq8satzgw9oet7T5VaWVJuFyS5/UnEJrFdF3/hkG8fAYv9Lh
	r4YxPnnNvswtTRCUjw9G6S3BTZ9sLqhAerAj06x4yd8mNxMCHNlJgqWmw==
X-Google-Smtp-Source: AGHT+IFoOul/iG/SC8M2OdeMsm7KJdOUeB5eq8LVkwINZ1bnhuZRxl5V2ZgQVNY+Opdg0kWL4H8DRg==
X-Received: by 2002:a05:6512:b14:b0:53d:dda4:8b0c with SMTP id 2adb3069b0e04-53df00d0332mr9214048e87.18.1732931136803;
        Fri, 29 Nov 2024 17:45:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:45:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:41 +0200
Subject: [PATCH v2 29/31] arm64: dts: qcom: sm8650: move board clocks to
 sm8650.dtsi file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-29-b9a35858657e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mtCCW5ebfpV8Y7thaprvn+r5wXgk5Z84tH2knZkid3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm332aAqmoo1ZRiHfw22J/w5Zrri5Jjjj2FuJ
 CzLztXcFIGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt9wAKCRCLPIo+Aiko
 1RwcB/4k3AvKGqR4Cbiv+BQqvha9vEpGD21MX4PloxM2NiO2MmL6pjTrW5Eikov30UFFWhyrw0W
 ZoP3bSKoc+ONix4AkpargijT6T4ywY+peq31yack7/L3ZGYrcvxcXN44cqLtjkDoGqajH+OLz7F
 I8jnd49lz4WcgMmvftSWp/2s2vwYXNt9kdr88aAZxFkm1PBPplRoyaGl8leYsq7exc/GwGPrKra
 W3qBEM2nlPpekWmkSrZxq8lK6n7I9Ydu0lO44hRsnNM7T9313I5Hq8Fm/Cy4C1QVK584YaIqCXt
 jo4unN6TD+T8CPDcfh7ofA3e+FUFOSZgcHllUiZIpfgTD0pe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

SM8650 is one of the platforms where board-level clocks (XO, sleep)
definitions are split between the SoC dtsi file and the board file.
This is not optimal, as the clocks are a part of the SoC + PMICs design.
Frequencies are common for the whole set of devices using the same SoC.
Remove the split and move frequencies to the SoC DTSI file.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 8 --------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 8 --------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 8 --------
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 ++
 4 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index d0912735b54e5090f9f213c2c9341e03effbbbff..f509689af1c2e0dd6ea85edebe490538ff43964c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1112,10 +1112,6 @@ &sdhc_2 {
 	status = "okay";
 };
 
-&sleep_clk {
-	clock-frequency = <32764>;
-};
-
 &swr0 {
 	status = "okay";
 
@@ -1337,7 +1333,3 @@ &usb_dp_qmpphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
-
-&xo_board {
-	clock-frequency = <76800000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 76ef43c10f77d8329ccf0a05c9d590a46372315f..9a7f98d922af887657b4b56b5e271cc4b590db2f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -729,10 +729,6 @@ &sdhc_2 {
 	status = "okay";
 };
 
-&sleep_clk {
-	clock-frequency = <32764>;
-};
-
 &swr0 {
 	status = "okay";
 
@@ -884,7 +880,3 @@ &usb_dp_qmpphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
-
-&xo_board {
-	clock-frequency = <76800000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 71033fba21b56bc63620dca3e453c14191739675..4943127e27a15af72f6d3f281550b1d8ac0ab77c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1040,10 +1040,6 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
-&sleep_clk {
-	clock-frequency = <32764>;
-};
-
 &spi4 {
 	status = "okay";
 
@@ -1320,7 +1316,3 @@ &usb_dp_qmpphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&redriver_ss_in>;
 };
-
-&xo_board {
-	clock-frequency = <76800000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..cda249f767e5f1766134c62a8e5f312ed17e17d5 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -38,11 +38,13 @@ clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <76800000>;
 		};
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <32764>;
 		};
 
 		bi_tcxo_div2: bi-tcxo-div2-clk {

-- 
2.39.5


