Return-Path: <linux-arm-msm+bounces-8256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA883C33D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B6591F26A6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1943E55C31;
	Thu, 25 Jan 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eu6UsZaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882B953E2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706188002; cv=none; b=gfSNzAW8CxBcwvxyjXRJEkUoC+0QIeELyYHr7n/3dRKF5pSoYe6rCUxYpC2Z2i0t7WaGO5WEgArkPkr0dXnsv3wQCvFlVOajoxhMHNLAdDD5X01JkMRmDMM0VLxS4gv6K29+l7SK2R53pf5YVM1irXthE4AWuKy3kMK5JvQ/VrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706188002; c=relaxed/simple;
	bh=8XC8NJ2NcS8Kjm/9BPbg3ZBSERWHKQEz2mfwjSKoC/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UM0eIDn7ICAfGagV5ZTqYcejQmiPq04nQJWHySqcQIWnJ2EUGYuYhPYZ2a2/drcP0EmW2g8fewXhLnfwoaCmx+SMVFuAZeZqSoGXvfm6OUaKbqGc5behurSgNvG1THuEjug7Nd0aeFEJHfCL/cN5maudYjJ7F4LbeuxpjYVnmtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eu6UsZaW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so8275097a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706187998; x=1706792798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFG5WQb/wLFt5isMQsjJbaJFdl++eyZorkiaDRvi+/M=;
        b=eu6UsZaWWMoKIh8jKBeZ7FUvPHEcHiV8/yt9ktuCm/qaH+0l+07bylh5MmO6WC/iZ4
         orEmdDnijKnvJUHizzBB3spXgfkCyBqCKRgJ+aDW9jTRYzo0/6HVJ1Or9Mh8KExBRRIz
         4tee0xqiIyub2uYf//Zrw/daoOKaIPCW6CJajUFYLHhP90ZLxybs7ZTVcJ/HCAfZMTcw
         l+AP+f132vOb/+7rknGa4s722vN+w3FM5BGO95BcV103iAfD254PeVjyYSdiG8uyNRz5
         g3oQXhh0hxt1KClzes+HT/qLxsn8PqBmvMrN7ddkqV809IWLir1kHUHRwDazxLTQmHmH
         cYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706187998; x=1706792798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFG5WQb/wLFt5isMQsjJbaJFdl++eyZorkiaDRvi+/M=;
        b=YgsuG0BuBi1muxX+rG2+PDvG8D8UYJd3mCOe5HtUhc1Zeq8YCTNjrBiVw8lyFpM8F3
         2odvg0+R0McxI9dt93ZI8BKmXBVkLMSWETUqm7924KDbM/ZkKRxPi0VlUCIbYrxIqUUA
         U7+3Q9eMjRPa18Nml0xFvahgs6YmG2lqjyGwSXB8V96f6XhBLF7Bqai3wYmr+5FPPZy4
         RPkmEq6oYKYS1TvdAmjfXcEczIG/GQ58Y0Z2ETzn2YOex265ALYvjBX9XGie2eH47qFh
         0u8a9T8FSg06gz8oEofBAYfOa5Le9NSMRrYnXflcqWfFPCqugxkAYOxZyH1W3dlO3pYR
         sYGw==
X-Gm-Message-State: AOJu0Yzf/hS+V8+Ox6bveSCWi8dg0b7P/8CXkY+C3bRIuCXR1ZMZxQPC
	pwANvZMKXTBwqHdI4MJy5cHk2HZ6IyGMeYnXbxVHdSmuVIRal4rm5UGMGF+ghAg=
X-Google-Smtp-Source: AGHT+IE6XvYnsRe9NdOXHcH+gkynxuFp3rjAzo2eH85YohKw2h78OkbY5UTossGSMmDogXwScw88BQ==
X-Received: by 2002:aa7:c914:0:b0:55d:1774:b130 with SMTP id b20-20020aa7c914000000b0055d1774b130mr81105edt.85.1706187997820;
        Thu, 25 Jan 2024 05:06:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id ig1-20020a056402458100b0055ca5ce62ddsm1873315edb.12.2024.01.25.05.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 05:06:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/6] arm64: dts: qcom: sm8450: describe all PCI MSI interrupts
Date: Thu, 25 Jan 2024 14:06:24 +0100
Message-Id: <20240125130626.390850-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each group of MSI interrupts is mapped to the separate host interrupt.
Describe each of interrupts in the device tree for PCIe hosts.  Only
boot tested on hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 06f183ef8c78..235e31c86e38 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1784,8 +1784,16 @@ pcie0: pcie@1c00000 {
 			msi-map = <0x0 &gic_its 0x5981 0x1>,
 				  <0x100 &gic_its 0x5980 0x1>;
 			msi-map-mask = <0xff00>;
-			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0", "msi1", "msi2", "msi3",
+					  "msi4", "msi5", "msi6", "msi7";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
@@ -1893,8 +1901,16 @@ pcie1: pcie@1c08000 {
 			msi-map = <0x0 &gic_its 0x5a01 0x1>,
 				  <0x100 &gic_its 0x5a00 0x1>;
 			msi-map-mask = <0xff00>;
-			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0", "msi1", "msi2", "msi3",
+					  "msi4", "msi5", "msi6", "msi7";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-- 
2.34.1


