Return-Path: <linux-arm-msm+bounces-19510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A957C8C021A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 18:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D4ED284DDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DF310A28;
	Wed,  8 May 2024 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNd2ew5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E7DF6C;
	Wed,  8 May 2024 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715186117; cv=none; b=RtEg+VhGvZ2YzdrBZvA8pZiEq0Egu9/Sy66f34kKjMaq8rFN4aQOYegeGH/dcDOHQcfv/YPGoZYxDo7wdVG/JPb9hqrH4K83v8NUQEqGW8I14KFZtwO8+0eaW/MZzsP1FSlsJ1Xwm65jxWm5vSfNaAGiuyneCb2Yc6cd+W9jpww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715186117; c=relaxed/simple;
	bh=9pkXLlIZF374osaBV+eI1C7R/HMu//q75xIYUjjHffg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I/QiYTwXfKfKynndfJF/HxWBY7n/PZdbrplRi71ouhq9UMLNBVjEdoU8rdUvpy4CqZpkByrb02CFGKfgi+fNkctYz4NbOMzabYn8GHPlFOiVMZUAqi/KP4e/wDzgLCWPnN8tzSiRvW6401BwvYm/c4EO2m7WNr8XyfLH0aglfkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNd2ew5x; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59d0810f59so752360766b.0;
        Wed, 08 May 2024 09:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715186114; x=1715790914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fFoNwrz7Z2PTKzKuXP+UfswKZFc2fljpsBuXAAeuEI=;
        b=PNd2ew5x4XLfMn3cT9bkyTqS/2qj530iJmlEG68NT8W/yNIjeJLn3krHtIjhWg1+RU
         UmbuUcGpQuKm5uSMl+Z6uLo6dXBcQ6+O0+HBAS/xtIqdyMjr3hkc2sOqB8zoD5f1SUT/
         wn2JjaQn3JDS8tEEkhKeIY2kGVj1FNkDUxtCf5GzttVzZWuG2CkaRUGYXVnquArYbQ+P
         WRsQPr7qYYhdP4t78UNx1m8Zj/ktYT7h5kdfijE1BeTGViRaSjDGEWJplPbHY9INYLB/
         iooKHaHLi48bvVJzuToDXnoz8ZqO8v99P/FdJbLdEIJZNAwhVhB91ZxAeV0FLg0Ed2hI
         RHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715186114; x=1715790914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fFoNwrz7Z2PTKzKuXP+UfswKZFc2fljpsBuXAAeuEI=;
        b=QCwdlAbaXJLZqdlq2hN4jLfiErxBJbI2fydQWuhyg6zj94E8FUOmGS5x4ruHPSmD49
         eFZY66bKkvs7l6QNKaY55KmVYniELbtkR1riFIJ4hOADIfMFLOWO/6zSZzR1+kFyAhSa
         mGwkQ+FWcP7j1aDUU+uYQzFA9iiuEMOaN3BcdQOaU0F4+aCj86IWe2FCFpq6s10JdBoR
         nQ60mxy5vC9GDD6NhYEQMYSOvPO2ScmbRIAMtrIjpDtfIqFiji4rlFDDajrb61QuucW0
         ZnAq9ubL0HAtDq2ankGYSGXvd+IgqghWXA6xn516kfNMttWNlqTdgzgz1zkmDDhdrAud
         afzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVCHIDGtSecL/82mujFl401RjQ3xG2iehEU4YlaRLho6Q2ZnNaBVZjdzEvqD4oiQwYrQbzTUcaUwl8YiltBaxbaOELH54uARXrsHsyTe93GPcGtkgKzPhF12MCkEvHCkWP+VpJJdf0CzVkPcz2fSG6AGNWMcfAwjGW0hpW++PvqC+a6G+JyCI=
X-Gm-Message-State: AOJu0YyBEquiMDLWF7npFbfa3perZx5eHIKui1AmIRuSH/a/qxE5O/zO
	v5aDi02vCD4xtLYRYMfyz63tGpdzsDC2kJUsxnUEP+HZAEcSUeMKZQGYIA==
X-Google-Smtp-Source: AGHT+IGzuq7a1cQ1Ix7JB/bQ5HJdhvKU1pCTraTajir5ozwe2DcCiQkqRgB7dXSWo/xb8oEadRO6wQ==
X-Received: by 2002:a17:906:7ad7:b0:a59:a091:ec81 with SMTP id a640c23a62f3a-a59fb9423dfmr185057666b.28.1715186113974;
        Wed, 08 May 2024 09:35:13 -0700 (PDT)
Received: from localhost.localdomain (bzb212.neoplus.adsl.tpnet.pl. [83.30.47.212])
        by smtp.gmail.com with ESMTPSA id kt1-20020a170906aac100b00a52295e014bsm7820894ejb.92.2024.05.08.09.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 09:35:13 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] arm64: dts: qcom: msm8976: Add IOMMU nodes
Date: Wed,  8 May 2024 18:34:34 +0200
Message-Id: <20240508163455.8757-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240508163455.8757-1-a39.skl@gmail.com>
References: <20240508163455.8757-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the nodes describing the apps and gpu iommu and its context banks
that are found on msm8976 SoCs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 81 +++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index d2bb1ada361a..8bdcc1438177 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -808,6 +808,87 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x30000>;
 		};
 
+		apps_iommu: iommu@1ee0000 {
+			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
+			reg = <0x01ee0000 0x3000>;
+			ranges  = <0 0x01e20000 0x20000>;
+
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_CLK>;
+			clock-names = "iface", "bus";
+
+			qcom,iommu-secure-id = <17>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+
+			/* VFE */
+			iommu-ctx@15000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x15000 0x1000>;
+				qcom,ctx-asid = <20>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* VENUS NS */
+			iommu-ctx@16000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x16000 0x1000>;
+				qcom,ctx-asid = <21>;
+				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* MDP0 */
+			iommu-ctx@17000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x17000 0x1000>;
+				qcom,ctx-asid = <22>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpu_iommu: iommu@1f08000 {
+			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
+			ranges = <0 0x01f08000 0x8000>;
+
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_GFX3D_TCU_CLK>;
+			clock-names = "iface", "bus";
+
+			power-domains = <&gcc OXILI_CX_GDSC>;
+
+			qcom,iommu-secure-id = <18>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+
+			/* gfx3d user */
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x0 0x1000>;
+				qcom,ctx-asid = <0>;
+				interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* gfx3d secure */
+			iommu-ctx@1000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x1000 0x1000>;
+				qcom,ctx-asid = <2>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* gfx3d priv */
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x2000 0x1000>;
+				qcom,ctx-asid = <1>;
+				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0200f000 0x1000>,
-- 
2.44.0


