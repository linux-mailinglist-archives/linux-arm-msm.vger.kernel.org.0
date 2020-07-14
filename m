Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1D72200CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 00:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgGNWy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 18:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgGNWy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 18:54:27 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F89C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 15:54:27 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l63so36002pge.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 15:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3y0aRHGaKLcjgwTZ86bMCl3Kd5iHKCmsfg8nxWgSzuE=;
        b=m5pNVSgBKkI6PwKQD2vUNqG0ZLdHsap8ldYmjfwKhC+N+RIw2BMBiferTYXMbClpjp
         DpoKnsjuM90XtJwOPN4OurXsXBPpCBZWEs07T12VxyB8yN53I3XzUuzB8DOUvNVJiMcq
         wje9eSPnrY+4TlhRPNovSBBxBP5rfQ1puEAZD4Sy2XtdK//5udIt1MPngviFqsA6ZrYJ
         XxjI5/Qyqwn4cjAhgCs6pS7cSo1c8hcItjtq4BFwdh0lEc0Gf9lAomM6yarfhCvfXMyH
         FMpnMChKgP1HPaipU47gMOXvR86AkNoU42tqIPzSy+Io6W/QRI0fb2muHcr8WFNhiY53
         yaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3y0aRHGaKLcjgwTZ86bMCl3Kd5iHKCmsfg8nxWgSzuE=;
        b=dr/Fw1YOhKjxfuS4uvUmxhDbUHCMfiXl4QlK/HVwcVDlE1nOdni8Kne2fErKWUuFUl
         mB6PpHQgPcteuFuP8ZH2WYZUoTg5Tw9kQ4x1hHtyEqjS6fo11eOcAcAgFQkK5GqXlGjR
         gmBYpVVIMeubIysXPr0Zw5ZjtZnQe1mBYG9yE+mpyL7QgEqhFOBJCNlQnBgb5cXQkcUM
         VJlWP91+ftxKKaUeomCI8J/0L7Ze3p4mDuVBBCtukr/90WQ/YUnrmGy+ZPYx2U1n9EUu
         MOyC8qEJdfoZWmkLyPQbhssEV/bEeFrr8gCctb/uiOWWo6ao3n9hurdPbR4at4xvGQa+
         A5zg==
X-Gm-Message-State: AOAM530BhZ3dpLEJykuloyUTmVuWBq39X8RlIxanpMpMAKFdglHYnm7G
        0Vi58ndbc/sEvaoF+msOuAEIBg==
X-Google-Smtp-Source: ABdhPJx3Wi8OjlqSsBzWZjk6f7Ltz4EPiYqzQQwwUOpxm0+vSSgBw2G4lGptzsHtGsccxn9jxT3+WQ==
X-Received: by 2002:a62:1646:: with SMTP id 67mr6079256pfw.281.1594767266740;
        Tue, 14 Jul 2020 15:54:26 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id my9sm113099pjb.44.2020.07.14.15.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 15:54:26 -0700 (PDT)
Date:   Tue, 14 Jul 2020 15:52:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 0/9] drm/msm: Avoid possible infinite probe
 deferral and speed booting
Message-ID: <20200714225220.GI388985@builder.lan>
References: <20200710230224.2265647-1-dianders@chromium.org>
 <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
 <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com>
 <CAL_JsqLJM5nwNSdugMBLDVtjP97dikCm_AiHjnDs1jqBOFoaaQ@mail.gmail.com>
 <CAD=FV=UP0AHWr22U69TKcwwAefPCYMsfzymobczqmrdB6BOOhA@mail.gmail.com>
 <CAOCk7NoX-XAXy2WaYGjGOtEmypis-DO-W1cfU0wnucHH0oZrqg@mail.gmail.com>
 <CAL_Jsq+Nys+ry-3D07e-68e=9Pb34C9Js6piAnzwd1gXf_DmTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Nys+ry-3D07e-68e=9Pb34C9Js6piAnzwd1gXf_DmTw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 14 Jul 15:13 PDT 2020, Rob Herring wrote:

