Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB2E226FA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 22:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730175AbgGTUYP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 16:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728903AbgGTUYO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 16:24:14 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F33C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 13:24:14 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id j186so9185706vsd.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f8OZQPM5EHX3K0LcIbG7M5SK0hksxqYnwmQqH5pq9aU=;
        b=Vm+rTjwEti7KsrVH0G9zYwoD4ZvDR6asQnjKP0m5wquwlArH8wQZRdqCHpEs2vHPvD
         g75u4ABiQ/mstLqHDFM3kEjUdBRDLkaT+aHsmawJTSXH6qiC4UZtxnBplOeiU32rw9e6
         TVFHTnzR3EKkZyrNnb68WQkbezTZ8VZU5t++w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f8OZQPM5EHX3K0LcIbG7M5SK0hksxqYnwmQqH5pq9aU=;
        b=E1Ie3f+pEGQSqsgrn+fdV0Eqdps+qmbQeZdKFsLmvpoc+gcx5DJcf0jtk5OUPxxZG4
         y6Oa4y/mpGIm9TawOcEoTAVxgX+7rQ8Imll3lg21dCMNsWRWWamCkvD14jTCFOUgJxAf
         8+YrXQrYViG3wsHfE333tr4K71R/JsUC4OcoTrp4YWTtqXgIyLBvBj9QI6uwrnbztSVS
         WT3daVflbBgG6dLNFh4rMYx+A+qOtv9oVgyK+BIby05B+QAeIL3I7Sa7eYHQrS/s5Ggm
         rHSpdwXaKe4Z/XRxfPXI2SRcNA5ecPnNAydpckyoH6YI3OpXA2qvYCjkQ0Qsa+UDTd+z
         8x0g==
X-Gm-Message-State: AOAM533OYtxh8pgLMRQJuwaQxidQqo2JDaVG/BtQn6l9UVLFdg2t4zZ6
        We9Rbf0yPdrIuyGjdyEaknxHSxc0Edw=
X-Google-Smtp-Source: ABdhPJxcODhpa774A2haV3ODUVegBphMhV0Yg6XEScagpn/qrGIXq7hWx34gsZMAb9ppK7+rD3Qb2g==
X-Received: by 2002:a67:7792:: with SMTP id s140mr18083840vsc.139.1595276653525;
        Mon, 20 Jul 2020 13:24:13 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 73sm2844705vkw.13.2020.07.20.13.24.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2020 13:24:12 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id b77so9186773vsd.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 13:24:12 -0700 (PDT)
X-Received: by 2002:a05:6102:20a:: with SMTP id z10mr17445636vsp.213.1595276651995;
 Mon, 20 Jul 2020 13:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200716132120.1.I01e738cd469b61fc9b28b3ef1c6541a4f48b11bf@changeid>
In-Reply-To: <20200716132120.1.I01e738cd469b61fc9b28b3ef1c6541a4f48b11bf@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 20 Jul 2020 13:24:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WonUcENxsY_jnYdw3d5rS0OMmrDAoMsDwYRZbMwCkJdw@mail.gmail.com>
Message-ID: <CAD=FV=WonUcENxsY_jnYdw3d5rS0OMmrDAoMsDwYRZbMwCkJdw@mail.gmail.com>
Subject: Re: [PATCH] drm: panel: simple: Delay HPD checking on
 boe_nv133fhm_n61 for 15 ms
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Thu, Jul 16, 2020 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> On boe_nv133fhm_n62 (and presumably on boe_nv133fhm_n61) a scope shows
> a small spike on the HPD line right when you power the panel on.  The
> picture looks something like this:
>
>          +--------------------------------------
>          |
>          |
>          |
> Power ---+
>                                            +---
>                                            |
>               ++                           |
>          +----+|                           |
> HPD -----+     +---------------------------+
>
> So right when power is applied there's a little bump in HPD and then
> there's small spike right before it goes low.  The total time of the
> little bump plus the spike was measured on one panel as being 8 ms
> long.  The total time for the HPD to go high on the same panel was
> 51.2 ms, though the datasheet only promises it is < 200 ms.
>
> When asked about this glitch, BOE indicated that it was expected and
> persisted until the TCON has been initialized.
>
> If this was a real hotpluggable DP panel then this wouldn't matter a
> whole lot.  We'd debounce the HPD signal for a really long time and so
> the little blip wouldn't hurt.  However, this is not a hotpluggable DP
> panel and the the debouncing logic isn't needed and just shows down
> the time needed to get the display working.  This is why the code in
> panel_simple_prepare() doesn't do debouncing and just waits for HPD to
> go high once.  Unfortunately if we get unlucky and happen to poll the
> HPD line right at the spike we can try talking to the panel before
> it's ready.
>
> Let's handle this situation by putting in a 15 ms prepare delay and
> decreasing the "hpd absent delay" by 15 ms.  That means:
> * If you don't have HPD hooked up at all you've still got the
>   hardcoded 200 ms delay.
> * If you've got HPD hooked up you will always wait at least 15 ms
>   before checking HPD.  The only case where this could be bad is if
>   the panel is sharing a voltage rail with something else in the
>   system and was already turned on long before the panel came up.  In
>   such a case we'll be delaying 15 ms for no reason, but it's not a
>   huge delay and I don't see any other good solution to handle that
>   case.
>
> Even though the delay was measured as 8 ms, 15 ms was chosen to give a
> bit of margin.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I don't actually have a device in front of me that is exhibiting these
> problems.  I believe that it is only some devices and some of the
> time.  Still, this patch seems safe and seems likely to fix the issue
> given the scope shots.

Just to follow-up, I just heard that someone who had a panel
exhibiting this problem tried my patch and it fixed it for them.  :-)
So this is not such a shot in the dark anymore.

-Doug
