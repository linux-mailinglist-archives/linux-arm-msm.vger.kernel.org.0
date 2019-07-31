Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12757CBB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 20:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729166AbfGaSPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 14:15:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41902 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbfGaSPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 14:15:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6FEDB607B9; Wed, 31 Jul 2019 18:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564596908;
        bh=Kcu2VjqlJnOdTtm7bdXRgQAWQq9XR+PWhiOTGZ6JV4A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mDwXTRgucPROPO3+eHB3oLPOjyUF4PDNR8W//+pgx9bjJIqHsXLT8+GS/DQzklHZo
         pQT8Ya+5qVhR6gDSxUthwIdfTW7zphCYJu9EFnycVyf0YYrZ1bBNYtdqc6W9CbioWa
         29zLQ4H74YxqVaVWvIdaIkY1I1BdWYc2aI4qSDko=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.162.111] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C69FF60735;
        Wed, 31 Jul 2019 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564596908;
        bh=Kcu2VjqlJnOdTtm7bdXRgQAWQq9XR+PWhiOTGZ6JV4A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mDwXTRgucPROPO3+eHB3oLPOjyUF4PDNR8W//+pgx9bjJIqHsXLT8+GS/DQzklHZo
         pQT8Ya+5qVhR6gDSxUthwIdfTW7zphCYJu9EFnycVyf0YYrZ1bBNYtdqc6W9CbioWa
         29zLQ4H74YxqVaVWvIdaIkY1I1BdWYc2aI4qSDko=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C69FF60735
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 2/2] clk: qcom : dispcc: Add support for display port
 clocks
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1557894039-31835-1-git-send-email-tdas@codeaurora.org>
 <1557894039-31835-3-git-send-email-tdas@codeaurora.org>
 <20190715223758.BA46D2080A@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <0243ec02-6571-b57a-ecbf-04d4cc802ca4@codeaurora.org>
Date:   Wed, 31 Jul 2019 23:45:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715223758.BA46D2080A@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for your comments.

On 7/16/2019 4:07 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-05-14 21:20:39)
>> @@ -128,6 +144,82 @@ enum {
>>          },
>>   };
>>
>> +static const struct freq_tbl ftbl_disp_cc_mdss_dp_aux_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
>> +       .cmd_rcgr = 0x219c,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_2,
>> +       .freq_tbl = ftbl_disp_cc_mdss_dp_aux_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_dp_aux_clk_src",
>> +               .parent_names = disp_cc_parent_names_2,
>> +               .num_parents = 2,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
>> +       .cmd_rcgr = 0x2154,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_1,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_dp_crypto_clk_src",
>> +               .parent_names = disp_cc_parent_names_1,
>> +               .num_parents = 4,
>> +               .flags = CLK_GET_RATE_NOCACHE,
> 
> Why do we need this flag on various clks here? I'd prefer this is
> removed. If it can't be removed, we need to describe in a code comment
> why this must be set.
> 
> If it's some sort of problem where the upstream PLL goes into bypass
> across a reset, then we probably need to change the display code to
> restore that rate across a reset by calling clk_set_rate() on the PLL
> directly. And we might need to think about how to inform the framework
> that this has happened, so that downstream clks can be notified of the
> change in frequency.
> 

I had another discussion with the team and they are okay to remove these 
flags, so would submit the next patch with the flag removed.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
