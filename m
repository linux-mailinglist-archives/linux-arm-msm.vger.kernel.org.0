Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3B53D4437
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jul 2021 03:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbhGXAuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 20:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233366AbhGXAuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 20:50:13 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFBCC061575
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 18:30:45 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so3836583oth.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 18:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=tjbmf6QXY2W+Nbmim38kusmymcjWfC+qA2fJ0iXz/KI=;
        b=TvMAXp3spDk29OHAgsCRBMxgaNUv7OxrmCsvfJ+ETQoSwRwlR2ZUtSUKDs8vKW9/a5
         eyNIiNN3DmeHQ4jAREQS5+IneCe1j9UcoRkzyJMkkH8llJVXTW25v4Gr7WcNIMEVPua5
         CuUBpI0pgpUfrptIpyJFOpaTyh+mPcY7LqAXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=tjbmf6QXY2W+Nbmim38kusmymcjWfC+qA2fJ0iXz/KI=;
        b=Ycpw8nCJJp767UZSLzQ6vS/s17EVhOel41dMfmh/dtX/byKlm0UMnehdN4P6sCKwzA
         X/T4PTdFoS8+gpuMPfYbcG2bk0vSLRlbwCwJI4XBCCuAhxzjZENDJDY7saG2yjJYEqfU
         4gENaMacieACSWSz/DcIN5xhWnL+hRf+ore7OCFlHeePjNxXqLMhoc2pzRqcUB3uHEmh
         5MWJJW6qSZ/U2kTgKruufqJa/M1FVed0JmAjMzC4ZvLvTe87BIWfNj+mkcZw4Fe512Rm
         JItvWUxSdKUo+5alST4SDUirUa1VRaxsSt9sq+lxy7cjcZu8jyXw2MKPavz2VFahnulU
         qPJA==
X-Gm-Message-State: AOAM533BHEwV8ON68a0I9YsBU+9/vc2tvGWxnxbLCJwvYaMTCKFry63E
        TCXIyKoFhzZpwLNw8niVueuGthkg2KAmwFEUGzI5vA==
X-Google-Smtp-Source: ABdhPJyMMeaqCnCa3wyaRvlhO9ED0pMArlJie8NNlQ/fzjJggDf1wrB8rH/daTcBCqUMYrRcXJU5OfMQ5B84Q+o0PeM=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr4898349otf.25.1627090244863;
 Fri, 23 Jul 2021 18:30:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jul 2021 18:30:44 -0700
MIME-Version: 1.0
In-Reply-To: <1627039254-13083-1-git-send-email-akhilpo@codeaurora.org>
References: <1627039254-13083-1-git-send-email-akhilpo@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 23 Jul 2021 18:30:44 -0700
Message-ID: <CAE-0n51+165pgZ5tgxmw_+7i2uYLXxAazYYkCKce0UuhfSHxbQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add gpu support
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org,
        georgi.djakov@linaro.org, robh+dt@kernel.org, robh@kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jordan@cosmicpenguin.net,
        mka@chromium.org, jonathan@marek.ca, robdclark@gmail.com,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akhil P Oommen (2021-07-23 04:20:54)
> Add the necessary dt nodes for gpu support in sc7280.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
> This patch has dependency on the GPUCC bindings patch here:
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 +++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 029723a..beb313c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -16,6 +16,8 @@
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/interconnect/qcom,sc7280.h>
> +#include <dt-bindings/clock/qcom,gpucc-sc7280.h>

Please sort this alphabetically.

>
>  / {
>         interrupt-parent = <&intc>;
> @@ -592,6 +594,111 @@
>                         qcom,bcm-voters = <&apps_bcm_voter>;
>                 };
>
> +               gpu: gpu@3d00000 {

Will this label be used? If not, please don't add it.

> +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x03d00000 0 0x40000>, <0 0x03d9e000 0 0x1000>,
> +                               <0 0x03d61000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";

I'd prefer to see one reg and reg-names per line if the list is longer
than one line.

		reg = < >,
		      < >,
		      < >;
		reg-names = " ",
		            " ",
			    " ";

It makes is much easier to figure out which property lines up with which
name.

> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       iommus = <&adreno_smmu 0 0x401>;
> +                       operating-points-v2 = <&gpu_opp_table>;
> +                       qcom,gmu = <&gmu>;
> +                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> +                       interconnect-names = "gfx-mem";
> +
> +                       gpu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-550000000 {
> +                                       opp-hz = /bits/ 64 <550000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +                                       opp-peak-kBps = <6832000>;
> +                               };
> +
> +                               opp-450000000 {
> +                                       opp-hz = /bits/ 64 <450000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +                                       opp-peak-kBps = <4068000>;
> +                               };
> +
> +                               opp-315000000 {
> +                                       opp-hz = /bits/ 64 <315000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +                                       opp-peak-kBps = <1804000>;
> +                               };
> +                       };
> +               };
> +
> +               adreno_smmu: iommu@3da0000 {

3da0000 comes after 3d69000, please sort this by unit address.

> +                       compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
> +                       reg = <0 0x03da0000 0 0x20000>;
> +                       #iommu-cells = <2>;
> +                       #global-interrupts = <2>;
> +                       interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +                                       <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> +                                       <&gpucc GPU_CC_AHB_CLK>,
> +                                       <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +                                       <&gpucc GPU_CC_CX_GMU_CLK>,
> +                                       <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +                                       <&gpucc GPU_CC_HUB_AON_CLK>;
> +                       clock-names = "gcc_gpu_memnoc_gfx_clk",
> +                                       "gcc_gpu_snoc_dvm_gfx_clk",
> +                                       "gpu_cc_ahb_clk",
> +                                       "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +                                       "gpu_cc_cx_gmu_clk",
> +                                       "gpu_cc_hub_cx_int_clk",
> +                                       "gpu_cc_hub_aon_clk";
> +
> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +               };
> +
> +               gmu: gmu@3d69000 {
> +                       compatible="qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
> +                       reg = <0 0x03d6a000 0 0x34000>,
> +                               <0 0x3de0000 0 0x10000>,
> +                               <0 0x0b290000 0 0x10000>;
> +                       reg-names = "gmu", "rscc", "gmu_pdc";
> +                       interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "hfi", "gmu";
> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +                                       <&gpucc GPU_CC_CXO_CLK>,
> +                                       <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +                                       <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +                                       <&gpucc GPU_CC_AHB_CLK>,
> +                                       <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +                                       <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> +                       clock-names = "gmu", "cxo", "axi", "memnoc", "ahb",
> +                                       "hub", "smmu_vote";

Same comment about one line per clock for clock-names so we can easily
match them up.

> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>, <&gpucc GPU_CC_GX_GDSC>;
> +                       power-domain-names = "cx", "gx";
> +                       iommus = <&adreno_smmu 5 0x400>;
> +                       operating-points-v2 = <&gmu_opp_table>;
> +
