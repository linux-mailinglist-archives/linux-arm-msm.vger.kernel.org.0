Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8092622CED4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 21:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgGXTor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 15:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgGXTor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 15:44:47 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACFEC0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 12:44:47 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f7so199900pln.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GoHCwmbzVzBre/i+XFFjGlgzIQcO8cz5Ijth2WsQR68=;
        b=mk+WRy0SCcT29iDihjgngxYvJKgdz3HvJc5hCn4RXObEA2Ur2RclSuU91mrIDMWoOb
         KNxBhbyahIREGac3gg9VCNy7n3BAfSkrET5h8p+K++4mAwzHUefy4cIsXJh5sYYcKqMp
         s1TljNl+Oety9TCq0Li8E0A9hA4Mm5Ld5UvF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GoHCwmbzVzBre/i+XFFjGlgzIQcO8cz5Ijth2WsQR68=;
        b=Xgxq6QB7UJU72pwUD3eJMQjKCjpfKZv1c5BSfnivSL2OwzHweIgbSYUPFEduRzxBi2
         B+Vy9lyeudzf3/WRoJSmQrPZfE+WI3zQSG/wFHaoFd3r317za7z4tR0yClmQiGYp+fBE
         IAY7Ah8ZJPDbGEKMVa/EieOo7xQxIglwADaF6w/28+eSaeRxoGzbDy61nzA3FBUjso7T
         3U4HVE6I3ADKsXsrtvYVY173O7kuWiZXLD3O7lZFZt3ZHu1VEauGSDjw+jfCDfhLpUcQ
         QCgnsxKVS31Wi629mEjO/ziW9yPYeXfYFPMtsn3qECMHi1hRzjvUG3zLvkb72pl0FuFk
         Mq1w==
X-Gm-Message-State: AOAM531/rogPGWY4Z3AvEkXRljGVKBO9IIfCWXyti3U1W4e2zW/yeZMA
        VoDiInSvotXvR3eyd7lh4iNwLQ==
X-Google-Smtp-Source: ABdhPJw8+1mzNhYhvKffNffPjmnAWh4eVKuNJ2xJ17Uzw5pvN8DTpankN+GUMJ4/IQLRyfIrLhSiFw==
X-Received: by 2002:a17:90a:c68e:: with SMTP id n14mr6678770pjt.182.1595619886613;
        Fri, 24 Jul 2020 12:44:46 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id d18sm6390813pjv.25.2020.07.24.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 12:44:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=WtjyYY+bmocc17S9NbRs6inkAWjj7=c9qBsVf3LtG99Q@mail.gmail.com>
References: <20200723010137.3127584-1-swboyd@chromium.org> <CAD=FV=WtjyYY+bmocc17S9NbRs6inkAWjj7=c9qBsVf3LtG99Q@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jul 2020 12:44:45 -0700
Message-ID: <159561988523.3847286.14763422711224252201@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-07-24 10:42:55)
> Hi,
>=20
> On Wed, Jul 22, 2020 at 6:01 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-i=
nternal.h
> > index ef60e790a750..9a325bac58fe 100644
> > --- a/drivers/soc/qcom/rpmh-internal.h
> > +++ b/drivers/soc/qcom/rpmh-internal.h
> > @@ -118,6 +119,7 @@ struct rsc_drv {
> >         struct tcs_group tcs[TCS_TYPE_NR];
> >         DECLARE_BITMAP(tcs_in_use, MAX_TCS_NR);
> >         spinlock_t lock;
> > +       wait_queue_head_t tcs_wait;
>=20
> nit: this structure has a kernel-doc comment above it describing the
> elements.  Could you add yours?

Sure.

>=20
>=20
> >         struct rpmh_ctrlr client;
> >  };
> >
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> > index 076fd27f3081..6c758b052c95 100644
> > --- a/drivers/soc/qcom/rpmh-rsc.c
> > +++ b/drivers/soc/qcom/rpmh-rsc.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> > +#include <linux/wait.h>
> >
> >  #include <soc/qcom/cmd-db.h>
> >  #include <soc/qcom/tcs.h>
> > @@ -444,6 +445,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
> >                  */
> >                 if (!drv->tcs[ACTIVE_TCS].num_tcs)
> >                         enable_tcs_irq(drv, i, false);
> > +               wake_up(&drv->tcs_wait);
> >                 spin_unlock(&drv->lock);
>=20
> nit: I think it's slightly better to do the wake_up() after the
> spin_unlock(), no?  The first thing the other task will do is to try
> to grab the spinlock and we might as well give it a chance of
> succeeding without looping.  I don't see any reason why we'd need to
> be holding the lock while calling wake_up().

Right that's better.

>=20
>=20
> >                 if (req)
> >                         rpmh_tx_done(req, err);
> > @@ -562,44 +564,59 @@ static int find_free_tcs(struct tcs_group *tcs)
> >         return -EBUSY;
> >  }
> >
> > +static int claim_tcs_for_req(struct rsc_drv *drv, struct tcs_group *tc=
s,
> > +                            const struct tcs_request *msg)
>=20
> nit: I know this is a short function and kernel convention doesn't
> strictly require comments in front of all functions.  However, every
> other function in this file has a comment and I had a really hard time
> dealing with the rpmh-rsc code before the comments.  Could you add one
> for your function, even if it's short?  One thing that would be nice
> to note is that the only error it returns is -EBUSY.  See below.

Sure I'll write up some kernel-doc.

>=20
> > -       if (ret)
> > -               goto unlock;
> >
> > -       ret =3D find_free_tcs(tcs);
> > -       if (ret < 0)
> > -               goto unlock;
> > -       tcs_id =3D ret;
> > +       wait_event_lock_irq(drv->tcs_wait,
> > +                           (tcs_id =3D claim_tcs_for_req(drv, tcs, msg=
)) >=3D 0,
>=20
> Even though claim_tcs_for_req() only returns 0 or -EBUSY today (IOW it
> never returns error codes other than -EBUSY), should we handle it?  If
> we don't, claim_tcs_for_req() should be very clear that it shouldn't
> return any errors other than -EBUSY.

Do you mean you want to change it to be

	(tcs_id =3D claim_tcs_for_req(drv, tcs, msg)) !=3D -EBUSY

instead of >=3D 0? It should return the tcs_id that was claimed, not just
0 or -EBUSY.
