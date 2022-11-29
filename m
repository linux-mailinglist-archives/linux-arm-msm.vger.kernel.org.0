Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3C1663C5AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 17:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbiK2Qwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 11:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236579AbiK2QwG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 11:52:06 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354407118D
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 08:47:57 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id q83so15827011oib.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 08:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kXbb2debLj7TyugLurIchRFn9a7ch9x7YBOye0bNKQ=;
        b=pPw8eVEshbxlS7dZ+C2YrNdQbuE8ScN214dLKfVHx0c3Pspn+RGQXlAiAyCTezaUnd
         cXe3ILMLPGQgC82L1tfr/Lu96N5RSXB8zTuNoUIil3UfkkVA5+apqtC85KBaqKM1HA0c
         9VfmyrLNBUtQcrRGBRf9VBvDqySyWai7cfHbL9WH0UgNqv/bxfgpk43RRslbsXi6ujKL
         7zLeo1Tso90JX3Y3vG93u169seNXbbL3e3AMjDfjeMvTJufHf8ivpa8fO13QizIEdGA4
         m99CrJDEoOTOzQiFjggt//KNt4Rjh29ritVadrMoAKLxRWuLhznY3bNhxLU8clTD/LNe
         Wi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kXbb2debLj7TyugLurIchRFn9a7ch9x7YBOye0bNKQ=;
        b=Xqedj5hZr7GnCeitcjz6nA0xd4rYyYZ3SL89qzDyI27wP0dRjFIGAXS2tZbR7eUOtw
         BvidZ+m2sErP9rjIGq657spGQAChOTUjLTLbEbxO0u8Lhggg9jwFgED2x3j3aRWqO+Va
         QOMvjdNyfSgMKTW7I3bepRxsBDK38eAkS8kBkXxIApN59MSnDU9HkXT/C9gMm1XPM/Dg
         NqFcLGaP5zZ7TPks5evrwW40oiWpoIu+uYOMiS/sPkL5hd/Nl+SeCS7bev9rz1o5PsEp
         JiCyhE56F4cejw+oq1zsf9//lAI9o4iO+9GGxyv9ZOl7BiBIAHLBI4ceyYfk8JshHcfn
         hhKA==
X-Gm-Message-State: ANoB5pkghd6F7Gf4mOFpNUeyuYMFi+SGbxjzvGn1LUxEfqOITeTeDLB0
        ZA32s0EzLjjIz+IAuRvyn3DYTYAZqVySzm5hDmGOBQ==
X-Google-Smtp-Source: AA0mqf5G0qftXHLnjQxuinsaIkxFnEkbqqyy6UGhWiPGyZWqvQ6KQgoj0Ov4AgxjKvzTfh5xk72Tsjr+YFHqr1Aut+I=
X-Received: by 2002:aca:2801:0:b0:35a:13f4:d875 with SMTP id
 1-20020aca2801000000b0035a13f4d875mr30396280oix.190.1669740451971; Tue, 29
 Nov 2022 08:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-11-robert.foss@linaro.org> <dc138171-f7b1-2761-d800-620e85afd6d9@linaro.org>
In-Reply-To: <dc138171-f7b1-2761-d800-620e85afd6d9@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 29 Nov 2022 17:47:21 +0100
Message-ID: <CAG3jFyuC59iX9p9eB7WT0Lx34DszZrwbOSnRyV_X02=TnVs6tg@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] arm64: dts: qcom: sm8350: Add display system nodes
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, quic_kalyant@quicinc.com,
        swboyd@chromium.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 15 Nov 2022 at 14:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 15/11/2022 14:31, Robert Foss wrote:
