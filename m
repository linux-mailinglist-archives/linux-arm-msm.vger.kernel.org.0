Return-Path: <linux-arm-msm+bounces-27347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C37B9403EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078621F21C36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 01:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00761CD25;
	Tue, 30 Jul 2024 01:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ+19K3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C021EAFA;
	Tue, 30 Jul 2024 01:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722303537; cv=none; b=nPojaKDlObrfoWLdIC99svWME06JjC0yGwSNhE1ZsCnhmd05Yrz/dZxUCINh3N/b3r8o51ZJsy17ydLo3OYl5xvRbzFZ2xzThLHWN7b5A/6twqZd48RTe+VeSDQ4MBDFGq//Qhks4H0pyHp2EtiuxMUEXU05764crnqWN8wLB04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722303537; c=relaxed/simple;
	bh=bmAc4wlDx94SAUGUAqDDRtqrxurJdD6rBMytI3ET9HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGkBPV/Ly9TNRLSdELKl1MYKRy8sb+pjHbBQBIvp0xLq95a4I80FTuhTvS/fq/93VJ+HCT844pib05V4+9M/yrGpC/4XDLAEEG1yjYv0t/mBrpZvhl+NPUwsVLVdeH1A9LIChpyV9Q8+Jyj03Tih5WfUR1U4leCCwUE63YveqNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJ+19K3f; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7a1e0ff6871so238207485a.2;
        Mon, 29 Jul 2024 18:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722303535; x=1722908335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcPic30IlsrLE2E2uuJZidSze/wY36p/6jtRB0AARfc=;
        b=HJ+19K3fD8ulCs+5af+TZue3FbT1FPz6CEpfuYGo2JA1oP/L4tv5t6lUADo9ukp8aX
         WKc78e9j9aNIzBuL4JGqK1/T/prNCceoADfuYVpZxM/yXASoFMUozF+ZekAWQEkpHYlW
         4B4tfsYQbC78YBrlQTalpBqyaCcp77gOVUrNk32tHdcGd7Ffey6uTdw9/rZtXYIx/BQG
         AA0Z+LGojRbVK2tEXnQvQJ1pfaLgPHVa+osC0V+xPRbDTAzxUBgSRaRhbnnmBt8e8Frd
         uJEJ44zz6HOPdiZAgrK3PjHqeoU6yY57UT+YEQxXo5yxV6l3A1KFE19d6+GsQmKUh1/H
         1+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722303535; x=1722908335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcPic30IlsrLE2E2uuJZidSze/wY36p/6jtRB0AARfc=;
        b=qYNqpuJJOqK0MyRO25qHpQlXCc/+Z9arx78CGczkTyATamH7nGEInfKoCy674iymBO
         6M1hpEcXhwxKC1c4Zej80S7FmTW0ys35UbH9q8ILDLy5r0oTewC4PrsB51NFUAt9+8B2
         x7POIJMvb+wQuT1w4Ik4mWfmXkfJwIyWjx1LmnECz+JIDsT9VzViDjztHsS/R38wUEZw
         DvzGxNleqZ8pG+s8JtNrhFX09o+CeTeYXCDYQoFqRTgohXu8PcJJerI8BkypSylQHMs3
         Gb48ZPsgNMSuiiAa8DP4fauFMS/srWKxqLwJwvZiimmA0+0qEdCSy17eifk8N4x97zHQ
         lAEg==
X-Forwarded-Encrypted: i=1; AJvYcCUXgCHKjy3dijIL+67HvfEAOLWTKNetiE7WeeUhTEWmUUJ0DzCa+7A8sKXWLCSuLOy5fCuVm58K871uxAZeQBRQwWCo7m+oXdAIqlHhYqof1GlXChXmV1/OrXA++ixTaO7SNbGk33iXsSg=
X-Gm-Message-State: AOJu0Yy3sAOMJyAMnSvkmH4xeXMeoiUMJDP5mzRBkRuJxA3MuZMQ3M5W
	EtSfZ99LSXh8Bm+++e0GIu1dSrcnwFIcacmU8O9Od/XeoBvaJbgJ
