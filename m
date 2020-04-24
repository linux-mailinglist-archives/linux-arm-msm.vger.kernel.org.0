Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797D71B7C21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 18:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgDXQsI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 12:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbgDXQsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 12:48:08 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9B3C09B046
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 09:48:07 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id w4so11006069ioc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jGR5b4CYjzj+dlNOrZUmUN+I+i/ahso5PtIAgCkta7I=;
        b=M00uHRusU+dXSuMJVALSpKV5JaUvdWHHIMqmbEMDoOB0IyqiK0+6uWbyRgp3NNoAmv
         6+TbsJeOswcbqspQs023mTIlEVc7rtNsKdieuRW7d36FE1oY3DSuPWdjon1I+cMNh16K
         Z/4+izNZe6sx32aYDXaIkXORoKOMlzZso7234=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jGR5b4CYjzj+dlNOrZUmUN+I+i/ahso5PtIAgCkta7I=;
        b=q5b1lv8B+TlRiKYv386GuQsPFtCKLeZaWGGieKsnhrlNh6aoiea+Z7RyMLy06iXd/k
         YrdZwDQ/2cXDLwV7jYvd7QdQTucOutrKUqu9oLBHV1jIP5av7N6VSHbym8NmfgFtIUrd
         keY84tfce+A/eWkXv/wBbTHxncK3vskGzuKZMcTFZxf53fBLGNnwBvHNGCNmfu46EJXA
         A4GZRpvedeHCpU08ZwVNiWf8VeqP3mZPiLeSzNvhg5KTS1b6GmwqUoXTtMsW5LmKc2Td
         wMrcTYnhyeZwSHRuHfe0+9kSnbBOTyVbmcwBG8ybncRN5Zh0BhZelv0zV59q1XlKNpCn
         fgtg==
X-Gm-Message-State: AGi0PuY7O1laNDDhgmf8gdcLt3/rzFww9bK+yFBuZNbGoPdudfJ/tgTH
        igD6heLIA3mcLQbUF2+/ys9EiaoXhlw=
X-Google-Smtp-Source: APiQypKpuROGliPApor3W4BN8T+Ez2yQ9kYbs5EcUF6V3eH2Lj6ZWBuJYp0XX9l2tVCkm+xH4gYsxg==
X-Received: by 2002:a02:cc91:: with SMTP id s17mr8660181jap.41.1587746886792;
        Fri, 24 Apr 2020 09:48:06 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id z86sm2237834ilk.79.2020.04.24.09.48.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 09:48:06 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id b18so9884543ilf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 09:48:06 -0700 (PDT)
X-Received: by 2002:a92:794f:: with SMTP id u76mr9662889ilc.269.1587746885633;
 Fri, 24 Apr 2020 09:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
 <20200422145408.v4.4.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid> <158769651085.135303.5206480555792176636@swboyd.mtv.corp.google.com>
In-Reply-To: <158769651085.135303.5206480555792176636@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Apr 2020 09:47:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFE6it066_EHe2wTNnCkRX30Tp0teehOCDRzU0dk=q4w@mail.gmail.com>
Message-ID: <CAD=FV=XFE6it066_EHe2wTNnCkRX30Tp0teehOCDRzU0dk=q4w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] soc: qcom: rpmh-rsc: Simplify locking by
 eliminating the per-TCS lock
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 7:48 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-04-22 14:55:02)
> > The rpmh-rsc code had both a driver-level lock (sometimes referred to
> > in comments as drv->lock) and a lock per-TCS.  The idea was supposed
> > to be that there would be times where you could get by with just
> > locking a TCS lock and therefor other RPMH users wouldn't be blocked.
> >
> > The above didn't work out so well.
> >
> > Looking at tcs_write() the bigger drv->lock was held for most of the
> > function anyway.  Only the __tcs_buffer_write() and
> > __tcs_set_trigger() calls were called without it the drv->lock.  It
>
> without holding the drv->lock
>
> > actually turns out that in tcs_write() we don't need to hold the
> > drv->lock for those function calls anyway even if the per-TCS lock
> > isn't there anymore.
>
> Why?

It's in the commit as comments, but I'll copy it here too for clarity.


> > Thus, from a tcs_write() point of view, the
> > per-TCS lock was useless.
> >
> > Looking at rpmh_rsc_write_ctrl_data(), only the per-TCS lock was held.
> > It turns out, though, that this function already needs to be called
> > with the equivalent of the drv->lock held anyway (we either need to
> > hold drv->lock as we will in a future patch or we need to know no
> > other CPUs could be running as happens today).  Specifically
> > rpmh_rsc_write_ctrl_data() might be writing to a TCS that has been
> > borrowed for writing an active transation but it never checks this.
> >
> > Let's eliminate this extra overhead and avoid possible AB BA locking
> > headaches.
> >
> > Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> > index e540e49fd61c..71cebe7fd452 100644
> > --- a/drivers/soc/qcom/rpmh-rsc.c
> > +++ b/drivers/soc/qcom/rpmh-rsc.c
> > @@ -581,24 +575,19 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
> >         if (IS_ERR(tcs))
> >                 return PTR_ERR(tcs);
> >
> > -       spin_lock_irqsave(&tcs->lock, flags);
> > -       spin_lock(&drv->lock);
> > +       spin_lock_irqsave(&drv->lock, flags);
> >         /*
> >          * The h/w does not like if we send a request to the same address,
> >          * when one is already in-flight or being processed.
> >          */
> >         ret = check_for_req_inflight(drv, tcs, msg);
> > -       if (ret) {
> > -               spin_unlock(&drv->lock);
> > -               goto done_write;
> > -       }
> > +       if (ret)
> > +               goto err;
>
> Nitpick: Usually 'goto err' is used for error paths, not unlock paths.
> Use 'goto unlock' for that.

I'm confused why this isn't an error path.  We're about to return a
non-zero value from the function (indicating an error) and we didn't
actually do the write.  Isn't this an error path?

In any case, "unlock" is fine with me so I'll change it, but maybe you
can help clarify so I don't make the same mistake next time.


> > -       tcs_id = find_free_tcs(tcs);
> > -       if (tcs_id < 0) {
> > -               ret = tcs_id;
> > -               spin_unlock(&drv->lock);
> > -               goto done_write;
> > -       }
> > +       ret = find_free_tcs(tcs);
> > +       if (ret < 0)
> > +               goto err;
> > +       tcs_id = ret;
> >
> >         tcs->req[tcs_id - tcs->offset] = msg;
> >         set_bit(tcs_id, drv->tcs_in_use);
> > @@ -612,13 +601,21 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
> >                 write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
> >                 enable_tcs_irq(drv, tcs_id, true);
> >         }
> > -       spin_unlock(&drv->lock);
> > +       spin_unlock_irqrestore(&drv->lock, flags);
> >
> > +       /*
> > +        * These two can be done after the lock is released because:
> > +        * - We marked "tcs_in_use" under lock.
> > +        * - Once "tcs_in_use" has been marked nobody else could be writing
> > +        *   to these registers until the interrupt goes off.
> > +        * - The interrupt can't go off until we trigger.
>
> trigger via some function?

I was referring to the __tcs_set_trigger() function call two lines
below.  I'll clarify.



> > +        */
> >         __tcs_buffer_write(drv, tcs_id, 0, msg);
> >         __tcs_set_trigger(drv, tcs_id, true);
> >
> > -done_write:
> > -       spin_unlock_irqrestore(&tcs->lock, flags);
> > +       return 0;
> > +err:
> > +       spin_unlock_irqrestore(&drv->lock, flags);
> >         return ret;
> >  }
> >
