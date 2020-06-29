Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF19620E4CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732474AbgF2V3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728960AbgF2Smm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:42:42 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D076C031C47
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:27:09 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id b185so5393366qkg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pqe14MaPsMfgtT/LBcuvaSN2cytXk1SleFgshIkTKVM=;
        b=USGV60ZzR1pxKQN2xImazAMTEN9Qly93rcztD+sYyGT3yq/2h+C2ZfM6tWNpO2TSuW
         sI+F0KtJIs/Rz04s9xPFkJ6DTpB5pPPAprIj3AnIMP4sEaqqcurmdjYTdABfIZZ40Awr
         ck9UYLevqJHyUS4oEHxtxwTJ6+9/xo1gykYlCpdGmF+khLkasVMr0e8eMjVr7eSur2Hl
         zCQK8g35HbE5WDa5bKhJmyaMG+KMygFxJkSi6qYWbZsQ3Cms7DeKU2Du8peGOUpdqvEH
         7h199ie9F89cNHIX9BXnlcW832fl9cx4Yo0HLEglG8PnZM5iD1OX6Sbr1P9Jnusg65cJ
         bQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pqe14MaPsMfgtT/LBcuvaSN2cytXk1SleFgshIkTKVM=;
        b=UD5HMd69tsO70RV7ejAAU9RE41h2QADOSQb+IsgkxDmvkw7GPM3tnpDZniS9Xj/K8b
         TTjpGxI0clpm5fYCICt0ZSPAE4189iAnA53OEKXzXsLfHzdd5kX1YhdfsuNf0xEjJa7K
         RSMXId02uUBkerqOzysqj0DcAWLqTHT+gtgv4NqlMAQyl0arhSDwkO9GmeNbZVDlOTuL
         nEP8WISgfpqd9OFarBLtpWmBMQM420kvtBYGu5Fkkd1gVskMlRH6ZtGOMvHSY/uMND5F
         NYwYu319KtRPB7S+XydN1cDGeTFFgrUyLmvRxMVi03kkVBQfZh//4Bts5WV83td0SPQO
         C8Rg==
X-Gm-Message-State: AOAM533Ue0x+9Q9CJU8jUEkyl+ukMyc0ksSMrSordVA73+YBaUqBHYGp
        7Kkk8JVGWyavp+wtcxUydy2xmA==
X-Google-Smtp-Source: ABdhPJz6/7Q13mZzwNNVBWoMSVx5buOlaqi44+cTUPkY+oXRmbqWOckeIL2jAiQfaU3iBb439UfzvA==
X-Received: by 2002:a37:7741:: with SMTP id s62mr4110200qkc.263.1593451628633;
        Mon, 29 Jun 2020 10:27:08 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id x19sm372668qtc.36.2020.06.29.10.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 10:27:08 -0700 (PDT)
Subject: Re: [PATCH 07/10] clk: qcom: Add graphics clock controller driver for
 SM8150
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-8-jonathan@marek.ca>
 <159056904079.88029.16161248455546031414@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <231bd673-aa99-6223-fa74-54e9a488833e@marek.ca>
Date:   Mon, 29 Jun 2020 13:27:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <159056904079.88029.16161248455546031414@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/27/20 4:44 AM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-05-24 14:06:08)
>> diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
>> new file mode 100644
>> index 000000000000..6e1fff0cde75
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gpucc-sm8150.c
>> @@ -0,0 +1,429 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,gpucc-sm8150.h>
> [..]
>> +
>> +static struct clk_rcg2 gpu_cc_gmu_clk_src = {
>> +       .cmd_rcgr = 0x1120,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gpu_cc_parent_map_0,
>> +       .freq_tbl = ftbl_gpu_cc_gmu_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gpu_cc_gmu_clk_src",
>> +               .parent_names = gpu_cc_parent_names_0,
>> +               .num_parents = 6,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_branch gpu_cc_ahb_clk = {
>> +       .halt_reg = 0x1078,
>> +       .halt_check = BRANCH_HALT_DELAY,
>> +       .clkr = {
>> +               .enable_reg = 0x1078,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpu_cc_ahb_clk",
>> +                       .flags = CLK_IS_CRITICAL,
> 
> Why is this CLK_IS_CRITICAL? Why not just enable the clk manually with
> a register write in probe and then remove this clk from the system? We
> can save some memory that way.
> 

I copied this from downstream, so I don't know why. It works without it, 
so I removed the CLK_IS_CRITICAL in my v2 (from both sm8150 and sm8250).

>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
> [...]
>> +
>> +static struct gdsc gpu_cx_gdsc = {
>> +       .gdscr = 0x106c,
>> +       .gds_hw_ctrl = 0x1540,
>> +       .pd = {
>> +               .name = "gpu_cx_gdsc",
>> +       },
>> +       .pwrsts = PWRSTS_OFF_ON,
>> +       .flags = VOTABLE,
>> +};
>> +
>> +/* see comment in gpucc-sdm845 about this */
>> +static int gx_gdsc_enable(struct generic_pm_domain *domain)
>> +{
>> +       /* Do nothing but give genpd the impression that we were successful */
>> +       return 0;
>> +}
> 
> Maybe we should export a helper from gdsc.c for this with the comment
> and it named something obvious? gx_gdsc_do_nothing_enable()?
> 

Made this change in my v2.

>> +
>> +static struct gdsc gpu_gx_gdsc = {
>> +       .gdscr = 0x100c,
>> +       .clamp_io_ctrl = 0x1508,
>> +       .pd = {
>> +               .name = "gpu_gx_gdsc",
>> +               .power_on = gx_gdsc_enable,
>> +       },
>> +       .pwrsts = PWRSTS_OFF_ON,
>> +       .flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
>> +};
>> +
