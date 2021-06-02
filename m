Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11586398F49
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 17:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbhFBPyt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 11:54:49 -0400
Received: from mail-qv1-f54.google.com ([209.85.219.54]:46921 "EHLO
        mail-qv1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbhFBPys (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 11:54:48 -0400
Received: by mail-qv1-f54.google.com with SMTP id w9so1516396qvi.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KvvPoZSmeOhoOWxm8/PZCNGxhArABKqYDVldZtK3gXs=;
        b=fqSfFAyMMR4rpm+DVHsJ6NRNdU4CgJlg205vDbxpccSzn6kavaetdI45xsMorfqmJ8
         r2L0A5062mV72VWsKqBZS2186v/cHtgrYF0G0KOE/+u9wq5mD2zeCDqMbhmScrfGuzs8
         Px+PUn7yO0dcYi7x1qN0P/mEpVeKLVGuxFM0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KvvPoZSmeOhoOWxm8/PZCNGxhArABKqYDVldZtK3gXs=;
        b=GS5TF6Lp6KzFQzYf/bnxM7Zejzpcamw1GckP652ij/8gpE6G2qMeWqbjfTJEUTMnD6
         Vd9L9gepn/a3S6bHp14YJWegXl8rQ3lsTb2aGGmbuui71qbvtdyGEMaMnXpSYcLlrHFz
         NkGA+A3Iam4zzGpcsGloDLYKibG6k3aL+ceiTrPyw9W6LqUzd6saabK2FTcKKza9Nyv2
         rzdZvxlXjm00S7dNjRSiBkeeP6Wufgty0Fp0nOBbee9AAl9mcL8dAFzcyqqR66G4535+
         Jwpe5ZonWhHGcr+e7CKz8EayNaz8hbHoUgUlm4mY0+TuhqBCiqDICTM9B/X7REJA9Bg9
         gbZA==
X-Gm-Message-State: AOAM532MTZmADFZA4Y3nt3nKq0rOBFc5LcTZJ6km0e19bUXFUd35mKvO
        DtaocL7WvKbn+rMMs+KAnJOf/Ur2qsjcwA==
X-Google-Smtp-Source: ABdhPJxLhf2rf1cO0z7cJjN5GAKlkgC14sxC9B1//FtK29JRDml1Y5BtjuvpmcoHpJKOAjVrakUv+Q==
X-Received: by 2002:ad4:4b01:: with SMTP id r1mr18147456qvw.53.1622649110844;
        Wed, 02 Jun 2021 08:51:50 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id e19sm57564qtr.45.2021.06.02.08.51.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 08:51:50 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id i4so4527350ybe.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 08:51:49 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr46474150ybp.476.1622649109527;
 Wed, 02 Jun 2021 08:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210519054030.3217704-1-swboyd@chromium.org> <CAD=FV=UarqLwPu6mJ7QU8qXWoaizqMHHbjqF4q=KPYvDZrhT-A@mail.gmail.com>
In-Reply-To: <CAD=FV=UarqLwPu6mJ7QU8qXWoaizqMHHbjqF4q=KPYvDZrhT-A@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Jun 2021 08:51:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XqAX7o+caB-AyNkmBQNeq7iaoUgmwKknq1kXhsJCMw=w@mail.gmail.com>
Message-ID: <CAD=FV=XqAX7o+caB-AyNkmBQNeq7iaoUgmwKknq1kXhsJCMw=w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Update flash freq to
 match reality
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

On Wed, May 19, 2021 at 9:05 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, May 18, 2021 at 10:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > This spi flash part is actually being clocked at 37.5MHz, not 25MHz,
> > because of the way the clk driver is rounding up the rate that is
> > requested to the nearest supported frequency. Let's update the frequency
> > here, and remove the TODO because this is the fastest frequency we're
> > going to be able to use here.
> >
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index 24d293ef56d7..af3c0e1e2223 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -335,8 +335,7 @@ flash@0 {
> >                 compatible = "jedec,spi-nor";
> >                 reg = <0>;
> >
> > -               /* TODO: Increase frequency after testing */
> > -               spi-max-frequency = <25000000>;
> > +               spi-max-frequency = <37500000>;
> >                 spi-tx-bus-width = <2>;
> >                 spi-rx-bus-width = <2>;
> >         };
>
> Thanks. Looks right to me. I confirmed that the clock is 150 MHz in my
> "clk_summary" which is 4x 37.5.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

If you agree, I think this patch is ready to land.

-Doug
