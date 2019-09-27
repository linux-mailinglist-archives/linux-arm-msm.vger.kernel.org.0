Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADFE1C001A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 09:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfI0HiF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 03:38:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34052 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfI0HiF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 03:38:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0C75660BF9; Fri, 27 Sep 2019 07:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569569884;
        bh=teWs/vtWTsziav0JQnD9ZMzwkSFXlCN1dgwADLH494A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DASvc3ff7j2gnwddE6LRTNzjIkqF1lk4f+F1l2XsAHNUo29m3us24kgdjxUhQHCSU
         rS3g8cE3ZMQukPDowzhdpybM6rMgn4k87ZLNa2K2TyjdWF9zMBFt5SC6Mzu4zIcjtq
         SMiS36ZJOzw3AbrCrq1mOvkuBKyDkOi2O0+gMlks=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CD39560BE8;
        Fri, 27 Sep 2019 07:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569569883;
        bh=teWs/vtWTsziav0JQnD9ZMzwkSFXlCN1dgwADLH494A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jXmoGgiSnM9YMqGD2mBG2MxuvuXR7SBzdU40ytZNySRFx3CVGZoeBkg+A/3qNuuGr
         urudSDobmcu5cEzA+zZbQ2ka87iWkf0Dy0y8o2cdBFmdtKmNnK0CE1bD7NS7erx+MQ
         uqe6erYQIWodM6aFq8e97teq8dSGUpwoxP5XJYqw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CD39560BE8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190918095018.17979-1-tdas@codeaurora.org>
 <20190918095018.17979-4-tdas@codeaurora.org>
 <20190918213946.DC03521924@mail.kernel.org>
 <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org>
 <20190924231223.9012C207FD@mail.kernel.org>
 <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org>
 <20190925130346.42E0820640@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org>
Date:   Fri, 27 Sep 2019 13:07:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925130346.42E0820640@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 9/25/2019 6:33 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-09-25 04:20:07)
>> Hi Stephen,
>>
>> Please find my comments.
>>
>> On 9/25/2019 4:42 AM, Stephen Boyd wrote:
>>> Quoting Taniya Das (2019-09-23 01:01:11)
>>>> Hi Stephen,
>>>>
>>>> Thanks for your comments.
>>>>
>>>> On 9/19/2019 3:09 AM, Stephen Boyd wrote:
>>>>> Quoting Taniya Das (2019-09-18 02:50:18)
>>>>>> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..d47865d5408f
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/clk/qcom/gcc-sc7180.c
>>>>>> +                       .ops = &clk_branch2_ops,
>>>>>> +               },
>>>>>> +       },
>>>>>> +};
>>>>>> +
>>> [...]
>>>>>> +static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
>>>>>> +       .halt_reg = 0x77094,
>>>>>> +       .halt_check = BRANCH_HALT,
>>>>>> +       .hwcg_reg = 0x77094,
>>>>>> +       .hwcg_bit = 1,
>>>>>> +       .clkr = {
>>>>>> +               .enable_reg = 0x77094,
>>>>>> +               .enable_mask = BIT(0),
>>>>>> +               .hw.init = &(struct clk_init_data){
>>>>>> +                       .name = "gcc_ufs_phy_phy_aux_clk",
>>>>>> +                       .parent_data = &(const struct clk_parent_data){
>>>>>> +                               .hw = &gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
>>>>>> +                       },
>>>>>> +                       .num_parents = 1,
>>>>>> +                       .flags = CLK_SET_RATE_PARENT,
>>>>>> +                       .ops = &clk_branch2_ops,
>>>>>> +               },
>>>>>> +       },
>>>>>> +};
>>>>>> +
>>>>>> +static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
>>>>>> +       .halt_reg = 0x7701c,
>>>>>> +       .halt_check = BRANCH_HALT_SKIP,
>>>>>
>>>>> Again, nobody has fixed the UFS driver to not need to do this halt skip
>>>>> check for these clks? It's been over a year.
>>>>>
>>>>
>>>> The UFS_PHY_RX/TX clocks could be left enabled due to certain HW boot
>>>> configuration and thus during the late initcall of clk_disable there
>>>> could be warnings of "clock stuck ON" in the dmesg. That is the reason
>>>> also to use the BRANCH_HALT_SKIP flag.
>>>
>>> Oh that's bad. Why do the clks stay on when we try to turn them off?
>>>
>>
>> Those could be due to the configuration selected by HW and SW cannot
>> override them, so traditionally we have never polled for CLK_OFF for
>> these clocks.
> 
> Is that the case or just a guess?
> 

