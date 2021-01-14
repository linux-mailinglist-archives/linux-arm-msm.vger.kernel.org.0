Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29B1B2F6D6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 22:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730052AbhANVpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 16:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730043AbhANVpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 16:45:10 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6ECC0613C1;
        Thu, 14 Jan 2021 13:44:30 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 732083EF47;
        Thu, 14 Jan 2021 22:44:28 +0100 (CET)
Subject: Re: [PATCH 1/9] clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
 <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
 <20210114190730.GA3384844@robh.at.kernel.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <ae357709-5efa-c0a7-8014-be060251ae2f@somainline.org>
Date:   Thu, 14 Jan 2021 22:44:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210114190730.GA3384844@robh.at.kernel.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 14/01/21 20:07, Rob Herring ha scritto:
> On Sat, Jan 09, 2021 at 02:46:09PM +0100, AngeloGioacchino Del Regno wrote:
>> This clock enables the GPLL0 output to the multimedia subsystem
>> clock controller.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/clk/qcom/gcc-msm8998.c               | 17 +++++++++++++++++
>>   include/dt-bindings/clock/qcom,gcc-msm8998.h |  1 +
> 
> Please put all the dt header changes in their own patch.
> 

I thought that this was fine, since I couldn't find *any* patch that is 
split like this... at least, if you look at 
dt-bindings/clock/qcom,gcc-{msm8974,msm8994,msm8996,msm8998,qcs404,sdm660,sdm845,sm8150} 
and qcom,mmcc{apq8084,msm8974,msm8996} ..... and others, at least from 
what I can see, nobody has split a code addition requiring that header 
update from the actual code.

But if that's a new new new new rule, at this point, I can send a v2 of 
this series.

I don't mean to disrespect, nor to be rude in any way but... are you 
sure? :))

--Angelo

>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
>> index 9d7016bcd680..d51c556851ca 100644
>> --- a/drivers/clk/qcom/gcc-msm8998.c
>> +++ b/drivers/clk/qcom/gcc-msm8998.c
>> @@ -1341,6 +1341,22 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
>>   	},
>>   };
>>   
>> +static struct clk_branch gcc_mmss_gpll0_clk = {
>> +	.halt_check = BRANCH_HALT_DELAY,
>> +	.clkr = {
>> +		.enable_reg = 0x5200c,
>> +		.enable_mask = BIT(1),
>> +		.hw.init = &(struct clk_init_data){
>> +			.name = "gcc_mmss_gpll0_clk",
>> +			.parent_names = (const char *[]){
>> +				"gpll0_out_main",
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>>   static struct clk_branch gcc_mss_gpll0_div_clk_src = {
>>   	.halt_check = BRANCH_HALT_DELAY,
>>   	.clkr = {
>> @@ -2944,6 +2960,7 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
>>   	[GCC_MSS_GPLL0_DIV_CLK_SRC] = &gcc_mss_gpll0_div_clk_src.clkr,
>>   	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
>>   	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
>> +	[GCC_MMSS_GPLL0_CLK] = &gcc_mmss_gpll0_clk.clkr,
>>   };
>>   
>>   static struct gdsc *gcc_msm8998_gdscs[] = {
>> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
>> index 6a73a174f049..47ca17df780b 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
>> @@ -184,6 +184,7 @@
>>   #define GCC_MSS_MNOC_BIMC_AXI_CLK				175
>>   #define GCC_BIMC_GFX_CLK					176
>>   #define UFS_UNIPRO_CORE_CLK_SRC					177
>> +#define GCC_MMSS_GPLL0_CLK					178
>>   
>>   #define PCIE_0_GDSC						0
>>   #define UFS_GDSC						1
>> -- 
>> 2.29.2
>>

