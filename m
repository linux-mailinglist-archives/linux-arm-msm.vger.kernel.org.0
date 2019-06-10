Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19663B1E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 11:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388959AbfFJJWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 05:22:49 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44452 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388373AbfFJJWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 05:22:49 -0400
Received: by mail-wr1-f67.google.com with SMTP id b17so8364015wrq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 02:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=G1lpUotvma47Z1RO2D5VX/I7uflkBXZ22xkg1HQ/USI=;
        b=hJCkx2KR+NIkDwRFeraGfF4DHt2DUmwtr60qd9nLSH36qGSOynSiXeBtl5ybF8L0dn
         pnA/bDiJGCLtMFrKG64+F4PxE/BCjEnmUfgybp5rvC84ASqfVLs+C7uKecLuJCDAOxWo
         nL4ORmsbFf6ofo5z0z78tNg1LeWUIxyO901/KwIoH+c/xzpLZJLgrkprAWxAZqJ+OEP1
         nFZLqfILmv5pT7tNKbySmIy22ONGFTE8fGEDz8KzFkJJaGzD9V9yDSEzeGC+4BWr4Z9e
         FdxvQDp8O5Loq/iEqqXceHHaLCdkegi8ZozuBckAqV6LiQPJDHVQJTe4H0zcalEQXVFh
         INAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=G1lpUotvma47Z1RO2D5VX/I7uflkBXZ22xkg1HQ/USI=;
        b=UUgq7NqunsDrGARfVlAnNNYpL1ukLni7vriLbRoqVSp8MJyVFSObtBOD7NzLualf/h
         xFWm8vHSVH4EYfcz2sElr9z/q9lk9B6t1VjdDpdJOuQSMqtZPseds/lEnejqQb9d4pZ8
         ObZ+vpYEhOYGooEAUYpqdZ8N7CHXnWgTYZGxxLyCZHfMo9Twz60tM/6cdDnyCOvXRyEp
         cJQhp/B1V9rcubfdVoVNr9hnOb2MbuIIAle1HkjJ5d565Kd7RaKMPhF/MNxB9euwOb85
         cJtzE/JrGOpteZ1Xk5Jbd4285ABpQjYaOETCVDf5fnK0hZW0Q6vFAjKeD1nrF3Vz/pZn
         IrHw==
X-Gm-Message-State: APjAAAV1qHtSEMkhlTibTQQLwfcnXw11v/8c+HOZZkFP6IF3j79kTxE+
        My7gpyVBJEugeS50fgUTYh9dCA==
X-Google-Smtp-Source: APXvYqwF7A2E5R4fmM/F0NbqYzotL3Yb9yzsKrwKjxbsYMU0XzfAxqQRhUHKAoBn6OW6wfm5SWZNSQ==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr44160150wre.205.1560158567552;
        Mon, 10 Jun 2019 02:22:47 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id l18sm7825015wrv.38.2019.06.10.02.22.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 02:22:46 -0700 (PDT)
Date:   Mon, 10 Jun 2019 10:22:45 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
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
Subject: Re: [PATCH v3 4/8] pinctrl: qcom: sdm845: Provide ACPI support
Message-ID: <20190610092245.GN4797@dell>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190610084213.1052-4-lee.jones@linaro.org>
 <CAKv+Gu_s7i8JC4cv-dJMvm1_0cGzzhzf+Dxu0rxcF7iugF=vHg@mail.gmail.com>
 <20190610085542.GL4797@dell>
 <CAKv+Gu8rhxciy1cOG3B3pda9+p4R_COGrrqa7S_Rj9y2HeBxYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKv+Gu8rhxciy1cOG3B3pda9+p4R_COGrrqa7S_Rj9y2HeBxYw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 Jun 2019, Ard Biesheuvel wrote:

> On Mon, 10 Jun 2019 at 10:55, Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Mon, 10 Jun 2019, Ard Biesheuvel wrote:
> >
> > > On Mon, 10 Jun 2019 at 10:42, Lee Jones <lee.jones@linaro.org> wrote:
> > > >
> > > > This patch provides basic support for booting with ACPI instead
> > > > of the currently supported Device Tree.  When doing so there are a
> > > > couple of differences which we need to taken into consideration.
> > > >
> > > > Firstly, the SDM850 ACPI tables omit information pertaining to the
> > > > 4 reserved GPIOs on the platform.  If Linux attempts to touch/
> > > > initialise any of these lines, the firmware will restart the
> > > > platform.
> > > >
> > > > Secondly, when booting with ACPI, it is expected that the firmware
> > > > will set-up things like; Regulators, Clocks, Pin Functions, etc in
> > > > their ideal configuration.  Thus, the possible Pin Functions
> > > > available to this platform are not advertised when providing the
> > > > higher GPIOD/Pinctrl APIs with pin information.
> > > >
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > >
> > > For the ACPI probing boilerplate:
> > > Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > >
> > > *However*, I really don't like hardcoding reserved GPIOs like this.
> > > What guarantee do we have that each and every ACPI system
> > > incorporating the QCOM0217 device has the exact same list of reserved
> > > GPIOs?
> >
> > This is SDM845 specific, so the chances are reduced.
> 
> You don't know that.

All the evidence I have to hand tells me that this is the case.  Even
on very closely related variants Qualcomm uses different H/W blocks
for GPIO.

> > However, if another SDM845 variant does crop up, also lacking the
> > "gpios" property, we will have to find another differentiating factor
> > between them and conduct some matching.  What else can you do with
> > platforms supporting non-complete/non-forthcoming ACPI tables?
> >
> 
> Either we don't touch any pins at all if they are not referenced
> explicitly anywhere

I guess this would require an API change, which is out of scope of
this patch-set.  Happy to change this implementation later if the
subsystem allows for it though.

> or we parse the PEP tables, which seem to cover
> some of this information (if Bjorn's analysis is correct)

Maybe someone can conduct some further work on this when we start to
enable or write a driver for the PEP (Windows-compatible System Power
Management Controller).  The tables for the PEP look pretty complex,
so this task would be extremely difficult if not impossible without
Qualcomm's help.  I wouldn't even know how to extrapolate this
information from the tables.

> (if Bjorn's analysis is correct)

Bjorn is about to provide his Reviewed-by for this implementation.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
