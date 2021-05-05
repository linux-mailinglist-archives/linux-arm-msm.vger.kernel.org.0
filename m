Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE503748FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 22:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233723AbhEEUCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 16:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbhEEUCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 16:02:40 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78020C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 13:01:43 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id t11-20020a05600c198bb02901476e13296aso1826586wmq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 13:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q1nbRR2ioVsNSStseXeK4U5bLQpgIx9J5bzYBL/YNy0=;
        b=t73T9tYVilUtxw02EWl0jmejhGDRKgmJT+MjqJofipM8uXxitgsFGnYaawMK++g/eY
         6XH2nlmTZRREBLSiRp8Rdfd5bu2H/mPTBMCkKjP8FjX3kw12fZUHHKGKdm1Tx/LXNQVt
         eIvxUtOjzsMHqBTIR4mUJEMSCTMBb/Xk9StIen7x7HfLdqOuWgc6Eizin23MQmtwZzz6
         N0KUkXyDc06DcSA6PTy1OVgyxStXAXxHpdBqEDVvoZg7YF/BARwovZm0JMpnSIK59TlE
         sXzWgaYTT7KfOLwfQz3QkKQpmD6fvb0VRy8V4ibTFGv68oYYtgGbCQocj2L3YcJAoF4i
         f3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q1nbRR2ioVsNSStseXeK4U5bLQpgIx9J5bzYBL/YNy0=;
        b=HBNAtwCcoKlVtmZAczzmD4BVanbonTP+lGO1ExtBsi1tMad6wfwy/4Wmw1mgTZIADk
         CGZtnoQ1Dj+FXufzsIISw7VcEIyNWEXZ2yfxj6q2ykw0wlQfjCOZ1pXc8aN8wgYyMdX+
         ZA2HSTtoWS1G77uIN/QFrOA26DUvEkFzOphENvB43E3/7me6ybxcH2NQAH1MmBkodBG+
         lI+kLkH1HqPGNhW3Naq8IZtlMGzhrz3KpYCJFnYSipCqluU9rFwHrCLW8ZlES9Kd1002
         EqwqD/Qfte8C7esUiFJ55Rg2MQ6LK5KzSrnS3+FETA+u4FgqATMPxYgqkf4cunM2OSzQ
         KVeg==
X-Gm-Message-State: AOAM532GHpsNbr/m1j0ailAxzQViC1dVcYkPXSLS+U4L3rAOGQPTyj59
        eZgukhMgPS5mRYu/hKMD/PDWj5y9e22Wd921T+y8aQIa
X-Google-Smtp-Source: ABdhPJyAu78E3gf8HeNDJah5ri548v2LbPQ/1rxUG989ymL4jqZSv54qJKjLpvL65hPxXyLKq0LpBxliFmjcsgRX7f0=
X-Received: by 2002:a05:600c:4e8c:: with SMTP id f12mr11657866wmq.123.1620244902156;
 Wed, 05 May 2021 13:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
 <CAF6AEGt5AZ4jPO5=qUy-JhDCj1D5oD9nboNDDiJFnFDmWWvOaA@mail.gmail.com> <CALAqxLVxURmmJ227n8ozzsV96qqAxB+BdVV_kHbgFS7680=dbA@mail.gmail.com>
In-Reply-To: <CALAqxLVxURmmJ227n8ozzsV96qqAxB+BdVV_kHbgFS7680=dbA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 5 May 2021 13:05:16 -0700
Message-ID: <CAF6AEGvZMe5BTBtu+=koAeDQF9AKDa0CTEWJTSV8+CW2jsh7fA@mail.gmail.com>
Subject: Re: Regression: arm64: dts: sdm845-db845c: make firmware filenames
 follow linux-firmware
To:     John Stultz <john.stultz@linaro.org>
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

On Wed, May 5, 2021 at 12:35 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, May 5, 2021 at 8:04 AM Rob Clark <robdclark@gmail.com> wrote:
> > On Tue, May 4, 2021 at 11:37 PM John Stultz <john.stultz@linaro.org> wrote:
> > > Hey Dmitry, Bjorn,
> > >   I wanted to raise a regression I caught in the merge window on db845c.
> > >
> > > I was seeing troubles with audio and while there are a few other
> > > pending fixes needed, they did not seem to work for me. So I spent
> > > some time bisecting things down and found the problematic commit was
> > > 7443ff06da45 ("arm64: dts: sdm845-db845c: make firmware filenames
> > > follow linux-firmware").
> > >
> > > It seems for systems using the old firmware filenames, this will break
> > > dependent devices on adsp_pas and cdsp_pas nodes.
> > >
> > > Now, obviously updating the firmware files in userland should resolve
> > > this, but it adds the complexity that we can't just replace the
> > > firmware files because older LTS kernels will look for the old names,
> > > while newer kernels will look for the new names. We can add both files
> > > to the system images, but then there is some confusion on which
> > > version of the firmware files are being used where.
> > >
> > > So yes, we should align with linux-firmware file names, but I think
> > > more care is needed for this sort of thing as it has the potential to
> > > break folks, and this isn't the first time around we've had similar
> > > firmware name changes break us.
> > >
> > > So I'm working on fixing this by including both filenames in userland,
> > > so we probably don't need a revert here, but *please* maybe take more
> > > care on this sort of change.
> > >
> >
> > It is rather more difficult than you think, because if you try the
> > wrong path you could end up waiting with a timeout.. we have
> > shenanigans to work around that for gpu fw in drm/msm to avoid this
> > sort of regression with people using downstream firmware trees.  I'd
> > like to rip that out at some point, but I suppose doing so would be
> > problematic for folks doing upstream kernel on android devices.
> >
> > Maybe there is some way to add support to simultaneously
> > request_firmware for two different paths at the same time.. not sure
> > how that would work from the PoV of the usermode helper path.
> >
> > It really is a lot of pain to deal with downstream firmware layout..
>
> Yeah, but on other platforms, the kernel has to meet and deal with the
> hardware, firmware and userland as it exists in the world.
> It would be quite a thing if an upstream kernel change required a new
> BIOS update which then made the system incompatible with the most
> recent LTS.

Does downstream exist? :-P

We first ran into this issue with GPU firmware when it was originally
pushed to linux-firmware.  Upstream linux-firmware wanted it moved to
qcom subdirectory.  At this point, now upstream and downstream
firmware are incompatible in their directory layout.  You can't really
expect the kernel to support the downstream layout but not the
upstream layout.  If the upstream kernel has to choose, it will go
with the upstream linux-firmware layout.

Seriously though, the extra 60sec timeout delays is not an option.  I
don't really see any good option other than somehow teaching
request_firmware how to look for two (or multiple) paths at the same
time.  I'm not sure (a) if that is possible (ie. without breaking
compatibility with usermode helper), and (b) how others would feel
about adding more complexity to the firmware loader to deal with
downstream firmware trees.  If others are open to that idea, I'm all
for it.

And tbf, the BIOS update example is a *bit* of a stretch, since that
is often not something owners of the hw can do.  In this case, it is
just a matter of putting some symlinks in the downstream /lib/firmware
to make it work with both cases.

BR,
-R

> And yes, I'm very sympathetic that it's a pain (In the timekeeping
> code, there's a ton of messy duplicative code required to keep
> timespec alongside of ktime_t representations of time so we can be
> fast no matter which interface is used). :)
>
> And again, I can work around this one.  It's just that this isn't the
> first time, so I want to nudge folks to have a broader view and
> consider these issues a little more when making changes (not just in
> the kernel, but in why the names in linux-firmware are different then
> what's on devices in the field, etc).
>
> thanks
> -john
