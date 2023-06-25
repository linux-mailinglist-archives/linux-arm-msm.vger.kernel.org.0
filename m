Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A17F73D369
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 21:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjFYTsJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 15:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjFYTsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 15:48:08 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E5F19F;
        Sun, 25 Jun 2023 12:48:07 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6B9491FA7E;
        Sun, 25 Jun 2023 21:48:04 +0200 (CEST)
Date:   Sun, 25 Jun 2023 21:48:03 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom,dispcc-sm6125: Require
 GCC PLL0 DIV clock
Message-ID: <edrftxqhywiaxvbonyh25cmubrg77y4dryqoy7id4ndan2lfa7@rhvcoavtg5vl>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-24 03:45:02, Konrad Dybcio wrote:
> On 24.06.2023 02:41, Marijn Suijten wrote:
> > The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
> > be passed from DT, and should be required by the bindings.
> > 
> > Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> Ideally, you'd stick it at the bottom of the list, as the items: order
> is part of the ABI

This isn't an ABI break, as this driver nor its bindings require/declare
a fixed order: they declare a relation between clocks and clock-names.

This orders the GCC clock just like other dispccs.  And the previous
patch dropped the unused cfg_ahb_clk from the bindings, so all bets are
off anyway.

- Marijn

> 
> Konrad
> >  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> > index 2acf487d8a2f..11ec154503a3 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> > @@ -23,6 +23,7 @@ properties:
> >    clocks:
> >      items:
> >        - description: Board XO source
> > +      - description: GPLL0 div source from GCC
> >        - description: Byte clock from DSI PHY0
> >        - description: Pixel clock from DSI PHY0
> >        - description: Pixel clock from DSI PHY1
> > @@ -32,6 +33,7 @@ properties:
> >    clock-names:
> >      items:
> >        - const: bi_tcxo
> > +      - const: gcc_disp_gpll0_div_clk_src
> >        - const: dsi0_phy_pll_out_byteclk
> >        - const: dsi0_phy_pll_out_dsiclk
> >        - const: dsi1_phy_pll_out_dsiclk
> > @@ -65,12 +67,14 @@ examples:
> >        compatible = "qcom,sm6125-dispcc";
> >        reg = <0x5f00000 0x20000>;
> >        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> > +               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> >                 <&dsi0_phy 0>,
> >                 <&dsi0_phy 1>,
> >                 <&dsi1_phy 1>,
> >                 <&dp_phy 0>,
> >                 <&dp_phy 1>;
> >        clock-names = "bi_tcxo",
> > +                    "gcc_disp_gpll0_div_clk_src",
> >                      "dsi0_phy_pll_out_byteclk",
> >                      "dsi0_phy_pll_out_dsiclk",
> >                      "dsi1_phy_pll_out_dsiclk",
> > 
