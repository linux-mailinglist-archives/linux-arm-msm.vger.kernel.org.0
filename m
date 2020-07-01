Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417D72109CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 12:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730160AbgGAK4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 06:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729892AbgGAK4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 06:56:15 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124FCC03E979
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 03:56:16 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 12so13716507oir.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9R1819T+AMdAOtCQQNpTxAKlBNbGEf7KSfYXQ+RjODU=;
        b=aYHAkQYkS6JUqmaJPF5BVtaNalhoghvq/swOD0R3FZXxx7mUsV4ECOXfnvppWngu+R
         9Z9Dh5k1WLPz7Vyk8L3ruAXXX1rV75XEYzFQHi0sHv353WD+DOUSpmHnPS0pc/gsVvEd
         KYRrv7z57XqyisydWQUOZ5+OhtMmpXmrRbxqYuSrGyAWygKr5tFar35r1uEzWGQD9+KB
         kSViPFnIiFmZ1beM9Cd69yd8pkLuOU4fSnFXKJwtHT45bP/6WVgEUxfOCy4Oopso12yO
         6Ie1EjRAbSYb2AUj59lbogW+A4ezR3M9NEhRW7yiOHKcQG8o9RbCRNdHx9pXxmBJcg3/
         3U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9R1819T+AMdAOtCQQNpTxAKlBNbGEf7KSfYXQ+RjODU=;
        b=WDCLeijmhxZaqohy2d6KRsQfPcSL6YX/OiwjxP5Gs6O7ilrX/PyKZ1Ab5OJlYZGD/m
         PAhDUKJqSyYeJ+zw3WBYVEez9Gs2Xqu096Ng8tL8vjkelEXQHESkeWw1VayLuVvKuyGh
         I3vB06A+uC/0ofk+bOfAhFxpoDm8dsg0mT+GVg6CFPDeYYLIes25gNfJKFZUBAFa/PwF
         VxAsY7CTfX28wWehnTpWZEl9O/GwjojeCDbiQxeTr3CXJ3bqQgrjwBjQbNyT03nqrJZn
         1IneedGIVbnIKGFTJEGuJyzcnkkjy5AbXzv77cbD0q4bjQp3siLyEUbSUpjBltHQAllU
         VdaA==
X-Gm-Message-State: AOAM533vIQel7pTNCwdvMXsljlx7o2Evza0PKVDMuLp9GvNVk5QYxBKz
        WERsmntsAFgssIN2N+NlIQhXJqHtftohzyIJ69b+5Q==
X-Google-Smtp-Source: ABdhPJwiMZdnEdNGjW368fqv2h6n7DhHfnsnINvnj5udm0TiFLaMmVcbKkxd2ebZrlhbN1BozXl0HotXeXWCkUe0k78=
X-Received: by 2002:a54:4399:: with SMTP id u25mr20479018oiv.177.1593600975413;
 Wed, 01 Jul 2020 03:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200621193549.2070434-1-dmitry.baryshkov@linaro.org>
 <20200621193549.2070434-6-dmitry.baryshkov@linaro.org> <CAHLCerOqWWr3i32tRgGfep12YfDufw-WU80VWUsUNpDDZ13D-w@mail.gmail.com>
 <CAA8EJppAQgmS7VVCjVe8QST2RQU46mXO2jtUPFY30mH9sVu_rQ@mail.gmail.com> <CAHLCerM8KwUhpossD=vyhU4q22FnrZse_zhiS0ZobZM0J9X8PA@mail.gmail.com>
In-Reply-To: <CAHLCerM8KwUhpossD=vyhU4q22FnrZse_zhiS0ZobZM0J9X8PA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 1 Jul 2020 13:56:03 +0300
Message-ID: <CAA8EJprc4hET7MoTSj80==OdE-o-iho6vcrGgSPAQFaOLfFi2w@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: sm8250-dts: add thermal zones using
 pmic's adc-tm5
To:     Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Jul 2020 at 09:06, Amit Kucheria <amit.kucheria@verdurent.com> wrote:
>
> On Tue, Jun 30, 2020 at 5:40 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Hi,
> >
> > On Tue, 30 Jun 2020 at 08:06, Amit Kucheria <amit.kucheria@verdurent.com> wrote:
> > > On Mon, Jun 22, 2020 at 1:06 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > Port thermal zones definitions from msm-4.19 tree. Enable and add
> > > > channel configuration to PMIC's ADC-TM definitions. Declare thermal
> > > > zones and respective trip points.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 237 ++++++++++++++++++++++++
> > > >  1 file changed, 237 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > >
> > > IMO, this should be separated in the pmic dts file like we do for
> > > other QC platforms since the PMICs tend to be used in multiple
> > > platforms.
> >
> > Unlike other PMIC/tsens thermal zones, these definitions are quite
> > specific to the board from my point of view.
>
> How so? Can you describe what is different about this PMIC?

It is not about this PMIC, but rather about particular thermistors
being placed up in different places on the board itself.

> > > > index aa37eb112d85..78f0cf582a9a 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > > > @@ -24,6 +24,104 @@ chosen {
> > > >                 stdout-path = "serial0:115200n8";
> > > >         };
> > > >
> > > > +       thermal-zones {
> > > > +               xo-therm {
> > > > +                       polling-delay-passive = <0>;
> > > > +                       polling-delay = <0>;
> > > > +                       thermal-sensors = <&pm8150_adc_tm 0>;
> > > > +                       trips {
> > > > +                               active-config0 {
> > > > +                                       temperature = <125000>;
> > > > +                                       hysteresis = <1000>;
> > > > +                                       type = "passive";
> > > > +                               };
> > > > +                       };
> > > > +               };
> > > > +



-- 
With best wishes
Dmitry
