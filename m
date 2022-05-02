Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65DB251762A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 19:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234137AbiEBR7O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 13:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241325AbiEBR64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 13:58:56 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266AADE6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 10:55:25 -0700 (PDT)
Received: from [192.168.1.101] (abxh26.neoplus.adsl.tpnet.pl [83.9.1.26])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id ADC2A3F4E8;
        Mon,  2 May 2022 19:55:23 +0200 (CEST)
Message-ID: <4824d621-5840-6535-dc8f-1f20ee35d96b@somainline.org>
Date:   Mon, 2 May 2022 19:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] arm64: dts: qcom: add ITS device tree node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
References: <20220501195042.4132724-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220501195042.4132724-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.05.2022 21:50, Dmitry Baryshkov wrote:
> Add device tree node corresponding to the ITS part of GICv3.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---
Hi,

please keep the properties order coherent with other nodes, so:

[compatible]
[reg]
[various props]
[#-cells]
[ranges]
[status]


Konrad

>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 3e4c710d3275..4fcb6e2b096b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2865,6 +2865,9 @@ apps_smmu: iommu@15000000 {
>  
>  		intc: interrupt-controller@17100000 {
>  			compatible = "arm,gic-v3";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
>  			#interrupt-cells = <3>;
>  			interrupt-controller;
>  			#redistributor-regions = <1>;
> @@ -2872,6 +2875,13 @@ intc: interrupt-controller@17100000 {
>  			reg = <0x0 0x17100000 0x0 0x10000>,     /* GICD */
>  			      <0x0 0x17180000 0x0 0x200000>;    /* GICR * 8 */
>  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			gic_its: msi-controller@17140000 {
> +				compatible = "arm,gic-v3-its";
> +				msi-controller;
> +				#msi-cells = <1>;
> +				reg = <0x0 0x17140000 0x0 0x20000>;
> +			};
>  		};
>  
>  		timer@17420000 {
> 