X-Google-Smtp-Source: AGHT+IFCiFGgyaYg+aZRBFVpktZmuPSn3v58JTMaWyd9thWeo5Q1KPiZ8Awxc3/nQmDtBeNY+wkxgg==
X-Received: by 2002:a05:620a:45a3:b0:7a1:d335:f7a8 with SMTP id af79cd13be357-7a1e524a293mr1406329485a.15.1722303535020;
        Mon, 29 Jul 2024 18:38:55 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1f0fb33c6sm217759285a.104.2024.07.29.18.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 18:38:54 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/4] arm64: dts: qcom: sdm670: add gpu
Date: Mon, 29 Jul 2024 21:38:48 -0400
Message-ID: <20240730013844.41951-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013844.41951-6-mailingradian@gmail.com>
References: <20240730013844.41951-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Snapdragon 670 has the Adreno A615 GPU. Add it along with its device
tree dependencies.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 187c6698835d..467006ab2bcb 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+#include <dt-bindings/clock/qcom,gpucc-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -617,6 +618,11 @@ qfprom: qfprom@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			gpu_speed_bin: gpu_speed_bin@1a2 {
+				reg = <0x1a2 0x2>;
+				bits = <5 8>;
+			};
+
 			qusb2_hstx_trim: hstx-trim@1eb {
 				reg = <0x1eb 0x1>;
 				bits = <1 4>;
@@ -1299,6 +1305,168 @@ rclk-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-615.0", "qcom,adreno";
+
+			reg = <0 0x05000000 0 0x40000>, <0 0x0509e000 0 0x10>;
+			reg-names = "kgsl_3d0_reg_memory", "cx_mem";
+
+			/*
+			 * Look ma, no clocks! The GPU clocks and power are
+			 * controlled entirely by the GMU
+			 */
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+
+			interconnects = <&mem_noc MASTER_GRAPHICS_3D 0 &mem_noc SLAVE_EBI_CH0 0>;
+			interconnect-names = "gfx-mem";
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			status = "disabled";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-780000000 {
+					opp-hz = /bits/ 64 <780000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0x8>;
+				};
+
+				opp-750000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0xc>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0xc>;
+				};
+
+				opp-565000000 {
+					opp-hz = /bits/ 64 <565000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0xe>;
+				};
+
+				opp-430000000 {
+					opp-hz = /bits/ 64 <430000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0xf>;
+				};
+
+				opp-355000000 {
+					opp-hz = /bits/ 64 <355000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <6220000>;
+					opp-supported-hw = <0xf>;
+				};
+
+				opp-267000000 {
+					opp-hz = /bits/ 64 <267000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <4068000>;
+					opp-supported-hw = <0xf>;
+				};
+
+				opp-180000000 {
+					opp-hz = /bits/ 64 <180000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					opp-peak-kBps = <1804000>;
+					opp-supported-hw = <0xf>;
+				};
+			};
+		};
+
+		adreno_smmu: iommu@5040000 {
+			compatible = "qcom,sdm670-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
+			reg = <0 0x05040000 0 0x10000>;
+			#iommu-cells = <1>;
+			#global-interrupts = <2>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 369 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_CFG_AHB_CLK>;
+			clock-names = "bus", "iface";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
+		gmu: gmu@506a000 {
+			compatible = "qcom,adreno-gmu-615.0", "qcom,adreno-gmu";
+
+			reg = <0 0x0506a000 0 0x30000>,
+			      <0 0x0b280000 0 0x10000>,
+			      <0 0x0b480000 0 0x10000>;
+			reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
+			clock-names = "gmu", "cxo", "axi", "memnoc";
+
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx", "gx";
+
+			iommus = <&adreno_smmu 5>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			status = "disabled";
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+			};
+		};
+
+		gpucc: clock-controller@5090000 {
+			compatible = "qcom,sdm845-gpucc";
+			reg = <0 0x05090000 0 0x9000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+		};
+
 		usb_1_hsphy: phy@88e2000 {
 			compatible = "qcom,sdm670-qusb2-phy", "qcom,qusb2-v2-phy";
 			reg = <0 0x088e2000 0 0x400>;
-- 
2.45.2


