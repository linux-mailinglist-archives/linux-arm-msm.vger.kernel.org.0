Return-Path: <linux-arm-msm+bounces-70077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE47B2F16A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 917C75A5B15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939A024469B;
	Thu, 21 Aug 2025 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TlaJWLiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43681FF1B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764123; cv=none; b=oeL8XZ750Dmq9987nVxZgrqe4c12nvhpFMOIfp06eHnuEfvG2LLqOvMJWmuGuIEXFfYbZKffA8UyQ2K3gJ2PP/Ow7zf0xhKrSWsIoQUHXQWAy6SfcbzDVRoY7lTMBQ/sNHT1ko34driVd1Vo7xUiAHN/N3ViIGvMuhz9UAyPMmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764123; c=relaxed/simple;
	bh=vbt1tqWXbFfAK6B5ZYBim9Em4IvHCLkqexMFE5GgN+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R9F6zwiA61BxRbaPbToj42niP5L2Mku5hRTcIaNAFgClPkbXzKStfFaGqmTMK7t4qdQflD80WukJ6pVH+9gTTSkvpwjrYi3FHK4V64dijU8aycYdsC/46+H8z7Hmfl6NSCWC2QOgE5lPPFDXg5o7ONK1w4u3BPs6PIBIEi9bwvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TlaJWLiv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9d41bfa35so549625f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755764120; x=1756368920; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8HSFHjzyPcrkbwgrBZxmVieuYCxR5QQsHAxl0KSDro=;
        b=TlaJWLivKT5rlAmabl3+tPeLlI2c+E0+q9BDTQaPDGJYjbzmpI5RXg4BgVjbPK2W81
         Ng6nnQfv3Aa4c3CDkwAB3x5CpJILY6fviKeby3ckPxRULlGivrbGv93COZwYrEDbgzQl
         GhoB+b0+MBrEAWR1N7Ett6LUJEfhD5XtdEEuFfRD+PUUpnXkqnPu1qremdtQyALdua1q
         9L6rZxw70jCHv9zAHIY8L2/UJo3RkD65rrTKtM/zn87A3n4KwF0sqYziOYBvTklOr0JG
         TAZA5Z0f3hb2AS/0HKRDN131okuCIEPW4muiXd5+q4Y6llPgX5oOH7t4kB9gPo/kC9wd
         mbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764120; x=1756368920;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8HSFHjzyPcrkbwgrBZxmVieuYCxR5QQsHAxl0KSDro=;
        b=Ayeeos/fFrUI1st+OjIHzu/ljwfvbkeKFrssi1wbXlJknu/K7nLo6OIcbcHHXuBGy5
         RjgzArz+vnA25lM1JRroxQxF9wUZKf1rAmd0CQVlSDNvMq8gyXMKSZZwipasUuzFtBD2
         XE2AxdFIZC8qUMDcESKojtG2APZoguzSRQj2Jyt7gm/L1AS5YAS0B935mPe3Oswtw02/
         1c7lL7avyVGvG2gx/tBs58WiB3388mC8wSFBj3F3J2VrvIzEimnXALMwL4kBpowMC7zW
         7Of/gDSeeN17d+Ff+x/pJXmQzUUnBhQ8qqS3DLy9R8OvfLGeoh5JIJZGprlNbenLGr38
         8H2g==
X-Forwarded-Encrypted: i=1; AJvYcCVAkWqjhXHpoX83w7djyg/y5UyBon7p+9zkBdeMJWOED6JqvtbQCSnPnNu4Tvf4koGHuqX3bnuStp6o1Q6I@vger.kernel.org
X-Gm-Message-State: AOJu0YyA7Tapo1AFnCwr8F2GX2TyVhBzx7Vp+dQZ4XtlV76XI9LGAMZ9
	b032FidOp+96azr4eNxh5WNHJyMNnF1eWhDrhzmxz0AqGWn83KOCZj3I7eqcuoD9TSA=
X-Gm-Gg: ASbGnctVLOhWAxBIZNuRFZcdd29QWOR+j8hJgij4EFf21RVjTkZLFPXczEijqBrT+tC
	PxB9QMOIUdkfuZ2GLyqTkMAuHDSYpXA7k5XycjJCLDhYBL4H1CVNw+C8QC/aVPhpTqUPdgn/fr7
	tKSa6WoqWTrjMAEo996G11UOT90IZ8ENv7OAHxBMOejS5BbRoKw1Cc2hwrFzdXyYiCpEomTj5hT
	cSZ9v1Le0aRnCCyytHwb09St7eh01ttLVYUr9vxoOJ0PNFoTjh1BoEERXCZ4ILqthXSRHLXx7vU
	OUxeQ+p/ge2RT/3ad44WaAIEgsuGrnAydyDpnunWMjgODhWCYagF/wubGrDUtC7eUxbL4EJwLtT
	8nvpOeXig5bNNwlI6azjVh7J1CK+GhttoCcs4
X-Google-Smtp-Source: AGHT+IEfsa76mxwpI1mrE8C+XPfI0wQymO/M6OmtRNn6x49Iow6tML+yuHZ/KY6s376hy9gytb5+9g==
X-Received: by 2002:a05:6000:230b:b0:3b8:d14b:8f86 with SMTP id ffacd0b85a97d-3c49622263dmr1061603f8f.45.1755764119857;
        Thu, 21 Aug 2025 01:15:19 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:a59f:f2cf:3ca3:965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074e38d7dsm10536232f8f.26.2025.08.21.01.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:15:19 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 21 Aug 2025 10:15:09 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845: Fix slimbam num-channels/ees
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-sdm845-slimbam-channels-v1-1-498f7d46b9ee@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIzVpmgC/x2MQQqAIBAAvxJ7bkEtSfpKdLDaaiEtXIgg+nvWc
 WBmbhBKTAJtcUOik4X3mEGXBYyrjwshT5nBKGOVMxplCq62KBuHwQf8pEibYDNUqnZWN4YIcn0
 kmvn6z13/PC+fFg9eaQAAAA==
X-Change-ID: 20250821-sdm845-slimbam-channels-7b30485172ee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Reading the hardware registers of the &slimbam on RB3 reveals that the BAM
supports only 23 pipes (channels) and supports 4 EEs instead of 2. This
hasn't caused problems so far since nothing is using the extra channels,
but attempting to use them would lead to crashes.

The bam_dma driver might warn in the future if the num-channels in the DT
are wrong, so correct the properties in the DT to avoid future regressions.

Cc: stable@vger.kernel.org
Fixes: 27ca1de07dc3 ("arm64: dts: qcom: sdm845: add slimbus nodes")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 828b55cb6baf10458feae8f53c04663ef958601e..02536114edb88b86fedcc9be50c2205d2018e975 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5396,11 +5396,11 @@ slimbam: dma-controller@17184000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			qcom,controlled-remotely;
 			reg = <0 0x17184000 0 0x2a000>;
-			num-channels = <31>;
+			num-channels = <23>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			qcom,ee = <1>;
-			qcom,num-ees = <2>;
+			qcom,num-ees = <4>;
 			iommus = <&apps_smmu 0x1806 0x0>;
 		};
 

---
base-commit: 1aa50d938e88fcad1312467bd09be4037bfe68ff
change-id: 20250821-sdm845-slimbam-channels-7b30485172ee

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


