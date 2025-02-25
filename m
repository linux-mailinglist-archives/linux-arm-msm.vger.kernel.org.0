Return-Path: <linux-arm-msm+bounces-49258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FDDA43AC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE6EE1678B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3104268FCC;
	Tue, 25 Feb 2025 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eOM9LM1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D52267B9C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477570; cv=none; b=oa4Xrus6zggU0hnQl+HRtkxL4JBju8N7scSxcgbjj9tWzrk3igxXG8he973A204J+8YF1+CHwCpp0HCCtJ30b203aXjVbXojWMbPB/IwF//obCJrYGu1nxxC1Iy45tXblFXCBe3EueDA2NEbLQkWScnnGcHGWi0EpdaF0rrdk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477570; c=relaxed/simple;
	bh=upo34y44NKsvtuzn146+1YAIAifsemHshq1/RrDHbKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aXvvd55nqexR6gHAMOfDPTHh7CBUeJFuCQBHPxMZ63HCySFy5hsNVHXc+FD1y1FR20NVE62nP84+6MlwZ8m9LS2yavgThCzuYDs0Xo1yR4OxlGUnwTQKlYDj+aGermMwMek+4fh9qt83je1D0n+e5m/Ao4rDq+0bbft8tJwjLFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eOM9LM1t; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5deb440675eso963683a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477565; x=1741082365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgzyKeWgxiiZ6V72DiEJAzfgwROJRQBXnaLW9SyUmKo=;
        b=eOM9LM1tLP2NpTowWu8FHkGop05FlVMukvvtpmr7Zd3EHp7DDF/blg/m9sOz9CEb+a
         BOgGReMcRBWiqNLN0pMYgeIch0ab3Ecmt3mP9C9IWGu6evQjjCM8iRlDkxDVi21neOV1
         oQpUdCl7RV6q4Wlmvk546xMvysiRhg6A+3RE1tvoiYipo2qXPs0+637yrKnQOaSWicQw
         jvnsPsLJXTZZOL+W2n/1QxYor/vJ+RW4xK1lx0282a/hmXki42kKFiObz96zfBtJmk9z
         ZkloBV6nURcVNfI7XZse4pd+ZsxArtQUbqwWW6or2Qw6VFHG9FHa+d6mAtuYgUvnlIXI
         yh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477565; x=1741082365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgzyKeWgxiiZ6V72DiEJAzfgwROJRQBXnaLW9SyUmKo=;
        b=SA7PqZkcBCjtQ38JezljlAsAN2awwyT8WWn/svcVyhtZflAULP4IlYp4q4G/mvDTLI
         5m7iM2iVHALE4fB7JnIx3EtdarebrUstppXqu3Uxa92pD4Tc12coCBTLwd2uQTAMiRYJ
         uvnmWTgcT9pN5ZacwjAM0kcwJ+G44Q9DkTvXDxbGNKSrsHUy7xQCHbJIc90nSinnBuuI
         aDiL+JBI8FniU0uiOoXpUU62X0L7ZUbLxspnu6BpmPRDtYGLjMvUBlCyByhcn+1Bee+i
         Rs08MsVocjU4TqX58Ug+ELN/E1nI47QVxcUWWtODOeSIHK4n8I4PGG5uVYk7+iN8fDen
         S7+Q==
X-Gm-Message-State: AOJu0YzxCxAQ7y9peDdC5LUt5KNrxHXXnfIjLoQZd/2Zg9pVlPoVDw0X
	GqHa+ClE1QalscQg1EXMaKBSgg+htio+Vj9z/bk6yJqppYevy0JWvboVdB3j8Yg=
X-Gm-Gg: ASbGncuQmhW58Sgj6p/wWwZpaCeJlJxeUiS21LII9b8OUlK4s8kL8wyJCYe/vbBhZc6
	vTLsWqahRq2681fW+982fx6ndXtwdqWpZEojxhfkpO4g7qkGqtkOBdoXV2dwTR/wpPUxg4qxkm5
	HKzAL/B2cufWkGaR0t1bHkdwm3gSOIRFm8j0CCsvgzPz9oK5QBuO46Duxr0aVO+hvMTCSIOS320
	8yq0XGBYbo4PTpw5zpUX+WpiYL83m81GB30b+Z1+iKq7bKuWHFY6k5qWPDkVMBfJji6qvtBCXOI
	2HP6ZSskO+J8XBXRYV8P/YV1TbQRu6EkpICsP+AM0zvjac9I0obHviPRnLszvV3cvqTpoxAUeiH
	2
