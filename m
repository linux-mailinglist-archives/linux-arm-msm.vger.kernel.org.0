Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96EC74E59CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 21:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344617AbiCWU1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 16:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344614AbiCWU1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 16:27:32 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4814B8BF18
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 13:26:01 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-de3ca1efbaso2897452fac.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hCqTymlzZq7d2LM/hJ6WXqavnWTYg5mQtD7l1RPuIts=;
        b=XrkTSLNvhIyRpFRWZXwx7u0voib5AhADVRacw7VLJ8YrqKFvP2H4PPHas0lIE6B0ja
         leMn3hA6hiwh5+pR0TF9Xy8HM+M3npF11/BU3cuWsG8mBs4a4Y5zIqiQPA5N1ZQ+FWyd
         G3BFGEEEeJA2H3u1LrQ5ssnCbDLLVIzT1bQShTDFobC9mD83gEBa0ssWJFDZoSJcPxgv
         0FTVWmUUEDSc9XosPsYV3Xey3obXsuqpNiPWAKNoCJ5l3zl8vfNQ3avq7Qj/tY0Qu+RF
         LcMhvy4Db1mzqZjvMBC/GJmplgYjxcRMGgTI41NkkwQ41zWeMj4jI4t6lkVTs0hGEssW
         ndGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hCqTymlzZq7d2LM/hJ6WXqavnWTYg5mQtD7l1RPuIts=;
        b=4qEi52+9j1Hsw3BlDl0f0Co28HYIHh9/jJFabSFFfa4dAaH5xX6maFUZHTUZiu63Sw
         +MXKpreWmlOu5D3vJ8s3aJEZpdjGbRFZYaPN403F4kP2e8Fxfl0y0XxW2wTVRAIVb2Tt
         Ow8RmJ6Qm6wHv1hceyr16Zw3X80t0id3OrTrkQbEB9jcXTa5WgJ0YH5ZCIuOZZH6epSH
         ttav0rQNIs+JOGnouRrYzmFXBSjDQDneZ3LLrYVmcOCinUBEUF2ySkwripHDeG5fmSQH
         qVZA4NwnSAZk1wJpJ6WLZcDUXiq/rcPNIIJNcuWRtAomhYmMMXP4Gy9KFNt+ieLUK2bB
         7GEg==
X-Gm-Message-State: AOAM533lIMe+B4sPSPZ/rViCldaOlghhVFpR7gwbShuqVb3gdGRf7M/p
        PfHguVI5o4aKVV5AgVB1dFEfdNAChorr8cPxfqnQbg==
X-Google-Smtp-Source: ABdhPJxK5PCrm7se+j7JSsX7TwXXNoSnhIA+aCnhYBRmctAV/BHIhyyHjA7emMsyezHB1yJ5PP7/jemHq9ZV8OeGASI=
X-Received: by 2002:a05:6870:a44c:b0:de:230:730b with SMTP id
 n12-20020a056870a44c00b000de0230730bmr905684oal.48.1648067160504; Wed, 23 Mar
 2022 13:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220303082140.240745-1-bhupesh.sharma@linaro.org>
 <20220303082140.240745-3-bhupesh.sharma@linaro.org> <CAA8EJpqF5ppEc7-ngvpQifUaGLuvguUS+EKofwwuYe2edOhSbQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqF5ppEc7-ngvpQifUaGLuvguUS+EKofwwuYe2edOhSbQ@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 24 Mar 2022 01:55:49 +0530
Message-ID: <CAH=2NtxWE+9cTz=yTMH=kr3Y2iehZxH22KGkOZ9V2LpakOq+-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8150: Add ufs power-domain entries
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        Rob Herring <robh@kernel.org>
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

Hi Dmitry,

On Thu, 3 Mar 2022 at 16:02, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 3 Mar 2022 at 11:22, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> >
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
> >                         phy-names = "ufsphy";
> >                         lanes-per-direction = <2>;
> >                         #reset-cells = <1>;
> > +
> > +                       power-domains = <&gcc UFS_PHY_GDSC>;
> >                         resets = <&gcc GCC_UFS_PHY_BCR>;
> >                         reset-names = "rst";
> >
> > @@ -1687,6 +1689,9 @@ ufs_mem_phy: phy@1d87000 {
> >                         clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
> >                                  <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> >
> > +                       power-domains = <&gcc UFS_CARD_GDSC>,
> > +                                       <&gcc UFS_PHY_GDSC>;
> > +                       power-domain-names = "ufs_card_gdsc", "ufs_phy_gdsc";
>
> This will not work, if I'm not mistaken. Platform drivers won't bind
> two power-domains by default. And the qmp driver lacks handling for
> power domains.
>
> Also a generic question. I see that other platforms use UFS_PHY_GDSC
> for the host controller and completely ingore the UFS_CARD_GDSC. What
> makes sm8150 so different from the rest of the platforms?

You are right. I used the UFS power-domain constructs presently used
downstream, but I think using UFS_PHY_GDSC only is sufficient for our
use case upstream.

So, I will send a fixed v4 version.

Thanks,
Bhupesh

> >                         resets = <&ufs_mem_hc 0>;
> >                         reset-names = "ufsphy";
> >                         status = "disabled";
> > --
> > 2.35.1
> >
>
>
> --
> With best wishes
> Dmitry
