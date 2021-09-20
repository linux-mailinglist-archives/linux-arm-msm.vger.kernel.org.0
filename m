Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D631F4111DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 11:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbhITJ1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 05:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbhITJ1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 05:27:34 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B160FC061574;
        Mon, 20 Sep 2021 02:26:07 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id c7so34848878qka.2;
        Mon, 20 Sep 2021 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=au55GNjpfBfkdbCkHp9jPXoTXVquLSMkLM/GCREZpo0=;
        b=ZQ6Km5pS4aZ+jKXmwtMjz5cU5HdmwC/LQMatHVfmvToefzsCxXzdC4opylr49dcEDK
         aVTtu5upLFxpJj3pzQWu3zy+LKFvvqWRihwUWfqUzOhOD6ayi1/6EifX2xyTUeJKkelg
         9FRFxJVr28TPZBb7fzJqB6/afv2ZRsMXRK60ZBh+GP5TupNFSNQ7vhPv8/2Vc8NNrovU
         nn8Qc0MveyEavMN78nibOKgUwmVJ+g4lyMXCIWP3SDSbSOV8st7QcVQijzL8JINEj4XE
         HjPIRRNLV99OUVh96tv2Niwh8X8Z8RW3vFWVIFbVxgHj73SgnyNcz07PStgJR08gixtG
         0kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=au55GNjpfBfkdbCkHp9jPXoTXVquLSMkLM/GCREZpo0=;
        b=qg8977LomzU85iUL0m6hyDQIH2eKx5TNh/mrBxIS6QTgS7i6eZZSS4gC1A0O0fQYEp
         U4k7Zi2cQEZfgY1cO2rXqd6jm0wYyscHDILdoZcjevW6Z5Zods05W37ahsijmFQvCviC
         IouaLZb2iOHzr/xNtgAtPtDTk4vK/jRnHfeU5MhlWs9UziLzgUzbonfLY+Wz5c39CiaU
         U9fzpINO0SgEQIv5IATrtkdUyEeEpBF4SdEEmNguDqEOLqWFUsEIO3v2WEigsJh6/ewT
         ukj3rt3w9iv1YNwo89dFmjDBiH7wlsEvxwCvsk2Km6YYGvuePUZ2hC7dKTwyyK+4ldqH
         PTCw==
X-Gm-Message-State: AOAM5337mb24Pf8BKVhr4udqFR5fFGLzDEZvaMM/Gnu4BQLtdmZCMkfd
        /4wBRcA1fAU1Wow/u7sS/GjNbzG6WWam5j6Lgsy1HgX8XVTARw==
X-Google-Smtp-Source: ABdhPJzQhK7gME1s4V90C3jebKNsTrgkIgvpbRz5fREuKp7WJrO6DbSe9WTuRhqyXyR59mcWaEp0QhYZi33lnD8wvhM=
X-Received: by 2002:a37:f909:: with SMTP id l9mr22993655qkj.512.1632129966520;
 Mon, 20 Sep 2021 02:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210902214708.1776690-1-robimarko@gmail.com> <YUf3aKn78+41Cb/G@builder.lan>
In-Reply-To: <YUf3aKn78+41Cb/G@builder.lan>
From:   Robert Marko <robimarko@gmail.com>
Date:   Mon, 20 Sep 2021 11:25:55 +0200
Message-ID: <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Sept 2021 at 04:52, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 02 Sep 16:47 CDT 2021, Robert Marko wrote:
>
> > IPQ8074 uses SMEM like other modern QCA SoC-s, so since its already
> > supported by the kernel add the required DT nodes.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
>
> Thanks for your patch Robert.
>
> > ---
> >  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 28 +++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > index a620ac0d0b19..83e9243046aa 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > @@ -82,6 +82,29 @@ scm {
> >               };
> >       };
> >
> > +     reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +
> > +             smem_region: memory@4ab00000 {
> > +                     no-map;
> > +                     reg = <0x0 0x4ab00000 0x0 0x00100000>;
> > +             };
> > +     };
> > +
> > +     tcsr_mutex: hwlock {
> > +             compatible = "qcom,tcsr-mutex";
> > +             syscon = <&tcsr_mutex_regs 0 0x80>;
>
> Since it's not okay to have a lone "syscon" and I didn't think it was
> worth coming up with a binding for the TCSR mutex "syscon" I rewrote the
> binding a while back. As such qcom,tcsr-mutex should now live in /soc
> directly.
>
> So can you please respin accordingly?

Sure, can you just confirm that the:
reg = <0x01905000 0x8000>;

Is the whole TCSR range as I don't have docs?

Regards,
Robert
>
> Thanks,
> Bjorn
>
> > +             #hwlock-cells = <1>;
> > +     };
> > +
> > +     smem {
> > +             compatible = "qcom,smem";
> > +             memory-region = <&smem_region>;
> > +             hwlocks = <&tcsr_mutex 0>;
> > +     };
> > +
> >       soc: soc {
> >               #address-cells = <0x1>;
> >               #size-cells = <0x1>;
> > @@ -293,6 +316,11 @@ gcc: gcc@1800000 {
> >                       #reset-cells = <0x1>;
> >               };
> >
> > +             tcsr_mutex_regs: syscon@1905000 {
> > +                     compatible = "syscon";
> > +                     reg = <0x01905000 0x8000>;
> > +             };
> > +
> >               sdhc_1: sdhci@7824900 {
> >                       compatible = "qcom,sdhci-msm-v4";
> >                       reg = <0x7824900 0x500>, <0x7824000 0x800>;
> > --
> > 2.31.1
> >
