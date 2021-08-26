Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05263F8FB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 22:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243512AbhHZUhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 16:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhHZUhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 16:37:06 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BBCC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 13:36:18 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id u7so4612803ilk.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 13:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=of32+HsVJg8BjIpFCQkLFrsfUsAQLmJI9fq1/gQoEQc=;
        b=VZbC9LJdjvm7jBIyQ99wpnFBXRhf/RtavRPrmiWlpnBkMX5G2PEaCCDA0eZpnirKCK
         rYivpqDHjpUeYYuxVPPrkWyKbtMNCAR8T0WpQhagK1uWeMtJX+uXPlYF2ZPbRa0A29zC
         YImvafN9RqYP7O0dVpcGpMgKLCwbxPpZnMZ8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=of32+HsVJg8BjIpFCQkLFrsfUsAQLmJI9fq1/gQoEQc=;
        b=qtWt05abBs+ZG48QghcGVlIDa9EKV8ADXzpBrgcLDNSIZdR896T28Tpl0P24/FBAKK
         TuUSd3CjvvDx+9WqeO1I6nR7edGML8fTCvgyvdi8vX3ce27f9bC2LYvh0HpfFCZdtDyh
         tvdBTacsNBgBVvYcAfOZ2lLWb5xIbQ7e9LTqP+to1VyOLncSSQ9HJeQje/Qqk2flHPI2
         vpFUq29YVmyhkKzIskUNYMThBJQoUafbd6Ff/1IwNMrXvpuiPTZOYmcTyuyS0sEXmwz2
         JUBQEEpHyyoz4PB6SZgZK9vyGe79R3ug4TYI9CJVrSnov9C0pKi+qLK4VpbC01+4GehY
         br6Q==
X-Gm-Message-State: AOAM533Ntsu/59IwIqNWVq3MV5dgUU3msi96uuKilCKHXOyYY4lHq59N
        I6GKcqx8EkX7cqIVKQWZ/Eq173tx7P6CJw==
X-Google-Smtp-Source: ABdhPJyRkfWqSYy31niHw+ms4hWfOPSaclyloJJJGJZo/L06WHJbwCqZMZugmrW1sPE/v2DvyvSTGQ==
X-Received: by 2002:a05:6e02:12b3:: with SMTP id f19mr4153834ilr.234.1630010177753;
        Thu, 26 Aug 2021 13:36:17 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id e1sm2288947ils.76.2021.08.26.13.36.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 13:36:17 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id g8so4616059ilc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 13:36:16 -0700 (PDT)
X-Received: by 2002:a92:d304:: with SMTP id x4mr4140800ila.82.1630010176526;
 Thu, 26 Aug 2021 13:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org> <CAE-0n50HohAKisSSsNijcxgZGHdBgt=sQbLE3b7C87wPkLJ0cw@mail.gmail.com>
In-Reply-To: <CAE-0n50HohAKisSSsNijcxgZGHdBgt=sQbLE3b7C87wPkLJ0cw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 Aug 2021 13:36:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnkJqJnGHawyqNS5+p6miWd44zR7FPXZWgLk5vo9fOYQ@mail.gmail.com>
Message-ID: <CAD=FV=VnkJqJnGHawyqNS5+p6miWd44zR7FPXZWgLk5vo9fOYQ@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 25, 2021 at 6:31 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Bjorn Andersson (2021-07-26 16:13:51)
> > eDP panels might need some power sequencing and backlight management,
> > so make it possible to associate a drm_panel with a DP instance and
> > prepare and enable the panel accordingly.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > This solves my immediate problem on my 8cx laptops, of indirectly controlling
> > the backlight during DPMS. But my panel is powered when I boot it and as such I
> > get the hpd interrupt and I don't actually have to deal with a power on
> > sequence - so I'm posting this as an RFC, hoping to get some input on these
> > other aspects.
> >
> > If this is acceptable I'd be happy to write up an accompanying DT binding
> > change that marks port 2 of the DP controller's of_graph as a reference to the
> > attached panel.
>
> dianders@ mentioned creating a connector (and maybe a bridge) for the DP
> connector (not eDP)[1]. I'm not sure that's directly related, but I
> think with the aux bus code the panel isn't managed in the encoder
> driver. Instead the encoder sees a bridge and tries to power it up and
> then query things over the aux bus? It's all a little too fuzzy to me
> right now so I could be spewing nonsense but I think we want to take
> this bridge route if possible.
>
> -Stephen
>
> [1] https://lore.kernel.org/r/CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com/

The idea of modeling the connector as a bridge is something that makes
sense to me, but it probably makes sense to tackle that separately. We
don't need to block on it.

The whole DP AUX bus can also be tackled separately after the fact. It
really doesn't change things very much--we still have to find/attach
the panel. It just makes the panel probe in a slightly different way
and as a side effect gives the panel access to the DP AUX bus.

-Doug
