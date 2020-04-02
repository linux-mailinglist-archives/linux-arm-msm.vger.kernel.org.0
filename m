Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B34C19BEF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 11:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgDBJyu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 05:54:50 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40565 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgDBJyu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 05:54:50 -0400
Received: by mail-ed1-f68.google.com with SMTP id w26so3356670edu.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VbK6WaEM8B630ixpWF7jh6Wz2I9VqlGT1ovLvbnaHXc=;
        b=SKbYHGEqu09YTmf5IPWKYoulNVb27G4TheUJaJYSIQVELcoJQfaS4LH1G3m5MdW6BX
         +BROn0GQmpi0THeIS7hgnPd4mg9QMqOlcOZ3Y8FGiP6AP68cj6hEVb8AMkH+aUqF0pMm
         sxB0Jb2gH9JSTM1+MjDElDID5MPvrYP65mUZ6NSxDfn3Duii/YIxwduU4Ivs3Gm1F/oa
         j4C0xBxojGnogI51huQJ04fuJz8WVpfn1VU5LCafcUkyvcrENPQ3BIqpVoyn6qLvNbyg
         LofQt8OfRZ9wgOqlVrJK4u2abz5oudJKH9rmsREEXT9x1bWC4m2A/L+2YaMvh+3lk92x
         KVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VbK6WaEM8B630ixpWF7jh6Wz2I9VqlGT1ovLvbnaHXc=;
        b=t+9gMFbktggYzIFhRqX2H8jqeglSUPD+2QWFe9vFsaN6Kw8c6aQ+V1Eomc+OsctDp0
         n5OuG42UaDdePJv24NrgReL8cw1TEX2d+KvdK9O3zmEEg9+U2r7orY5eulM9rkrBXg4P
         86hdZ0T1RyDkSU2u+/3j/saeIO/FWAFb9pp/46iLpMtzAl1ufz8YZybNdBVh6E4AYQmA
         OM+4Hj0lh/0kwGAxWbg/QC1HuKZHuRbiGNaFFJTXd1zqRrft7jhYfgul32ysdNs++Mo5
         LamaGU5gdtat7bmfOq4uazugVAVN0TcgFfAY7PRJdSPHkhp9/Cvi7d1n96LZIcbY+Iwi
         Dkjg==
X-Gm-Message-State: AGi0PubyZFLPvmpepT4SLag9s7hsBK68GljeCTMa1hpe18saLZKkcwhk
        rWB0OjKdC+tvVwHYMip+Coz6YEmHqNhTJ4NaHfrRSg==
X-Google-Smtp-Source: APiQypL7t021RB4D1S5hXM2wXpofo9L9jKGn0ntJhXqrV0tEIlb134OBpJU6D4bY9NyIZ4dnIPLmdALSsZ0kWKQIJ2o=
X-Received: by 2002:a17:906:35c6:: with SMTP id p6mr2288370ejb.260.1585821288216;
 Thu, 02 Apr 2020 02:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org> <20200402081349.GA932@gerhold.net>
In-Reply-To: <20200402081349.GA932@gerhold.net>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 2 Apr 2020 11:58:08 +0200
Message-ID: <CAMZdPi-U2oQ0WsPDo_WT-suuj_Ju_cQa2FLuUts6AiXe6Ge_qw@mail.gmail.com>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan,

On Thu, 2 Apr 2020 at 10:14, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Hi,
>
> On Wed, Apr 01, 2020 at 07:50:59PM +0200, Loic Poulain wrote:
> > The highest cpu frequency opps have been dropped because CPR is not
> > supported. However, we can simply specify operating voltage so that
> > they match the max corner voltages for each freq. With that, we can
> > support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
> > fine tune operating voltages and optimize power consumption.
>
> Thanks for the patch! I was wondering how to enable the higher CPU
> frequencies for a while now...
>
> I was actually quite excited to see CPR being mainlined for QCS404.
> If we are trying to add such a workaround (rather than CPR) for MSM8916
> now, does that mean it's unlikely to see CPR working for MSM8916
> anytime soon?
>
> AFAICT, there is a WIP branch from Niklas Cassel here:
> https://git.linaro.org/people/nicolas.dechesne/niklas.cassel/kernel.git/log/?h=cpr-msm8916-mainline
> but it hasn't been updated for a while. (Not sure if it was working
> already...)
>
> Can someone explain what is missing to make CPR work for MSM8916?

Support should be relatively straightforward to add, but would request
some time to implement and validate.
This patch can be considered as a first step, using the ceiling voltages.

>
> One other minor comment/question below.
>
> >
> > This patch:
> > - Adds missing opps and corresponding target voltages to msm8916.dtsi.
> > - Adds cpu-supply to apq8016-sbc.dtsi (board level info).
> > - Adds pm8916 spmi regulator node to pm8916.dtsi.
> >
> > Tested with a dragonboard-410c.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 24 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 24 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/pm8916.dtsi      |  6 ++++++
> >  3 files changed, 54 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > index 037e26b..f1c1216 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > @@ -560,6 +560,30 @@
> >       qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
> >  };
> >
> > +&spm_regulators {
> > +     vdd_cpu: s2 {
> > +             regulator-always-on;
> > +             regulator-min-microvolt = <1050000>;
> > +             regulator-max-microvolt = <1350000>;
> > +     };
> > +};
> > +
> > +&CPU0 {
> > +     cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&CPU1 {
> > +     cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&CPU2 {
> > +     cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&CPU3 {
> > +     cpu-supply = <&vdd_cpu>;
> > +};
> > +
>
> I'm a bit confused about the separation here. The cpu-supply is defined
> in the board-specific device tree, yet the voltages are set in the
> common device tree below.
>
> Is it even possible that the CPU is supplied by something other than S2
> and if yes, how likely is this?

Well nothing prevents to use a different PMIC, but you're right in
practice msm8916 is tightly coupled to pm8916 and s2 is clearly
specified as application processor regulator in pm8916 spec. So I'll
move that into msm8916 for the v2.

> I'm asking because I have two other MSM8916 devices in mainline
> (and a few more pending upstreaming), and it seems like I would need to
> duplicate this into each of them.

Would you be able to test and ack the V2 with these boards?

Regards,
Loic
