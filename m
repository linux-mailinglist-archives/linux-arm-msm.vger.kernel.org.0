Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287F039B070
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 04:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhFDCfh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 22:35:37 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:36382 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhFDCfh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 22:35:37 -0400
Received: by mail-wm1-f54.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so6976942wmk.1;
        Thu, 03 Jun 2021 19:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XfVLX4YtEZs428uaQPfb/mY1tDAn6l5ncSwMdycpblI=;
        b=p5drJ8OPu0/hfTaQXi2OyrCV3UE0/bcH3ckTmA6EC2x2//1neicrguJZw+egplGj7e
         cbrQ9OpDwX1uZqU9IGP7ncGktMXUx4UviQhIeb20d06j/E5NfmU1+gfXjEag7tXpmj+I
         i2uG7BIAYtnWU4xdCU0QenmkqC2pTBAEcWq0SuNYcncS1waJTJcR4CZZZqIqul4845tD
         wlf1Kv9hg49UzNfmMHyN5Geif4mqiUUMBRTbyMWtjpNgrIrS5Npb17wxil5Gpc4cXEhd
         ye7CeseV4uBnq37kFnGOz1WtIqvJPs60R9aq1HK4S3jxjF2K6Udk3uDqLlPin73no4HA
         VOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XfVLX4YtEZs428uaQPfb/mY1tDAn6l5ncSwMdycpblI=;
        b=SBkL2COSfKlZFpjcGMv8S+RHT9FDsxae/CUdu4s/D3Jwha4KjF+G5hdZ5Nq3s0DhSr
         3enptNbtycsTRCseJrHCoFHzLJCzea60XWnEN87N5YAGE4hDPlj9DlQvnw6AKLVcPEIy
         ICpVHVHOVRfsg1x9AvrNuF0PQN03CqkEpA5ku0kSsZHe5koS4qpQXSg3YyCfmO0RcWdY
         hSAjTjt2Nd8z16Bnu9ksghvSrY+brB1tplbKyw6iOpihFSTAZOg4HEu5CYhz2hdTB+vz
         9Vja0hNYD7+lF/CpxIadlFgw7qITye/YPyZ5D6FBMEUewyGUAgAdSSlbikOZngiLo3Xq
         Kn5Q==
X-Gm-Message-State: AOAM530krPNVFTINSuSHok7K2pt7kYY9iwlLtjele2fnsfJKQDgPJR/y
        T3mea1cMVk7OANWT+H+IfPqqiVqBoUj1GYML2tE=
X-Google-Smtp-Source: ABdhPJxmpIfDqZXuShm76OqWvHKkOU4l5zonimZqTYUKsjU+Sqv/oJyOxy/U8P1238Okoxuj2H3MGCtE1stmFsOfTU4=
X-Received: by 2002:a05:600c:2054:: with SMTP id p20mr843886wmg.175.1622773970471;
 Thu, 03 Jun 2021 19:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124946.3617862-1-vkoul@kernel.org> <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
 <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink> <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
 <CAF6AEGuoyPr8PgfwFX0JCYZ7S_pryn_OXacHBqoMAAPvSq6aRw@mail.gmail.com> <YLdlEB3Ea6OWaLw4@vkoul-mobl>
In-Reply-To: <YLdlEB3Ea6OWaLw4@vkoul-mobl>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 3 Jun 2021 19:36:42 -0700
Message-ID: <CAF6AEGvS2uL1eEeCKQ5wDX4+yRZuOTHzFOv9Kiu09HO2r9xzHQ@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        DTML <devicetree@vger.kernel.org>,
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

On Wed, Jun 2, 2021 at 4:01 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 27-05-21, 16:30, Rob Clark wrote:
> > On Wed, May 26, 2021 at 8:00 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> > > On Tue, May 25, 2021 at 11:46 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> > > Frankly, I don't like the MSM ACPI solution that I've seen on the laptops.
> > > The ACPI assumes the entire MDSS (including DSI parts) and GPU is one
> > > device, and ultimately handled by one driver.  That driver needs to
> > > get a value from UEFI (set by the bootloader) that is the "panel id".
> > > Then the driver calls into ACPI (I think its _ROM, but I might be
> > > mistaken, doing this from memory) with that id.  It gets back a binary
> > > blob which is mostly an xml file (format is publicly documented) that
> > > contains the panel timings and such.
> >
> > tbh, I kinda suspect that having a single "gpu" device (which also
> > includes venus, in addition to display, IIRC) in the ACPI tables is a
> > windowsism, trying to make things look to userspace like a single "GPU
> > card" in the x86 world.. but either way, I think the ACPI tables on
> > the windows arm laptops which use dsi->bridge->edp is too much of a
> > lost cause to even consider here.  Possibly ACPI boot on these devices
> > would be more feasible on newer devices which have direct eDP out of
> > the SoC without requiring external bridge/panel glue.
>
> yeah that is always a very different world. although it might make sense
> to use information in tables and try to deduce information about the
> system can be helpful...
>
> > I'd worry more about what makes sense in a DT world, when it comes to
> > DT bindings.
>
> And do you have thoughts on that..?

Only that I wouldn't get too hung up on existing snapdragon ACPI
tables.. not sure if there is prior art as far as ACPI tables for this
on x86 systems, if so that *might* be a thing to consider, but
otherwise it does sound a bit like we want less qcom specific bindings
here.  But other than that I'll leave it to folks who spend more time
thinking about bindings.. left to my own devices I'd come up with a
point solution and go back to working on mesa, so that probably isn't
the opinion you want to follow ;-)

BR,
-R
