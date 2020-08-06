Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996CD23D668
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 07:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgHFFXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 01:23:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13893 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727885AbgHFFXP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 01:23:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596691393; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bvZnrTkOnWDZNUUhPw1+FJ3XFluG45rscsa1dJ+3kus=; b=Lk5N9u3ePpxHsjSDmt38lZGYuh50tSAEXE1cuUtM0h2YhExLomYmNkpEQE+2qOBl66PZwyfE
 qMj3GjWbLkoKYttUa8z1PQPXllaDILT+esrrZEKYtaT/oHomhgZhfiCa4MHdWyVIhvA0x2nc
 svRFZTyl5JSWwQnjJLTgz4NBsZA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f2b93c1725833be306e2d88 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 Aug 2020 05:23:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D79BC43391; Thu,  6 Aug 2020 05:23:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [49.204.182.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5DD4EC433C6;
        Thu,  6 Aug 2020 05:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5DD4EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v5 4/4] clk: qcom: lpass: Add support for LPASS clock
 controller for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1595606878-2664-1-git-send-email-tdas@codeaurora.org>
 <1595606878-2664-5-git-send-email-tdas@codeaurora.org>
 <159665909245.1360974.10366839079633595523@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <13ac9aad-2377-472d-b2be-a762a21c2dac@codeaurora.org>
Date:   Thu, 6 Aug 2020 10:53:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159665909245.1360974.10366839079633595523@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 8/6/2020 1:54 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-07-24 09:07:58)
>> +
>> +static struct clk_rcg2 core_clk_src = {
>> +       .cmd_rcgr = 0x1d000,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = lpass_core_cc_parent_map_2,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "core_clk_src",
> 
> Any chance this can get a better name? Something with LPASS prefix?
> 

These are the exact clock names from the hardware plan.

>> +               .parent_data = &(const struct clk_parent_data){
>> +                       .fw_name = "bi_tcxo",
>> +               },
>> +               .num_parents = 1,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
> [...]
>> +
>> +static struct clk_branch lpass_audio_core_sysnoc_mport_core_clk = {
>> +       .halt_reg = 0x23000,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x23000,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x23000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "lpass_audio_core_sysnoc_mport_core_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &core_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_regmap *lpass_core_cc_sc7180_clocks[] = {
>> +       [EXT_MCLK0_CLK_SRC] = &ext_mclk0_clk_src.clkr,
>> +       [LPAIF_PRI_CLK_SRC] = &lpaif_pri_clk_src.clkr,
>> +       [LPAIF_SEC_CLK_SRC] = &lpaif_sec_clk_src.clkr,
>> +       [CORE_CLK_SRC] = &core_clk_src.clkr,
> 
> And all of these, can they have LPASS_ prefix on the defines? Seems
> like we're missing a namespace otherwise.
> 

These are generated as they are in the HW plan. Do you still think I 
should update them?

>> +       [LPASS_AUDIO_CORE_EXT_MCLK0_CLK] = &lpass_audio_core_ext_mclk0_clk.clkr,
>> +       [LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK] =
>> +               &lpass_audio_core_lpaif_pri_ibit_clk.clkr,
>> +       [LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK] =
>> +               &lpass_audio_core_lpaif_sec_ibit_clk.clkr,
>> +       [LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK] =
>> +               &lpass_audio_core_sysnoc_mport_core_clk.clkr,
>> +       [LPASS_LPAAUDIO_DIG_PLL] = &lpass_lpaaudio_dig_pll.clkr,
>> +       [LPASS_LPAAUDIO_DIG_PLL_OUT_ODD] = &lpass_lpaaudio_dig_pll_out_odd.clkr,
>> +};
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
