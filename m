Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5B9275CFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 18:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgIWQLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 12:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgIWQLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 12:11:31 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD875C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:11:31 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id a4so358654qth.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IGPu7NNtflAJZK7hHCfFupOylTZME0S//AJZnJbIMo0=;
        b=mf52FpZBbHbRIkbpYU536jGvNcovroktb/HPnR9sOcrUA+/rPP8gZ3IRv5JcXxhMgH
         4mp00ovPpt1O9FRgmhkrK5fTkT0Pa0c+QgOqnwCU6KKvtuN+m6/rDfIVEI0P9T5nFeXJ
         +hkXAYwPnQ3r2Qz6sPLnerIZXNB1qAxeSL+/Ag1KI7iwjtoNyTUNvxtN1xe0MISQ9tmM
         KHpJg3jRaYXaOTPzvTONWXIWHt6LAfCI57TP++3xUnqgEOYHQ/tNaHWamb6Hy35i3Ppx
         UmMVLnNhodTToU7M4uYddGscZ7JUXLbqtDhANwfEJwizAi8VxK2KXRnKF9mreq7bPfYt
         VAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IGPu7NNtflAJZK7hHCfFupOylTZME0S//AJZnJbIMo0=;
        b=PmpBlm978sSgbuDnOUA4WhLDPEikNFFtYcBQw3fhVJ2qQKui7Dv8afOUSrAwg1GalO
         sHAEvXKwTR/iD2UTcdBuYJnceDcGcvfUUM/iQE8JzFill9oVTbVJmhnVs1rBPIflYKB5
         TqhgvRLAoyZ+2IX3VEnBFzFrQ4Zv7UZ0nM/9OZ2ORJ5nWvXI35gkUlDgFRpWsUxIoVjq
         bAmZzSU6a/lPDV7LThYh18w9bJ0NbBvB5cii5LKkBTcKbUsKpK8pokIbmuagRh/Sukpj
         VrjTCuOkypuXKnnG/fnWDJzKDVjujy4MJUKLvOH12ULqhyVudOLLAarkXOgI/1wKWa1r
         bXRg==
X-Gm-Message-State: AOAM533b8U8TmUuaNwYenqXwVwQ9uccd8p4/156PJh3011Z2cQhWnPgP
        yxdAkAfv6SMsbo9+JImww0IfDw==
X-Google-Smtp-Source: ABdhPJzjwxhG3t5dQO4Mh3OpZJ32pbgHOsEh4Q4h7qrUqcvJY+8Oaihd7mni0/cqrJLlwhiqrejhvA==
X-Received: by 2002:ac8:f23:: with SMTP id e32mr823204qtk.168.1600877490919;
        Wed, 23 Sep 2020 09:11:30 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v28sm259305qkv.72.2020.09.23.09.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:11:30 -0700 (PDT)
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
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <2f429321-49c1-98b9-63e6-fd9c885af59c@marek.ca>
Date:   Wed, 23 Sep 2020 12:10:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <160080125949.310579.17354323673790889544@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/22/20 3:00 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-09-11 08:34:07)
>> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
>> new file mode 100644
>> index 000000000000..7c0f384a3a42
>> --- /dev/null
>> +++ b/drivers/clk/qcom/dispcc-sm8250.c
>> @@ -0,0 +1,1100 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
>> + */
>> +
> [...]
>> +
>> +static const struct clk_parent_data disp_cc_parent_data_6[] = {
>> +       { .fw_name = "bi_tcxo" },
>> +       { .fw_name = "dsi0_phy_pll_out_dsiclk" },
>> +       { .fw_name = "dsi1_phy_pll_out_dsiclk" },
> 
> Can we remove clk postfix on these clk names?
> 

This is consistent with the names used in both sdm845 and sc7180 
drivers. If this should change then those should be changed too?

>> +};
>> +
>> +static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(37500000, P_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
>> +       F(75000000, P_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
>> +       .cmd_rcgr = 0x22bc,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_3,
>> +       .freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_ahb_clk_src",
>> +               .parent_data = disp_cc_parent_data_3,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_shared_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_disp_cc_mdss_byte0_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>> +       .cmd_rcgr = 0x2110,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_2,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_byte0_clk_src",
>> +               .parent_data = disp_cc_parent_data_2,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> 
> Why do we need CLK_GET_RATE_NOCACHE? Please remove it.
> 
>> +               .ops = &clk_byte2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
>> +       .cmd_rcgr = 0x212c,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_2,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_byte1_clk_src",
>> +               .parent_data = disp_cc_parent_data_2,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
>> +               .ops = &clk_byte2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_dp_aux1_clk_src = {
>> +       .cmd_rcgr = 0x2240,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_1,
>> +       .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_dp_aux1_clk_src",
>> +               .parent_data = disp_cc_parent_data_1,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
>> +       .cmd_rcgr = 0x21dc,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_1,
>> +       .freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_dp_aux_clk_src",
>> +               .parent_data = disp_cc_parent_data_1,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_disp_cc_mdss_dp_link1_clk_src[] = {
>> +       F(162000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
>> +       F(270000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
>> +       F(540000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
>> +       F(810000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_dp_link1_clk_src = {
>> +       .cmd_rcgr = 0x220c,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_0,
>> +       .freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_dp_link1_clk_src",
>> +               .parent_data = disp_cc_parent_data_0,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
>> +       .cmd_rcgr = 0x2178,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_0,
>> +       .freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_dp_link_clk_src",
>> +               .parent_data = disp_cc_parent_data_0,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src = {
>> +       .cmd_rcgr = 0x21c4,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_0,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_dp_pixel1_clk_src",
>> +               .parent_data = disp_cc_parent_data_0,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
>> +               .ops = &clk_dp_ops,
> 
> This is affected by the patch I just applied 355a7d754b92 ("clk: qcom:
> dispcc: Update DP clk ops for phy design"). Please resend.
> 
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_dp_pixel2_clk_src = {
>> +       .cmd_rcgr = 0x21f4,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_0,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_dp_pixel2_clk_src",
>> +               .parent_data = disp_cc_parent_data_0,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
>> +               .ops = &clk_dp_ops,
>> +       },
>> +};
>> +