X-Google-Smtp-Source: AGHT+IFX1pNdIfxyFGjewl+6BBH+th+mRofQ84WVzFKA6iDRsGjFyeg+w5Nuwc47Eb4ucHPQuTLUFA==
X-Received: by 2002:a17:907:7f28:b0:abb:eec3:3937 with SMTP id a640c23a62f3a-abc09c0a42bmr579529166b.10.1740477565421;
        Tue, 25 Feb 2025 01:59:25 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm115164266b.56.2025.02.25.01.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:59:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:59:03 +0100
Subject: [PATCH RFC 06/13] arm64: dts: qcom: sdm845: Switch to undeprecated
 qcom,calibration-variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-dts-qcom-wifi-calibration-v1-6-347e9c72dcfc@linaro.org>
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
In-Reply-To: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=upo34y44NKsvtuzn146+1YAIAifsemHshq1/RrDHbKA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvZRsJmADsvBgTXr3/rFDYJ7e7hJRmrJE0m0Mx
 E5dLyo0EBmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72UbAAKCRDBN2bmhouD
 1+7mD/9IgeDVedemtSrlvUZIjAe6AAGLWZDnmG8QcESwcFx4p0eCSY3xJfQ+PgKDwhkERLfnabO
 FVU3Pe/yMuTAGLFeK6bddBw/783NQZ+zSmEJ4tuHkPFRGsY5OkIyNQivOqyoHR/19+tnRt1/PPx
 jgtkJqcGdjy5r9ib2hPZdJX6M7s45sEyPZtLlU13epu+QjKWKvbhSzp65wbQ8WeW+mP8lFW9mLU
 pm2GPbGRz38dit82MCPT6LJayzhoVlbQjVJizUdrPMGYGM+Cyi9K/i19ZVTPjdmr5tPe5ZlzsUM
 sAFMqeM4/z3jsaNk9tS93wHHPyQZDC30aZhea7OQv+769vS3AOzP6k+3MfAP0vfJJrxa19toU/4
 ijTvKS7vBASy0DWsEjEOhXympOli5vE9VrTciEdMe4IfIcBpBIuYY+xy+F4KBlfsvDDOZl/C5Ik
 2i8GWMgjJVqiE7AMiM5GUTVVzJuMrMN7/qyu4eGKsvnI6MaiK1cd+Z8XANrqGex56+ZpuHqTBBE
 ieE/iNrqQ2XTcAwLnOVPEOKDtJIzUxAksg/1eT79dMBxrO6V+oU4hxS15jY18WcPcoDs/rXaqyz
 nmezSkggnZjCfjZJ3xZ1vzIRzWvXPaF8tkLaMtNTlvfM5cmY94pC6aL5hlQkJe4ZbO2n6WCmUpW
 sk+iKYffeSWqcpw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The property qcom,ath10k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 1cc0f571e1f7f3023efa08adf2791ffce5f2fecf..89ce3f6436076e34e03e04ac41c6be520aefaca4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1166,7 +1166,7 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
-	qcom,ath10k-calibration-variant = "Thundercomm_DB845C";
+	qcom,calibration-variant = "Thundercomm_DB845C";
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 2391f842c9038a3030511a1c9c8edd31bbacf2b0..aa482e8fd9e2a85489d0ae34d3ec91286e6f07b1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -789,7 +789,7 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
-	qcom,ath10k-calibration-variant = "Qualcomm_sdm845mtp";
+	qcom,calibration-variant = "Qualcomm_sdm845mtp";
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index f18050848cd8892666015c8182971ff0567747b7..bf45511b24b37f0df24e15e540cfc69831cccdc7 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -910,7 +910,7 @@ &wifi {
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
-	qcom,ath10k-calibration-variant = "Lenovo_C630";
+	qcom,calibration-variant = "Lenovo_C630";
 };
 
 &crypto {

-- 
2.43.0


