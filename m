Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26E01E843E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 19:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgE2RBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 13:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgE2RBO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 13:01:14 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD24C03E969
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2020 10:01:12 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id k3so1917696vsg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2020 10:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4NakxdxLfiVqwrqYq3ygcYPN3b3c2MjleuUer7TJH2s=;
        b=hHVUwA/+2FePatIbmmArTLqs4AgISB2ytYBtKxy2MPSOdXgRG0fYZJRtGIUTeKmGPk
         XPgs9a+KUmIyIDoDK04nN1kdWUxD1KB5j/dw6hOf+28M1mjqoPgFPkenJRAqUvmH4xzu
         EtcrRVo5X47+iFdX69c+3aYh5lMwwawDD7HpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4NakxdxLfiVqwrqYq3ygcYPN3b3c2MjleuUer7TJH2s=;
        b=fH/q03+ssRWrbdjFXnGsbxUXA8uE2k5LdpDmP192zaf92KHfch4CBtLtZ59N8L8iGl
         BsI/frrC0NMLLGnE+f2lJdDRU9tynIu9cUtOubZxGYZ1UR8aEBXCN+sXI5I9hNmNdjW2
         neXQbzlo2Qj23U4NtVk/UVxTYOb7fzZboTwAsGMy0jSLQG5F0m/Toh3KMXok95bgPBPi
         gX1lQ/moqRTmYRh37pFfvX17lCeiC6t3OXy2NCntPH7gshTGHlSWCV2oJLiK1OPHGMW8
         8VO9E+N8KJEQvMVO4IjAp952ELc9A/HELAY9VGU8rh9mL4rEHTVr3ts65d2h7lUpmHDB
         M0Lg==
X-Gm-Message-State: AOAM533qib4xJ+f9gHJi+jRyfF23GkGRTipQJcoN8zuLu5x0JsQbp523
        VpIGQZQHZOeOUpZUgTMg+OZeM0YSYw0=
X-Google-Smtp-Source: ABdhPJxMRfPlYdfAyvQ9gr539Zz1WknBDEo3g7j0vSHhCkfYxYHZ1O5JEgrm/hxJbAuumnk+XcGRlg==
X-Received: by 2002:a67:1a07:: with SMTP id a7mr6744123vsa.26.1590771671788;
        Fri, 29 May 2020 10:01:11 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id m4sm1332117vkl.50.2020.05.29.10.01.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 10:01:11 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id b28so1902657vsa.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2020 10:01:11 -0700 (PDT)
X-Received: by 2002:a67:b14b:: with SMTP id z11mr6575412vsl.109.1590771670806;
 Fri, 29 May 2020 10:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200528074530.1.Ib86e5b406fe7d16575ae1bb276d650faa144b63c@changeid>
 <159070588846.69627.5268638209383373410@swboyd.mtv.corp.google.com>
In-Reply-To: <159070588846.69627.5268638209383373410@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 29 May 2020 10:00:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRo42Pt0R3y=+31Wf+_nkERAAqgL+daUxmBaz9Bw+LKQ@mail.gmail.com>
Message-ID: <CAD=FV=WRo42Pt0R3y=+31Wf+_nkERAAqgL+daUxmBaz9Bw+LKQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Don't use ktime for timeout in write_tcs_reg_sync()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 28, 2020 at 3:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-05-28 07:48:34)
> > The write_tcs_reg_sync() may be called after timekeeping is suspended
> > so it's not OK to use ktime.  The readl_poll_timeout_atomic() macro
> > implicitly uses ktime.  This was causing a warning at suspend time.
> >
> > Change to just loop 1000000 times with a delay of 1 us between loops.
> > This may give a timeout of more than 1 second but never less and is
> > safe even if timekeeping is suspended.
> >
> > NOTE: I don't have any actual evidence that we need to loop here.
> > It's possibly that all we really need to do is just read the value
> > back to ensure that the pipes are cleaned and the looping/comparing is
> > totally not needed.  I never saw the loop being needed in my tests.
> > However, the loop shouldn't hurt.
> >
> > Fixes: 91160150aba0 ("soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()")
> > Reported-by: Maulik Shah <mkshah@codeaurora.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Thanks!


> Although I don't think ktime_get() inside of readl_poll_timeout_atomic()
> is correct. The timekeeping base won't be able to update when a loop is
> spinning in an irq disabled region. We need the tick interrupt to come
> in and update the base.

Is this really a problem?  I'm not totally familiar with the
timekeeping code, but I know I've used ktime to time things while
interrupts are disabled in the past.  It looks as if things are OK as
long as the base is updated every once in a while and it just does
deltas from there...


> Spinning for a second with irqs disabled is also
> insane for realtime so there's that problem too.

Yeah.  I just arbitrarily picked 1 second originally so we didn't loop
infinitely.  The expectation is that we'd never actually hit this
timeout.  If we do then there's (presumably) some type of serious
problem that needs to be debugged.


-Doug