This is the behavior :).

>>
>>>>
>>>> I would also check internally for the UFS driver fix you are referring here.
>>>
>>> Sure. I keep asking but nothing is done :(
>>>
>>>>
>>>>>> +       .clkr = {
>>>>>> +               .enable_reg = 0x7701c,
>>>>>> +               .enable_mask = BIT(0),
>>>>>> +               .hw.init = &(struct clk_init_data){
>>>>>> +                       .name = "gcc_ufs_phy_rx_symbol_0_clk",
>>>>>> +                       .ops = &clk_branch2_ops,
>>>>>> +               },
>>>>>> +       },
>>>>>> +};
>>>>>> +
>>> [...]
>>>>>> +
>>>>>> +static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
>>>>>> +       .halt_reg = 0xf058,
>>>>>> +       .halt_check = BRANCH_HALT_SKIP,
>>>>>
>>>>> Why does this need halt_skip?
>>>>
>>>> This is required as the source is external PHY, so we want to not check
>>>> for HALT.
>>>
>>> This doesn't really answer my question. If the source is an external phy
>>> then it should be listed as a clock in the DT binding and the parent
>>> should be specified here. Unless something doesn't work because of that?
>>>
>>
>> The USB phy is managed by the USB driver and clock driver is not aware
>> if USB driver models the phy as a clock. Thus we do want to keep a
>> dependency on the parent and not poll for CLK_ENABLE.
> 
> The clk driver should be aware of the USB driver modeling the phy as a
> clk. We do that for other phys so what is the difference here?
> 

Let me check with the USB team, but could we keep them for now?

>>
>>>>
>>>>>
>>>>>> +       .clkr = {
>>>>>> +               .enable_reg = 0xf058,
>>>>>> +               .enable_mask = BIT(0),
>>>>>> +               .hw.init = &(struct clk_init_data){
>>>>>> +                       .name = "gcc_usb3_prim_phy_pipe_clk",
>>>>>> +                       .ops = &clk_branch2_ops,
>>>>>> +               },
>>>>>> +       },
>>>>>> +};
>>>>>> +
>>>>>> +static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
>>>>>> +       .halt_reg = 0x6a004,
>>>>>> +       .halt_check = BRANCH_HALT,
>>>>>> +       .hwcg_reg = 0x6a004,
>>>>>> +       .hwcg_bit = 1,
>>>>>> +       .clkr = {
>>>>>> +               .enable_reg = 0x6a004,
>>>>>> +               .enable_mask = BIT(0),
>>>>>> +               .hw.init = &(struct clk_init_data){
>>>>>> +                       .name = "gcc_usb_phy_cfg_ahb2phy_clk",
>>>>>> +                       .ops = &clk_branch2_ops,
>>>>>> +               },
>>>>>> +       },
>>>>>> +};
>>>>>> +
>>>>>> +/* Leave the clock ON for parent config_noc_clk to be kept enabled */
>>>>>
>>>>> There's no parent though... So I guess this means it keeps it enabled
>>>>> implicitly in hardware?
>>>>>
>>>>
>>>> These are not left enabled, but want to leave them enabled for clients
>>>> on config NOC.
>>>
>>> Sure. It just doesn't make sense to create clk structures and expose
>>> them in the kernel when we just want to turn the bits on and leave them
>>> on forever. Why not just do some register writes in probe for this
>>> driver? Doesn't that work just as well and use less memory?
>>>
>>
>> Even if I write these registers during probe, the late init check
>> 'clk_core_is_enabled' would return true and would be turned OFF, that is
>> the reason for marking them CRITICAL.
>>
> 
> That wouldn't happen if the clks weren't registered though, no?
> 

I want to keep these clock CRITICAL and registered for now, but we 
should be able to revisit/clean them up later.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
