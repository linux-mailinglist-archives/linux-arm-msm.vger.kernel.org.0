Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C50B2C44BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 17:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730808AbgKYQRK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 11:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729690AbgKYQRJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 11:17:09 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4949C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 08:17:09 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id q3so3120409edr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 08:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDEU0AcL2307OSNRDcHiUqF9ANDJEEkXHW4P2K9Cfh4=;
        b=x5nq7DGH9MoFHCjE2Lr+r6xUdvUh7vudxVv6qjkUhEj7fjFXOfz4nlMDJ0ce3xL2NA
         G+7fk1eKMGIYxINWlVjF2ifyhS9jjtgJPXnZt7o/BVyW87pwtkEkm2jFHH9dbAs4wW9N
         CHXLmPwS3pOpjlNSE9V6ailcfne1mLyk8TygsG2BTkw3aJCwlaxicbIbCBKbyr4bsfSV
         XFqbRTjE34hlaH7jtnEpQGnae/rugoZQYPvBxx5q6JCztI992fk7XWV0Ww+BU+S6zTwB
         CT1nuGxlU/8XSVbYqqj18meSKuhiEml79DpjCB7PsXx1atJ972r5OqIQCY89sX3+TL53
         MOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDEU0AcL2307OSNRDcHiUqF9ANDJEEkXHW4P2K9Cfh4=;
        b=lJkDXXg/uikR22iszxmuBhYJs4AlFgdmrTgSPQc3q800OHFvvwe6myNNU5zeW0hvfK
         rP5YRautg+rogsp3214QNvUMjONM4CwCNpY6ijTdUAHiFn7a5ALtdUrjmSpvq54g7aFE
         QpZQu4Iu3AOczEfoAFnFY9ylBEZKSDgP886486jDngiggnT7R6OpRoUvacFWAs9eGNAW
         ZyEKaYOlYmp0KjTL3XX4X9g5RQ2/kOjtmX6+kEkdEeQAMW5OHIE7oiT2lEfhmMmWeoVS
         SVwJuUG/Wl5bDXLYfzoBu0KGwIq6cxR4sGSwABLb+VkgGJYhIP+x8pHdvtCgahjUWG+T
         3smA==
X-Gm-Message-State: AOAM531ABSCWPCBj2w42+/qQlYz6o2QulTK4wjrCyWi+UurwFTpp/vnw
        JcLdHJ9fO97+YeI76D80naHA5lQiZoRCFim8/WPytA==
X-Google-Smtp-Source: ABdhPJwaLeW7Ah+3S4bbHKbFLdVTPKnRtnpB1SOuBx2srIIPV9p8ncRudSIy39ELIv91RdGDjQrEfOhgX2C8JN/fJ44=
X-Received: by 2002:aa7:d883:: with SMTP id u3mr4181871edq.69.1606321028302;
 Wed, 25 Nov 2020 08:17:08 -0800 (PST)
MIME-Version: 1.0
References: <1606318983-24898-1-git-send-email-loic.poulain@linaro.org>
 <1093835e-3ed6-5579-5fbe-39a6d8fbadaf@codeaurora.org> <005093de-c8e4-2075-050a-5998a3cbcfcc@codeaurora.org>
In-Reply-To: <005093de-c8e4-2075-050a-5998a3cbcfcc@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 25 Nov 2020 17:23:25 +0100
Message-ID: <CAMZdPi-XNbfQuXJnGmodqTUH+Oh23RHZWy8_CMcFEu9Ga70MpQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: core: Indexed MHI controller name
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Nov 2020 at 16:49, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 11/25/2020 8:42 AM, Jeffrey Hugo wrote:
> > On 11/25/2020 8:43 AM, Loic Poulain wrote:
> >> Today the MHI controller name is simply cloned from the underlying
> >> bus device (its parent), that gives the following device structure
> >> for e.g. a MHI/PCI controller:
> >> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0
> >> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0/0000:02:00.0_IPCR
> >>
> >> ...
> >>
> >> That's quite misleading/confusing and can cause device registering
> >> issues because of duplicate dev name (e.g. if a PCI device register
> >> two different MHI instances).
> >>
> >> This patch changes MHI core to create indexed mhi controller names
> >> (mhi0, mhi1...) in the same way as other busses (i2c0, usb0...).
> >>
> >> The previous example becomes:
> >> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0
> >> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_IPCR
> >> ...
> >>
> >> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> >
> >
> > How does this change /sys/bus/mhi/devices/ ?
> >
> > The point of having the bus name in the mhi device name is to give an
> > easy way to correlate those devices back to the "root" device (I have a
> > lot of users which do that).
> >
> > Also, do we actually have some device that actually exposes multiple MHI
> > interfaces?
> >
> >
>
> Looking at the code change itself, looks like the controller index is
> essentially random, and not persistent.  Is that expected?
>
> I'm thinking it might be confusing if you have say 12 MHI controllers
> from 12 different devices, and some of those devices crash at roughly
> the same time.  The controllers get removed, and re-initialized, which
> means that you have essentially a race condition where the controller
> for the same device now has a different index.

There is no race since ID is atomically allocated, but yes your
controller can get a different index on unregister/register, like e.g
network interfaces index, usb devices ID, video devices, etc... can be
enumerated in various order. Not sure why the user should take care of
the MHI controller index.

>
> --
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
