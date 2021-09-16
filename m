Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53EDC40DD67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 16:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238922AbhIPO7L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 10:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236506AbhIPO7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 10:59:10 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0BBC061766
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 07:57:50 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id n2-20020a9d6f02000000b0054455dae485so3411939otq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2ojGxC9vujlZc6BKBj4erHX2ecNDJAjcVaF4hMOlH4o=;
        b=mIxrq7XkbBn6Zxtgzhd+JfrtYQifKCFKvMjoInuUAeT+oearKX4kwCosgE4+vxlWpX
         HazLhxZUv1kcyk8S2Y/eJaxxvCvjQHZ1Lf1ZeOg6SNn9kGrvYckflN+gpKbgwuctJPQz
         +zuBzTDsf08/rLD1cNd4GBx5bZSI8v4xCbioFbzh4T6nZO0znfa8oTMlKfqlJfoM7pd9
         1MHmteJmnPla195abUIc7dPgv118di4y6QaGXvva/zDTZUifBN2bRkBA4FRLmla/2xP4
         /k6IyqBFZmGTGTRjCAymnuGOd4rNwGvBshkV1ltWMk7s+iMfFitYqpvScHokaubHIoXi
         ARsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2ojGxC9vujlZc6BKBj4erHX2ecNDJAjcVaF4hMOlH4o=;
        b=5hbSI7NaRkge7hNeP8DxTpPld2iCrAzIKLNlgLaiMly25jfIbdId6oqE8LdZrPZUCu
         mNLe9CmN9lAQHiutBB3snDCmxvdUi1RTWWGIrnZ342tLG0VaoDFLHs5pEiPAhL7pF6aB
         9iRVg2oEo3RCQZbxORKCcfG8ZN3lNLrbuy/uUaEx02GYpkrEP9JrrDczr2Cry4FMuWca
         FAZp3FU02IUib+J6/FbijiFXMr+hnJ8AeGzd3Z81PwSo2QOjALB2xv8lPxqA1HVG+z35
         OJqXhNt0IqaK1H/hMDR/OpWW3aa68sS5MJnsC0xMUWhVQKFlh0gVb5cZ3xWSZth8Jqsq
         kEng==
X-Gm-Message-State: AOAM530lOlSbNrTY7IwJymqRHu7TotxtB+4rL3GY683NHsjjz574wVJC
        4ka3dt7AnRxUEbr5ZCePzl2deA==
X-Google-Smtp-Source: ABdhPJxvx5aZVF3jwkCQ9pRxe/zGSTNOvZZirDWCK8+/Ou26JoxFK38MBnpygOQrI2sTDdpH41xq7A==
X-Received: by 2002:a9d:6046:: with SMTP id v6mr5168492otj.234.1631804269687;
        Thu, 16 Sep 2021 07:57:49 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l21sm761050oop.22.2021.09.16.07.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 07:57:49 -0700 (PDT)
Date:   Thu, 16 Sep 2021 07:58:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-yoga: Enable IPA
Message-ID: <YUNbntpsxISYxOro@ripper>
References: <20210615232816.835325-1-bjorn.andersson@linaro.org>
 <CAMi1Hd0hZV7antTa7ShKvfS5CRxRei4TNycM9EJ9NR5qEBJV7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMi1Hd0hZV7antTa7ShKvfS5CRxRei4TNycM9EJ9NR5qEBJV7g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Sep 03:52 PDT 2021, Amit Pundir wrote:

> Hi Bjorn,
> 
> On Wed, 16 Jun 2021 at 04:58, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > Shuffle memory regions to make firmware loading succeed and then enable
> > the ipa device.
> 
> Just a heads-up, this reserved memory region shuffling in sdm845.dtsi
> broke PocoF1 and may be other devices too(?) which do not override
> these regions.
> 

Thanks for the report!

> IIRC you once had a patch to move the reserved memory regions to board
> specific dts files, is it still on the cards so that we don't run into
> breakages like this?
> 

As you might remember the feedback I got was to not move the regions to
the individual devices and it was better to just deal with the problem
this way...

But apparently I was too optimistic and should have played the usual
game of deleting the inherited nodes and made the changes in the yoga
dts...

> Meanwhile I'll go and add these regions in sdm845-xiaomi-beryllium.dts.
> 

Let's prepare a fix that moves this change into the yoga.dts and get
that landed asap.

Regards,
Bjorn

> Regards,
> Amit Pundir
> 
> 
> 
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 21 +++++++------------
> >  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  5 +++++
> >  2 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 1796ae8372be..49624eadce84 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -128,28 +128,23 @@ camera_mem: memory@8bf00000 {
> >                         no-map;
> >                 };
> >
> > -               ipa_fw_mem: memory@8c400000 {
> > -                       reg = <0 0x8c400000 0 0x10000>;
> > +               wlan_msa_mem: memory@8c400000 {
> > +                       reg = <0 0x8c400000 0 0x100000>;
> >                         no-map;
> >                 };
> >
> > -               ipa_gsi_mem: memory@8c410000 {
> > -                       reg = <0 0x8c410000 0 0x5000>;
> > +               gpu_mem: memory@8c515000 {
> > +                       reg = <0 0x8c515000 0 0x2000>;
> >                         no-map;
> >                 };
> >
> > -               gpu_mem: memory@8c415000 {
> > -                       reg = <0 0x8c415000 0 0x2000>;
> > +               ipa_fw_mem: memory@8c517000 {
> > +                       reg = <0 0x8c517000 0 0x5a000>;
> >                         no-map;
> >                 };
> >
> > -               adsp_mem: memory@8c500000 {
> > -                       reg = <0 0x8c500000 0 0x1a00000>;
> > -                       no-map;
> > -               };
> > -
> > -               wlan_msa_mem: memory@8df00000 {
> > -                       reg = <0 0x8df00000 0 0x100000>;
> > +               adsp_mem: memory@8c600000 {
> > +                       reg = <0 0x8c600000 0 0x1a00000>;
> >                         no-map;
> >                 };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > index c2a709a384e9..3eaa42dc3794 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > @@ -415,6 +415,11 @@ ecsh: hid@5c {
> >         };
> >  };
> >
> > +&ipa {
> > +       status = "okay";
> > +       memory-region = <&ipa_fw_mem>;
> > +};
> > +
> >  &mdss {
> >         status = "okay";
> >  };
> > --
> > 2.31.0
> >
