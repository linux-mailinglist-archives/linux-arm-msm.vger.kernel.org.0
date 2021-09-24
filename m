Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B492841690D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 02:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243695AbhIXAmo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 20:42:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:44488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243693AbhIXAmo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 20:42:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8760F61211;
        Fri, 24 Sep 2021 00:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632444071;
        bh=w0GBfErQ2aTLMNU7MDbkr19hVOoBE4VSCb6WE1FDNFs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FNR0L83CHbAFSSH1kLjeBq8tE0mhgTnfxWGcbaE1u1xATurc6v+3Ka7Dnbns+7QrD
         eVdagUtQm3ra73abNhMI7MhUW2+DfkRQAtAGtkt0+MFIO19kA0YlRJQErA65Y5ZFqD
         0iAlUqOm6ifcjxqaFB/vHYKnx5T+DWa1hqMN3j1NNa02HTkmEhPrw4aqdermaxxSva
         ocIFXwuN6E7d//AL6Q816GzhSFoMLrQS5q2q3uSkdfr9zVLSk5u504LWHccVBdSJnN
         Z4K6fioH8v8ODnHVNW9iBqztkbl8osT8qcStveHH6TaORSWGnWFyghXTv7ImaMvSs7
         5a31rKwNnY+3g==
Received: by mail-ed1-f43.google.com with SMTP id bx4so29673906edb.4;
        Thu, 23 Sep 2021 17:41:11 -0700 (PDT)
X-Gm-Message-State: AOAM533T7ZL3xSDj2FPpuaEsviXn4vBr1DbzqItB2c8ErXqbFBBPGooM
        GtMOtB1FVQQ6zjIkVR59BnJ14JrGcO8hVWRiLg==
X-Google-Smtp-Source: ABdhPJzhZwH0p9jFCOmLP9w41n0VLtNWGcOCwUOqyMCgwSje8U7p3EsOppth0SNuzc2Ga2Usb1Sp5HVORFqK/3M2n/s=
X-Received: by 2002:a17:906:fa8a:: with SMTP id lt10mr8147008ejb.320.1632444070144;
 Thu, 23 Sep 2021 17:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org>
 <1632399378-12229-2-git-send-email-rajpat@codeaurora.org> <1632436663.381520.3653405.nullmailer@robh.at.kernel.org>
 <CAD=FV=WOJiKUjGTYW0GmqOMqd_8+Y_tRmynuhZpaenwbTiG_9g@mail.gmail.com>
In-Reply-To: <CAD=FV=WOJiKUjGTYW0GmqOMqd_8+Y_tRmynuhZpaenwbTiG_9g@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 23 Sep 2021 19:40:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJhRG7XsvMVNptRXrVREh3Vew+bZ4v+EgBUn4qKeRMWuw@mail.gmail.com>
Message-ID: <CAL_JsqJhRG7XsvMVNptRXrVREh3Vew+bZ4v+EgBUn4qKeRMWuw@mail.gmail.com>
Subject: Re: [PATCH V10 1/8] dt-bindings: spi: Add sc7280 support
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rajesh Patil <rajpat@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, msavaliy@qti.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        satya priya <skakit@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 23, 2021 at 5:45 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Sep 23, 2021 at 3:37 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, 23 Sep 2021 17:46:11 +0530, Rajesh Patil wrote:
> > > Add compatible for sc7280 SoC.
> > >
> > > Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> > > Reviewed-by: Doug Anderson <dianders@chromium.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > > Change in V10:
> > >  - As per Stephen's comments,
> > >    sorted compatible names in alphabet order
> > >
> > > Changes in V9:
> > >  - No changes
> > >
> > > Changes in V8:
> > >  - As per Doug's comments, added "qcom,sc7280-qspi" compatible
> > >
> > >  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> >
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> >
> > Full log is available here: https://patchwork.ozlabs.org/patch/1531702
> >
> >
> > spi@88dc000: compatible:0: 'qcom,qspi-v1' is not one of ['qcom,sc7280-qspi', 'qcom,sdm845-qspi']
> >         arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dt.yaml
> >
> > spi@88dc000: compatible: ['qcom,qspi-v1'] is too short
> >         arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
> >         arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml
>
> Right. I mentioned this in earlier review feedback and Rajesh said
> he'd do a follow-up patch to add sc7180 to the list here and also add
> the proper compatible in the sc7180.dtsi file. That's not a new error
> and (IMO) shouldn't block this patch from moving forward, though it
> should be nearly trivial to do.

To repeat:

> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.

But I think it is useful information to make an informed decision
whether the schema is missing something or not, so I'm adding these to
my semi-automated emails.

Rob
