Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4982D527057
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 11:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbiENJjd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 05:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbiENJjc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 05:39:32 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD03ABA;
        Sat, 14 May 2022 02:39:30 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7DFE83F767;
        Sat, 14 May 2022 11:39:28 +0200 (CEST)
Date:   Sat, 14 May 2022 11:39:27 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/5] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy
 by default
Message-ID: <20220514093927.7qvrimrvilob5uyv@SoMainline.org>
References: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
 <20220503220927.960821-2-dmitry.baryshkov@linaro.org>
 <20220504081102.g36yjajytvuaba7r@SoMainline.org>
 <410ffede-1419-89a2-2600-8f92fdb4161e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <410ffede-1419-89a2-2600-8f92fdb4161e@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-13 00:58:32, Dmitry Baryshkov wrote:
> On 04/05/2022 11:11, Marijn Suijten wrote:
> > On 2022-05-04 01:09:23, Dmitry Baryshkov wrote:
> >> Follow the typical practice and keep DSI1/DSI1 PHY disabled by default.
> >> They should be enabled in the board DT files. No existing boards use
> >> them at this moment.
> > 
> > This practice also seems to be applied to dsi0/dsi0_phy across other
> > boards.  Should this also be applied to sdm630.dtsi's dsi0/dsi0_phy
> > nodes, and them subsequently re-enabled in sdm630-sony-xperia-nile.dtsi?
> 
> I will apply corresponding changes to sdm630.dtsi. However enabling them 
> in sdm630-sony-xperia-nile.dtsi doens't make sense at this moment, since 
> neither of nile platforms properly describes the mdss/mdp/panel 
> configuration. I'm looking forward to seeing the updates for these 
> devices trees though.

Thanks, I'll rebase your patches into my public Nile branch and fix this
up on my end, as to not forget this when hopefully sending more
enablement for this platform at "some point...".

- Marijn

> > 
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > - Marijn
> >> ---
> >>   arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> >> index eccf6fde16b4..023b0ac4118c 100644
> >> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> >> @@ -192,6 +192,8 @@ dsi1: dsi@c996000 {
> >>   		phys = <&dsi1_phy>;
> >>   		phy-names = "dsi";
> >>   
> >> +		status = "disabled";
> >> +
> >>   		ports {
> >>   			#address-cells = <1>;
> >>   			#size-cells = <0>;
> >> @@ -225,6 +227,7 @@ dsi1_phy: dsi-phy@c996400 {
> >>   
> >>   		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
> >>   		clock-names = "iface", "ref";
> >> +		status = "disabled";
> >>   	};
> >>   };
> >>   
> >> -- 
> >> 2.35.1
> >>
> 
> 
> -- 
> With best wishes
> Dmitry
