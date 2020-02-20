Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD461665FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 19:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgBTSOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 13:14:47 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34533 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbgBTSOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 13:14:47 -0500
Received: by mail-wm1-f66.google.com with SMTP id s144so3379470wme.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 10:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gznl4640Pmjty68zKptsYkWkjNeUmDBlZFmAL3gSFPE=;
        b=YbsgFHprAZngpJ64emSEHbG/VsiZpyqbsgRuOHCXapQk3shJhhfNfjXpx0xrWdI1qt
         TInKZ6bAFGf/E6AENPaHYpSbVNWGhcsIFaUvfjpGJcABfkb49W5N+AxmkDR6BWI21DFn
         avUc4a4TTWJunNOed0cmyQwM+/q6KqPcoNFwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gznl4640Pmjty68zKptsYkWkjNeUmDBlZFmAL3gSFPE=;
        b=TSsH95M6Dp+4JzDSVtZ7YFyX2slZjE2wRtqwD8FbABybO2TtbDLS4IVg4yutjVAej6
         V2MQ7tCzsoAysiE8wC9c53YIuqeFOZDF9CzlAQJMxHhWVJqiuoZLqYOPh0OPWuLWHgje
         I51T4X57Hu3FA/euNxGC0hAcqrlDbVhFDylaI0vrV+QFv+Dbek5MosVe3F2FjicK5o/m
         KupFgD+akgWmexbCumXdKWesED7CMw0xQjYKzDBtMhOLkKIMHB5aqB7JdkEwlC2LlLUE
         blhg8zKpRdpe/RzbeaR1pcyCmt5QAkEXyuZd1/h7qyucdMSSO6n7TbF5pPItOMXUhRoF
         wm4g==
X-Gm-Message-State: APjAAAUgYpy2X+1eEG9SJcKwn2i4krNc88DcwdzT9MUtsC65+JSeW6ZM
        yPZ+MT0sewlnDtmNOXGQhEO3g0IV9ME=
X-Google-Smtp-Source: APXvYqzTWpnmL8Z8rp8OENnYGEbj5HolTszXBtFYgJQK5//Eu/POgaU/ZY2vHhLmewsS8dUgPRJZkA==
X-Received: by 2002:a1c:990b:: with SMTP id b11mr5769459wme.15.1582222484712;
        Thu, 20 Feb 2020 10:14:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c141sm98136wme.41.2020.02.20.10.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 10:14:44 -0800 (PST)
Date:   Thu, 20 Feb 2020 19:14:42 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     Emil Velikov <emil.l.velikov@gmail.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 05/12] drm/msm/dpu: Stop copying around
 mode->private_flags
Message-ID: <20200220181442.GV2363188@phenom.ffwll.local>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-6-ville.syrjala@linux.intel.com>
 <CACvgo50oWkF8vjpGmOYSwaK+khZuAE0yW_npf2UEMQoRTokLBA@mail.gmail.com>
 <20200220153309.GB13686@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200220153309.GB13686@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 20, 2020 at 05:33:09PM +0200, Ville Syrjälä wrote:
> On Thu, Feb 20, 2020 at 11:24:20AM +0000, Emil Velikov wrote:
> > On Wed, 19 Feb 2020 at 20:36, Ville Syrjala
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > >
> > > The driver never sets mode->private_flags so copying
> > > it back and forth is entirely pointless. Stop doing it.
> > >
> > > Also drop private_flags from the tracepoint.
> > >
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Cc: freedreno@lists.freedesktop.org
> > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Perhaps the msm team has a WIP which makes use of it ?
> 
> Maybe if it's one of them five year projects. But anyways, 
> with an atomic driver there are certainly better ways to
> handle this.

Yeah with atomic you have your display mode in drm_crtc_state, which
you're subposed to subclass so that you can have terabytes of private
state. At least in theory :-)

->private_flags was really only useful in pre-atomic drivers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
