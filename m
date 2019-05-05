Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAE5141B5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2019 20:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbfEESF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 May 2019 14:05:58 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43482 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfEESF6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 May 2019 14:05:58 -0400
Received: by mail-wr1-f67.google.com with SMTP id q10so5631091wrj.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 May 2019 11:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N8g69TrotyMJ93TmfQM1QRaCDtlTbgGM9P0/S8prlKY=;
        b=N4ppmbOguloFIq3UkVgg289rgjhgRJuR/Pb5ebMzAKtk+IpFE6nP+1KRvQRetlBxmV
         PZxZv+kvtcX5yV8z/TwVwMrFzjwRlpgQqRT4WBVt9efqu3HPDPUO2GUVoWyTReLwnmfb
         e9YWSgL+cHubyBJCWO06r9I48BBOU5aojW2S5nUefx+55AED0U6cUA+91m4V2VSUAJFf
         6eV+s7FXGj82Lx11AhnLzkAMhimLcTOIvK6qsZXX+sg1ik90856vuExeeDaDkDan/QXn
         mjNF/2QeKCdl/qHp5an3BfU2PvLt/XvgmjW1GL1VMYB/8RYf8HxDpeX0VeS55uTeFisD
         U5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N8g69TrotyMJ93TmfQM1QRaCDtlTbgGM9P0/S8prlKY=;
        b=I3eH55IlhuiMINuV4eyZu2VPIS+IsVPWAyVv22aa4HHkrYxHsECaSOn9R6OdCbdGRy
         gaV1bmd8lvh7a+eB8wWVaYu6ogQADrjYBAYeA5Xwwouw+FuvATMEJs8wa7Nk0POLxaWj
         A8968ShztWLiIwg1FfBgwrTPan8X6IKeFcKRSthPnjRCQHWlJq5OLGemn4SKU8bOgL8d
         foN3uU2P/p1JjnO3ehv4YZ1JRvLg8GaGhm8KC3kwVkNwGKkzalsEqSt+JsxnbtSo6bnb
         qfq/3YKStiijb9HaG5Z5qQpfjXGPbgKoeTTvv/j8l7mTZ//g41G0I6pKBxONazi7UU0r
         2KkQ==
X-Gm-Message-State: APjAAAWBh9RKFiPZlwc7PuUhgkIGvhxpnqNrtaLBCI0M/E7MVazKVHjv
        98NjJsu51uaQuR2/JmBLk+suxyE4bdSfU6C0ERye1xp4
X-Google-Smtp-Source: APXvYqxo+Wrw5RiAJUYAfK6lr/auyoLQkZoxAyR387ejzTEDruhcdCPR8lsTuKMSDv9CtepCLrrDoxbOVTF7qGrlvrY=
X-Received: by 2002:adf:9cc8:: with SMTP id h8mr9509687wre.308.1557079556148;
 Sun, 05 May 2019 11:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <68b71c15f32341468a868f6418e4fcb375bc49ba.camel@gmail.com>
 <20190211105755.GB30880@fuggles.cambridge.arm.com> <38d8965a-cd41-17cf-1b95-8dd58c079be4@arm.com>
 <874c702b8af760aa8fae38d478c79e3ecba00515.camel@gmail.com>
 <235d20ef-3054-69d9-975d-25aebf32aad3@arm.com> <20190223181254.GC572@tuxbook-pro>
 <86zhqm8i6d.wl-marc.zyngier@arm.com> <20190224035356.GD572@tuxbook-pro>
 <33d765b5-1807-fa6c-1ceb-99f09f7c8d5a@free.fr> <8eb4f446-6152-ffb6-9529-77fb0bcc307f@arm.com>
 <7b5e8bb1-d339-07f7-66f6-7f09df2107c4@free.fr> <3757fc2d-0587-be46-8f75-6d79906be8bd@arm.com>
 <5b83a4c2-1f0e-337f-a78d-f7d84fe01ab3@free.fr> <a6f89d1a-e7bb-bae9-6666-f4d5b263b835@free.fr>
 <b7a3c9d1-6bbc-1f14-956f-ee4dd3bce175@arm.com> <bd3d23ed-1e4c-861b-35e6-08c2f7e4a47c@free.fr>
 <CAK7fi1b5PP+ToK5fS6xEvGaNF=43=OtA8=5KhypTcFeryWSr9Q@mail.gmail.com>
In-Reply-To: <CAK7fi1b5PP+ToK5fS6xEvGaNF=43=OtA8=5KhypTcFeryWSr9Q@mail.gmail.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Sun, 5 May 2019 20:05:44 +0200
Message-ID: <CAK7fi1Y64uawt5VFqec9KzcytxW0bKOHAECv6gQ4yS1=jedg0Q@mail.gmail.com>
Subject: Re: [PATCH] arm64/io: Don't use WZR in writel
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

orry again for the double email, but we've just discovered another
issue with using the zero register for writel.
On the downstream kernel we are observing an entire userspace
crash when closing the camera on * at least * MSM8996, SDM630
and SDM636. We're not sure that the issue is present on MSM8998
and we should probably test MSM8956 as well.

I know, the testing is not really complete, but I thought to urgently
write this to you guys as soon as the thing got discovered.

I'm mostly sure that this is not happening because of the IOMMU again
but instead because of something within the camera drivers, probably
some writel to the ISP or to the VFE is the cause.

Last thing, yes - this was discovered on downstream (kernel 4.9) and
not on mainline, but the IOMMU thing was also discovered there, so
something tells me that it's gonna be affecting the camera drivers that
we currently have on mainline as well, or future developments of it.
Especially if it's another hypervisor crap.

I'm going to do some more research about that camera thing downstream
ASAP and if you want I will keep you informed.

Have a nice day,
Angelo

Il giorno sab 4 mag 2019 alle ore 15:35 AngeloGioacchino Del Regno
<kholk11@gmail.com> ha scritto:
>
> Sorry, I've replied yesterday but I just realized that I did click on the wrong
> button and the email got sent only to Bjorn. My bad.
> Resending to all... this is the original text:
>
> For me, the [1] solution is working fine on qcom SDM630 (Xperia XA2),
> MSM8998 (Xperia XZ Premium) and MSM8996 (Xperia X Performance).
> I couldn't test on others that I have for time reasons, but I think that it's
> not even needed.
>
> By the way, I suggest to clearly document the fact that (from what I
> understand, at least) we can write whatever value we want to that
> register, as the change as it is may confuse some developers around.
>
> In any case... if you want, you can also include my:
>
> Tested-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Il giorno ven 3 mag 2019 alle ore 15:07 Marc Gonzalez
> <marc.w.gonzalez@free.fr> ha scritto:
> >
> > On 03/05/2019 14:48, Robin Murphy wrote:
> >
> > > Anyway, I'll clean up my patch and post it properly - thanks to you and
> > > Bjorn for testing.
> >
> > Cool. Thanks!
> >
> > AngeloGioacchino, are you still monitoring this thread?
> >
> > On which qcom platform(s) did you run into the issue?
> > (Robin's work-around has been tested on msm8996 and msm8998.)
> >
> > Regards.
