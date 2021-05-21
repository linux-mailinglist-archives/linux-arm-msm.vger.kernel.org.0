Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A74B38CF67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhEUUzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhEUUzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:55:40 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00646C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:54:15 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id u11so20876003oiv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=B3jduID57ZvHsMi3x4uB8b1Uc3RzS8uHWNJ1a8k5L9c=;
        b=Vq+UjoaepuatCdv+jF9L93kUcjSzg5FxbSLlu/3chM+ilyPCC/wlYyA14tE0wP39He
         wrzMHJgK2waajEWhwE18K6Wxi2T9TMFikGCK6UFbgsaDLx9LK+GS7CkKuI201AgR0w2T
         jlJ1jgX4kWw0hmavhTK6U2i2IoRHRxe1QzEiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=B3jduID57ZvHsMi3x4uB8b1Uc3RzS8uHWNJ1a8k5L9c=;
        b=adsOwNah7ImFri+xNYnWm82iGAxWF8/ypmjh6YfIJ+98jGlOZLpd7eZ7fS2h1YkrDY
         XxC7mRJ9/EY/mqfkEd8eZfgZGA+1Ee9HlMF4zJMZHZiFe2kXQohGCvRH3os8J6805S/b
         VA4f+u6fZtTmQqGGXSMjHhjQwsYcj9OvKzy1oh1xj8BAkFaXJs/U1KHEvKojgmHufRE0
         xZ2w/m21hfVX+WBG7jBFQDbugxlzd6TGFeRJgLZ8mYyEW+s5BV26ByJCP5g7gf94/hxe
         ErT/9txllg0dNxYnipqDXjzr/xcwXqf4zsKwji/7IYH6hZZP+/LXTYBMx4AkYdqFGNJl
         KXOA==
X-Gm-Message-State: AOAM531bzCmLsVRhGCWzFcVwg/CHiXQdMU/LKsDSoLf343ojapegfvAZ
        BbjQfGWE2eDPm6TAqwOoG0J/XIgLU2Ri/jehgnbnJA==
X-Google-Smtp-Source: ABdhPJy52MtahaDQNrKr4IiPNrNxjwiZJb9Jaygu06Wc4503z17eg95wq2vPWdlQ8RbNsiMqQNO6fs3lD6zVL/6WHLs=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3627644oiw.125.1621630455411;
 Fri, 21 May 2021 13:54:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:54:14 -0700
MIME-Version: 1.0
In-Reply-To: <fc6542f2e760fa92aef73fdb9a789b2d@codeaurora.org>
References: <1621013713-6860-1-git-send-email-khsieh@codeaurora.org>
 <e071434531947e5c4275a1a14b77b2c3@codeaurora.org> <CAE-0n52rBrjy-=dpqK+dae2GNk1rAaQnKqCjzdqiAoS13gHpSQ@mail.gmail.com>
 <f476d82d0798e0d7eb9e12949aa2c8f1@codeaurora.org> <CAE-0n51+mbCAqWWTOMDA4Rx_=96V4tK8g+UWVZ-nnp50dFzRPA@mail.gmail.com>
 <5d341df202facb3240a72cfb35e18167@codeaurora.org> <CAE-0n50u-qGvqzJThc+ggghv6ZErPr8g8dhvgequBm5CWOR2Kw@mail.gmail.com>
 <1e9970ee1a7109e336bc6ed51e727442@codeaurora.org> <CAE-0n50BOV6UofBzqqb+KzcOR7W=h3VD2g4CzeqB6+a0v-aZUQ@mail.gmail.com>
 <fc6542f2e760fa92aef73fdb9a789b2d@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 13:54:14 -0700
Message-ID: <CAE-0n50qKmGUZn6nP-J=BfVA3cUnJ5vPBj2_Z=nCAwRBe3cYEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
To:     khsieh@codeaurora.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-05-21 12:45:35)
> On 2021-05-21 12:18, Stephen Boyd wrote:
> > Quoting khsieh@codeaurora.org (2021-05-21 08:21:58)
> >> >
> >> > Ok. So you're saying that we want to put both events on the queue
> >> > regardless, and put IRQ_HPD there first because we want to check the
> >> > status bit? Doesn't reading the status bit require the dongle to be
> >> > connected though? So if an unplug came in along with an irq_hpd we may
> >> > queue both the irq_hpd and the unplug, but when it comes time to
> >> > process
> >> > the irq_hpd in the kthread the link will be gone and so trying the dpcd
> >> > read for the link status will fail?
> >> >
> >> yes,
> >> we had a previous bug with this scenarios already.
> >> https://partnerissuetracker.corp.google.com/issues/170598152
> >> At this case, dongle produce two interrupts, irq_hpd followed by
> >> unplug
> >> immediately (not presented at isr status register at same time), at
> >> the
> >> time dongle unplugged form DTU.
> >> But due to dp ctrl reset at handling irq_hpd which cause unplug mask
> >> bit
> >> be cleared so that unplug interrupt got lost.
> >>
> >
> > Again, wouldn't that be too late if the hardirq handler is delayed to
> > the point that the two irqs are pending in the isr status register?
>
> yes,
> but that not much dp driver can do.
> As long as DP driver can recovery (shut down gracefully) and ready for
> next plugin, then i think it should be fine.
>

Yes. I'm trying to make the point that the least the DP driver could do
would be to mask the interrupts for HPD IRQ when unplug irq happens at
hardirq context and also ignore HPD IRQ when unplug is also there. And
going even further, it feels like we should only enable the unplug irq
once a plug in irq happens, and vice versa, so that we don't get into
the case where a super long delayed irq sees all three bits: plug,
unplug, and hpd irq.
