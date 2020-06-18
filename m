Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 296571FFD93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 23:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730832AbgFRVwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 17:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728484AbgFRVwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 17:52:46 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91940C06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 14:52:46 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id j13so4463324vsn.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ew2PN/4JsZ1wOw/upw7XfR2Cn0MqAYGwSv+ArwTNfmg=;
        b=GtNFZSwLjEFMtYwi0oRZBt+nZLXjddEbJRtWA3O3P8yrVdh+hvhXAdHuvsPbpWO8ii
         fsmwrUcikBj2TG5ojkCPeDiL3xc/s/V4bO+dGxXHxeRVhRsVyZQYCRDJxzgKi/eUdOZp
         RqD7kWnJQgaLxxyMkLKR8Yju/2pQXlPg+7ivc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ew2PN/4JsZ1wOw/upw7XfR2Cn0MqAYGwSv+ArwTNfmg=;
        b=Y4cM1NJc1QFfnr2LnDvGAOY8v1A9wNAUYkuk2MfwAhHU+JzdUPi9dypX9eEGg9u5T8
         RXccUsnnW/qujTtyO4tCEAzRGabRaIeaG3FzgrskeGN+WabWtllPqGDMBOjDaKVNiiVk
         zuYZsXivOZEyXii7aHK79jjFBiQBlWspCtxyjby727Wqo/jLAoEE+80PZKgacx4pR6bF
         CzF5mkJYSP/pW6hXyIzzLnImnH9heUe8yr7iYU/KlEDT9K5NcWp2sjN4oSFBQ+9rENWE
         pvIbbqE+xiM86xflqRIjtr41CwfCwvxvxNXzVWUC+AmoaKJUdwtg2CAsxHbS5Qz6Um5D
         jJjg==
X-Gm-Message-State: AOAM530U3p+DTha9FsNJl0bVQcaFtoVa1COyCeHgqa3Qceg/6dzBzfk2
        LSXDMHGtBQZmz33WuzfXbOao6FL8rzc=
X-Google-Smtp-Source: ABdhPJz7dXs1R5rTaKMidRq7uQpPJrdws34rmz4jViQbiU64hwuFjLQbMN0LaqqrU3+1MbfrfyQsww==
X-Received: by 2002:a67:3291:: with SMTP id y139mr5582733vsy.37.1592517165552;
        Thu, 18 Jun 2020 14:52:45 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id f19sm487494vka.3.2020.06.18.14.52.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 14:52:44 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id v25so2522046uau.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 14:52:44 -0700 (PDT)
X-Received: by 2002:ab0:29c1:: with SMTP id i1mr451761uaq.120.1592517164088;
 Thu, 18 Jun 2020 14:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200528074530.1.Ib86e5b406fe7d16575ae1bb276d650faa144b63c@changeid>
In-Reply-To: <20200528074530.1.Ib86e5b406fe7d16575ae1bb276d650faa144b63c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 14:52:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9=cWZpW10ecG9_DmpWCEVhJ9C_AzbP4fTqdPQFZPhZw@mail.gmail.com>
Message-ID: <CAD=FV=W9=cWZpW10ecG9_DmpWCEVhJ9C_AzbP4fTqdPQFZPhZw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Don't use ktime for timeout in write_tcs_reg_sync()
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn and Andy,

On Thu, May 28, 2020 at 7:48 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> The write_tcs_reg_sync() may be called after timekeeping is suspended
> so it's not OK to use ktime.  The readl_poll_timeout_atomic() macro
> implicitly uses ktime.  This was causing a warning at suspend time.
>
> Change to just loop 1000000 times with a delay of 1 us between loops.
> This may give a timeout of more than 1 second but never less and is
> safe even if timekeeping is suspended.
>
> NOTE: I don't have any actual evidence that we need to loop here.
> It's possibly that all we really need to do is just read the value
> back to ensure that the pipes are cleaned and the looping/comparing is
> totally not needed.  I never saw the loop being needed in my tests.
> However, the loop shouldn't hurt.
>
> Fixes: 91160150aba0 ("soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()")
> Reported-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/soc/qcom/rpmh-rsc.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)

Is it a good time to land this change now that -rc1 has come out?
It'd be nice to get this resolved.

Thanks!

-Doug
