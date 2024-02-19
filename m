Return-Path: <linux-arm-msm+bounces-11714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6CD85A8BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 17:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D70D286A2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 16:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EABD3B7A1;
	Mon, 19 Feb 2024 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hUed3Kdu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B803CF4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708359679; cv=none; b=dJBdRoo7IvKF1Jhdn/F8OgvgWjL8hzfvjX+Bp3nf73XRvXloXn/qC6JbKDdaYwn51tIEGi0wUjQbRVrKLSgy5dWpnQw4t2L+RGoieaywgqC4Z7WP5KnSvR3+j+BjC3u94phlvHPNeFIjCCT6LaSMN5Eeem4/ujYOpGjoDBHDs+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708359679; c=relaxed/simple;
	bh=gEqc7+mZIizrBsHgqf3iXtCjJRR1NKFgsluQ7BMfYkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyK0DGWFI/+Wx7KfP+QnnRfKlEcR+qIitXfq1BYbR30oe20qRyT3qU3tJAHRPCojUXi+AusVzo6SxAgoSKp1488aQ98sQB8HBBG722obW9aGD/PecEK1vlLbp9lfcOhYUOWQ6PnrlgSZpoyT8sz1Vhu2pzV2qZCRWFPjzB4iOtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hUed3Kdu; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6083dc087b3so9334767b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 08:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708359677; x=1708964477; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R2wt3HoshVyMSpGbBwuw8bsOeM4QsAyrGiOVNmA65O8=;
        b=hUed3KduHb81mmXzxHPrN1ZMNnt42OSPyvlxqh/elgvkNyaXgjvMJEq3UKmG2dK+F4
         ym9e7hh2OakiIB/MTJWc+815GQpENfeWEiYacOqls8HqA5qVlRpSbVuiFTD7Brn+qirY
         XKb47LivrcvmXdMlL4A80R2VLQyi1y9YkDMr0sEA3YgNLyHw13sCfOw6MnWniAk6Aj5s
         Bh1UnqY5TsSE03hyMVCTAMRcGd4Uoniv2/L7g2R3MWwS0Oyuhfk/twh/XG7HgrhCrnwH
         qFTWYhlxu3RNl8uXNBKPaORgEzDpr6I1s1nxERE00dhO03Myh7Pbded5P6VoMcX5DaH5
         ivEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708359677; x=1708964477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2wt3HoshVyMSpGbBwuw8bsOeM4QsAyrGiOVNmA65O8=;
        b=WQKOXmky1dbioPaKiWXkr/tdyEERA8MnGfdjz2VxwvUXExd1lVWp8GcL0X2niZsH8b
         znD/jAhDzrDz269YHd5Sq5/Qs2gAyZ51lwTzOGHvM1lCRVgkyR6NxMiVxWN57Ba/w7Vw
         h6WBLmiJBDFFOMUD/VDZY+hAQleW2SQJ+7mbj6vjgCaq8I/c8PRmMjryQdpIvNYHqFsX
         TaYtgTexbEy+44KB4kjUsWWoidpVRCfQR+5hL1gwd7fyxIIIhdwKyaCsaS+Jti+nOLV6
         G8v1b7PqGWoRyku3p0Vk9+2WEYWfgktdWx8TUjLPWsLHwqChUS/tAg1011e4aPZWsbI1
         RO8A==
X-Forwarded-Encrypted: i=1; AJvYcCXZvJZnLa38w3gDMhwq6jTA2mxBEdEEhAVpYfLqQ3ek/Ce5UE2U49TRmfckL71TBWoS/kNKHM++bz+QwgsXooDw5/FaDzwhVg8l9N/iJw==
X-Gm-Message-State: AOJu0Yy9WXJFZabF2SVE/BCz20LL69dBoQ0yaF/N/MAVTCxjOoW1QcbV
	Nil3InKziSH2wLnr/tajuK/Sbc/3mN7voddwUJ6oO4Odu9CdUtBNqFUmsln0XkzqC5AGf71g6rz
	gglEXh/8T0ker4zethj/QVkjk02Tug1G1clvjzA==
