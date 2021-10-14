Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865C542DFFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 19:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbhJNRTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 13:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbhJNRTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 13:19:23 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9A4C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 10:17:18 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id e65so3747947pgc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uU5dzi7PAGH1pa+mWTeSrCJObjju9kgqakOjaBlDAW0=;
        b=A7lMXIIOac4s/f3MVQrBX4P/lTDUI4LXbcAox7LMJnpRT3zZNPDMkTdupNH8xs+K9o
         AZH1IXTEn4Y/P2uwXdG+bFdT9Ialr6VUxAQcv4+IvgkJUhTjrx2B4jdtAYgZc9e6Wy18
         gVxRVAt+hjwpMo521vrPLWMYFbmAUoCGy2RGVahGL0ZcJ/vscVEx29B7XlZYFDSVLKgT
         i/6pbJo8fTVzEUAGY3Rz75vyM+PCQdEKIvU30NmbY8A2p0R8ldq5/y1z0GyjXvjuVNyE
         JTGAaRkGlEWwyNUqH3T583oVdDD5hO66YjZucsQ99q+X5OOalD7n8z/L1eLIz0xQidJD
         rBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uU5dzi7PAGH1pa+mWTeSrCJObjju9kgqakOjaBlDAW0=;
        b=tDQQy0NX2FYE2qYbxfHux2NRxLfavAUgXO6DBrR5bHlMmRxr0zb/YTBPRLEHw++2Hq
         Q4cHQo42S2VeckuipD6774tm86ZTCoDEsxzRJgaa2VLsWlaJN+njCrCvWD5z6/L7gkSJ
         6GNhtmEMG7UR2T5mUAK5KMyYaPfUxmynJ27fTe6uDSrQOEHKZRmGG+ITALL5xSSRTZtO
         YMWwt5zLfqJ2W2YHXbEfzYPc1xzqY23Y2hv79DG7hxkudIRiyvZLI7KLZYvOTigmT5B1
         DFz0YuxS0SNCMuzI6BLDDQ5DWO+NuKT7/KkSqdIi4EYPJiUzfxVHNzPFf7koLfsnZk0Q
         enGA==
X-Gm-Message-State: AOAM5336dApkrU9F6798rmPkfVmf8k5r7vnDICzQ+UCybScy45G5OmOH
        r9E6xNE8/XA567btOXNoDd9VlCHNYOLmKODHePUYTw==
X-Google-Smtp-Source: ABdhPJyqYR89Xy9NBUNLwjaFrkS8ZipQ2fEKDVAQB/Vq3jVMAPg+MTGdawXMquItOxtBu34Ra7R4LdWPOMMU4CGfRjQ=
X-Received: by 2002:aa7:9e9e:0:b0:44c:c821:c132 with SMTP id
 p30-20020aa79e9e000000b0044cc821c132mr6466731pfq.61.1634231838229; Thu, 14
 Oct 2021 10:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
 <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com> <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
In-Reply-To: <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 14 Oct 2021 19:28:07 +0200
Message-ID: <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Thomas Perrot <thomas.perrot@bootlin.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HI Aleksander, Thomas,

On Thu, 14 Oct 2021 at 12:04, Aleksander Morgado
<aleksander@aleksander.es> wrote:
>
> Hey Thomas,
>
> > > > Otherwise, when responses are received, we also can observe strange
> > > > things: unexpected messages, response to previous commands or queue
> > > > buffer issue.
> > > >
> > >
> > > Are you testing this with qmicli + mbimcli + ModemManager? And if so,
> > > are you running the qmicli/mbimcli commands with the "-p" option in
> > > order to always use the intermediate qmi-proxy/mbim-proxy? I'd
> > > suggest
> > > to always do that to avoid having multiple processes talking to the
> > > ports at the same time.
> > >
> >
> > In first, I'm testing with qmicli/mbimcli commands with the "-p" option
> > in order to always use the intermediate qmi-proxy/mbim-proxy that that
> > I run in debug mode beforehand.
> >
>
> Ah, nice, that helps to clarify. When using the proxies, there should
> be always one single process accessing the ports.
>
> > >
> > > > I updated the topic opened on the Sierra Wireless forum, with our
> > > > latest progress and as well as additional information.
> > > >
> > > > In addition, we observed some strange behavior of the EM919x after
> > > > warm
> > > > reboots.
> > > >
> > >
> > > Is the log after the warm reboots similar to the one I showed in my
> > > first email, i.e. with the 2 reported "firmware crashes"? Or does it
> > > look totally different?
> >
> > After warm reboots, we observe no explain message indicating an error,
> > but we use an old firmware version.
> >
>
> Ok.
>
> > > And, do you always see the module booting properly on cold boots? Or
> > > do you see failed boots like the one i showed in my first email?
> >
> > The module doesn't always booting properly, you see failed boots like
> > the one you showed.
>
> This is good, because it confirms that our fully different platforms
> running the same kernel driver show the same symptoms. So it shouldn't
> be an issue of the platform, it's likely either the driver or the
> module firmware.

So it looks like the device is not in the state expected by MHI core,
not sure however if it's a bad interpretation of MHI implementation or
a specific issue in that firmware. Maybe one thing you could try is to
call mhi_soc_reset(); msleep(1000); just after
mhi_register_controller() in pci_generic probe() function... it is
supposed to hard reset the modem CPU, and maybe getting it in better
shape?

Regards,
Loic
