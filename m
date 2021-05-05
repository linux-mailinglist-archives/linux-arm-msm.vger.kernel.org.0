Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D7A3749FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 23:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbhEEVPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 17:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhEEVPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 17:15:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE64C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 14:14:24 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 12so4566976lfq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 14:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PUlf+51Wf2M9Sxg8zXcI5dCC51U3aZgzfQP6W4hYEck=;
        b=VGEqn+ZvNLUgU+RRcnj1jk1U1obd45S50Ukjso1C8koL1h0ahQxEG90tMRdC9bK3DA
         7e4/ZC1O/vdvAOsRAMfASYIy4zR8SH+KSvBQ/WMn4MADRryD28mWwIZs/J6BEdL/aWs1
         IP/kDBO90tnBkLfjCjNLUIJHFzbIT9dEy+G1wxc01OnkmJsmvbTJ5XHRfcJp8uoE2nWs
         TtUhugMeJ1OU8hylMQkh2NmusOuqiSLSzuTJiw2H5IYrp+ztcM11upBVU6YKzTHWkN5n
         JC3ZyjJOUcMI6c/MaR1SEOm0vfSUTdcD4gHL/3lmqetcUqfTdYvlgNKhiRu2IFQ++kAa
         LGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PUlf+51Wf2M9Sxg8zXcI5dCC51U3aZgzfQP6W4hYEck=;
        b=Ryp8iVZ4SjsVEcmsSw2mVsrjKTL1aii5x1mRp2F9JUINTLNahkdEPIw10C85zikC7r
         fTKKSagQOh4WCQ3vFRB1tPlVdllpfJkQ+U5AWJm95xoG9rn5tFtc3gyLJk/oAJq6hsCN
         1eNsEuDZGgvBoYZbSer7oURnRhCZLeSI+UQewu9MhCPfsGQ6uKPzr6QEU67C7rABPnOb
         eLZokF2ZaWxxWR8GG+VqDxCtF2Pwy7X/8Oz0rm4RIJq3KlTJCLZA0E29FiBUkVRDot0H
         ve9iw57HfnmTYTXcMHgsANqAtnv/W2myFMrw1mc0YWMvrQ/kZvV428LpPc6F4ZbbvW1l
         0bNQ==
X-Gm-Message-State: AOAM530MvvpuH29EXbB345rpC6fpnU7bRL737saW213kxq0GhbEVRLYw
        SvgLdYb5Mw33eyJQAcenZyhXcAmxgaeIN25NrzxfYg==
X-Google-Smtp-Source: ABdhPJzZk6O+Ds2gzYtJu5oQBKgYY6XY5H05Ttbzd2NyntejF1zR7geYsYd5s2Gry+gaHXurKSOiur8xB/aXLiE3amQ=
X-Received: by 2002:ac2:5e36:: with SMTP id o22mr511373lfg.529.1620249262817;
 Wed, 05 May 2021 14:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
 <CAF6AEGt5AZ4jPO5=qUy-JhDCj1D5oD9nboNDDiJFnFDmWWvOaA@mail.gmail.com>
 <CALAqxLVxURmmJ227n8ozzsV96qqAxB+BdVV_kHbgFS7680=dbA@mail.gmail.com> <CAF6AEGvZMe5BTBtu+=koAeDQF9AKDa0CTEWJTSV8+CW2jsh7fA@mail.gmail.com>
In-Reply-To: <CAF6AEGvZMe5BTBtu+=koAeDQF9AKDa0CTEWJTSV8+CW2jsh7fA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 5 May 2021 14:14:10 -0700
Message-ID: <CALAqxLXn6wFBAxRkThxWg5RvTuFEX80kHPt8BVja1CpAB-qzGA@mail.gmail.com>
Subject: Re: Regression: arm64: dts: sdm845-db845c: make firmware filenames
 follow linux-firmware
