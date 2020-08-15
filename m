Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711B424524A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Aug 2020 23:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgHOVpq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Aug 2020 17:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgHOVpn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Aug 2020 17:45:43 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA00C0045B9;
        Sat, 15 Aug 2020 13:19:50 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 9so10130319wmj.5;
        Sat, 15 Aug 2020 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zIzNxA4BRTbs45wz2IBTfdONSpn/S4dV1mOfjSjFesQ=;
        b=jE3b9gKVGX5Fk2XQYlJoQ9uC/GrRVyBZX0DJDN3AJAxFJULHvvIK2ex9pvr+pWVW6X
         LAWRom/Q6eGx5wTFkQlktCzOrPNhzZe8gzqy3MqtZPJHCAiANJNEqJ0+S5XkpNNE8wF+
         Wj8zHZ3ogrzsnKSIzaGROnT3CG1Ex/QgqY8omexs3fKkR6brl1sorYPZBV7smPDL/i0O
         BlTZe8jkjajnVX8J7XlB/Ba3+EXRCUisSGzot3/9ui6Qvqs1HLvdSjDqRKaz3sWe6WtU
         lginAKDasczM0r5brn7c0fg6LVFVMjUdOMagynJngPDA9icPpat9jIBAKlyjyWpRAFDm
         UDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zIzNxA4BRTbs45wz2IBTfdONSpn/S4dV1mOfjSjFesQ=;
        b=hroFIjWVC49WSCczv3jUJwcHI48AwHad776NJ/eSdYjeaTzXwewlqi6Q+513avOHez
         6A2D0DpokAb8NiNxjIgxzAXIpvSxH2HrE8f5HvJ/dAd20vXZo9Gy2lyNLEMrjHJ4+UvN
         lTtyFERjRmLWX8gqatz+eWSrY4B3JTDOgqDr0gZ6yPRiM+M5kUsMr9kv00aqO5E5AWbz
         JWAuESZvE2SLlxhQCUHMBPR/83RyO41V1NKEgJ66nfXkqVYpGHudiruyzlBZtUIA5RVf
         LDbeGw3AYZ9njmO3C1Lz6innsRaF97m2aSePOtn8vDfoW2KQ5c843hChr15iIN9CXwEO
         KmMA==
X-Gm-Message-State: AOAM530bbT+eQwmO2j/W0I5uSqUrytjtQplJ9NmBshEFhm8ZL5zRG3an
        gu/ikh+kkhR+HSXOPEgTajR/5w6K6fbvfbIBUQ0=
X-Google-Smtp-Source: ABdhPJyrGCbvhPVezyVJPPQnDejn5AGE+M7MmxTTrCOoiHRMgdeH5nxJu5TAlm48/n6OtYNzlDFZP/YcRo0XSEVEupY=
X-Received: by 2002:a1c:e919:: with SMTP id q25mr7743939wmc.123.1597522787277;
 Sat, 15 Aug 2020 13:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200812044223.19279-1-tanmay@codeaurora.org> <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
In-Reply-To: <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 15 Aug 2020 13:20:35 -0700
Message-ID: <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
Subject: Re: [PATCH v10 3/5] drm/msm/dp: add support for DP PLL driver
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, aravindh@codeaurora.org,
        Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 14, 2020 at 10:05 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
>
> On 12/08/2020 07:42, Tanmay Shah wrote:
>  > From: Chandan Uddaraju <chandanu@codeaurora.org>
>  >
>  > Add the needed DP PLL specific files to support
>  > display port interface on msm targets.
>
> [skipped]
>
>  > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h
> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>  > new file mode 100644
>  > index 000000000000..475ba6ed59ab
>  > --- /dev/null
>  > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>  > @@ -0,0 +1,98 @@
>  > +/* SPDX-License-Identifier: GPL-2.0-only */
>  > +/*
>  > + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
>  > + */
>  > +
>  > +#ifndef __DP_PLL_10NM_H
>  > +#define __DP_PLL_10NM_H
>  > +
>  > +#include "dp_pll.h"
>  > +#include "dp_reg.h"
>  > +
>  > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>  > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>  > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>  > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>  > +
>  > +#define NUM_DP_CLOCKS_MAX            6
>  > +
>  > +#define DP_PHY_PLL_POLL_SLEEP_US        500
>  > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>  > +
>  > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>  > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>  > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>  > +
>  > +struct dp_pll_vco_clk {
>  > +    struct clk_hw hw;
>  > +    unsigned long    rate;        /* current vco rate */
>  > +    u64        min_rate;    /* min vco rate */
>  > +    u64        max_rate;    /* max vco rate */
>  > +    void        *priv;
>  > +};
>  > +
>  > +struct dp_pll_db {
>
> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
> example, will use slightly different structure.

Note that sboyd has a WIP series to move all of the pll code out to a
phy driver.  If there is work already happening on 7nm support, it
might be better to go with the separate phy driver approach?  I'm
still a bit undecided about whether to land the dp code initially with
the pll stuff in drm, and then continue refactoring to move to
separate phy driver upstream, or to strip out the pll code from the
beginning.  If you/someone is working on 7nm support, then feedback
about which approach is easier is welcome.

https://lore.kernel.org/dri-devel/20200611091919.108018-1-swboyd@chromium.org/

BR,
-R
