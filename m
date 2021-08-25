Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6AA33F737A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 12:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239022AbhHYKkp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 06:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237638AbhHYKkp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 06:40:45 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74459C0613C1;
        Wed, 25 Aug 2021 03:39:59 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 05D041F968;
        Wed, 25 Aug 2021 12:39:58 +0200 (CEST)
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Replace usage of parent_names
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20210824150606.678666-1-bjorn.andersson@linaro.org>
 <386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org>
 <YSV0/bFiPgY3fjPF@ripper>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <bc2fd17a-66f4-7f60-cdbd-e3548fa4f1a4@somainline.org>
Date:   Wed, 25 Aug 2021 12:39:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YSV0/bFiPgY3fjPF@ripper>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 25/08/21 00:38, Bjorn Andersson ha scritto:
> On Tue 24 Aug 13:46 PDT 2021, Marijn Suijten wrote:
> 
>> Hi Bjorn,
>>
>> Thanks for this cleanup, that's needed and much appreciated!
>>
>> On 8/24/21 5:06 PM, Bjorn Andersson wrote:
>>> Using parent_data and parent_hws, instead of parent_names, does protect
>>> against some cases of incompletely defined clock trees. While it turns
>>> out that the bug being chased this time was totally unrelated, this
>>> patch converts the SDM660 GCC driver to avoid such issues.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>>
>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> On the Sony Xperia XA2 Ultra, bar the necessary change in the 14NM DSI PHY
>> driver commented below.
>>
>>> [..]
>>> -
>>> -static struct clk_fixed_factor xo = {
>>> -	.mult = 1,
>>> -	.div = 1,
>>> -	.hw.init = &(struct clk_init_data){
>>> -		.name = "xo",
>>> -		.parent_names = (const char *[]){ "xo_board" },
>>> -		.num_parents = 1,
>>> -		.ops = &clk_fixed_factor_ops,
>>> -	},
>>> -};
>>
>>
>> Removing the global "xo" clock makes it so that our 14nm DSI PHY does not
>> have a parent clock anymore, as the clock is called "xo_board" nowadays
>> ("xo" in the position of fw_name is, as you know, only local to this driver
>> because it is named that way in the clock-names property). We (SoMainline)
>> suffer the same DSI PHY hardcoding issue on many other boards and are at
>> this point investigating whether to provide &xo_board in DT like any other
>> sane driver.  Do you happen to know if work is already underway to tackle
>> this?
>>
> 
> As far as I can tell most other platforms doesn't define "xo" either.
> E.g. according to debugfs dsi0vco_clk doesn't have a parent on sdm845...
> 
> Sounds like we should update the dsi phys to specify a fw_name and
> update binding and dts to provide this...
> 
> 
> Does this cause a noticeable regression or it's just that we have a
> dangling clock?
> 

Both, actually... but sincerely I would be more for updating the DSI PHY
drivers instead of keeping a "mock" crystal clock in there (since we do
always specify one in DT), also because, as Marijn pointed out and as I
can also confirm, we're seeing the same situation on multiple platforms.

That would allow us to solve the issue simply with DT, and would make us
able to switch platforms one by one to the RPM/RPMh XO in a perfect future
where we will be able to perform XO shutdown on selected platforms.

>>>    static struct clk_alpha_pll gpll0_early = {
>>>    	.offset = 0x0,
>>>    	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>> @@ -158,7 +35,9 @@ static struct clk_alpha_pll gpll0_early = {
>>>    		.enable_mask = BIT(0),
>>>    		.hw.init = &(struct clk_init_data){
>>>    			.name = "gpll0_early",
>>> -			.parent_names = (const char *[]){ "xo" },
>>> +			.parent_data = &(const struct clk_parent_data){
>>> +				.fw_name = "xo",
>>> +			},
>>
>>
>> I wish we could use .parent_names for a list of .fw_name's too
> 
> Afaict specifying "name" in struct clk_parent_data is the same as using
> parent_names. But I'm not up to speed on the details of how to migrate
> the dsi phys.
> 
>>> [..]
>>> @@ -265,7 +270,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
>>>    	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>>    	.clkr.hw.init = &(struct clk_init_data){
>>>    		.name = "blsp1_qup1_i2c_apps_clk_src",
>>> -		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
>>> +		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
>>>    		.num_parents = 3,
>>
>>
>> How about using ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div) now?
>> Same for every other occurrence of this pattern.
>>
> 
> I omitted that because it felt unrelated to the change I was doing, but
> it could certainly be done.
> 

Totally fair and I totally agree.

By the way,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

> Regards,
> Bjorn
> 

