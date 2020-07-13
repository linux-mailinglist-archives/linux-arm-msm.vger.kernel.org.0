Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6634121E23E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 23:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgGMVc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 17:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgGMVc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 17:32:28 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A027C061755;
        Mon, 13 Jul 2020 14:32:28 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id p20so19065652ejd.13;
        Mon, 13 Jul 2020 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9xk5002gZ5H7JGOgsHs7h731etRLB6WtyENiHxGGu7I=;
        b=bLpTnFR30/+CWwAe8tAwcO+WU+hkSYANQdbkuElT0SAIi6ujeM1TQRDW+tCw7AICBj
         5kCIWw6YVvqgCI3mI7R3rV4p4D/H1krl4pX5fIqkagHlyiEFyV329SLTFtsSHwii5Pvs
         NeEcqyvNhCmv006c7RAJd1CQDhlH02TJpBBVtkzWG3QMAyS8lhgPxRzgN6IKJvk8TKPT
         iOYrzrUHpGNz96WU9SoDtgqNIGpwQAbG5CIzoGQbtjCl4cby+ZNa9qJtkEVVg7PL+93M
         vusMQSDo7Z272nWxnOj7FItu1oUHIplSVGK/K9ov0C0pGx+tmdVKK6E4IM28vEMhl+Ku
         EEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9xk5002gZ5H7JGOgsHs7h731etRLB6WtyENiHxGGu7I=;
        b=QRBpNhtO7CwTYgvyvtY7Sm8pmgRxgEnvOpjePIiWbEYtPl14Jz0hsIMpCl+88SdSFZ
         R7tSzHMKRQ3IHlNsaMLdRoMjUsFcv/ZJcyWbzo7f/1ccxUwKGas4xsErFeM/HgsA1VeQ
         3JBv3aNnHp0IvPQUctZzDJNvVX76g7vPGwPbMaxtkIVdPqQrs3iH/TcY5BTjWK2vQOYC
         K8Nh7ebV/27LzJ79USmOTMvvvm4ZJeFYstX9t+1qh/GhY6oWJjkcWhvbNowl+AurnvZQ
         X7qJXoMBIR+yrJ1z0JnbksNaWkaEgrOq00BJd3BqGjl7npFfuwmAvQR2OiLfhfl1Lpqi
         jahg==
X-Gm-Message-State: AOAM532v6zO/9Gx9xo91LxkjFks/Csm3stAgLX+ODHjq/Mh9bqqC5xwy
        nR3RL0tdCJO/Uc3W2LV4YClU+WEOhf16yXbtuQA=
X-Google-Smtp-Source: ABdhPJwMoWogKyu+hB7N/OXDUjzYJXatIjRK36LwG1lOC44kvht0iMkOGCJlZyw4lHZLCW+pL24HAecjyLLmYhlZNWg=
X-Received: by 2002:a17:906:ca4c:: with SMTP id jx12mr1508481ejb.231.1594675946837;
 Mon, 13 Jul 2020 14:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200710230224.2265647-1-dianders@chromium.org>
 <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
 <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com> <CAL_JsqLJM5nwNSdugMBLDVtjP97dikCm_AiHjnDs1jqBOFoaaQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLJM5nwNSdugMBLDVtjP97dikCm_AiHjnDs1jqBOFoaaQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 13 Jul 2020 14:32:59 -0700
Message-ID: <CAF6AEGufuFW3ba3u3A+mY+Gw0ouH2x9xY-9A+OtVff+iXdix9A@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm/msm: Avoid possible infinite probe deferral and
 speed booting
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
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

On Mon, Jul 13, 2020 at 1:25 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Jul 13, 2020 at 9:08 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Jul 13, 2020 at 7:11 AM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Fri, Jul 10, 2020 at 5:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > I found that if I ever had a little mistake in my kernel config,
> > > > or device tree, or graphics driver that my system would sit in a loop
> > > > at bootup trying again and again and again.  An example log was:
> > >
> > > Why do we care about optimizing the error case?
> >
> > It actually results in a _fully_ infinite loop.  That is: if anything
> > small causes a component of DRM to fail to probe then the whole system
> > doesn't boot because it just loops trying to probe over and over
> > again.  The messages I put in the commit message are printed over and
> > over and over again.
>
> Sounds like a bug as that's not what should happen.
>
> If you defer during boot (initcalls), then you'll be on the deferred
> list until late_initcall and everything is retried. After
> late_initcall, only devices getting added should trigger probing. But
> maybe the adding and then removing a device is causing a re-trigger.
>
> > > >   msm ae00000.mdss: bound ae01000.mdp (ops 0xffffffe596e951f8)
> > > >   msm_dsi ae94000.dsi: ae94000.dsi supply gdsc not found, using dummy regulator
> > > >   msm_dsi_manager_register: failed to register mipi dsi host for DSI 0
> > > >   [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
> > > >   ...
> > > >
> > > > I finally tracked it down where this was happening:
> > > >   - msm_pdev_probe() is called.
> > > >   - msm_pdev_probe() registers drivers.  Registering drivers kicks
> > > >     off processing of probe deferrals.
> > > >   - component_master_add_with_match() could return -EPROBE_DEFER.
> > > >     making msm_pdev_probe() return -EPROBE_DEFER.
> > > >   - When msm_pdev_probe() returned the processing of probe deferrals
> > > >     happens.
> > > >   - Loop back to the start.
> > > >
> > > > It looks like we can fix this by marking "mdss" as a "simple-bus".
> > > > I have no idea if people consider this the right thing to do or a
> > > > hack.  Hopefully it's the right thing to do.  :-)
> > >
> > > It's a simple test. Do the child devices have any dependency on the
> > > parent to probe and/or function? If so, not a simple-bus.
> >
> > Great!  You can see in the earlier patch in the series that the very
> > first thing that happens when the parent device probes is that it
> > calls devm_of_platform_populate().  That means no dependencies, right?
>
> It should. But then I reviewed the MDSS binding today and it looks
> like the MDSS is the interrupt parent for at least some child devices?
>

yes, that is correct

BR,
-R
