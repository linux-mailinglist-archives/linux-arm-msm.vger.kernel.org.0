Return-Path: <linux-arm-msm+bounces-46662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E9AA24B23
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 18:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 966707A347A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 17:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F2C1CAA88;
	Sat,  1 Feb 2025 17:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yi11jmgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6EB1DA0EB
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 17:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738430966; cv=none; b=uvKvCoGkAGUI28fRGEg9/kZWKEhunnNLEciw7wbsRKVdu0r8D2nESvhjym89YS3TLL2HWUX9H1I9DnTmNHm3pSgLGGmLZJKnYnReYNVGLaSxTqBuBHX39A6TB21Nm0EeZWxfwrlRnidzeYzle4OJoIn+ZkeFD5eMbwJ1BPZwq1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738430966; c=relaxed/simple;
	bh=qi1V0XhBkBrxty8uIfZTcLxNTnebQC4tHcL8urIKw8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qsx2/1tvy3AurKRV7QzUi7rzDE1gc00R0ZeYyWMfZmg5nSd5fwdiIUZ8EQkr3aG0riPdb48hKBvxOIKkBQevFw7byDSQs9hFwVpTewfA/LkWphp78MfS6YqwyWxK6kwAUZqSvc+04H+UH5N8DsKQPU6wJoWYpFh2YDoZluRVAbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yi11jmgW; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54021daa6cbso3236958e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 09:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738430962; x=1739035762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GCW5ssE11TCosEFHQR+hT7DqL2XinuXrF8Jh/KlSvs=;
        b=yi11jmgWGmyKMCKHNZ9SUxbRm5qOvGcSM3rYt+A2VaTmaHLsoYHSRUf/+BlFC3vjBa
         69dfQB/VCZV1veJiY6hf0JhADgQnw5+rhtdVHrLEhCN1Z5ugjP7sfDQO8TxuUDjaPNmc
         yJHLdXLrnjqvNnwSOrEG67JGFhNmUtBNZuXYiA2g3FqlES/ZWK8HzdHSHDWiQEcpiU9a
         nBUij+qvgHCbvPOOT+eqLJezq0gCUP+ETXCO/Y9ti1KGd9FwvaWA8nasPGNZ+5LQupoU
         DyKyKiwcj+0kZV2co4n+Xd8DURLKN3xllYi9lor+hV7+zJIx7zj9C0WVnVVBR3kJ1YXS
         hxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738430962; x=1739035762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GCW5ssE11TCosEFHQR+hT7DqL2XinuXrF8Jh/KlSvs=;
        b=teKM02z1CnhMJNJ5QyTiccfMLfSzO8pbpvIX7cxw0xZd9ge9AAtaPrkEk2nnbBQWgI
         xLlrs1P/WF66Kq0U435CzpOJnX97GK1FOw2Y09BxLrxuxizlMN6Dq3ru0N0x2nLYUXeZ
         pR8Pu6IyZ/HqQNMBW5drRmCE1rqu5S2otW92f+xwyfn89J8ByMiH4Hp/cEeCI7Q6hY35
         mACfiqWEqYpGYl7ROrk2KoWqaH6UgflqxoFnuFzihgl78vywTHl72FAhaeCaQhb+sSbs
         cDv5brVp0b2vfZ/L32vPLfNGT57/r+MvZbDbYjUwCZAs4YzBzg3jCnNOlSXFitWoBut/
         HnYA==
X-Forwarded-Encrypted: i=1; AJvYcCUoaxHY67GfBs2Q2vLT4Blq4XgBHNuk5fSiQ8Yu325uMcw0U7ngd4aOWeP77aXvC1c8nokFjCFwp0K31AVc@vger.kernel.org
X-Gm-Message-State: AOJu0YzNU/N0QHJKQ4qYHNHwtoDIknKSeMSxsCKMjK1u2K9AHpnEsFIe
	ly0JuCGOuoepG3AcNfu3CWtI3kvRXTwZJpEFRy7cxcWbeu/E5cmuRuK5k/qonbI=
X-Gm-Gg: ASbGnctehy4hR0W+uJdUtBnOCWup/ngaLiii/2N0cHP/BkW1cgAkw4zNfmnDaMsIfN4
	DpjZPb6ojwstFD40B74NfpENWNOJkdH18NO1/XAgqV90HTgEHOqWB2v52jnw6yOHozN9HZFAb18
	XV9rTgWno5r0KDVF9X4MH0Pw9pzcCPIV1xpjirnYJti9oU0W9DvCVsPvq20IG8SZ/EMnK3uKibe
	VqdA1cl5rMCXPtvdbBN8JP8Ay/9lVpj1Q9w/ad2XQ+JCgfxeCGMb/NywPIDrvXeksZI/UmWThFH
	fI6i5hIgr8SmRO3G4x85axs=
X-Google-Smtp-Source: AGHT+IE/egWzoIxIC7qlxnnTh8Q4g8zC3DelMYJ7cykonZ2+ZVgY2BA2oCs2K5yshFXnch16WyAXZA==
X-Received: by 2002:a05:6512:e85:b0:540:2a92:7dac with SMTP id 2adb3069b0e04-543e4beab07mr5018750e87.17.1738430962039;
        Sat, 01 Feb 2025 09:29:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3099ec4sm8852161fa.48.2025.02.01.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:29:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Feb 2025 19:29:11 +0200
Subject: [PATCH v2 5/6] arm64: dts: qcom: qcm2290: add UART3 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-rb1-bt-v2-5-fd44011749bb@linaro.org>
References: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
In-Reply-To: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qi1V0XhBkBrxty8uIfZTcLxNTnebQC4tHcL8urIKw8w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnlnljG1g1TKpDVTnvix/eIIEBcKypiNk+ZVnf
 /vbU1ejDriJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ55Z5QAKCRCLPIo+Aiko
 1T8gB/0cdrpxkTHbi54eX2NzGCoWhVa+SSEGMCOLCnelL9wqbLz8NdVI9oM7ubwbisx5u9vKe1W
 DNP6kQ2CBVebRHm17Sx8xf2nIHTVmCfRLEHy/W+4yR08IK9j//zs9wsz6KVmG74ddF+BaucXVzy
 9Gz2lCwUdg0F5liudBaZHaRwSdUaBqWECDbLG2cUUCdiHK0IjSHrxAeqK9zfQNAuQL515cj9/dW
 EF8Tr6C5XRzsQIdrC+ECstBDfjfn4QqVELcSv+igTHFzx2IiqE2wtU2mQJLx2OXhLuMjJn6w5Og
 /MPtYsDNC9Y2/LYUEkDYJvYBkL8p+tDMhvVvu4RGjXAt8MfV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On QCM2290-based devices the SE3 is used for the Bluetooth chips. Add
corresponding device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 6e3e57dd02612f3568f07f1e198028413f463c69..30e9bb6c1679aab13c3f3f7f6455f2483b2ba0c5 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1239,6 +1239,21 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				status = "disabled";
 			};
 
+			uart3: serial@4a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a8c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				status = "disabled";
+			};
+
 			i2c4: i2c@4a90000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a90000 0x0 0x4000>;

-- 
2.39.5


