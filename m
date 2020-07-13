Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23FC621D9C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 17:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729492AbgGMPIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 11:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbgGMPI3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 11:08:29 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7B6C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 08:08:29 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id j21so4179568ual.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jL0qg9txtW+UzBOFpRiVbZ1cvNjK+k+Z2zD2+dWd5xU=;
        b=Rrznap+7c3ejPjjRxwh934nQUUwJZgqI+M3shHiuekSOP8O2XMiQptg6HCTZ3/GqCq
         PtvZbvQ+9M7G4UEaYbk2Zkurr6mOU2qKAsB6gunmVxW0xlHUEsKN65rqdz5KBVIGQVuf
         s4ezGY5pV1pLxDDQrvlXGCCUyp85khIBh+8xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jL0qg9txtW+UzBOFpRiVbZ1cvNjK+k+Z2zD2+dWd5xU=;
        b=s8V3d/6L85j3XfoqRBV7QDWmxVGamMxrlF7SV4b3+457RIGP8JAZnsLGpxH3Ks8rxw
         Vl/iVgNojl9rX2KpEUVY3TeiROrBIouZMyJDKcibnaT/G++q6ghpBCmDQUIFlZrTPkc6
         NwzPYtOP4X5ydsQ2hDP913FZtb5zF9SnQ4wj32EWsqzjPa5d/y9g4Fw8yaBP9uzGsS1R
         p5V5ABI18Zks4gQBrKhHrL+iP0PeLhQNx1BrWfIhUNCviSXvI5RFUBYCnaAqvSXSp12o
         OzbgI4ZrEblPrAGJ1AwneE5qc5ib2VI57yHg7ExNkkBvT+q4b4FPDcvum1ffSYkNduCR
         U/ow==
X-Gm-Message-State: AOAM531UvrfRmx1izglTrJJUFuvbDsAPnDAgl6L/jX9vag0Psv8cqbxJ
        JElHKPCQLCDWZEqdkS5GU6nr3s5aMag=
X-Google-Smtp-Source: ABdhPJxbY43fa2Km0Oq5Huv9VxDWRpl5Aw+4hbMt9JQlpOZzs59/k91mllihnAVG+xoIi9zPE96pvw==
X-Received: by 2002:ab0:7504:: with SMTP id m4mr59749uap.16.1594652908362;
        Mon, 13 Jul 2020 08:08:28 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id v10sm2090095vkv.41.2020.07.13.08.08.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 08:08:27 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id d11so4264085vsq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 08:08:27 -0700 (PDT)
X-Received: by 2002:a05:6102:20a:: with SMTP id z10mr50329603vsp.213.1594652906281;
 Mon, 13 Jul 2020 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200710230224.2265647-1-dianders@chromium.org> <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
In-Reply-To: <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Jul 2020 08:08:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com>
Message-ID: <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm/msm: Avoid possible infinite probe deferral and
 speed booting
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 13, 2020 at 7:11 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Jul 10, 2020 at 5:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > I found that if I ever had a little mistake in my kernel config,
> > or device tree, or graphics driver that my system would sit in a loop
> > at bootup trying again and again and again.  An example log was:
>
> Why do we care about optimizing the error case?

It actually results in a _fully_ infinite loop.  That is: if anything
small causes a component of DRM to fail to probe then the whole system
doesn't boot because it just loops trying to probe over and over
again.  The messages I put in the commit message are printed over and
over and over again.


> >   msm ae00000.mdss: bound ae01000.mdp (ops 0xffffffe596e951f8)
> >   msm_dsi ae94000.dsi: ae94000.dsi supply gdsc not found, using dummy regulator
> >   msm_dsi_manager_register: failed to register mipi dsi host for DSI 0
> >   [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
> >   ...
> >
> > I finally tracked it down where this was happening:
> >   - msm_pdev_probe() is called.
> >   - msm_pdev_probe() registers drivers.  Registering drivers kicks
> >     off processing of probe deferrals.
> >   - component_master_add_with_match() could return -EPROBE_DEFER.
> >     making msm_pdev_probe() return -EPROBE_DEFER.
> >   - When msm_pdev_probe() returned the processing of probe deferrals
> >     happens.
> >   - Loop back to the start.
> >
> > It looks like we can fix this by marking "mdss" as a "simple-bus".
> > I have no idea if people consider this the right thing to do or a
> > hack.  Hopefully it's the right thing to do.  :-)
>
> It's a simple test. Do the child devices have any dependency on the
> parent to probe and/or function? If so, not a simple-bus.

Great!  You can see in the earlier patch in the series that the very
first thing that happens when the parent device probes is that it
calls devm_of_platform_populate().  That means no dependencies, right?
 So that means it's fine/correct to add "simple-bus" here?


> > Once I do this I notice that my boot gets marginally faster (you
> > don't need to probe the sub devices over and over) and also if I
>
> Can you quantify that?

I'd say < 100 us.  I can try to quantify more if needed, but it wasn't
the point of this patch.


> Have you run with devlinks enabled. You need a command line option to
> enable. That too should reduce deferred probes.

Ah, good idea!  I will try it.  However, even with devlinks, if there
is any chance of deferred probes then we need a fix like this.  The
point of the patch isn't about speeding things up but about avoiding
an infinite loop at bootup due to a small bug.


> > have a problem it doesn't loop forever (on my system it still
> > gets upset about some stuck clocks in that case, but at least I
> > can boot up).
>
> Deferred probe only runs when a device is added, so it's not like it
> is continually running.

If you don't mind looking at the code patch, see:

https://lore.kernel.org/r/20200710160131.4.I358ea82de218ea5f4406572ade23f5e121297555@changeid/

Specifically you can see that each time we try to probe we were
calling of_platform_populate().  That appeared to be enough to trigger
things.


-Doug
