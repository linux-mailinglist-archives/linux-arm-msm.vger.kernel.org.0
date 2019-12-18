Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F290125710
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 23:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfLRWmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 17:42:13 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:45413 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRWmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 17:42:13 -0500
Received: by mail-il1-f193.google.com with SMTP id p8so3094548iln.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 14:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HUPNGjTxVnCf9t8O1v8YRvPP2CQXKG1MqWvD1p/QE64=;
        b=TmD8VqL0QC029L9QBQZU+bTfXvQswXjeDXnjiIOMPmWs4dhTEN5qRx+I8xn0raKeX5
         hDcIrNbJquXkV5ebv4aCtGwI9MCCjCz9e4PFwTXle0aKuGwqoYOwAbuQLaASjKA1sS1V
         uwICXiz1tyYXpX6mcKkbfEByYEPzD+Iorh3RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HUPNGjTxVnCf9t8O1v8YRvPP2CQXKG1MqWvD1p/QE64=;
        b=n3yfK8BGZmoY11U1npgZ0Y1gtCI5EUhRsuwOX98j+qZUD+FHw+plXouawNYrHrUEsl
         O5d4bQUjrfl0bwBMW2a53HrEpCm/V0TuIwxQjXZhZPZnAxFx0G3PEyZDiP10k/Dm97Hz
         7gXhrintApyhRqOdFdD4sivjt2GCmu994A0WiyNSLe88mYpaX1KuHKINC7xl8pv3idgL
         RsL2qptuAMPhTji8duX4xen/cQwOXTZNgsrzM1DFMxF0qKQ73+q6e2kQGkcbKiJ1Vjxy
         53c4IHxKXOdggynAFn3czrN/urhcixxhHwUd+PEsnQWvkemfHzLE13tvudcFkoZUbQIw
         AnVw==
X-Gm-Message-State: APjAAAVCzoQmZ4Wx/RaTEfp6MMVlo2D0Qar/KEeN9ijJPcyTtBFRzeSn
        TY81DhylWQZCaMdsXoFBw6vQrvQLh5s=
X-Google-Smtp-Source: APXvYqwK/BW8mkH/1dyt2PrDgxHwfEuH+txFdkJxNvHwz/My50X0QOj3DCYLRLC/YhDBpnRqdUakzw==
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr4404620ilq.192.1576708932223;
        Wed, 18 Dec 2019 14:42:12 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id y11sm751317iol.23.2019.12.18.14.42.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 14:42:10 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id x5so3124625ila.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 14:42:10 -0800 (PST)
X-Received: by 2002:a92:ca90:: with SMTP id t16mr3875343ilo.218.1576708930281;
 Wed, 18 Dec 2019 14:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20191218004741.102067-1-dianders@chromium.org>
 <20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
 <CAF6AEGs5CKNhKh_ZLUqWh8_2GxiDiuaTC2P-yzHqz+Dvhbp-VQ@mail.gmail.com> <CAF6AEGukOwr6TUmo3UySML5LWOC-b7vN4NwJv0OGprFafgTdEw@mail.gmail.com>
In-Reply-To: <CAF6AEGukOwr6TUmo3UySML5LWOC-b7vN4NwJv0OGprFafgTdEw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Dec 2019 14:41:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UqFYAoyxaAF4B768j-SeZOp71=Cq84s61W3s8BB7TO+w@mail.gmail.com>
Message-ID: <CAD=FV=UqFYAoyxaAF4B768j-SeZOp71=Cq84s61W3s8BB7TO+w@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] drm/bridge: ti-sn65dsi86: Avoid invalid rates
To:     Rob Clark <robdclark@gmail.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 17, 2019 at 8:03 PM Rob Clark <robdclark@gmail.com> wrote:
>
> > > +               for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
> > > +                       rate_times_200khz = le16_to_cpu(sink_rates[i]);
> > > +
> > > +                       if (!rate_times_200khz)
> > > +                               break;
> > > +
> > > +                       switch (rate_times_200khz) {
> > > +                       case 27000:
> >
> > maybe a bit bike-sheddy, but I kinda prefer to use traditional normal
> > units, ie. just multiply the returned value by 200 and adjust the
> > switch case values.  At least then they match the values in the lut
> > (other than khz vs mhz), which makes this whole logic a bit more
> > obvious... and at that point, maybe just loop over the lut table?
>
> (hit SEND too soon)
>
> and other than that, lgtm but haven't had a chance to test it yet
> (although I guess none of us have an eDP 1.4+ screen so maybe that is
> moot :-))

I think v3 should look much better to you.  I also added a note to the
commit log indicating that the DP 1.4 patch was only tested via
hackery...

https://lore.kernel.org/r/20191218143416.v3.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid

-Doug
