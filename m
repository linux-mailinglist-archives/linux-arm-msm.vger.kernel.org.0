Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB50C52710F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 14:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbiENMwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 08:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbiENMwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 08:52:08 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398331A048
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 05:52:07 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id kl21so8844187qvb.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AxOmAckUiuRWVJ0OgGOQtZevonWzdnMCl3bUMEVAUGE=;
        b=CwlkHTG+mux25rynInAgCk/m0PUJ0PChvnXJ6FDmDsXB5gzNusl7VhLfVRZiwY4CLl
         kqyWzhPqCgw0OcpCh7wCvLSNxzn6Iw/oUCaiaZ7X0JMxCTw6lTtv91ba18hZDhR0c4sc
         /xp4T9itG1PxTs9CyNO0VqWAua2CKfKBbhWHxqIEPEMT2o5fyznl5faKBBYpP0GwSNz3
         DEDa0+nKU3b9Kv45FaY9ctfiEIxrILmzIUly6StamHsc5Eoc9V2sN3tno5959N9QlhwC
         8ye+HUDXRfHQVcVCT8tQWudHsuaNaO4NoQEAQ9FNTxLOgV2jMO7oI8P1AfDXWB30OaqG
         fIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AxOmAckUiuRWVJ0OgGOQtZevonWzdnMCl3bUMEVAUGE=;
        b=Gn/a3H/tE/9DChXnhRWiQhxyS1hj3J7x5pJfS1UQmu3V5vTpJEn+vf8CZVDu9pCX8z
         dqcd/WEGA/ofDRtkaWpc6pQYQ+sg0ff+pgwiMfJJ39iAcTgmy80vnCzWOq7x5WyNhojd
         R52L2FhaVmSe7qu2zlZ9lknv5VX1azqwgb4Hxk2gtLS0SiC+8V9x5o6Qh2bysF+v6lmc
         T/vxR3RPrQGVB9JmFy0w0odKYahW3Q9yei/ybC2oSEsRAWZigLdklM9zK+ge1g69gKah
         kKndgQnTQ7SBmy09XAJHSD77jnv7cxu+XC8sAXrxXHR4owlz+zAYPi609lGWgwbPjNvN
         hHtg==
X-Gm-Message-State: AOAM531Va7saT83Lb9Pmw+gi2YN2D9vAeD3q3ZW2eVFUihFSIFg5QGXI
        7MUV372Kln5xIxU9rERZdgWUv2Gqq0fjEcfepTNphA==
X-Google-Smtp-Source: ABdhPJxDSYXKcBGkKH9XOka4I1hQt4prQ+g6v0RBZK4pQd1zcTJm0sg24cKKCCPSbURKYeJ2VlL5TYxuj5i72ZySjYA=
X-Received: by 2002:ad4:5f4e:0:b0:45a:b97d:14de with SMTP id
 p14-20020ad45f4e000000b0045ab97d14demr8060996qvg.73.1652532726367; Sat, 14
 May 2022 05:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
 <20220513234518.3068480-7-dmitry.baryshkov@linaro.org> <20220514094510.yfpc7omljon4nrhs@SoMainline.org>
In-Reply-To: <20220514094510.yfpc7omljon4nrhs@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 14 May 2022 15:51:55 +0300
Message-ID: <CAA8EJpoRMRzXvbe8yOdGwPiLsXVtJiZxkzSb4PU77d1Rt-a_rA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: sdm630: use defined symbols for interconnects
To:     Marijn Suijten <marijn.suijten@somainline.org>
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

