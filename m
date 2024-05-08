Return-Path: <linux-arm-msm+bounces-19512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2A8C0220
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 18:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDCC6285C4E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D356512EBE7;
	Wed,  8 May 2024 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQadb/+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACB612F386;
	Wed,  8 May 2024 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715186121; cv=none; b=sst3Cy8ourKQFpanBRWSV5p61EEJiRON3T3Qjm9wFXFsaplCd20Y+pPhz2NQFNRWkPG6DxOGmpNbD13j+7hYtrRKFCjF2JTEDY99gjX8Aht6L3Rr9ZGDn+OO5dSxNdfBqgR7QD0pUkPZe4ToZk6O8fsoh2TfNAPt4zk2YoVNf5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715186121; c=relaxed/simple;
	bh=UgSJ0hu7n5ThTA0vRJasA6soU9jLlTRb0a1C5EgH3fM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XPop6bOb0RWRVXYRe3dLW9YAapS6jty99wqPVVxcCLlpwBbdMadVnxoPe9HXXtvySl+hgfDzfy1nrX4gn4/L5F10pTgSuzWxZOOibBTNswMM/1PZ3hH8lL5H8ncOOzTBD+xfo6/9VV7ANVQu0q9ewPSh6v+27e6Wjd+2Mvc9Pvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQadb/+x; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59cdf7cd78so955769666b.0;
        Wed, 08 May 2024 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715186118; x=1715790918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmZygw2TRlqAhmQ39OrC9cxHMK6KlC1+WpOuGC2rL+A=;
        b=JQadb/+xKyJ/DyDkHfsjmHMz8c+pP58dkE9XCCXWMYi0lvBcP+15fIDwBBcDLnw8BU
         8oquq2qufmTnoH+bkdrZ71JBbmU6We8SCNRWdSKd+WuZQqMLVlObVs1q3yx8oxyjjx6Q
         rto2GLtCBrM9755OJobGj+gfbd3FqPPMFdFmBwmYra7qN1vIBvzb679llIINqsOKsNar
         5PezqWgbwF2Ppub/85A37OrWEgczgr+w6s3YKeoPl33ESUYMFFrEL9DRswmpiYwssjbE
         yi/1js+bYIjZ2JrHem5gSNBL/AI0VxoFitahXCh61ndWTNZ4oL7wCGiaSRAAN9A6ApB2
         wr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715186118; x=1715790918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmZygw2TRlqAhmQ39OrC9cxHMK6KlC1+WpOuGC2rL+A=;
        b=JhTy4SKh4oclt1XOvkxgzjn1pqCDAMqS5nfKAmnuoxkwMIH8AWaSDQCS0iPb3klvF7
         hjQffSJ4QhoLVqIp4a/2w7WWMbk54ThagWDh2W5QRIMAnkvlbvwMWYTGjd9/aszcVBc/
         O+r9CUgZdqa/2wyKHY5DmhETQrnP+kvPDUT4VEyZmV6PFqhDN6jmaTDiFBrZofbbC0aP
         /pBuR47wLO9K1koa2f0r+vhWyPtbx2pyBAZhhQ1AQA5h7UQtHhGgFisIqbgelnxBHw0w
         YsicP9bii6AHzg2yWWCwJSpP+6PDAWj1N7eJdMyEOgyowX4WIYR0NjuhqioD0Ixyb8AR
         3kzg==
X-Forwarded-Encrypted: i=1; AJvYcCXGjgW/gddCQPlzZmn1kWyZ5yQugp55guhlpsmV2E0aXUsWLOCc8/qP/GQzjn53Z9sUlgfrPYCPxJobAx4Ps1rpdrKzOrJJW/xo4jbiTO5O2AoA/5p47Tb1cD6Q6pvigPvDQnYTWslEGsq4HEsOCEkyRZTMSdWlSeGE44MJjQEeQSK05StN7Z0=
X-Gm-Message-State: AOJu0Yxl1zD2LRn8dmnG6qbcz6s7YjVBJqRT48A/EPW0G1KgW4zNuvDk
	ArXq23Sqeu8E+W0gEb9d5/IwhCMbxcLJ4jKE55ezFu2yt8l16MmKR4FQ1ikg
X-Google-Smtp-Source: AGHT+IEKI79+iBlRSZCl0F+sUCkvGoN0/frog40RdlmvwZ4O2GLI20/Sj/Z02aHEHRBlBbhTN8i+bg==
X-Received: by 2002:a17:906:6994:b0:a59:9b75:b90 with SMTP id a640c23a62f3a-a59fb948fb3mr187372566b.2.1715186117979;
        Wed, 08 May 2024 09:35:17 -0700 (PDT)
Received: from localhost.localdomain (bzb212.neoplus.adsl.tpnet.pl. [83.30.47.212])
        by smtp.gmail.com with ESMTPSA id kt1-20020a170906aac100b00a52295e014bsm7820894ejb.92.2024.05.08.09.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 09:35:17 -0700 (PDT)
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
Subject: [PATCH v4 3/4] arm64: dts: qcom: msm8976: Add Adreno GPU
Date: Wed,  8 May 2024 18:34:36 +0200
Message-Id: <20240508163455.8757-4-a39.skl@gmail.com>
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

Add Adreno GPU node.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 71 +++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index b26c35796928..22a6a09a904d 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1080,6 +1080,77 @@ mdss_dsi1_phy: phy@1a96a00 {
 			};
 		};
 
+		adreno_gpu: gpu@1c00000 {
+			compatible = "qcom,adreno-510.0", "qcom,adreno";
+
+			reg = <0x01c00000 0x40000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+
+			clocks = <&gcc GCC_GFX3D_OXILI_CLK>,
+				 <&gcc GCC_GFX3D_OXILI_AHB_CLK>,
+				 <&gcc GCC_GFX3D_OXILI_GMEM_CLK>,
+				 <&gcc GCC_GFX3D_BIMC_CLK>,
+				 <&gcc GCC_GFX3D_OXILI_TIMER_CLK>,
+				 <&gcc GCC_GFX3D_OXILI_AON_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "mem",
+				      "mem_iface",
+				      "rbbmtimer",
+				      "alwayson";
+
+			power-domains = <&gcc OXILI_GX_GDSC>;
+
+			iommus = <&gpu_iommu 0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			status = "disabled";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-540000000 {
+					opp-hz = /bits/ 64 <540000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					opp-supported-hw = <0xff>;
+				};
+			};
+		};
+
 		apps_iommu: iommu@1ee0000 {
 			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
 			reg = <0x01ee0000 0x3000>;
-- 
2.44.0


