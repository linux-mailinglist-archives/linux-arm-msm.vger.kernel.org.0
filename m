Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1DFA3749CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 23:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhEEVDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 17:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhEEVDk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 17:03:40 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578D3C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 14:02:43 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id e25so3496627oii.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b8CFHnCZfOmJUKnxbUejIbuG3NY2WB8zr3QKhVl+ZOA=;
        b=oU2y0n074g/8S3chbTx92s/39iki76TkjcQCqv82dLbpmpNlySR0yBApHwVJSRJt4x
         c/W/HyEA0wsHX+r6Ws+TVriJnk1iUazeRR8VB0Igj8bii3UUYV5Z5gA6Kq6HCvPdzKII
         3cTjZpZ6WlYuH3Ii0aBLUBhiRHLAvGwC+4DlTc5W1sDNeh3++ES1tFNm6ZiBCfhwvbZY
         zyD08DucNsAOgeh5/dJNitEz1YSZgRxRSgfWW7hqCdaS5wi9rGe6OkILnoae5G/cmNJ7
         1OKC/nnhsI1RQRnXzdMgWz27o62DmXQICNLYd73D/k+BKIv7R5mgOSMU9z1KfxjylTT6
         TehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b8CFHnCZfOmJUKnxbUejIbuG3NY2WB8zr3QKhVl+ZOA=;
        b=YWRvSfaxJnvoAdsuCq1KlERN3+ejZhGPx+UCMyLQBw6XxFcFzyZRQ+9ZQBttsHpi6d
         7IWXOwTO7tlat+NK6h3GUG3IDJWe2yU5I9jtt1Oxr3HpLom6S0jZPZNlxDzs/BiDGp+e
         VFuyrThxSaRekREv44d/61xEto16xgFMZvpH3saU+5Vbu71YW7eluidyMU+cjH4E8sfm
         eknOQUqU0gTc0T7DQFk2F65hrBKuCNG9EAggd1hL4TbkEtr2jZNc58cssTwi+xZoHk51
         8Fb+xVPnTtLEduKas7yKsZFhSwI/oM3rASG3j7XXEXOQgnPIn6cCqbtD6iql1OKVY2oP
         9AHA==
X-Gm-Message-State: AOAM532JXPHCOPdrWXEPLO9Exag4XDrH/kyoSjuoxhoArnHbWWQYzMNa
        oxz3sI7jNBpd8VgFzfeeQNTJ+w==
X-Google-Smtp-Source: ABdhPJwTTjjOhSp991zVf5AZwb/sFcuChfoP20mQ9SrXn/f+nhmYJdR2RaUSGs5zJWpqOzY+QOBxTw==
X-Received: by 2002:aca:bac2:: with SMTP id k185mr631156oif.2.1620248562693;
        Wed, 05 May 2021 14:02:42 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 34sm137557otf.38.2021.05.05.14.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:02:42 -0700 (PDT)
Date:   Wed, 5 May 2021 16:02:40 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: Regression: arm64: dts: sdm845-db845c: make firmware filenames
 follow linux-firmware
Message-ID: <20210505210240.GH2484@yoga>
References: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
 <CAF6AEGt5AZ4jPO5=qUy-JhDCj1D5oD9nboNDDiJFnFDmWWvOaA@mail.gmail.com>
 <CALAqxLVxURmmJ227n8ozzsV96qqAxB+BdVV_kHbgFS7680=dbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLVxURmmJ227n8ozzsV96qqAxB+BdVV_kHbgFS7680=dbA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 May 14:35 CDT 2021, John Stultz wrote:

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

The whole problem is that the kernel _didn't_ work with the firmware
that was published to the world, we used the wrong firmware name and
because you and apparently the LT releases doesn't follow linux-firmware
this was not noticed until now.

> It would be quite a thing if an upstream kernel change required a new
> BIOS update which then made the system incompatible with the most
> recent LTS.
> 

Certainly so, but even if we didn't have to deal with OEM-signed,
per-board firmware files we'd have to hard code the file names in the
drivers - and would have run into this problem anyways.

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

Right, you certainly have suffered from this in the past, because we
didn't have a strategy for handling more than a single Qualcomm device
with any given instance of /lib/firmware.

Now we have a plan, and I believe db845c was the first board to
implement this plan and I got it wrong.  Going forward I hope to avoid
making this mistake again.

Regards,
Bjorn
