Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366C042D6B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 12:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhJNKGc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 06:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhJNKGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 06:06:23 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42F8C06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 03:04:18 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id y30so5570102edi.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qbD1dxruVQ/6KPY7ss5Qw3vQLmfKZDPuxq3BiKfnPSc=;
        b=beO/pg1wUBQsgx39q/Rax5HiKKcTBAXRTYJhuk4nxWCq/JxJfcEQef8+9d2a39xGdT
         bk9i++uHcA+J7wSZhx/nHXklVQRIGE4OwXNPk7Fuws8QKKGXC5GttFzZB+MIbvDh7f7J
         RyWiY+sfjRwu3NSkZ4VBOyd3l1mu0nMLTVBtQIZvR8i7WidkISyMrsGE/oEjJcYqTghG
         Q8/qphtrF7ekiufdLuJa2WD1fl7hyB7bAOrjU1ejN2471l7nOs5F48tRZ7Y07mWwPfmw
         TseR8BPJlEKtZiCbnEuNExfmbszLyK8dyLGCWzZbjb5j+OISH07rISHJcC7ZQ4TSFF1l
         ZVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qbD1dxruVQ/6KPY7ss5Qw3vQLmfKZDPuxq3BiKfnPSc=;
        b=v4RKHSffDxrwpjpMLSVzxgVJR0IKLl6VBMlmfkoSIb1jllmGs+MoFF+9MN1J0HVY0o
         5N+DScAx2ogYPDemaaF9O/pFLw048JnteKAMRjutLGXyCxMxPDA8KLKgvqidwD3rRIqT
         5IF85f9/XKcrOxoeIKeTLERcfuttj86iRpJaLDZ6ZCCOXhMQDrwlaFPqVwZcNvOz8ePG
         J9hKGr+AWTiyzLxMOIlFhzf1IMcp9R40UoN+9zAKvE+QjfSZ5/iYrwoHLhfmmatExg9C
         GleeJimDvCu12MWA5J9qLE72qcZaebVlvIHw99cyuy2C/6s4vWnDPwGAwhlzCTcKkwx0
         kYNQ==
X-Gm-Message-State: AOAM533h8aZs/CNx8usKiqEhkbgBMF38yEpAR3DtDpVJsJembbRcIm3m
        taVK4WHS7zD6AHxENa9Xox7U7lozy+Y6BsvNV2jCgw==
X-Google-Smtp-Source: ABdhPJyaHSQoTlgmlobRW88GrBFDHN8CKYf5zR2qMmeRlK4z1xSbCEAKdZuMsSYehfQfrzwW3YUSTsHM82QVWq7rt14=
X-Received: by 2002:a17:907:939:: with SMTP id au25mr2700676ejc.166.1634205854776;
 Thu, 14 Oct 2021 03:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com> <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
In-Reply-To: <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Thu, 14 Oct 2021 12:04:03 +0200
Message-ID: <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, hemantk@codeaurora.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Thomas,

> > > Otherwise, when responses are received, we also can observe strange
> > > things: unexpected messages, response to previous commands or queue
> > > buffer issue.
> > >
> >
> > Are you testing this with qmicli + mbimcli + ModemManager? And if so,
> > are you running the qmicli/mbimcli commands with the "-p" option in
> > order to always use the intermediate qmi-proxy/mbim-proxy? I'd
> > suggest
> > to always do that to avoid having multiple processes talking to the
> > ports at the same time.
> >
>
> In first, I'm testing with qmicli/mbimcli commands with the "-p" option
> in order to always use the intermediate qmi-proxy/mbim-proxy that that
> I run in debug mode beforehand.
>

Ah, nice, that helps to clarify. When using the proxies, there should
be always one single process accessing the ports.

> >
> > > I updated the topic opened on the Sierra Wireless forum, with our
> > > latest progress and as well as additional information.
> > >
> > > In addition, we observed some strange behavior of the EM919x after
> > > warm
> > > reboots.
> > >
> >
> > Is the log after the warm reboots similar to the one I showed in my
> > first email, i.e. with the 2 reported "firmware crashes"? Or does it
> > look totally different?
>
> After warm reboots, we observe no explain message indicating an error,
> but we use an old firmware version.
>

Ok.

> > And, do you always see the module booting properly on cold boots? Or
> > do you see failed boots like the one i showed in my first email?
>
> The module doesn't always booting properly, you see failed boots like
> the one you showed.

This is good, because it confirms that our fully different platforms
running the same kernel driver show the same symptoms. So it shouldn't
be an issue of the platform, it's likely either the driver or the
module firmware.

-- 
Aleksander
https://aleksander.es
