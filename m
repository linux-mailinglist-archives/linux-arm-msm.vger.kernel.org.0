Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8620F38B804
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 22:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240158AbhETUEl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 16:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbhETUEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 16:04:41 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512DDC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 13:03:18 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id n2so18944302wrm.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=FU0d7+kSraKdngkIyPIt5NSqznuzgSQmwjTFbIqh82I=;
        b=d3Hei2jwKc/C87+dDBawCoVOIy25i8qyEpyU173i9Pjbt5Y20BvdCZ8F2ElivH/0zu
         9AEo0+/d2oCPHGEXgs0wUj5fskkaNcF3sxm1lGfOnuv9EtgCvT7UuYR3GC3CDFtxqT1G
         yp94Q2YMApSmYgq4UPNNxJ7so1vlyBp14sZfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=FU0d7+kSraKdngkIyPIt5NSqznuzgSQmwjTFbIqh82I=;
        b=oJ6EWbJ4ALrA0qgrnXAN1ds8q/O016vgWFB25swsskJNsB1c1A95NoJPQbKLDmHucn
         n4sT1JRcBdSCVWzRK/01EDYSpE+Z0bxCMBugWrISYSwHf+/XOhOtiCnbArPw9tF8ngRB
         /9SyUfyGEVubymqj5gl8fB7PgiLoHVh/gkiSMlB9TRURc8g9bMpPnJ7bo52V9oC/0K2S
         Fn7muaziwmy9CD0+eEjloGk9OoqrYijWog3xkt2SZv/n7Ft6dDRpkhW0SKTJqtvEU57Z
         VbQOQme1Z40cGtijyXUYS4r68TWtfmMdMPbG8P03x8MY47Gme5rGxwE9qpubw3ufpJ5l
         WMfw==
X-Gm-Message-State: AOAM533pZIrdocIu0AEK4yKJT5Ub3nFbklcCLPsY+bic2QoOfbsomKDp
        J7hgPyBQT7C8SToCzD8Eh2YYsg==
X-Google-Smtp-Source: ABdhPJz9rVlxy/Vj9yTBij7i/ZlVLzwSpGkTG/jrgEO2Fbi8ijXxMCLylcVrmu8o6ORVeKgxAsWApg==
X-Received: by 2002:adf:f751:: with SMTP id z17mr5877306wrp.150.1621540996980;
        Thu, 20 May 2021 13:03:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c15sm4269990wro.21.2021.05.20.13.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:03:16 -0700 (PDT)
Date:   Thu, 20 May 2021 22:03:14 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Subject: Re: [PATCH 0/7] component: Make into an aggregate bus
Message-ID: <YKbAgipp/rmSjOXn@phenom.ffwll.local>
Mail-Followup-To: Stephen Boyd <swboyd@chromium.org>,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
References: <20210520002519.3538432-1-swboyd@chromium.org>
 <CAGETcx-jK3pBNRYevPmRhw1TALHNjtM5dSxCdEuB+2sBH32rtQ@mail.gmail.com>
 <CAE-0n522QRUfQOSGmYS59AbFdx2kmtz-CNszdWfLnPCbMkCryA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n522QRUfQOSGmYS59AbFdx2kmtz-CNszdWfLnPCbMkCryA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 19, 2021 at 09:41:27PM -0400, Stephen Boyd wrote:
> Quoting Saravana Kannan (2021-05-19 18:27:50)
> > On Wed, May 19, 2021 at 5:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > This series is from discussion we had on reordering the device lists for
> > > drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> > > the aggregate device onto and then we probe the device once all the
> > > components are probed and call component_add(). The probe/remove hooks
> > > are where the bind/unbind calls go, and then a shutdown hook is added
> > > that can be used to shutdown the drm display pipeline at the right time.
> > >
> > > This works for me on my sc7180 board, but I'm currently struggling with
> > > the last patch where we migrate the msm driver. It runs into a runtime
> > > PM problem where the parent device isn't runtime PM enabled yet. I'm
> > > still trying to figure out a clean solution there. Moving runtime PM
> > > around breaks boot and I think that's because the power domain is off.
> > >
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > > Cc: Saravana Kannan <saravanak@google.com>
> > >
> > > [1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org
> > >
> >
> > I skimmed through the series and in general the idea is good, but I'm
> > not sure why each component user needs to be converted/"modern" before
> > it can make use of the benefits of this series. Why not just have
> > wrapper functions around the component ops that the new aggregate bus
> > driver can just call? That'll give all the existing component users
> > the new ability to use the new ops without having to have two
> > versions.
> 
> The existing users can only have one or the other. Either use the ops
> structure or use the struct aggregate_driver. What benefits of this
> series are they not gaining?
> 
> > That'll also allow us to do other improvements (I have some
> > in mind) that'll apply to all the component users instead of only the
> > converted ones.
> 
> What do you have in mind? I didn't want to convert drivers over to the
> new way of doing things without making them consciously change their
> code. Otherwise I worry it will break things in random, subtle ways. The
> last patch, as I mentioned above in the cover, causes warnings because
> the display driver is enabling runtime PM in an odd spot as part of the
> bind callback of the aggregate/master. That should move out of there and
> into the msm_pdev driver that registers the aggregate from what I can
> tell.

Hm yeah that's annoying. Another thing to check is that there's no locking
issues with lockdep enabled. But there's plenty of other places that
register/bind drivers within other drivers, so it should all work.

I think this is a good reason why more drivers should be converted (in
separate patches) so that we get a lot more testing and can find bugs in
the design.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
