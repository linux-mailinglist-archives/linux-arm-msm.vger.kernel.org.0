Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E754922CEDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 21:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgGXTuK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 15:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgGXTuK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 15:50:10 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BCEC0619E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 12:50:09 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id h18so3321463uao.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 12:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TI0f9ZG0XZavxVCgci5KzYO+fu3sbeQ813eMYl4khUs=;
        b=Rt0AQ2x73oWij0mw9oc1EtbPqzzscl3mgAmVCzhc40j76TnbYno0SLKddCJrZeMn/h
         Mn5rqXRcFD2iBaGVWy3gExG+DGlbd3PDqJ20BBRwWFP/we3eoua7c8D2tuDCfRjDzeHg
         4WnP9Pb9X3Nkqi9YsXSEr+/aIgzac9zApPWvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TI0f9ZG0XZavxVCgci5KzYO+fu3sbeQ813eMYl4khUs=;
        b=Qi+R9oJUJxXYTyaMSr5UZEc48/dsrx38eKcs0hmxtO5KsXGmyxYfj595ojfYej4SwH
         AS59wR4AOV9aKRkKbE+zFQyeGhxemWp3wTUNCFA/fzhcmiwpPVmGjHPFUpXfOf8/N92h
         kt8ya8F8SlVwZC5kiweuY6S6C1bsiExpXF6uFaJEU+MMhO/jooMDITQwQiCY4JsjJTJ2
         wDLucyBrtNe2lrLwFkVnP+lwvSXkQjrWpTNBh4OFDapirsox2g2C4UDlN2/Av/fR4QGq
         2ao4B6Hn0l1ScDJkqIAG5frNga6kG/mi2VSUXuqAHap6nPjK8VtxpVNGr+9pYWjxj+q1
         Ni8w==
X-Gm-Message-State: AOAM530tap3Mb1k5kirJTwTsz1wFfzCgiKy0mAtm9JP0QFAAr79RISj7
        dVdcdP3gjXJF7+D92AvbY8wUdnMoWvI=
X-Google-Smtp-Source: ABdhPJz7V247min1whUgzDzghlOXnuJU5es0rT6o+8YK45YXvd8N910Cc8BsrPT4I9ynGlGbVcs8KA==
X-Received: by 2002:ab0:2a46:: with SMTP id p6mr9327885uar.88.1595620208776;
        Fri, 24 Jul 2020 12:50:08 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id f7sm210954vso.5.2020.07.24.12.50.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 12:50:08 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id q15so5499468vso.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 12:50:08 -0700 (PDT)
X-Received: by 2002:a67:69c1:: with SMTP id e184mr9797505vsc.119.1595620207670;
 Fri, 24 Jul 2020 12:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200723010137.3127584-1-swboyd@chromium.org> <CAD=FV=WtjyYY+bmocc17S9NbRs6inkAWjj7=c9qBsVf3LtG99Q@mail.gmail.com>
 <159561988523.3847286.14763422711224252201@swboyd.mtv.corp.google.com>
In-Reply-To: <159561988523.3847286.14763422711224252201@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jul 2020 12:49:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WH1vKKe=MPVdtBJZWnSzxNLO0uyM02GFG6oCJfSEwehQ@mail.gmail.com>
Message-ID: <CAD=FV=WH1vKKe=MPVdtBJZWnSzxNLO0uyM02GFG6oCJfSEwehQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 24, 2020 at 12:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > > -       if (ret)
> > > -               goto unlock;
> > >
> > > -       ret = find_free_tcs(tcs);
> > > -       if (ret < 0)
> > > -               goto unlock;
> > > -       tcs_id = ret;
> > > +       wait_event_lock_irq(drv->tcs_wait,
> > > +                           (tcs_id = claim_tcs_for_req(drv, tcs, msg)) >= 0,
> >
> > Even though claim_tcs_for_req() only returns 0 or -EBUSY today (IOW it
> > never returns error codes other than -EBUSY), should we handle it?  If
> > we don't, claim_tcs_for_req() should be very clear that it shouldn't
> > return any errors other than -EBUSY.
>
> Do you mean you want to change it to be
>
>         (tcs_id = claim_tcs_for_req(drv, tcs, msg)) != -EBUSY
>
> instead of >= 0? It should return the tcs_id that was claimed, not just
> 0 or -EBUSY.

Ah, right.  Yes, you got it right.  Of course then we have to add a
"if (tcd_id < 0) goto unlock", too.  If you think it's not worth
adding this then we just need to make sure it's super obvious in
claim_tcs_for_req() that it's not allowed to return other errors.

-Doug
