Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622D924781E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 22:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgHQUcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 16:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgHQUcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 16:32:42 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD4EC061389
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 13:32:41 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x24so9028411lfe.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7UUf0GtAjcXwxOClmWoxhw8w0tZ2fKlaVkQ/G18ibVU=;
        b=iH7PhF6apID8HfRTQnm3TdWrTVotIcsjPuMHYU94rvbYK1XlWosHk5t9pMpmA1/1/z
         fsKRmhHp8CZXk0QMciJmQggvYwNDrbIb7uH6HEhWqjWs0tQCg6CXKnTSNhOhGPSLlrwI
         TYiagBbt8DNdYYgzHYPoFGtEoOrvl6yXoClkDfehLC1p6auV8GaFy8dYm35GdRXPEUTo
         0o358WxmOte7Topcgo8aiRo5mjOxwUX1/WO26sPEqxAw/zRNCHJ1JoMFFFWhls0Bms7h
         Izs3xpbSArKjRVI5yhwWvGAh8MI9xC3S0xMtJD+WQ2oPcLJsTiqoZQYoaabA6ZwuwTFh
         NcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7UUf0GtAjcXwxOClmWoxhw8w0tZ2fKlaVkQ/G18ibVU=;
        b=HJQmlb/fFTjgOT5ulQ4SqjoGF5Doi1XbGcMQxnrMcvGfjv3IQfvg9O/x8ypbKE2ZPY
         CSHzYIsz4GRdFj0txQbcxSRE42ZUDKwWELehKn5IsrOWpbF3y7yOU4+f4dYniuHQw24n
         ISabXNmhsSbCOQc8K6npRt+7aPNqvl1KFrO01SLPBrIucVTixIq269WVbqFx6Naf0e/g
         9orYSvNhAqeZonEgZcSzGfKkraRQVAc4pmGz05tpIlB3EHd2CWt3H+OIOJuFpzBpl12N
         bSNSRSdmH0uzMW0oYAZzusGTtFjJsNxsvnBGryFjsDNg7Qh2ynTP728D6Xnve9gahEEo
         MD6w==
X-Gm-Message-State: AOAM530VyJ1KpnjN9DRiigwZQH6JKTwt/q3i/Xs6CVu9tGj1V/2Ea54Z
        Zo9B0XmfgXgdhOpgBXwZbH8l5g==
X-Google-Smtp-Source: ABdhPJwEGamNpOT3Eoy9QL+rlpLKGVgC7rS5VILfXtBOezTtOyz1RLer7bdp602XAU66grZpU0Dp8w==
X-Received: by 2002:a19:803:: with SMTP id 3mr8181127lfi.15.1597696360059;
        Mon, 17 Aug 2020 13:32:40 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.65.254])
        by smtp.gmail.com with ESMTPSA id p1sm5278763lji.93.2020.08.17.13.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 13:32:39 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v10 3/5] drm/msm/dp: add support for DP PLL
 driver
To:     Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
 <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
 <1ea81fa2-1dc8-a0b9-aa32-3127e9354be2@marek.ca>
 <CAF6AEGt+NV-T7Qo_-gLM981QBWy3865Vbj518sd-4XQJccX_WA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d67ffcd6-b10c-92a4-55a7-40521b3be68f@linaro.org>
Date:   Mon, 17 Aug 2020 23:32:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGt+NV-T7Qo_-gLM981QBWy3865Vbj518sd-4XQJccX_WA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/08/2020 01:45, Rob Clark wrote:
> On Sat, Aug 15, 2020 at 2:21 PM Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> On 8/15/20 4:20 PM, Rob Clark wrote:
>>> On Fri, Aug 14, 2020 at 10:05 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>>
>>>> On 12/08/2020 07:42, Tanmay Shah wrote:
>>>>    > From: Chandan Uddaraju <chandanu@codeaurora.org>
>>>>    >
>>>>    > Add the needed DP PLL specific files to support
>>>>    > display port interface on msm targets.
>>>>
>>>> [skipped]
>>>>
>>>>    > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>>> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>>>    > new file mode 100644
>>>>    > index 000000000000..475ba6ed59ab
>>>>    > --- /dev/null
>>>>    > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>>>    > @@ -0,0 +1,98 @@
>>>>    > +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>    > +/*
>>>>    > + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
>>>>    > + */
>>>>    > +
>>>>    > +#ifndef __DP_PLL_10NM_H
>>>>    > +#define __DP_PLL_10NM_H
>>>>    > +
>>>>    > +#include "dp_pll.h"
>>>>    > +#include "dp_reg.h"
>>>>    > +
>>>>    > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>>>>    > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>>>>    > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>>>>    > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>>>>    > +
>>>>    > +#define NUM_DP_CLOCKS_MAX            6
>>>>    > +
>>>>    > +#define DP_PHY_PLL_POLL_SLEEP_US        500
>>>>    > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>>>>    > +
>>>>    > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>>>>    > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>>>>    > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>>>>    > +
>>>>    > +struct dp_pll_vco_clk {
>>>>    > +    struct clk_hw hw;
>>>>    > +    unsigned long    rate;        /* current vco rate */
>>>>    > +    u64        min_rate;    /* min vco rate */
>>>>    > +    u64        max_rate;    /* max vco rate */
>>>>    > +    void        *priv;
>>>>    > +};
>>>>    > +
>>>>    > +struct dp_pll_db {
>>>>
>>>> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
>>>> example, will use slightly different structure.
>>>
>>> Note that sboyd has a WIP series to move all of the pll code out to a
>>> phy driver.  If there is work already happening on 7nm support, it
>>> might be better to go with the separate phy driver approach?  I'm
>>> still a bit undecided about whether to land the dp code initially with
>>> the pll stuff in drm, and then continue refactoring to move to
>>> separate phy driver upstream, or to strip out the pll code from the
>>> beginning.  If you/someone is working on 7nm support, then feedback
>>> about which approach is easier is welcome.
>>>
>>> https://lore.kernel.org/dri-devel/20200611091919.108018-1-swboyd@chromium.org/
>>>
>>
>> I have a sm8150/sm8250 (7nm) upstream kernel stack with DP enabled, and
>> I have done something similar, with the PLL driver in the QMP phy,
>> although not based on sboyd's series (along with some typec changes to
>> negotiate the DP alt mode and get HPD events, etc.). I don't think
>> having PLL in drm/msm makes sense, the drm/msm DP driver shouldn't need
>> to be aware of the DP PLL/PHY driver, it only needs to set the
>> link/pixel clock rates which are in dispcc (and those then have the PLL
>> clocks as a parent).
> 
> yeah, in the dp case, having phy split out makes a ton of sense.. it
> would maybe be a nice cleanup in other cases (dsi, hdmi) but the
> combination of usb+dp makes burying this in drm not so great..
> 
> It would be good if you could work w/ sboyd on this.. based on what
> I've seen on previous gens, it is probably a different phy driver for
> 7nm vs 10nm, but I think where we want to end up upstream is with phy
> split out of drm.

7nm differs in registers programming, so it would end up with a separate 
set of tables in qmp phy driver. There is also a 14nm version of dp phy, 
but I don't know if it usable in any actual hardware design.


-- 
With best wishes
Dmitry
