Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F394316E91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 19:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbhBJS1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 13:27:17 -0500
Received: from so15.mailgun.net ([198.61.254.15]:59781 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234096AbhBJSZE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 13:25:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612981480; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=t+MNOVooXHEI9VyWLeT0xKygr+MDEJjCL/sCRvsYnhM=; b=uAf2PVm9Y5l5cp3kkn/JIWAT7DH9JjqJSY64mG22JEdBwuE1e87I1UPGV7GVSG3uW8uXOCT1
 EjwCJyhUB6fZFM5cMHhqrw77GeixnI34SwjUApqXnwK2VCDmfL2vQgVfJ/WJyzvvI3WYsO5V
 KSNzdq7ODrTI7x/S2cBsud3RwkY=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 602424c94bd23a05ae030bca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 18:24:09
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90478C433C6; Wed, 10 Feb 2021 18:24:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.106] (unknown [49.204.180.139])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9913CC433CA;
        Wed, 10 Feb 2021 18:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9913CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 2/2] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7280
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
References: <1608058114-29025-1-git-send-email-tdas@codeaurora.org>
 <1608058114-29025-3-git-send-email-tdas@codeaurora.org>
 <161048188125.3661239.13161942092910464158@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <a70505c8-9d29-463f-99bb-b5c046ee8da3@codeaurora.org>
Date:   Wed, 10 Feb 2021 23:54:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161048188125.3661239.13161942092910464158@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen for your review comments.

On 1/13/2021 1:34 AM, Stephen Boyd wrote:

>> +
>> +static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>> +       .cmd_rcgr = 0x7500c,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_8,
>> +       .freq_tbl = ftbl_gcc_sdcc1_apps_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_sdcc1_apps_clk_src",
>> +               .parent_data = gcc_parent_data_8,
>> +               .num_parents = ARRAY_SIZE(gcc_parent_data_8),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
> 
> This needs to use floor clk ops?
> 

My bad I missed them in my patch, latest patch has this fixed.

>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_sdcc1_ice_core_clk_src[] = {
>> +       F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
>> +       F(150000000, P_GCC_GPLL0_OUT_EVEN, 2, 0, 0),
>> +       F(300000000, P_GCC_GPLL0_OUT_EVEN, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
>> +       .cmd_rcgr = 0x7502c,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_1,
>> +       .freq_tbl = ftbl_gcc_sdcc1_ice_core_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_sdcc1_ice_core_clk_src",
>> +               .parent_data = gcc_parent_data_1,
>> +               .num_parents = ARRAY_SIZE(gcc_parent_data_1),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
> 
> Same.
> 
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
>> +       F(400000, P_BI_TCXO, 12, 1, 4),
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
>> +       F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
>> +       F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
>> +       F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>> +       .cmd_rcgr = 0x1400c,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_9,
>> +       .freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_sdcc2_apps_clk_src",
>> +               .parent_data = gcc_parent_data_9,
>> +               .num_parents = ARRAY_SIZE(gcc_parent_data_9),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
> 
> Same.
> 
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
>> +       F(400000, P_BI_TCXO, 12, 1, 4),
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
>> +       F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
>> +       F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>> +       .cmd_rcgr = 0x1600c,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_1,
>> +       .freq_tbl = ftbl_gcc_sdcc4_apps_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_sdcc4_apps_clk_src",
>> +               .parent_data = gcc_parent_data_1,
>> +               .num_parents = ARRAY_SIZE(gcc_parent_data_1),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
> 
> Same.
> 
>> +       },
>> +};
>> +
> [...]
>> +static struct clk_branch gcc_cpuss_ahb_clk = {
>> +       .halt_reg = 0x48000,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .hwcg_reg = 0x48000,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(21),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_cpuss_ahb_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> 
> Why is it critical? Please add a comment like sc7180.
> 

Updated the comment in the latest patch.

>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
