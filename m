Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48AB15688EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 15:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiGFNEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 09:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbiGFNEK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 09:04:10 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D219C1E3
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 06:04:08 -0700 (PDT)
Received: from [192.168.1.101] (abxi46.neoplus.adsl.tpnet.pl [83.9.2.46])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 0B7B23F5DC;
        Wed,  6 Jul 2022 15:04:06 +0200 (CEST)
Message-ID: <c33996be-651a-3402-a992-8431910e3f9b@somainline.org>
Date:   Wed, 6 Jul 2022 15:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/13] ARM: dts: qcom: add missing snps,dwmac compatible
 for gmac ipq8064
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20220705133917.8405-1-ansuelsmth@gmail.com>
 <20220705133917.8405-6-ansuelsmth@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220705133917.8405-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.07.2022 15:39, Christian Marangi wrote:
> Add missing snps,dwmac compatible for gmac ipq8064 dtsi.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Tested-by: Jonathan McDowell <noodles@earth.li>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index c0b05d2a2d6d..b2faa4a067e9 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -1077,7 +1077,7 @@ stmmac_axi_setup: stmmac-axi-config {
>  
>  		gmac0: ethernet@37000000 {
>  			device_type = "network";
> -			compatible = "qcom,ipq806x-gmac";
> +			compatible = "qcom,ipq806x-gmac", "snps,dwmac";
>  			reg = <0x37000000 0x200000>;
>  			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";
> @@ -1101,7 +1101,7 @@ gmac0: ethernet@37000000 {
>  
>  		gmac1: ethernet@37200000 {
>  			device_type = "network";
> -			compatible = "qcom,ipq806x-gmac";
> +			compatible = "qcom,ipq806x-gmac", "snps,dwmac";
>  			reg = <0x37200000 0x200000>;
>  			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";
> @@ -1125,7 +1125,7 @@ gmac1: ethernet@37200000 {
>  
>  		gmac2: ethernet@37400000 {
>  			device_type = "network";
> -			compatible = "qcom,ipq806x-gmac";
> +			compatible = "qcom,ipq806x-gmac", "snps,dwmac";
>  			reg = <0x37400000 0x200000>;
>  			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";
> @@ -1149,7 +1149,7 @@ gmac2: ethernet@37400000 {
>  
>  		gmac3: ethernet@37600000 {
>  			device_type = "network";
> -			compatible = "qcom,ipq806x-gmac";
> +			compatible = "qcom,ipq806x-gmac", "snps,dwmac";
>  			reg = <0x37600000 0x200000>;
>  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";
