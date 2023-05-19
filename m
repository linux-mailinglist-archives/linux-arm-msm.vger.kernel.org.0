Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D310070955C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 12:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjESKtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 06:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjESKtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 06:49:31 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF164E45
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:49:29 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f4c6c4b425so19558135e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684493368; x=1687085368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=frnZejZtlcBkz8MuJjU1QiMoUPiymUDXTaMRj7RUn0c=;
        b=QnzHVl2fZTJYZmbDka04syMJsNo3kQ29ci8v6N2h64mpn2gXEp1XlGkMApvPw419Bn
         QUUEo1MRtBqcdFled/xc0MNK1w+dyz633PBl99OgaI5u55d+RKniUHOry/Dg3hHtyFnR
         t9R1TksO6+GQTqpKYOnreUH9k/2ijcygNgnVTADD8JSmcWEt+It0rc8ETpj4Kb+oOi1Y
         nnElQ0k4b7UzpciXD/vI6k5keHbbWC6uEnz6LIayzZQuxxt0rXIz5IqGyh1Vf0ot3tT/
         c+a9MYJAsOzWKdzYbEy6YnRQpWNHMqXyQRajtpSSp6OZWRQdz/RV18GPZ/pE/T47xy2Z
         S2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684493368; x=1687085368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frnZejZtlcBkz8MuJjU1QiMoUPiymUDXTaMRj7RUn0c=;
        b=PSKdKVdscNwmaBm4QhMnIoPM8Puyeu1EnQpJagotxGCxmE9qYAFmMvvSPSh2iOS7F8
         6Ojlz0lW6GqOjznxXlIiuW5TvvVvtABCDmRoFjXNu8R5HxqGPQRlbvyEiDWjB3ruGKuN
         7tFsMEMjmxQmxUrE/ZtJZGmgP8IdwVCrvO1xPRTr1kLtgwSiqEuKVwrXGbIcqvdpEGhg
         a1QrZzAJT6WnZGbzk7pv17n/US8SMtIB7Ib6/f6hw9bfvw5rhSPYZihIo9JQyQrMbvOX
         EQX9kjZJzzBiiF/d46KyeO0BNYQGtepGSB3rwnCLOvAFdnbrpb2wD07l0WwA9Z2FmTVf
         vNrA==
X-Gm-Message-State: AC+VfDxWUgWbh7UKW4QTdP+bWlovpFXuiLXeDRe6yeakcN+fW5TgdamX
        8GEsx2eTeo17V+JAWXLQWTq9z30ffYfJWRm/zgQULw==
X-Google-Smtp-Source: ACHHUZ6Lxe/rWQ0fC0AGel3DnodQYHpv4BdY+wS1q90nJ9PW51oWqj5db5VaO1KDzFX0PB380dVLziguDoFu8Kxyjsg=
X-Received: by 2002:a1c:7503:0:b0:3f4:fffc:cd74 with SMTP id
 o3-20020a1c7503000000b003f4fffccd74mr1053421wmc.16.1684493368353; Fri, 19 May
 2023 03:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230405072836.1690248-1-bhupesh.sharma@linaro.org>
 <20230405072836.1690248-8-bhupesh.sharma@linaro.org> <ZGdLCdSof027mk5u@gerhold.net>
 <CAH=2Ntx4H+hOzYLWqiogdBGE+rQ2XayrweE_P8T8gVE0zbwzeg@mail.gmail.com> <8c754bc2-abb3-faaa-0ab5-2c1991dfc2a6@linaro.org>
