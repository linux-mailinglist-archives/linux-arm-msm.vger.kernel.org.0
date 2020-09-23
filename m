Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A007F275CE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 18:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIWQIp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 12:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgIWQIo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 12:08:44 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5D8C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:08:44 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id g3so287665qtq.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6AhmEhoJKFtZgkPr3wt8u+Go1C07WkmomwQKmNs/qUM=;
        b=XrJbrIo3osTb6a4fWmk3C934RubXjCWAy8d5fjuEM6+yRb8mu8iERyHearweM84CVu
         z57wm5v+OL36pSH805KtT3ttIul67kx8DzBhgbfB8sCGc7ZBuI//+e2O4xg9d3oS+Pwm
         1Cbnfx5ktVP/i75R/r+M5fHrhzAowDD8p++KmUgzimOzKpi0iTQIuoCJx/NhpiadcRXd
         7zcHKx0g25qsXbXkQEmCTFS8o6KNrwcVZ7IaudMjTfGyNRZmr95obFcS1tfit1fxDRgu
         3c8ERDeJHV51IMAsBfIYZqsx5dF1jVGrQ/kRpiPDQZgnuA5y3tTnKgOB/GtgmF90CEdH
         4pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6AhmEhoJKFtZgkPr3wt8u+Go1C07WkmomwQKmNs/qUM=;
        b=EAMBDiG9zGXuPFpOPFgqP4TgKJWkkIoET47onsefwpmVBKTO4EfTSXGlLYer7uTwWE
         zQAZ5D8sgtjJ9TYoE6J0V1h+t9+ZKGHhDMQDRhNGx4uBgCljWoDyAnlbyBwn/aIvowZL
         LWw8sNlpN+4S+XsgCF+yQvkqd6Fo2mTxdNxayZnvP/zB6ehB2ih/uFm2zfE95EYN2pBZ
         kxHY0/TvyqhP5FDjlyZJ8RZQxqda6YV2ALX9mp5vTjOOlteXJTCYWMOWlUdm4QihovDa
         VOB3pe5KCaPe+VKO6RzTHF+Piz8S5cBlMZmuXh8C4LoqHCUOnh7kTjnaogpqqXshPYNA
         5tzg==
X-Gm-Message-State: AOAM531MbNz5mhZIQ+0n8PAnhf83EPoNpZTpgtuMzygsEc+0efYSqRGM
        mNHxSW19CNKE1ybtTa+LGcyW7A==
X-Google-Smtp-Source: ABdhPJzv5bZi6mvVh+1QKpCLLY3nsq6okbRSPzCxjOjS5u0I5tRgaBkEUOfVkkHDG+42Uks/yoiZeQ==
X-Received: by 2002:ac8:60d1:: with SMTP id i17mr818976qtm.272.1600877322690;
        Wed, 23 Sep 2020 09:08:42 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id c70sm250037qkg.4.2020.09.23.09.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:08:42 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] clk: qcom: add video clock controller driver for
 SM8250
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20200904030958.13325-1-jonathan@marek.ca>
 <20200904030958.13325-6-jonathan@marek.ca>
 <160080040123.310579.8471841951357841843@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <0ce9fdb6-e224-ced7-ec32-fe67b2ca6127@marek.ca>
Date:   Wed, 23 Sep 2020 12:07:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <160080040123.310579.8471841951357841843@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/22/20 2:46 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-09-03 20:09:54)
>> Add support for the video clock controller found on SM8250 based devices.
>>
>> Derived from the downstream driver.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/clk/qcom/Kconfig          |   9 +
>>   drivers/clk/qcom/Makefile         |   1 +
>>   drivers/clk/qcom/videocc-sm8250.c | 518 ++++++++++++++++++++++++++++++
>>   3 files changed, 528 insertions(+)
>>   create mode 100644 drivers/clk/qcom/videocc-sm8250.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 40d7ee9886c9..95efa38211d5 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -453,6 +453,15 @@ config SM_VIDEOCC_8150
>>            Say Y if you want to support video devices and functionality such as
>>            video encode and decode.
>>   
>> +config SM_VIDEOCC_8250
>> +       tristate "SM8250 Video Clock Controller"
>> +       select SDM_GCC_8250
>> +       select QCOM_GDSC
>> +       help
>> +         Support for the video clock controller on SM8250 devices.
>> +         Say Y if you want to support video devices and functionality such as
>> +         video encode and decode.
>> +
>>   config SPMI_PMIC_CLKDIV
>>          tristate "SPMI PMIC clkdiv Support"
>>          depends on SPMI || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 6f4c580d2728..55fb20800b66 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -69,6 +69,7 @@ obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
>>   obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
>>   obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
>>   obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
>> +obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
>>   obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
>>   obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
>>   obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
>> diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
>> new file mode 100644
>> index 000000000000..a814d10945c4
>> --- /dev/null
>> +++ b/drivers/clk/qcom/videocc-sm8250.c
>> @@ -0,0 +1,518 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,videocc-sm8250.h>
>> +
> [...]
>> +static struct clk_rcg2 video_cc_ahb_clk_src = {
>> +       .cmd_rcgr = 0xbd4,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = video_cc_parent_map_0,
>> +       .freq_tbl = ftbl_video_cc_ahb_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "video_cc_ahb_clk_src",
>> +               .parent_data = video_cc_parent_data_0,
>> +               .num_parents = ARRAY_SIZE(video_cc_parent_data_0),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_shared_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 video_cc_xo_clk_src = {
>> +       .cmd_rcgr = 0xecc,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = video_cc_parent_map_0,
>> +       .freq_tbl = ftbl_video_cc_ahb_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "video_cc_xo_clk_src",
>> +               .parent_data = video_cc_parent_data_0,
>> +               .num_parents = ARRAY_SIZE(video_cc_parent_data_0),
>> +               .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> 
> Similar critical clk comment, see below.
> 
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_branch video_cc_ahb_clk = {
>> +       .halt_reg = 0xe58,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xe58,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "video_cc_ahb_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &video_cc_ahb_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> 
> Similar critical clk comment, see below.
> 
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch video_cc_mvs0_clk = {
>> +       .halt_reg = 0xd34,
>> +       .halt_check = BRANCH_HALT_SKIP, /* TODO: hw gated ? */
> 
> Is this resolved?
> 

Downstream has this clock as BRANCH_HALT_VOTED, but with the upstream 
venus driver (with patches to enable sm8250), that results in a 
"video_cc_mvs0_clk status stuck at 'off" error. AFAIK venus 
enables/disables this clock on its own (venus still works without 
touching this clock), but I didn't want to remove this in case it might 
be needed. I removed these clocks in the v3 I just sent.

>> +       .clkr = {
>> +               .enable_reg = 0xd34,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "video_cc_mvs0_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &video_cc_mvs0_div_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
> [...]
>> +
>> +static struct clk_branch video_cc_xo_clk = {
>> +       .halt_reg = 0xeec,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xeec,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "video_cc_xo_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &video_cc_xo_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> 
> Please add a coment why it's critical. If no consumer of this clk exists
> it's preferred to move the enabling to probe and not waste memory
> modeling it in software.
> 
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
