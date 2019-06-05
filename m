Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5839A35797
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 09:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfFEHXN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 03:23:13 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44387 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfFEHXM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 03:23:12 -0400
Received: by mail-io1-f66.google.com with SMTP id s7so12083573iob.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 00:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bFlickOGyCE8q2nid47CTokWI0/Tlpvfgy/2BgVqxGM=;
        b=LxIaZty5SFUHpeOd6VDojbonDevwkb/pcxQ1fTAr8bq2nAGRG0FUXbB1ahd4Cs8yIg
         oRPSkndInGzFgEmm/7b8+X+6UoxWShv3j+IC09/3LLXcEjsZyFDlSftzMZGeWVKdukuX
         tRxKQheHKNttUpTHH5/RMjZ+9n5MZjzcjavgM2hp/GDi8kasXudamsoB8q5ZYKcvvRFK
         oXRYVu3aAEZpJ3wnVIPhImAJzexpje8nEOn7PZhmrjPhy8orFBxeeLwbH0l94g5oP+Bm
         HWPA8NJ/LOwXgcprZGF5/kFXdsM8GDFUlEgPx3qrwshAgepVR88j0fhlf2GCzx85nK3B
         zqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bFlickOGyCE8q2nid47CTokWI0/Tlpvfgy/2BgVqxGM=;
        b=IWsrcWCUj3dRa8doi12tpBXD6ndDzPs7cp+iH6yEIoTKWt0rJkedRb9RT0jJAaAdVH
         ZF2F0M0IWlQ4PZ6cVMtrFsy4Hs4ct4x128+a1F8VyMxOeyMUb+0JzlKuktDkqRXciVNS
         vVzUQT46MuhsJ8fkXhtLDyj5wrAoonFAqHOTW8FlbcVJyeDoYc/UKdQ/Xasoivqlh6o9
         xk4WJJ1QSvyeyaV1qejjyDL+VAUJ7dmGoigzYPLJr17sjYlHnVsyosTwUhH6M/yuw6T2
         xV52/3y50SVhmO0HIrb+s8JW/Jtl9DyetoNL3vqxrHZ/lupS2fk+T8bj4aCa/mpl93b+
         HkLg==
X-Gm-Message-State: APjAAAVlYrr8wLgSdBowbQZvdxxxDMIV45PBrAcsLZlkNJOpaxA1mQ6E
        LBuPoPPBwYub9yDHlPmo674GP15Cd643TtOWttD4gA==
X-Google-Smtp-Source: APXvYqyvUHNyNwg2/0w1ihfOoePLCRKJbrn5Y6sShasQnJXGkrj6UQ0uvq3+cXzOG4W7XlqhT4twEcbHEF/T3XAEymE=
X-Received: by 2002:a5d:9402:: with SMTP id v2mr7086874ion.128.1559719391862;
 Wed, 05 Jun 2019 00:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190604104455.8877-1-lee.jones@linaro.org> <20190604104455.8877-2-lee.jones@linaro.org>
 <20190605062020.GL22737@tuxbook-pro> <20190605071625.GK4797@dell>
In-Reply-To: <20190605071625.GK4797@dell>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Wed, 5 Jun 2019 09:22:59 +0200
Message-ID: <CAKv+Gu_YcdePUkkCGdP5DC9rxCUAshgOzU32pViAp2CbmAaJuw@mail.gmail.com>
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        wsa+renesas@sang-engineering.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Brown <david.brown@linaro.org>, alokc@codeaurora.org,
        kramasub@codeaurora.org, linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 5 Jun 2019 at 09:16, Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 04 Jun 2019, Bjorn Andersson wrote:
>
> > On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> >
> > > The Qualcomm Geni I2C driver currently probes silently which can be
> > > confusing when debugging potential issues.  Add a low level (INFO)
> > > print when each I2C controller is successfully initially set-up.
> > >
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > > index 0fa93b448e8d..e27466d77767 100644
> > > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > > @@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
> > >             return ret;
> > >     }
> > >
> > > +   dev_info(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> > > +
> >
> > I would prefer that we do not add such prints, as it would be to accept
> > the downstream behaviour of spamming the log to the point where no one
> > will ever look through it.
>
> We should be able to find a middle ground.  Spamming the log with all
> sorts of device specific information/debug is obviously not
> constructive, but a single liner to advertise that an important
> device/controller has been successfully initialised is more helpful
> than it is hinderous.
>
> This print was added due to the silent initialisation costing me
> several hours of debugging ACPI device/driver code (albeit learning a
> lot about ACPI as I go) just to find out that it was already doing the
> right thing - just very quietly.
>

I agree.

There are numerous EHCI drivers IIRC which, if compiled in,
unconditionally print some blurb, whether you have the hardware or
not, which is pretty annoying.

In this case, however, having a single line per successfully probed
device (containing the dev_name and perhaps the MMIO base address or
some other identifying feature) is pretty useful, and shouldn't be
regarded as log spamming imo. dev_info() honours the 'quiet' kernel
command line parameter, and so you will only see the message if you
actually look at the log.
