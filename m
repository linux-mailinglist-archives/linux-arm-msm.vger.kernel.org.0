Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35E96507BBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 23:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346674AbiDSVOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 17:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348678AbiDSVOO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 17:14:14 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762AD2715E
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:11:30 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id x22-20020a4aca96000000b00338fbaf797bso1982861ooq.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=arS75fHarK9gRXX0qjius3GMKBHeJXmRMqnOcy+DoPw=;
        b=q4oeaHuO9Tbd6E2Ye6Rs5wrfSK8bM47JA2PIKjWjAzB2mD0kxpP6G06zTFbjUhap8z
         rWnErbP8S2n6VWulMTdOl7fskjTjsejo0SQ/a/5qiPjpIpIbSNd7ExMb9LWWHelS9SdI
         LOY+x5n1lt/cFjJhH4BGVhGcKuVadKDXQIHTMcq7iNhxgbQnrpH9hduCbsBRWjDVeCkT
         HueBGoaRRhT73ux/qvMT3mLUhHWg5u2Zkz5pXUzP6qcvlbbEmpSsCGkBMAxEkAP4tOrp
         Ob0xFBpAEVlh0SRy2R6DCMuVLzAWJVqJzIV0UGdJ15A3gwcOKdxfCaiB+DkTNdm/cTfS
         CycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=arS75fHarK9gRXX0qjius3GMKBHeJXmRMqnOcy+DoPw=;
        b=vOt7Zq+WfePd7+x/yHUd0lftcGnKWghIIqkDDxcebCnO2Y4g1G/DUsiWOg4oAZ5Ajd
         LPwoOUPk672LVXkKajYCIsiyXGkwamRuxlTNYJBGjyTmbfMt9jCEBfRmLUHarwaKcqRX
         cQBv0fjLU6v/QDiW8erVLpDA5265OmsgN7OhCmzcIfXSeZGpE1O5VBGhlHAwlvCmvIvO
         4jCEG27o1/6RBc68aEYABOcX9Sr0M4r6sOU/FU9POtBrYdkkq2MGb/jtq3nihtmy7u0C
         uJInGks8jGFm9t27BN8YVFK60QkahmF7KXHE3cOAlQNehG58BSuZ0CYzYJRo+qOvc2Di
         ay2g==
X-Gm-Message-State: AOAM532dlsxm6DdH7qE2LVCbqGp3bGTSZgjvEkfAHdJNYlZctN1M2A7l
        rFtHuOunbffD9nsuiOdRxaLckg==
X-Google-Smtp-Source: ABdhPJzMcvlthISyTsa5FUGxoMjl/hvRPMSXfQRtIiGQJALLpGklAsBW5H2PLvezm18Jjb+o/6awCg==
X-Received: by 2002:a4a:ac01:0:b0:324:910a:5d04 with SMTP id p1-20020a4aac01000000b00324910a5d04mr6068938oon.87.1650402689662;
        Tue, 19 Apr 2022 14:11:29 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id hl26-20020a0568701b1a00b000e2ff513be1sm5412871oab.55.2022.04.19.14.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 14:11:29 -0700 (PDT)
Date:   Tue, 19 Apr 2022 16:11:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
Message-ID: <Yl8lf6/eQ1hrcIKd@builder.lan>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Apr 20:09 CDT 2022, Bryan O'Donoghue wrote:

> Add msm8939 a derivative SoC of msm8916. This SoC contains a number of key
> differences to msm8916.
> 

Thanks for posting this Bryan, happy to see this being moved upstream,
despite the PSCI shortcomings.

> - big.LITTLE Octa Core - quad 1.5GHz + quad 1.0GHz
> - DRAM 1x800 LPDDR3
> - Camera 4+4 lane CSI
> - Venus @ 1080p60 HEVC
> - DSI x 2
> - Adreno A405
> - WiFi wcn3660/wcn3680b 802.11ac
> 
> Co-developed-by: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Co-developed-by: Jun Nie <jun.nie@linaro.org>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Co-developed-by: Benjamin Li <benl@squareup.com>
> Signed-off-by: Benjamin Li <benl@squareup.com>
> Co-developed-by: James Willcox <jwillcox@squareup.com>
> Signed-off-by: James Willcox <jwillcox@squareup.com>
> Co-developed-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Co-developed-by: Joseph Gates <jgates@squareup.com>
> Signed-off-by: Joseph Gates <jgates@squareup.com>
> Co-developed-by: Max Chen <mchen@squareup.com>
> Signed-off-by: Max Chen <mchen@squareup.com>
> Co-developed-by: Zac Crosby <zac@squareup.com>
> Signed-off-by: Zac Crosby <zac@squareup.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 2017 +++++++++++++++++++++++++
>  1 file changed, 2017 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> new file mode 100644
> index 000000000000..f1aa79b7d0e9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -0,0 +1,2017 @@
> +// SPDX-License-Identifier: BSD-3-Clause

