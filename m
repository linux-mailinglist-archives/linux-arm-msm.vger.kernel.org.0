Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32F39FBFB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 06:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfKNFbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 00:31:12 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38689 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfKNFbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 00:31:12 -0500
Received: by mail-ed1-f65.google.com with SMTP id s10so3938800edi.5;
        Wed, 13 Nov 2019 21:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TzmgwadFXzZqxttyAmTgdsuksZq1HRvUtDJR5tFWxuQ=;
        b=VV0JlZagHNRuPaMn1sjANDQ9gpxP4PposXxyDDWOdRN9Ug5hZqW76uGYAx2eU+2/Ei
         jKkqh+/st/tBOFGfgr8wCN1cHx8574paDQuD0rJb/2/DjvAs4WjENBTDG7zRtvSuSOYe
         7cUoNA/3y0KHwWxyoE3xVkx3AOSXN5Ra2fiWzHBmLHCcGnFWdIjv/2ehSnuprAu0gyQE
         8yt+Bj4v5rIAPKADiEVui/sGy0RKhmysnwSffXlmySh3HhJXv+7zDPCYm/dPaWs/TDKp
         4jTbNYcHP8kUMlA3ZqsuGvMZVe47zIIJgyhdrk5IGug+2i74zv23cxY9plGzpuFwEAdJ
         xqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TzmgwadFXzZqxttyAmTgdsuksZq1HRvUtDJR5tFWxuQ=;
        b=WFO7k7ak0xsoOI5eJzmo8DLCHmaUkyhqfI6OsiMs+w8eCGvLP5gnvaJyMX8T+Tme+Q
         rDTrJPId/D2Nv9+PtJJUdVGMV1prrmHUIPGA8tC3wbHjY54p3wx9qV5p8clFi18/aHOD
         2+4jLASk7u3ZPkkMbVll/xy1x4pL443lo9+6uooitcdXASARw6gjH9XKgCEjnKdgvQ4w
         e+XBhNAi4/LXXA2a1bqy6kcHjVxC1JC0eVWRXHtsTlmQfsgcJKlUc95dWU2s5A7mOqNB
         CUmqGmyYQmjw190c57tWx/aVQc7h0Pq22m9bJRrOfuasGFAU1o3sl66Fm7Cldgj7fNP8
         DRKQ==
X-Gm-Message-State: APjAAAWMAInRqQCW9nl2D6tTFZrSwbj6Rhx674//NMxXDP1rTXxG8T+w
        Lau/31rZb0UVWYzCovo93fA2aMnOnO2p6k3REMUAZx14
X-Google-Smtp-Source: APXvYqwDNsw+CPEHfZ6k5bmbg5vzATln7nGrYepvMbZNyvUl0vpAhTIKh7dE4xMDDTS34JhNjAwAWCEYTF3XbMTlrZg=
X-Received: by 2002:aa7:d3da:: with SMTP id o26mr8077190edr.302.1573709469321;
 Wed, 13 Nov 2019 21:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20191014102308.27441-6-tdas@codeaurora.org> <20191029175941.GA27773@google.com>
 <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org> <20191031174149.GD27773@google.com>
 <20191107210606.E536F21D79@mail.kernel.org> <CAJs_Fx60uEdGFjJXAjvVy5LLBXXmergRi8diWxhgGqde1wiXXQ@mail.gmail.com>
 <20191108063543.0262921882@mail.kernel.org> <CAJs_Fx5trp2B7uOMTFZNUsYoKrO1-MWsNECKp-hz+1qCOCeU8A@mail.gmail.com>
 <20191108184207.334DD21848@mail.kernel.org> <CAJs_Fx6KCirGMtQxE=xA-A=bd5LeuYWviee0+KqO5OtGT9GKEw@mail.gmail.com>
 <20191114010210.GF27773@google.com>
In-Reply-To: <20191114010210.GF27773@google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 13 Nov 2019 21:30:57 -0800
Message-ID: <CAF6AEGv9+Ow=RCXGKmaANfmA2NtR32E07CKwGFKJbeeOJRP9=Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 13, 2019 at 5:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Fri, Nov 08, 2019 at 11:40:53AM -0800, Rob Clark wrote:
> > On Fri, Nov 8, 2019 at 10:42 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Rob Clark (2019-11-08 08:54:23)
> > > > On Thu, Nov 7, 2019 at 10:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > >
> > > > > Quoting Rob Clark (2019-11-07 18:06:19)
> > > > > > On Thu, Nov 7, 2019 at 1:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > > > >
> > > > > > >
> > > > > > > NULL is a valid clk pointer returned by clk_get(). What is the display
> > > > > > > driver doing that makes it consider NULL an error?
> > > > > > >
> > > > > >
> > > > > > do we not have an iface clk?  I think the driver assumes we should
> > > > > > have one, rather than it being an optional thing.. we could ofc change
> > > > > > that
> > > > >
> > > > > I think some sort of AHB clk is always enabled so the plan is to just
> > > > > hand back NULL to the caller when they call clk_get() on it and nobody
> > > > > should be the wiser when calling clk APIs with a NULL iface clk. The
> > > > > common clk APIs typically just return 0 and move along. Of course, we'll
> > > > > also turn the clk on in the clk driver so that hardware can function
> > > > > properly, but we don't need to expose it as a clk object and all that
> > > > > stuff if we're literally just slamming a bit somewhere and never looking
> > > > > back.
> > > > >
> > > > > But it sounds like we can't return NULL for this clk for some reason? I
> > > > > haven't tried to track it down yet but I think Matthias has found it
> > > > > causes some sort of problem in the display driver.
> > > > >
> > > >
> > > > ok, I guess we can change the dpu code to allow NULL..  but what would
> > > > the return be, for example on a different SoC where we do have an
> > > > iface clk, but the clk driver isn't enabled?  Would that also return
> > > > NULL?  I guess it would be nice to differentiate between those cases..
> > > >
> > >
> > > So the scenario is DT describes the clk
> > >
> > >  dpu_node {
> > >      clocks = <&cc AHB_CLK>;
> > >      clock-names = "iface";
> > >  }
> > >
> > > but the &cc node has a driver that doesn't probe?
> > >
> > > I believe in this scenario we return -EPROBE_DEFER because we assume we
> > > should wait for the clk driver to probe and provide the iface clk. See
> > > of_clk_get_hw_from_clkspec() and how it looks through a list of clk
> > > providers and tries to match the &cc phandle to some provider.
> > >
> > > Once the driver probes, the match will happen and we'll be able to look
> > > up the clk in the provider with __of_clk_get_hw_from_provider(). If
> > > the clk provider decides that there isn't a clk object, it will return
> > > NULL and then eventually clk_hw_create_clk() will turn the NULL return
> > > value into a NULL pointer to return from clk_get().
> > >
> >
> > ok, that was the scenario I was worried about (since unclk'd register
> > access tends to be insta-reboot and hard to debug)..  so I think it
> > should be ok to make dpu just ignore NULL clks.
> >
> > From a quick look, I think something like the attached (untested).
>
> The driver appears to be happy with it, at least at probe() time.

Ok, I suppose I should re-send the dpu patch to the appropriate
lists.. does that count as a Tested-by?

BR,
-R
