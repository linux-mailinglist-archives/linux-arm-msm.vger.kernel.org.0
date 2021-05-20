Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B24389AFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 03:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhETBmt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 21:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhETBms (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 21:42:48 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682D8C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 18:41:28 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id j75so14898795oih.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 18:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=iYMoi9RfdIWAgrdRsxo09y149SU9Ox48bYShc9UJAkk=;
        b=MN+ncWnQj5oJcKQh5vuPCIM41BJLa6s8lmFL8zoK2g+NHcZdFR9PgL21BglNUh2z4n
         nCdAoiPJU62w6XQ+ItF7ciK0mX48MZ669tc+ocCLqP2rD8dMbE2JuELGbvmIayYXYNOG
         WH9Tbh2D25aIZVMI9u7RYzMmmgOXo4VlM2ImA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=iYMoi9RfdIWAgrdRsxo09y149SU9Ox48bYShc9UJAkk=;
        b=eSObutjqz1xic6BWdDq6pErn6UKgJ64mEER4VVnzamod8NZTXum/WnzZciSc0Latwx
         te21uGF1Jydjwg0B0+RenR6VN1DSU5nw8ugde+bj2SCvbRP5DjJEw4Gj6EtAlUUDPODd
         Z/zIAXDeCdmhiJPboOmlpWTcA9QeoUyX7P2Wi6ccOEGhRrhNNUdquh9k4SjI0iYMAzNY
         RvIAfUUBdb4T9SZmUYXasxtwTCjGJm3BBhIpehsegZJo+wgKG14Tru7RoAJcDAqq48J1
         hMS5MyD/UXPqgneD93mVQDMs0hmORja9S+imu8dhAm6tUsCZQOfA9s7fAFNLbjsrW9Zt
         w5DA==
X-Gm-Message-State: AOAM533iKKv3IV2kfdDV/qBJ5W63R39HSAOgadNPAuyjlaU0pPBKnKoE
        2d2yKb7LgwwjK9qW82dyLKkCtY5P5R63HAjDWkwYlpVEDyk=
X-Google-Smtp-Source: ABdhPJw+XAwShhYEdBQWbCN36WfVRcWEA+e8iITrKYVuyjhU4KfB0Q0SdwsVvIj+ukXQ2RGlbZqeN+uJh1kegL9mZus=
X-Received: by 2002:aca:654d:: with SMTP id j13mr1688671oiw.125.1621474887843;
 Wed, 19 May 2021 18:41:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 May 2021 21:41:27 -0400
MIME-Version: 1.0
In-Reply-To: <CAGETcx-jK3pBNRYevPmRhw1TALHNjtM5dSxCdEuB+2sBH32rtQ@mail.gmail.com>
References: <20210520002519.3538432-1-swboyd@chromium.org> <CAGETcx-jK3pBNRYevPmRhw1TALHNjtM5dSxCdEuB+2sBH32rtQ@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 19 May 2021 21:41:27 -0400
Message-ID: <CAE-0n522QRUfQOSGmYS59AbFdx2kmtz-CNszdWfLnPCbMkCryA@mail.gmail.com>
Subject: Re: [PATCH 0/7] component: Make into an aggregate bus
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Saravana Kannan (2021-05-19 18:27:50)
> On Wed, May 19, 2021 at 5:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > This series is from discussion we had on reordering the device lists for
> > drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> > the aggregate device onto and then we probe the device once all the
> > components are probed and call component_add(). The probe/remove hooks
> > are where the bind/unbind calls go, and then a shutdown hook is added
> > that can be used to shutdown the drm display pipeline at the right time.
> >
> > This works for me on my sc7180 board, but I'm currently struggling with
> > the last patch where we migrate the msm driver. It runs into a runtime
> > PM problem where the parent device isn't runtime PM enabled yet. I'm
> > still trying to figure out a clean solution there. Moving runtime PM
> > around breaks boot and I think that's because the power domain is off.
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Cc: Saravana Kannan <saravanak@google.com>
> >
> > [1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org
> >
>
> I skimmed through the series and in general the idea is good, but I'm
> not sure why each component user needs to be converted/"modern" before
> it can make use of the benefits of this series. Why not just have
> wrapper functions around the component ops that the new aggregate bus
> driver can just call? That'll give all the existing component users
> the new ability to use the new ops without having to have two
> versions.

The existing users can only have one or the other. Either use the ops
structure or use the struct aggregate_driver. What benefits of this
series are they not gaining?

> That'll also allow us to do other improvements (I have some
> in mind) that'll apply to all the component users instead of only the
> converted ones.

What do you have in mind? I didn't want to convert drivers over to the
new way of doing things without making them consciously change their
code. Otherwise I worry it will break things in random, subtle ways. The
last patch, as I mentioned above in the cover, causes warnings because
the display driver is enabling runtime PM in an odd spot as part of the
bind callback of the aggregate/master. That should move out of there and
into the msm_pdev driver that registers the aggregate from what I can
tell.
