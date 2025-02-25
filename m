Return-Path: <linux-arm-msm+bounces-49325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E65A446B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18D4388076E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E4319755B;
	Tue, 25 Feb 2025 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mO3CW8cW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AF4166F3D;
	Tue, 25 Feb 2025 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501562; cv=none; b=dlyP9ebQgQRQ3OhrXDMKwYLFpxivXaLLhSekz4EIbUuNe3La7u+LxeO19KJpichWkaq1t0sHnpYQVp8XjZ/Dm+TJn0o19l04MkMNzyjaNNL0gw8lKk7DpVga/BuCF0eoacVtxtcsPtyrx8uyu56fDtLWEQSZ2MUqhpeV90WgEac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501562; c=relaxed/simple;
	bh=mSncGOYVSrnHdRbSNn+wvAAZg/pUMg3LzsHHzfmaPiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQQZiFGntxmyOoo0lekQayLB9vn+jg6JvC7cJ29r+A4iVpBHCY2txQXoy+h70/44YUPPOB/+zu0AY4TOvwMEDlsSTpFgcGQ+XgOGYQ8fki34hio11dtRIqtibIRqz1edp4nbF1BuKuJ3YJFtZ1IA7Nz6RRrpwjyMXhZ6u4/dXqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mO3CW8cW; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso842768166b.1;
        Tue, 25 Feb 2025 08:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501559; x=1741106359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z03vvRivxkR/OngGv1uE4riUwy9z438Ge8gHpNy4yYg=;
        b=mO3CW8cWwfyzlf/nOqxPScPEnyUuYfSZFbb11SV8SybSdEN8AHnmUj9Ck89jcix1nE
         H2sch32zx0GAeOxW9RzjAZlhdoZFdnE4GwwJrpIrSc3jhRH9hlTs+aFNV9RxtDlR/IgJ
         zFnSOZzSeQ2H2yiej9TsjS+I+xvlvb0kUfiJpTrhevDqLx4z6JsXUyS+kUlIEXW3+u/Q
         txtezJfAcLYqCNh/8iEjuooDrnucd8NkfTGIA8mYOQZf/K6gGSxj9N3OI8UcpJ/zhm/t
         hydDAPJfgwDYOiHweOJ6JwI18TaT/d/q+Nr8+JcISkTAG0OWnVtN/on+6tkPE269gX8M
         ECAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501559; x=1741106359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z03vvRivxkR/OngGv1uE4riUwy9z438Ge8gHpNy4yYg=;
        b=TGziHZsDvxgqKZJYxC8LWSNOL5265k+Jh7YDF6ovvqk9pvVyPLmkFixlBIH/rTzYRZ
         1+TTYw4V6Px+zub3amt2PADpGZ+fjJ8JQRI8xDKQ4w/JurI0Ur5RWAvKz38hchau+2OS
         Wt7zqwoCp1X26ZAfj0PGfqvJZA6Y8usoUB0zhpMJeZU+q7FVsPwU5PXio+1S46Pwuosh
         md90v7/FIuvi6jKGf6P6aZ09N+1u5eCu5z9bkVb60xZUzG0aIzTy/NxYZSc+l9W6qXTC
         XqpBEJiF43L8tbOFj1ewvSnjVdYqvFOq/oTs/ZVD38bVrwAPf+bjIgghAE8PjAPLVAQr
         6ZXg==
X-Forwarded-Encrypted: i=1; AJvYcCU6LVdU9d1v0DvWEZTGgztEvn+A2HCd1v2amBkv61fBqaUJPSR8eoAoMTQe73y5UNgnHbI/AE2n76YA@vger.kernel.org, AJvYcCUFxA2ciyknQs7UO09p5ozZJi4c2Ht6YyQXoSONs2IbYkPyqcllQ3WRSnr23NvqtBkgc6BPfn13b7ogQqY1@vger.kernel.org, AJvYcCUGIj7FJPCT/yQPknPa8ebRJ/051LGK3dMzJUQxRa0G4+SkLtl/5+WIaOXWxXYBQl2WeHs3kshyzklQZKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrunUhkC4M8bycq2bPMneUk/KAeMi3xLfLLLhcfcV5prKw8ChJ
	r8GJny4nb2vbDjK5ffD9K2VP0e1GF/ERof6rslHwTwMmaeJLgopN
X-Gm-Gg: ASbGncuC67D11UFaTQpme021Avw7blPhCBRTCpDCVJ4tKHdV4dU53HLJvFZtr46OA74
	8+MdaK4X7YlUMjzV+9On8zEAcr04lvATVA5gpy5OHzxuOMj5KenyPK5I7ha+2IwVj9YHr0l0Tjl
	I8Osf4f1m3pxElUBiRH1fux9bFIYWSrzyBtyQK57X5QOPaX7FKrjKaiVHyLPT+ptPmCY35VKvZY
	wK8lZAJ7gpFw46ykqBmkltnwiw27b1WrfMA2gV4zqoiFSnlVtoBOkV8VbXTgUiclBS5GuNZE+Vo
	BFj2qGaF38AuxTBpl1laOjDN
X-Google-Smtp-Source: AGHT+IHOBVyIzec4C2n9+JzsP2tnGOgi+Vw7KtzaC2PCAQTcaD1KK24UUewmiWR2CYfHCG8oLDZHng==
X-Received: by 2002:a17:907:7749:b0:ab7:ee47:993f with SMTP id a640c23a62f3a-abc09c26520mr1343286466b.47.1740501558787;
        Tue, 25 Feb 2025 08:39:18 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:18 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:38:52 +0300
Subject: [PATCH v9 01/12] arm64: dts: qcom: sdm845: enable gmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-1-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=5144;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=mSncGOYVSrnHdRbSNn+wvAAZg/pUMg3LzsHHzfmaPiM=;
 b=lwqfVt4MNEImmLcR2Kd6lq04E2eeepkXAi2W3oZ0r37SvsUIulwE828E6ipB6GVhLXxz4dQHP
 Ww4flKYDvQ8Dw3GeKvjIDFT3cIl8ET4+gwJvh8EJ8Hd+NoTOs6w5q/t
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
index ddb82ecb0a92..e5da58d11064 100644
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
index e0ce804bb1a3..dc939360f74c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4952,8 +4952,6 @@ gmu: gmu@506a000 {
 
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


