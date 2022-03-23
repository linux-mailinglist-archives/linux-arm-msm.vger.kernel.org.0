Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0AD34E59D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 21:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344622AbiCWU2S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 16:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242879AbiCWU2S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 16:28:18 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EED8A31B
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 13:26:47 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-de3ca1efbaso2899436fac.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CY3l8jrztmr/FmAYRC1PzFMTrDaC/FmA5umCglNQWzo=;
        b=IlojxJRbztX44z+MNWRzeHglp+pkBe0M5oL2i6Rju4lgn04LPaBdCKbcbJicv3H4jD
         Waxy6v8s3xktxMzX1+py/+mX3o6a1jjeF/atySr3zYZvWQfVQYqvwLYZ3z8AvfS1l3gL
         NUPfHl4vH2+GipPR2TsuHGkCjZgltMHc82ow7EfJxM5dv/0FWoWE3HSnShK2/CQbM6GF
         /eTftPZmpctH2pjdnvKGROplxofKGqICS7JxZzyEYkvZlETE9H38ZsuzwhuPz9rQDmK4
         xVySXS3WBuA61ZY541maNfWwuuSNorRPRGlRQZ6Fnj8z6DwuTdl58YFr09WgzEXuwQRh
         pSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CY3l8jrztmr/FmAYRC1PzFMTrDaC/FmA5umCglNQWzo=;
        b=eWLkCmela8xudbGp1+ZlmYG0XVpHargN2zjc14xfBsK5t3iPqMPeMAI/7bFOaHsggS
         +EksFo4B3IvBaWUj7qeXmykP2kpVlATP6FbprEV2D4/96D+brWB+qxJTehZ+4cMSrsvB
         P44sC0Yy55bywMmx8GH8do4JtZyDd74wQt+Vtd+Fhp4dBXVnJeW7VxhXMK0ASvDAfT3X
         DHbAq9oI/RVhvHF4kDKlvE6ssJTdM2z8oQ5/q31uo51LwHrtMPjvR+0nfa6ZuuBdRCtz
         mbfZbWF2ggCtoxO7aRdOx5rgpuD/Tmy0pBM+9gsGrIJlQ2R7akB/B3VWENTpFUj4j0Wo
         nAiQ==
X-Gm-Message-State: AOAM531coV2wErQEwhZLBae2yhnh4i0Qskx7Z93AVqETvA1qSupAz0CA
        hodvUdxAHtqS/ROa/yUBaT5ryLsNsxQV/jwTKn1IRg==
X-Google-Smtp-Source: ABdhPJwGYjGEvB3uK5JSPiSaZi1AWFpDFPAHkUfpMxUdAMM7thqAGq7S5c50Og7rtJA2STFokZsz3eMKUTKBUXZI4h0=
X-Received: by 2002:a05:6870:a44c:b0:de:230:730b with SMTP id
 n12-20020a056870a44c00b000de0230730bmr906724oal.48.1648067207061; Wed, 23 Mar
 2022 13:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220303082140.240745-1-bhupesh.sharma@linaro.org>
 <20220303082140.240745-3-bhupesh.sharma@linaro.org> <YifhMiBXRMOCamOt@builder.lan>
In-Reply-To: <YifhMiBXRMOCamOt@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 24 Mar 2022 01:56:35 +0530
Message-ID: <CAH=2NtwVfA_OyfV3vopOWqbgv_T==Fdx-P60EniR9qYuvOnAsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8150: Add ufs power-domain entries
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Wed, 9 Mar 2022 at 04:35, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Thu 03 Mar 02:21 CST 2022, Bhupesh Sharma wrote:
>
> > Add power-domain entries for UFS controller & phy nodes
> > in sm8150 dts.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 6012322a5984..7aa879eb24d7 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -1637,6 +1637,8 @@ ufs_mem_hc: ufshc@1d84000 {
> >                       phy-names = "ufsphy";
> >                       lanes-per-direction = <2>;
> >                       #reset-cells = <1>;
> > +
> > +                     power-domains = <&gcc UFS_PHY_GDSC>;
>
> It seems odd that the controller would be in the PHY power-domain?

Ok.

> >                       resets = <&gcc GCC_UFS_PHY_BCR>;
> >                       reset-names = "rst";
> >
> > @@ -1687,6 +1689,9 @@ ufs_mem_phy: phy@1d87000 {
> >                       clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
> >                                <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> >
> > +                     power-domains = <&gcc UFS_CARD_GDSC>,
> > +                                     <&gcc UFS_PHY_GDSC>;
>
> And "card" is typically related to the second UFS interface, so I
> suspect you only would need the last one of these?

Right, I will send a fixed v4 version shortly.

Thanks,
Bhupesh

> > +                     power-domain-names = "ufs_card_gdsc", "ufs_phy_gdsc";
> >                       resets = <&ufs_mem_hc 0>;
> >                       reset-names = "ufsphy";
> >                       status = "disabled";
> > --
> > 2.35.1
> >
