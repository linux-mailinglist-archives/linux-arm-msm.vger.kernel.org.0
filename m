Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EED2351770D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 21:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387005AbiEBTEy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 15:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386994AbiEBTEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 15:04:53 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C35864F6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 12:01:24 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2ec42eae76bso158165427b3.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AC0EeKmdD/wVz7MSLZ/h0yiSs6sEJRzxBmAWAP1+gLM=;
        b=WNqdk/HayGYvvD78D8U73C49lNe6YaKCBv4ArxjZNpn2oWWIEHIsxOeMcFAvy8zrOI
         bulK1HmtpQFrmpZ1IzpxWnpM5X3UedfgyhemcCBPfVAtK4NYJzdnujw1/appDkxvAkpw
         2oAckt8rnItfE96eclwaEKN1wBW1/VcsrvfhP89WnxB+OpgiE+NODkMCo85NqTsqndul
         qlUAswh3IYLO/xStX9jhIw21HgTUWpedgpdbr32B+3aA1/4ImCjTyb8h/jWqfdFUK8x/
         Qsi7Hdmcf5HO+SONaDrdWIVRDgcZgGUMQvUyEommUNQjsxh3PoIayToQOnHGRCpJNo6N
         pJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AC0EeKmdD/wVz7MSLZ/h0yiSs6sEJRzxBmAWAP1+gLM=;
        b=xZcJDMEWngZG84yaUhTSq++X6yiGlZB2pzUwUDGJJejmI49yFmfp5d/p9YYsW0Zbn4
         Wt1RqAIMcSG0XPqE8OkGySyKNssvJdkw/tkei/2+sD/0q+9Glk7WUfDXieicQ6bJaPcN
         ZpiDotW0mZoQePo9E2D3ueXT3erhb2AuEw34IgcOpaGpg92v8aynUiAFMOa3zxJbcLLS
         Dq6YcUoXYmVOY3C4Zvgr3PnBxIJ4IocFXer469dOqketx6yadUlh2H6FkAirIv8XliQL
         KMLMuddViTtp/u4MmdsyZJFxq/UJXoTqQ00CKxUW+hhhVOFhZ+52alg2htZHzfJyXc0D
         WZhg==
X-Gm-Message-State: AOAM532bza3Z7u2UxQPIAY2IXEZ9lBZT8oNgsNwdQzl2nF6mlCvNkO7k
        1oDuB1QNWMMgccvoQSiy8b3iHMPPyQFE6sz/myptCw==
X-Google-Smtp-Source: ABdhPJy/C0gQDMibcNI6GSVb0H9Uz0+HUuH3G2FQPbsmsIja9PVwDOFJHPrVOHPcd00s+q/RfeUIdKK97HQSMWzBSgU=
X-Received: by 2002:a81:492:0:b0:2f7:ce87:c324 with SMTP id
 140-20020a810492000000b002f7ce87c324mr12569218ywe.359.1651518083662; Mon, 02
 May 2022 12:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220501195458.4134911-1-dmitry.baryshkov@linaro.org> <6b0ef19b-a45b-ae6f-9f6f-41e72f2c71fd@somainline.org>
In-Reply-To: <6b0ef19b-a45b-ae6f-9f6f-41e72f2c71fd@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 2 May 2022 22:01:12 +0300
Message-ID: <CAA8EJpqeR8FF7V1fdyWtQsU3xnFw5+4obBSndb3wS+H8Xgu8Rw@mail.gmail.com>
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

On Mon, 2 May 2022 at 20:59, Konrad Dybcio <konrad.dybcio@somainline.org> w=
rote:
>
>
>
> On 1.05.2022 21:54, Dmitry Baryshkov wrote:
> > Add device tree node for uart20, which is typically used for Bluetooth =
attachment.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts=
/qcom/sm8450.dtsi
> > index 4fcb6e2b096b..8b9d9c2cd02c 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > @@ -996,6 +996,19 @@ spi20: spi@894000 {
> >                               status =3D "disabled";
> >                       };
> >
> > +                     uart20: serial@894000 {
> I think it should come before SPI alphabetically?

Argh. I sorted it using the label!

>
> > +                             compatible =3D "qcom,geni-uart";
> > +                             reg =3D <0 0x00894000 0 0x4000>;
> > +                             clock-names =3D "se";
> > +                             clocks =3D <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
> > +                             pinctrl-names =3D "default";
> > +                             pinctrl-0 =3D <&qup_uart20_default>;
> No sleep state?

No, uarts do not provide a sleep state.

>
> > +                             interrupts =3D <GIC_SPI 587 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <0>;
> > +                             status =3D "disabled";
> > +                     };
> > +
> >                       i2c21: i2c@898000 {
> >                               compatible =3D "qcom,geni-i2c";
> >                               reg =3D <0x0 0x00898000 0x0 0x4000>;
> > @@ -2757,6 +2770,15 @@ qup_uart7_tx: qup-uart7-tx {
> >                               drive-strength =3D <2>;
> >                               bias-disable;
> >                       };
> > +
> > +                     qup_uart20_default: qup-uart20-default {
> > +                             mux {
> Please drop the unnecessary mux{} here.

Ack.

>
> > +                                     pins =3D "gpio76", "gpio77",
> > +                                             "gpio78", "gpio79";
> I think these could fit into a single 100-char-long line>?

I'll check.

>
> > +                                     function =3D "qup20";
> Are there no default properties for this setup? I think boards that don't=
 use standard Qualcomm connectivity setups (like Bluetooth on this specific=
 UART) are rather scarce and it'd be more convenient to keep a standard set=
ting here and override it where need be instead of copy-pasting the same th=
ing over and over in 95-100% of the boards.

I see your point. Let's do this.

>
> Konrad
>
> > +                             };
> > +                     };
> > +
> >               };
> >
> >               apps_smmu: iommu@15000000 {
> >



--=20
With best wishes
Dmitry
