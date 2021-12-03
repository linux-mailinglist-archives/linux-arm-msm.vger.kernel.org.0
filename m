Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBA2467568
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 11:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379971AbhLCKrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 05:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380066AbhLCKqx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 05:46:53 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147F6C06173E
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Dec 2021 02:43:30 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 19ABC1F46D95
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638528208; bh=WUBJRgLM2F5oy5U+VZl9DuizW7Zi+p+f5wG0zt07v3w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WZE8crQNC1qsEpZayM3SiQ1G4Ue5i+9h1RU+mcAoGzhNODdWxGCy1YwJlIp2gcUFC
         oI14ojwEHckgOWK9TUEXo4qQH1nThAv8tp0J09KSJXVQaTDxAaP0WGljikZCm6RA8A
         BJUQBIXhxn9Dy2q+YonuL/kCEpdDe+d/65Rhcj4HxTlK1h7lF+ShJqZhqlc29OC1b6
         2H0WjqN/6oQbdAh25faUBx4URJctsh1OcAy4nHBTx8BJJX/dDyD/xYOe4EECqn/OML
         GS8tPOy7oQTdUYQ0LNPGKqtlESSwHiamZUdp6U+1CCgBE07dhTll9rypX7A675j+48
         UZXHD3p6y97ow==
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20211201105210.24970-3-angelogioacchino.delregno@collabora.com>
 <20211201202023.2313971-1-dmitry.baryshkov@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <21fe6cf4-3cef-91e1-7bf7-b94ac223e7c5@collabora.com>
Date:   Fri, 3 Dec 2021 11:43:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211201202023.2313971-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 01/12/21 21:20, Dmitry Baryshkov ha scritto:
> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
> DSI host gets initialized earlier, but this caused unability to probe
> the entire stack of components because they all depend on interrupts
> coming from the main `mdss` node (mdp5, or dpu1).
> 
> To fix this issue, move mdss device initialization (which include irq
> domain setup) to msm_mdev_probe() time, as to make sure that the
> interrupt controller is available before dsi and/or other components try
> to initialize, finally satisfying the dependency.
> 
> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
> Co-Developed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> When checking your patch, I noticed that IRQ domain is created before
> respective MDSS clocks are enabled. This does not look like causing any
> issues at this time, but it did not look good. So I started moving
> clocks parsing to early_init() callbacks. And at some point it looked
> like we can drop the init()/destroy() callbacks in favour of
> early_init() and remove(). Which promted me to move init()/destroy() in
> place of early_init()/remove() with few minor fixes here and there.
> 


Hey Dmitry,
I wanted to make the least amount of changes to Rob's logic... I know that
the clocks aren't up before registering the domain, but my logic was implying
that if the handlers aren't registered, then there's no interrupt coming, hence
no risk of getting issues. Same if the hardware is down, you can't get any
interrupt, because it can't generate any (but if bootloader leaves it up.. eh.)

I recognize that such approach is "fragile enough", lastly, I agree with this
patch which is, in the end, something that is in the middle between my first
and last approach.

I've tested this one on trogdor-lazor-limozeen and seems to be working in an
analogous way to my v2/v3, so on my side it's validated.


Let's go for this one!
How do we proceeed now? Are you sending a new series with the new patches, or
should I?

Also, I don't think this is relevant, since I'm in co-dev, but in case it is:
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: Sorry for the 1-day delay, got busy with other tasks!
