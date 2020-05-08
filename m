Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5771CA8E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 13:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgEHLDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 07:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726638AbgEHLDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 07:03:19 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD56C05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 04:03:18 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id s11so810666vsm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xsARK8m2kbq0Zr2zKJTKwOxWZK2b9prwvHMpuqEUsJE=;
        b=cGnZ0+ZF/Dx8pTwaHccjYE+sv8QDNdIrTeTdUueGoQQpqwxEgD5P7spn5lqDL3T1hH
         xBOYz3suUIVyNyxUDjr8ENFzWCf3sAXP0EVlb2ffYYGcMmrVYiBOq/bGK2BK+rK7Wxat
         PoU+z0UDXSKIyAazVWK9/DCKfYG+BfW4vJA9lTuY5hE+aFHmAW40owKTeex1dG/pCzF7
         s4SSf2tm22GeMEPSNCHjiuajvOWvwZZ/GOpprxHSTGHDIuQqf/XJ2pK1xH5HHlyAXNTA
         xWybVQHKdZzobYQC9NCErKI763B0iuHm6wB7NPY3StdLFxY/75nDf0ircWN/9p1uOetI
         7rNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xsARK8m2kbq0Zr2zKJTKwOxWZK2b9prwvHMpuqEUsJE=;
        b=dsEhC+8fWrWRc12uBMpFwaWwcV2bZ6vwFTHDGjyIpkAM2dmb5Y3kOc2BHCqMnzqtVn
         sO4IUur7LehwPxGw3mAY7PTdg1Rrqq35fJ2OdgAX0TLg9u5t/MqNEqOJa6RgZ22lENq5
         rp1ZGPOSAIONJv9LySm6xepM4GbinXhJsaiYZnzV+o+Zb5674k/x9AOx9bZQFVRFVn4o
         WN9Bu5sxBeICwvWfMu318fnIhLOsScecZnX210dtVb0htVShzMZMHi+TNXQZrWE3RXik
         HNNH6fgrnznQJjPfhf9oVZfgXbntxv8jHKNTbbcBNuW7JS55rmDbrOPuitfnqz0qPdhD
         AQhA==
X-Gm-Message-State: AGi0PuaJRM3U1/9VnMOsb/60QgDUUMXiH/HsevJqKA+y+nELvCPr5uIR
        2Kx/qSRNs5dI1xIzum1g3JjQOYT7SFQBy0J4Epc=
X-Google-Smtp-Source: APiQypLg2nw5JS30eG8gfMVjlZF4wIipc4S2/yOsZLaXmtS+vGoewtpS8IoEdUfGSOrd+rZntJigiKbfMoHIRnpR+68=
X-Received: by 2002:a67:2c16:: with SMTP id s22mr1247832vss.85.1588935792154;
 Fri, 08 May 2020 04:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-11-emil.l.velikov@gmail.com> <20200508064053.GB1383626@phenom.ffwll.local>
In-Reply-To: <20200508064053.GB1383626@phenom.ffwll.local>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Fri, 8 May 2020 12:00:40 +0100
Message-ID: <CACvgo53fa1R3gD8hCg+Ch2Tj0ZnDVScNXiZO5FbGfK_VbAP_nQ@mail.gmail.com>
Subject: Re: [PATCH 10/36] drm/gem: add _locked suffix to drm_object_put
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 8 May 2020 at 07:40, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, May 07, 2020 at 04:07:56PM +0100, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > Vast majority of DRM (core and drivers) are struct_mutex free.
> >
> > As such we have only a handful of cases where the locked helper should
> > be used. Make that stand out a little bit better.
> >
> > Done via the following script:
> >
> > __from=drm_gem_object_put
> > __to=drm_gem_object_put_locked
> >
> > for __file in $(git grep --name-only --word-regexp $__from); do
> >   sed -i  "s/\<$__from\>/$__to/g" $__file;
> > done
> >
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
>
> Since
>
> commit 48e7f18392c66f9b69ebac11c54f1a2e033ced54
> Author: Kristian H. Kristensen <hoegsberg@gmail.com>
> Date:   Wed Mar 20 10:09:08 2019 -0700
>
>     drm/msm: Implement .gem_free_object_unlocked
>
> msm doesn't need the struct_mutex in the bo_put anymore, the only reason
> we had to use the _locked version here is historical accidents I think.
>
> I think you could convert these all to the _unlocked variant and then
> entirely drop the _locked version.
>
Did not check the msm driver closely, but it makes sense. Let's keep
that as follow-up series?
We're already at 36 patches, plus mixing mostly mechanical and locking
changes doesn't sound wise.

> Once we have that we could move struct_mutex into each driver (at least
> for msm and i915) since it's purely internal, and then wrap it in an
> #ifdef CONFIG_DRM_LEGACY to gloriously sunset it all :-)
>
Indeed, we're nearly there.

-Emil
