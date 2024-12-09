Return-Path: <linux-arm-msm+bounces-41048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E69E935D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD86A287FAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3E02248AE;
	Mon,  9 Dec 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihBmC/rV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60822371A;
	Mon,  9 Dec 2024 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746185; cv=none; b=B5mCMDaQYLYw9pJZxJQT8qEc5r7m75PZCAiu7bZaGjF2csljEE66g6bw3nP9tUqLgREjwgsofRdbu7zN2mTu9JCIm6UzjwnooVwQHABtbVId8L94q57+ezjRAkM140V8wTLixxtFIDD6EMiUFc9o+hwncS02wR8CNB5oxLQlmDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746185; c=relaxed/simple;
	bh=kROiM94VR9bhs8unDDPxON/vPAmMB0+SlnxeyQ097mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxLm7r+fkSKAh6gW96jTYnlyrxgjEJRXuiO5CT0zFs2M/7NvABzVRHATuRSw+ygJPD48gvBwAhEUKV8dsEY4eCj3tK+5HMBENX1bdDJd+mdnNoKzqC19pZ++M0i3+aWyULeULWASOPdHixUJyeufhZZlJgo7y/2WeJyS098w404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihBmC/rV; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa696d3901bso62038766b.1;
        Mon, 09 Dec 2024 04:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746181; x=1734350981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MK9kM+QUYt759u7IDiYEjfkhyjIYyif4Y9G/TxZStg=;
        b=ihBmC/rVUpaZAfgsjYzO2XTrRl8WghInj/TplsgHaELefQcPAfFC4R+GpzgsGYDvLT
         eEm3JkzwzGUZEhkLwCk9hvD3G7TOO9vpqknFftNaxs628OqtoyGlpezaEfFqr5TT5xNF
         hrtin/baT5RQo/WvMksL2xwM+x0FK6LthXtiXAGl7njYfTCMBgJjzE6wiV4U2NzWrlVQ
         5R6JQln0ZeTokgyHajKm8QQ0PxzpL/fICttgu0eUzzPUizzPpDMcy7TJZe62OZdIywtg
         Me19aNP0/KC5Z50ktF8E5ZaJbjGw4BwoIXF31RvV1JOVaF1FCp/9Z2/PeODhzKtJaQxo
         1nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746181; x=1734350981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MK9kM+QUYt759u7IDiYEjfkhyjIYyif4Y9G/TxZStg=;
        b=fO88ByzSSy9FAeK86qlw1C9WISRW7SCitxg1DWyZzAMfQTVwXn1mJ9TDf5yq/rYdHu
         4K1ko5YEGnLYTIlJ6I9tHCiDTXDDh5DQ30/sMuCkwc2Tj3L6hkF2O1FJteyEd1bLNv21
         +Ao8e/1axkw9b3FGmPYXXjqPFUn2rQHLKiIbTTnIbvWxrInBEzNumuYuHDK3HQHQYSD0
         ZIIVOcfAQaduN9jJ/ZxqCpgRKDIliTSIn5+mcmpNP8EQTtmg9GJMI63wWCE2u53eJ+ZW
         W37rDzMWQv2Xb5P6gP4I/o9XbwssagYzrqZFeM+1q76SaerFddmhaD2KY2j/5zhaLyo8
         DDZg==
X-Forwarded-Encrypted: i=1; AJvYcCVlX+HXtzcOeE/Rd9S37uYaP/2UBhxpjZ69An90hUzwFEBUhcm2muF2YHZV4H89zKLMX2rd8lfWc6bk@vger.kernel.org, AJvYcCVo8AmS+sXKCm3HCMbKYZfMl9qejYRsqEpostJLFTL/5r/bZGe17C7kL8TnBrXAeNboNW/upFaFM72VnWj4@vger.kernel.org, AJvYcCWT1vWZkDcOidX4FeTpCxLowms2jcyObbZ6XfZQn9WMwZfcyUHxjCw/994RVsQ24BWaTk2l+MSkw6l22nI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMcFYCQmUQm1pewuhtysHlJnlTnQRXKyQE3LUk56AuSLzKpG3Y
	ArHR7jflhmsnb2YPxirWhaWqsyqTXz8gA+TST6ZveSsNzkpRLqA/
X-Gm-Gg: ASbGnct7SeXdXpGD3jAjCA6RCgOKkNXvmX14gTqszAyovwUeBuzsz/BmUYY58pdjC8L
	cC4zWWgn5xBzrF1PoNpCcDwoEFTH8qRIeY8tDIswbvWCKMfbHkTxI2xgBzuLDrhn+vTR2Rc2Gpn
	/rPdv2LII+dNjFfJkuh6YFqJ3i01cqITTYFYR/FLzG/Qk5UkPaUpjlg349HD3oLIZEaqgulCMOf
	J6U1AHVPrVccixqUHoHTXwJ6RYrCGo3noj4/ZgH0wZMiTGg
X-Google-Smtp-Source: AGHT+IE7Ji3Db0kXMk+Y6enMcAaOyx5WApf21Hjn/1rp5Hk6ORd9Ta3VN/CX5fcnX8RmkBoth3Pd1w==
X-Received: by 2002:a17:907:9556:b0:aa6:7ab4:4597 with SMTP id a640c23a62f3a-aa67ab49d0amr526500066b.39.1733746181425;
        Mon, 09 Dec 2024 04:09:41 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:41 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:07 +0300
Subject: [PATCH v8 03/14] arm64: dts: qcom: sdm845: enable gmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-3-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=5144;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=kROiM94VR9bhs8unDDPxON/vPAmMB0+SlnxeyQ097mk=;
 b=XaYnjhZUhvB0sp++EhyD/Kdu0O9J/5lvX3KFZsQ20p4rVxihKM5cR1FJckFb9wpr0twqL3fB8
 zV/dAvQoTB4CzumPMNbbp3BUl21oAXB9BdAsgEP2DqQPvs3/0y04WTl
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Leave gmu enabled, because it's only probed when
GPU is.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v5:
- delete gmu node from sdm850-lenovo-yoga-c630
  (it's imported from sdm845.dtsi)
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 4 ----
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         | 2 --
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         | 4 ----
 10 files changed, 38 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 743c339ba108..b7e514f81f92 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -741,10 +741,6 @@ touchscreen@10 {
 	};
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 1cc0f571e1f7..92f8cc7e2fed 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -444,10 +444,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpi_dma0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 2391f842c903..d31efad8a321 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -414,10 +414,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 46e25c53829a..8a0f154bffc3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -345,10 +345,6 @@ &gcc {
 				<GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 486ce175e6bc..87fc4021e024 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -419,10 +419,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index b02a1dc5fecd..a3a304e1ac87 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -415,10 +415,6 @@ &gcc {
 			<GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpi_dma0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 617b17b2d7d9..f790eb73abdd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -239,10 +239,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index e386b504e978..501575c9beda 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -381,10 +381,6 @@ &gcc {
 				<GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpi_dma0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1ed794638a7c..e9d5565b52e2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4948,8 +4948,6 @@ gmu: gmu@506a000 {
 
 			operating-points-v2 = <&gmu_opp_table>;
 
-			status = "disabled";
-
 			gmu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index f18050848cd8..ca81f3664abd 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -355,10 +355,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 	zap-shader {

-- 
2.39.5


