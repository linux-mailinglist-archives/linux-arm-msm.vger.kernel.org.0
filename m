Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5231352748B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 May 2022 00:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiENWwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 18:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbiENWwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 18:52:04 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1D71836F
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 15:51:54 -0700 (PDT)
Received: from [192.168.1.101] (abxh168.neoplus.adsl.tpnet.pl [83.9.1.168])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CF0182052C;
        Sun, 15 May 2022 00:51:50 +0200 (CEST)
Message-ID: <c165c67e-528c-d976-c479-793c3593bb37@somainline.org>
Date:   Sun, 15 May 2022 00:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm660: add device node for the
 compute PAS
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220514000310.3070578-1-dmitry.baryshkov@linaro.org>
 <20220514000310.3070578-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220514000310.3070578-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.05.2022 02:03, Dmitry Baryshkov wrote:
> Add device tree node describing CDSP device found on the SDM660 (but not
> on SDM630) platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Lookin' good, but this must be /delete-node/'d on sdm636. Also, I think 660 had a separate smmu for this hw block?

Konrad
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 68 ++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index 023b0ac4118c..3b70eff68807 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -9,6 +9,74 @@
>  
>  #include "sdm630.dtsi"
>  
> +/ {
> +	reserved-memory {
> +		/delete-node/ tzbuffer@94a00000;
> +
> +		cdsp_region: cdsp@94a00000 {
> +			reg = <0x0 0x94a00000 0x0 0x600000>;
> +			no-map;
> +		};
> +
> +	};
> +
> +	smp2p-cdsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <94>, <432>;
> +		interrupts = <GIC_SPI 514 IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&apcs_glb 30>;
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <5>;
> +
> +		cdsp_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		cdsp_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	soc {
> +		cdsp_pil: remoteproc@1a300000 {
> +			compatible = "qcom,sdm660-cdsp-pas";
> +			reg = <0x1a300000 0x4040>;
> +
> +			interrupts-extended =
> +				<&intc GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
> +				<&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +				<&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +				<&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +				<&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "xo";
> +
> +			memory-region = <&cdsp_region>;
> +			power-domains = <&rpmpd SDM660_VDDCX>;
> +			power-domain-names = "cx";
> +
> +			qcom,smem-states = <&cdsp_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 513 IRQ_TYPE_EDGE_RISING>;
> +
> +				label = "turing";
> +				mboxes = <&apcs_glb 29>;
> +				qcom,remote-pid = <5>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +	};
> +};
> +
>  &adreno_gpu {
>  	compatible = "qcom,adreno-512.0", "qcom,adreno";
>  	operating-points-v2 = <&gpu_sdm660_opp_table>;
