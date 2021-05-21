Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A6938CE0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 21:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236255AbhEUTT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 15:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235475AbhEUTT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 15:19:59 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0077C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 12:18:34 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id h9so20676130oih.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Wu08tk+CCRyMgmgOcs8+OfQi/RDtAbWotpICbHKSy/s=;
        b=UTKEKvFsClzaK6xrZZfkquJ0V0hAqtjvQp64T84F7NGC7P1so/lUSTjLq6KudV0jML
         sETeN+HK+IM2YQIEB3YCMMJ8dZLtkfLnelICRolM6WmBQhIKcLKonZ093aAhvDn3053y
         9fwgPx0ZGi4ZumBK82W8IZ6ocCzeO98FCj24s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Wu08tk+CCRyMgmgOcs8+OfQi/RDtAbWotpICbHKSy/s=;
        b=YAaM3ih7gjLEXR7CEx1UA/T5kuJGkQE0vU+TviPTEh9DXyAoI/6/MZBXjkZY0yIeFh
         UOBQFLNSzDc+uGCdCGAKjjwXUOYNk5L+xm7N8EyqywK/z4dSfOy8zgZIzT+rw/juXXEm
         6LdG+bxQ7E3eiKHohn8kaK3c8O2Ipu8n+u48jQRIbIVzhM2FivskmLC8+axIv6QYtzm+
         e0gRcDF0V3A0TT0paPBY9Y+ai5c8XVXEptFnY3M8M29JpMKpdzSLskwk5RyrHphH7HYZ
         9s2zBotD4ArKZRrH9EqG5gJQEWmF/T8sWFmtYp8RqNpo1PtoGdgxFf4f8rsPiHMgr1e8
         n+tg==
X-Gm-Message-State: AOAM532YBJ0436Q4W9vJ7cQ+wSzR6d9cQmUlMUeO5mvWczgzSKNuQEPy
        FrubCrW8vwFLC6YopZ8b5s6TBd/JqAwhdYdYKWM6cA==
X-Google-Smtp-Source: ABdhPJx+bhVow/xcVCiTI20Gc/+VA+eMRgzdPagpGXPOt0InqKpJRdKyYZnrlgaXIV9JIaCQF2HxP1+s+k+iggeQxnk=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3364087oiw.125.1621624713912;
 Fri, 21 May 2021 12:18:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 12:18:33 -0700
MIME-Version: 1.0
In-Reply-To: <1e9970ee1a7109e336bc6ed51e727442@codeaurora.org>
References: <1621013713-6860-1-git-send-email-khsieh@codeaurora.org>
 <c1a3ced9ac4682bae310712a11576322@codeaurora.org> <CAE-0n50yRCA00ck_FtXwzKw_R8UcocMzTh8V7NOe4ob__3G3bg@mail.gmail.com>
 <e071434531947e5c4275a1a14b77b2c3@codeaurora.org> <CAE-0n52rBrjy-=dpqK+dae2GNk1rAaQnKqCjzdqiAoS13gHpSQ@mail.gmail.com>
 <f476d82d0798e0d7eb9e12949aa2c8f1@codeaurora.org> <CAE-0n51+mbCAqWWTOMDA4Rx_=96V4tK8g+UWVZ-nnp50dFzRPA@mail.gmail.com>
 <5d341df202facb3240a72cfb35e18167@codeaurora.org> <CAE-0n50u-qGvqzJThc+ggghv6ZErPr8g8dhvgequBm5CWOR2Kw@mail.gmail.com>
 <1e9970ee1a7109e336bc6ed51e727442@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 12:18:33 -0700
Message-ID: <CAE-0n50BOV6UofBzqqb+KzcOR7W=h3VD2g4CzeqB6+a0v-aZUQ@mail.gmail.com>
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

Quoting khsieh@codeaurora.org (2021-05-21 08:21:58)
> >
> > Ok. So you're saying that we want to put both events on the queue
> > regardless, and put IRQ_HPD there first because we want to check the
> > status bit? Doesn't reading the status bit require the dongle to be
> > connected though? So if an unplug came in along with an irq_hpd we may
> > queue both the irq_hpd and the unplug, but when it comes time to
> > process
> > the irq_hpd in the kthread the link will be gone and so trying the dpcd
> > read for the link status will fail?
> >
> yes,
> we had a previous bug with this scenarios already.
> https://partnerissuetracker.corp.google.com/issues/170598152
> At this case, dongle produce two interrupts, irq_hpd followed by unplug
> immediately (not presented at isr status register at same time), at the
> time dongle unplugged form DTU.
> But due to dp ctrl reset at handling irq_hpd which cause unplug mask bit
> be cleared so that unplug interrupt got lost.
>

Again, wouldn't that be too late if the hardirq handler is delayed to
the point that the two irqs are pending in the isr status register?
