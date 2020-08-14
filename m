Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B4024501E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Aug 2020 01:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgHNXWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 19:22:50 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26016 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726738AbgHNXWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 19:22:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597447368; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cqB2KYoA6yVaX4oJso9WfBF09SwAmfmeiF0tTyQrqMw=;
 b=MSmYb+MKBGe61801KVdVyJIIMMjnfolD4zylmsdtPdKZtgwoVrcavYS+7cK2ecjxY5D0eo8D
 7rknqVAyNPPm1gFzeBu2we19vTYBteKEAHG1AMYJiqiJBvxPmjP/dLkBKcnhGzHyGldnyKv/
 T76gOAde9e6WwdI4mjMKi9f9wno=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f371cbc4c787f237b9f2f99 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 Aug 2020 23:22:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5B673C43395; Fri, 14 Aug 2020 23:22:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64FAEC433C9;
        Fri, 14 Aug 2020 23:22:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 Aug 2020 16:22:35 -0700
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     swboyd@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        daniel@ffwll.ch, airlied@linux.ie, aravindh@codeaurora.org,
        abhinavk@codeaurora.org, khsieh@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v10 3/5] drm/msm/dp: add support for DP PLL driver
In-Reply-To: <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
Message-ID: <f6b330778c07abd3003da9acab4d3398@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-14 10:05, Dmitry Baryshkov wrote:
> On 12/08/2020 07:42, Tanmay Shah wrote:
>> From: Chandan Uddaraju <chandanu@codeaurora.org>
>> 
>> Add the needed DP PLL specific files to support
>> display port interface on msm targets.
> 
> [skipped]
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h 
>> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>> new file mode 100644
>> index 000000000000..475ba6ed59ab
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>> @@ -0,0 +1,98 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2016-2020, The Linux Foundation. All rights 
>> reserved.
>> + */
>> +
>> +#ifndef __DP_PLL_10NM_H
>> +#define __DP_PLL_10NM_H
>> +
>> +#include "dp_pll.h"
>> +#include "dp_reg.h"
>> +
>> +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>> +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>> +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>> +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>> +
>> +#define NUM_DP_CLOCKS_MAX            6
>> +
>> +#define DP_PHY_PLL_POLL_SLEEP_US        500
>> +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>> +
>> +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>> +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>> +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>> +
>> +struct dp_pll_vco_clk {
>> +    struct clk_hw hw;
>> +    unsigned long    rate;        /* current vco rate */
>> +    u64        min_rate;    /* min vco rate */
>> +    u64        max_rate;    /* max vco rate */
>> +    void        *priv;
>> +};
>> +
>> +struct dp_pll_db {
> 
> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
> example, will use slightly different structure.
> 

Sure, it sounds good. I will give it try. Thanks!

>> +    struct msm_dp_pll *base;
>> +
>> +    int id;
>> +    struct platform_device *pdev;
>> +
>> +    /* private clocks: */
>> +    bool fixed_factor_clk[NUM_DP_CLOCKS_MAX];
>> +    struct clk_hw *hws[NUM_DP_CLOCKS_MAX];
> 
> Then these two fields can use exact number of clocks rather than
> NUM_DP_CLOCKS_MAX.
> 

I didn't get this. I think NUM_DP_CLOCKS_MAX is doing same?

>> +    u32 num_hws;
>> +
>> +    /* lane and orientation settings */
>> +    u8 lane_cnt;
>> +    u8 orientation;
>> +
>> +    /* COM PHY settings */
>> +    u32 hsclk_sel;
>> +    u32 dec_start_mode0;
>> +    u32 div_frac_start1_mode0;
>> +    u32 div_frac_start2_mode0;
>> +    u32 div_frac_start3_mode0;
>> +    u32 integloop_gain0_mode0;
>> +    u32 integloop_gain1_mode0;
>> +    u32 vco_tune_map;
>> +    u32 lock_cmp1_mode0;
>> +    u32 lock_cmp2_mode0;
>> +    u32 lock_cmp3_mode0;
>> +    u32 lock_cmp_en;
>> +
>> +    /* PHY vco divider */
>> +    u32 phy_vco_div;
>> +    /*
>> +     * Certain pll's needs to update the same vco rate after resume 
>> in
>> +     * suspend/resume scenario. Cached the vco rate for such plls.
>> +     */
>> +    unsigned long    vco_cached_rate;
>> +    u32        cached_cfg0;
>> +    u32        cached_cfg1;
>> +    u32        cached_outdiv;
>> +
>> +    uint32_t index;
>> +};
>> +
>> +static inline struct dp_pll_vco_clk *to_dp_vco_hw(struct clk_hw *hw)
>> +{
>> +    return container_of(hw, struct dp_pll_vco_clk, hw);
>> +}
>> +
>> +#define to_msm_dp_pll(vco) ((struct msm_dp_pll *)vco->priv)
>> +
>> +#define to_dp_pll_db(x)    ((struct dp_pll_db *)x->priv)
>> +
>> +int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
>> +                unsigned long parent_rate);
>> +unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
>> +                unsigned long parent_rate);
>> +long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
>> +                unsigned long *parent_rate);
>> +int dp_vco_prepare_10nm(struct clk_hw *hw);
>> +void dp_vco_unprepare_10nm(struct clk_hw *hw);
>> +
>> +int msm_dp_pll_10nm_init(struct msm_dp_pll *dp_pll, int id);
>> +void msm_dp_pll_10nm_deinit(struct msm_dp_pll *dp_pll);
> 
> These functions don't seem to be used outside of dp_pll_10nm. What
> about making them static?

I can't declare static to "init" and "deinit" as they are exported to 
dp_pll.c.
Rest of them I can move to dp_pll_10nm and then define static.

