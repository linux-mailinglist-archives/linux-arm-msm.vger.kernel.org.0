Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859AB6E6EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 15:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbfGSN4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 09:56:00 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:39879 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfGSN4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 09:56:00 -0400
Received: by mail-yw1-f67.google.com with SMTP id x74so13560989ywx.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2019 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BSIPZkuniCkuCcmdIBEwmO7BRbnuOqFngqEdx0Lw5Bw=;
        b=OgW6UBCUGBofY1QDkZnH2+kYqrK0+lIA0cG22LAN+fd0/fHgG4cJsagvQABaLp/7Ch
         c/geOliguSFQ4tmMwX0CmTZeoHpz3K4gPjbto3LZrH8TXB8cofzUqOrNfI1DZshcexhe
         ZTryxVpbeJSaMjkW+2RVSYXaZPtfLFsgD3LvpxpNbFpzlE4RGZztAoUYRSE4LpfrGjZh
         b4nMeCoT8wtiB78+MXk9N1QSN6dWgUzeTQyGoQZ6c5skUTt2vpF7RsaTVeOuqzIzxJuP
         GVg6+lt14SQHlRd0gH1MERa//ODVyAsDFQhbcHWIWHMXNq0b2srQYSJIt4PwNTq3kmkC
         msGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BSIPZkuniCkuCcmdIBEwmO7BRbnuOqFngqEdx0Lw5Bw=;
        b=V7nVgl3TcRqVb+VCEZ9yu1N8u7ED1dq7bzeeBibh7nb/1SK/PWitB0UKVTuQuf2V6v
         LO4ksmpFU7aM/UDxjM0vZ+uYhwe3s9oxGGcm8ffmtXykh1GKkPTUj4ZSxOnUZEKW8erI
         VZePVc4tBvW6l+Tpm37vmxk4KE4GhaSZ6g872DlR7TWZkcDszeabr91gSa8b0jQ52i1z
         jP+6fMZ1htcuiFNzWiKIxuPlzngvC06Mmlb1zCGYuwBEWP3XHuv74/ObPFVsoYuS4NNt
         h5fIWWlPqdlQ/vwDJftfv8579Ts6lGkl77n0j2WJrvC4Xn/ROwqA7UtfihHy7HeKud9e
         xp1A==
X-Gm-Message-State: APjAAAU1wG4b12kIVCXvt5blPOEjjiYP6jipUj5aN6RLDUmQ0K+EkrKl
        DxtQH/czJ8e70jxKmTn8UW7E6TW5wrOZYw==
X-Google-Smtp-Source: APXvYqz05m0JGwwu7kzI6gXU5ILrkKUlE1TaZXEIU0nf2acA0ktDOapsbkyNUoIMW9nAGbz/czpAUQ==
X-Received: by 2002:a81:a984:: with SMTP id g126mr19971376ywh.414.1563544558983;
        Fri, 19 Jul 2019 06:55:58 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id w5sm6023172ywd.95.2019.07.19.06.55.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 06:55:58 -0700 (PDT)
Date:   Fri, 19 Jul 2019 09:55:58 -0400
From:   Sean Paul <sean@poorly.run>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Jeykumar Sankaran <jsanka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        pdhaval@codeaurora.org, seanpaul@chromium.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
Message-ID: <20190719135558.GC104440@art_vandelay>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
 <20190716090712.GY15868@phenom.ffwll.local>
 <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
 <20190719090553.GF15868@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719090553.GF15868@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 19, 2019 at 11:05:53AM +0200, Daniel Vetter wrote:
> On Thu, Jul 18, 2019 at 11:18:42AM -0700, Jeykumar Sankaran wrote:
> > On 2019-07-16 02:07, Daniel Vetter wrote:
> > > On Thu, Jul 11, 2019 at 11:46:44AM -0700, Jeykumar Sankaran wrote:
> > > >     Hello All,
> > > >     	drm_mode_modeinfo::flags is a 32 bit field currently used to
> > > >     describe the properties of a connector mode. I see the least order
> > > 22 bits
> > > >     are already in use. Posting this RFC to discuss on any potential
> > > plans to
> > > >     expand the bit range support of this field for growing mode
> > > properties and
> > > >     ways to handle one such property needed by the msm dpu driver.
> > > > 
> > > >     msm drivers support panels which can dynamically switch between
> > > >     video(active) and command(smart) modes. Within video mode, they
> > > > also
> > > support
> > > >     switching between resolutions seamlessly i.e. glitch free
> > > > resolution
> > > switch.
> > > >     But they cannot do a seamless switch from a resolutions from video
> > > to
> > > >     command or vice versa. Clients need to be aware for these
> > > capablities before
> > > >     they switch between the resolutions. Since these capabilities are
> > > identified
> > > >     per drm_mode, we are considering the below two approaches to
> > > > handle
> > > this
> > > >     use case.
> > > > 
> > > >     Option 1:
> > > >     Attached patch adds flag values to associate a drm_mode to
> > > video/command
> > > >     mode and to indicate its capability to do a seamless switch.
> > > > 
> > > >     Option 2:
> > > >     drm_mode_modeinfo can expose a new "private_flags" field to handle
> > > vendor
> > > >     specific mode flags. Besides the above mentioned use case, we are
> > > also
> > > >     expoloring methods to handle some of our display port resolution
> > > switch use
> > > >     cases where the DP ports can be operated in a tiled/detiled modes.
> > > This
> > > >     approach will provide a standard channel for drm driver vendors
> > > > for
> > > their
> > > >     growing need for drm_mode specific capabilities.
> > > > 
> > > >     Please provide your inputs on the options or any upstream friendly
> > > >     recommendation to handle such custom use cases.
> > > > 
> > > >     Thanks and Regards,
> > > >     Jeykumar S.
> > > > 
> > > > Jeykumar Sankaran (1):
> > > >   drm: add mode flags in uapi for seamless mode switch
> > > 
> > > I think the uapi is the trivial part here, the real deal is how
> > > userspace
> > > uses this. Can you pls post the patches for your compositor?
> > > 
> > > Also note that we already allow userspace to tell the kernel whether
> > > flickering is ok or not for a modeset. msm driver could use that to at
> > > least tell userspace whether a modeset change is possible. So you can
> > > already implement glitch-free modeset changes for at least video mode.
> > > -Daniel
> > 
> > I believe you are referring to the below tv property of the connector.
> > 
> > /**
> >  * @tv_flicker_reduction_property: Optional TV property to control the
> >  * flicker reduction mode.
> >  */
> > struct drm_property *tv_flicker_reduction_property;
> 
> Not even close :-)
> 
> I mean the DRM_MODE_ATOMIC_ALLOW_MODESET flag for the atomic ioctl. This
> is not a property of a mode, this is a property of a _transition_ between
> configurations. Some transitions can be done flicker free, others can't.

Agree that an atomic flag on a commit is the way to accomplish this. It's pretty
similar to the psr transitions, where we want to reuse most of the atomic
circuitry, but in a specialized way. We'd also have to be careful to only
involve the drm objects which are seamless modeset aware (you could imagine
a bridge chain where the bridges downstream of the first bridge don't care).

> 
> There's then still the question of how to pick video vs command mode, but
> imo better to start with implementing the transition behaviour correctly
> first.

Connector property? Possibly a terrible idea, but I wonder if we could [re]use
the vrr properties for command mode. The docs state that the driver has the
option of putting upper and lower bounds on the refresh rate.

Sean

> -Daniel
> 
> > 
> > Sure. We can use this to indicate whether the connector representing the
> > panel
> > can support the dynamic glitch-free switch. But when the panel supports both
> > video and command mode resolutions and such glitch-free switch is possible
> > only between
> > video mode resolutions, we need per resolution(drm_mode_modeinfo)
> > information
> > to identify the resolutions enumerated for video mode.
> > 
> > Below is an example of the compositor utility function which can use the
> > tv_flicker_property
> > and the proposed modeinfo flags to identify glitch-free switches.
> > 
> >  bool is_seamless_switch_supported(struct drm_mode_modeinfo src_mode, struct
> >                  drm_mode_modeinfo *dst_mode, bool
> > flicker_reduction_supported)
> >  {
> >          if (!flicker_reduction_supported) {
> >                  printf("flicker reduction prop not set for the
> > connector\n");
> >                  return false;
> >          }
> > 
> >          /*
> >           * Seamless switch(if supported) is possible only between video
> > mode
> >           * resolutions
> >           */
> >          if (src_mode->flags & DRM_MODE_FLAG_VIDEO_MODE &&
> >                          dst_mode->flags & DRM_MODE_FLAG_VIDEO_MODE)
> >                  return true;
> >          else
> >                  return false;
> > 
> >  }
> > 
> > 
> > -- 
> > Jeykumar S
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