> On Tue, Jul 14, 2020 at 10:33 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Mon, Jul 13, 2020 at 5:50 PM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Jul 13, 2020 at 1:25 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > >
> > > > On Mon, Jul 13, 2020 at 9:08 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Jul 13, 2020 at 7:11 AM Rob Herring <robh+dt@kernel.org> wrote:
> > > > > >
> > > > > > On Fri, Jul 10, 2020 at 5:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > > > > >
> > > > > > > I found that if I ever had a little mistake in my kernel config,
> > > > > > > or device tree, or graphics driver that my system would sit in a loop
> > > > > > > at bootup trying again and again and again.  An example log was:
> > > > > >
> > > > > > Why do we care about optimizing the error case?
> > > > >
> > > > > It actually results in a _fully_ infinite loop.  That is: if anything
> > > > > small causes a component of DRM to fail to probe then the whole system
> > > > > doesn't boot because it just loops trying to probe over and over
> > > > > again.  The messages I put in the commit message are printed over and
> > > > > over and over again.
> > > >
> > > > Sounds like a bug as that's not what should happen.
> > > >
> > > > If you defer during boot (initcalls), then you'll be on the deferred
> > > > list until late_initcall and everything is retried. After
> > > > late_initcall, only devices getting added should trigger probing. But
> > > > maybe the adding and then removing a device is causing a re-trigger.
> > >
> > > Right, I'm nearly certain that the adding and then removing is causing
> > > a re-trigger.  I believe the loop would happen for any case where we
> > > have a probe function that:
> > >
> > > 1. Adds devices.
> > > 2. After adding devices it decides that it needs to defer.
> > > 3. Removes the devices it added.
> > > 4. Return -EPROBE_DEFER from its probe function.
> > >
> > > Specifically from what I know about how -EPROBE_DEFER works I'm not
> > > sure how it wouldn't cause an infinite loop in that case.
> > >
> > > Perhaps the missing part of my explanation, though, is why it never
> > > gets out of this infinite loop.  In my case I purposely made the
> > > bridge chip "ti-sn65dsi86.c" return an error (-EINVAL) in its probe
> > > every time.  Obviously I wasn't going to get a display up like this,
> > > but I just wanted to not loop forever at bootup.  I tracked down
> > > exactly why we get an - EPROBE_DEFER over and over in this case.
> > >
> > > You can see it in msm_dsi_host_register().  If some components haven't
> > > shown up when that function runs it will _always_ return
> > > -EPROBE_DEFER.
> > >
> > > In my case, since I caused the bridge to fail to probe, those
> > > components will _never_ show up.  That means that
> > > msm_dsi_host_register() will _always_ return -EPROBE_DEFER.
> > >
> > > I haven't dug through all the DRM code enough, but it doesn't
> > > necessarily seem like the wrong behavior.  If the bridge driver or a
> > > panel was a module then (presumably) they could show up later and so
> > > it should be OK for it to defer, right?
> > >
> > > So with all that, it doesn't really feel like this is a bug so much as
> > > it's an unsupported use case.  The current deferral logic simply can't
> > > handle the case we're throwing at it.  You cannot return -EPROBE_DEFER
> > > if your probe function adds devices each time through the probe
> > > function.
> > >
> > > Assuming all the above makes sense, that means we're stuck with:
> > >
> > > a) This patch series, which makes us not add devices.
> > >
> > > b) Some other patch series which rearchitects the MSM graphics stack
> > > to not return -EPROBE_DEFER in this case.
> >
> > This isn't a MSM specific issue.  This is an issue with how the DSI
> > interface works, and how software is structured in Linux.  I would
> > expect that pretty much any DSI host in the kernel would have some
> > version of this issue.
> >
> > The problem is that DSI is not "hot pluggable", so to give the DRM
> > stack the info it needs, we need both the DSI controller (aka the MSM
> > graphics stack in your case), and the thing it connects to (in your
> > case, the TI bridge, normally the actual panel) because the DRM stack
> > expects that if init completes, it has certain information
> > (resolution, etc), and some of that information is in the DSI
> > controller, and some of it is on the DSI device.
> 
> Ah yes, DRM's lack of hot-plug and discrete component support... Is
> that not improved with some of the bridge rework?
> 
> Anyways, given there is a child dependency on the parent, I don't
> think we should work-around DRM deficiencies in DT.
> 
> BTW, There's also a deferred probe timeout you can use which stops
> deferring probe some number of seconds after late_initcall.
> 

I don't think we can rely on the deferred probe timeout, given that it
was reverted back to 0 seconds past late_initcall - which given that
most of the involved components are modules, means that without the
opt-in command line option we would likely fail to bring up the display.

Regards,
Bjorn
