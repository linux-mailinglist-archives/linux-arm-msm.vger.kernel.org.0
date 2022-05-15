Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30305527829
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 May 2022 16:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237170AbiEOOoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 May 2022 10:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbiEOOoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 May 2022 10:44:11 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D0D2183
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 07:44:09 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 60AA03F64E;
        Sun, 15 May 2022 16:44:07 +0200 (CEST)
Date:   Sun, 15 May 2022 16:44:00 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: sdm630: use defined symbols for
 interconnects
Message-ID: <20220515144400.uyaijmomlbocbsm3@SoMainline.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
 <20220513234518.3068480-7-dmitry.baryshkov@linaro.org>
 <20220514094510.yfpc7omljon4nrhs@SoMainline.org>
 <CAA8EJpoRMRzXvbe8yOdGwPiLsXVtJiZxkzSb4PU77d1Rt-a_rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoRMRzXvbe8yOdGwPiLsXVtJiZxkzSb4PU77d1Rt-a_rA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-14 15:51:55, Dmitry Baryshkov wrote:
> On Sat, 14 May 2022 at 12:45, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2022-05-14 02:45:16, Dmitry Baryshkov wrote:
> > > Replace numeric values with the symbolic names defined in the bindings
> > > header.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Seems there is one off-by-one copy-paste error.  With that addressed:
> >
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm630.dtsi | 23 ++++++++++++-----------
> > >  1 file changed, 12 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > > index 17a1877587cf..01a1a1703568 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > > @@ -8,6 +8,7 @@
> > >  #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
> > >  #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
> > >  #include <dt-bindings/clock/qcom,rpmcc.h>
> > > +#include <dt-bindings/interconnect/qcom,sdm660.h>
> > >  #include <dt-bindings/power/qcom-rpmpd.h>
> > >  #include <dt-bindings/gpio/gpio.h>
> > >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > @@ -1045,7 +1046,7 @@ adreno_gpu: gpu@5000000 {
> > >                       nvmem-cells = <&gpu_speed_bin>;
> > >                       nvmem-cell-names = "speed_bin";
> > >
> > > -                     interconnects = <&gnoc 1 &bimc 5>;
> > > +                     interconnects = <&gnoc MASTER_APSS_PROC &bimc SLAVE_EBI>;
> >
> > From qcom,sdm660.h:
> >
> >     /* GNOC */
> >     #define MASTER_APSS_PROC            0
> >     #define SLAVE_GNOC_BIMC                     1
> >     #define SLAVE_GNOC_SNOC                     2
> >
> > Seems like the left side should be SLAVE_GNOC_BIMC?  Unless this
> > semantic change is intended, in which case it should be clearly
> > documented in its own commit with a Fixes tag.
> 
> I don't think there can be a slave on the left side of the ICC path.
> But nice catch anyway. Downstream uses MSM_BUS_MASTER_GRAPHICS_3D
> here, which corresponds to <&bimc MASTER_OXILI>.
> Could you please double check this?

Agreed, my downstream source for this device also uses
MSM_BUS_MASTER_GRAPHICS_3D=26 with mas_rpm_id=ICBID_MASTER_GFX3D=6, and 
on the right-side MSM_BUS_SLAVE_EBI_CH0=512 which resolves to
slv_rpm_id=ICBID_SLAVE_EBI1=0.  Both on &bimc.

Have you double-checked all the other interconnect paths in this file?

- Marijn

> >
> > The rest looks correct.
> >
> > - Marijn
> [..]
