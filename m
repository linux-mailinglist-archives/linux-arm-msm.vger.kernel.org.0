Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA073F79A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 18:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241599AbhHYQCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 12:02:09 -0400
Received: from relay04.th.seeweb.it ([5.144.164.165]:39407 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241999AbhHYQBn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 12:01:43 -0400
X-Greylist: delayed 69276 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Aug 2021 12:01:43 EDT
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 00D8A1F97A;
        Wed, 25 Aug 2021 18:00:54 +0200 (CEST)
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Replace usage of parent_names
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org
References: <20210824150606.678666-1-bjorn.andersson@linaro.org>
 <386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org>
 <YSV0/bFiPgY3fjPF@ripper>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <ed5d27eb-5a54-04c4-dbc4-63da80df1638@somainline.org>
Date:   Wed, 25 Aug 2021 18:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSV0/bFiPgY3fjPF@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 8/25/21 12:38 AM, Bjorn Andersson wrote:
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


I'm all for using .fw_name there, and I hope we all agree that clock 
dependencies based on global names should become a thing of the past; 
every such inter-driver dependency should be clearly visible in the DT. 
  We (SoMainline) can tackle this DSI side if no-one else is working on 
it yet.

> Does this cause a noticeable regression or it's just that we have a
> dangling clock?


Unfortunately this regresses yes, starting with:

     dsi0n1_postdiv_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set

And proceeding with more such errors on different clocks, clocks getting 
stuck or failing to update, and the panel never showing anything at all.

Should we fix DSI PHYs first and let this patch sit for a while, or keep 
the implicit global "xo" clock just a little while longer until that's 
over with?

Either way, feel free to attach my:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

After that.

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


Yes it is, both do _not_ look at clocks specified in DT before "falling 
back" to global names (that only happens when both .name and .fw_name 
are specified).  I'm sort of expressing the desire for .parent_fw_names 
here in hopes of phasing out global clock names on DT platforms 
altogether.  We definitely shouldn't rework .parent_names to support 
both, that only causes confusion and an implicit fallback to global 
clocks when the DT is under-specifying the required clocks is exactly 
what we're trying to avoid.

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


Fair, if done at all it should end up in a separate (2/2) patch or I'll 
take care of this in a followup.

> Regards,
> Bjorn
> 
