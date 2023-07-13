Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5285C751CAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 11:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbjGMJGY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 05:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234036AbjGMJGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 05:06:07 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678FD1FEE
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 02:05:10 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-ca3cc52ee62so434033276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 02:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689239108; x=1689843908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn6ei9/9nS3M5OJwomJN5UPa70NekYkgBc6ibiFgkyQ=;
        b=xXXWLGivZPS53UODz4dM7TyUnoncEK5FE86gyc4bHY71qNzZeJmJb7w06cH4dFSdQR
         P0x4CQqUTz9BiB+Qglq2I7MSPbtS+dJ5ItOA7QlFES435E7+Mf3mUb2I3tiNeoybdi7L
         DqkicFGq+98dJizdYCYAz5xzgciVAWvFO2uELgtAJEfzfSwCsf8HJCf3DOeenRLzQpqr
         9QqiWiDW3adGV24n9d4MOkj4Zzhj31CxxVZPlJcAMz2uIBY/biLf437FI+zp+L2HvZdc
         tfGxdpDL6IH4vvexo9VaKW2x2eLCLDNHNWPYV+6cpdg2jvB9cuWvfBiU2YH3FpL+uvdl
         2NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689239108; x=1689843908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xn6ei9/9nS3M5OJwomJN5UPa70NekYkgBc6ibiFgkyQ=;
        b=Ze3HLawWwgq7f3GqyAgjgeG9fPHb40jERqtXD86N4GcyX/Hj5AzDzitRIDMHTQ8jXa
         GCxeInvzbn/RwEH/zN3NA0V+a5gYlFacCxydeq/I1JuBDirk72/Knof3pABa6Nk7Diii
         Uu9ZCV3Wb9HF395hjgbe6jQutE6lxIOxemYs+9HcS0wA15qzlP5cgujbx7mYr+hO5VFq
         ACXyTn9LEgTHIQ1718TIVwPb/yEpCPu1FBM6OypaI3SzOLwv8iwBJJCNOLoxsAb/Jwve
         eDFQJl2L0Mx2EafR06TQ8hxfcU2iiHPOGoixAZklSTuo6seG+FLxMvhfUszU2xXlIxHc
         tb9A==
X-Gm-Message-State: ABy/qLYVlYYDO/7vuDhHxuTcXLGzWbUT4JDh57GpC3GyYaSUq2turMyp
        IfCqo72hXAOmYuIUR1qaAtEE1NRSdI+K7bVimiM2xQ==
X-Google-Smtp-Source: APBJJlGXJvvYoDza1StirRlGQElXF0pCyCiFnb5V8pzk8ik9XDgwvV9D9fD7+yABjfcZa47O94WvNoZjX60yu5f73II=
X-Received: by 2002:a25:aba2:0:b0:bad:125f:9156 with SMTP id
 v31-20020a25aba2000000b00bad125f9156mr895305ybi.35.1689239108637; Thu, 13 Jul
 2023 02:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
 <20230712121145.1994830-9-dmitry.baryshkov@linaro.org> <9587baf4-2316-494d-fbd1-73a86e742741@linaro.org>
In-Reply-To: <9587baf4-2316-494d-fbd1-73a86e742741@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 13 Jul 2023 12:04:57 +0300
Message-ID: <CAA8EJpqTBpUgpQSwhhLtctn=r8XwX-NwdFgUst3rARQSaGMrcg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8450: provide MDSS cfg interconnect
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Jul 2023 at 11:41, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 12.07.2023 14:11, Dmitry Baryshkov wrote:
> > Add support for the MDSS cfg-cpu bus vote on the SM8450 platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > index 595533aeafc4..0b01f3027ee3 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > @@ -13,6 +13,7 @@
> >  #include <dt-bindings/mailbox/qcom-ipcc.h>
> >  #include <dt-bindings/phy/phy-qcom-qmp.h>
> >  #include <dt-bindings/power/qcom-rpmpd.h>
> > +#include <dt-bindings/interconnect/qcom,icc.h>
> >  #include <dt-bindings/interconnect/qcom,sm8450.h>
> >  #include <dt-bindings/soc/qcom,gpr.h>
> >  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > @@ -2672,8 +2673,12 @@ mdss: display-subsystem@ae00000 {
> >
> >                       /* same path used twice */
> >                       interconnects = <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
> > -                                     <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>;
> > -                     interconnect-names = "mdp0-mem", "mdp1-mem";
> > +                                     <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
> > +                                     <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > +                                      &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> Looking at icc_set_tag occurences in msm-5.10/techpack/display,
> I *think* active-only is only possible for the data bus (MDP-EBI)

Here I followed the vendor mdss fbdev driver (mdss_mdp.c), which
explicitly states:

static struct msm_bus_scale_pdata mdp_reg_bus_scale_table = {
        .usecase = mdp_reg_bus_usecases,
        .num_usecases = ARRAY_SIZE(mdp_reg_bus_usecases),
        .name = "mdss_reg",
        .active_only = true,
};

>
> Moreover, I think Linux is supposed to cast MDSS votes through the
> APPS RSC (so, nodes without _DISP [1][2]) and conversely, DISP_RSC is
> supposed to active-only votes

We can change this once your DISP_RSC lands. Anyway, I think we will
have to add the LLCC-MEM vote at some point later.

>
> Konrad
>
> [1] not that it matters today because it's not implemented yet
> [2] https://lore.kernel.org/linux-arm-msm/20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org
>
> > +                     interconnect-names = "mdp0-mem",
> > +                                          "mdp1-mem",
> > +                                          "cpu-cfg";
> >
> >                       resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> >



-- 
With best wishes
Dmitry
