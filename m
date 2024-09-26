Return-Path: <linux-arm-msm+bounces-32584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B40B6987561
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 371131F2768B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DA013BC0E;
	Thu, 26 Sep 2024 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVeoHFkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9732AF1C;
	Thu, 26 Sep 2024 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360541; cv=none; b=jf40bLdaAmNMV+lgzNMIFxRF4EW1ifhJ5Jamyu5aDs1tKKfCA60FgX3MGYhtAIDaUxTkAYZI9V1u5Kx60bQJ1vl9A7nBF6GSk8lukYJT1VSM4YsOtU1aQFm6nJ5H5xn5lfZNqcZcyXgtG6JvUMs1RHXadm+ofh/9T27blEAoH+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360541; c=relaxed/simple;
	bh=/iktY1Qr4cDbg+smVKPbu2YLVIRiCzs0v9OPFLn1NXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3/9PrIWb7YcfXc/B0WzbkQTcwn0bWM9kRvBuU1tNhMqdTL96rmj8PtWYavDR9zPKC9CYfEH7VyRLO75bYmfFmgeZ6WCS9emwBJifOxb0sVOS0Vw3stO9W97onOZnRqO4Ngi4H/eght4ybA8Zo/cxz0/qVyDCpflrLWUQbgaf7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVeoHFkW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-536a2759f0eso1751494e87.3;
        Thu, 26 Sep 2024 07:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360537; x=1727965337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9H8i7ClA2yhmLwTa0npbr75xPThbyTRHnFtPQKqGaE=;
        b=gVeoHFkWFBDQcUjvlZCGgvxGHQVihMUWv/QsgQVGSJ0roqDlv9dvTuAVIwA9jzBeNF
         EloKG8gncfkmQSXn6tleudjIqGMALL7nlbhIgjOdnfaWEnhsAOqRIw8JHmAYAUm9Kf35
         Xj6zSCL0uoQv7DLYwX763H8RBrTvrHpKED1pTrxxD8uIOmaD/ryvcq5c9a8oA+M3fIHQ
         8/M5wwvXPeQejAN7YD4QGLA32O/CoFLp90k178ZHGy25U5YDU4GgbVp8utrNuP0S5yvs
         sshkE/OUUYgNh1ob22+lwB62/2GNjtYNKgegxoMshJ/AF4tIVQL//0B8Ks89FIZcTSXa
         f9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360537; x=1727965337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9H8i7ClA2yhmLwTa0npbr75xPThbyTRHnFtPQKqGaE=;
        b=jBZ4s7qVys9hh/2lfBcAsWKxyGAmYe1hmt+hPhYHFH2TsE7qtxr1W8vLsVo7hnfHPl
         Q/Z5y7Oe9AfzLaH+AMXxsh+7cKnWsTF6BadTFEvK0F0llL7yAwB7BDVvavBswZtDUJ4c
         3/bNbO4Bwb+Tv3ZKUyUEMmp6qChz3ywuDW+4yNUvkZoTvEHpUoS2bO4++IMUewL2E0Dq
         OvBvH0dZ0k8PI0RVv+da0eS4IuVo3kCtFE5f1Ld++crACRdaUFlRUdkb46r+q0MUcW/C
         +PyISsO02/jb0YHmZNhKM2rk8YIhB14sjsdkJ3fJcqq512SQB5j1pFbpu55REACgOJS0
         9AbA==
X-Forwarded-Encrypted: i=1; AJvYcCUcGTYzTpz4BM2dKmAj0LFXruA+HP2vucrJCeqSfHPKXpHZwteME30Ugz5r7QCuyuL+onMud2CEe1Sb@vger.kernel.org, AJvYcCVMV/tMfXisHGIAaKAcyLtcqbirEtrB560Z1mgsv8oOYuGKGEoGeG5bWhYAYDbEhuBJQSxySQrtMI7+0Bhr@vger.kernel.org
X-Gm-Message-State: AOJu0YxxMzzQWpT/tV50kIvm9qARSJXqOioo0EfE+hUpYSYwgdQ2eTYG
	JEiq84+hYsAZd/0nChiVUsRgrVlaox3K42IrtW6JEQBRW+C6zmgw
X-Google-Smtp-Source: AGHT+IGys/TsaHmlbV0gR+/yFy3KblVKshS5yh8AJAzMCzcwfJrPmbrK8ioskesF9VvtW/XrNWSL9g==
X-Received: by 2002:a05:6512:33d1:b0:52e:f9f1:c13a with SMTP id 2adb3069b0e04-5387048ba47mr4170843e87.12.1727360537223;
        Thu, 26 Sep 2024 07:22:17 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:16 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:01 +0300
Subject: [PATCH v5 01/12] arm64: dts: qcom: sdm845: enable gmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-1-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=5083;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=/iktY1Qr4cDbg+smVKPbu2YLVIRiCzs0v9OPFLn1NXQ=;
 b=IWVAFMWo3R2rtJmGOKj1Dz15r+dEz9o+djariTnp8LwRa19B6V4jSNJADDkBCHRVzKgc/ZmmW
 QT7/YHSxDAAAY1azlzfDPzl4+qh1hM7tuohzbNTcgNZwwL+siXzjtLi
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Leave gmu enabled, because it's only probed when
GPU is.

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
index e8276db9eabb..a5149a384167 100644
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
index 9a6d3d0c0ee4..59cb6e6e434c 100644
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
index 54077549b9da..fe154216f138 100644
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
2.39.2


