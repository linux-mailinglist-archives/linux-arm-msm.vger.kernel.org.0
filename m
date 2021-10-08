Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25D3426198
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhJHBM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbhJHBMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:12:55 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408B3C061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:11:01 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id s4so17434507ybs.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fu1qbb9TIftGGLiopDIHJNKJDVey9e03m26BW4nVQKw=;
        b=Po56gcNdg4y0ShSFya7iIGBaaYp8lJIgoWK2sKkC2odnhSdrhLke32eYYchYWX3zz+
         Nm+/wq0ok2Zr5dKDvEpdJYix/07lkxeuSx0249JyESbN5Xlr5CvvlEpFo9YwzyBq4Zq4
         1PQnUlPIfYnZ2LBNy7px4RtIpECNMUR89AfE/U1pJLC6OaPFz9abQjsmmjE/j997mdbB
         lGGZXG8PwWP30MjktBdRJYtUrcKJafkHtsB/3XYpV5m82PgtMgNDuMRTMqnqWUCe9t3U
         54SSiScQ9DFOj6TFDreDNUcuEGJS1Lbudtab9yqFIoMbpb/qDs2KFo0pJm+ezMpmEAkN
         nFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fu1qbb9TIftGGLiopDIHJNKJDVey9e03m26BW4nVQKw=;
        b=cWsitReaojqSafLYtSk+m9zS5ikI3X36vCJhyrRK1HWXO7IV8/izJWwwD0wLYh0Ngw
         NH6lwdgyEPGXMmGSP1ZUGjpJQ08cwvq5WrQS5puVJ48Zf1PD3ESqbmUvxrE9uGgHpAyn
         aPMkHu19q+CnLk/ObN0CWLNvYYcqg+n76L9dY5oGqB5H8g0CNDaYINaBzYnryFHDNKco
         j1CSyk3dqEd4P+w4xqCSmvTpurX/NipNRcGaFIlnqbdOw18E/Cj7sWCgflI4QPHfTLr/
         MhhhTd4r1A1ixri2zq6/vZCvHaqJRPhGaBfEjEhyr7CP8p1GFJiN1pe/5UoVyHNSkRGv
         lfWw==
X-Gm-Message-State: AOAM530Ah+NJWSjTyy4m3MF6ukqpNHuhq59ct4wS8rsAZC3bxZItE/Gd
        u04kycw1r8cTCF6mDvv3YCQQzPlki93EdXcU6mAPzw==
X-Google-Smtp-Source: ABdhPJzRqmpc7ZCLtvfPCPlOJuwh7NKrbymtx/f5NZk8E50MzwzoBQeCzV16ElGWYbGopGOusWI0XFQieBWdHv96j04=
X-Received: by 2002:a25:bd93:: with SMTP id f19mr285693ybh.23.1633655460310;
 Thu, 07 Oct 2021 18:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211006193819.2654854-1-swboyd@chromium.org> <20211006193819.2654854-3-swboyd@chromium.org>
 <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
 <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com> <CAE-0n532XYgT=dTTCyLcwikvxgUyGi=TcybDh=v3wQTNb=wqyw@mail.gmail.com>
In-Reply-To: <CAE-0n532XYgT=dTTCyLcwikvxgUyGi=TcybDh=v3wQTNb=wqyw@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 7 Oct 2021 18:10:24 -0700
Message-ID: <CAGETcx_0GRg7u3dAxP9u0qO-hfJ0N3V44CGLwFFX1kVxZ00g+w@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] component: Introduce the aggregate bus_type
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 7, 2021 at 1:11 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Stephen Boyd (2021-10-07 11:40:07)
> > Quoting Saravana Kannan (2021-10-06 20:07:11)
> > > On Wed, Oct 6, 2021 at 12:38 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > diff --git a/drivers/base/component.c b/drivers/base/component.c
> > > > index 0a41bbe14981..d99e99cabb99 100644
> > > > --- a/drivers/base/component.c
> > > > +++ b/drivers/base/component.c
> > [...]
> > > > +                       continue;
> > > > +
> > > > +               /* Matches put in component_del() */
> > > > +               get_device(&adev->dev);
> > > > +               c->link = device_link_add(&adev->dev, c->dev,
> > > > +                                         DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> > >
> > > Remove the STATELESS flag and you'll get a bunch of other stuff done for free:
> >
> > I tried that and it didn't work for me. The aggregate device never
> > probed and I was left with no display. Let me see if I can reproduce it
> > with logging to provide more details.
>
> This patch fixes it (whitespace damaged sorry).

Not sure why you have to trigger an explicit rescan, but instead of
this patch below, you could also try setting this flag instead?
DL_FLAG_AUTOPROBE_CONSUMER

-Saravana

>
> ----8<----
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index 65042c9f8a42..43cac9ed70b7 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -202,7 +202,7 @@ static int find_components(struct aggregate_device *adev)
>                 /* Matches put in component_del() */
>                 get_device(&adev->dev);
>                 c->link = device_link_add(&adev->dev, c->dev,
> -                                         DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +                                         DL_FLAG_PM_RUNTIME);
>                 c->adev = adev;
>         }
>
> @@ -749,7 +749,9 @@ static int __component_add(struct device *dev,
> const struct component_ops *ops,
>         mutex_unlock(&component_mutex);
>
>         /* Try to bind */
> -       return bus_rescan_devices(&aggregate_bus_type);
> +       bus_rescan_devices(&aggregate_bus_type);
> +
> +       return 0;
>  }
>
>  /**
>
>
> The important part is ignoring the return value of bus_rescan_devices().
> It's a cycle problem. The last component is probing and calling
> component_add() in its probe function. The call to component_add() is
> trying to probe the aggregate device now that all components are added.
> But when it tries to probe the aggregate device it sees that a supplier,
> which is this component calling compnent_add(), hasn't been probed yet,
> so it returns -EPROBE_DEFER. That is passed up to the component and it
> defers probe.
>
> I don't think the component device cares at all about the aggregate
> device being able to probe or not. We should be able to ignore the
> return value of bus_rescan_devices() in component_add(). I'll add a
> comment to the code here so it's more obvious.
