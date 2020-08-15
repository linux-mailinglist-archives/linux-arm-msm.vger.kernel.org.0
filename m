Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1A6245372
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Aug 2020 00:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729307AbgHOWBv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Aug 2020 18:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728753AbgHOVvZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Aug 2020 17:51:25 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE967C02B8E3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2020 04:45:27 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v12so12564203ljc.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2020 04:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5kWxC8Q2TEsOvsKTGoT0rCit1An1OvXbLIdlQ6bd9Xs=;
        b=ZS0e8CPjP36nUfDoaFcR/gSeh9MJeNUD3mEmkDjX5vrf2ZC5SX2Nm17xCI9sns7sGO
         fQRiNyUy5ermFlaOZxi1TsUSVDW7nLZ6oyGj6VKZ60cewZW650VGIUyhUvuYoVpFu2Hd
         7G0C9NCqROSsIQS6uMoYtBYF3CrjL1qiVKuMo3iR0rTxUzPxSKHLcAlTjKqAnFFsepvJ
         GLk/Dsc2y3pQ5h9H/RS3E6TLLJ6q03JFZA/vQs06i/jRe5DpH24PHLKIPyI82EosvniK
         AS20iIrPyh4qNM+mFTzaDa+tsovJSpucty7obPIPRELyjiQloHSM/P9trWlYgmESLLQQ
         kD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5kWxC8Q2TEsOvsKTGoT0rCit1An1OvXbLIdlQ6bd9Xs=;
        b=pGPBvwo8rnty0PeO0O38tn9gKVTS7R/KgYr2r2Lm0o3GK7HjH0RCzf3AIc4/4T3iRf
         RNLbFhf3uKJzQ+c+zOG7K8M5Y3wQ5XotsbXQtN6gPgLQvN6w16duQ+yxjBWnq0tH4WO4
         fRajiei59/2fsySNPjQLmHfYP9HXvVaixvGm4aPCK8wejXvMXaG43Q+4+T2BUQZvTj6u
         gZ9wynSwLW0/GtQP41w4vBh0Dh6etgdUmF9P7RqgKIYZP0E116DCKj1sfngZ9eKufObo
         9Xi6newdsFyHO8cmvJHu7A9VBcCT7djjYelI7L5xMro+9o+C2KjqEcMmxU/2XVFaTEbw
         xWPA==
X-Gm-Message-State: AOAM531yjvIsS81V14p9rbXaq1zjupUR9bJlAhyFEZ6RW6/YJ1Pviq3G
        edDSf0g4FBZsITWmrFXLPuUlBA==
X-Google-Smtp-Source: ABdhPJxCubHTocMX6RPP0TdHWoKCqAKVAzmoybFXXugys1W9NRplxlI5higWH1CbHPi3zmZY3Rsgow==
X-Received: by 2002:a2e:8717:: with SMTP id m23mr3471731lji.245.1597491920894;
        Sat, 15 Aug 2020 04:45:20 -0700 (PDT)
Received: from [192.168.43.7] ([94.25.229.189])
        by smtp.gmail.com with ESMTPSA id o1sm2361694ljc.3.2020.08.15.04.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2020 04:45:20 -0700 (PDT)
Subject: Re: [PATCH v10 3/5] drm/msm/dp: add support for DP PLL driver
To:     Tanmay Shah <tanmay@codeaurora.org>
Cc:     swboyd@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        daniel@ffwll.ch, airlied@linux.ie, aravindh@codeaurora.org,
        abhinavk@codeaurora.org, khsieh@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
 <f6b330778c07abd3003da9acab4d3398@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <28b1f678-ab8f-cf6a-af9f-fcd79131bdc1@linaro.org>
