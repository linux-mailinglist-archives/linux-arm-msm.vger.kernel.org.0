Return-Path: <linux-arm-msm+bounces-11725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DBB85AA22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 18:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01E61C216C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 17:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B89B45BE0;
	Mon, 19 Feb 2024 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3wDk2C5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3552E416
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708364512; cv=none; b=SmF3zMKyjZUDbZkrUCp1AU/T89cihbH+SoDhnW6UohCvxKNIhFzYG9hdHHX5qvEzkjY2Yc2SA7chNi4GEDRDE7A715e3cBbsRUzbcKvzZp1G0PnwDggYEIudsc1nRCAgMcZ7Vc8vI3HCxISyWP5HjZkLvIm6yEzM8dC16yeX4Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708364512; c=relaxed/simple;
	bh=679zUDpN6QOBZs8mfOsDKqbdb4UNHtj7fdB7M/jDYbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmuoPxaRK+NF5/kolQzQArvQP48JBUe7GCgF9IDnLtots8gvut7aMbbreIzvYPIstgbzXZjUHT4mTnRffRpoKEpjqt2QoLZJtIgGbC0CszrjWWn7rANj6JRn4Rmx0w9XQoQDdD3JAgCfiLr4ZU8gGjUh89n2ltZH/+FSXsbRL0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3wDk2C5; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db3a09e96daso3769721276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 09:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708364509; x=1708969309; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpbxXvCSubVl6XgXjNWjfYRG3//u4L72+hbwdG6Aw+g=;
        b=C3wDk2C5g25Q3u89OgrmqU+nsHkT903jviWJkjvJhord6SxHMBLaqLyCHsg8yxDmk3
         3zTMzc2A4p6JPyFXAN83STdKgfBlzcgx6KvmT6E5ZUVRdhIS6GXNO870kxVvobzjG9Jc
         XC2FxSRIo+8qo9PnBN/dvKIa5zoe9e6Ymqo4hvIJ602XbhyqYN5PxyvRFFLOsWZ63Q7R
         hwgtWtyfSVjlVO0+l8AmhDZpQbX7i6jgPkJdkeDBVvpuoH373G9joLfFxJyYAgUe7xbg
         /cnM+/81avBRcHGN6CIm/X460h7MuCYZiWtelbpdXigM1D6FUdAGLYUDVvK6cxYVywxW
         ov9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708364509; x=1708969309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpbxXvCSubVl6XgXjNWjfYRG3//u4L72+hbwdG6Aw+g=;
        b=RaLzjnZrIGkEebjmY7heoapzrcTwZtfX95sEah2brjB6/P7bZ5+E/fgYby/vnFGgXS
         984u5b9fwfcrfml97bqb5kFHWQB0AfytNekGAOvgoM7li4rJMKAiChYv86056rUDjPRN
         t9jyKy5slQRndIBANIL9by7n1teSb292llGnjvYTTpo6cYcSxOw9mezsht5JXxd7ejhP
         lW8j5ZllF85Q8rvpYvIn+xmhrGAGMtDfMaMW3IIPd2TD1UejODcRpu+qLtuanQ+kM2cI
         a8ZXr9WP/CqiI0210m/TxYQwmCys32kOptlGOC2sejR64XVP2MttNtBFtQ6DNbXQyr7i
         I+rg==
X-Forwarded-Encrypted: i=1; AJvYcCUrt0m0iLvmMYKwPDiCmEJkUBizZ4pa4Aqt961LmALlcMX8euJjq1LkamNGCdXM3fGw5po2+Jg64f+w2Btfnc1V/tBuN3AmeAYu/2h/Mw==
X-Gm-Message-State: AOJu0YzqU/YckSX30TRfAsqDoY+TwKQxhmptWrYzuIIk5DQD51+XRBkk
	KPY8uH8SOmHCJsQlC+wtvWv4BykpLzdyx01yZq4C3YwWWXmhK9zqTNbDvNet8no9mdPWsNPii9r
	rTwZ0UezyQuy92LLNhjn9NXyD5kOClt3urIW52g==
X-Google-Smtp-Source: AGHT+IGZBxSF+ykZUi3ZT/ydnvwdYMo+yLycBE4tf1TfD3XQ/uVP/RoPtvKOq3lMWHZQhSHC2eXcKDI/1o8ZI1vAnpA=
X-Received: by 2002:a25:8046:0:b0:dc2:2f4b:c9d8 with SMTP id
 a6-20020a258046000000b00dc22f4bc9d8mr11563408ybn.16.1708364508953; Mon, 19
 Feb 2024 09:41:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-gic-fix-child-domain-v1-1-09f8fd2d9a8f@linaro.org>
 <868r3g4fhv.wl-maz@kernel.org> <CAA8EJpqiN6oRMWhAMMP6EsAeki5KSMbO+XzEtT9YRdJKc9_Gbg@mail.gmail.com>
 <865xyk4dgf.wl-maz@kernel.org>
