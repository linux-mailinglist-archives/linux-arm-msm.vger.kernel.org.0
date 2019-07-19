Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8E16E31A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 11:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfGSJF7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 05:05:59 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42260 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfGSJF6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 05:05:58 -0400
Received: by mail-ed1-f68.google.com with SMTP id v15so33851828eds.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2019 02:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=58ReAIoQq8wEmL8BTM+vhh8BmnoSmKiAjn22g3TRn8A=;
        b=fuIUS7cZNX8+X1WJEfd5HZQkQ+XRs569C1Lk5Xt3hbdagNbt4BsmoRpGucm9Dqp7c+
         jdV9jsXACjiH+sIdOz/TySDTN/T+SU6OeY9N4mzseUx359tmhWGabO3QCljKUZRJkO4x
         +rgDZnjr2WHTXwLeqta/vZHku2WdnurN0Zss0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=58ReAIoQq8wEmL8BTM+vhh8BmnoSmKiAjn22g3TRn8A=;
        b=UG4rOl2/fGi0wD+Z+NKKXpiUPX18jFF4qFeytjyhhxVD+2yeYmCvd4KvbsPCUI2D+J
         wXjtHqZimPI4qLEjPUJxGw58egPIUxnLFMVbkMcClvndwa0EkfUhnzgiDYBqaIFTck9B
         4NVmTdIa6PrvZc/w3quXDTCw4ju3fEjEtbYqJ/ABTqrmqLQOKCkYDZZ+S4zh5r2goajf
         Dq7TGJbURrFlqMSfOGxUZQJSdGOeAJRD9jruuwNGAlYY7GzcY60gufcjuHc6wLdUJdFC
         9cSB2ZEYckBEQhrVbFjH4cG1PbeOC8iG11lVEZwUKwt1M+Vrt/Jwtn34OiVGh9v17d9H
         eAaQ==
X-Gm-Message-State: APjAAAXFrYg2xqYeK2vtVhj50NFrLp8JufnHCoBo6C2+WHHV95rHNSNd
        URqskcRs5rN8iVmqrUyL8QQ=
X-Google-Smtp-Source: APXvYqxKWkHiETj8QiV/6v9sPPn3a6h3Fcs93lPEOlq1VTeSnK29mqw8ew8q9+aUrxxNuIZfV/ZIKA==
X-Received: by 2002:a17:906:90cf:: with SMTP id v15mr38577072ejw.77.1563527156359;
        Fri, 19 Jul 2019 02:05:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id w27sm8805587edw.63.2019.07.19.02.05.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 02:05:55 -0700 (PDT)
Date:   Fri, 19 Jul 2019 11:05:53 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jeykumar Sankaran <jsanka@codeaurora.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org, robdclark@gmail.com, pdhaval@codeaurora.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
Message-ID: <20190719090553.GF15868@phenom.ffwll.local>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
 <20190716090712.GY15868@phenom.ffwll.local>
 <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 18, 2019 at 11:18:42AM -0700, Jeykumar Sankaran wrote:
> On 2019-07-16 02:07, Daniel Vetter wrote:
> > On Thu, Jul 11, 2019 at 11:46:44AM -0700, Jeykumar Sankaran wrote:
> > >     Hello All,
> > >     	drm_mode_modeinfo::flags is a 32 bit field currently used to
> > >     describe the properties of a connector mode. I see the least order
> > 22 bits
> > >     are already in use. Posting this RFC to discuss on any potential
> > plans to
> > >     expand the bit range support of this field for growing mode
> > properties and
> > >     ways to handle one such property needed by the msm dpu driver.
> > > 
> > >     msm drivers support panels which can dynamically switch between
> > >     video(active) and command(smart) modes. Within video mode, they
> > > also
> > support
> > >     switching between resolutions seamlessly i.e. glitch free
> > > resolution
> > switch.
> > >     But they cannot do a seamless switch from a resolutions from video
> > to
> > >     command or vice versa. Clients need to be aware for these
> > capablities before
> > >     they switch between the resolutions. Since these capabilities are
> > identified
> > >     per drm_mode, we are considering the below two approaches to
> > > handle
> > this
> > >     use case.
> > > 
> > >     Option 1:
> > >     Attached patch adds flag values to associate a drm_mode to
> > video/command
> > >     mode and to indicate its capability to do a seamless switch.
> > > 
> > >     Option 2:
> > >     drm_mode_modeinfo can expose a new "private_flags" field to handle
> > vendor
> > >     specific mode flags. Besides the above mentioned use case, we are
> > also
> > >     expoloring methods to handle some of our display port resolution
> > switch use
> > >     cases where the DP ports can be operated in a tiled/detiled modes.
> > This
> > >     approach will provide a standard channel for drm driver vendors
> > > for
> > their
> > >     growing need for drm_mode specific capabilities.
> > > 
> > >     Please provide your inputs on the options or any upstream friendly
> > >     recommendation to handle such custom use cases.
> > > 
> > >     Thanks and Regards,
> > >     Jeykumar S.
> > > 
> > > Jeykumar Sankaran (1):
> > >   drm: add mode flags in uapi for seamless mode switch
> > 
> > I think the uapi is the trivial part here, the real deal is how
> > userspace
> > uses this. Can you pls post the patches for your compositor?
> > 
> > Also note that we already allow userspace to tell the kernel whether
> > flickering is ok or not for a modeset. msm driver could use that to at
> > least tell userspace whether a modeset change is possible. So you can
> > already implement glitch-free modeset changes for at least video mode.
> > -Daniel
> 
> I believe you are referring to the below tv property of the connector.
> 
> /**
>  * @tv_flicker_reduction_property: Optional TV property to control the
>  * flicker reduction mode.
>  */
> struct drm_property *tv_flicker_reduction_property;

Not even close :-)

I mean the DRM_MODE_ATOMIC_ALLOW_MODESET flag for the atomic ioctl. This
is not a property of a mode, this is a property of a _transition_ between
configurations. Some transitions can be done flicker free, others can't.

There's then still the question of how to pick video vs command mode, but
imo better to start with implementing the transition behaviour correctly
first.
-Daniel

> 
> Sure. We can use this to indicate whether the connector representing the
> panel
> can support the dynamic glitch-free switch. But when the panel supports both
> video and command mode resolutions and such glitch-free switch is possible
> only between
> video mode resolutions, we need per resolution(drm_mode_modeinfo)
> information
> to identify the resolutions enumerated for video mode.
> 
> Below is an example of the compositor utility function which can use the
> tv_flicker_property
> and the proposed modeinfo flags to identify glitch-free switches.
> 
>  bool is_seamless_switch_supported(struct drm_mode_modeinfo src_mode, struct
>                  drm_mode_modeinfo *dst_mode, bool
> flicker_reduction_supported)
>  {
>          if (!flicker_reduction_supported) {
>                  printf("flicker reduction prop not set for the
> connector\n");
>                  return false;
>          }
> 
>          /*
>           * Seamless switch(if supported) is possible only between video
> mode
>           * resolutions
>           */
>          if (src_mode->flags & DRM_MODE_FLAG_VIDEO_MODE &&
>                          dst_mode->flags & DRM_MODE_FLAG_VIDEO_MODE)
>                  return true;
>          else
>                  return false;
> 
>  }
> 
> 
> -- 
> Jeykumar S

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