On Sat, 14 May 2022 at 12:45, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2022-05-14 02:45:16, Dmitry Baryshkov wrote:
> > Replace numeric values with the symbolic names defined in the bindings
> > header.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Seems there is one off-by-one copy-paste error.  With that addressed:
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm630.dtsi | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > index 17a1877587cf..01a1a1703568 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > @@ -8,6 +8,7 @@
> >  #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
> >  #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
> >  #include <dt-bindings/clock/qcom,rpmcc.h>
> > +#include <dt-bindings/interconnect/qcom,sdm660.h>
> >  #include <dt-bindings/power/qcom-rpmpd.h>
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > @@ -1045,7 +1046,7 @@ adreno_gpu: gpu@5000000 {
> >                       nvmem-cells = <&gpu_speed_bin>;
> >                       nvmem-cell-names = "speed_bin";
> >
> > -                     interconnects = <&gnoc 1 &bimc 5>;
> > +                     interconnects = <&gnoc MASTER_APSS_PROC &bimc SLAVE_EBI>;
>
> From qcom,sdm660.h:
>
>     /* GNOC */
>     #define MASTER_APSS_PROC            0
>     #define SLAVE_GNOC_BIMC                     1
>     #define SLAVE_GNOC_SNOC                     2
>
> Seems like the left side should be SLAVE_GNOC_BIMC?  Unless this
> semantic change is intended, in which case it should be clearly
> documented in its own commit with a Fixes tag.

I don't think there can be a slave on the left side of the ICC path.
But nice catch anyway. Downstream uses MSM_BUS_MASTER_GRAPHICS_3D
here, which corresponds to <&bimc MASTER_OXILI>.
Could you please double check this?

>
> The rest looks correct.
>
> - Marijn
>
> >                       interconnect-names = "gfx-mem";
> >
> >                       operating-points-v2 = <&gpu_sdm630_opp_table>;
> > @@ -1299,8 +1300,8 @@ sdhc_2: sdhci@c084000 {
> >                                       <&xo_board>;
> >                       clock-names = "core", "iface", "xo";
> >
> > -                     interconnects = <&a2noc 3 &a2noc 10>,
> > -                                     <&gnoc 0 &cnoc 28>;
> > +                     interconnects = <&a2noc MASTER_SDCC_2 &a2noc SLAVE_A2NOC_SNOC>,
> > +                                     <&gnoc MASTER_APSS_PROC &cnoc SLAVE_SDCC_2>;
> >                       operating-points-v2 = <&sdhc2_opp_table>;
> >
> >                       pinctrl-names = "default", "sleep";
> > @@ -1351,8 +1352,8 @@ sdhc_1: sdhci@c0c4000 {
> >                                <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> >                       clock-names = "core", "iface", "xo", "ice";
> >
> > -                     interconnects = <&a2noc 2 &a2noc 10>,
> > -                                     <&gnoc 0 &cnoc 27>;
> > +                     interconnects = <&a2noc MASTER_SDCC_1 &a2noc SLAVE_A2NOC_SNOC>,
> > +                                     <&gnoc MASTER_APSS_PROC &cnoc SLAVE_SDCC_1>;
> >                       interconnect-names = "sdhc1-ddr", "cpu-sdhc1";
> >                       operating-points-v2 = <&sdhc1_opp_table>;
> >                       pinctrl-names = "default", "sleep";
> > @@ -1525,9 +1526,9 @@ mdp: mdp@c901000 {
> >                                             "core",
> >                                             "vsync";
> >
> > -                             interconnects = <&mnoc 2 &bimc 5>,
> > -                                             <&mnoc 3 &bimc 5>,
> > -                                             <&gnoc 0 &mnoc 17>;
> > +                             interconnects = <&mnoc MASTER_MDP_P0 &bimc SLAVE_EBI>,
> > +                                             <&mnoc MASTER_MDP_P1 &bimc SLAVE_EBI>,
> > +                                             <&gnoc MASTER_APSS_PROC &mnoc SLAVE_DISPLAY_CFG>;
> >                               interconnect-names = "mdp0-mem",
> >                                                    "mdp1-mem",
> >                                                    "rotator-mem";
> > @@ -2034,7 +2035,7 @@ camss: camss@ca00000 {
> >                               "cphy_csid1",
> >                               "cphy_csid2",
> >                               "cphy_csid3";
> > -                     interconnects = <&mnoc 5 &bimc 5>;
> > +                     interconnects = <&mnoc MASTER_VFE &bimc SLAVE_EBI>;
> >                       interconnect-names = "vfe-mem";
> >                       iommus = <&mmss_smmu 0xc00>,
> >                                <&mmss_smmu 0xc01>,
> > @@ -2097,8 +2098,8 @@ venus: video-codec@cc00000 {
> >                                <&mmcc VIDEO_AXI_CLK>,
> >                                <&mmcc THROTTLE_VIDEO_AXI_CLK>;
> >                       clock-names = "core", "iface", "bus", "bus_throttle";
> > -                     interconnects = <&gnoc 0 &mnoc 13>,
> > -                                     <&mnoc 4 &bimc 5>;
> > +                     interconnects = <&gnoc MASTER_APSS_PROC &mnoc SLAVE_VENUS_CFG>,
> > +                                     <&mnoc MASTER_VENUS &bimc SLAVE_EBI>;
> >                       interconnect-names = "cpu-cfg", "video-mem";
> >                       interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> >                       iommus = <&mmss_smmu 0x400>,
> > --
> > 2.35.1
> >



-- 
With best wishes
Dmitry
