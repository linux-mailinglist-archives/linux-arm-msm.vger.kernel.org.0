Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB5922CF2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 22:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgGXUMR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 16:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXUMQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 16:12:16 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDDFC0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:12:14 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id j186so5526155vsd.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LM5eS2EeRGKww+dYskRfhmE9ybbsR8gCTRM+LVzEnYc=;
        b=iwSz087aaVUaiSy1oH9aa8XJaarVKSzVfLzp/O4LysKy3u1QVPScnmr13iFwMv3SCT
         0gIzFILLrv2w2raEeGSNDRBWD+3817WlhnydMdgxhGKHReLuPGu6kF6KAWjIGa2MzykV
         JruC9nRwh9hvoMlHT7vihvIaF/VdfgBjqJfLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LM5eS2EeRGKww+dYskRfhmE9ybbsR8gCTRM+LVzEnYc=;
        b=aGKu4cqHPwwKcakB0p298UddCSDb0gvIW2HJRFomxqgukE/ulrpzrpnXpJix70K25O
         /FDPzqyhO2hhwWFibY2cJOaUCyaWSObYbOE6Cl0bFHAi2pLA8yPej9lnlv5TkaMBx5Ri
         nRZEVn/E5AbXmKiw1RB23EqyhtedSkeV0wuVULsavow6nRlLx81DptEqXSdWtC4c0ABh
         3WZRL5TlD13AZ73TqbRjejyc+I0ydXuWhjhQkFqNVY5JhGECKVSdzwnuz/N05wioSfTo
         bb4KshnNgBOAU9iLsGWneZLvGIk6cFP/n9t4ndzmAuUlQD+L5vKrjSQd6Wh6vIKSiqgw
         QouQ==
X-Gm-Message-State: AOAM531+/PniwC1XmjqpcyXY+A6hN2VA6jkmZcARvetrG671nsrdhhnz
        3qoJ/PRSB+jbX/2eAyaZj1gipkHSwZA=
X-Google-Smtp-Source: ABdhPJyOS8P3gi/skS1cTDZMCz7K5YvZ7gQtMMqp1ue2mocstYOPJYlTcTCuhAg/vv9DimlJZFREhA==
X-Received: by 2002:a05:6102:201a:: with SMTP id p26mr9262662vsr.50.1595621533531;
        Fri, 24 Jul 2020 13:12:13 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id q7sm218664vsp.14.2020.07.24.13.12.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 13:12:12 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id p25so5554044vsg.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:12:12 -0700 (PDT)
X-Received: by 2002:a67:ec0f:: with SMTP id d15mr8730677vso.121.1595621531870;
 Fri, 24 Jul 2020 13:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200723010137.3127584-1-swboyd@chromium.org> <CAD=FV=WtjyYY+bmocc17S9NbRs6inkAWjj7=c9qBsVf3LtG99Q@mail.gmail.com>
 <159561988523.3847286.14763422711224252201@swboyd.mtv.corp.google.com>
 <CAD=FV=WH1vKKe=MPVdtBJZWnSzxNLO0uyM02GFG6oCJfSEwehQ@mail.gmail.com> <159562087212.3847286.9484527206999948907@swboyd.mtv.corp.google.com>
In-Reply-To: <159562087212.3847286.9484527206999948907@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jul 2020 13:11:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUSwsP_xrHsufLjZqbWdn5V8rybtv2DWad2nBfU+VJ9w@mail.gmail.com>
Message-ID: <CAD=FV=VUSwsP_xrHsufLjZqbWdn5V8rybtv2DWad2nBfU+VJ9w@mail.gmail.com>
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

On Fri, Jul 24, 2020 at 1:01 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-07-24 12:49:56)
> > Hi,
> >
> > On Fri, Jul 24, 2020 at 12:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > > > -       if (ret)
> > > > > -               goto unlock;
> > > > >
> > > > > -       ret = find_free_tcs(tcs);
> > > > > -       if (ret < 0)
> > > > > -               goto unlock;
> > > > > -       tcs_id = ret;
> > > > > +       wait_event_lock_irq(drv->tcs_wait,
> > > > > +                           (tcs_id = claim_tcs_for_req(drv, tcs, msg)) >= 0,
> > > >
> > > > Even though claim_tcs_for_req() only returns 0 or -EBUSY today (IOW it
> > > > never returns error codes other than -EBUSY), should we handle it?  If
> > > > we don't, claim_tcs_for_req() should be very clear that it shouldn't
> > > > return any errors other than -EBUSY.
> > >
> > > Do you mean you want to change it to be
> > >
> > >         (tcs_id = claim_tcs_for_req(drv, tcs, msg)) != -EBUSY
> > >
> > > instead of >= 0? It should return the tcs_id that was claimed, not just
> > > 0 or -EBUSY.
> >
> > Ah, right.  Yes, you got it right.  Of course then we have to add a
> > "if (tcd_id < 0) goto unlock", too.  If you think it's not worth
> > adding this then we just need to make sure it's super obvious in
> > claim_tcs_for_req() that it's not allowed to return other errors.
> >
>
> Hmm right now the code will wait forever for the condition to become
> true, so it will only ever continue past this point if tcs_id >= 0. We
> could add a timeout here in another patch, but I didn't want to change
> the behavior of what is there in this patch. I don't really care if >= 0
> or != -EBUSY is used here so I can change it to -EBUSY to provide
> clarity.
>
> If we add a timeout here, it would be better to change this driver to
> use a pull model instead of the push model it is using today so that the
> timeout isn't necessary. That would entail making a proper kthread that
> pulls requests off a queue of messages and then this asnyc call would
> append messages to the end of the queue and return immediately. That
> would be necessary if we want the async calls to work from non-sleeping
> contexts for example. I think Lina was alluding to this earlier in this
> thread.

I wasn't suggesting adding a timeout.  I was just saying that if
claim_tcs_for_req() were to ever return an error code other than
-EBUSY that we'd need a check for it because otherwise we'd interpret
the result as a tcs_id.

-Doug
