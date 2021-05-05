Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6AFE374913
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 22:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbhEEUIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 16:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhEEUIV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 16:08:21 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7812BC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 13:07:24 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id l19so1919201qvu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gfHc0B69e72e8FxBkKouQfJU10JiT6SGWUs9jxUj5Pc=;
        b=fiY1Tp3+CVj+zfr5yH21tRcmApAPc/MxKZIzM5CqeJOZnx8vzOSj63H8dbUCaKAL3l
         IvuLXuCh7u03U7hASVPTE7etD3Au8pKbvtN5ll99CuJEs+m+jxMTtHw3nBrmmnGonYXq
         Ak1KVSy9kXukopPWnFFOJLFLrJdn9GewMfev2jQ9AAM/b6aXwrspyTPduSxIVVvmTVnF
         ajgiFDDZKR0pp8CE9gCgdNM7cFmXvs3//CLVGszUfg9niHknE2OwpxJrVbk0y4MeuaWv
         Nd6/uk3ybh/DvaLJdb2pw32Ok2EAzGEKkJQdoHci0W8zUMlm9Ny/yU3SsMjWJZXbDwSx
         2biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gfHc0B69e72e8FxBkKouQfJU10JiT6SGWUs9jxUj5Pc=;
        b=h8tIjnqB8i/WtmuCv1F64bWlwjGKI8TuxRTYCsZIierMWq8W5QiXiCOjiVs0qMUpdD
         oWnFeUta2nwBaHc1D0+s9PVotbpuQSwbge76ngbrFLAvYxz2VTFk6yx/y+ngw45fKa03
         dkFwuLOl4oBZb0x4JOGyxP644pebIPA0Q69nVoWwNuxy6WFqZScp6WVz+rlo5XM88hcD
         kuoBw4obXjZNtJzPg7pcNoZFBHhrlHiSFJ3W4EhEhgPMX56PZVdWKgIziOwCnS8EAK3Z
         Y1vxD7NN/vvQbwzbXledkt/UQbE/KS3Fukm/05AkWKAmV1iTBJX2Ri+lrxdVac3/YXyO
         Cz/Q==
X-Gm-Message-State: AOAM5300x33zQzER9wT0UBG2p4GxrV9WSO1ngWyvvY1NqDASNOBbH7xs
        5ULE2CRryi3K712JEHF0MNsjmkgAA4dCYW6EVej0cA==
X-Google-Smtp-Source: ABdhPJyFVYcDBAvHQyeHvtQx0tEqMVnsVBQlh+tPaiExmPswAi7gaV+lb+MjoDucBruQpqoDdbDDy1ePT9Ef6DEIQ1g=
X-Received: by 2002:a0c:e183:: with SMTP id p3mr810992qvl.4.1620245243593;
 Wed, 05 May 2021 13:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
 <CAF6AEGt5AZ4jPO5=qUy-JhDCj1D5oD9nboNDDiJFnFDmWWvOaA@mail.gmail.com>
 <CALAqxLVxURmmJ227n8ozzsV96qqAxB+BdVV_kHbgFS7680=dbA@mail.gmail.com> <CAF6AEGvZMe5BTBtu+=koAeDQF9AKDa0CTEWJTSV8+CW2jsh7fA@mail.gmail.com>
In-Reply-To: <CAF6AEGvZMe5BTBtu+=koAeDQF9AKDa0CTEWJTSV8+CW2jsh7fA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 5 May 2021 23:07:12 +0300
Message-ID: <CAA8EJppY6Qnnc5n9=D-bvb44-=U0b3ZefeOvTW7xOoKPLbgY3Q@mail.gmail.com>
Subject: Re: Regression: arm64: dts: sdm845-db845c: make firmware filenames
 follow linux-firmware
To:     Rob Clark <robdclark@gmail.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 5 May 2021 at 23:01, Rob Clark <robdclark@gmail.com> wrote:
>
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
>
> We first ran into this issue with GPU firmware when it was originally
> pushed to linux-firmware.  Upstream linux-firmware wanted it moved to
> qcom subdirectory.  At this point, now upstream and downstream
> firmware are incompatible in their directory layout.  You can't really
> expect the kernel to support the downstream layout but not the
> upstream layout.  If the upstream kernel has to choose, it will go
> with the upstream linux-firmware layout.
>
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

In fact we had this in place for a while for RB5 (qrb5165, sm8250),
when there was no official firmware release.


-- 
With best wishes
Dmitry