In-Reply-To: <8c754bc2-abb3-faaa-0ab5-2c1991dfc2a6@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 19 May 2023 16:19:17 +0530
Message-ID: <CAH=2NtyUNJFMbrhvP9BjmzdsLj9kvSYUH_ueAPUan9GRKaq2Xw@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sm6115: Add Crypto Engine support
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 19 May 2023 at 16:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 19.05.2023 12:22, Bhupesh Sharma wrote:
> > Hi Stephan,
> >
> > On Fri, 19 May 2023 at 15:40, Stephan Gerhold <stephan@gerhold.net> wrote:
> >>
> >> Hi Bhupesh,
> >>
> >> Not sure if this is the latest version of this series since it's pretty
> >> old but I didn't find a new one. Just came here because you mentioned
> >> RB1/RB2 [1] in my bam_dma patch and they don't have any BAM defined
> >> upstream yet.
> >>
> >> [1]: https://lore.kernel.org/linux-arm-msm/CAH=2Ntw0BZH=RGp14mYLhX7D6jV5O5eDKRQbby=uCy85xMDU_g@mail.gmail.com/
> >>
> >> On Wed, Apr 05, 2023 at 12:58:32PM +0530, Bhupesh Sharma wrote:
> >>> Add crypto engine (CE) and CE BAM related nodes and definitions to
> >>> 'sm6115.dtsi'.
> >>>
> >>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 22 ++++++++++++++++++++++
> >>>  1 file changed, 22 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> >>> index 2a51c938bbcb..ebac026b4cc7 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> >>> @@ -650,6 +650,28 @@ usb_hsphy: phy@1613000 {
> >>>                       status = "disabled";
> >>>               };
> >>>
> >>> +             cryptobam: dma-controller@1b04000 {
> >>> +                     compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> >>> +                     reg = <0x0 0x01b04000 0x0 0x24000>;
> >>> +                     interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> >>> +                     #dma-cells = <1>;
> >>> +                     qcom,ee = <0>;
> >>> +                     qcom,controlled-remotely;
> >>> +                     num-channels = <8>;
> >>> +                     qcom,num-ees = <2>;
> >>> +                     iommus = <&apps_smmu 0x94 0x11>,
> >>> +                              <&apps_smmu 0x96 0x11>;
> >>> +             };
> >>> +
> >>> +             crypto: crypto@1b3a000 {
> >>> +                     compatible = "qcom,sm6115-qce", "qcom,sm8150-qce", "qcom,qce";
> >>> +                     reg = <0x0 0x01b3a000 0x0 0x6000>;
> >>> +                     dmas = <&cryptobam 6>, <&cryptobam 7>;
> >>> +                     dma-names = "rx", "tx";
> >>> +                     iommus = <&apps_smmu 0x94 0x11>,
> >>> +                              <&apps_smmu 0x96 0x11>;
> >>
> >> Shouldn't you have clocks = <&rpmcc RPM_SMD_CE1_CLK> here to make sure
> >> the clock for the crypto engine is on? Your binding patch (PATCH 06/11)
> >> says "Crypto Engine block on Qualcomm SoCs SM6115 and QCM2290 do not
> >> require clocks strictly" but doesn't say why.
> >>
> >> Make sure you don't rely on having rpmcc keep unused clocks on
> >> permanently. This is the case at the moment, but we would like to change
> >> this [2]. Adding new users that rely on this broken behavior would just
> >> make this effort even more complicated.
> >>
> >> If you also add the clock to the cryptobam then you should be able to
> >> see the advantage of my bam_dma patch [3]. It allows you to drop
> >> "num-channels" and "qcom,num-ees" from the cryptobam in your changes
> >> above because it can then be read directly from the BAM registers.
> >
> > Thanks for pointing this out. Actually that's why I was using your
> > patch while testing with RB1/RB2 :)
> >
> > Yes, so the background is that I am preparing a new version of this
> > crypto enablement patchset.
> > Also your assumption about the clocks being turned on by the firmware
> > is true for RB1/RB2 devices, so enabling them via Linux is optional as
> > per Qualcomm enggs.
> This is not necessarily true. Currently it's kept always-on on
> by clk_smd_rpm_handoff, but that's a hack from 10 years ago when smd
> was still new.
>
> >
> > So, I am testing the new patchset right now with 'clock' entries
> > provided in the .dtsi and see if that causes any issue / improvement
> > (etc.)
> It won't change since it's on anyway, but that won't be a given for long.

Right, so that's what I observe: RPM_SMD_CE1_CLK is always on by the
time crypto _probe gets called.
So, IMO let's not mix this patchset with the other fix which probably
will fix the 10-year old clk_smd_rpm handoff keeping
these clocks on.

Probably that should be a separate changeset - requiring very thorough
checks to make sure that we don't break
working platforms.

Thanks.
