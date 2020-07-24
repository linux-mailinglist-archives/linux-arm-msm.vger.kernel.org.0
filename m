Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE8322CEF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 22:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgGXUBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 16:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXUBO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 16:01:14 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275F1C0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:01:14 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b92so5986652pjc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=CF38ejeupSdGLQ8SJg5UVKB/UvbU/lVoIN0k+iE3qP0=;
        b=Tcg0l6YibTvYMjZh4BV+v8/m9CpmT00Z5P0C8vjG89p7GV0rRLK3NFXh/rDz2pt4ki
         0qUjFnOw9u6BGRfN7nhWgp6KpVrdRPDX4GayUdMXNYAUyPqOSmyEihmKjQUENfrgWwEl
         jYo7/U8rtG7haX9+GPmj8KMso+v8hNrbBAcUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=CF38ejeupSdGLQ8SJg5UVKB/UvbU/lVoIN0k+iE3qP0=;
        b=BDLCqGdfaTizTZAxp216xOr9Dm+B8CSe5OSwDbEorct5GQhABL0YB1hhE5q1qsNy0a
         engdz9k+9t+B+7uQvWlzpd84lq6g+7jIvmqyL8/OKYaT5VqbXS++AUi0vl+L00dWzis/
         D5PbkCcV4gMrZNWb4SoEYVU00cEz7QJjMXAeOgZczFoGpzqLwaj90RKI06gBHGbhRNYZ
         u65RkAdg5U3rMfP6KOq/AeS+2DMIh++MxlzLNK+q3jDyXuWiFZtITrggyFeAo3TVvSzX
         1182hgzXTsE0OYkKHgr+ri2iuINqwSfYVM4T8roVYZqqKT6M7A8ahHxcx5otxdpvyNIN
         XDuA==
X-Gm-Message-State: AOAM533n0Q3JUq/YWVWFjHUsmKMRDS58svMTgi7OFySI77etzljf/ee8
        z4akd6y2eijByZD5BQcQnZQl0w==
X-Google-Smtp-Source: ABdhPJyzr5neoT60gNXUQQSg7ocpplLzu7m3kBYCJZ+3TaGidqYMJ/jEdnJ9B0vMdagFMjBKvSBtVQ==
X-Received: by 2002:a17:90a:750:: with SMTP id s16mr6847752pje.218.1595620873480;
        Fri, 24 Jul 2020 13:01:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u23sm6991699pgn.26.2020.07.24.13.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 13:01:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=WH1vKKe=MPVdtBJZWnSzxNLO0uyM02GFG6oCJfSEwehQ@mail.gmail.com>
References: <20200723010137.3127584-1-swboyd@chromium.org> <CAD=FV=WtjyYY+bmocc17S9NbRs6inkAWjj7=c9qBsVf3LtG99Q@mail.gmail.com> <159561988523.3847286.14763422711224252201@swboyd.mtv.corp.google.com> <CAD=FV=WH1vKKe=MPVdtBJZWnSzxNLO0uyM02GFG6oCJfSEwehQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jul 2020 13:01:12 -0700
Message-ID: <159562087212.3847286.9484527206999948907@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-07-24 12:49:56)
> Hi,
>=20
> On Fri, Jul 24, 2020 at 12:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > > > -       if (ret)
> > > > -               goto unlock;
> > > >
> > > > -       ret =3D find_free_tcs(tcs);
> > > > -       if (ret < 0)
> > > > -               goto unlock;
> > > > -       tcs_id =3D ret;
> > > > +       wait_event_lock_irq(drv->tcs_wait,
> > > > +                           (tcs_id =3D claim_tcs_for_req(drv, tcs,=
 msg)) >=3D 0,
> > >
> > > Even though claim_tcs_for_req() only returns 0 or -EBUSY today (IOW it
> > > never returns error codes other than -EBUSY), should we handle it?  If
> > > we don't, claim_tcs_for_req() should be very clear that it shouldn't
> > > return any errors other than -EBUSY.
> >
> > Do you mean you want to change it to be
> >
> >         (tcs_id =3D claim_tcs_for_req(drv, tcs, msg)) !=3D -EBUSY
> >
> > instead of >=3D 0? It should return the tcs_id that was claimed, not ju=
st
> > 0 or -EBUSY.
>=20
> Ah, right.  Yes, you got it right.  Of course then we have to add a
> "if (tcd_id < 0) goto unlock", too.  If you think it's not worth
> adding this then we just need to make sure it's super obvious in
> claim_tcs_for_req() that it's not allowed to return other errors.
>=20

Hmm right now the code will wait forever for the condition to become
true, so it will only ever continue past this point if tcs_id >=3D 0. We
could add a timeout here in another patch, but I didn't want to change
the behavior of what is there in this patch. I don't really care if >=3D 0
or !=3D -EBUSY is used here so I can change it to -EBUSY to provide
clarity.

If we add a timeout here, it would be better to change this driver to
use a pull model instead of the push model it is using today so that the
timeout isn't necessary. That would entail making a proper kthread that
pulls requests off a queue of messages and then this asnyc call would
append messages to the end of the queue and return immediately. That
would be necessary if we want the async calls to work from non-sleeping
contexts for example. I think Lina was alluding to this earlier in this
thread.
