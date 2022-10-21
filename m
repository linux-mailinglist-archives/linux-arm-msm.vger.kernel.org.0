Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5379760777A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 15:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiJUNDJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 09:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiJUNDI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 09:03:08 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828B126B48A
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 06:03:06 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id g8-20020a17090a128800b0020c79f987ceso6601343pja.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WOpLmTrUaUpNu8YOZO+1dIDXWrtlWX5WU2fFqWAytR4=;
        b=uK5tbmgzkGTQGgUMeKi2zHrl0cYcszMV8yy0Nwdm29vLxXhz9cuyaNDJWQfCkp0IeW
         ScUuwxG76BxyafJyuUus2Sa+8ym5xp4JwRDOk40yS+mRgTAUyxJjhoJUjILk7aDYn79z
         wG3SwN6DNOPes/5cOeKgfGWoAmz+jRNaXHT+q9K5REOhWoEK0PCWuk+bZVgSrMef3zz+
         F0WejCuSmz8d0pU+Vz8G5atdC7r1XCauNx3GSzdHgVOw2FyK8rlYwa7juipOrDKmK5y2
         PEet12lvfIwLbRbND4jV8VcGvluzQS8tgjIp8cLBCsEaO5YEO2UgiyAvTQ0jacn2pKId
         8R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOpLmTrUaUpNu8YOZO+1dIDXWrtlWX5WU2fFqWAytR4=;
        b=ovIiY6wF/Kzp3Yj6OgUf5u0hgoaF0nO4vK3qM7rwbxiMvS/VW6v07b3oKxzMxCvBLI
         UCDoK6/fpBjp3c4+AhjditNRdCD8mvgQypZFPNTlBkn8B7dEoI3tamCk1RaG1Qs1+bfb
         Jkhz55f9nUQ4fHInB1vHoxdltrRb5cJSz2qHLCycy+6fpYJJ80WeNhSq5f1iLIE+k5IJ
         JlONyMwfHk/iTER5beFHrNh986Eu94p6s2GBva0yEUV8ZZA2WDEnvg7aM8y1cKX3kbyr
         wBwMEQ0djAHN2491t1q+ftv0ZSEXCA5HKT2SZ9WOGzRQ13cIyot6TscseNCmtB2Q/jxk
         GLCg==
X-Gm-Message-State: ACrzQf1U78WIilgzFLZwtdCP2ua7RcUDUpOz3hBbrf7sVgJaSigH3lor
        XuVWBFkC087+ILJioXKq+44SPX606lrlT04UF/USnA==
X-Google-Smtp-Source: AMsMyM61nS1YdY+REXQLCpGENe6KvhyCR07zP6uBR0s1LsDxzGA5IU1FyDZj7cq5hXk3njkK4+c2cRbdVGyV2bxLOgQ=
X-Received: by 2002:a17:903:246:b0:179:96b5:1ad2 with SMTP id
 j6-20020a170903024600b0017996b51ad2mr18963023plh.37.1666357385929; Fri, 21
 Oct 2022 06:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221018145348.4051809-1-amit.pundir@linaro.org>
 <CAPDyKFoBMB9OMUrcoPCV0of1fj2dimEwPyHGW=ydjJ2M0ubM8Q@mail.gmail.com>
 <20221020093057.zrrvxlgghn27bpes@bogus> <CAMi1Hd05PkEJcHqHpQX-X6B2oR4250_pHPjkd2-54JWgKsYx0Q@mail.gmail.com>
 <CAPDyKFo=w-ET62c-B6=qSpkZm-V9LmBuVRy38GzX_UAjQhX6oA@mail.gmail.com> <20221020161628.nyimwuni4zboasjo@bogus>
