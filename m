Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A87720F429
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 14:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731654AbgF3MK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 08:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733047AbgF3MK0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 08:10:26 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2929C03E979
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 05:10:25 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id t18so5390796otq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NAGbdMKehJWxVlFr926dVUaKEFdL3dy5MG19MRyLbvI=;
        b=o31V1ZHOjDOtIAN1jxax4laiARUXPgXnugPc1/4XM8WMjPSFHvToHuXOCwr8b6553o
         DD3YKEwTm4+CfJahjqIORUg/UTHjboKMM5TuFnY2zKY2I0dmFZI87Ij9hA4NRF4+KFG4
         yWkH5zKmFhH4uQhUHJarZjzMSM2qE589nU27UPRDXFhnOkO7Y2YZ51mOLE8dy8Cb46rR
         R8IcfZCVXQdvau7deKcyFFPXLBa1L5e/C97DU15/1cSl5GvQXExB+gKMiKt1Wt1Yx18c
         OfjxNkK53zUySfTva7QQ/7kjE8TYr12Zol3Ot8Fkb/jmXreYFq0y5WdK2C/E1ThLoXHd
         TS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NAGbdMKehJWxVlFr926dVUaKEFdL3dy5MG19MRyLbvI=;
        b=QXMFwbjARn5On982/PcOQcz0zLwePOQBYrx12Tvqmyd3C2AhqYOH7KsVcZN3V/cgxB
         vGALzXT7h/Ac3k4yFsJbiEGRfe+9jVhz/a17jFIOepHwYWggDqwrpciRKxKLdCsp4Sm2
         9svp1jrzsukx6q3hfcA7EfiskDVCqAXIU+prFoPvU0cvhJZ96n9FVSBYZjCAZ/+sng1K
         OFHfey142jKpQMifNr0RHjeU1kf56pdMLZlnt3mAhUUzziMOMUfk4JqQA4JO+2ItDW9l
         3OZOBCbmrekToRjsnRpOOyg1hlA/ia03cbSAV/eYwrih+5yMphuGfj+TW75OWtAhkKeV
         nvMw==
X-Gm-Message-State: AOAM532TLfq/zx5IIhbIEzfoED/W2Oo+j2eJCR1XrYEMZ1D3cUCRzn1D
        yQPyYuLABs1R/eyKXvK+ISTCfgnoL+aQfM8vnPimzwmJBsg=
X-Google-Smtp-Source: ABdhPJw2q4etsQZ39OpngsI1fW2rJDW4wZr4IX5R00YqLdMFCViWYY17CGQyW/rchwxHK0PaipZZaeBJGlqE8HeogaI=
X-Received: by 2002:a9d:39f5:: with SMTP id y108mr17820882otb.262.1593519025244;
 Tue, 30 Jun 2020 05:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200621193549.2070434-1-dmitry.baryshkov@linaro.org>
 <20200621193549.2070434-6-dmitry.baryshkov@linaro.org> <CAHLCerOqWWr3i32tRgGfep12YfDufw-WU80VWUsUNpDDZ13D-w@mail.gmail.com>
In-Reply-To: <CAHLCerOqWWr3i32tRgGfep12YfDufw-WU80VWUsUNpDDZ13D-w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 30 Jun 2020 15:10:13 +0300
Message-ID: <CAA8EJppAQgmS7VVCjVe8QST2RQU46mXO2jtUPFY30mH9sVu_rQ@mail.gmail.com>
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

Hi,

On Tue, 30 Jun 2020 at 08:06, Amit Kucheria <amit.kucheria@verdurent.com> wrote:
> On Mon, Jun 22, 2020 at 1:06 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Port thermal zones definitions from msm-4.19 tree. Enable and add
> > channel configuration to PMIC's ADC-TM definitions. Declare thermal
> > zones and respective trip points.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 237 ++++++++++++++++++++++++
> >  1 file changed, 237 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
>
> IMO, this should be separated in the pmic dts file like we do for
> other QC platforms since the PMICs tend to be used in multiple
> platforms.

Unlike other PMIC/tsens thermal zones, these definitions are quite
specific to the board from my point of view.

> > index aa37eb112d85..78f0cf582a9a 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > @@ -24,6 +24,104 @@ chosen {
> >                 stdout-path = "serial0:115200n8";
> >         };
> >
> > +       thermal-zones {
> > +               xo-therm {
> > +                       polling-delay-passive = <0>;
> > +                       polling-delay = <0>;
> > +                       thermal-sensors = <&pm8150_adc_tm 0>;
> > +                       trips {
> > +                               active-config0 {
> > +                                       temperature = <125000>;
> > +                                       hysteresis = <1000>;
> > +                                       type = "passive";
> > +                               };
> > +                       };
> > +               };
> > +



-- 
With best wishes
Dmitry
