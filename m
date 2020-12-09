Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8708B2D401A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 11:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729964AbgLIKhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 05:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730151AbgLIKhk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 05:37:40 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75AFC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Dec 2020 02:36:59 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id k9so219850vke.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Dec 2020 02:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PQKNw4rve2IFVJSgF3l1spNsP6KxWxPlzjeFvHTILG0=;
        b=Y9L1cuKMRxS6cqV7wccn+NGMdFdyyON6mLbp2AaqFKahxop11+l8k+S2xRnJl1SqG9
         h+VQO9T8cqjEN875Om5IIf3Dhi8u0yEMgFb6U55SgOXP/b2oguHH6zG8Digs/B7beMf/
         AbIydlLEu/lsB9iQIFGVR7RFVrd0H8kif/Tv7R2GgE4LBBHZcbMekWESIBSZ9/C6t7Ef
         2JbODYxFSb49yTmLnC8ZCbSmqn1QtYhTxTueeb7PU+mz1aromoxyVU3VOTk0YuDznu2o
         rDji9mX0/1/SfgNsOIRUBjOhHZ290apmetlnIqPWZm2M8K/FxgEF+rJMuISWwAkpSHqI
         L9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PQKNw4rve2IFVJSgF3l1spNsP6KxWxPlzjeFvHTILG0=;
        b=FkgZzZ4AP+T5P+0xgWqzy7JDOPlZkMS5QqL/a4ZTKR6NgLUijU/wQhjYO506afJonc
         CKm1bfbVnIOdVBwWYOxdViHgkeVcJbDjrpAy24myRgD7+7tNhd1KR0zAhP6n6IWj+hGx
         l04Uu/FSzuSAgasB1poccEk4+V1bACgAvoCfXA5+j5P8h3gsggy1ocMjjuubybjXanFg
         iXgXtZn9wntkFUsD3MlaT18GjvshjuLKV/2NaElVjoy2a/ymBXxcQuLbzxXS9pydUQXZ
         iuZcGQsB+c9593zLbG2eh8k7G5FrAh9jytw1ZbdLVxRXjZh0obUCuKht17T1r2OsZ5Ai
         LIWQ==
X-Gm-Message-State: AOAM531lhd1ubqKlLCec7XaLdjqAL/LuxjK6C7bkVSam2Xad0LctX/D+
        7/tWmotSbhnBDzqPgKVe3jRr31rD3Dc8gZu/tlak0g==
X-Google-Smtp-Source: ABdhPJyVitP1UALU6m5dkizscGddpcIFL9RAOWmFm2lsp2l4uQK1PzcUJ9Hmx5fd+n7WoWWzxgjxgn7yBsdYJ8tEZlE=
X-Received: by 2002:a1f:dec2:: with SMTP id v185mr1196976vkg.8.1607510219009;
 Wed, 09 Dec 2020 02:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20201130225039.15981-1-ilina@codeaurora.org> <CAJZ5v0g+nK+jV+Gy+BKEALRtsXDK0HnDbz07Nv3KPK5L3V3OKg@mail.gmail.com>
In-Reply-To: <CAJZ5v0g+nK+jV+Gy+BKEALRtsXDK0HnDbz07Nv3KPK5L3V3OKg@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 9 Dec 2020 11:36:22 +0100
Message-ID: <CAPDyKFpD6L0r=YBEEjfjc85gx_7p5cVw20fwUxecpQp2dNU-0g@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Better domain idle from device wakeup patterns
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Lina Iyer <ilina@codeaurora.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 8 Dec 2020 at 18:26, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Nov 30, 2020 at 11:51 PM Lina Iyer <ilina@codeaurora.org> wrote:
> >
> > Hi,
> >
> > The v5[1] of the series brought out some interesting discussions. The
> > most important being is it worth adding the additional expense to all PM
> > domains even if no wakeup pattern is available. It seems like
> > maintaining a domain specific flag that the governor could check is a
> > generic enough option. That should disable additional overhead for
> > domains that do not need this feature.
> >
> > Ulf suggested that we could allow wakeups only if any of the domain idle
> > state specifies a residency. However, we don't want to check for next
> > wakeup everytime the domain enters idle just because the domain
> > specifies an idle state with residency. This is also not desired.
> >
> > Also, if the domain checks for next wakeup, should the parent domains of
> > the domain also check for next wakeup? And when do we set that up? These
> > are questions that we don't know the answers yet. So, let's enable the
> > domain governor only if the domain sets up the flag or when the device
> > in the domain specifies the next wakeup.
> >
> > The previous post of the series explaining why this is a useful feature
> > is v5[1]. Please let me know what you think.
>
> Ulf had comments on the previous versions, so waiting for him to
> respond here, thanks!

Yes, I will have a look, but please allow me some more time - it's a
busy period for me.

Kind regards
Uffe
