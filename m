Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363BC3748C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 21:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhEETgn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 15:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhEETgm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 15:36:42 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CB5C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 12:35:45 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id b21so3958307ljf.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 12:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vciZJzT2gTtgvpi+hYNeYdkzDSJo5ijNzkfiEuliAPA=;
        b=VdOvbzA79m0Baj+Et1FFYDJvEJe7GqJB+1D/C9sszBq4Dv3DNEIfCJDzB5BYsJ8O1J
         bp5PI4hr/s5kNsEcqvKR2hCKlKWgirfT8nBhOKkRTWxU6WaRcAjirun76wFSVkrLT2Hu
         BnhSJJ5tA428nwDN47OI6K8hFuabwWecA5hZZgL++7K3qCxatNgvezum/XZg0qxSzcy0
         jeRr+gmIKe27s5GNScbG8+O+qlTaP632oDKPpjAf/YAt8aVVOH12uTMvtVyl0lLQdJL7
         +P+prmUMOde+bwVVXv35lcinpkjyyka7pb8iZddDuS6BSIY7rZ4ZCO1JtDbz0CmAqsoc
         +rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vciZJzT2gTtgvpi+hYNeYdkzDSJo5ijNzkfiEuliAPA=;
        b=nZkEIe1az+/I6ycG2M+iNhK59okNZuOsVvGY2Sn6956XShXlBCfMHWZgKKTQT51Dye
         T4qEcn2LdTt00OLr33JX8PsBdj2SkoE7kYPvm3hSn01w5Fys6h4LeMjxYonGg7IU/aDv
         1gmR2TlTLSwRrUKXfilbBzFQI1HIX/tpQPEHpNeE0PmYZS9TybJaYGuRgqJwE9XONoy5
         RYV46APffKZtzkF6Nuwe49raxAFpqcdbdTL0gHpoqbG4l/A7egy/0Gwnf5gzo++Z2I6u
         KLs1/bvQEuX+JhJGyJo1TBbzsO4VqcnWilnTVENAFmj6/knXJyWx97q0NcRyWceFc0kp
         +Rfg==
X-Gm-Message-State: AOAM530+mb5vUyXp4egvDVR7A/89QFeUP+qdC33vZhdMtEXA+3lLdDMo
        BTSABTTQGtbVYhHZro8CLD2bKO1idXwIS69bcTA7xg==
X-Google-Smtp-Source: ABdhPJzeHJPFd7rZLYvJLpPbthkcidVIx/g+D/WD+YmWPXOBHBA8nyNlOg7r43INdz++YeTF27vwPEQfaDjyFVSyx7A=
X-Received: by 2002:a2e:9d88:: with SMTP id c8mr311880ljj.257.1620243344289;
 Wed, 05 May 2021 12:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
 <CAF6AEGt5AZ4jPO5=qUy-JhDCj1D5oD9nboNDDiJFnFDmWWvOaA@mail.gmail.com>
In-Reply-To: <CAF6AEGt5AZ4jPO5=qUy-JhDCj1D5oD9nboNDDiJFnFDmWWvOaA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 5 May 2021 12:35:32 -0700
Message-ID: <CALAqxLVxURmmJ227n8ozzsV96qqAxB+BdVV_kHbgFS7680=dbA@mail.gmail.com>
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

On Wed, May 5, 2021 at 8:04 AM Rob Clark <robdclark@gmail.com> wrote:
> On Tue, May 4, 2021 at 11:37 PM John Stultz <john.stultz@linaro.org> wrote:
> > Hey Dmitry, Bjorn,
> >   I wanted to raise a regression I caught in the merge window on db845c.
> >
> > I was seeing troubles with audio and while there are a few other
> > pending fixes needed, they did not seem to work for me. So I spent
> > some time bisecting things down and found the problematic commit was
> > 7443ff06da45 ("arm64: dts: sdm845-db845c: make firmware filenames
> > follow linux-firmware").
> >
> > It seems for systems using the old firmware filenames, this will break
> > dependent devices on adsp_pas and cdsp_pas nodes.
> >
> > Now, obviously updating the firmware files in userland should resolve
> > this, but it adds the complexity that we can't just replace the
> > firmware files because older LTS kernels will look for the old names,
> > while newer kernels will look for the new names. We can add both files
> > to the system images, but then there is some confusion on which
> > version of the firmware files are being used where.
> >
> > So yes, we should align with linux-firmware file names, but I think
> > more care is needed for this sort of thing as it has the potential to
> > break folks, and this isn't the first time around we've had similar
> > firmware name changes break us.
> >
> > So I'm working on fixing this by including both filenames in userland,
> > so we probably don't need a revert here, but *please* maybe take more
> > care on this sort of change.
> >
>
> It is rather more difficult than you think, because if you try the
> wrong path you could end up waiting with a timeout.. we have
> shenanigans to work around that for gpu fw in drm/msm to avoid this
> sort of regression with people using downstream firmware trees.  I'd
> like to rip that out at some point, but I suppose doing so would be
> problematic for folks doing upstream kernel on android devices.
>
> Maybe there is some way to add support to simultaneously
> request_firmware for two different paths at the same time.. not sure
> how that would work from the PoV of the usermode helper path.
>
> It really is a lot of pain to deal with downstream firmware layout..

Yeah, but on other platforms, the kernel has to meet and deal with the
hardware, firmware and userland as it exists in the world.
It would be quite a thing if an upstream kernel change required a new
BIOS update which then made the system incompatible with the most
recent LTS.

And yes, I'm very sympathetic that it's a pain (In the timekeeping
code, there's a ton of messy duplicative code required to keep
timespec alongside of ktime_t representations of time so we can be
fast no matter which interface is used). :)

And again, I can work around this one.  It's just that this isn't the
first time, so I want to nudge folks to have a broader view and
consider these issues a little more when making changes (not just in
the kernel, but in why the names in linux-firmware are different then
what's on devices in the field, etc).

thanks
-john
