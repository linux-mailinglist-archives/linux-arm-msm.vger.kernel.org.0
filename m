Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C5B3D6AED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 02:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbhGZXgQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 19:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbhGZXgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 19:36:15 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC101C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 17:16:42 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 19-20020a9d08930000b02904b98d90c82cso11779084otf.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 17:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=tscrZBQstzzRaUL+UaPR6i4OEaBy+HrQhXGyWhtHbpY=;
        b=I0bCa3Idkeu+p5K2AETrjGGnbJVU0B3Kdkogh8ZnX/Pg35bJ5u63zp1PpsZR4PUA71
         pJvXM4Jz0xpHXLWmGg5smlJmSgXTQ1IRM4qgno2YoYyOBJ3LpB2LlPz6s+v/qRrjOvKD
         hKDJtkmccFTnmNWnT0gIloYTbnGn5VN8AvSdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=tscrZBQstzzRaUL+UaPR6i4OEaBy+HrQhXGyWhtHbpY=;
        b=MQ2vEbFtj7vSb/WE5ODipAtcopDA6EDrBW9fPrduphYola92phFBGCPINWG1eL7hre
         mxlmc4z9VV/qXWdJqALl25N65FQPWKZzwczf8hoF5fcDKIxF2f5PGnWHSA20121WfrTw
         1zXuIHXEbsHuqwgFBB/IB2OHndtkbd03FQQOPXgO/y5lGreORMoX9PXIg/q+tA5YH4Da
         YXyIhMa8Ya/loxlik7j/pHNLEvYwbq0iUt/yQ0kV8b4nXXqHbeh+L+c/gqIXIc9tyCZA
         T6tk/HkwD9sizZpwam7D4Rss6l9B4yfMdzILphz8Op9hKrA5DEHyAz7pp+OefPK5Zl/P
         jQ0Q==
X-Gm-Message-State: AOAM532bXzTUNfd5GjNXpqD3ADnRichqHjEMLY8wROeE7zzSmzypN2ly
        P3OXt8LmJChTVWwRf1OJH+XFJJz7B24XVg4jafmnhw==
X-Google-Smtp-Source: ABdhPJz9DOthLfEXyaAywpN2zjLbyg7yP79QdEbJyK44iOYpg3YyBnI1HZX1Oyg1Cv6KyXuESXsA/iFNxu6OmeFGo9c=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr13685660otl.233.1627345002305;
 Mon, 26 Jul 2021 17:16:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 20:16:41 -0400
MIME-Version: 1.0
In-Reply-To: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 20:16:41 -0400
Message-ID: <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akhil P Oommen (2021-07-24 10:29:00)
> Add the necessary dt nodes for gpu support in sc7280.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
> This patch has dependency on the GPUCC bindings patch here:
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/

To avoid the dependency the plain numbers can be used.

>
> Changes in v2:
> - formatting update and removed a duplicate header (Stephan)
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 116 +++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 029723a..524a5e0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -585,6 +586,121 @@
>                         #clock-cells = <1>;
>                 };
>
> +               gpu@3d00000 {
> +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x03d00000 0 0x40000>,
> +                             <0 0x03d9e000 0 0x1000>,
> +                             <0 0x03d61000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory",
> +                                   "cx_mem",
> +                                   "cx_dbgc";
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
> +                       clock-names = "gmu",
> +                                     "cxo",
> +                                     "axi",
> +                                     "memnoc",
> +                                     "ahb",
> +                                     "hub",
> +                                     "smmu_vote";
> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +                                       <&gpucc GPU_CC_GX_GDSC>;
> +                       power-domain-names = "cx",
> +                                            "gx";
> +                       iommus = <&adreno_smmu 5 0x400>;
> +                       operating-points-v2 = <&gmu_opp_table>;
> +
> +                       gmu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-200000000 {
> +                                       opp-hz = /bits/ 64 <200000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +                               };
> +                       };
> +               };
> +
> +               adreno_smmu: iommu@3da0000 {
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
>                 lpass_ag_noc: interconnect@3c40000 {

This node is 3c40000 and the one above is 3da0000. 3c comes before 3d.
Please order nodes properly.

>                         reg = <0 0x03c40000 0 0xf080>;
>                         compatible = "qcom,sc7280-lpass-ag-noc";
