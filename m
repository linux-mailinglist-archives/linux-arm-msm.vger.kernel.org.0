Return-Path: <linux-arm-msm+bounces-28029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C33E949A6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 23:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09F1F1F228CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 21:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90DE173345;
	Tue,  6 Aug 2024 21:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1aTFpmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0DD171E61;
	Tue,  6 Aug 2024 21:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722980711; cv=none; b=NbG/xA9IS8hCwmLvM4g/zoOnH5iSP/QGCvcKsy+qLF3MbR/XPqBSoYHSseLgYLX71KeEp9GMeh8eOUdGI69HFaoERlbVrXaUFK1WeaG0kJrfgi96yzyW0YFztVFey/stBeGmthBECZg7g3aAJo2erJhWdNYFZ8PHMRt6+RUzXXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722980711; c=relaxed/simple;
	bh=TuKksCwcL2uhtjV21dP9GF0mfFOKZ8DfEOz9z7Yryfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSaeHmOukzHixegvBFiiw/pALeGaKzWqQ+Mgb2kNXOY15emBUUue9n5saZEJ57uXWqjkkXAML0ndzSqbxtkMqMYjZEyUFgcjrpQyjgllxMZ4Lf8HKLixZrDUTcQv5nUVJ3uUBLHP73oUfxTPFdM56uguv9/M/7IlbL0BNb+R+tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1aTFpmI; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3db130a872fso669254b6e.2;
        Tue, 06 Aug 2024 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722980709; x=1723585509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSeuCMY2us9pa1SAbHTqv2Z4dVLFCX20r2NmRNPUfIc=;
        b=U1aTFpmIR38d2YX76NqXiFDj0NhgP2wz9LwbhS0r6919VOGlYXHmP0Ab8CX/k99alu
         6TG49VcQiWmhx1pjw1Tvjm79qU/YtNpDdb31aIpWORU/Iz8G8aAQn3/VCairdZgtretZ
         OlMbiyK7z6hNPPW5eNA1ssfJUKxpR0TISq9uV3CAkPn7Wozq4snF68YAcsOcgeaZC/sO
         l1RwfScWc+5BwcBf3rbVd6iM75QR8UjFobwCVIKdtb0MfNGDycbwSL6tqSO1D2IZWUU3
         NEr8UqpBbw052VkGKm21gCt4qLZFGgopgs0i+jDHKZMoCDH53jxy2jErMqF3EAqnvaNC
         Js3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722980709; x=1723585509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSeuCMY2us9pa1SAbHTqv2Z4dVLFCX20r2NmRNPUfIc=;
        b=wDao2BYkjat8lGjS2qLXGSEx2KQby89Qj2Fsil8gClb2LsT0gcaQlWkKOWUE0mXV/1
         c5dB2zExP2CC8Ek743NguGeJGZFnAeeb4jF/mzZ0EwYsnW8Jydqn+kEB00qVC+IKveyt
         Cs0nIASqOURyiv4ME2pnxxMLvcaAcX5df/eC7JDhGNFFiv8r3pvDtmftlgi1nnQYt6BL
         uOM4+/zlwNrH7ymvBpXnzCVVhXiTaYG0WTcE9pjIUcNRRR7GIgQi77YFSrjVhw5p/WpV
         B0WGF7tUrp8WxUTLka9dRiI3ZF82VlpfE2k78NdJCebDKBM19f9CXuEs8Q1HuM1OmDBw
         gdLA==
X-Forwarded-Encrypted: i=1; AJvYcCXqPlpmD5VMyZ+d4uuFj2lv3h1b23u0D/wKlPa+XTRTAr6ucwkG8I8mVUG/wWqhBXtsn3dkC/Kg37Vrg/JLtn86SAunJa91IGOwCtZf6SAkpJzFIfkTiXi2tXjvpkG/dWhnOZGNYhw9hqtaCY6O/OIKvdCNId4P7sri+mw+O/Yg3W4FX2bvyrA=
X-Gm-Message-State: AOJu0YxERV5BAlt73Kp84CDgEQifTEqJCktlB9jnsbIssVuKtUzT/6MB
	WndlxWX8jx3dRZGzY4G/MI7Oj4hywCyXfPHnUad/UZNT+PJ0YdIM
X-Google-Smtp-Source: AGHT+IHjmCaxtnKid4AHurYbomguGMwczge8XJ8F8ZPGP2TI5AE9qlYWnjEI/J8rCOpJ0CJ3kgo+sA==
X-Received: by 2002:a05:6808:199e:b0:3db:50dc:de89 with SMTP id 5614622812f47-3db5580f0dfmr20519797b6e.24.1722980708993;
        Tue, 06 Aug 2024 14:45:08 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4518a7572c3sm41048301cf.60.2024.08.06.14.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 14:45:08 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sdm670: add gpu
Date: Tue,  6 Aug 2024 17:44:57 -0400
Message-ID: <20240806214452.16406-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
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
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 180 +++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 187c6698835d..5c274a378848 100644
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
@@ -1299,6 +1305,180 @@ rclk-pins {
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
+					opp-supported-hw = <0x8>;
+				};
+
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0x4>;
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
+					opp-supported-hw = <0xc>;
+				};
+
+				opp-504000000 {
+					opp-hz = /bits/ 64 <504000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <7216000>;
+					opp-supported-hw = <0x2>;
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
2.46.0


