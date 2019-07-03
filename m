Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEDF5E77C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 17:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbfGCPKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 11:10:09 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39916 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfGCPKI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 11:10:08 -0400
Received: by mail-io1-f65.google.com with SMTP id r185so5591510iod.6;
        Wed, 03 Jul 2019 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tBeQ15keJRuzad4ERXIDpILI/nTmHRA/IZ5Wy12SIY=;
        b=Kwjl9r08+wXXoiN7tk3DWvDtFrJpEccsm62jss4sY9SfrWV26ulm9a3JOfJUxHmx7N
         ehnLYqfv1Bt9MXCPQtbN5rT42RI4XGhCDypgyS9k5Tfir6+5Nu1f/Hqphsyay/q/l4NA
         cA6nHKqA6BXqsZfKoGe4YBQ6tF22kOQ/o2u6LwBr9PY0WPF2rGrJLEchvXtnf4jMV607
         FH7GaCt/uON5U/+J0ntxesMHutIiyrchvocnI1k+FuPUgEcEBqOoA2aZo3Cmee9uUUjj
         +jdhx2TJH6g0kj5g/7R7WRR8+8zlr/C2poqXaeVNeakFCFDvMgpp6fdaFb+YyyIbVG7N
         ZP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tBeQ15keJRuzad4ERXIDpILI/nTmHRA/IZ5Wy12SIY=;
        b=FKW2mryGH5aqWCTTMFnE9cImsSK6rkCSpCtjrhA9ulOe9OhQCCvByGphpq9lTHdRX2
         KLVWMAlw6Gwk/axj47Z3k6SNJABM6xtOfg9+izouB+hVHwIDThHHO5V2sSim8tJl7LwP
         Oago4MTgDNctb32eHjx5izKefo3iKr0DMOFlF0RZWY/mJc5PYZKNgREB1/OjMGvoMw+y
         3D+I17EmOrbOn4rndW8Ux1AqCB2w9zsDcesubYQvdR42kYDTUENvziQlsBMinyCQXX54
         vHhaxjb22OM2jXxdjvtB7NuK3fXmABkqFGk21Tv2rnC2qcgQOo25hF9PYtAVbijscfwE
         8Gng==
X-Gm-Message-State: APjAAAU9pskGHcQKGmViMR3Qn5VMARBRV02n/nk7ajejii2SUswcrLCK
        cRSW8Pou4gfEcHsSMW1Vv4zE/YnIfJ/ZFoIGBuRDNQ==
X-Google-Smtp-Source: APXvYqynbo0TvCuoYXiCZt+eOeNeSj1rTV/qRqThMPaa0pfxvV2Mi/VojWfBO0/yJi3CyvK++1xCXJsBnVwJOSOnsE8=
X-Received: by 2002:a02:bca:: with SMTP id 193mr43442848jad.46.1562166607574;
 Wed, 03 Jul 2019 08:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
 <20190703040843.GA27383@builder> <CAF6AEGvwMj+R6KbFYbatx8AuF+5mztc7246ocKXfRWnpphv9NA@mail.gmail.com>
In-Reply-To: <CAF6AEGvwMj+R6KbFYbatx8AuF+5mztc7246ocKXfRWnpphv9NA@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 3 Jul 2019 09:09:57 -0600
Message-ID: <CAOCk7Nr_LYhGOcUCMA83MQ8Xc4zRPfNcSkD6aGJFAcD_udDU-A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address space
To:     Rob Clark <robdclark@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 3, 2019 at 6:25 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Jul 2, 2019 at 9:08 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 01 Jul 10:39 PDT 2019, Jeffrey Hugo wrote:
> >
> > > Creating the msm gem address space requires a reference to the dev where
> > > the iommu is located.  The driver currently assumes this is the same as
> > > the platform device, which breaks when the iommu is outside of the
> > > platform device.  Use the drm_device instead, which happens to always have
> > > a reference to the proper device.
> > >
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> >
> > Sorry, but on db820c this patch results in:
> >
> > [   64.803263] msm_mdp 901000.mdp: [drm:mdp5_kms_init [msm]] *ERROR* failed to attach iommu: -19
> >
> > Followed by 3 oopses as we're trying to fail the initialization.
>
> yeah, that is kinda what I suspected would happen.  I guess to deal
> with how things are hooked up on 8998, perhaps the best thing is to
> first try &pdev->dev, and then if that fails try dev->dev

Thanks for the test feedback Bjorn.  Its unfortunate this solution
didn't work as I expected.  I'll give Rob's suggestion a shot and spin
another version.
