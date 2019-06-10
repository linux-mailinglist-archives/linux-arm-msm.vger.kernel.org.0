Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0843B309
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 12:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389336AbfFJKUo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 06:20:44 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:37939 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389291AbfFJKUo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 06:20:44 -0400
Received: by mail-it1-f195.google.com with SMTP id e25so6072060itk.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TD9nldu+Dkg66DtJL22FIFPPAtJrtLwLTy4JIGvUcQ0=;
        b=xGOZzIJLwgDnCGn+KlPHKMf5rhw1h6HPB+95GrnYpcFyME3d6inxxLyUdmnkUq34J+
         zIomGN+MLBR/oBWOe0ulrBE7Z4E32pfkipA+UvLZ1HSdKDy8GC6l8Mp9wJ803ogYGbAJ
         XkKTMgVLsEwE6FpWaaDwbvNxWnbiruke6qUOyB0ejNsZuBRBi3b43yVy4fvDCb91ewO2
         Zjef6VagFWfnsI0m34DKo41NNnLdVP9/Dyh1VbdA8PowiwZdyPE/WzmPhq03ic8Wi1/B
         bsA1uFFW4PNjaH9sgcjjZ0hpbNNQwDPdUAJ2P909ro09PZSJ1gys4wpgtKshS4+ctbrH
         zTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TD9nldu+Dkg66DtJL22FIFPPAtJrtLwLTy4JIGvUcQ0=;
        b=LeTbA7CkJTndh4exvHquBaYHhs8SDLc7Ej8E+yY+D+n7TE50CGEXQ3mRg85REGV24I
         47mFf8HzorZeAyuXjkxXhxvWMSZoeHJGz4L5NXEKcJNl0Jcr2VDMPc9DFDdQ/LMu7G6W
         W3o3EhQZpc9GrNemCJpV7MemrGkfxLcP6MRdmgbViz/m63yzsmbYMKTX4AppXe0V2SWQ
         9CBjCXh0oAjLJyJpAOpHmMXqmaO9EMTgsMNhnmIMPRIxZuSGrOnYEIKtptbbcwkOrYWv
         VpmanXuiFqtKe9by9iJU7Hbkvk9+8lBrpnVIwQ+i+ML+SofEzVVtrSGN3fAz7vV/sN84
         CgpA==
X-Gm-Message-State: APjAAAVFt4dCfar+od4aKgfEGlOPPbMLVKkUerFfGhohuksS4cJqMTEJ
        1549Gh+vxIn1DLNbNZ5NHD+C6IoTSnix0tJgCR1Pwg==
X-Google-Smtp-Source: APXvYqz8+9gsk4GZjuP3WNO3dIJxKVqLA91XwEqoIRkCKyS++7skP/Y8F+BITEkNQ+1mKDd2q8VehsdTmYGSs98dr0s=
X-Received: by 2002:a05:660c:44a:: with SMTP id d10mr12222840itl.153.1560162043688;
 Mon, 10 Jun 2019 03:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190610084213.1052-1-lee.jones@linaro.org> <20190610084213.1052-4-lee.jones@linaro.org>
 <CAKv+Gu_s7i8JC4cv-dJMvm1_0cGzzhzf+Dxu0rxcF7iugF=vHg@mail.gmail.com>
 <20190610085542.GL4797@dell> <CAKv+Gu8rhxciy1cOG3B3pda9+p4R_COGrrqa7S_Rj9y2HeBxYw@mail.gmail.com>
 <20190610092245.GN4797@dell>
In-Reply-To: <20190610092245.GN4797@dell>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Mon, 10 Jun 2019 12:20:30 +0200
Message-ID: <CAKv+Gu94ES4_SjkmAMaAgwCtsx_YmOn0=yaeM9GFjPCCxrANoQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] pinctrl: qcom: sdm845: Provide ACPI support
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        wsa+renesas@sang-engineering.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 Jun 2019 at 11:22, Lee Jones <lee.jones@linaro.org> wrote:
>
> On Mon, 10 Jun 2019, Ard Biesheuvel wrote:
>
> > On Mon, 10 Jun 2019 at 10:55, Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Mon, 10 Jun 2019, Ard Biesheuvel wrote:
> > >
> > > > On Mon, 10 Jun 2019 at 10:42, Lee Jones <lee.jones@linaro.org> wrote:
> > > > >
> > > > > This patch provides basic support for booting with ACPI instead
> > > > > of the currently supported Device Tree.  When doing so there are a
> > > > > couple of differences which we need to taken into consideration.
> > > > >
> > > > > Firstly, the SDM850 ACPI tables omit information pertaining to the
> > > > > 4 reserved GPIOs on the platform.  If Linux attempts to touch/
> > > > > initialise any of these lines, the firmware will restart the
> > > > > platform.
> > > > >
> > > > > Secondly, when booting with ACPI, it is expected that the firmware
> > > > > will set-up things like; Regulators, Clocks, Pin Functions, etc in
> > > > > their ideal configuration.  Thus, the possible Pin Functions
> > > > > available to this platform are not advertised when providing the
> > > > > higher GPIOD/Pinctrl APIs with pin information.
> > > > >
> > > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > >
> > > > For the ACPI probing boilerplate:
> > > > Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > > >
> > > > *However*, I really don't like hardcoding reserved GPIOs like this.
> > > > What guarantee do we have that each and every ACPI system
> > > > incorporating the QCOM0217 device has the exact same list of reserved
> > > > GPIOs?
> > >
> > > This is SDM845 specific, so the chances are reduced.
> >
> > You don't know that.
>
> All the evidence I have to hand tells me that this is the case.  Even
> on very closely related variants Qualcomm uses different H/W blocks
> for GPIO.
>
> > > However, if another SDM845 variant does crop up, also lacking the
> > > "gpios" property, we will have to find another differentiating factor
> > > between them and conduct some matching.  What else can you do with
> > > platforms supporting non-complete/non-forthcoming ACPI tables?
> > >
> >
> > Either we don't touch any pins at all if they are not referenced
> > explicitly anywhere
>
> I guess this would require an API change, which is out of scope of
> this patch-set.  Happy to change this implementation later if the
> subsystem allows for it though.
>
> > or we parse the PEP tables, which seem to cover
> > some of this information (if Bjorn's analysis is correct)
>
> Maybe someone can conduct some further work on this when we start to
> enable or write a driver for the PEP (Windows-compatible System Power
> Management Controller).  The tables for the PEP look pretty complex,
> so this task would be extremely difficult if not impossible without
> Qualcomm's help.  I wouldn't even know how to extrapolate this
> information from the tables.
>
> > (if Bjorn's analysis is correct)
>
> Bjorn is about to provide his Reviewed-by for this implementation.
>

If Bjorn can live with it, then so can I.