To:     Rob Clark <robdclark@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 5, 2021 at 1:01 PM Rob Clark <robdclark@gmail.com> wrote:
> On Wed, May 5, 2021 at 12:35 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Wed, May 5, 2021 at 8:04 AM Rob Clark <robdclark@gmail.com> wrote:
> > > On Tue, May 4, 2021 at 11:37 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > Hey Dmitry, Bjorn,
> > > >   I wanted to raise a regression I caught in the merge window on db845c.
> > > >
> > > > I was seeing troubles with audio and while there are a few other
> > > > pending fixes needed, they did not seem to work for me. So I spent
> > > > some time bisecting things down and found the problematic commit was
> > > > 7443ff06da45 ("arm64: dts: sdm845-db845c: make firmware filenames
> > > > follow linux-firmware").
> > > >
> > > > It seems for systems using the old firmware filenames, this will break
> > > > dependent devices on adsp_pas and cdsp_pas nodes.
> > > >
> > > > Now, obviously updating the firmware files in userland should resolve
> > > > this, but it adds the complexity that we can't just replace the
> > > > firmware files because older LTS kernels will look for the old names,
> > > > while newer kernels will look for the new names. We can add both files
> > > > to the system images, but then there is some confusion on which
> > > > version of the firmware files are being used where.
> > > >
> > > > So yes, we should align with linux-firmware file names, but I think
> > > > more care is needed for this sort of thing as it has the potential to
> > > > break folks, and this isn't the first time around we've had similar
> > > > firmware name changes break us.
> > > >
> > > > So I'm working on fixing this by including both filenames in userland,
> > > > so we probably don't need a revert here, but *please* maybe take more
> > > > care on this sort of change.
> > > >
> > >
> > > It is rather more difficult than you think, because if you try the
> > > wrong path you could end up waiting with a timeout.. we have
> > > shenanigans to work around that for gpu fw in drm/msm to avoid this
> > > sort of regression with people using downstream firmware trees.  I'd
> > > like to rip that out at some point, but I suppose doing so would be
> > > problematic for folks doing upstream kernel on android devices.
> > >
> > > Maybe there is some way to add support to simultaneously
> > > request_firmware for two different paths at the same time.. not sure
> > > how that would work from the PoV of the usermode helper path.
> > >
> > > It really is a lot of pain to deal with downstream firmware layout..
> >
> > Yeah, but on other platforms, the kernel has to meet and deal with the
> > hardware, firmware and userland as it exists in the world.
> > It would be quite a thing if an upstream kernel change required a new
> > BIOS update which then made the system incompatible with the most
> > recent LTS.
>
> Does downstream exist? :-P

The converse is if upstream has no devices on which it boots, is it relevant?
Both statements are extreme and silly, I think. :)

> We first ran into this issue with GPU firmware when it was originally
> pushed to linux-firmware.  Upstream linux-firmware wanted it moved to
> qcom subdirectory.  At this point, now upstream and downstream
> firmware are incompatible in their directory layout.  You can't really
> expect the kernel to support the downstream layout but not the
> upstream layout.  If the upstream kernel has to choose, it will go
> with the upstream linux-firmware layout.

So my apologies, I worry I've come off a bit hectoring, and my
admiration and appreciation for your work hasn't come through.  I'm
very sympathetic to the difficulties trying to balance supporting the
crazy things that get shipped and creating a maintainable approach for
the future, *and* why the latter is rightly prioritized.

And while the gpu firmware case was one previous example of similar
trouble, we've had a number of other casual changes to DTS node names
break us before (due to sysfs paths then shifting and userland then
not monitoring the right sysfs files) on numerous boards (not just
db845c), so I'm sorry if my general frustration seemed a bit too
pointed.

> Seriously though, the extra 60sec timeout delays is not an option.  I
> don't really see any good option other than somehow teaching
> request_firmware how to look for two (or multiple) paths at the same
> time.  I'm not sure (a) if that is possible (ie. without breaking
> compatibility with usermode helper), and (b) how others would feel
> about adding more complexity to the firmware loader to deal with
> downstream firmware trees.  If others are open to that idea, I'm all
> for it.
>
> And tbf, the BIOS update example is a *bit* of a stretch, since that
> is often not something owners of the hw can do.  In this case, it is
> just a matter of putting some symlinks in the downstream /lib/firmware
> to make it work with both cases.
>

I think in this case, it's just the existing convention that previous
kernels used was that firmware on the db845c used the .mdt extension.
To me, changing the db845c dts to use .mbn breaking convention wasn't
the best choice.

Instead, we could have left it as mdt in the db845c dts, and made it
so when updating linux-firmware files, the .mbn files would need to be
copied (or symlinked) to .mdt (which has to be done now anyway) to
match existing convention, and it would have had less negative impact.

For new boards and dts files, go with the new convention! But we
should avoid casually breaking existing ones on existing boards.
Again, it's done and we have a fix, so no worries now, but just things
to consider going forward.

thanks
-john
