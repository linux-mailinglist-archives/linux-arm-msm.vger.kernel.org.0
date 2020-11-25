Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84AF62C44AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 17:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730548AbgKYQJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 11:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730443AbgKYQJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 11:09:11 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79CBC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 08:09:03 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id v22so3103674edt.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 08:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGavmifCDc+NZqNqwVazq0GUfijJ4KA8O/ke5FrZ3qA=;
        b=v585cBho+cWfzBEa0tPcBR0T7ijryBi4rpemfAeo83KwRpLfAm5xNK3+A1mR1f5rez
         qSzn2sAh+R8mwGJyFOK61iYsisWiN5meiv/kiE1TOcUhiYj3cB8x+ib4JjLDgnkYcAPI
         sdZbkiGrQL094JNr+Y8UnWZ5qPJEJ8FcwChKlCgnw1Jych9WqL0To4cQsO89ikXFtegm
         dMGLjqveeLTEecZKqOs8iT3hrxPdFhKWulMdUc4a0jc/b8QCoW6S57ji0Epr3e4AnnRo
         6OSa0kJrDoMrwYigyTXLOhz1q8wudoHaBoT2mi/KCMthNP2jBah4IZ9YCDN4wxCYMKMB
         0ztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGavmifCDc+NZqNqwVazq0GUfijJ4KA8O/ke5FrZ3qA=;
        b=NBrQQRZEG0WaGq2aN/Kr9WQnXENTXfZ+JO5AOk+53sfQVSilHQDivy3qB5D1c2OPGK
         sCr1MjijKkx4IdqN2GUe0CSOdw7V+NiafUUCicsWM0xlh1BDCf9ZWaf1SSHWAa/FNPHF
         od2iXrX5jNiuotE/Abjulhh0PUPxu3IurDBBxzd/EgngEYyel0azsL93uPXhRRKo6cP+
         Ruc9GKLaIyJoXdpXHNknscdSr++UOG4ot1HYav2V5tALFiMb+4yiNRddtmU/zwNj9/9i
         R4B+7vik9ItKYXSWuhtgiv4PftJAM/7CGUHi7CMA0JHmtbJAOY4V7aFPYVsg5kmAIbjZ
         yv6Q==
X-Gm-Message-State: AOAM5303Tps4g4m7VD38IQVknjZSIN4gf0Otd4KYY09Y4rOQLQUiaNGO
        ClXgYf8ye8lZT+Bc0Q8X/N4t54GKo3qE0mjafaP06bXNxnQAEmYA
X-Google-Smtp-Source: ABdhPJxa7DaLvPKBRaJFgd//dZN6oIIc9UQXKHrUP3mRQQVSldbMFW6PVElIKo2hPUFTQs7iw9laX0d3qPp7XoqJG7Q=
X-Received: by 2002:aa7:d883:: with SMTP id u3mr4141240edq.69.1606320542623;
 Wed, 25 Nov 2020 08:09:02 -0800 (PST)
MIME-Version: 1.0
References: <1606318983-24898-1-git-send-email-loic.poulain@linaro.org> <1093835e-3ed6-5579-5fbe-39a6d8fbadaf@codeaurora.org>
In-Reply-To: <1093835e-3ed6-5579-5fbe-39a6d8fbadaf@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 25 Nov 2020 17:15:19 +0100
Message-ID: <CAMZdPi_9vWxupthj0piMM_cHjma1qpSU+sQWVF_c1SjBkEKX4w@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: core: Indexed MHI controller name
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Nov 2020 at 16:42, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 11/25/2020 8:43 AM, Loic Poulain wrote:
> > Today the MHI controller name is simply cloned from the underlying
> > bus device (its parent), that gives the following device structure
> > for e.g. a MHI/PCI controller:
> > devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0
> > devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0/0000:02:00.0_IPCR
> > ...
> >
> > That's quite misleading/confusing and can cause device registering
> > issues because of duplicate dev name (e.g. if a PCI device register
> > two different MHI instances).
> >
> > This patch changes MHI core to create indexed mhi controller names
> > (mhi0, mhi1...) in the same way as other busses (i2c0, usb0...).
> >
> > The previous example becomes:
> > devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0
> > devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_IPCR
> > ...
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>
>
> How does this change /sys/bus/mhi/devices/ ?

That does change sysfs device dir names:
$ ls -al /sys/bus/mhi/devices/
lrwxrwxrwx 1 root root 0 nov.  25 16:27 mhi0 ->
../../../devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0
lrwxrwxrwx 1 root root 0 nov.  25 16:28 mhi0_DIAG ->
../../../devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_DIAG
lrwxrwxrwx 1 root root 0 nov.  25 16:28 mhi0_IPCR ->
../../../devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_IPCR

> The point of having the bus name in the mhi device name is to give an
> easy way to correlate those devices back to the "root" device (I have a
> lot of users which do that).

I see your point but it's not a problem specific to MHI bus, user can
rely on sysfs/uevent to get device information such ass devices
attributes, children, or parent devices. Do you have a concrete
example in mind for your case?

>
> Also, do we actually have some device that actually exposes multiple MHI
> interfaces?

No, but better to fix possible problems ahead of time.

Regards,
Loic
