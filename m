Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE4D1A8A0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 20:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504324AbgDNSqf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 14:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504322AbgDNSqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 14:46:33 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A877C061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 11:46:33 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id o3so661290vsd.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hm1Qks6SZ0yWu4P75XfFoZTXE4Nra+rfLYilmC4vdmU=;
        b=AskEzpYssKBaC+I8r9xjA/upQU03fey7fH06JRnjoVatycGcNwUujD+hfTF271zYY3
         LjnobQTSiBTpktVOcl+h3EILwuI8sCGjEqPFBGZ1b5w4ZJnfJ+SaoQpR5w56BJfu7UPp
         iHdwkGKCYF2HEvA47R3NTYI22vz2qYDlqXVdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hm1Qks6SZ0yWu4P75XfFoZTXE4Nra+rfLYilmC4vdmU=;
        b=YaDr0SzkKPLlIMcLCaosZzynN0ODSrFm4i6LSWfOEFloIbEYrh2/GyN231ZYtpq+EV
         jmPPQRw6asZjfxI1X2jfsj37GCLs4OJDWFN+6LP+7VZpTGu8RkIpNlzAWrfzF6dOAEbo
         3pHZjI5kxe0k27UTZ5PKd8UtaDNxaDLXEcgtBqNiCo9XmxMU6fjTEopEzDNpKA7EW0sD
         hiYxzhvYeFDqBhH079tRDC48bRWZ0zHB+L5eoY/ECHl1tSDfzEnNuJXBYDtGBqNh9qgF
         wkNIrG14OuHCZV3OzcwMeR3FguMzL0bLrNPwAzQa+m9nDy+W2sOwpjwgTzmpM9H7ztFU
         xYEQ==
X-Gm-Message-State: AGi0PuanbPMlL6TaAPqIfubARaDAdvJ4jc2WtT/5iJzB9veHCpoexqDw
        WQ778n/v11ETChvEX5qxKyzA/cnt6yM=
X-Google-Smtp-Source: APiQypIYD8HluHvpKsdGygvkIcDdk8XlWxFkqMwSu6DyJiZbg9rHxpWKTydbLFrhLP161RJgS1z4NA==
X-Received: by 2002:a05:6102:9c8:: with SMTP id g8mr1433897vsi.157.1586889991837;
        Tue, 14 Apr 2020 11:46:31 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 129sm3715932vso.31.2020.04.14.11.46.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 11:46:31 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id u11so635470vsu.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 11:46:31 -0700 (PDT)
X-Received: by 2002:a67:2b07:: with SMTP id r7mr1505045vsr.169.1586889990771;
 Tue, 14 Apr 2020 11:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200414104120.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
 <9c633ea161df91265a338aaa93a78443894c268f.camel@perches.com>
In-Reply-To: <9c633ea161df91265a338aaa93a78443894c268f.camel@perches.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 14 Apr 2020 11:46:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8Wci5cKPcfHQq-PjsexwLCjErnB63gF4_XgTBK9aWFQ@mail.gmail.com>
Message-ID: <CAD=FV=X8Wci5cKPcfHQq-PjsexwLCjErnB63gF4_XgTBK9aWFQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Factor "tcs_reg_addr" and
 "tcs_cmd_addr" calculation
To:     Joe Perches <joe@perches.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 14, 2020 at 10:58 AM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-04-14 at 10:41 -0700, Douglas Anderson wrote:
> > We can make some of the register access functions more readable by
> > factoring out the calculations a little bit.
>
> unrelated trivia:
>
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> []
> >  static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
> >                              u32 data)
> >  {
> > -     writel(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
> > +     writel(data, tcs_reg_addr(drv, reg, tcs_id));
> >       for (;;) {
> > -             if (data == readl(drv->tcs_base + reg +
> > -                               RSC_DRV_TCS_OFFSET * tcs_id))
> > +             if (data == readl(tcs_reg_addr(drv, reg, tcs_id)))
> >                       break;
> >               udelay(1);
> >       }
>
> There a lockup potential here.
>
> It might be better to use some max loop counter with
> an error/warning emitted instead of a continuous retry.

Yeah, I noticed that too but I assumed that it was probably OK.  I
think in this case it's really just confirming that the write made it
across the bus since it's checking the same bit that it's writing.
...but I wouldn't be opposed to this changing to use
readl_poll_timeout().

-Doug
