Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48707348388
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 22:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238256AbhCXVWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 17:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhCXVWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 17:22:43 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B78C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 14:22:43 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id g25so74751wmh.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C2A13Yg3KqhUO629ZIlsQXhW97Y8pkuoM7AYOwJWu18=;
        b=I6/7LJWivKQMIcW9vQRNi3CAV4OD+hROU7InNOva/3wbmLv69ffp1sTZIsq/YGsPC9
         R7Z58vBnZfvwxRUsGHyLc8LYOHzgpy/8gAPLhtNztSOqcQm8Xu9Imsqhia2Ie/pTGi4w
         vGW6R3qj0TvZutk9FCqJ5tUuETdmC/4ZAw/wSBmNEJeuVKArJl9ATgYsdbTKMMemGrKo
         z9cSXgbYHfwX/COnrK0N8acxa5rDItKnF/+pRO12HC0GWk3LWGwSTJRPSGx8BxL9ZIWH
         mVGISl68DD9Ig5q8FV8K6F5o78iPefUzMDC8RrdUJD0BWh/NztHLSZhs1uAieQlGebaj
         mOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C2A13Yg3KqhUO629ZIlsQXhW97Y8pkuoM7AYOwJWu18=;
        b=lboDX0IlhkvM0GC5fPQDiuhLuECxluuayTYaief3YpfGNWMEQBAtETT1bg2qGdpTNN
         72w8C/552Owt2sWmmgFyMeC4yineZ56nB289ywLc3MhJAWr1l8l2CBCY4/NTvikhtHzS
         bn7xKih53CMugTCijjLBf0Jt89uZWt895SI1nqcHVeBDDrXWoHQfY5Mq1DGpmZCX9OgR
         fADu6huclLnDHwc+9NrH/78KjmpOxPbKgB/VNYv/fCxagJdhQ7qa1UMGvhYbeZTfwsFt
         eJuPNIFA0zFe1yNalWdIwYgHTrzfMH2TofxtwOQ0AznF058+QycATO4jYycFTxM5NPc4
         5Kmg==
X-Gm-Message-State: AOAM530k0Hw6BZDehY4YNWusAxQb3FkmLMDMnxmQfjjEG3yTrkhfQg6W
        QjxIVn67Irw/1x8zmJvRQcvAAn1rIiXq6DX5hUz7Lg==
X-Google-Smtp-Source: ABdhPJwDXO54Dc9xzJeq4ZgqkUZc/KbaGHmJxWcrPEX1G4P7YrnT+Wz5DQOWT1UsIz+7M1kPAdwasKt/A+Cf0OniWMU=
X-Received: by 2002:a7b:c209:: with SMTP id x9mr4754197wmi.92.1616620961979;
 Wed, 24 Mar 2021 14:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210320025942.487916-1-leo.yan@linaro.org> <20210320030528.GA488187@leoy-ThinkPad-X240s>
In-Reply-To: <20210320030528.GA488187@leoy-ThinkPad-X240s>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 24 Mar 2021 21:22:31 +0000
Message-ID: <CAJ9a7Vgip=qmFE7Wmf64zHZwH=Rc_PB1zpyNGnNE4++Aqc6VQg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: msm8916: Enable CoreSight STM component
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Leo,

There are additional CTI components on the DB410c - I think there is
information on base addresses for these - but there is no information
on connectivity between the CTIs and any components such as STM / ETR
etc for any of the in / out signal lines.
Therefore we omitted these from the original DT when adding the other
CTI devices.

It could well be that there are signals from the STM to a CTI, and if
the information could be found then it would be useful to add - but I
have not seen this information anywhere - and it is the sort of thing
that is often missed out of hardware manuals.
It might be possible to deduce some information using the Coresight
intergration management registers - but this would involve a lot of
trial and error testing

Regards

Mike

On Sat, 20 Mar 2021 at 03:05, Leo Yan <leo.yan@linaro.org> wrote:
>
> Hi Mike,
>
> On Sat, Mar 20, 2021 at 10:59:42AM +0800, Leo Yan wrote:
> > From: Georgi Djakov <georgi.djakov@linaro.org>
> >
> > Add DT binding for CoreSight System Trace Macrocell (STM) on msm8916,
> > which can benefit the CoreSight development on DB410c.
>
> For the DT binding for CoreSight STM on DB410c, I have one question:
>
> Do you know there have any CTI is conntected to STM so that the DT
> binding needs to reflect the connection?  If this is the case, we
> should update the DT binding for CTI node as well.
>
> Thanks,
> Leo
>
> >
> > Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |  1 +
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 27 +++++++++++++++++++++++
> >  2 files changed, 28 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > index 3a9538e1ec97..dd87e5d739ab 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > @@ -406,6 +406,7 @@ &wcd_codec {
> >  &etm1 { status = "okay"; };
> >  &etm2 { status = "okay"; };
> >  &etm3 { status = "okay"; };
> > +&stm { status = "okay"; };
> >  &etr { status = "okay"; };
> >  &funnel0 { status = "okay"; };
> >  &funnel1 { status = "okay"; };
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 402e891a84ab..892f1772e53c 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -562,6 +562,13 @@ funnel0_in4: endpoint {
> >                                               remote-endpoint = <&funnel1_out>;
> >                                       };
> >                               };
> > +
> > +                             port@7 {
> > +                                     reg = <7>;
> > +                                     funnel0_in7: endpoint {
> > +                                             remote-endpoint = <&stm_out>;
> > +                                     };
> > +                             };
> >                       };
> >
> >                       out-ports {
> > @@ -882,6 +889,26 @@ etm3_out: endpoint {
> >                       };
> >               };
> >
> > +             stm: stm@802000 {
> > +                     compatible = "arm,coresight-stm", "arm,primecell";
> > +                     reg = <0x802000 0x1000>,
> > +                           <0x9280000 0x180000>;
> > +                     reg-names = "stm-base", "stm-stimulus-base";
> > +
> > +                     clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> > +                     clock-names = "apb_pclk", "atclk";
> > +
> > +                     status = "disabled";
> > +
> > +                     out-ports {
> > +                             port {
> > +                                     stm_out: endpoint {
> > +                                             remote-endpoint = <&funnel0_in7>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> >               msmgpio: pinctrl@1000000 {
> >                       compatible = "qcom,msm8916-pinctrl";
> >                       reg = <0x01000000 0x300000>;
> > --
> > 2.25.1
> >



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