> > Add mdss, mdss_mdp, dsi0, dsi0_phy nodes. With these
> > nodes the display subsystem is configured to support
> > one DSI output.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8350.dtsi | 197 ++++++++++++++++++++++++++-
> >   1 file changed, 193 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index 434f8e8b12c1..5c98e5cf5ad0 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > @@ -3,6 +3,7 @@
> >    * Copyright (c) 2020, Linaro Limited
> >    */
> >
> > +#include <dt-bindings/interconnect/qcom,sm8350.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
> >   #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> > @@ -2536,14 +2537,201 @@ usb_2_dwc3: usb@a800000 {
> >                       };
> >               };
> >
> > +             mdss: mdss@ae00000 {
> > +                     compatible = "qcom,sm8350-mdss";
> > +                     reg = <0 0x0ae00000 0 0x1000>;
> > +                     reg-names = "mdss";
> > +
> > +                     interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> > +                                     <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
> > +                     interconnect-names = "mdp0-mem", "mdp1-mem";
> > +
> > +                     power-domains = <&dispcc MDSS_GDSC>;
> > +                     resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> > +
> > +                     clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                              <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                              <&gcc GCC_DISP_SF_AXI_CLK>,
> > +                              <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > +                     clock-names = "iface", "bus", "nrt_bus", "core";
> > +
> > +                     interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <1>;
> > +
> > +                     iommus = <&apps_smmu 0x820 0x402>;
> > +
> > +                     status = "disabled";
> > +
> > +                     #address-cells = <2>;
> > +                     #size-cells = <2>;
> > +                     ranges;
> > +
> > +                     mdss_mdp: display-controller@ae01000 {
> > +                             compatible = "qcom,sm8350-dpu";
> > +                             reg = <0 0x0ae01000 0 0x8f000>,
> > +                                   <0 0x0aeb0000 0 0x2008>;
> > +                             reg-names = "mdp", "vbif";
> > +
> > +                             clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                                     <&gcc GCC_DISP_SF_AXI_CLK>,
> > +                                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> > +                                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
> > +                                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +                             clock-names = "bus",
> > +                                           "nrt_bus",
> > +                                           "iface",
> > +                                           "lut",
> > +                                           "core",
> > +                                           "vsync";
> > +
> > +                             assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +                             assigned-clock-rates = <19200000>;
> > +
> > +                             operating-points-v2 = <&mdp_opp_table>;
> > +                             power-domains = <&rpmhpd SM8350_MMCX>;
> > +
> > +                             interrupt-parent = <&mdss>;
> > +                             interrupts = <0>;
> > +
> > +                             status = "disabled";
> It doesn't make sense to disable mdp separately, as mdss is essentially
> useless without it.

Ack

>
> > +
> > +                             ports {
> > +                                     #address-cells = <1>;
> > +                                     #size-cells = <0>;
> > +
> > +                                     port@0 {
> > +                                             reg = <0>;
> > +                                             dpu_intf1_out: endpoint {
> > +                                                     remote-endpoint = <&dsi0_in>;
> > +                                             };
> > +                                     };
> > +                             };
> > +
> > +                             mdp_opp_table: opp-table {
> > +                                     compatible = "operating-points-v2";
> > +
> > +                                     opp-200000000 {
> > +                                             opp-hz = /bits/ 64 <200000000>;
> > +                                             required-opps = <&rpmhpd_opp_low_svs>;
> > +                                     };
> > +
> > +                                     opp-300000000 {
> > +                                             opp-hz = /bits/ 64 <300000000>;
> > +                                             required-opps = <&rpmhpd_opp_svs>;
> > +                                     };
> > +
> > +                                     opp-345000000 {
> > +                                             opp-hz = /bits/ 64 <345000000>;
> > +                                             required-opps = <&rpmhpd_opp_svs_l1>;
> > +                                     };
> > +
> > +                                     opp-460000000 {
> > +                                             opp-hz = /bits/ 64 <460000000>;
> > +                                             required-opps = <&rpmhpd_opp_nom>;
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     dsi0: dsi@ae94000 {
> > +                             compatible = "qcom,mdss-dsi-ctrl";
> > +                             reg = <0 0x0ae94000 0 0x400>;
> > +                             reg-names = "dsi_ctrl";
> > +
> > +                             interrupt-parent = <&mdss>;
> > +                             interrupts = <4>;
> > +
> > +                             clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                                      <&gcc GCC_DISP_HF_AXI_CLK>;
> > +                             clock-names = "byte",
> > +                                           "byte_intf",
> > +                                           "pixel",
> > +                                           "core",
> > +                                           "iface",
> > +                                           "bus";
> > +
> > +                             assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> > +                                               <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> > +                             assigned-clock-parents = <&dsi0_phy 0>,
> > +                                                      <&dsi0_phy 1>;
> > +
> > +                             operating-points-v2 = <&dsi_opp_table>;
> > +                             power-domains = <&rpmhpd SM8350_MMCX>;
> > +
> > +                             phys = <&dsi0_phy>;
> > +                             phy-names = "dsi";
> I think that was dropped as of late.

Ack

>
> > +
> > +                             status = "disabled";
> > +
> > +                             ports {
> > +                                     #address-cells = <1>;
> > +                                     #size-cells = <0>;
> > +
> > +                                     port@0 {
> > +                                             reg = <0>;
> > +                                             dsi0_in: endpoint {
> > +                                                     remote-endpoint = <&dpu_intf1_out>;
> > +                                             };
> > +                                     };
> > +
> > +                                     port@1 {
> > +                                             reg = <1>;
> > +                                             dsi0_out: endpoint {
> > +                                             };
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     dsi0_phy: phy@ae94400 {
> > +                             compatible = "qcom,dsi-phy-5nm-8350";
> > +                             reg = <0 0x0ae94400 0 0x200>,
> > +                                   <0 0x0ae94600 0 0x280>,
> > +                                   <0 0x0ae94900 0 0x260>;
> > +                             reg-names = "dsi_phy",
> > +                                         "dsi_phy_lane",
> > +                                         "dsi_pll";
> > +
> > +                             #clock-cells = <1>;
> > +                             #phy-cells = <0>;
> > +
> > +                             clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                                      <&rpmhcc RPMH_CXO_CLK>;
> > +                             clock-names = "iface", "ref";
> > +
> > +                             status = "disabled";
> > +
> > +                             dsi_opp_table: dsi-opp-table {
> > +                                     compatible = "operating-points-v2";
> > +
> > +                                     opp-187500000 {
> > +                                             opp-hz = /bits/ 64 <187500000>;
> > +                                             required-opps = <&rpmhpd_opp_low_svs>;
> > +                                     };
> > +
> > +                                     opp-300000000 {
> > +                                             opp-hz = /bits/ 64 <300000000>;
> > +                                             required-opps = <&rpmhpd_opp_svs>;
> > +                                     };
> > +
> > +                                     opp-358000000 {
> > +                                             opp-hz = /bits/ 64 <358000000>;
> > +                                             required-opps = <&rpmhpd_opp_svs_l1>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> >               dispcc: clock-controller@af00000 {
> >                       compatible = "qcom,sm8350-dispcc";
> >                       reg = <0 0x0af00000 0 0x10000>;
> >                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> > -                              <0>,
> > -                              <0>,
> > -                              <0>,
> > -                              <0>,
> > +                              <&dsi0_phy 0>, <&dsi0_phy 1>,
> > +                              <0>, <0>,
> >                                <0>,
> >                                <0>;
> >                       clock-names = "bi_tcxo",
> > @@ -2558,6 +2746,7 @@ dispcc: clock-controller@af00000 {
> >                       #power-domain-cells = <1>;
> >
> >                       power-domains = <&rpmhpd SM8350_MMCX>;
> > +                     required-opps = <&rpmhpd_opp_turbo>;
> A turbo vote is required for it to function? Seems a bit high..

Dmitry hit a snag using &rpmhpd_opp_low_svs, so this was a dummy
value. I can't replicate that issue, but am having a conversation with
him off-list about this.

On my sm8350-hdk board &rpmhpd_opp_low_svs is working fine.

>
> Konrad
> >               };
> >
> >               adsp: remoteproc@17300000 {
