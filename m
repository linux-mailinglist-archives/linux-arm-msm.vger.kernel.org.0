Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90F2052FE0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245231AbiEUQH4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245409AbiEUQH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:07:56 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E26078915
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:07:54 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 09F42205F3;
        Sat, 21 May 2022 18:07:53 +0200 (CEST)
Date:   Sat, 21 May 2022 18:07:51 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v6 05/11] arm64: dts: qcom: sdm630: rename qusb2phy to
 qusb2phy0
Message-ID: <20220521160751.nnagsomws5hstgty@SoMainline.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
 <20220521152049.1490220-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521152049.1490220-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-21 18:20:43, Dmitry Baryshkov wrote:
> In preparation to adding second USB host/PHY pair, change first USB
> PHY's label to qusb2phy0.
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

https://lore.kernel.org/linux-arm-msm/20220515144734.4jzx4dyhj7hgvcfe@SoMainline.org/

> ---
>  arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi                  | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> index 42af1fade461..00baacf28c63 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -224,7 +224,7 @@ &pon_resin {
>  	linux,code = <KEY_VOLUMEUP>;
>  };
>  
> -&qusb2phy {
> +&qusb2phy0 {
>  	status = "okay";
>  
>  	vdd-supply = <&vreg_l1b_0p925>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 5be0ec06ed86..eb8504e5735c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1250,13 +1250,13 @@ usb3_dwc3: usb@a800000 {
>  				 * haven't seen any devices making use of it.
>  				 */
>  				maximum-speed = "high-speed";
> -				phys = <&qusb2phy>;
> +				phys = <&qusb2phy0>;
>  				phy-names = "usb2-phy";
>  				snps,hird-threshold = /bits/ 8 <0>;
>  			};
>  		};
>  
> -		qusb2phy: phy@c012000 {
> +		qusb2phy0: phy@c012000 {
>  			compatible = "qcom,sdm660-qusb2-phy";
>  			reg = <0x0c012000 0x180>;
>  			#phy-cells = <0>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index dcbaacf18f66..9280c1f0c334 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -103,7 +103,7 @@ &pon_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  };
>  
> -&qusb2phy {
> +&qusb2phy0 {
>  	status = "okay";
>  
>  	vdd-supply = <&vreg_l1b_0p925>;
> -- 
> 2.35.1
> 
