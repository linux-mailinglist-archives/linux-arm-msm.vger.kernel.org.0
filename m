Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1E6391B01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 17:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235206AbhEZPC3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 11:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234923AbhEZPC3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 11:02:29 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB20C061574;
        Wed, 26 May 2021 08:00:57 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id c20so1265617qkm.3;
        Wed, 26 May 2021 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IkLU3uWePaDxD/NdiontwagHrNF48wFOtRXP+VjWATI=;
        b=qlHrqcG1+0gAL6VnluGLOdCxuzyVJzETlRQEugVCmh31XWVJ9/XTgZ9qNSV3hpKhBH
         guwhqXfiiWZ07Z3nOeYbeQ+Tq8f//liZCyt4ldlF3AgkIiQral/X9NljXNIvOOzpbNei
         OafqjCgf7jKAdlt2PWyitI0IUv8FYi9yJqlydqSOSQDWh/hmciGZvmsDFlQb0XmmrUqc
         qZML+012px+9Xy6EFrx9vWbi0AERolwwS90tOnuSFb/LNjiK1iWQQTflNThdkTDY8S3k
         W+O8Tuug+Mt3EagLhm+8gnFzHztvo8w8B8aAOcmHgGhv4n5ULtrrsAcgNO6QniQfDoYM
         wc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IkLU3uWePaDxD/NdiontwagHrNF48wFOtRXP+VjWATI=;
        b=AA7jEiZf0d5cHhtcJmsA3agxQ3ZAVI5xfal1nnkW6eO+SHgx14eGI1t6sTCD2w/eVv
         cCZeunSpgHGPUq+chdF0I+4aGq88+/Myjs+XuHlN02pbCYpts0O0kV4i3i+VVpvLVGUk
         14DL+yGydSnhO2y1VFYbqhFVO5mJU//30gfw4r7rFvAhGjPgtoiVeQkKsCUVmArrRVue
         C/CTE4NQCVrmSplt5f3l4scpOqGBhA/cNE7nZIT8uJ0zTISCacrYnDspgbXSWSYLdyXu
         oKhbgWYn7FrzQiXYJ6ZZE7S4xi43JPQXMfsAdGtL3zN5ZLcSm+Cb+cQLSFQ9EBlcy5fV
         5+4Q==
X-Gm-Message-State: AOAM533ENltGUyYh3KFmKRz6Mg2NZleUkJ0GdBDJfMwNSYb3WBfSegUb
        Ik/7aEsrMB+xOsj97VsaZEwoXuSZWwhJ/YLYTrI=
X-Google-Smtp-Source: ABdhPJyocjvgfukJJ/VBXy2nM30jzHuQf3cR9GiU0ZGt71xcVgV6jLZiF0So7OewzUV+9YvS5OOb5+Osry58Tkemg8Q=
X-Received: by 2002:a05:620a:12a6:: with SMTP id x6mr40061592qki.364.1622041256304;
 Wed, 26 May 2021 08:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124946.3617862-1-vkoul@kernel.org> <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
 <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
In-Reply-To: <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 26 May 2021 09:00:45 -0600
Message-ID: <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, DTML <devicetree@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 25, 2021 at 11:46 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Hello Jeff,
>
> On 21-05-21, 08:09, Jeffrey Hugo wrote:
> > On Fri, May 21, 2021 at 6:50 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > Display Stream Compression (DSC) compresses the display stream in host which
> > > is later decoded by panel. This series enables this for Qualcomm msm driver.
> > > This was tested on Google Pixel3 phone which use LGE SW43408 panel.
> > >
> > > The changes include adding DT properties for DSC then hardware blocks support
> > > required in DPU1 driver and support in encoder. We also add support in DSI
> > > and introduce required topology changes.
> > >
> > > In order for panel to set the DSC parameters we add dsc in drm_panel and set
> > > it from the msm driver.
> > >
> > > Complete changes which enable this for Pixel3 along with panel driver (not
> > > part of this series) and DT changes can be found at:
> > > git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_rfc
> > >
> > > Comments welcome!
> >
> > This feels backwards to me.  I've only skimmed this series, and the DT
> > changes didn't come through for me, so perhaps I have an incomplete
> > view.
>
> Not sure why, I see it on lore:
> https://lore.kernel.org/dri-devel/20210521124946.3617862-3-vkoul@kernel.org/
>
> > DSC is not MSM specific.  There is a standard for it.  Yet it looks
> > like everything is implemented in a MSM specific way, and then pushed
> > to the panel.  So, every vendor needs to implement their vendor
> > specific way to get the DSC info, and then push it to the panel?
> > Seems wrong, given there is an actual standard for this feature.
>
> I have added slice and bpp info in the DT here under the host and then
> pass the generic struct drm_dsc_config to panel which allows panel to
> write the pps cmd
>
> Nothing above is MSM specific.. It can very well work with non MSM
> controllers too.

