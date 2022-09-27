Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED295EC3BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 15:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbiI0NI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 09:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbiI0NIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 09:08:43 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437A7181CC6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 06:08:29 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6E7993F296;
        Tue, 27 Sep 2022 15:08:27 +0200 (CEST)
Message-ID: <f0bf8546-3def-a6a7-1d66-7367a9955289@somainline.org>
Date:   Tue, 27 Sep 2022 15:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add nodes to support WoW on
 WCN6750
Content-Language: en-US
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220926045735.719-1-quic_mpubbise@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220926045735.719-1-quic_mpubbise@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26.09.2022 06:57, Manikanta Pubbisetty wrote:
> Add DT nodes to support WoW (Wake on Wireless) feature on WCN6750
> WiFi hardware on SC7280 SoC.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
> Changes from V1:
> - Rebased on ToT
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 212580316d3e..3f6a3f575339 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -752,6 +752,17 @@ wpss_smp2p_in: slave-kernel {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		wlan_smp2p_out: wlan-ap-to-wpss {
> +			qcom,entry-name = "wlan";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		wlan_smp2p_in: wlan-wpss-to-ap {
> +			qcom,entry-name = "wlan";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
>  	};
>  
>  	pmu {
> @@ -2004,6 +2015,8 @@ wifi: wifi@17a10040 {
>  			qcom,rproc = <&remoteproc_wpss>;
>  			memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
>  			status = "disabled";
> +			qcom,smem-states = <&wlan_smp2p_out 0>;
> +			qcom,smem-state-names = "wlan-smp2p-out";
Keep status last, please.

Other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  		};
>  
>  		pcie1: pci@1c08000 {
> 
> base-commit: aaa11ce2ffc84166d11c4d2ac88c3fcf75425fbd
