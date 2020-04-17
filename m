Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83601AE76E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 23:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgDQVRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 17:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgDQVRI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 17:17:08 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC5CC061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 14:17:07 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id p28so2066757vsg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 14:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iJ2fYj8faRnQWYU+YUvw2BuJTdJ8p/wj9zFiQhRecXY=;
        b=jg0aAF/VBOEowYu593EttCPIZkn+y5RfCCJA7A9me76IkPZAsRrbd0/T/gxbhJ/Nea
         tWQR2GXYK9vwBRwjMNG23L4vJh1oGHmRc2CjVNncy5RDzfuzEGb8ed+0x7qWLo5t/5OA
         YnhUhWAj1kNKyBGVtXGLHtwZuHxHlvy5ESOgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJ2fYj8faRnQWYU+YUvw2BuJTdJ8p/wj9zFiQhRecXY=;
        b=H97DqwR4dpQGQGLtE75Pm5ohPcVPktK9RZJgibS44jemVWz25MEe3FRuvK2N4iHbM5
         2finK4RLHTunoVHtngidf0lJ3RFACsbg1Ncw6NLvTipW1GfenWh5MfkX774VR4kWqYRG
         S6r/B4pnyO/qON30KrzbN6C79p1omz1pgdRpzqhdBkt+U44cnRqBkrWqGF03ln2NHtK7
         HeXHkjOPy21MGHQC+5OUccv68fBiN7sJt+4cndtdCF3vf9SpdRbwuA0hkVh4DFHorO30
         sW+WGvjtFW33MDIutnfiSkFnz918oEFdvC1q/un18ytzTuodQNxJNnC8n+kxwHYfedK+
         eFsg==
X-Gm-Message-State: AGi0PuYcq9YVdhNUDsw0SCWwBw9flxUfnxqv/p9e6rkehJYbztKhBi5I
        x+YZrpzkU0scmXoA7TyhNh9pUIkYfOc=
X-Google-Smtp-Source: APiQypKr3TMN0hRTmxpX3Pk1r0fTKHrlY8OkMWyU1y62oappGeP/2ySiip8YQddk8D6dugZHeCDh2A==
X-Received: by 2002:a67:a06:: with SMTP id 6mr4259873vsk.22.1587158226484;
        Fri, 17 Apr 2020 14:17:06 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id x25sm1975285vso.5.2020.04.17.14.17.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 14:17:05 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id j188so950455vkc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 14:17:05 -0700 (PDT)
X-Received: by 2002:a1f:5fc3:: with SMTP id t186mr4344481vkb.92.1587158224782;
 Fri, 17 Apr 2020 14:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <1586703004-13674-1-git-send-email-mkshah@codeaurora.org>
 <1586703004-13674-3-git-send-email-mkshah@codeaurora.org> <158708153779.132238.7823999141480422982@swboyd.mtv.corp.google.com>
In-Reply-To: <158708153779.132238.7823999141480422982@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Apr 2020 14:16:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WOwMrTNS7FK0jybJyEOvT-rHarA0m5U6B+pKoeA7RCHQ@mail.gmail.com>
Message-ID: <CAD=FV=WOwMrTNS7FK0jybJyEOvT-rHarA0m5U6B+pKoeA7RCHQ@mail.gmail.com>
Subject: Re: [PATCH v17 2/6] soc: qcom: rpmh: Update dirty flag only when data changes
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 16, 2020 at 4:59 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Maulik Shah (2020-04-12 07:50:00)
> > diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> > index eb0ded0..03630ae 100644
> > --- a/drivers/soc/qcom/rpmh.c
> > +++ b/drivers/soc/qcom/rpmh.c
> > @@ -133,26 +134,27 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
> >
> >         req->addr = cmd->addr;
> >         req->sleep_val = req->wake_val = UINT_MAX;
> > -       INIT_LIST_HEAD(&req->list);
> >         list_add_tail(&req->list, &ctrlr->cache);
> >
> >  existing:
> > +       old_sleep_val = req->sleep_val;
> > +       old_wake_val = req->wake_val;
> > +
> >         switch (state) {
> >         case RPMH_ACTIVE_ONLY_STATE:
> > -               if (req->sleep_val != UINT_MAX)
> > -                       req->wake_val = cmd->data;
> > -               break;
> >         case RPMH_WAKE_ONLY_STATE:
> >                 req->wake_val = cmd->data;
> >                 break;
> >         case RPMH_SLEEP_STATE:
> >                 req->sleep_val = cmd->data;
> >                 break;
> > -       default:
> > -               break;
> >         }
> >
> > -       ctrlr->dirty = true;
> > +       ctrlr->dirty = (req->sleep_val != old_sleep_val ||
> > +                       req->wake_val != old_wake_val) &&
> > +                       req->sleep_val != UINT_MAX &&
> > +                       req->wake_val != UINT_MAX;
>
> Can this change ctrl->dirty from true to false? I'm worried that we need
> to make this a saturating assignment instead of an assignment.
>
>         ctrl->dirty = ctrl->dirty || (req->sleep_val != .. );

This seems like a serious problem with the current code and feels like
we need a fix sooner rather than later.  I'm sorry I missed it in
review (and in fact, I probably suggested the exact code that's here
so it's even more my fault).  :(

I posted:

https://lore.kernel.org/r/20200417141531.1.Ia4b74158497213eabad7c3d474c50bfccb3f342e@changeid

-Doug
