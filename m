Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15FB3A7607
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 06:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhFOEnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 00:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhFOEnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 00:43:46 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2550BC0617AF
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 21:41:43 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id l15-20020a05683016cfb02903fca0eacd15so13062980otr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 21:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wEg+VoqwL+a1eo1ktmnPpcNUwlMmnMzGqqtS4STsyQM=;
        b=hJ0/5WyG+8/NR9t7aDL0awG0SsSTahlq4na9Ll+lOD1M88IJAo7R3IICOZZETF7QB7
         stDCm5tF/Jsgc6iL4gwUou+mJRDTRRv6Av6PeOMML+/w13dSyGQC3IWd2fc153btcLJW
         9zpZ0DIZFhKjS8YlsUIL1xqGeFetm8c84skQKwE4YIIecOgdCIHZ+7TruyBFc0z6JAgJ
         1KsV9Gcvcqd5zBFBEE7RtzLT2X6SaNb6/SCxdhQrZQ/NCNJwdAcmXuLymA0prqdrDslE
         4/zTGtdpItnVBIk+l10QuTQZ0Rmy6bsCBl2CGeJlqS9/pDsievWkh11gUDhyI8xgPIyr
         ylIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wEg+VoqwL+a1eo1ktmnPpcNUwlMmnMzGqqtS4STsyQM=;
        b=kiEW+8iqzfkC8LRnJv9aUhTBYfycE2GZYRviDKlT45lrwANQl5wddL7F8PebucbPS8
         KZTvm9gj2AU4+x+hrAszbjF+rDumpx++7vrh2/iOziikiKEoaiTyOYysKgSkHGSkFHM2
         gm/WqU8L66x+8zTnOWlxgnEKBMSzkRwcKD2pozUAha6rBD3spm+t83PFVKPAylM1TuZm
         8XVp9hafz6oLQvj0YwMt9ckuBGA6o5dR7uti7/mTCPAPmQLm7Jj3OEraYNNubiN1hwcK
         hOJiu2WH0zc68NWTbovoj2EWe2J+5EYFHKiM6VoQAggLMtSaRdhK2qVLcXXrmVzquIiH
         Hwvw==
X-Gm-Message-State: AOAM530JBFZG7MkoCCrYcdTUTisWOfUxWEioOR4ftusOHO91JdjKEqRN
        KiT2Bz4fr5FxMrtX+VBvkgnPW7FySOW6TRWf+LHM0w==
X-Google-Smtp-Source: ABdhPJzOZz+3JAdGaUZujLoYtRIssOq5IDy2Ja04KYFxPa+nq7/kRp+YlyQKRLWlQ8X0NNXpnRW930PBNGPvA2H/Y4E=
X-Received: by 2002:a9d:74d4:: with SMTP id a20mr15877413otl.28.1623732102331;
 Mon, 14 Jun 2021 21:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-9-bhupesh.sharma@linaro.org> <YMLJsieGd+G+/kxK@builder.lan>
In-Reply-To: <YMLJsieGd+G+/kxK@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 15 Jun 2021 10:11:31 +0530
Message-ID: <CAH=2Ntyi=a0tiyW0D-MvGW+dDdWjNVS4EAcrWZBc=fU8bRphng@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: sa8155p-adp: Add base dts file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Jun 2021 at 07:55, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
>
> > Add base DTS file for sa8155p-adp and enable boot to console,
>
> Please spell out "sa8155-adp", i.e. "Add base DTS for SA8155p Automotive
> Development Platform."
>
> > tlmm reserved range and also include pmic file(s).
> >
> > SA8155p-adp board is based on sm8150 Qualcomm Snapdragon SoC.
> >
>
> It's not based on sm8150, it's based on sa8155p, so let's express this
> as "The SA8155p platform is similar to the SM8150, so use this as base
> for now", to document why we decided to do this.
>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com

<..snip..>

> > +&apps_rsc {
> > +     pmm8155au-1-rpmh-regulators {
> > +             compatible = "qcom,pmm8155au-1-rpmh-regulators";
> > +             qcom,pmic-id = "a";
> > +
> > +             vdd-s1-supply = <&vreg_3p3>;
> > +             vdd-s2-supply = <&vreg_3p3>;
> > +             vdd-s3-supply = <&vreg_3p3>;
> > +             vdd-s4-supply = <&vreg_3p3>;
> > +             vdd-s5-supply = <&vreg_3p3>;
> > +             vdd-s6-supply = <&vreg_3p3>;
> > +             vdd-s7-supply = <&vreg_3p3>;
> > +             vdd-s8-supply = <&vreg_3p3>;
> > +             vdd-s9-supply = <&vreg_3p3>;
> > +             vdd-s10-supply = <&vreg_3p3>;
> > +
> > +             vdd-l1-l8-l11-supply = <&vreg_s6a_0p92>;
> > +             vdd-l2-l10-supply = <&vreg_3p3>;
> > +             vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p92>;
> > +             vdd-l6-l9-supply = <&vreg_s6a_0p92>;
> > +             vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
> > +             vdd-l13-l16-l17-supply = <&vreg_3p3>;
> > +
> > +             vreg_s5a_2p04: smps5 {
> > +                     regulator-min-microvolt = <1904000>;
> > +                     regulator-max-microvolt = <2000000>;
> > +             };
> > +
> > +             vreg_s6a_0p92: smps6 {
> > +                     regulator-min-microvolt = <920000>;
> > +                     regulator-max-microvolt = <1128000>;
> > +             };
> > +
> > +             vdda_wcss_pll:
>
> This is the "label" of the pad which the regulator typically is
> connected to (rather than a denotion of which regulator it is). So even
> though we have these in some of the other boards, I would prefer if you
> skip them and only use the vreg_xyz_abc variant.

Lets keep the 'vdd_xx_abc labels' though which are used as input
supply pads for peripherals, for e.g.:

&usb_1_hsphy {
    status = "okay";
    vdda-pll-supply = <&vdd_usb_hs_core>;
    vdda33-supply = <&vdda_usb_hs_3p1>;
    vdda18-supply = <&vdda_usb_hs_1p8>;
};

IMO, here it makes sense to retain labels 'vdda_usb_hs_3p1' and
'vdda_usb_hs_1p8' in the dts (also making it easier to trace the same
in schematics).

I will send the v2 with the other suggested changes shortly.

Regards,
Bhupesh



<..snip..>