I disagree.

The DT bindings you defined (thanks for the direct link) are MSM
specific.  I'm not talking (yet) about the properties you defined, but
purely from the stand point that you defined the binding within the
scope of the MSM dsi binding.  No other vendor can use those bindings.
Of course, if we look at the properties themselves, they are prefixed
with "qcom", which is vendor specific.

So, purely on the face of it, this is MSM specific.

Assuming we want a DT solution for DSC, I think it should be something
like Documentation/devicetree/bindings/clock/clock-bindings.txt (the
first example that comes to mind), which is a non-vendor specific
generic set of properties that each vendor/device specific binding can
inherit.  Panel has similar things.

Specific to the properties, I don't much like that you duplicate BPP,
which is already associated with the panel (although perhaps not in
the scope of DT).  What if the panel and your DSC bindings disagree?
Also, I guess I need to ask, have you read the DSC spec?  Last I
looked, there were something like 3 dozen properties that could be
configured.  You have five in your proposed binding.  To me, this is
not a generic DSC solution, this is MSM specific (and frankly I don't
think this supports all the configuration the MSM hardware can do,
either).

I'm surprised Rob Herring didn't have more to say on this.

> I didn't envision DSC to be a specific thing, most of
> the patches here are hardware enabling ones for DSC bits for MSM
> hardware.
>
> > Additionally, we define panel properties (resolution, BPP, etc) at the
> > panel, and have the display drivers pull it from the panel.  However,
> > for DSC, you do the reverse (define it in the display driver, and push
> > it to the panel).  If the argument is that DSC properties can be
> > dynamic, well, so can resolution.  Every panel for MSM MTPs supports
> > multiple resolutions, yet we define that with the panel in Linux.
>
> I dont have an answer for that right now, to start with yes the
> properties are in host but I am okay to discuss this and put wherever we
> feel is most correct thing.  I somehow dont like that we should pull
> from panel DT and program host with that. Here using struct
> drm_dsc_config allows me to configure panel based on resolution passed

I somewhat agree that pulling from the panel and programing the host
based on that is an odd solution, but we have it currently.  Have a
look at Documentation/devicetree/bindings/display/panel in particular
panel-timing.  All of that ends up informing the mdss programing
anyways (particularly the dsi and its phy).  So my problem is that we
currently have a solution that seems to just need to be extended, and
instead you have proposed a completely different solution which is
arguably contradictory.

However, I'd like to see thoughts from Rob Clark, David, and any
others that typically handle this stuff (maybe Sam Ravenborg from the
panel side?).  I consider them to be the experts, and if they think
your solution is the way to go, I'll shut up.  I consider myself to be
a novice that has dabbled in this area, and while this currently
doesn't make sense to me, maybe I need some education here to see the
light.

> > Finally, I haven't seen the DT bits, but I'm concerned about using DT
> > for this.  It inherently excludes ACPI systems.  You appear to have
> > sdm845 support in this series, but what about ACPI boot on the Lenovo
> > C630 for example?  Or any of the 8cx laptops?  We don't read the panel
> > resolution, etc from DT, so why the DSC?
>
> But you must read from somewhere like ACPI tables. I think ACPI systems
> would have some ACPI table info out there which would help on this.
> Yes that is another task which we need to start with once we enable OF
> systems.

Frankly, I don't like the MSM ACPI solution that I've seen on the laptops.
The ACPI assumes the entire MDSS (including DSI parts) and GPU is one
device, and ultimately handled by one driver.  That driver needs to
get a value from UEFI (set by the bootloader) that is the "panel id".
Then the driver calls into ACPI (I think its _ROM, but I might be
mistaken, doing this from memory) with that id.  It gets back a binary
blob which is mostly an xml file (format is publicly documented) that
contains the panel timings and such.

Generally we've defined simple-panel entities for these, with the
timings in code (you can see what Bjorn and I have upstreamed), and
just match on the compatible.

In summary, I don't mean to be difficult, I just think this solution
needs more "baking".
