Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618732C2D5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 17:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390574AbgKXQvf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 11:51:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390479AbgKXQvc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 11:51:32 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D3EC0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:51:31 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id z5so9376506ejp.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3RQOPsic+9fUZ8cntWd3pHla3oBnbpt896XicZzUmCg=;
        b=kdXyCxx1nIbKtIZ84wlfw1bPP7vXM97AMtabCqZLNgr3EVFLUjvc/4MfHEM6xuBjs1
         73/Cbj0PbqOnAyvT0u8frpQum2TWPV0+kgh3DZzLdfnXcGnR8ygJMht111GnI3PqyPFG
         +fD4UVsHEaz0mhlJ1wpoRuJbKKCtDXF2I4XzEOFKbIFwlhOCANIJ7DOXJWJPELWJjIIW
         kkOb6V1vIyb17XnppkStZ4Aslz+RW9GgbUMwPPLyFzfPsRFWaZ294sgPvWdcNR0M0/M9
         p202ZwoHXS070Z0jWPyPIuaTTfThNirtbygH5Uale5HcKgx8w7+4ARvjMI9X3323w3YE
         4q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3RQOPsic+9fUZ8cntWd3pHla3oBnbpt896XicZzUmCg=;
        b=uUgkxExEThhes72JskZ+MT9qz5fLcFRFZOlhDiQjUxmEEt797u9yVU+3dpHFPeiW15
         NwJTk5nl0mr4SWjHYGnxHiJ9+5TMWUTe6SqY4aoN/Kzq9ZnXV0bos3ymY2OkJD+TS5XS
         20JfO8lR4yN91NGquGxIA6sNOjSClBnljQtk7hJX9PSBRd2G9lQts44KSXmw+3cEaTyX
         nWuHjTTdfIyfMnyA/wca7B1xIPd26OHg7vEyNAiLTMju4fOKtaDCq91iaMTxEexPaAaB
         uoqRkrQzWiZAM4z4NMhFC5YTl3PxjrRk3jUrz1VH3G8GXLZF+j3SlpwSn3xxMmvmYoRa
         aOUw==
X-Gm-Message-State: AOAM531otfhBFdfAiwy8auNmHr3zSyl0QZWXyjCOg1LXoHf0hP54kCcf
        EEgH6ei1j/E3/x4xoIUWEYsxQYE0ivBy/Dpc1jcmrbEAu/7Dhg==
X-Google-Smtp-Source: ABdhPJy1rTMbxN14rsCY1fUyZYG4HVhIEzHty2KPVHAkXjrjX1AhAVsEYs+/NINRKXI+fUqUpT+8J1x4zbzVhDGVizM=
X-Received: by 2002:a17:906:14cd:: with SMTP id y13mr4819569ejc.510.1606236689978;
 Tue, 24 Nov 2020 08:51:29 -0800 (PST)
MIME-Version: 1.0
References: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org> <b66d5f09-7560-3b82-84a3-b7cf40c9532e@codeaurora.org>
In-Reply-To: <b66d5f09-7560-3b82-84a3-b7cf40c9532e@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 24 Nov 2020 17:57:45 +0100
Message-ID: <CAMZdPi_n0h_S3f7R6H0kZO7PhpKiDLm0k6Cfxusg2+qfv1BerQ@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: core: Fix device hierarchy issue
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Nov 2020 at 17:36, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 11/24/2020 9:18 AM, Loic Poulain wrote:
> > A MHI client device should be child of the MHI controller device.
> > Today both MHI controller and its MHI clients are direct children
> > of the same bus device. This patch fixes the hierarchy.
>
> Why?
>
> I'm not particularly arguing for or against this change (I think it
> affects me slightly, but not in a breaking way), but this commit text
> seems pretty generic.  It doesn't really help me understand the
> relevance of this change.  It seems to be only describing what you are
> doing, but not the why.  How did you find this?  How does this affect
> the client drivers?  Does it make something the client drivers care
> about better?
>
> To put this another way, "should" is an opinion, and you've provided no
> facts to assert why your opinion is superior to others.

That's right I've not elaborate too much, but it's mainly to respect
the hierarchy of devices, as it is done for other busses. The
hierarchy is especially important for things like power management
ordering (PM core must suspend devices before their controller, wakeup
the controller before its devices...). Moreover it will also be useful
for userspace (thanks to sysfs) to determine which devices are behind
which controllers (and so determine if e.g. QMI and IP channels are
part of the same device).

Regards,
Loic



>
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   v2: fix commit message
> >
> >   drivers/bus/mhi/core/init.c | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > index 436221c..c7a7354 100644
> > --- a/drivers/bus/mhi/core/init.c
> > +++ b/drivers/bus/mhi/core/init.c
> > @@ -1137,7 +1137,15 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
> >       device_initialize(dev);
> >       dev->bus = &mhi_bus_type;
> >       dev->release = mhi_release_device;
> > -     dev->parent = mhi_cntrl->cntrl_dev;
> > +
> > +     if (mhi_cntrl->mhi_dev) {
> > +             /* for MHI client devices, parent is the MHI controller device */
> > +             dev->parent = &mhi_cntrl->mhi_dev->dev;
> > +     } else {
> > +             /* for MHI controller device, parent is the bus device (e.g. pci device) */
> > +             dev->parent = mhi_cntrl->cntrl_dev;
> > +     }
> > +
> >       mhi_dev->mhi_cntrl = mhi_cntrl;
> >       mhi_dev->dev_wake = 0;
> >
> >
>
>
> --
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
