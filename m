Return-Path: <linux-arm-msm+bounces-8253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 977CD83C331
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EACD928DF3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A83450A96;
	Thu, 25 Jan 2024 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZpovvP6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA24F88E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706187996; cv=none; b=qvVGcP6uvgIoOyGuOeeVGCeGy/aDEYP9fJ/mdAPQ3zNYQuFcAEW3QLTl8eMAmjbFCPghHnwr53d9kVB0zeiAcwnKCZIrNgwTpvTIbmvNM2dTHXZAx3ySCFaQhM0gAw6UP6My7fCWmdTpXBv32xg4aSxYq9CutD3jA4OffPewjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706187996; c=relaxed/simple;
	bh=Kwqnw1X1+HMJqw8BThmuprk54/oIHYCFkejiiBpEPMM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tPabOptFuzUrrc6CbdOCjYe+qUbX+xuWD7eZGddnSRvExWZB5uEuAPZOwJwLZuh1U6KKFpglOVB88oildGfOClMlMwEuNvfXd6RJ7F7608SWFYQguI8RyJv4RWgGko0yMFzXixhTho6GclRO6qdFMOyRTnR6A4TGAp8Q1k2CjjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZpovvP6z; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55c2c90c67dso5295758a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706187992; x=1706792792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzhDowVZvLvlwXwFMgRZX8rQ6/KYq8Pb1dHzwRryNFI=;
        b=ZpovvP6zer4RRziLhPQFYvjqjqcvHfrnSvv1aXtAHbT/G/yLKFkG92uQjMOZzndekm
         CvZWgh3LeyVse0bv0PIUZz2bz/TxkoNDopeiL+Etj6r1HDcHC0yM27SHuIU2l2j4xvdo
         +eqVo22K7nfdUVY2wqI0zFSaebQ+Z/ZDobmcabCtpWfoZ75Pj9sFugBJsZOJonm7udSA
         n8pllYKPpYHJ69dItKhL1sNrepdePZYAU0n6rUhV5z/qxWqm+AF6q6YmQzaisNVQGGkS
         Puyc4qwRpHt9smi3lnvPwE+Joxq3FtW59PzzW/Vo3SlaFGafzY0NdP0pBsID9LDqQ3Bb
         xUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706187992; x=1706792792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzhDowVZvLvlwXwFMgRZX8rQ6/KYq8Pb1dHzwRryNFI=;
        b=kunr4zScprWh9deu9KwrYV5srLnhtHpxV9Mz9QgtOKZuV6qUWG8OgcvNHxIByW9Zd2
         8ywuODdoxKHGv37/O9FbkuzwFUS8LtPzDY+K3Y42+0JOrvR69Vwc/4DIGk2ZpLquvee0
         MtAYPvRZrDr82gphnwvkjNj3TFdLh2CSyLV19z7eVs3C0I7O+WwRz96vuRhihVfF45R9
         4lsnK6uhnypm3b6MG2GjM/xq4MlC0iaOjul2+HZea1a2urNI0guyKOrdW4m0hxKrwfik
         NudbMyuaAeV+EQ5DYtKCYg52uDwhbHTvFDud80pfSO9idaNnmjqTHu8lmHF7eT56pw1b
         Kajw==
X-Gm-Message-State: AOJu0YxgS614idWjUjjxuYJwbSMxs+my86UmjpYR9soKdmndlhT4RjNx
	DqMvGDI01gViRl+AuCjScEHQFpImvAsVUHkCDhkg0LL6J40TtUTm1J7As1/KlGA=
X-Google-Smtp-Source: AGHT+IFMCfTQtOehB97wWuBqnVdrymBjjeKW6Jg22SrfcSydT50nvasa9c+xe+Vm7CRqAPFt5Vnq8w==
X-Received: by 2002:a05:6402:17c9:b0:55c:8855:952f with SMTP id s9-20020a05640217c900b0055c8855952fmr516864edy.14.1706187992568;
        Thu, 25 Jan 2024 05:06:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id ig1-20020a056402458100b0055ca5ce62ddsm1873315edb.12.2024.01.25.05.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 05:06:31 -0800 (PST)
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
Subject: [PATCH 1/6] arm64: dts: qcom: sm8150: describe all PCI MSI interrupts
Date: Thu, 25 Jan 2024 14:06:21 +0100
Message-Id: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each group of MSI interrupts is mapped to the separate host interrupt.
Describe each of interrupts in the device tree for PCIe hosts.  Not
tested on hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Bindings now expect 8 interrupts:
https://lore.kernel.org/linux-devicetree/20240125-dt-bindings-pci-qcom-split-v2-0-6b58efd91a7a@linaro.org/T/#t
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 761a6757dc26..26cf8459f74f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1843,8 +1843,16 @@ pcie0: pcie@1c00000 {
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
 
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
 			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
@@ -1934,8 +1942,16 @@ pcie1: pcie@1c08000 {
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
 
-			interrupts = <GIC_SPI 307 IRQ_TYPE_EDGE_RISING>;
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
 			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-- 
2.34.1