Nice

> +/*
> + * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020-2022, Linaro Limited
> + *

The reminder of this comment denotes that the file is licensed under
GPL, which should be covered by the SPDX license, but is now in conflict
with it...

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <dt-bindings/interconnect/qcom,msm8939.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-msm8939.h>
> +#include <dt-bindings/reset/qcom,gcc-msm8939.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. MSM8939";
> +	compatible = "qcom,msm8939";

It's expected that the board dts will specify both model and
compatible, so these should always be overridden and as such can be
omitted from the dtsi.

> +	qcom,msm-id = <239 0>, <239 0x30000>, <241 0x30000>, <263 0x30000>;
> +
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;

Why are these 2 when /soc uses 1?

> +
> +	memory {

Please do keep nodes sorted, primarily by address, then alphabetically.

> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the reg */
> +		reg = <0 0 0 0>;
> +	};
[..]
> +	cci_opp_table: cci-opp-table {

I don't see a reference to this, please introduce it together with the
consumer node. And as with the &gpu_opp_table below.

> +		compatible = "operating-points-v2";
> +
> +		opp-200000000 {
> +			opp-hz = /bits/ 64 <200000000>;
> +		};
> +
> +		opp-297600000 {
> +			opp-hz = /bits/ 64 <297600000>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +		};
> +
> +		opp-595200000 {
> +			opp-hz = /bits/ 64 <595200000>;
> +		};
> +	};
> +
> +	gpu_opp_table: gpu-opp-table {

&gpu_opp_table is tied to the gpu node, so it can with favor be moved
into the gpu node itself - and can then be named simply "opp-table".

> +		compatible = "operating-points-v2";
> +
> +		opp-550000000 {
> +			opp-hz = /bits/ 64 <550000000>;
> +		};
> +
> +		opp-465000000 {
> +			opp-hz = /bits/ 64 <465000000>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +		};
> +
> +		opp-220000000 {
> +			opp-hz = /bits/ 64 <220000000>;
> +		};
> +
> +		opp-19200000 {
> +			opp-hz = /bits/ 64 <19200000>;
> +		};
> +	};
[..]
> +	clocks {
> +		xo_board: xo_board {

No underscores in node names. If you still rely on string based
parent_names in the clock drivers add a clock-output-names property to
make the name "xo_board".

But preferably you'd switch to use parent_data and fw_name based clock
parent lookup in the clock drivers.

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +		};
> +
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +		};
> +	};
> +
> +	smem {

Per the binding you may now add the additional properties to &smem_mem
and avoid having this intermediate node connecting the various smem
pieces together.

> +		compatible = "qcom,smem";
> +
> +		memory-region = <&smem_mem>;
> +		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +
> +		hwlocks = <&tcsr_mutex 3>;
> +	};
> +
> +	firmware {
> +		scm: scm {
> +			compatible = "qcom,scm";
> +			clocks = <&gcc GCC_CRYPTO_CLK>,
> +				 <&gcc GCC_CRYPTO_AXI_CLK>,
> +				 <&gcc GCC_CRYPTO_AHB_CLK>;
> +			clock-names = "core", "bus", "iface";
> +			#reset-cells = <1>;
> +
> +			qcom,dload-mode = <&tcsr 0x6100>;
> +		};
> +	};
> +
> +	soc: soc {

This should be soc@0

> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;
> +		compatible = "simple-bus";
> +
> +		qfprom_cpr: qfprom_cpr@58000 {

0x58000 is the raw qfprom interface, while the CRC corrected values are
available at 0x5c000. As such, you should quite likely move the cell
definitions to &qfprom and drop this node.

No underscores in node names.

> +			compatible = "qcom,qfprom";
> +			reg = <0x00058000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			cpr_efuse_init_voltage1: ivoltage1@dc {
> +				reg = <0xdc 0x4>;
> +				bits = <4 6>;
> +			};
> +			cpr_efuse_init_voltage2: ivoltage2@da {
> +				reg = <0xda 0x4>;
> +				bits = <2 6>;
> +			};
> +			cpr_efuse_init_voltage3: ivoltage3@d8 {
> +				reg = <0xd8 0x4>;
> +				bits = <0 6>;
> +			};
> +			cpr_efuse_quot1: quot1@dc {
> +				reg = <0xdd 0x8>;
> +				bits = <2 12>;
> +			};
> +			cpr_efuse_quot2: quot2@da {
> +				reg = <0xdb 0x8>;
> +				bits = <0x0 12>;
> +			};
> +			cpr_efuse_quot3: quot3@d8 {
> +				reg = <0xd8 0x8>;
> +				bits = <6 12>;
> +			};
> +			cpr_efuse_ring1: ring1@de {
> +				reg = <0xde 0x4>;
> +				bits = <6 3>;
> +			};
> +			cpr_efuse_ring2: ring2@de {
> +				reg = <0xde 0x4>;
> +				bits = <6 3>;
> +			};
> +			cpr_efuse_ring3: ring3@de {
> +				reg = <0xde 0x4>;
> +				bits = <6 3>;
> +			};
> +			cpr_efuse_revision: revision@4 {
> +				reg = <0x5 0x1>;
> +				bits = <5 1>;
> +			};
> +			cpr_efuse_revision_high: revision_high@4 {
> +				reg = <0x7 0x1>;
> +				bits = <0 1>;
> +			};
> +			cpr_efuse_pvs_version: pvs@4 {
> +				reg = <0x3 0x1>;
> +				bits = <5 1>;
> +			};
> +			cpr_efuse_pvs_version_high: pvs_high@4 {
> +				reg = <0x6 0x1>;
> +				bits = <2 2>;
> +			};
> +			cpr_efuse_speedbin: speedbin@c {
> +				reg = <0xc 0x1>;
> +				bits = <2 3>;
> +			};
> +
> +		};
> +
> +		acc0: clock-controller@b088000 {
> +			compatible = "qcom,kpss-acc-v2";
> +			reg = <0xb088000 0x1000>;

If you pad all addresses to 8 digits it's much faster so see if the
nodes are sorted.

And please sort the nodes by address.

> +		};
> +
[..]
> +		tcsr_mutex: hwlock {
> +			compatible = "qcom,tcsr-mutex";

Without a reg this should live outside /soc, but in order to avoid the
dummy tcsr-mutex node just pointing to a nameless syscon the binding has
been changed such that you should move the compatible and #hwlock-cells
to &tcsr_mutex_regs directly.

> +			syscon = <&tcsr_mutex_regs 0 0x1000>;
> +			#hwlock-cells = <1>;
> +		};
> +
> +		rpm_msg_ram: memory@60000 {
> +			compatible = "qcom,rpm-msg-ram";
> +			reg = <0x60000 0x8000>;
> +		};
[..]
> +
> +		lpass: lpass@7708000 {
> +			status = "disabled";

Please move status last in this node.

> +			compatible = "qcom,apq8016-lpass-cpu";
> +			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
> +				 <&gcc GCC_ULTAUDIO_PCNOC_MPORT_CLK>,
> +				 <&gcc GCC_ULTAUDIO_PCNOC_SWAY_CLK>,
> +				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
> +				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
> +				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
> +				 <&gcc GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK>;
> +
> +			clock-names = "ahbix-clk",
> +					"pcnoc-mport-clk",
> +					"pcnoc-sway-clk",
> +					"mi2s-bit-clk0",
> +					"mi2s-bit-clk1",
> +					"mi2s-bit-clk2",
> +					"mi2s-bit-clk3";
> +			#sound-dai-cells = <1>;
> +
> +			interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "lpass-irq-lpaif";
> +			reg = <0x07708000 0x10000>;
> +			reg-names = "lpass-lpaif";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
[..]
> +		apps_iommu: iommu@1ef0000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			#iommu-cells = <1>;

Please start with compatible, reg, clocks etc used by the node. Then
properties related to what's exposed, followed by the subnodes.

> +			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
> +			ranges = <0 0x1e20000 0x40000>;
> +			reg = <0x1ef0000 0x3000>;
> +			clocks = <&gcc GCC_SMMU_CFG_CLK>,
> +				 <&gcc GCC_APSS_TCU_CLK>;
> +			clock-names = "iface", "bus";
> +			qcom,iommu-secure-id = <17>;
> +
> +			/* mdp_0: */
> +			iommu-ctx@4000 {
> +				compatible = "qcom,msm-iommu-v1-ns";
> +				reg = <0x4000 0x1000>;
> +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			/* venus_ns: */
> +			iommu-ctx@5000 {
> +				compatible = "qcom,msm-iommu-v1-sec";
> +				reg = <0x5000 0x1000>;
> +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		gpu_iommu: iommu@1f08000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			#iommu-cells = <1>;
> +			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
> +			ranges = <0 0x1f08000 0x10000>;
> +			clocks = <&gcc GCC_SMMU_CFG_CLK>,
> +				 <&gcc GCC_GFX_TCU_CLK>,
> +				 <&gcc GCC_GFX_TBU_CLK>;
> +			clock-names = "iface", "bus", "tlb";
> +			qcom,iommu-secure-id = <18>;
> +
> +			/* gfx3d_user: */
> +			iommu-ctx@1000 {
> +				compatible = "qcom,msm-iommu-v1-ns";
> +				reg = <0x1000 0x1000>;
> +				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			/* gfx3d_priv: */
> +			iommu-ctx@2000 {
> +				compatible = "qcom,msm-iommu-v1-ns";
> +				reg = <0x2000 0x1000>;
> +				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		gpu@1c00000 {
> +			compatible = "qcom,adreno-405.0", "qcom,adreno";
> +			reg = <0x01c00000 0x10000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "kgsl_3d0_irq";
> +			clock-names =

Please line break after the first entry, rather than before. Then indent
to match that.

> +			    "core",
> +			    "iface",
> +			    "mem",
> +			    "mem_iface",
> +			    "alt_mem_iface",
> +			    "gfx3d",
> +			    "rbbmtimer";
> +			clocks =
> +			    <&gcc GCC_OXILI_GFX3D_CLK>,
> +			    <&gcc GCC_OXILI_AHB_CLK>,
> +			    <&gcc GCC_OXILI_GMEM_CLK>,
> +			    <&gcc GCC_BIMC_GFX_CLK>,
> +			    <&gcc GCC_BIMC_GPU_CLK>,
> +			    <&gcc GFX3D_CLK_SRC>,
> +			    <&gcc GCC_OXILI_TIMER_CLK>;
> +			power-domains = <&gcc OXILI_GDSC>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
> +		};
> +
> +		mdss: mdss@1a00000 {
> +			compatible = "qcom,mdss";
> +			reg = <0x1a00000 0x1000>,
> +			      <0x1ac8000 0x3000>;
> +			reg-names = "mdss_phys", "vbif_phys";
> +
> +			power-domains = <&gcc MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>;
> +			clock-names = "iface",
> +				      "bus",
> +				      "vsync";
> +
> +			interrupts = <0 72 IRQ_TYPE_LEVEL_HIGH>;

s/0/GIT_SPI/

> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			mdp: mdp@1a01000 {

If you label this mdss_mdp: instead the nodes would group nicely in the
board dts as references there should be sorted by label.

> +				compatible = "qcom,mdp5";
> +				reg = <0x1a01000 0x89000>;
> +				reg-names = "mdp_phys";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0 0>;

&mdss is #interrupt-cells = <1>, so the second 0 should go.

> +
> +				clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_VSYNC_CLK>,
> +					 <&gcc GCC_MDP_TBU_CLK>,
> +					 <&gcc GCC_MDP_RT_TBU_CLK>;
> +				clock-names = "iface",
> +					      "bus",
> +					      "core",
> +					      "vsync",
> +					      "tbu",
> +					      "tbu_rt";
> +
> +				iommus = <&apps_iommu 4>;
> +
> +				interconnects = <&snoc_mm MASTER_MDP_PORT0 &bimc SLAVE_EBI_CH0>,
> +						<&snoc_mm MASTER_MDP_PORT1 &bimc SLAVE_EBI_CH0>;
> +				interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdp5_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdp5_intf2_out: endpoint {
> +							remote-endpoint = <&dsi1_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0: dsi@1a98000 {

As above, mdss_dsi0:

> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0x1a98000 0x25c>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4 0>;

Same as &mdp.

> +
> +				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
> +						  <&gcc PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi0_phy 0>,
> +							 <&dsi0_phy 1>;
> +
> +				clocks = <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_BYTE0_CLK>,
> +					 <&gcc GCC_MDSS_PCLK0_CLK>,
> +					 <&gcc GCC_MDSS_ESC0_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core";
> +				phys = <&dsi0_phy>;
> +				phy-names = "dsi-phy";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {
> +							remote-endpoint = <&mdp5_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi1: dsi@1aa0000 {

mdss_dsi1:

> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0x1aa0000 0x25c>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <5 0>;
> +
> +				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
> +						  <&gcc PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&dsi1_phy 0>,
> +							 <&dsi1_phy 1>;
> +
[..]
> +
> +		hexagon@4080000 {

This is disabled but doesn't have a label.

remoteproc_mss: remoteproc@4080000

seems reasonable.

> +			compatible = "qcom,q6v5-pil";
> +			reg = <0x04080000 0x100>,
> +			      <0x04020000 0x040>;
> +
> +			reg-names = "qdsp6", "rmb";
> +
[..]
> +
> +		pronto: wcnss@a204000 {

remoteproc_pronto: remoteproc@a204000

> +			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
> +			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
> +			reg-names = "ccu", "dxe", "pmu";
> +
> +			memory-region = <&wcnss_mem>;
[..]
> +
> +#include "msm8916-pins.dtsi"

I thought we got rid of the separate *-pins.dtsi file. I'm also worried
about sharing this between 8916 and 8939. Can you please inline this in
line with one of the newer platform.

Regards,
Bjorn
