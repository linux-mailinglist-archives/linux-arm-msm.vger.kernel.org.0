Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFE8424598
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 20:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239223AbhJFSHH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 14:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238900AbhJFSHG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 14:07:06 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37023C061746;
        Wed,  6 Oct 2021 11:05:14 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id r1so3500705qta.12;
        Wed, 06 Oct 2021 11:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jojjpk9wJgrRNFqM3kpkSIsN26phTwYM2XaFJDwEeNU=;
        b=QNSl2MIFk0hxm7tALj+yZuA/sv8wtgOSfeN6qDUfpgXYVae11kPirRd2lxtCmPRe1t
         ul6nV2qX8Y12Z85dP00EpPNP9pHR7cZgd153xpZYDfH02FmPpaoVqhbiKLYf+TsXFYZ+
         IMZweoUm0/lHtjbH3RsazesiCW+v3PS497b1vTAt9NemUuzNk5dLJ41z0gSI6f06F6PI
         8CWWUW7UMwAzIXvcgGWb9sH10/xQQSJW+YGAT/+NZUHWe6EVWU8GuPGsH6N6OI52poqA
         xdfAA4IcIvOjKTRVDYH9TpGLP2ikrHgLD9LjO64pqyR+aPvmaFyhWXb2qP9IaiglvFBS
         DyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jojjpk9wJgrRNFqM3kpkSIsN26phTwYM2XaFJDwEeNU=;
        b=Bw1i2+996gFauBUw8/38umUYJ0/AkI1ntQR/dTlawkAF6fJdM+pZb7M55Hd37hsULd
         6yB83BV6ATB8PFp5R4/9A78GhQzBtKS7+Sbvo+ZUMjHQDKvSEak+trX03PwcKA4TRkoE
         +0pETCfaVEg0SvmZr1QS8V8MHDmcEJWmbitUKyztXptnhWnR70Y0W5Fc+bZTeFA5bMmx
         dRYNzKjLOrjAk86ZIfEV4NXOW+ihzSdijPzN5VGgUUcoc6ES70kESIaZ4gVj8KC92IGU
         Or2xQlgmqMA23mEAYhEYmcI1g9OVPATqDSk3BWw+MFaZNwRjDYbSc0raLP6awLqkqgdi
         Clhg==
X-Gm-Message-State: AOAM533eFuXWqfnAvOD7AoIZLl94fJc7g7+fFBIBlYiBbNrTrVijOX/m
        N2JtzGRa8Zh6ZrQRRdCNvtokOx5qpC2rwTI4/ec2xCrI2TA=
X-Google-Smtp-Source: ABdhPJzAcPDoyZQQ31K6tXQW1Kqw4ESg6wV/AJjpNqMA6RlFttAatCif/T2CPFWIMFfeZ+0HwysgxNVh3e2wQTWBMoI=
X-Received: by 2002:a05:622a:180c:: with SMTP id t12mr169830qtc.304.1633543513315;
 Wed, 06 Oct 2021 11:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210902214708.1776690-1-robimarko@gmail.com> <YUf3aKn78+41Cb/G@builder.lan>
 <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com>
 <632a7d28c23a8497d35ea009bfe89883@codeaurora.org> <CAOX2RU5+jeXiqz8oss8Sd-BWa059uAv5xu=7nx_YF4RYpG2S6w@mail.gmail.com>
 <YUurqDL/S15RziCQ@builder.lan>
In-Reply-To: <YUurqDL/S15RziCQ@builder.lan>
From:   Robert Marko <robimarko@gmail.com>
Date:   Wed, 6 Oct 2021 20:05:02 +0200
Message-ID: <CAOX2RU7094=BODK+dBCjFmQmgh45RBUusSFJVLThK9DaU=esxA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Sept 2021 at 00:18, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 22 Sep 15:23 CDT 2021, Robert Marko wrote:
>
> > On Tue, 21 Sept 2021 at 08:24, Kathiravan T <kathirav@codeaurora.org> wrote:
> > >
> > > On 2021-09-20 14:55, Robert Marko wrote:
> > > > On Mon, 20 Sept 2021 at 04:52, Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > >>
> > > >> On Thu 02 Sep 16:47 CDT 2021, Robert Marko wrote:
> > > >>
> > > >> > IPQ8074 uses SMEM like other modern QCA SoC-s, so since its already
> > > >> > supported by the kernel add the required DT nodes.
> > > >> >
> > > >> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > > >>
> > > >> Thanks for your patch Robert.
> > > >>
> > > >> > ---
> > > >> >  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 28 +++++++++++++++++++++++++++
> > > >> >  1 file changed, 28 insertions(+)
> > > >> >
> > > >> > diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > > >> > index a620ac0d0b19..83e9243046aa 100644
> > > >> > --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > > >> > +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > > >> > @@ -82,6 +82,29 @@ scm {
> > > >> >               };
> > > >> >       };
> > > >> >
> > > >> > +     reserved-memory {
> > > >> > +             #address-cells = <2>;
> > > >> > +             #size-cells = <2>;
> > > >> > +             ranges;
> > > >> > +
> > > >> > +             smem_region: memory@4ab00000 {
> > > >> > +                     no-map;
> > > >> > +                     reg = <0x0 0x4ab00000 0x0 0x00100000>;
> > > >> > +             };
> > > >> > +     };
> > > >> > +
> > > >> > +     tcsr_mutex: hwlock {
> > > >> > +             compatible = "qcom,tcsr-mutex";
> > > >> > +             syscon = <&tcsr_mutex_regs 0 0x80>;
> > > >>
> > > >> Since it's not okay to have a lone "syscon" and I didn't think it was
> > > >> worth coming up with a binding for the TCSR mutex "syscon" I rewrote
> > > >> the
> > > >> binding a while back. As such qcom,tcsr-mutex should now live in /soc
> > > >> directly.
> > > >>
> > > >> So can you please respin accordingly?
> > > >
> > > > Sure, can you just confirm that the:
> > > > reg = <0x01905000 0x8000>;
> > > >
> > > > Is the whole TCSR range as I don't have docs?
> > >
> > > Robert,
> > >
> > > TCSR_MUTEX block starts from 0x01905000 and has size 0x20000 (128KB)
> >
> > Thanks, Kathiravan,
> > TSCR mutex with MMIO reg under it works, but there is some weird probe
> > ordering issue.
> >
> > For whatever reason, SMEM will get probed only after MTD does and this
> > will cause issues
> > if SMEM parser is used as it will return -EPROBE_DEFER but the MTD
> > core does not really
> > handle it correctly and causes the device to reboot after failed parsing.
> >
> > Now, I have no idea why does this variant which uses MMIO regmap probe
> > so much later?
> >
>
> Mani, do you have any input related to the probe deferral of the SMEM
> partition parser, because SMEM not yet probed?

I did some more digging as it made no sense to me and it looks like it
gets to driver_deferred_probe_add()
but then gets stuck in the mutex_lock() after which it resets the
board without any kind of error.
I can see that it gets to this mutex_lock():
https://elixir.bootlin.com/linux/v5.15-rc4/source/drivers/base/dd.c#L136

So, this is some weird bug unrelated to the SMEM itself, but it's an
annoying one as it resets the board.
I am now kind of stuck debugging it further, this is beyond my capabilities.

Regards,
Robert

>
> Thanks,
> Bjorn
