Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47629527901
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 May 2022 20:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237966AbiEOSF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 May 2022 14:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237964AbiEOSF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 May 2022 14:05:57 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8EC63E7
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 11:05:55 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id k8so10885916qki.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLlUW8vEjuV4DBvfCOgOpFfi++rFu5yf8AmltTgzK/Y=;
        b=WYbwC4zIu7xjYVp6t7h8P4LPzGQ+uZfJGswn+Z54rii4PFXAQDI6A2RExHxU19m8fw
         4hMirxm4bfNpHsQzZo7fZ9jllC3YuvypTVBnmlIZWsyAs702NDTql5JSHG2eLO08iVlj
         wzhYZbBaL83hqjZI5AemGktmDi8vg9OA6edIcLZhV+MNjWcw15ohK6KY0DNacI02IVgw
         kyB4zFU0ABvvY+7bsqs6xCk2aXxjNlra6X2xRHfKW23oZqcLdIMifTTubbEws58hmkFm
         QO2A8BTvShfkHPhI9Rw5xYZ69EWe++a+WHqI0wsnIhGHty7V5oZGCc/EpXNHeFB1klDN
         nJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLlUW8vEjuV4DBvfCOgOpFfi++rFu5yf8AmltTgzK/Y=;
        b=7HAu/pLJRCJTe8MuAIXFnpU+yiehW7z+xYg2cJqECwaFC+wyJDCaIo07oC3zotXZr+
         O51sRxLn+GoG8oBqG3phy7fk3HJ0AoDjb+EqesHu28fyr0TlQyNyAW4OEe/cZAUo8hHT
         f/LGJ8otFYpmpBRLA3ocM6tLz0yvpGsmaeCB1OEiRd2y2f6DIBkv9xPAXhknJnb88OvU
         mrVq0QFOs714KlhaVrRge1kJdsC/6XGO4x9Qet+2/KrOBC/wKUa1LI4PbJQyrMGTgI+2
         UULdbFO9Wm690uIpNRrQqIQ9yvbc4UFXXLrtpq0ph7u5E0lkRdk+G0/gD5Ea62MZQpwO
         EG3A==
X-Gm-Message-State: AOAM5305J8UvntggsCZwEqKB5GIC2U85cMi738b1J6URJiwEN3m+PcMV
        y8NvWwdSRrxhjK5WkrJh7+1xGmUg9CSqHh4oWfGvqw==
X-Google-Smtp-Source: ABdhPJwE5huig4V8dQ9xYjZfx0KC2zPJTHJmoCoCmJFAaX4AsZWEFGvA6YYxzpd3r0o7UX4A115fla+faK3JqAIZaxA=
X-Received: by 2002:a05:620a:12e5:b0:69f:e82e:3021 with SMTP id
 f5-20020a05620a12e500b0069fe82e3021mr10156011qkl.59.1652637955101; Sun, 15
 May 2022 11:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
 <20220513234518.3068480-7-dmitry.baryshkov@linaro.org> <20220514094510.yfpc7omljon4nrhs@SoMainline.org>
 <CAA8EJpoRMRzXvbe8yOdGwPiLsXVtJiZxkzSb4PU77d1Rt-a_rA@mail.gmail.com> <20220515144400.uyaijmomlbocbsm3@SoMainline.org>
In-Reply-To: <20220515144400.uyaijmomlbocbsm3@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 15 May 2022 21:05:44 +0300
Message-ID: <CAA8EJpojr4+csDHZL4EiBuXdBH1iXkZb3nkvoR6uEce3-Ru6kg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: sdm630: use defined symbols for interconnects
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 15 May 2022 at 17:44, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2022-05-14 15:51:55, Dmitry Baryshkov wrote:
> > On Sat, 14 May 2022 at 12:45, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > On 2022-05-14 02:45:16, Dmitry Baryshkov wrote:
> > > > Replace numeric values with the symbolic names defined in the bindings
> > > > header.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Seems there is one off-by-one copy-paste error.  With that addressed:
> > >
> > > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sdm630.dtsi | 23 ++++++++++++-----------
> > > >  1 file changed, 12 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > > > index 17a1877587cf..01a1a1703568 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > > > @@ -8,6 +8,7 @@
> > > >  #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
> > > >  #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
> > > >  #include <dt-bindings/clock/qcom,rpmcc.h>
> > > > +#include <dt-bindings/interconnect/qcom,sdm660.h>
> > > >  #include <dt-bindings/power/qcom-rpmpd.h>
> > > >  #include <dt-bindings/gpio/gpio.h>
> > > >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > @@ -1045,7 +1046,7 @@ adreno_gpu: gpu@5000000 {
> > > >                       nvmem-cells = <&gpu_speed_bin>;
> > > >                       nvmem-cell-names = "speed_bin";
> > > >
> > > > -                     interconnects = <&gnoc 1 &bimc 5>;
> > > > +                     interconnects = <&gnoc MASTER_APSS_PROC &bimc SLAVE_EBI>;
> > >
> > > From qcom,sdm660.h:
> > >
> > >     /* GNOC */
> > >     #define MASTER_APSS_PROC            0
> > >     #define SLAVE_GNOC_BIMC                     1
> > >     #define SLAVE_GNOC_SNOC                     2
> > >
> > > Seems like the left side should be SLAVE_GNOC_BIMC?  Unless this
> > > semantic change is intended, in which case it should be clearly
> > > documented in its own commit with a Fixes tag.
> >
> > I don't think there can be a slave on the left side of the ICC path.
> > But nice catch anyway. Downstream uses MSM_BUS_MASTER_GRAPHICS_3D
> > here, which corresponds to <&bimc MASTER_OXILI>.
> > Could you please double check this?
>
> Agreed, my downstream source for this device also uses
> MSM_BUS_MASTER_GRAPHICS_3D=26 with mas_rpm_id=ICBID_MASTER_GFX3D=6, and
> on the right-side MSM_BUS_SLAVE_EBI_CH0=512 which resolves to
> slv_rpm_id=ICBID_SLAVE_EBI1=0.  Both on &bimc.
>
> Have you double-checked all the other interconnect paths in this file?

Hmmmmm.

SDHCs also seem to be incorrect. For sdhc_1 downstream uses
<MSM_BUS_MASTER_SDCC_1 MSM_BUS_SLAVE_EBI_CH0>,
<MSM_BUS_MASTER_AMPSS_M0 MSM_BUS_SLAVE_SDCC_1>.
For the upstream kernel this translates to <&a2noc MASTER_SDCC_1 &bimc
SLAVE_EBI>, <&gnoc MASTER_APSS_PROC &cnoc SLAVE_SDCC_1> (while we have
<&a2noc MASTER_SDCC_1 &a2noc SLAVE_A2NOC_SNOC>, <&gnoc
MASTER_APSS_PROC &cnoc SLAVE_SDCC_1>). Same applies for the sdhc2.

AngeloGioacchino, since SDHC interconnects were added by you, could
you please check?

For camss I suppose that downstream uses MASTER_CPP rather than
MASTER_VFE. If I'm not mistaken.

For venus the downstream path is equivalent <&mnoc MASTER_VENUS &bimc
SLAVE_EBI> (which we have here). vidc describes <&gnoc
MASTER_APSS_PROC &mnoc SLAVE_VENUS_CFG>. So venus cfg looks correct.

>
> - Marijn
>
> > >
> > > The rest looks correct.
> > >
> > > - Marijn
> > [..]



-- 
With best wishes
Dmitry
