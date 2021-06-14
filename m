Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED123A6B51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 18:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbhFNQMh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 12:12:37 -0400
Received: from mail-oo1-f47.google.com ([209.85.161.47]:37412 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbhFNQMf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 12:12:35 -0400
Received: by mail-oo1-f47.google.com with SMTP id w13-20020a4ad02d0000b029024a98209c35so1942726oor.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 09:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WxkwNm6ZYNWIa0Lk9ntav/xspFP7K0YWVjmpKlkqGHM=;
        b=MWIRhnftb8ptws/gw00LvdIp2qhm1pyKeix9DxnZhFxe/rLAFyLuhnb38KFxVFY21U
         3qLBPzwgtR/Zmw7YzqRBONHujLPBW4+yapefexTWW0MVYi2rQOyDaqUjbQN7jKkb1zdR
         r23kkH0xw1v2vJk+VmHiPi9exwOB/LvoNC7Ak0VjKQFTo51DdmHO137vb6gHMMnQE0d0
         UHbtQT79HZg+zxRbowzUu+UtJliuRU1cDeKNYxQzP9J9ThSy/+fF5Hlvkp77e3BjnVgl
         mG8FAT0sZNXqf9eBKUJMORz6vQvy8P6biOO8WI2jV3NWqs5S76l3Ctu1k/w71JWtukmn
         jByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WxkwNm6ZYNWIa0Lk9ntav/xspFP7K0YWVjmpKlkqGHM=;
        b=qy/b0YjZFrUI4FWvPK4CBnddGteXM6Gcx/L6LQR/xOpJfNrI1W3q94XcFmH+JG41ZH
         cpDPY4vgzoFpYAYzsgYoKvsES+GinXX0Clv/qfAUqemMV01TAHDpgyRQYgpOCLLdVCAs
         +riZnx2B2PFKz3aPU/wKNIf783GCXGPxHwUrME05WDRL9G11flFIqZRPwF9FqWC8pbiV
         +QDfPtjZGpPKjG4RotqO6BruBBPsGogGeBTCqcOdmO06hcHphvkazGWh8Q/yhBKOePbH
         mTyzu+3s8HBlb+5QEoYs/LWoH8DfgQn0K96XiL9vvp6G/V6I1ez1BCUnb+n0eZAA94ny
         aZLg==
X-Gm-Message-State: AOAM533RnMlsnpSYn7AYJFM/YyRd0RxrJp/jdhxRS5TfgeA6znVj2HUH
        c0S9WprfIjyWjQezNrMtJleNoQ==
X-Google-Smtp-Source: ABdhPJyKjW8ZTmKRNbtA7KEhYwH5Q70ndZULWrCYGmo8BGF/gqf4pAvVS2xZT8D5iVtAzeG7g/aryQ==
X-Received: by 2002:a4a:9210:: with SMTP id f16mr13429698ooh.17.1623686960994;
        Mon, 14 Jun 2021 09:09:20 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g25sm3433972otn.81.2021.06.14.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 09:09:20 -0700 (PDT)
Date:   Mon, 14 Jun 2021 11:09:18 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 2/8] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible
 for SA8155p-adp
Message-ID: <YMd/LqGVbC+F/Qsm@yoga>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-3-bhupesh.sharma@linaro.org>
 <YMLPvrVVdx0MZJlO@builder.lan>
 <CAH=2Nty=VB2G6_eEAna8ZAysSCt9mMydR0cXLyTa=jrZ7nQO5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH=2Nty=VB2G6_eEAna8ZAysSCt9mMydR0cXLyTa=jrZ7nQO5A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Jun 03:13 CDT 2021, Bhupesh Sharma wrote:

> Hi Bjorn,
> 
> On Fri, 11 Jun 2021 at 08:21, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
> >
> > > Add pmic-gpio compatible strings for pmm8155au_1 and pmm8155au_2 pmics
> > > found on SA8155p-adp board.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Andy Gross <agross@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: linux-gpio@vger.kernel.org
> > > Cc: bhupesh.linux@gmail.com
> > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > > index f6a9760558a6..ee4721f1c477 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > > @@ -27,6 +27,8 @@ PMIC's from Qualcomm.
> > >                   "qcom,pm660l-gpio"
> > >                   "qcom,pm8150-gpio"
> > >                   "qcom,pm8150b-gpio"
> > > +                 "qcom,pmm8155au-1-gpio"
> > > +                 "qcom,pmm8155au-2-gpio"
> >
> > As with the regulator this seems to be a single component.
> >
> > >                   "qcom,pm8350-gpio"
> > >                   "qcom,pm8350b-gpio"
> > >                   "qcom,pm8350c-gpio"
> > > @@ -116,6 +118,9 @@ to specify in a pin configuration subnode:
> > >                                            and gpio8)
> > >                   gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
> > >                   gpio1-gpio12 for pm8150l (hole on gpio7)
> > > +                 gpio1-gpio10 for pmm8155au-1 (holes on gpio2, gpio5, gpio7
> > > +                                               and gpio8)
> > > +                 gpio1-gpio10 for pmm8155au-2 (holes on gpio2, gpio5, gpio7)
> >
> > In the schematics all 10 pins are wired on both of these PMICs, so I
> > don't think there are holes. Please omit the comment.
> 
> But if we look at the downstream dts (see [1]), we clearly have holes
> on gpio 2, 5 and 7 on PMM8155AU_2 whereas if we see [2], we can see
> PMM8155AU_1 has holes on gpio 2, 5, 7 and 8.
> 
> As I understand, the schematics mention some optional configurations
> as well which might not be available depending on the default board
> configuration.
> 
> [1]. https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/sa8155-pmic-overlay.dtsi?h=LV.AU.0.1.0.r1-15900-gen3meta.0#n92
> [2]. https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/sa8155-pmic-overlay.dtsi?h=LV.AU.0.1.0.r1-15900-gen3meta.0#n36
> 

Perhaps these "holes" means that they are reserved for use by one of the
other subsystems in the SoC - similar to how we have
gpio-reserved-ranges in the TLMM. Because according to the PMS8155AU
documentation and the schematics, there's no physical holes there.

As such, the binding and driver should not describe these "holes". If
they aren't used by Linux, then the DT won't reference them - and if
there's reasons for prohibiting Linux from touching the registers we
should use gpio-reserved-ranges, as this will depend on firmware
configuration.

Regards,
Bjorn

> Regards,
> Bhupesh
> 
> >
> > >                   gpio1-gpio10 for pm8350
> > >                   gpio1-gpio8 for pm8350b
> > >                   gpio1-gpio9 for pm8350c
> > > --
> > > 2.31.1
> > >
