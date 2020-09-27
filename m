Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD51427A27C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 21:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgI0TM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 15:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgI0TM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 15:12:57 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FFEDC0613CE
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 12:12:57 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id c18so6589724qtw.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 12:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=70p4oGSydfbO/jwYJPvUdzR0c86BSWNwh7G1IyX4l+0=;
        b=fd6t7qc21fiN4CqN+wfe9PUBP5/cIzON+yfPafkuAZwPN0iz/IDFmYShAHF1YTPLxB
         u2J0Na5cWMpMGq3vdnYbpVf9j/7UyzcX9cGzwcA/+AIFuwtMExLBR4SgFGHTOmStkpj5
         ZQPeZEmZr5QvL3vfoZeN51Opc3H4tP3G1IiEjFAMx7RMpDOCefM4HM3CI70gU52G8Sa+
         Viy+W85L+4tzroVoHTo5NR2/Du/TYfevLrpLR+uOPTzjXLiyQ+t58KSpmm8cknO9hmkd
         nIM8OIC4lTpjCBA8xc0qefvSaqkEkONHFLFJlNBjSqBDEwi856nUhRbLseS6mZ8CqEpQ
         FStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=70p4oGSydfbO/jwYJPvUdzR0c86BSWNwh7G1IyX4l+0=;
        b=GHgaeFcaBq2H/jDYcX+UPCr12fBr7xMGFNybeu8bTrarXv9P+TiEUZxUxMoT8SlX/e
         iFHtBVr8PgfwBuT5E0vbmlQEMD4UWfU7QNPUVSfneQXNZKINsrSywi4B7dj9N9nUEAOw
         6e9af1bz+sZY5uXdEsPANsYoKM+QXshwHaNqS5j28ZdlTphULgVswXp7zdC6eRZfPWr+
         5oqK33zqLBtKvgXfgUcsE8nzWJAPvflLeMnPcbOkvDUZbBzwkmR/F93kbDnHDz5XlomJ
         xDaVTFhC8G6cOKhwocmMH1Ls0H6Hc4aWF6LqkagkhZHCOGBr+Oo3myH41R+oJg3DJSHK
         GE3w==
X-Gm-Message-State: AOAM5307gVyf7yLzbssSQBxDU8homYEo+3amTFj9bn9y7JMIOnPpcDVQ
        wGGyxqvtvNowzYuo7H6VOZj0/w==
X-Google-Smtp-Source: ABdhPJyli80n+mJdJimRQoYiU+5M+ZKbue/LP9WuIVtTXQYq9mztOC1Xo52T5/Ynh5zUXWPMhXLtug==
X-Received: by 2002:aed:3aa1:: with SMTP id o30mr9420809qte.152.1601233976659;
        Sun, 27 Sep 2020 12:12:56 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id j88sm7692498qte.96.2020.09.27.12.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2020 12:12:56 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] clk: qcom: Add display clock controller driver for
 SM8250
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20200911153412.21672-1-jonathan@marek.ca>
 <20200911153412.21672-8-jonathan@marek.ca>
 <160080125949.310579.17354323673790889544@swboyd.mtv.corp.google.com>
 <2f429321-49c1-98b9-63e6-fd9c885af59c@marek.ca>
 <160092820545.310579.6383587246524246608@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <6fbd25e8-a941-5055-7141-40f7a0608d5c@marek.ca>
Date:   Sun, 27 Sep 2020 15:11:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <160092820545.310579.6383587246524246608@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/24/20 2:16 AM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-09-23 09:10:04)
>> On 9/22/20 3:00 PM, Stephen Boyd wrote:
>>> Quoting Jonathan Marek (2020-09-11 08:34:07)
>>>> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
>>>> new file mode 100644
>>>> index 000000000000..7c0f384a3a42
>>>> --- /dev/null
>>>> +++ b/drivers/clk/qcom/dispcc-sm8250.c
>>>> @@ -0,0 +1,1100 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
>>>> + */
>>>> +
>>> [...]
>>>> +
>>>> +static const struct clk_parent_data disp_cc_parent_data_6[] = {
>>>> +       { .fw_name = "bi_tcxo" },
>>>> +       { .fw_name = "dsi0_phy_pll_out_dsiclk" },
>>>> +       { .fw_name = "dsi1_phy_pll_out_dsiclk" },
>>>
>>> Can we remove clk postfix on these clk names?
>>>
>>
>> This is consistent with the names used in both sdm845 and sc7180
>> drivers. If this should change then those should be changed too?
> 
> If DT isn't using it already then it sounds OK to change the other
> SoCs. Otherwise fix it just for this one.
> 

Both sdm845 and sc7180 DT are using these names. I kept these names in 
the V4 I just sent, keeping things consistent is a lot more beneficial 
than dropping 3 extra characters from the DT names.

The sc7180 dispcc driver is recent and has all of these:

- dp_phy_pll_link_clk
- dp_phy_pll_vco_div_clk
- dsi0_phy_pll_out_byteclk
- dsi0_phy_pll_out_dsiclk

So I just can't imagine dropping the clk postfix is actually important.

