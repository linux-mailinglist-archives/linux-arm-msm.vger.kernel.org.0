Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145F81F14A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 10:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgFHIoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 04:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgFHIoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 04:44:23 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC9AC08C5C4
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 01:44:23 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id d21so8933749vsh.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+y6UmkPDm38dX4LreSQSIUXT7cgOpDN7zQdAhe+au5E=;
        b=c9rNztKsEI/2tpG0JFZGVY39ha5rGAK89j+FIo5pfnGYY5PqZnZUtjQFIiqNMNZxxi
         qu+XCCgxFInZ+Iz/frGl71wETlbIGnxZ3OuRKvFbeogeL2tZGEWnrvchvWl2EHR+mG/H
         kQ5EbcEkpI4be82AFQK9jPCCpgR0ma6a2UeiaCE0Dt0u8YHBLcz6ETYVPXWljXfW7ivV
         5oIOq6+ZvBx0ogAnbvrsS0FUZRU6JZ3Cvk++OOTPyjN2d4YdnUfa4woPiMdIHckW/HOL
         Eq28N8FFlNAUKdALUuVt3BQM3kXvTabY5JfU0d1BO7Edf4UA95w10jQ8T9lOM4+oX96c
         VyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+y6UmkPDm38dX4LreSQSIUXT7cgOpDN7zQdAhe+au5E=;
        b=gLPb81t/+1NNZJTGBnefF3j+EuaSanEyaxfg/OEtQAiSx65AODoQdMeGpblV8HDVP5
         RAm0LOZK6S4Mhm5HS478dQSWyk5mKHzIZrurtVjvrjFewKifSnx3JeiYzE9P/SmgVy/Q
         3+l5WuyqA9IZs0F5OUuffmSvEf4DUZ7gGoRqcv7mcB57m7wKCp/GRcRkcWQftNkFT7PG
         i8jQgNYAUKi1KcR5a3mR8e3jSlIQgQeVJuzOcdnltL51MioJE4Qn06kp1gQ1Z9ZJ7lsc
         O1AI6Q8HHB80ta2/iTvse6I1DJV3b/fztwpRg535j+9TNWaNQlL79YklZz5w67UVxd/I
         17cw==
X-Gm-Message-State: AOAM531Q35ElVFmDUp9g7cAmpEPZNM5Tb+gK4LivMbycxVCXydN1c3OS
        xdVF/Fr84BUi0Bu/lSJ/3jqnDR99EVsbVHIJrAJ3KveF
X-Google-Smtp-Source: ABdhPJw0dT5V/+LRFg3GwL6Ho0ZAHVlUMqWifbEY5wAD4PYgDNmpAumol27afS542BVvsGnikLIfmNAkyjPEdYqVzrQ=
X-Received: by 2002:a67:e19d:: with SMTP id e29mr2832693vsl.9.1591605862564;
 Mon, 08 Jun 2020 01:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-5-dmitry.baryshkov@linaro.org> <20200604104701.GG3521@vkoul-mobl>
 <8df3fe11-867f-b6a3-fe29-5a8ab988e006@linaro.org> <20200605043955.GJ3521@vkoul-mobl>
In-Reply-To: <20200605043955.GJ3521@vkoul-mobl>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 8 Jun 2020 14:14:11 +0530
Message-ID: <CAHLCerNqnYWFXQu4QYrQT78UPNhgbueRWdXjJqEJ9eEOjFNhEQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: pm8150x: add thermal alarms and
 thermal zones
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, patches@linaro.org,
        linaro-kernel@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 5, 2020 at 10:10 AM Vinod Koul <vkoul@kernel.org> wrote:
>
>
> Sorry missed ccing Amit, done now.
>
> On 04-06-20, 18:03, Dmitry Baryshkov wrote:
> > On 04/06/2020 13:47, Vinod Koul wrote:
> > > On 04-06-20, 03:43, Dmitry Baryshkov wrote:
>
> > > >                   pm8150_adc: adc@3100 {
> > > >                           compatible = "qcom,spmi-adc5";
> > > >                           reg = <0x3100>;
> > > > @@ -38,8 +47,6 @@ pm8150_adc: adc@3100 {
> > > >                           #io-channel-cells = <1>;
> > > >                           interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> > > > -                 status = "disabled";
> > > > -
> > >
> > > This should not be removed, rather than this please add enabled in you
> > > board dts file

Is the default disabled for a reason?

I'd expect the default to be enabled and then board-specific dts to
disable a specific adc if needed.

> ...
>
> > > > +&thermal_zones {
> > > > + pm8150_temp {
> > > > +         polling-delay-passive = <0>;
> > > > +         polling-delay = <0>;
> > > > +
> > > > +         thermal-sensors = <&pm8150_temp>;
> > > > +
> > > > +         trips {
> > > > +                 trip0 {
> > > > +                         temperature = <95000>;
> > > > +                         hysteresis = <0>;
> > > > +                         type = "passive";
> > > > +                 };
> > > > +
> > > > +                 trip1 {
> > > > +                         temperature = <115000>;
> > > > +                         hysteresis = <0>;
> > > > +                         type = "passive";

Since there is not cooling map associated with these two trips i.e. no
mitigation action, this trip is informational. So make it of type
"hot".

Is there really a need for two passive trip points? Just one at 115
should be enough?

> > > > +                 };
> > > > +
> > > > +                 trip2 {
> > > > +                         temperature = <145000>;

Are you sure about this? That is a very toasty temperature. :-)

> > > > +                         hysteresis = <0>;
> > > > +                         type = "passive";

The last trip should typically be of type "critical". That is the
temperature at which the system will initiate a shutdown.

> > > > +                 };
> > > > +         };
> > > > +
> > > > + };
> > >
> > > Not sure about this, Amit..? Should this also not be in board dts?
> > >
> > > Similar comments on similar ones for rest of the patch as well..
> >
> > I'm not so sure. This part of the configuration seems generic to me. Unlike
> > adc-tm config, which definitely goes to the board file.
>
> I think the temperature values may be board specific, Amit can confirm
> that. If that is the case then this belongs to board dts, otherwise here :)

While the temp values can be board-specific e.g. if the same SoC is
used in a mobile phone and a laptop, the thresholds rarely change, in
my experience.

I think they can stay in the pmic dtsi file and any specific board can
override if necessary.

> > I can split this into a separate pm8150-temp.dtsi file. Does that sound
> > better?
>
> That might make it worse, we don't do splitting.

Right, let's not split it.

>
> --
> ~Vinod
