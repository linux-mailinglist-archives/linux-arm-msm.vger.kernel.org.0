Return-Path: <linux-arm-msm+bounces-72534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D4BB48798
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36E9617F62B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAD32EC0AA;
	Mon,  8 Sep 2025 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4+vLVtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A362E7BB5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757321621; cv=none; b=Dofjp/Z/lRJElURqlKbTEsx2EcrdDvD4D8CM7jGRTedXH8LTvjFMEzMCifFneCVTyAy/0QqNS97h8uPanGCqgxK2Jr4Io9WoCEckooEIFjF49sNsu4nWCaoNIUjZtt95qm7zTyA8febAcIaZutrj3TbzFRMUYDReY6/g0uSWlu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757321621; c=relaxed/simple;
	bh=rFiQ53vPgw9LsfydlaoBkRbkbX/pneng23PpWjHlu9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZURxS5VnggkgPGmI0xVqqmwtKiyhEUeoEuKerPdoI6V55i/ETf0VcofBELvS+X/eeg9aNpRZkxapbuLuHcFldEMTqyNN8tm0Al77/AfbI+1kc285icbpN0nT1QfmLJhKZlgpR7eKP9Y41dIm1RBI3nKCpMb7assL8iYsMvsFRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4+vLVtZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0413cda0dbso81358366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757321617; x=1757926417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh/2mNyNIs048qxHgIr3EMTwfvoaMlWoIfYKvdUbm+w=;
        b=k4+vLVtZnbZNLwcGLNNSsc5kt6DkopSF3PBV26Z1wli/ndEWkZ79ViYUOh09sdqGdP
         qB2xwRkxjllyBn5CWxiYRTFhXZA2A8RO9mjHWEVdIrrbBRyEcj5/Yz8kCySEdwUf/3LB
         JIekU4lFsRWB7xkzNc5RBntAOARu1tvyjlEngcVHfIfybTxN7UG10HYRQfrtK/GdxHXA
         8QIWUeX9WJPOgsph14QgTXSL3CiXOv3UXHSMYagHUl2AFipEkgU+uXIEcQRzmW2GNQ9l
         VE4RQ3HRXN+dZl/Ylf1+w25YkmselZG/28IgquIKVFVzbxvBqa6XioJYtezPE8oJzXvv
         BPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757321617; x=1757926417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mh/2mNyNIs048qxHgIr3EMTwfvoaMlWoIfYKvdUbm+w=;
        b=QJQuVGBSSvBeZ5kqPFDOW+qXN+ouMzr+yrAKkBsM88AkfhkNf/WOOG8pyvRlL/39E0
         SE+/PlF1/GdN6+qxFyUcib/TBoEiRbfB03oGIg0JR5fuOJ3ZHZNpgXxcxwJqoWUl6RPR
         gBFoLiPLQlFWoJGCg+2KXbgBUgbp3srRh5rZzBQ9SriH7eboSxysj2uyiffN/7FgGGut
         +cCzQOVEMAAKMLZcV2VNAMaTyz45bHH2WDd2ZdTm5P06AYxfy8GOKHy5305uKadsfuTr
         3xWvsKQyahmxqkcegsKMQ4iHm21fUKBtPgBt9UFDh7NjEjfnaJ+jp3D1stBGAFuonE63
         HycA==
X-Forwarded-Encrypted: i=1; AJvYcCW3byTKREFkrU5VJ1AMyNd/uDGiBAiQSthBhmxf4G06oAPswvRi7DcI4m3PagvOQmqZ3PCOkCvZDs+R2GNA@vger.kernel.org
X-Gm-Message-State: AOJu0YwnzIoFlhm3/v2sxk52cLKH5GrI5EohsutjFsCQ3Z7EJg8NUIUQ
	yxAMu+z87DNZU7wJ6w+9CeWGuREQsRJdCBF6Q0qT2jDu9yRBx+bcLMn/f9RiSMd7NtA=
