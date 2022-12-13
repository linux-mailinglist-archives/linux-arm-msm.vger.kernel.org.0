Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E964164BC61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 19:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236343AbiLMSwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 13:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235488AbiLMSw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 13:52:29 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDCE23E91
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:52:28 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id x28so6457299lfn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RDCW+iDH8CpQHgbu/eAxZ2pgLpFC+LyCWi/mo0RGfMU=;
        b=n7vLPZJU8FGT47naIzvCeHtTl8WO5FbnD78FVXWSGGKsqctPECm8O5DFvoa6So0FxY
         sw5t6q2wSta9fuBXfwwcNv+yAx0kYxtgNjgLdOTsgG2O/zIh6ewfm0WHEr9iUvJTtkpV
         cejpXxGoLTvkY3y6l9oKkRCxqmuaugLFR2BdMGPeG/QVrv9A+SdCKvL28uLNs7S6R7vA
         y70WeDLpaHMhpO6w4euQFdqVxqsqQk/PSLv278bZ9ohcofYdiCH3yumzgoqYb9kQvgvy
         VS0z3hnjCd/tyVo3spopPqCMIMgrYs0u35okIdl2gs6jXgoAScBhMrmh1aJ4XYN17BgI
         /ZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDCW+iDH8CpQHgbu/eAxZ2pgLpFC+LyCWi/mo0RGfMU=;
        b=ae7ydzYDax9ld96y8nHzIgBYkbifKs45LOHwNZv7XTj1t0uQqbgKiZ/9LZ3/DUpeHj
         VA7imXXeNqRs3OPcRshwgCmYbTZF3Cx6oU0EENQ4XszIbvxAGuHHykGlu4XQYBaxGBwS
         oAJ2uTVx+GDElkthmHw9ufrlcK7t8VYgTXrM6y8ggxeTbaj1PXaTNpb4f2rtYbT4f+/G
         l9LxKDhHGJlUzBhrplATHQLtTTiA4Xd5b5Gjh8Tm2hYRAcSNmxJrNAsAepqbHw3Kqr09
         ytlgJ0cBpIearr4UyTKoISCzOoyGA14prUHn5a0uTH0FeLUsHyVuXfzHoHZzsyRe+IvW
         zZCA==
X-Gm-Message-State: ANoB5pkL4wCM2ouYp7aVgvknVT082AVwObNY5cTS1toIGhpvkTOFLVNe
        varkcshu+Q1CgmCKfBDGkm7NLvk6TL5UnlgdTRPlQA==
X-Google-Smtp-Source: AA0mqf7tZqgLVvRD/n/okhsIS3EJvqgZdQMNs/s7Ct8ns5PGnOewTGALBAVeaT8IK43pXoHSOn2CUU0vtvNAsuOSqD8=
X-Received: by 2002:a19:a405:0:b0:4b5:785b:c65a with SMTP id
 q5-20020a19a405000000b004b5785bc65amr5577594lfc.464.1670957546753; Tue, 13
 Dec 2022 10:52:26 -0800 (PST)
MIME-Version: 1.0
References: <20221213123823.455731-1-bhupesh.sharma@linaro.org>
 <20221213123823.455731-4-bhupesh.sharma@linaro.org> <39ff2174-6d04-ec21-b762-377ed28088cb@linaro.org>
In-Reply-To: <39ff2174-6d04-ec21-b762-377ed28088cb@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 14 Dec 2022 00:22:15 +0530
Message-ID: <CAH=2NtwUODvzLx=JThuZpADv+x+NtLx688Ox-95b_T9PtRf4_w@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6115: Add USB SS qmp phy node
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On Tue, 13 Dec 2022 at 18:26, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/12/2022 13:38, Bhupesh Sharma wrote:
> > Add USB superspeed qmp phy node to dtsi.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm6115.dtsi | 38 ++++++++++++++++++++++++++--
> >  1 file changed, 36 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > index e4ce135264f3d..9c5c024919f92 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > @@ -579,6 +579,40 @@ usb_hsphy: phy@1613000 {
> >                       status = "disabled";
> >               };
> >
> > +             usb_qmpphy: phy@1615000 {
> > +                     compatible = "qcom,sm6115-qmp-usb3-phy";
> > +                     reg = <0x01615000 0x200>;
> > +                     #clock-cells = <1>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <1>;
> > +                     ranges;
> > +                     clocks = <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> > +                              <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> > +                              <&gcc GCC_AHB2PHY_USB_CLK>;
> > +                     clock-names = "com_aux",
> > +                                   "ref",
> > +                                   "cfg_ahb";
> > +                     resets = <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>,
> > +                              <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>;
> > +                     reset-names = "phy", "phy_phy";
> > +                     status = "disabled";
>
> Hm, you add a disabled PHY which is used by existing controller. The
> controller is enabled in board DTS, but new PHY node isn't. Aren't you
> now breaking it?

The USB controller is connected to two PHYs - one is HS PHY and the other is SS
QMP Phy. So while the exiting board dts describes and uses only the HS
PHY, newer
board dts files (which will soon be sent out as a separate patch),
will use both the HS and SS
USB PHYs.

So, this will not break the existing board dts files.

> > +
> > +                     usb_ssphy: phy@1615200 {
> > +                             reg = <0x01615200 0x200>,
> > +                                   <0x01615400 0x200>,
> > +                                   <0x01615c00 0x400>,
> > +                                   <0x01615600 0x200>,
> > +                                   <0x01615800 0x200>,
> > +                                   <0x01615a00 0x100>;
> > +                             #phy-cells = <0>;
> > +                             #clock-cells = <1>;
> > +                             clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> > +                             clock-names = "pipe0";
> > +                             clock-output-names = "usb3_phy_pipe_clk_src";
> > +                     };
> > +             };
> > +
> > +
>
> Just one blank line.

Ok, Will fix it in v2.

> >               qfprom@1b40000 {
> >                       compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
> >                       reg = <0x01b40000 0x7000>;
> > @@ -1023,8 +1057,8 @@ usb_dwc3: usb@4e00000 {
> >                               compatible = "snps,dwc3";
> >                               reg = <0x04e00000 0xcd00>;
> >                               interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
> > -                             phys = <&usb_hsphy>;
> > -                             phy-names = "usb2-phy";
> > +                             phys = <&usb_hsphy>, <&usb_ssphy>;
> > +                             phy-names = "usb2-phy", "usb3-phy";
> >                               iommus = <&apps_smmu 0x120 0x0>;
> >                               snps,dis_u2_susphy_quirk;
> >                               snps,dis_enblslpm_quirk;
>

Thanks,
Bhupesh
