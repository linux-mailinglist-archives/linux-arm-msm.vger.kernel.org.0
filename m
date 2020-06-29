Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A4320E98E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 01:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgF2Xpo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 19:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgF2Xpo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 19:45:44 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35019C03E979
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 16:45:44 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id 66so729377vka.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 16:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fYI3mC1TPWWNCe5dapKUu8m35ZbqtEKTTLgsE9b3Fkw=;
        b=TUksazA+FGM3tucKqjgqZrt9NinjymNomhfIBEhZ4zMzZqHhHj+tz5ZLgmJ2Zd0pbP
         jOtLn2445dpX0VSLOa02xXSbZVWvTtP8p6O5h+oU67hNQPp3Kn8EbdweXGQly9MscT6r
         sNzdpzM4hLW9cT6jYanMVyeZC5rRI6yB6SolM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fYI3mC1TPWWNCe5dapKUu8m35ZbqtEKTTLgsE9b3Fkw=;
        b=o2VJ16+1qgCJeX2T9AuF2O9L6IGXpyVrbC8QsaruxYsC8/8xIiF9jrzlTOfacCGzsD
         /4GbiEWnt6vgNbd/7+ROqLrHE2cyb+FWK8Jr7UAFYnJ697DYaHDfHaba/XvbLqw44Rdh
         m78ke7L+o9NNjb0DPEM9HVhdAW88B3nX+1c5sPo/jni4LjoPOgCXh/YETc3pTDIIXDZO
         4c1CreOgHSLiN/jaKjMD2JZm2KXxmk68rXofDywii5YZZWE4HNfkD/AE+FB35Afqyjq1
         A3s8aRBPRTs226UlL6R6Ryzhr7KXaHdvr9zfthXqDRAW4I48+Ho97jRTLyG+iWguCCsS
         otzg==
X-Gm-Message-State: AOAM533S/qyHWIJdUvQ/lQGemzk3SgQ1VVP9uHxnFvWPxp605QAL/wbU
        adspOwMSRf3WLLyqIxfJ9kvl25CZOiE=
X-Google-Smtp-Source: ABdhPJwO4VEFdB4Wt1TibarHyROCjODHJSKcnxAUfNI15hRSSXQf1t3kgC1dZTlINDRSTgN6roD68A==
X-Received: by 2002:a1f:280c:: with SMTP id o12mr11421434vko.92.1593474343102;
        Mon, 29 Jun 2020 16:45:43 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id u125sm193817vkg.32.2020.06.29.16.45.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 16:45:42 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id r5so10167823vso.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 16:45:42 -0700 (PDT)
X-Received: by 2002:a67:ec58:: with SMTP id z24mr8146370vso.109.1593474341915;
 Mon, 29 Jun 2020 16:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200626151946.1.I06134fd669bf91fd387dc6ecfe21d44c202bd412@changeid>
 <20200629115316.GB5499@sirena.org.uk>
In-Reply-To: <20200629115316.GB5499@sirena.org.uk>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Jun 2020 16:45:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ULboyqRb1-1o1dq9Z7FGQ2gwb3oJi2bWLwZsXu6cybpw@mail.gmail.com>
Message-ID: <CAD=FV=ULboyqRb1-1o1dq9Z7FGQ2gwb3oJi2bWLwZsXu6cybpw@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Don't set the cs if it was already right
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 29, 2020 at 4:53 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jun 26, 2020 at 03:19:50PM -0700, Douglas Anderson wrote:
> > Setting the chip select on the Qualcomm geni SPI controller isn't
> > exactly cheap.  Let's cache the current setting and avoid setting the
> > chip select if it's already right.
>
> Seems like it'd be worth pushing this up to the core - if we're
> constantly setting the same CS value then perhaps we ought to just stop
> doing that?

Posted:

spi: Avoid setting the chip select if we don't need to
https://lore.kernel.org/r/20200629164103.1.Ied8e8ad8bbb2df7f947e3bc5ea1c315e041785a2@changeid

I see that you applied my patch to "spi-geni-qcom".  If the patch to
the core looks OK to you and lands, I think the one for the driver can
be reverted (though it doesn't hurt).

-Doug
