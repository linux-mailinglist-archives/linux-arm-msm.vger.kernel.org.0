Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA3030A5FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 11:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbhBAK6A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 05:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233465AbhBAK5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 05:57:50 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56267C061573;
        Mon,  1 Feb 2021 02:57:10 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id e15so12757875wme.0;
        Mon, 01 Feb 2021 02:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z9U5qAvLPZfBvC02hJlam9+wJ4Vyi+4HXT6Um1JeroE=;
        b=BbhNP880rpCY7Vd1Tg4OM0RIYQ55sLcQlhQugf7syGtj3D8COddXZaULz9DVclFwBq
         PFx9g20DTWK4sIkbBXSDjcuZsEf1Im7gOE75shsb+kxyYTHH1snO9UP6eikG0FtgaMLX
         FzvAOq2/PZQPWguyfxhU/9w209Dx2xwVRk6+hLms+Et/G3kJqHw/E1oti+2vV4upPBlU
         XTlIv7co05wbq43wnSTRhz1xcM3LsLTkiDZfQ7BdiFqM1jTAzZRTJtCJksr6sOAhgUhd
         UPOXLq3GgAgv1KWl27mhwXyQl07CrljKDxKSxPbAz210EoAyAdtQoBd5VYiMeLyyiZ19
         ZAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z9U5qAvLPZfBvC02hJlam9+wJ4Vyi+4HXT6Um1JeroE=;
        b=HE8QplC1UQKvuSvWVXanphmNitr6q0WxxgS2ugRmUg9oiZWvLN+qlz1DY2d/EDJ4EM
         TGqL0/XGuDZCVSSGzEx0wrZEX951Py7e+PmEZ85aNGpV72O365oWCP49X/1rrp7pyLPy
         3cNxQujCUw0DPdFHGvGmXRV0/N6opYFzAWTrdPRTKbMyhtsjazmYElOReWFuBIQS8v9L
         A5HtxrD710pbi0F98vJIZXjYA93b1Z3ZScmrQkJcMME700nPqTEo3zr0xuxLPeW/J4+X
         h7sdHgqLE+RgbNOJw1n31F9dkEi27tK/Q9xsa10wMxIOg6BRZwoE9ZF2jTwe6fN2TYbe
         jogA==
X-Gm-Message-State: AOAM533NmNM3WRqmfGm32ZsSGc4QQCZoxzwMfLJiNfpxv8Ap9K2Sh9lw
        x2cHfZC7MrRFpOTRmI0CsntEmrlJUHslzw==
X-Google-Smtp-Source: ABdhPJwSVMWdyAbw4Am5mKl1w1ea/SGNq4YfGLeZMhomQGx51lKydKSFQqLetpY4YHxg2ez3iQrnFA==
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr14839911wmh.171.1612177029114;
        Mon, 01 Feb 2021 02:57:09 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id i8sm27905794wry.90.2021.02.01.02.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 02:57:08 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v5 1/4] ARM: dts: qcom: msm8974: add gpu support
Date:   Mon,  1 Feb 2021 12:56:54 +0200
Message-Id: <20210201105657.1642825-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Brian Masney <masneyb@onstation.org>

Add support for the a3xx GPU. opp_table is chosen to include lower
frequencies common to all different msm8974 variants.

Signed-off-by: Brian Masney <masneyb@onstation.org>
[iskren.chernev@gmail.com: change after v1]
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
Update the panel/dsi patch according to new dt bindigs in
panel-v2: https://lkml.org/lkml/2021/2/1/313

v1: https://lkml.org/lkml/2020/12/30/322
v2: https://lkml.org/lkml/2021/1/24/142
v3: https://lkml.org/lkml/2021/1/25/398
v4: https://lkml.org/lkml/2021/1/28/374

Changes in v5:
- panel/dsi patch contains 2 regulators, now that the display can turn off

 arch/arm/boot/dts/qcom-msm8974.dtsi    | 43 ++++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974pro.dtsi |  5 +++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 51f5f904f9eb..c65d33591efa 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1399,6 +1399,49 @@ cnoc: interconnect@fc480000 {
 			         <&rpmcc RPM_SMD_CNOC_A_CLK>;
 		};

+		gpu: adreno@fdb00000 {
+			status = "disabled";
+
+			compatible = "qcom,adreno-330.1",
+				     "qcom,adreno";
+			reg = <0xfdb00000 0x10000>;
+			reg-names = "kgsl_3d0_reg_memory";
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+			clock-names = "core",
+				      "iface",
+				      "mem_iface";
+			clocks = <&mmcc OXILI_GFX3D_CLK>,
+				 <&mmcc OXILICX_AHB_CLK>,
+				 <&mmcc OXILICX_AXI_CLK>;
+			sram = <&gmu_sram>;
+			power-domains = <&mmcc OXILICX_GDSC>;
+			operating-points-v2 = <&gpu_opp_table>;
+
+			interconnects = <&mmssnoc MNOC_MAS_GRAPHICS_3D &bimc BIMC_SLV_EBI_CH0>,
+					<&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
+			interconnect-names = "gfx-mem",
+					     "ocmem";
+
+			// iommus = <&gpu_iommu 0>;
+
+			gpu_opp_table: opp_table {
+				compatible = "operating-points-v2";
+
+				opp-320000000 {
+					opp-hz = /bits/ 64 <320000000>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+				};
+
+				opp-27000000 {
+					opp-hz = /bits/ 64 <27000000>;
+				};
+			};
+		};
+
 		mdss: mdss@fd900000 {
 			status = "disabled";

diff --git a/arch/arm/boot/dts/qcom-msm8974pro.dtsi b/arch/arm/boot/dts/qcom-msm8974pro.dtsi
index 6740a4cb7da8..b64c28036dd0 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974pro.dtsi
@@ -14,5 +14,10 @@ sdhci@f9824900 {
 		clock-controller@fc400000 {
 				compatible = "qcom,gcc-msm8974pro";
 		};
+
+		adreno@fdb00000 {
+			compatible = "qcom,adreno-330.2",
+				     "qcom,adreno";
+		};
 	};
 };

base-commit: fd821bf0ed9a7db09d2e007df697f4d9ecfda99a
prerequisite-patch-id: b55fe8485f5dbf29159fb3130d81d93926be23d1
prerequisite-patch-id: 47e70201c831fab5fb987d9b0092ad46e1855efc
--
2.30.0

