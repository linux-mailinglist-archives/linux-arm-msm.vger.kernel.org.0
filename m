Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BBC5176E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 20:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiEBS4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 14:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiEBS4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 14:56:30 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA2E6243
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 11:53:00 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id f38so27629565ybi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 11:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=16c6LoufbePye4HWJelwY8ht2KeqIsEnJnUl7uB1SQc=;
        b=jqr/xBWlNNErNwhynK5voUQvHR1NxmJKCd1Z7Qaq7g8Fb/GQwUCF9IIYtRUdR4YEr1
         nynxZJexdSKlnY74XeujEogng80z2pYDihQOFgV9ELs3hmMgVY2onPj671j5ddbgB9BG
         5/73p2GcfcxDWOy7wLz3h8l2tfPvAvPrDCQ+BE6Xk/5o0lgsvz3nCKU4AYeAVLlonsSL
         Z2JmYA8dzKlG1beSvj5MMiTcw+WRqp7qLXLSERFy0/KcT8VMBSgKEIVz69YMhpgFGSjJ
         vtGTnIbSnPEYsaroJpHICAhU/ENy4/ZJoL9sDV2o5RbMXmPW+qBFDmoBLK9/uwqgjrJy
         fY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=16c6LoufbePye4HWJelwY8ht2KeqIsEnJnUl7uB1SQc=;
        b=3FUP25hFZcd1hC1VXeCKZBGPV+XiVu3UYuDcOJr/vPOpHC8llS9aZZILvHk+/VDHuf
         a7Xzv5KXEw161dJGFU30YL32XnQjkZxr3PTnHaN2zWIuO5kSejnKCbVGVlQg5low/811
         WlhvoQh7pcEjzOi4LbJEltqGPxGD/WBzOBli1PkCI0WFtFzTZRfffuKqDxAqpqcjbgFm
         P+kJ5JB5SMyMh3rK9IFf/jgnDyuO//GAhhWd7X6vgbP2it9jvTb/GIqW52uAX+W695wn
         eYZwep6KXHXos8jA4jo17JcoBYEMu+fo7loDmQdK/ops66atxbt/9SvbPbqSCLpyVQJj
         LBUA==
X-Gm-Message-State: AOAM530bg1CqGqwzYtBOw97lzFTTubAuM8ZCnblCNIZBa150zBBdVI4V
        80+1dJLzWp0iTbdIboR1H4omQ1ctW0SW7y+V3u2grA==
X-Google-Smtp-Source: ABdhPJzU+LBvikaPdp/AbP+b+aZ/afUryXUeK+51Yu6+TQyUdZFvwMSvJ2yZNRnIbcwvzfRr0QLLkvsrGpaMC605bhw=
X-Received: by 2002:a25:84c1:0:b0:63e:7733:f95a with SMTP id
 x1-20020a2584c1000000b0063e7733f95amr10517577ybm.234.1651517579694; Mon, 02
 May 2022 11:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220501195042.4132724-1-dmitry.baryshkov@linaro.org> <4824d621-5840-6535-dc8f-1f20ee35d96b@somainline.org>
In-Reply-To: <4824d621-5840-6535-dc8f-1f20ee35d96b@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 2 May 2022 21:52:48 +0300
Message-ID: <CAA8EJpoGWuSKE0B7np-M1JnHJ3z+_85thg_firRS_BBS06W=TA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: add ITS device tree node
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
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

On Mon, 2 May 2022 at 20:55, Konrad Dybcio <konrad.dybcio@somainline.org> wrote:
>
>
>
> On 1.05.2022 21:50, Dmitry Baryshkov wrote:
> > Add device tree node corresponding to the ITS part of GICv3.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > ---
> Hi,
>
> please keep the properties order coherent with other nodes, so:
>
> [compatible]
> [reg]
> [various props]
> [#-cells]
> [ranges]
> [status]
>

Never memorized the order. Thanks for the pointer!

>
> Konrad
>
> >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > index 3e4c710d3275..4fcb6e2b096b 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > @@ -2865,6 +2865,9 @@ apps_smmu: iommu@15000000 {
> >
> >               intc: interrupt-controller@17100000 {
> >                       compatible = "arm,gic-v3";
> > +                     #address-cells = <2>;
> > +                     #size-cells = <2>;
> > +                     ranges;
> >                       #interrupt-cells = <3>;
> >                       interrupt-controller;
> >                       #redistributor-regions = <1>;
> > @@ -2872,6 +2875,13 @@ intc: interrupt-controller@17100000 {
> >                       reg = <0x0 0x17100000 0x0 0x10000>,     /* GICD */
> >                             <0x0 0x17180000 0x0 0x200000>;    /* GICR * 8 */
> >                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +                     gic_its: msi-controller@17140000 {
> > +                             compatible = "arm,gic-v3-its";
> > +                             msi-controller;
> > +                             #msi-cells = <1>;
> > +                             reg = <0x0 0x17140000 0x0 0x20000>;
> > +                     };
> >               };
> >
> >               timer@17420000 {
> >



-- 
With best wishes
Dmitry
