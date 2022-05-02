Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B3B517793
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 21:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387179AbiEBTxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 15:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238542AbiEBTxA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 15:53:00 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E60E65CE
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 12:49:29 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id y76so27859112ybe.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 12:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=d3yb1Fnr/zbQXxOFkQnHcr4n3zU0gBAcATuRjfL5TDY=;
        b=wit9rG+MRPWFRTP65q0B0t6WJ3GKIV4+O2kFaiJfofFF08DWhGKVEoKztqCCOPWyF6
         FCzWKVujgM+xx9AemJfXeQkvAIrqae8M5ohNCHvifRn53lrkoMEq2anP0EZTWj6Tt/da
         QMV5gfxcP7tNjqHX+FUicrW2cEb+6zZMEkBWAiwnnnz4nb2sh1sLMwm1psmNEBL33VpO
         0qWmKtC98xfouKk22Qp5ZnwzZJN1sFDX22Z8vzT/xfExMi/2UkIh6ZOQuLqCkVbqx6YL
         c/1LIXpYWD9ua18zyrUfA77eqhzgleE2f/So5dO7aPARUa7boxSkfu5HhWzLULvoqx9m
         NNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=d3yb1Fnr/zbQXxOFkQnHcr4n3zU0gBAcATuRjfL5TDY=;
        b=eV1m1/67ICzzvVd9MgANzuRm6968Q+iIJJCpOQbT0G8MwX2Px+AspB3lqF2pumvYaZ
         6f6aZiJwwvLQ9cTDiMJ5y7XP/KkoHKCjpO3bxlqtOY5yEvus6I99OtgUdH53Yqx8dFqs
         fHQvCLkFtI6RViB8l0MHM0GMmQtLmhwAlAPRd602ebUxkQNylrFeXfimaXzOrFV3d9M8
         TxHsz9qYKITzSbKdl8wgj3tkkVwMBh7+fpk+CfsN1lWcp64YxYnj92oUi3MJrvFJlbiL
         zY/r62O/RdpWIBkSaSE4Gwe3GVpfuz8bgvO9ZBzx3GJassgCOAGqHnBu7WgQtzm0dX74
         o45Q==
X-Gm-Message-State: AOAM531uOwdEtdXmTekSJwUTlKruhX5ffNuTpufAm8Ms2xLVPh90gktL
        FVGNS24Mh1xpIWlCOboEvFs9RYdAxHeMxd/T9aqwGg==
X-Google-Smtp-Source: ABdhPJxtSg5VMe0hjrwM20z93/lG6R8ClZbbSbnX+LP7xONagUvCWFxPbZqrFBTE4JEuIwfRzr7jlu24emSB+v7/3KY=
X-Received: by 2002:a25:3455:0:b0:648:44db:51e0 with SMTP id
 b82-20020a253455000000b0064844db51e0mr10996374yba.314.1651520968673; Mon, 02
 May 2022 12:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220501195458.4134911-1-dmitry.baryshkov@linaro.org>
 <6b0ef19b-a45b-ae6f-9f6f-41e72f2c71fd@somainline.org> <CAA8EJpqeR8FF7V1fdyWtQsU3xnFw5+4obBSndb3wS+H8Xgu8Rw@mail.gmail.com>
In-Reply-To: <CAA8EJpqeR8FF7V1fdyWtQsU3xnFw5+4obBSndb3wS+H8Xgu8Rw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 2 May 2022 22:49:17 +0300
Message-ID: <CAA8EJpoZaWXhD7aq4fR+6atJ6oMRNmA=8GJFmtXOSSbrBez53g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: add uart20 node
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2 May 2022 at 22:01, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 2 May 2022 at 20:59, Konrad Dybcio <konrad.dybcio@somainline.org>=
 wrote:
> >
> >
> >
> > On 1.05.2022 21:54, Dmitry Baryshkov wrote:
> > > Add device tree node for uart20, which is typically used for Bluetoot=
h attachment.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/d=
ts/qcom/sm8450.dtsi
> > > index 4fcb6e2b096b..8b9d9c2cd02c 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > @@ -996,6 +996,19 @@ spi20: spi@894000 {
> > >                               status =3D "disabled";
> > >                       };
> > >
> > > +                     uart20: serial@894000 {
> > I think it should come before SPI alphabetically?
>
> Argh. I sorted it using the label!
>
> >
> > > +                             compatible =3D "qcom,geni-uart";
> > > +                             reg =3D <0 0x00894000 0 0x4000>;
> > > +                             clock-names =3D "se";
> > > +                             clocks =3D <&gcc GCC_QUPV3_WRAP2_S5_CLK=
>;
> > > +                             pinctrl-names =3D "default";
> > > +                             pinctrl-0 =3D <&qup_uart20_default>;
> > No sleep state?
>
> No, uarts do not provide a sleep state.

I've checked other dts. Usually the sleep state is provided by the
board dts rather than the SoC's dtsi.

>
> >
> > > +                             interrupts =3D <GIC_SPI 587 IRQ_TYPE_LE=
VEL_HIGH>;
> > > +                             #address-cells =3D <1>;
> > > +                             #size-cells =3D <0>;
> > > +                             status =3D "disabled";
> > > +                     };
> > > +
> > >                       i2c21: i2c@898000 {
> > >                               compatible =3D "qcom,geni-i2c";
> > >                               reg =3D <0x0 0x00898000 0x0 0x4000>;
> > > @@ -2757,6 +2770,15 @@ qup_uart7_tx: qup-uart7-tx {
> > >                               drive-strength =3D <2>;
> > >                               bias-disable;
> > >                       };
> > > +
> > > +                     qup_uart20_default: qup-uart20-default {
> > > +                             mux {
> > Please drop the unnecessary mux{} here.
>
> Ack.
>
> >
> > > +                                     pins =3D "gpio76", "gpio77",
> > > +                                             "gpio78", "gpio79";
> > I think these could fit into a single 100-char-long line>?
>
> I'll check.
>
> >
> > > +                                     function =3D "qup20";
> > Are there no default properties for this setup? I think boards that don=
't use standard Qualcomm connectivity setups (like Bluetooth on this specif=
ic UART) are rather scarce and it'd be more convenient to keep a standard s=
etting here and override it where need be instead of copy-pasting the same =
thing over and over in 95-100% of the boards.
>
> I see your point. Let's do this.

Well, comparing with other SoC dtsi shows that most of them declare
pins&functions in the dtsi and leave bias/ details to the board.dts
(despite code duplication). So let's follow that approach.

>
> >
> > Konrad
> >
> > > +                             };
> > > +                     };
> > > +
> > >               };
> > >
> > >               apps_smmu: iommu@15000000 {
> > >
>
>
>
> --
> With best wishes
> Dmitry



--=20
With best wishes
Dmitry
