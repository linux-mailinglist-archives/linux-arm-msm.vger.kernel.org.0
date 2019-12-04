Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19A6E11375E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 23:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbfLDWAf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 17:00:35 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34989 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDWAf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 17:00:35 -0500
Received: by mail-pl1-f195.google.com with SMTP id s10so298509plp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2019 14:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7/zW2u45vXdBGhhyd50VasD+jSu1J+/W+gJD1y97ilI=;
        b=BRtmjyE4GQkhth7BhZYhigWj4jvuwBrG45DF+pXLNPlV7xv1ElJfGMdQtb0yBw9phB
         OiWhH2kxhPbJ0m+egp4kgh+AUirhxJCNbOmDPeeTgrLjThiYjrPrdDut3gZQ+vDejvym
         AQZ65V3i2wlc8uKSLl1FEOD5iHw4mGmLGTeoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7/zW2u45vXdBGhhyd50VasD+jSu1J+/W+gJD1y97ilI=;
        b=SWegmNw7gXwim1e/9ih56wg14HW06vptyfW8ofkWz03iohlUG4ZF4ziWAhS+idw4Q+
         4+w8DnAqa6Xt+S4zhNWZz/3XjMzYaG+Zk0dq7LvLSGooEfBzn/NkLhyayap8JhsvZBbS
         9b+3r2jAC6W4oC8YZWqqcbCTadwwpXiJe14mHUpRWpX9cLa11nxWxrOwOa8rNHhBl7r0
         I1s2eAnStk4e4UzHsKLDwu1bmr+NAIg8HtH1dlSBbATDXAizwfOwFQoF6T2ps0ujX82D
         i8tUZRkpf4jVq5oAE6ImchkSBSxRmYjceiaJ5oQ1k6aRsvaXVE8htyG2zb1gMWHH3u9L
         bdUg==
X-Gm-Message-State: APjAAAUuKREMWdRJnLLQHIvdDgcib8fkccR2aIieoYQRmLyIg6ItDoSa
        vU6pY80YeAdbQ9+tk18u9QvPVg==
X-Google-Smtp-Source: APXvYqzDmTznYutWMOUv7g65j6d6vHMs7falqxtIlfukVB/h2vcBIeSCC5pSC83liQ8rAppyHQ90kQ==
X-Received: by 2002:a17:902:6bc3:: with SMTP id m3mr5409493plt.185.1575496834691;
        Wed, 04 Dec 2019 14:00:34 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b7sm7493515pjo.3.2019.12.04.14.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 14:00:34 -0800 (PST)
Date:   Wed, 4 Dec 2019 14:00:33 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] arm: dts: sc7180: Add A618 gpu dt blob
Message-ID: <20191204220033.GH228856@google.com>
References: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
 <0101016ecc556508-b3be0a5f-4987-4c21-a0b4-33f380cf278b-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016ecc556508-b3be0a5f-4987-4c21-a0b4-33f380cf278b-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sharat,

on which tree is this patch based on? It does not apply against qcom/arm64-for-5.6-to-be-rebased.

In one of my repos which has a non-upstream Qualcomm tree as remote git can
make sense of the hashes in the index line, however the parent of your patch
looks quite different from the maintainer version.

Another thing that hints towards a custom tree:

> +			interconnects = <&gem_noc 35 &mc_virt 512>;

To my knowledge no patches have been posted to add the referenced interconnect
nodes for SC7180.

Please base your patches on the appropriate maintainer tree(s).

Thanks

Matthias

On Tue, Dec 03, 2019 at 03:16:18PM +0000, Sharat Masetty wrote:
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 116 +++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index c3db2e5..31223d0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -18,6 +18,8 @@
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
> +#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> 
>  / {
>  	interrupt-parent = <&intc>;
> @@ -733,6 +735,120 @@
>  			#power-domain-cells = <1>;
>  		};
> 
> +		gpu: gpu@5000000 {
> +			compatible = "qcom,adreno-618.0", "qcom,adreno";
> +			#stream-id-cells = <16>;
> +			reg = <0 0x5000000 0 0x40000>, <0 0x509e000 0 0x1000>,
> +				<0 0x5061000 0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus = <&adreno_smmu 0>;
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			interconnects = <&gem_noc 35 &mc_virt 512>;
> +
> +			qcom,gmu = <&gmu>;
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-800000000 {
> +					opp-hz = /bits/ 64 <800000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +				};
> +
> +				opp-565000000 {
> +					opp-hz = /bits/ 64 <565000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +				};
> +
> +				opp-430000000 {
> +					opp-hz = /bits/ 64 <430000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +				};
> +
> +                                opp-355000000 {
> +					opp-hz = /bits/ 64 <355000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +				};
> +
> +                                opp-267000000 {
> +					opp-hz = /bits/ 64 <267000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +				};
> +
> +				opp-180000000 {
> +					opp-hz = /bits/ 64 <180000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +			};
> +		};
> +
> +		adreno_smmu: iommu@5040000 {
> +			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
> +			reg = <0 0x5040000 0 0x10000>;
> +			#iommu-cells = <1>;
> +			#global-interrupts = <2>;
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 369 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				<&gcc GCC_GPU_CFG_AHB_CLK>,
> +				<&gcc GCC_DDRSS_GPU_AXI_CLK>;
> +
> +			clock-names = "bus", "iface", "mem_iface_clk";
> +			power-domains = <&gpucc CX_GDSC>;
> +		};
> +
> +		gmu: gmu@506a000 {
> +			compatible="qcom,adreno-gmu-618", "qcom,adreno-gmu";
> +
> +			reg = 	<0 0x506a000 0 0x31000>,
> +				<0 0xb290000 0 0x10000>,
> +				<0 0xb490000 0 0x10000>;
> +			reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				   <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +			       <&gpucc GPU_CC_CXO_CLK>,
> +			       <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +			       <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> +			clock-names = "gmu", "cxo", "axi", "memnoc";
> +
> +			power-domains = <&gpucc CX_GDSC>;
> +
> +			iommus = <&adreno_smmu 5>;
> +
> +			operating-points-v2 = <&gmu_opp_table>;
> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,sc7180-smmu-500", "arm,mmu-500";
>  			reg = <0 0x15000000 0 0x100000>;
> --
> 1.9.1
> 