In-Reply-To: <865xyk4dgf.wl-maz@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 19:41:37 +0200
Message-ID: <CAA8EJprKUOMwrwawiQ51WKiLCipm72ZcpY6q520kSOg--9oKZg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/gic-v3: handle DOMAIN_BUS_ANY in gic_irq_domain_select
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Feb 2024 at 18:37, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 19 Feb 2024 16:21:06 +0000,
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 19 Feb 2024 at 17:53, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Mon, 19 Feb 2024 14:47:37 +0000,
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > Before the commit de1ff306dcf4 ("genirq/irqdomain: Remove the param
> > > > count restriction from select()") the irq_find_matching_fwspec() was
> > > > handling the DOMAIN_BUS_ANY on its own. After this commit it is a job of
> > > > the select() callback. However the callback of GICv3 (even though it got
> > > > modified to handle zero param_count) wasn't prepared to return true for
> > > > DOMAIN_BUS_ANY bus_token.
> > > >
> > > > This breaks probing of any of the child IRQ domains, since
> > > > platform_irqchip_probe() uses irq_find_matching_host(par_np,
> > > > DOMAIN_BUS_ANY) to check for the presence of the parent IRQ domain.
> > > >
> > > > Fixes: 151378251004 ("irqchip/gic-v3: Make gic_irq_domain_select() robust for zero parameter count")
> > > > Fixes: de1ff306dcf4 ("genirq/irqdomain: Remove the param count restriction from select()")
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/irqchip/irq-gic-v3.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > > > index 6fb276504bcc..e9e9643c653f 100644
> > > > --- a/drivers/irqchip/irq-gic-v3.c
> > > > +++ b/drivers/irqchip/irq-gic-v3.c
> > > > @@ -1696,7 +1696,8 @@ static int gic_irq_domain_select(struct irq_domain *d,
> > > >
> > > >       /* Handle pure domain searches */
> > > >       if (!fwspec->param_count)
> > > > -             return d->bus_token == bus_token;
> > > > +             return d->bus_token == bus_token ||
> > > > +                     bus_token == DOMAIN_BUS_ANY;
> > > >
> > > >       /* If this is not DT, then we have a single domain */
> > > >       if (!is_of_node(fwspec->fwnode))
> > > >
> > >
> > > I really dislike the look of this. If that's the case, any irqchip
> > > that has a 'select' method (such as imx-intmux) should be similarly
> > > hacked. And at this point, this should be handled by the core code.
> > >
> > > Can you try this instead? I don't have any HW that relies on
> > > behaviour, but I'd expect this to work.
> > >
> > > Thanks,
> > >
> > >         M.
> > >
> > > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > > index aeb41655d6de..3dd1c871e091 100644
> > > --- a/kernel/irq/irqdomain.c
> > > +++ b/kernel/irq/irqdomain.c
> > > @@ -449,7 +449,7 @@ struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
> > >          */
> > >         mutex_lock(&irq_domain_mutex);
> > >         list_for_each_entry(h, &irq_domain_list, link) {
> > > -               if (h->ops->select)
> > > +               if (h->ops->select && bus_token != DOMAIN_BUS_ANY)
> > >                         rc = h->ops->select(h, fwspec, bus_token);
> > >                 else if (h->ops->match)
> > >                         rc = h->ops->match(h, to_of_node(fwnode), bus_token);
> >
> > This works. But I wonder if the following change is even better. WDYT?
> >
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > index aeb41655d6de..2f0d2700709e 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -449,14 +449,17 @@ struct irq_domain
> > *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
> >          */
> >         mutex_lock(&irq_domain_mutex);
> >         list_for_each_entry(h, &irq_domain_list, link) {
> > -               if (h->ops->select)
> > +               if (fwnode != NULL &&
> > +                   h->fwnode == fwnode &&
> > +                   bus_token == DOMAIN_BUS_ANY)
> > +                       rc = true;
> > +               else if (h->ops->select)
> >                         rc = h->ops->select(h, fwspec, bus_token);
> >                 else if (h->ops->match)
> >                         rc = h->ops->match(h, to_of_node(fwnode), bus_token);
> >                 else
> >                         rc = ((fwnode != NULL) && (h->fwnode == fwnode) &&
> > -                             ((bus_token == DOMAIN_BUS_ANY) ||
> > -                              (h->bus_token == bus_token)));
> > +                             (h->bus_token == bus_token));
> >
> >                 if (rc) {
> >                         found = h;
> >
>
> Can't say I like it either. It duplicates the existing check without
> any obvious benefit. Honestly, this code is shit enough that we should
> try to make it simpler, not more complex...

Only the fwnode conditions are duplicated. And it makes sense: we
should check for the DOMAIN_BUS_ANY first, before going to select. I'm
not sure whether at some point we'd have to add (&& bus_token !=
DOMAIN_BUS_ANY) to the ops->match check.

>
> I'd rather we keep the impact as minimal as possible, and use the
> upcoming weeks to weed out the effects of these changes (there is
> another report of some Renesas machine falling over itself here[1]).
>
> Thanks,
>
>         M.
>
> [1] https://lore.kernel.org/all/170802702416.398.14922976721740218856.tip-bot2@tip-bot2
>
> --
> Without deviation from the norm, progress is not possible.



-- 
With best wishes
Dmitry

