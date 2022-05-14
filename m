Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E04C527055
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 11:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbiENJiP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 05:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbiENJiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 05:38:12 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C48B6443
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 02:38:06 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6E9F53F767;
        Sat, 14 May 2022 11:38:03 +0200 (CEST)
Date:   Sat, 14 May 2022 11:37:56 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: sdm630: disable dsi1/dsi1_phy
 by default
Message-ID: <20220514093756.f7gqpo2ok2osbcm4@SoMainline.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
 <20220513234518.3068480-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513234518.3068480-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Title copy-paste error: it should read dsi0/dsi0_phy.  Can you also
reorder this patch together with the dsi1/dsi1_phy one, and perhaps they
should just be squashed?  Otherwise, does a Suggested-by: make sense
here?

- Marijn

On 2022-05-14 02:45:12, Dmitry Baryshkov wrote:
> Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
> They should be enabled in the board DT files. No existing boards use
> them at this moment.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 240293592ef9..8697d40e9b74 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1559,6 +1559,8 @@ dsi0: dsi@c994000 {
>  				phys = <&dsi0_phy>;
>  				phy-names = "dsi";
>  
> +				status = "disabled";
> +
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -1592,6 +1594,7 @@ dsi0_phy: dsi-phy@c994400 {
>  
>  				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
>  				clock-names = "iface", "ref";
> +				status = "disabled";
>  			};
>  		};
>  
> -- 
> 2.35.1
> 
