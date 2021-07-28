Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930313D88B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 09:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234924AbhG1HR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 03:17:57 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64928 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234056AbhG1HR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 03:17:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627456676; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uTWyTqMs+PRR6Vr7fo7QE9aqKJhA7o/4CIJbMLl7ewQ=; b=xaWwd00xOR3WTwy735j44Fh53J2EtW/ukWMLhy4lcoeg9waiPXDpw8P330wfMyjwI43TkB5z
 X6D7w8s/OVU4CPbq3TmVJSq8/SDK5kRgDEakZ//Mn25hpSmw8MblDtQLHevooNDE/4c8KON1
 8oDdxvKt/iELyeWjSoyMwQ8BuKE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 610104a24815712f3a159e69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Jul 2021 07:17:53
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 194B5C433F1; Wed, 28 Jul 2021 07:17:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [59.89.229.93])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F0052C433D3;
        Wed, 28 Jul 2021 07:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F0052C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
Date:   Wed, 28 Jul 2021 12:47:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/27/2021 5:46 AM, Stephen Boyd wrote:
> Quoting Akhil P Oommen (2021-07-24 10:29:00)
>> Add the necessary dt nodes for gpu support in sc7280.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>> This patch has dependency on the GPUCC bindings patch here:
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
> 
> To avoid the dependency the plain numbers can be used.

But, won't that reduce readability and make things prone to error? If 
the other patch doesn't get picked up soon, we should try this option. 
We like to get this patch merged in v5.15.

> 
>>
>> Changes in v2:
>> - formatting update and removed a duplicate header (Stephan)
>>
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 116 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 029723a..524a5e0 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -585,6 +586,121 @@
>>                          #clock-cells = <1>;
>>                  };
>>
>> +               gpu@3d00000 {
>> +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
>> +                       #stream-id-cells = <16>;
>> +                       reg = <0 0x03d00000 0 0x40000>,
>> +                             <0 0x03d9e000 0 0x1000>,
>> +                             <0 0x03d61000 0 0x800>;
>> +                       reg-names = "kgsl_3d0_reg_memory",
>> +                                   "cx_mem",
>> +                                   "cx_dbgc";
>> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +                       iommus = <&adreno_smmu 0 0x401>;
>> +                       operating-points-v2 = <&gpu_opp_table>;
>> +                       qcom,gmu = <&gmu>;
>> +                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
>> +                       interconnect-names = "gfx-mem";
>> +
>> +                       gpu_opp_table: opp-table {
>> +                               compatible = "operating-points-v2";
>> +
>> +                               opp-550000000 {
>> +                                       opp-hz = /bits/ 64 <550000000>;
>> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>> +                                       opp-peak-kBps = <6832000>;
>> +                               };
>> +
>> +                               opp-450000000 {
>> +                                       opp-hz = /bits/ 64 <450000000>;
>> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>> +                                       opp-peak-kBps = <4068000>;
>> +                               };
>> +
>> +                               opp-315000000 {
>> +                                       opp-hz = /bits/ 64 <315000000>;
>> +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>> +                                       opp-peak-kBps = <1804000>;
>> +                               };
>> +                       };
>> +               };
>> +
>> +               gmu: gmu@3d69000 {
>> +                       compatible="qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
>> +                       reg = <0 0x03d6a000 0 0x34000>,
>> +                               <0 0x3de0000 0 0x10000>,
>> +                               <0 0x0b290000 0 0x10000>;
>> +                       reg-names = "gmu", "rscc", "gmu_pdc";
>> +                       interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hfi", "gmu";
>> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +                                       <&gpucc GPU_CC_CXO_CLK>,
>> +                                       <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +                                       <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +                                       <&gpucc GPU_CC_AHB_CLK>,
>> +                                       <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +                                       <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
>> +                       clock-names = "gmu",
>> +                                     "cxo",
>> +                                     "axi",
>> +                                     "memnoc",
>> +                                     "ahb",
>> +                                     "hub",
>> +                                     "smmu_vote";
>> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>,
>> +                                       <&gpucc GPU_CC_GX_GDSC>;
>> +                       power-domain-names = "cx",
>> +                                            "gx";
>> +                       iommus = <&adreno_smmu 5 0x400>;
>> +                       operating-points-v2 = <&gmu_opp_table>;
>> +
>> +                       gmu_opp_table: opp-table {
>> +                               compatible = "operating-points-v2";
>> +
>> +                               opp-200000000 {
>> +                                       opp-hz = /bits/ 64 <200000000>;
>> +                                       opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>> +                               };
>> +                       };
>> +               };
>> +
>> +               adreno_smmu: iommu@3da0000 {
>> +                       compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
>> +                       reg = <0 0x03da0000 0 0x20000>;
>> +                       #iommu-cells = <2>;
>> +                       #global-interrupts = <2>;
>> +                       interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +                       clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +                                       <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>> +                                       <&gpucc GPU_CC_AHB_CLK>,
>> +                                       <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>> +                                       <&gpucc GPU_CC_CX_GMU_CLK>,
>> +                                       <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +                                       <&gpucc GPU_CC_HUB_AON_CLK>;
>> +                       clock-names = "gcc_gpu_memnoc_gfx_clk",
>> +                                       "gcc_gpu_snoc_dvm_gfx_clk",
>> +                                       "gpu_cc_ahb_clk",
>> +                                       "gpu_cc_hlos1_vote_gpu_smmu_clk",
>> +                                       "gpu_cc_cx_gmu_clk",
>> +                                       "gpu_cc_hub_cx_int_clk",
>> +                                       "gpu_cc_hub_aon_clk";
>> +
>> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>;
>> +               };
>> +
>>                  lpass_ag_noc: interconnect@3c40000 {
> 
> This node is 3c40000 and the one above is 3da0000. 3c comes before 3d.
> Please order nodes properly.

Yeah, I messed up the order at a couple of places. Will fix.

-Akhil.
> 
>>                          reg = <0 0x03c40000 0 0xf080>;
>>                          compatible = "qcom,sc7280-lpass-ag-noc";

