Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C1F245216
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Aug 2020 23:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgHOVkv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Aug 2020 17:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgHOVkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Aug 2020 17:40:42 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004C9C03D1CA
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2020 14:21:38 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id cs12so6015300qvb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2020 14:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fSOWg6njAo0BgaYAkW3ZI1XqUj8alLoYvs3NDMkiQSk=;
        b=fNTr1AP6oXI+Z+vP9W7aopVeB8HKDdHLOWptbwzZzf+/9o4e6mmG8uiZAHNv0y6lWd
         TKsz9faMxGXvwuzoRbAnGOoIYbSJyPMXzOYEK+lV18IhjpncKwKwQ3qgtQx489VgvIIk
         bV8k8/td6zymhZdtoNTI/s85alwGZlxlKuuoKwfX0YLKhauRO7OAsvZGQxy4H9HiK/gF
         om936XsMh9eYx5rV9G0o0B0JDW/Vi+f0NAamfu92QrPofwUL+C6vZgSUQrFzekLMBsX4
         ECmKIQqHJ2Hr8gzkvG86aMVtpLDQCrCp5oL8QoB4sXL8MIRRVeRLoVQl20//6oJwB7TZ
         Mu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fSOWg6njAo0BgaYAkW3ZI1XqUj8alLoYvs3NDMkiQSk=;
        b=oj8fZb3gQ6V6z9oQHRxxMGMrxg6E9TUiJmpeQArkNFq1LST9ps5BO9Mumi2DieYOe8
         Eu2+U5fGJRW8rIqrEX/22VzrCzr99Wp03V1s4ZrPsl4MHJCMaS9KhMxn8fE7WHCAZvjr
         O91s3Bx+dzH2ipQdTPKTQa730AEt6AplkFj4K8YYcJrn1i8rD/U+xpbW14Ed5e69//FM
         5WFYHi5NAoSu+zPY/FoSiUAUylI9n7x9z688mtbkztTQH7etwue5p7HY6raLqq11jCIW
         b/0wHm7KzWFatkGEnAoOFEEfkFfNuHnnYd/rjfVNVX5n62IA028cDEprOojGmDhJgT2n
         oDxw==
X-Gm-Message-State: AOAM531whTY5GWAxKGVKizyXBn6dQM3jK17hbICJcS8VyPcdxLKyC1Vn
        PDPJDq6TPl3Z2eq4unkHlqwtjg==
X-Google-Smtp-Source: ABdhPJx3XPsMq4FB0tV42kjhPB8zgg9seOaawRnu+HoLIebEV0cYDDmb+NOgtyoCPkyOwqIgewXCog==
X-Received: by 2002:a0c:ea30:: with SMTP id t16mr8572128qvp.177.1597526497539;
        Sat, 15 Aug 2020 14:21:37 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 73sm2825144qtf.74.2020.08.15.14.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2020 14:21:37 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v10 3/5] drm/msm/dp: add support for DP PLL
 driver
To:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <1ea81fa2-1dc8-a0b9-aa32-3127e9354be2@marek.ca>
Date:   Sat, 15 Aug 2020 17:21:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/15/20 4:20 PM, Rob Clark wrote:
> On Fri, Aug 14, 2020 at 10:05 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>>
>> On 12/08/2020 07:42, Tanmay Shah wrote:
>>   > From: Chandan Uddaraju <chandanu@codeaurora.org>
>>   >
>>   > Add the needed DP PLL specific files to support
>>   > display port interface on msm targets.
>>
>> [skipped]
>>
>>   > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h
>> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>   > new file mode 100644
>>   > index 000000000000..475ba6ed59ab
>>   > --- /dev/null
>>   > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>>   > @@ -0,0 +1,98 @@
>>   > +/* SPDX-License-Identifier: GPL-2.0-only */
>>   > +/*
>>   > + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
>>   > + */
>>   > +
>>   > +#ifndef __DP_PLL_10NM_H
>>   > +#define __DP_PLL_10NM_H
>>   > +
>>   > +#include "dp_pll.h"
>>   > +#include "dp_reg.h"
>>   > +
>>   > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>>   > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>>   > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>>   > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>>   > +
>>   > +#define NUM_DP_CLOCKS_MAX            6
>>   > +
>>   > +#define DP_PHY_PLL_POLL_SLEEP_US        500
>>   > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>>   > +
>>   > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>>   > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>>   > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>>   > +
>>   > +struct dp_pll_vco_clk {
>>   > +    struct clk_hw hw;
>>   > +    unsigned long    rate;        /* current vco rate */
>>   > +    u64        min_rate;    /* min vco rate */
>>   > +    u64        max_rate;    /* max vco rate */
>>   > +    void        *priv;
>>   > +};
>>   > +
>>   > +struct dp_pll_db {
>>
>> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
>> example, will use slightly different structure.
> 
> Note that sboyd has a WIP series to move all of the pll code out to a
> phy driver.  If there is work already happening on 7nm support, it
> might be better to go with the separate phy driver approach?  I'm
> still a bit undecided about whether to land the dp code initially with
> the pll stuff in drm, and then continue refactoring to move to
> separate phy driver upstream, or to strip out the pll code from the
> beginning.  If you/someone is working on 7nm support, then feedback
> about which approach is easier is welcome.
> 
> https://lore.kernel.org/dri-devel/20200611091919.108018-1-swboyd@chromium.org/
> 

I have a sm8150/sm8250 (7nm) upstream kernel stack with DP enabled, and 
I have done something similar, with the PLL driver in the QMP phy, 
although not based on sboyd's series (along with some typec changes to 
negotiate the DP alt mode and get HPD events, etc.). I don't think 
having PLL in drm/msm makes sense, the drm/msm DP driver shouldn't need 
to be aware of the DP PLL/PHY driver, it only needs to set the 
link/pixel clock rates which are in dispcc (and those then have the PLL 
clocks as a parent).

FYI, since it sounds you are considering landing this: it is completely 
broken, for example:
- ioremap()'s to #define'd addresses in the PLL driver
- main DP driver reading/writing to registers in the PHY region, but 
getting the base address from devicetree was removed since earlier 
revisions, so it just fails completely. Look at usb3_dp_com (for 
example), which in dp_catalog_ctrl_usb_reset() would be used to 
overwrite registers already being driven by the qmp phy driver - but now 
the usb3_dp_com.base is never initialized.

-Jonathan

> BR,
> -R
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
> 