X-Google-Smtp-Source: AGHT+IEQn0c4ED0ZVL1Lxu49TiXak7RXw5M8hdgJfXaLEATpd6+9NC0IG4FzU8TZixBPFIIGr32Qva5v2j6a+srqihE=
X-Received: by 2002:a81:431e:0:b0:607:f785:c5b5 with SMTP id
 q30-20020a81431e000000b00607f785c5b5mr8604211ywa.22.1708359677335; Mon, 19
 Feb 2024 08:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-gic-fix-child-domain-v1-1-09f8fd2d9a8f@linaro.org> <868r3g4fhv.wl-maz@kernel.org>
In-Reply-To: <868r3g4fhv.wl-maz@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 18:21:06 +0200
Message-ID: <CAA8EJpqiN6oRMWhAMMP6EsAeki5KSMbO+XzEtT9YRdJKc9_Gbg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/gic-v3: handle DOMAIN_BUS_ANY in gic_irq_domain_select
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Feb 2024 at 17:53, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 19 Feb 2024 14:47:37 +0000,
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >
> > Before the commit de1ff306dcf4 ("genirq/irqdomain: Remove the param
> > count restriction from select()") the irq_find_matching_fwspec() was
> > handling the DOMAIN_BUS_ANY on its own. After this commit it is a job of
> > the select() callback. However the callback of GICv3 (even though it got
> > modified to handle zero param_count) wasn't prepared to return true for
> > DOMAIN_BUS_ANY bus_token.
> >
> > This breaks probing of any of the child IRQ domains, since
> > platform_irqchip_probe() uses irq_find_matching_host(par_np,
> > DOMAIN_BUS_ANY) to check for the presence of the parent IRQ domain.
> >
> > Fixes: 151378251004 ("irqchip/gic-v3: Make gic_irq_domain_select() robust for zero parameter count")
> > Fixes: de1ff306dcf4 ("genirq/irqdomain: Remove the param count restriction from select()")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/irqchip/irq-gic-v3.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > index 6fb276504bcc..e9e9643c653f 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -1696,7 +1696,8 @@ static int gic_irq_domain_select(struct irq_domain *d,
> >
> >       /* Handle pure domain searches */
> >       if (!fwspec->param_count)
> > -             return d->bus_token == bus_token;
> > +             return d->bus_token == bus_token ||
> > +                     bus_token == DOMAIN_BUS_ANY;
> >
> >       /* If this is not DT, then we have a single domain */
> >       if (!is_of_node(fwspec->fwnode))
> >
>
> I really dislike the look of this. If that's the case, any irqchip
> that has a 'select' method (such as imx-intmux) should be similarly
> hacked. And at this point, this should be handled by the core code.
>
> Can you try this instead? I don't have any HW that relies on
> behaviour, but I'd expect this to work.
>
> Thanks,
>
>         M.
>
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index aeb41655d6de..3dd1c871e091 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -449,7 +449,7 @@ struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
>          */
>         mutex_lock(&irq_domain_mutex);
>         list_for_each_entry(h, &irq_domain_list, link) {
> -               if (h->ops->select)
> +               if (h->ops->select && bus_token != DOMAIN_BUS_ANY)
>                         rc = h->ops->select(h, fwspec, bus_token);
>                 else if (h->ops->match)
>                         rc = h->ops->match(h, to_of_node(fwnode), bus_token);

This works. But I wonder if the following change is even better. WDYT?

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index aeb41655d6de..2f0d2700709e 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -449,14 +449,17 @@ struct irq_domain
*irq_find_matching_fwspec(struct irq_fwspec *fwspec,
         */
        mutex_lock(&irq_domain_mutex);
        list_for_each_entry(h, &irq_domain_list, link) {
-               if (h->ops->select)
+               if (fwnode != NULL &&
+                   h->fwnode == fwnode &&
+                   bus_token == DOMAIN_BUS_ANY)
+                       rc = true;
+               else if (h->ops->select)
                        rc = h->ops->select(h, fwspec, bus_token);
                else if (h->ops->match)
                        rc = h->ops->match(h, to_of_node(fwnode), bus_token);
                else
                        rc = ((fwnode != NULL) && (h->fwnode == fwnode) &&
-                             ((bus_token == DOMAIN_BUS_ANY) ||
-                              (h->bus_token == bus_token)));
+                             (h->bus_token == bus_token));

                if (rc) {
                        found = h;


-- 
With best wishes
Dmitry

