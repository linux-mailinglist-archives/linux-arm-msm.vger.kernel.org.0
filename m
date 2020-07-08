Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FAD219470
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 01:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgGHXkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 19:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGHXkD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 19:40:03 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70465C061A0B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 16:40:03 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id x62so365853qtd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 16:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s4PTp29U09bBo7Lu4mXNnRRUq7S8vPBuFkBdJI6sHus=;
        b=OF77syHXcChzkEUs9+BXgXSMwR+t9jCMThFrfbzfZ8mPDG8ZkTNSRve3ok6gtHomro
         es/mzdU4UysFHM2uMMrlumrIe1BwnlfTylxQuLiPUgxYNS4EtuzocS02fWNwaDF2pJrR
         N0GaAZ11AdR/x8QVwjRq62IkDCPufE+hNzo7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s4PTp29U09bBo7Lu4mXNnRRUq7S8vPBuFkBdJI6sHus=;
        b=NCP1CnHELgSLgoEv7iSZSoJET4+DVRvzsR188nJwpdlMveAP+Btzs2XrVtFyW0Dlz5
         5bNcGAsNFL5/BdeqEjlwMgJjWMyRnl9ztjrAaUE3IC0zP6DWZtKAy6IobZBIrRyVlOM4
         ArO1XtuX9VyCMpkMpk8o+GL4wLR+MOXP3essK6it/Y2pgWd31WHjfa4RqKib7DC+WkEX
         Z44GtsbF6wzvB/yZ7aareSv9eLm/9r2W2nDOMaNKU6+m4cCYg+r7P9VcNjvf/YLrNgIr
         VwvDo3a+IWRGAULgD6YeiL68QwcaNsFG+Jj+vB+URyQKTf9+dMe8cUwnLm47RUqqMvEC
         3hMw==
X-Gm-Message-State: AOAM533UrpGZvXm8HK2ck6NTjdwGiyuaRUzm55YQhzUTYeKSRcjjzn9O
        WyFU0dXnz8XHSNeuX6VKhLvpaw3YTwA=
X-Google-Smtp-Source: ABdhPJy5bUvqt0AblDXcZ+0PgDyCZpKQ2ngjV2/zZUutDtCJreDf4Ko5hjysuZ+cTSWRZvDvMnDnxQ==
X-Received: by 2002:aed:2c87:: with SMTP id g7mr64562838qtd.346.1594251601469;
        Wed, 08 Jul 2020 16:40:01 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id j9sm1414330qtr.60.2020.07.08.16.39.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 16:40:00 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id c30so125506qka.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 16:39:59 -0700 (PDT)
X-Received: by 2002:a37:9384:: with SMTP id v126mr58569207qkd.279.1594251599031;
 Wed, 08 Jul 2020 16:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200707101712.1.I4d2f85ffa06f38532631e864a3125691ef5ffe06@changeid>
 <CA+ASDXMXtwdV4BNL1GSj8DY-3z8-dZ=1hP8Xv_R-AjKvJs0NMw@mail.gmail.com> <CAD=FV=WU2dUFtG4W6o574DRN9VV+u_B5-ThqV3BogjztBibyLQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WU2dUFtG4W6o574DRN9VV+u_B5-ThqV3BogjztBibyLQ@mail.gmail.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Wed, 8 Jul 2020 16:39:47 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOwFnCcMC9g11FSVLvj2nepArJyihGvx3SU-XqySoJruw@mail.gmail.com>
Message-ID: <CA+ASDXOwFnCcMC9g11FSVLvj2nepArJyihGvx3SU-XqySoJruw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Keep track of which interrupts fired, don't poll them
To:     Doug Anderson <dianders@chromium.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        ath10k <ath10k@lists.infradead.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Rakesh Pillai <pillair@codeaurora.org>,
        Abhishek Kumar <kuabhs@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 8, 2020 at 4:14 PM Doug Anderson <dianders@chromium.org> wrote:
> On Wed, Jul 8, 2020 at 4:03 PM Brian Norris <briannorris@chromium.org> wrote:
> > If I'm reading correctly, you're removing the only remaining use of
> > 'per_ce_irq'. Should we kill the field entirely?
>
> Ah, you are indeed correct!  I hadn't noticed that.  Unless I hear
> otherwise, I'll send a v2 tomorrow that removes the field entirely.

A healthy middle ground might put that in a patch 2, so it's easily
dropped if desired. *shrug*

> > Or perhaps we should
> > leave some kind of WARN_ON() (BUG_ON()?) if this function is called
> > erroneously with per_ce_irq==true? But I suppose this driver is full
> > of landmines if the CE API is used incorrectly.
>
> Yeah, I originally had a WARN_ON() here and then took it out because
> it seemed like extra overhead and, as you said, someone writing the
> code has to know how the API works already I think.  ...but I'll add
> it back in if people want.

I believe WARN_ON() and friends have a built-in unlikely(), so it
shouldn't have much overhead. But I don't really mind either way.

> > Do you need to clear this map if the interface goes down or if there's
> > a firmware crash? Right now, I don't think there's a guarantee that
> > we'll run through a NAPI poll in those cases, which is the only place
> > you clear the map, and if the hardware/firmware has been reset, the
> > state map is probably not valid.
>
> Seems like a good idea.  Is the right place at the start of
> ath10k_snoc_hif_start()?

Either there or in .power_down()/.power_up(). I think either would be
equally correct, but I'm not entirely sure if the semantic difference
is meaningful for this.

Brian
