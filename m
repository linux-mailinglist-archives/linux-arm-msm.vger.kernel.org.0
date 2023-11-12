Return-Path: <linux-arm-msm+bounces-530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 535567E920F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Nov 2023 19:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0882F1F20FAF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Nov 2023 18:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A3E156CC;
	Sun, 12 Nov 2023 18:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPmv6CSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80966156D1
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Nov 2023 18:44:42 +0000 (UTC)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0989F478A
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Nov 2023 10:44:33 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5bf58914bacso40177827b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Nov 2023 10:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699814672; x=1700419472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kr66jRaA+T3X8byeyf1dqtY49llSG7smyrUdez14jA=;
        b=FPmv6CSZLddqkfmln/PSzoGsJUuRkBlotr5ye3Gwhcooc3g2nPm0aHQl2EAfzOiwKR
         YewrDhkmK39Kn+LEYjL5FOkQrPISwpLc/n+plIPjkixLmmUepOzR7qO3Spr6s899IYO2
         xsU5nYExeTsKfS3/eS1K5dTcC7yqRZf4dNsGnO7c5yve17yN3OzL/tPudiYeKpAL7pgP
         ItxwYvdaaO2LKExbqGMooUIrVJS+7l3RkrEOHw7p2nopa7ogHTk7yn7pyT72qLhuydTy
         JdpXvvwa8c1Wds4HJpWyvSCNoD1OfWKAi7yOu1bkNlkFCXnWLMNr0vpeVmQ4DUPcv5bA
         T8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699814672; x=1700419472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kr66jRaA+T3X8byeyf1dqtY49llSG7smyrUdez14jA=;
        b=VxW3h5b9UZyyGA1dBTKAgIeJMvsGG6jwpM7bGzjk1ZQdfwqcjxeikprgefxJFUS65R
         REkJOh+WOXcC8fvsYZOptg4wpKfCkHCSB9ma9xKM571HGHPCvEPz22gd9C6udmZuFj2R
         R7xVwM1jaIIi3KimZwy9cXKOJcFKSJfBuwYxTUHoGMCZC8R1rTf043cslj3vK/c76JaY
         8eqhdRzTBFwJSO4jcD81wmceAsWtaGWhIZgRs8MzNhKJ6XLmFypDI9U0HTmurP2zyzu+
         BGa5MBVUzcYxh/V7WQK8JEbi7rS4xBogUWxJmHpwjN+K3KqkndJP0AWpQdJyRocrHyDu
         9HXA==
X-Gm-Message-State: AOJu0YxiXgftoQbdI804DULdyfyVxEASzxgHzYiyxHJCOeD/7B7s5qBk
	kKps7ESTrWMWnJsxZrA3vLFrtg==
X-Google-Smtp-Source: AGHT+IH160CC2bbd6hb0+hWvJ93VZ56cEe9TDT3ZQ5nhYIcdUyNl/fkhWkQtGX3wRQN8SQVfEXgSjw==
X-Received: by 2002:a81:5dc4:0:b0:5a7:ba09:52c7 with SMTP id r187-20020a815dc4000000b005a7ba0952c7mr4307128ywb.11.1699814672622;
        Sun, 12 Nov 2023 10:44:32 -0800 (PST)
Received: from krzk-bin.. ([12.161.6.170])
        by smtp.gmail.com with ESMTPSA id o195-20020a0dcccc000000b005a23fc389d8sm1306263ywd.103.2023.11.12.10.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 10:44:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sc8180x: drop duplicated PCI iommus property
Date: Sun, 12 Nov 2023 19:44:30 +0100
Message-Id: <20231112184430.3495-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IOMMUs for PCI controller on SC8180x are defined in iommu-map, so
drop duplicared iommus:

  sc8180x-lenovo-flex-5g.dtb: pci@1c08000: Unevaluated properties are not allowed ('iommus' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 31c9bf85ef34..a7abf3d703af 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1736,7 +1736,6 @@ pcie0: pci@1c00000 {
 			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommus = <&apps_smmu 0x1d80 0x7f>;
 			iommu-map = <0x0   &apps_smmu 0x1d80 0x1>,
 				    <0x100 &apps_smmu 0x1d81 0x1>;
 
@@ -1833,7 +1832,6 @@ pcie3: pci@1c08000 {
 			assigned-clocks = <&gcc GCC_PCIE_3_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommus = <&apps_smmu 0x1e00 0x7f>;
 			iommu-map = <0x0   &apps_smmu 0x1e00 0x1>,
 				    <0x100 &apps_smmu 0x1e01 0x1>;
 
@@ -1931,7 +1929,6 @@ pcie1: pci@1c10000 {
 			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommus = <&apps_smmu 0x1c80 0x7f>;
 			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
 				    <0x100 &apps_smmu 0x1c81 0x1>;
 
@@ -2029,7 +2026,6 @@ pcie2: pci@1c18000 {
 			assigned-clocks = <&gcc GCC_PCIE_2_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommus = <&apps_smmu 0x1d00 0x7f>;
 			iommu-map = <0x0   &apps_smmu 0x1d00 0x1>,
 				    <0x100 &apps_smmu 0x1d01 0x1>;
 
-- 
2.34.1


