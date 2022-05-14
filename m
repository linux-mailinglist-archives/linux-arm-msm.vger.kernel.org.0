Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28090527067
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 11:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbiENJ40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 05:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiENJ4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 05:56:25 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5B6CF
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 02:56:23 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8B2F93F67A;
        Sat, 14 May 2022 11:56:21 +0200 (CEST)
Date:   Sat, 14 May 2022 11:56:20 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: sdm630: fix the qusb2phy ref
 clock
Message-ID: <20220514095620.us5wemwsmi2gbqaq@SoMainline.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
 <20220513234518.3068480-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513234518.3068480-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-14 02:45:14, Dmitry Baryshkov wrote:
> According to the downstram DT file, the qusb2phy ref clock should be
> GCC_RX0_USB2_CLKREF_CLK, not GCC_RX1_USB2_CLKREF_CLK.
> 
> Fixes: c65a4ed2ea8b ("arm64: dts: qcom: sdm630: Add USB configuration")
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

One nit below.

> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index e8bb170e8b2f..cca56f2fad96 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1262,7 +1262,7 @@ qusb2phy: phy@c012000 {
>  			#phy-cells = <0>;
>  
>  			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> -				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
> +				<&gcc GCC_RX0_USB2_CLKREF_CLK>;

While at it, should this patch fix the indentation or shall I or you do
a one-off patch correcting the entire file (either before or after your
series)?

- Marijn

>  			clock-names = "cfg_ahb", "ref";
>  
>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> -- 
> 2.35.1
> 
