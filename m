Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6960B5274A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 May 2022 01:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbiENXRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 19:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbiENXRP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 19:17:15 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3892BB30
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 16:17:12 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id v11so9952263qkf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 16:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m1XvXtoTaJkXMtbAGCc6jNSLf5Y+zShqBvNER6uglzQ=;
        b=nLrX3VPWxPSAZjIk2zg+Fb145iCWDXzDjvDnZ/DF13qjvs7mXVnb384mR5/j9jFdNv
         AZQvVdK5XCla2GeuKoiooDFhvth1gzCGr0dYBgMVjYW46BLGHs89P07AkTZZ0if/2fS/
         BWsyFy2erSNqudYGIR5sh3/ZT/wGMGYVnIxPpEOtxSNZBi1g1Qt3vqQtKWpIfLyFJes8
         R5/uwrcOXp8fXS80hMnl1lVZsLw1VEWSAXU6IOPBaEf9FWECepSHEBTZBqfX6rBK1z7v
         0/wdph8BBFBHigg4tOIt9Fxt2Yqb1wjO9sKe+nVS11svbAfMXML3r8lOFsgpn6n7Tya6
         CGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m1XvXtoTaJkXMtbAGCc6jNSLf5Y+zShqBvNER6uglzQ=;
        b=d/vhqnIPXwvkknunhOv+NUcUGLhkBs3lYpxiIvloVvbgZbNi8GUsKzK1eNpJg1n/zZ
         HyJn4XLJLOQJtcbavrg+a5YR9bEo5tSvKRRMmGhw8sXpdr6z3eKOqfcQD+XGsNfmRZK4
         Bgk/Lsfv9QVxzXBKgdLN3m+oPSFTqzjIyJXvHlbhpyBH4Vs7/QSeTdlSQ9PSzHMN8apf
         SLttV85tDm9taPxr0D2fviZcE1BZR/xcg0OvD0yd5MqA9Gskulj64qgvQzzNgk28jtF8
         Sk+zn0qycpEu+ORhtvD7GPg3LVBZ0xfVc2rkKjhgav4bmmMl4nMAvpV5Fij66POYvHa/
         TsvQ==
X-Gm-Message-State: AOAM533n7O0RQqcGnKEloU5Bo3EkzO1JZpV+P7ZoYlu18IL7U6PQryD9
        qhfgB1y5NgZtX9T+eqPNbYcur5SKYd4GQGn9BFUdkQ==
X-Google-Smtp-Source: ABdhPJzBYI3iP7EJLSEy0uGX3m+lqtpIJajt5elYuW6jm2ystL+e4jlvJ5RB3/5yPI/SUtZaV3k79uBeAxMfVaC/P+4=
X-Received: by 2002:a05:620a:12e5:b0:69f:e82e:3021 with SMTP id
 f5-20020a05620a12e500b0069fe82e3021mr8134039qkl.59.1652570231249; Sat, 14 May
 2022 16:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220514000310.3070578-1-dmitry.baryshkov@linaro.org>
 <20220514000310.3070578-3-dmitry.baryshkov@linaro.org> <c165c67e-528c-d976-c479-793c3593bb37@somainline.org>
In-Reply-To: <c165c67e-528c-d976-c479-793c3593bb37@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 15 May 2022 02:17:00 +0300
Message-ID: <CAA8EJpq_ZQvoRnDn2VV_+koWF67+BkwLho5vxngm9vE5rcYwBA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm660: add device node for the
 compute PAS
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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

On Sun, 15 May 2022 at 01:51, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
>
> On 14.05.2022 02:03, Dmitry Baryshkov wrote:
> > Add device tree node describing CDSP device found on the SDM660 (but not
> > on SDM630) platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Lookin' good, but this must be /delete-node/'d on sdm636.

Ack for the sdm636, will fix in v2.

Or maybe you'd like another approach: move all devices to sdm636 and
make sdm660 include sdm636.dtsi?

> Also, I think 660 had a separate smmu for this hw block?

Yes, there is a separate smmu, however enabling it makes the board
reset. I can add it here, but I doubt it is going to be useful till
somebody lands IOMMU fixes for this platform.

>
> Konrad
> >  arch/arm64/boot/dts/qcom/sdm660.dtsi | 68 ++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> > index 023b0ac4118c..3b70eff68807 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> > @@ -9,6 +9,74 @@
> >
> >  #include "sdm630.dtsi"
> >
> > +/ {
> > +     reserved-memory {
> > +             /delete-node/ tzbuffer@94a00000;
> > +
> > +             cdsp_region: cdsp@94a00000 {
> > +                     reg = <0x0 0x94a00000 0x0 0x600000>;
> > +                     no-map;
> > +             };
> > +
> > +     };
> > +
> > +     smp2p-cdsp {
> > +             compatible = "qcom,smp2p";
> > +             qcom,smem = <94>, <432>;
> > +             interrupts = <GIC_SPI 514 IRQ_TYPE_EDGE_RISING>;
> > +             mboxes = <&apcs_glb 30>;
> > +             qcom,local-pid = <0>;
> > +             qcom,remote-pid = <5>;
> > +
> > +             cdsp_smp2p_out: master-kernel {
> > +                     qcom,entry-name = "master-kernel";
> > +                     #qcom,smem-state-cells = <1>;
> > +             };
> > +
> > +             cdsp_smp2p_in: slave-kernel {
> > +                     qcom,entry-name = "slave-kernel";
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +             };
> > +     };
> > +
> > +     soc {
> > +             cdsp_pil: remoteproc@1a300000 {
> > +                     compatible = "qcom,sdm660-cdsp-pas";
> > +                     reg = <0x1a300000 0x4040>;
> > +
> > +                     interrupts-extended =
> > +                             <&intc GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
> > +                             <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > +                             <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > +                             <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > +                             <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > +                     interrupt-names = "wdog", "fatal", "ready",
> > +                                       "handover", "stop-ack";
> > +
> > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > +                     clock-names = "xo";
> > +
> > +                     memory-region = <&cdsp_region>;
> > +                     power-domains = <&rpmpd SDM660_VDDCX>;
> > +                     power-domain-names = "cx";
> > +
> > +                     qcom,smem-states = <&cdsp_smp2p_out 0>;
> > +                     qcom,smem-state-names = "stop";
> > +
> > +                     glink-edge {
> > +                             interrupts = <GIC_SPI 513 IRQ_TYPE_EDGE_RISING>;
> > +
> > +                             label = "turing";
> > +                             mboxes = <&apcs_glb 29>;
> > +                             qcom,remote-pid = <5>;
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >  &adreno_gpu {
> >       compatible = "qcom,adreno-512.0", "qcom,adreno";
> >       operating-points-v2 = <&gpu_sdm660_opp_table>;



-- 
With best wishes
Dmitry