In-Reply-To: <20221020161628.nyimwuni4zboasjo@bogus>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 21 Oct 2022 15:02:28 +0200
Message-ID: <CAPDyKFonwjh58jPoGc==BEjj6kY-=C97Ws=43hbdAqJMpEAa=g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: Disable cpuidle states
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 20 Oct 2022 at 18:16, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Oct 20, 2022 at 04:40:15PM +0200, Ulf Hansson wrote:
> > On Thu, 20 Oct 2022 at 16:09, Amit Pundir <amit.pundir@linaro.org> wrote:
> > >
> > > On Thu, 20 Oct 2022 at 15:01, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > >
> > > > On Wed, Oct 19, 2022 at 01:57:34PM +0200, Ulf Hansson wrote:
> > > > > On Tue, 18 Oct 2022 at 16:53, Amit Pundir <amit.pundir@linaro.org> wrote:
> > > > > >
> > > > > > Disable cpuidle states for RB5. These cpuidle states
> > > > > > made the device highly unstable and it runs into the
> > > > > > following crash frequently:
> > > > > >
> > > > > > [    T1] vreg_l11c_3p3: failed to enable: -ETIMEDOUT
> > > > > > [    T1] qcom-rpmh-regulator 18200000.rsc:pm8150l-rpmh-regulators: ldo11: devm_regulator_register() failed, ret=-110
> > > > > > [    T1] qcom-rpmh-regulator: probe of 18200000.rsc:pm8150l-rpmh-regulators failed with error -110
> > > > > >
> > > > > > Fixes: 32bc936d7321 ("arm64: dts: qcom: sm8250: Add cpuidle states")
> > > > > > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++++
> > > > > >  1 file changed, 8 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > > > > > index cc003535a3c5..f936c41bfbea 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > > > > > +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > > > > > @@ -251,6 +251,14 @@ qca639x: qca639x {
> > > > > >
> > > > > >  };
> > > > > >
> > > > > > +&LITTLE_CPU_SLEEP_0 {
> > > > > > +       status = "disabled";
> > > > > > +};
> > > > > > +
> > > > > > +&BIG_CPU_SLEEP_0 {
> > > > > > +       status = "disabled";
> > > > > > +};
> > > > > > +
> > > > > >  &adsp {
> > > > > >         status = "okay";
> > > > > >         firmware-name = "qcom/sm8250/adsp.mbn";
> > > > > > --
> > > > > > 2.25.1
> > > > >
> > > > > Disabling the CPU idlestates, will revert us back to using only the WFI state.
> > > > >
> > > > > An option that probably works too is to just drop the idlestate for
> > > > > the CPU cluster. Would you mind trying the below and see if that works
> > > > > too?
> > > > >
> > > >
> > > > Indeed this is was I suggested to check initially. But I was surprised to
> > > > see IIUC, Amit just disabled CPU states with above change and got it working.
> > > > So it is not cluster state alone causing the issue, is it somehow presence
> > > > of both cpu and cluster states ? Am I missing something here.
> > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > index c32227ea40f9..c707a49e8001 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > @@ -700,7 +700,6 @@ CPU_PD7: cpu7 {
> > > > >
> > > > >                 CLUSTER_PD: cpu-cluster0 {
> > > > >                         #power-domain-cells = <0>;
> > > > > -                       domain-idle-states = <&CLUSTER_SLEEP_0>;
> > > >
> > > > How about just marking CLUSTER_SLEEP_0 state disabled ? That looks cleaner
> > > > than deleting this domain-idle-states property here. Also not sure if DTS
> > > > warnings will appear if you delete this ?
> > >
> > > Hi, I did try disabling CLUSTER_SLEEP_0: cluster-sleep-0 {} in
> > > domain-idle-states {} but that didn't help. That's why I end up
> > > disabling individual cpu states in idle-states {}.
> >
> > Yep, this boils down to the fact that genpd doesn't check whether the
> > domain-idle-state is disabled by using of_device_is_available(). See
> > genpd_iterate_idle_states().
> >
>
> Yes I found that but can't that be fixed with a simple patch like below ?

Sure, yes it can.

Although, it does complicate things a bit, as we would need two
patches instead of one, to get things working.

>
> > That said, I suggest we go with the above one-line change. It may not
> > be as clean as it could be, but certainly easy to revert when the
> > support for it has been added in a newer kernel.
> >
>
> I don't like removing the state. It means it doesn't have the state rather
> than i"it has state but is not working and hence disabled".
>
> Will handling the availability of the state cause any issues ?

No, this works fine. It's already been proven by Amit's test.

>
> Regards,
> Sudeep
>
> -->8
>
> diff --git i/drivers/base/power/domain.c w/drivers/base/power/domain.c
> index ead135c7044c..6471b559230e 100644
> --- i/drivers/base/power/domain.c
> +++ w/drivers/base/power/domain.c
> @@ -2952,6 +2952,10 @@ static int genpd_iterate_idle_states(struct device_node *dn,
>                 np = it.node;
>                 if (!of_match_node(idle_state_match, np))
>                         continue;
> +
> +               if (!of_device_is_available(np))
> +                       continue;
> +
>                 if (states) {
>                         ret = genpd_parse_state(&states[i], np);
>                         if (ret) {
>

The above code looks correct to me. Anyone that wants to submit the
patches? Otherwise I can try to manage it...

Kind regards
Uffe