Date:   Sat, 15 Aug 2020 14:45:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f6b330778c07abd3003da9acab4d3398@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/08/2020 02:22, Tanmay Shah wrote:
> On 2020-08-14 10:05, Dmitry Baryshkov wrote:
>> On 12/08/2020 07:42, Tanmay Shah wrote:
>>> From: Chandan Uddaraju <chandanu@codeaurora.org>
>>>
>>> Add the needed DP PLL specific files to support
>>> display port interface on msm targets.
>>
>> [skipped]
>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h 
>>> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>> new file mode 100644
>>> index 000000000000..475ba6ed59ab
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>> @@ -0,0 +1,98 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
>>> + */
>>> +
>>> +#ifndef __DP_PLL_10NM_H
>>> +#define __DP_PLL_10NM_H
>>> +
>>> +#include "dp_pll.h"
>>> +#include "dp_reg.h"
>>> +
>>> +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>>> +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>>> +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>>> +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>>> +
>>> +#define NUM_DP_CLOCKS_MAX            6
>>> +
>>> +#define DP_PHY_PLL_POLL_SLEEP_US        500
>>> +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>>> +
>>> +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>>> +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>>> +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>>> +
>>> +struct dp_pll_vco_clk {
>>> +    struct clk_hw hw;
>>> +    unsigned long    rate;        /* current vco rate */
>>> +    u64        min_rate;    /* min vco rate */
>>> +    u64        max_rate;    /* max vco rate */
>>> +    void        *priv;
>>> +};
>>> +
>>> +struct dp_pll_db {
>>
>> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
>> example, will use slightly different structure.
>>
> 
> Sure, it sounds good. I will give it try. Thanks!
> 
>>> +    struct msm_dp_pll *base;
>>> +
>>> +    int id;
>>> +    struct platform_device *pdev;
>>> +
>>> +    /* private clocks: */
>>> +    bool fixed_factor_clk[NUM_DP_CLOCKS_MAX];
>>> +    struct clk_hw *hws[NUM_DP_CLOCKS_MAX];
>>
>> Then these two fields can use exact number of clocks rather than
>> NUM_DP_CLOCKS_MAX.
>>
> 
> I didn't get this. I think NUM_DP_CLOCKS_MAX is doing same?

Not exactly. We'd need fixed_factor_clk[4] for 10nm rather than 6. It's 
not that important, just a small nitpick.


>>> +    u32 num_hws;
>>> +
>>> +    /* lane and orientation settings */
>>> +    u8 lane_cnt;
>>> +    u8 orientation;
>>> +
>>> +    /* COM PHY settings */
>>> +    u32 hsclk_sel;
>>> +    u32 dec_start_mode0;
>>> +    u32 div_frac_start1_mode0;
>>> +    u32 div_frac_start2_mode0;
>>> +    u32 div_frac_start3_mode0;
>>> +    u32 integloop_gain0_mode0;
>>> +    u32 integloop_gain1_mode0;
>>> +    u32 vco_tune_map;
>>> +    u32 lock_cmp1_mode0;
>>> +    u32 lock_cmp2_mode0;
>>> +    u32 lock_cmp3_mode0;
>>> +    u32 lock_cmp_en;
>>> +
>>> +    /* PHY vco divider */
>>> +    u32 phy_vco_div;
>>> +    /*
>>> +     * Certain pll's needs to update the same vco rate after resume in
>>> +     * suspend/resume scenario. Cached the vco rate for such plls.
>>> +     */
>>> +    unsigned long    vco_cached_rate;
>>> +    u32        cached_cfg0;
>>> +    u32        cached_cfg1;
>>> +    u32        cached_outdiv;
>>> +
>>> +    uint32_t index;
>>> +};
>>> +
>>> +static inline struct dp_pll_vco_clk *to_dp_vco_hw(struct clk_hw *hw)
>>> +{
>>> +    return container_of(hw, struct dp_pll_vco_clk, hw);
>>> +}
>>> +
>>> +#define to_msm_dp_pll(vco) ((struct msm_dp_pll *)vco->priv)
>>> +
>>> +#define to_dp_pll_db(x)    ((struct dp_pll_db *)x->priv)
>>> +
>>> +int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
>>> +                unsigned long parent_rate);
>>> +unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
>>> +                unsigned long parent_rate);
>>> +long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
>>> +                unsigned long *parent_rate);
>>> +int dp_vco_prepare_10nm(struct clk_hw *hw);
>>> +void dp_vco_unprepare_10nm(struct clk_hw *hw);
>>> +
>>> +int msm_dp_pll_10nm_init(struct msm_dp_pll *dp_pll, int id);
>>> +void msm_dp_pll_10nm_deinit(struct msm_dp_pll *dp_pll);
>>
>> These functions don't seem to be used outside of dp_pll_10nm. What
>> about making them static?
> 
> I can't declare static to "init" and "deinit" as they are exported to 
> dp_pll.c.
> Rest of them I can move to dp_pll_10nm and then define static.

Please exuse me for not being exact enough. Of course I meant 
dp_vco_FOO_10nm() functions, not init/exit.

BTW: as I'm looking onto 7nm dp pll, which naming would you prefer?

We can have separate DP_PLL_10nm/DP_PLL_7nm namespaces (as DSI PLLs do) 
or I can override only a set of constants (like downstream driver does).

-- 
With best wishes
Dmitry
