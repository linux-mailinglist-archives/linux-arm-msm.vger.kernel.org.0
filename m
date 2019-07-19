Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E98E6E75C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 16:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbfGSOaB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 10:30:01 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37186 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727717AbfGSOaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 10:30:01 -0400
Received: by mail-qt1-f194.google.com with SMTP id y26so31153674qto.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2019 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=VgGzgACxbuAr1WfrZf7Di5N8bvGrichlRILKSX90qEA=;
        b=OG+zoI/Gr3rCL4n3YLQz/VzBvTqAcQH2YGj4dOvWfEIPDhs6/xqsc/wbZNDjV+42XI
         CvALdJiuZkiC4K5IW4SxW6yJ3NWBJI2YTVcPgAOFejWvbIym9nVhEsTUnq2qmN92AnJm
         S1z81DvDRbK/H6xHveDVeOoxQlYESyCNRcEkGhuBdJY7Scj6voS+YgJj5o5pyR3Y1vtX
         q6WBn9EIaOGSt5QUN7wRyQ5F52t//XrhaE6pvNqRVZAa5qipoC2sL8UtJsGXls8ECv24
         DBdKOwyd38wa3jkkZ7HOXyiZYgdO1Eta3vmYTP7+19BvH9ezBA02ZXrO9Fry2sMbBXv6
         gYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=VgGzgACxbuAr1WfrZf7Di5N8bvGrichlRILKSX90qEA=;
        b=JohJmshaHaBPp+g7Z/kRLAB6p8Pt4m9n9ycfMipO9+An8Dm8sIDV3oBafmPsmdrPMa
         0OciaqaiMqOcKKyiLoj6PB/4xfeLOlT3QRqDJpm2zR9kFaQ2mcbbjlIJYio/FDWrBsTh
         d4uEukSaNlRJJ+45aG5YtRItU6lyogHd+EirJvJLKGbfbwvieCqT9yJoQ4NMY28FSEYd
         h0jwasII6iKrCEnYYL8R1DckUtBTKtCQFBsnkIIOQEI/ATTMcHndabYO4k2PR/tvxDol
         iE15CvJRQ8Ixzn7Pz9fcg8fZdYtWInmTv7hQjmqyKM6h/6GACkFDD76YNJaO81js8qVy
         IeLA==
X-Gm-Message-State: APjAAAWlqTre3BavSLAgyox3oZAKn5nTXnM/V6JZOA8BATK/Oj3m184R
        8isUt8z/VtLv1W0Qli8U/77Vzw==
X-Google-Smtp-Source: APXvYqyiV6BEK6L7QlUrxkx0Q/3IuMSb5JrAJ6Lu4nQ8M2EcGMFjw566l6GMctEIO7Y6xBwCbplpXA==
X-Received: by 2002:ac8:34c5:: with SMTP id x5mr35858737qtb.91.1563546600009;
        Fri, 19 Jul 2019 07:30:00 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id t2sm18236556qth.33.2019.07.19.07.29.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 07:29:59 -0700 (PDT)
Date:   Fri, 19 Jul 2019 10:29:59 -0400
From:   Sean Paul <sean@poorly.run>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        pdhaval@codeaurora.org, seanpaul@chromium.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
Message-ID: <20190719142959.GD104440@art_vandelay>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
 <20190716090712.GY15868@phenom.ffwll.local>
 <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
 <20190719090553.GF15868@phenom.ffwll.local>
 <20190719135558.GC104440@art_vandelay>
 <20190719141528.GN5942@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190719141528.GN5942@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 19, 2019 at 05:15:28PM +0300, Ville Syrjälä wrote:
> On Fri, Jul 19, 2019 at 09:55:58AM -0400, Sean Paul wrote:
> > On Fri, Jul 19, 2019 at 11:05:53AM +0200, Daniel Vetter wrote:
> > > On Thu, Jul 18, 2019 at 11:18:42AM -0700, Jeykumar Sankaran wrote:
> > > > On 2019-07-16 02:07, Daniel Vetter wrote:
> > > > > On Thu, Jul 11, 2019 at 11:46:44AM -0700, Jeykumar Sankaran wrote:

/snip

> > > > > >   drm: add mode flags in uapi for seamless mode switch
> > > > > 
> > > > > I think the uapi is the trivial part here, the real deal is how
> > > > > userspace
> > > > > uses this. Can you pls post the patches for your compositor?
> > > > > 
> > > > > Also note that we already allow userspace to tell the kernel whether
> > > > > flickering is ok or not for a modeset. msm driver could use that to at
> > > > > least tell userspace whether a modeset change is possible. So you can
> > > > > already implement glitch-free modeset changes for at least video mode.
> > > > > -Daniel
> > > > 
> > > > I believe you are referring to the below tv property of the connector.
> > > > 
> > > > /**
> > > >  * @tv_flicker_reduction_property: Optional TV property to control the
> > > >  * flicker reduction mode.
> > > >  */
> > > > struct drm_property *tv_flicker_reduction_property;
> > > 
> > > Not even close :-)
> > > 
> > > I mean the DRM_MODE_ATOMIC_ALLOW_MODESET flag for the atomic ioctl. This
> > > is not a property of a mode, this is a property of a _transition_ between
> > > configurations. Some transitions can be done flicker free, others can't.
> > 
> > Agree that an atomic flag on a commit is the way to accomplish this. It's pretty
> > similar to the psr transitions, where we want to reuse most of the atomic
> > circuitry, but in a specialized way. We'd also have to be careful to only
> > involve the drm objects which are seamless modeset aware (you could imagine
> > a bridge chain where the bridges downstream of the first bridge don't care).
> > 
> > > 
> > > There's then still the question of how to pick video vs command mode, but
> > > imo better to start with implementing the transition behaviour correctly
> > > first.
> > 
> > Connector property? Possibly a terrible idea, but I wonder if we could [re]use
> > the vrr properties for command mode. The docs state that the driver has the
> > option of putting upper and lower bounds on the refresh rate.
> 
> Not really sure why this needs new props and whatnot. This is kinda what
> the i915 "fastset" stuff already does:
> 1. userspace asks for something to be changed via atomic
> 2. driver calculates whether a modeset is actually required
> 3. atomic validates need_modeset() vs. DRM_MODE_ATOMIC_ALLOW_MODESET
> 4. if (need_modeset) heavyweight_commit() else lightweight_commit()
> 
> Ie. why should userspace really care about anything except the
> "flickers are OK" vs. "flickers not wanted" thing?

Agree, I don't think the seamless modeset (ie: changing resolution without
flicker) needs a property. Just need to test the commit without ALLOW_MODESET
and commit it if the test passes.

> 
> Also what's the benefit of using video mode if your panel supportes
> command mode? Can you turn off the memory in the panel and actually
> save power that way? And if there is a benefit can't the driver just
> automagically switch between the two based on how often things are
> getting updated? That would match how eDP PSR already works.

I'm guessing video mode might have some latency benefits over command mode?

Sean

> 
> -- 
> Ville Syrjälä
> Intel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
