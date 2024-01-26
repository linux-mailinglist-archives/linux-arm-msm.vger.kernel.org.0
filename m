Return-Path: <linux-arm-msm+bounces-8414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A783D79E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 11:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40BA41C2D521
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD3928DD0;
	Fri, 26 Jan 2024 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muOFskc7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEB92557D
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 09:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706261932; cv=none; b=o76nvKqFEU9mXets+YQzBnmhiuv0e3uUwt9c4+D0hIZQACxqHvltMNB1QF6B+aCUJo9FbOZHl65OaAFI409JO2w0c5wnMAwfCDMpZlAQnak26COMfW/SWZiWRz2oz47g1up8dVUsf9U7c3cUavoRmRC2TbzC35ceI6dKaVhGpis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706261932; c=relaxed/simple;
	bh=KtJGr6r7Iu0Q0mGwGxlLRnjdV01g6H3ITCM7B23fukU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cd/3D2F+NqWZS240hrPQhNKTUFYEflXSFM+Kca6rnvApF9Sdy9Jfwm/FdXr3xz+8xmP43nKZ2Y9GB3BPhkdwV2jawRw1/TtLC/9YdVyLYMorBjIgEudHWoP+jA3xUNtvbz+OJ2KDKsDu6Tlc+saw1J8tGBS390fg9XAY920qgKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=muOFskc7; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2e0be86878so318457066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 01:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706261929; x=1706866729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2B9FN2CnnlNInecivtTmQWH1Fsiu0UjN4ZFiqgiOtE=;
        b=muOFskc7QXrW3erbzjzmHUdrHkQHCY/NJWpO9YMzXRxoVrP8tP1QaOtCWJLRfgHqCl
         UTf+6MzGnbB5Ch0lSFsx4DBYfpaC33PjNwN3rJeead6oAbG7tvMBI06rHSNz5pA6OnQQ
         kDFIW5BOaPSkgX6ZhSqFo6QAnhQgr8+vk8cMgZzuHKY6zhurTTuAjqd4Zo4OiL5fyAwm
         oVX2cV/uAxSe1YVgMxvN124yQC+50K6jRnFB519E0UJ7mryyFEY9jdTiEMgt7dDpylFm
         KYDGRE2A+uowiEXkvuXTIKbubuWPKXmSzNq99O60fZ/yfVs/ScP9E3WPG6qOWZHaBawp
         GxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706261929; x=1706866729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2B9FN2CnnlNInecivtTmQWH1Fsiu0UjN4ZFiqgiOtE=;
        b=EP4FvO7tAjV1JkcdSfY6oZggtMeVxUoHI2VzCoJ2BvjoSROa7lDV8wDGUdR4muraK6
         ZGhAok7tf4TKGVwWXyqA2Bnha01hid0CUIscJh4Q/NzAlnIcl9Bg5UJGaJtbsK6DIK4P
         YJszMZs0plVPjJAW12KwVJHyKkQwKpU5AQb0LP2eG4DMoJrSTc/y4YYOxI1XiML7clO0
         AZ3tljb1OT52Vka3PjfYant8CW9fp4NYL+2XoRbzBqqEJa7CnfA7gfD/mr8YyVnrxtLv
         RE1b0DtLMJZ+WkmYQEhvOmOetRtIuMUiVgRIujm8K6Z01+ZNIxKiG6wM/dmelz1H6V5F
         Muxg==
X-Gm-Message-State: AOJu0YyccA7eo75HT1SyshdQvtAR1LZqIw7+XKopcAa/ISfnH8Nq7Poy
	MC4ASSTDzsCUnvATxTtlza2DDefNcVawOMekcPU8T5HUeO/Vs2e4FJBtLMakQOM=
X-Google-Smtp-Source: AGHT+IESNkIAA6PDQRCEVmDi1FSV3ymbQSasxYVabwGQXHKJWaGD5hfHyG89OWiVZElOQkfc7B5k3A==
X-Received: by 2002:a17:907:8e86:b0:a31:5d3e:b659 with SMTP id tx6-20020a1709078e8600b00a315d3eb659mr923244ejc.4.1706261929193;
        Fri, 26 Jan 2024 01:38:49 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id se27-20020a170906ce5b00b00a349318ea10sm426768ejb.199.2024.01.26.01.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 01:38:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jan 2024 10:38:33 +0100
Subject: [PATCH v2 4/7] arm64: dts: qcom: sm8450: describe all PCI MSI
 interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-b4-dt-bindings-pci-qcom-split-dts-v2-4-0bb067f73adb@linaro.org>
References: <20240126-b4-dt-bindings-pci-qcom-split-dts-v2-0-0bb067f73adb@linaro.org>
In-Reply-To: <20240126-b4-dt-bindings-pci-qcom-split-dts-v2-0-0bb067f73adb@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KtJGr6r7Iu0Q0mGwGxlLRnjdV01g6H3ITCM7B23fukU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBls32d82oBFCpGjY6n3slK8jBIkoNchi/Mkk5m3
 EWJ8jrkJvKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZbN9nQAKCRDBN2bmhouD
 1xlgD/48bpydzOo8g4S05fPawBtgPtFPpx57tmcv24WXBuP2ZI7n74Lan5HpMgAFVVpMOgDErxW
 sZGw46qwj9Vp05Jq0GgG271OU6NiUXm6dJkVxEo3rAlkpUqeODJRI2B+1KNd2jXWpb3LIm1CTpv
 UcTe3M/fnntmv1m4WmHaAlX1hdmMrDLuZYKx7r+Ds4nIrNWy+1Q+ttVcBauMlzGgXxr3sTnhlqy
 ElvgB5gEn2Vk8HFPZfaaGi4Jz/+kkRG8JG8rXdjjfSj7ZLcNnUZMkB8IZq7lnBgfqPPfolRjdAV
 AuI3CfHnFw/WvBLwf+YX68w9e3d3Dgf5gbQgtd1XDxjH4DXQszuWmtukn+89r2eR8G5GImmTyYP
 Azz6KJLs2SZkdGSBdS2d6YcblvNMETCqjKsE6Gvar55QLIeV8efOBckv/oRC6owuCTMnKlCh7TM
 Gj+b2jZheTrggcM1dJe+esTHdNU491YJKOqUMKlGLgZ+i49MctvhvDFtMne+CS5jynynyn+lukj
 5XmJxJx1Mw6rxPFQw+lAGmcxgWAcJ+2/zltpZ5a/EuonTpxtsPaTlJPHh492S0HutngwtQG9b9U
 jFALuteubsrX5iwGnbygcxuGQ16Wbx006zjUfaz8PBWPevqmikKQ4JOJXVyuIoespPFTdibWgjx
 XGLfMfLj+7xUOFw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Each group of MSI interrupts is mapped to the separate host interrupt.
Describe each of interrupts in the device tree for PCIe hosts.  Only
boot tested on hardware.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 06f183ef8c78..034c57ceb0e9 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1784,8 +1784,22 @@ pcie0: pcie@1c00000 {
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
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
@@ -1893,8 +1907,22 @@ pcie1: pcie@1c08000 {
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
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */

-- 
2.34.1


