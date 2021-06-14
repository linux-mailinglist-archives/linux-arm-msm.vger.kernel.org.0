Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8833A6B57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 18:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbhFNQOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 12:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234589AbhFNQOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 12:14:10 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE282C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 09:12:07 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso11296412oto.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0oFGZgzuK+wfWh3twXvjozyyp5mnxr4qBNBCoc1c4Vc=;
        b=KUPJUELSmJyV98B+X/+cIUvTZ9qK865mR0u/qVLuiNlLxllgdbUkS1OgK1WWN8/0kn
         x9IeyyK96IFCf+pp2n7uJTJbA03oqfpIATr4nejMBzhmXeE0pOm4+LiivxUGbVtaUQF3
         X5eVUd+D4KsSpnrGANeTmogrhhw1E58moJ4SOLyRwJXDzjRKe6VXSz7u3WgbvnNc7E+G
         1RPQaSat1SPzCxVRywkPZVvHD3ePFkSgeCwM1N996tTgRpSK1Hd0VIC8GnBarTFe0AHE
         WhnkRJFalxBEMZjd2v/xgboeVWnpVkHmWlgTfHqq/MyavGE9TF/D+TpQf2kRHjdxdnnx
         DzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0oFGZgzuK+wfWh3twXvjozyyp5mnxr4qBNBCoc1c4Vc=;
        b=ix9ZMzaz9yrBZtj1TKhuNKBt4eyfSN8FpUQeR0H6bVQ6bD6s/55lC2D9h2poF2Xb9F
         0nsXsScn3FbCx2gCfTRbR7zUMan1/LuYdthf9NKBHWclJkpbBwZT6mu50JaVOHDcww4s
         tP1Ibk03k32PTazwyV83xeeVsQ2PH10i3Hn5NrTNfGttMSJ6wF70Tln5x9Rqdi/07K8x
         MCLK/PqUWmSLlJz3/UFIVf3w6XUZXSAcLHaB6SOv2O5iqOMVsOypv136y31SHFUE5SJ1
         T/ejn8sV1vWX3il/PvalyYlfBqZQXeHDZ+s5w0v49s5h/hoK3swQFSZCmtkYJXcF3RrP
         N2Yg==
X-Gm-Message-State: AOAM530fmb4OE2CHAMgCWpfAPOWbjnzzhdeyddDuJ3sV/1ZWlRQOdtoP
        wfvn3XlIG4WEdxuRCgC0Ec1m1A==
X-Google-Smtp-Source: ABdhPJwHmnrT1SOKWGo7+pc9rThKvmW9tBakGXsNBZEVxmFc0VzMxdN22HDAGcmt5a/aMO3+wDXMFw==
X-Received: by 2002:a9d:3e15:: with SMTP id a21mr14289365otd.366.1623687127068;
        Mon, 14 Jun 2021 09:12:07 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k84sm3033230oia.8.2021.06.14.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 09:12:06 -0700 (PDT)
Date:   Mon, 14 Jun 2021 11:12:04 -0500
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
Subject: Re: [PATCH 5/8] pinctrl: qcom/pinctrl-spmi-gpio: Add compatibles for
 pmic-gpios on SA8155p-adp
Message-ID: <YMd/1C3oJ41A8g4p@yoga>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-6-bhupesh.sharma@linaro.org>
 <YMLR11+6A/6klgqJ@builder.lan>
 <CAH=2Ntwkk4Hw1VQcXu9y08jPHWf99EFmj=7GG0V4uuwbNK7c0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH=2Ntwkk4Hw1VQcXu9y08jPHWf99EFmj=7GG0V4uuwbNK7c0A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Jun 03:30 CDT 2021, Bhupesh Sharma wrote:

> Hi Bjorn,
> 
> On Fri, 11 Jun 2021 at 08:30, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
> >
> > > SA8155p-adp PMICs (PMM8155AU_1 and PMM8155AU_2) expose
> > > the following PMIC GPIO blocks:
> > >
> > > - PMM8155AU_1: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7 and gpio8)
> > > - PMM8155AU_2: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7)
> > >
> > > Add support for the same in the pinctrl driver.
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
> > >  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > > index 00870da0c94e..890c44b6e198 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > > @@ -1127,6 +1127,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
> > >       { .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
> > >       /* pm8150l has 12 GPIOs with holes on 7 */
> > >       { .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
> > > +     /* pmm8155au-1 has 10 GPIOs with holes on 2, 5, 7 and 8 */
> > > +     { .compatible = "qcom,pmm8155au-1-gpio", .data = (void *) 10 },
> >
> > As noted in the binding, I think this should be "qcom,pmm8155au-gpio"
> > and please skip the comment about the holes.
> 
> Similar to what I noted in the binding patch review thread, the pmic
> gpio holes seem different as per the downstream dtsi.
> 
> So, please let me know and if required, I can make the suggested change in v2.
> 

As noted in the binding, this really seems like software configuration.
So we should deal with this in DT (e.g. by not referencing the gpios
that Linux shouldn't touch), rather than the driver.

Regards,
Bjorn

> Thanks,
> Bhupesh
> 
> > > +     /* pmm8155au-2 has 10 GPIOs with holes on 2, 5 and 7 */
> > > +     { .compatible = "qcom,pmm8155au-2-gpio", .data = (void *) 10 },
> > >       { .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
> > >       { .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
> > >       { .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> > > --
> > > 2.31.1
> > >