X-Gm-Gg: ASbGncseWfyVVCKx5VrJUaGybWoNP3BmYgtKRiukDlwUWwT9Xb/7mGEZFwN/KmgNI/Z
	qVKISWYHntelPFM31SQyucswwLVt1aOaeWHka/ZkpkI2kWH9MUiAnT20xEsde/7tE4vpxsVjd9Z
	2vhKr2NV2qbZ9QK1Egenvx2cKf7jeaP2C5BgCe7WyPlvvakdsBLdZgV4er/vwjtqAKSx0xqMfpI
	MnmNwDpgQH7WtAyN7F0YtEeWGdUvGNWdgXYRuORjS1gMWhYsZWXmfD3ItGVfyFYqvj/SbPfKx7M
	PTCiaVOWCvGSxTXkrNwdr+T+gqslULONbi1rCyx5jzL99UuEoHmB/Ds+dGAM9s5GHyqlw5Imots
	wooArPFFaNN5U34nXsB4ISwZFsuVCxHTq8aDPJWK+8oUk
X-Google-Smtp-Source: AGHT+IFWDk444EgZYM118deL2xXTuL841H0p3nJmbYIqAe8gNeJ0X4sP3gxDEef/Q4Qcec7E3gNOtw==
X-Received: by 2002:a17:907:3fa7:b0:b04:74c4:e203 with SMTP id a640c23a62f3a-b04b1443503mr370201566b.4.1757321617292;
        Mon, 08 Sep 2025 01:53:37 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0438102debsm1757817566b.66.2025.09.08.01.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:53:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8650: Drop redundant status from PMK8550 RTC
Date: Mon,  8 Sep 2025 10:53:32 +0200
Message-ID: <20250908085331.56478-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=rFiQ53vPgw9LsfydlaoBkRbkbX/pneng23PpWjHlu9E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBovpmMVUBQbciXZN2bet5YqZnH6Mu9ljC5CJxXs
 bNMMXHOtaKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaL6ZjAAKCRDBN2bmhouD
 19vyD/43OxTm0fqNIFCUSRjy37ByLLoTcFTFSUv8i5sWNa2ArKZjpp9U3dSJNgPwrLxsxjL1Kbi
 sMEEVmWHczi12ZCGyFtAawoNpuAcbEPC6ja+erZLBSUW/hL7DILw3Jk1OVocSCNhx7AKE2fABig
 66805D6lDv80YN3NHuWMepcTMNz4E6MPkz0bIAjb7bnRbYaQEgQ9spaklgRnb+9WvKcr35MeH3U
 2OzoGvo7SBM+MDFihryIM2OHhYWDTKd8RzhH11mgNQVdxS9Hqjrvj0J+H0Hcf4omp6EkWo6unU/
 8cyzxIt9HMZFQB3fMyO8HTfLdl5zQlUjWPIfGMoCde3vhXwcAJ+4e/QAuJ4QspcGRxMvatOacrU
 pYQWycd1Xz3Dj/Q/07RR7hMNGfbR9TnFTix9pYd5x9kcyIf/If3wS3dSAw5p6UEbCX/zraOZD0H
 oCEbV4Luzz5RstNvxSrn2cX29V6O6aYtrg2kCFqFIOUQkoqrlwrIwim6Dbn5EMVeEUBjiE03HvD
 S3ejIEgFLZmYop0W5VYu8p0T9bSUCRxEjYwyCaNgIb6cw45CikOeKF+Emwp9nk6othDSlvOORvu
 QpbiXPGzAYFaSGtgmKebtIn1uiUAARBPdE+5WoOVvHs//qIs5dOrfQeYJ8THxsgJvMpmhCN/ihe gSN4lYJ58oTZ7mA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The PMK8550 RTC is always enabled in its DTSI file since
commit a791fc19965e ("arm64: dts: qcom: pmk8550: always enable RTC PMIC
device"), so drop redundant status=okay in SM8650 boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Previous patch (not really v1...):
https://lore.kernel.org/linux-arm-msm/b266b190-1c6b-4899-85bc-d3e4083410b5@linaro.org/T/#t
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 4 ----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index a00da76a6062..dd5f63ef5f67 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1050,10 +1050,6 @@ &pm8550b_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
-&pmk8550_rtc {
-	status = "okay";
-};
-
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 081b7e40f574..0c5e9c22565a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1006,10 +1006,6 @@ &pm8550b_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
-&pmk8550_rtc {
-	status = "okay";
-};
-
 &qup_i2c3_data_clk {
 	/* Use internal I2C pull-up */
 	bias-pull-up = <2200>;
-- 
2.48.1


