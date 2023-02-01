Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B19C2686E66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 19:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbjBASvj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 13:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbjBASvh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 13:51:37 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19FB6F23F
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 10:51:35 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id m2so53772245ejb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 10:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXwPKycQJ/C87AlI+nKmlQwJn9IdzArLVEPpu/KGX3Y=;
        b=f+m3AFgZ/zN5mbTCPX05t7GVaX7jgVb9Fx4+QTfI0WnTjXhzDXodaZxTWUcBMe3qhA
         2NUuHo8sVFFJFpQP8Sja4KKR1oMq68bntD7Anhh8Y4WcFR7mf9p0Fs1nNp9GjF3ls76Y
         W8F0VHdYEgHkN6hs/GnHcfbJbUfJSla7hjY7kgcY2ChEePLJnVS/0muDPBoftcowKIqR
         CEgRbjeKwF2+tkZu6BhXu670Ee9fdYX2sp1QMlstKq1uE+xws+yxoFevRLsvNhCxTTdr
         4PLPw/tidAAg2v6Y7CAcP6Pang8D9gaR1ClYM3WhTV/jrXQE92YQpYIH6CyEhXTwbDq6
         +r9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXwPKycQJ/C87AlI+nKmlQwJn9IdzArLVEPpu/KGX3Y=;
        b=PI0D8mKO3yrdTCu+KZ3Zt3IquD8r+MqxDW9YWt9DcraOTPM5KUUZv7CJIBTKKkUmES
         +SKh/GJrAAI+bNz3A2y0mrFX/VPyEqGZggAyX/7r8cZtXP0BCeK6nbUB+yX2bTFIRUje
         9ktDUOU7KMzPoZoUEsQG0hEXy9BzHBpdyK2bCCMZcPo/+NvUfTyMZ28nVfFOS1nmuz6b
         RX8KPQ/mlFlf4xAL4gwpvXmHM+MknCAl3L/11UkUCPQNlO66PQJqFscFIeGaXEkpv7cT
         B0YPc/SUMw9EztHkKAUmnKmhoEqfhbz1e1/JvhvMzmkeDEtqwK/z03K8giWr8GFfHhFs
         TTkw==
X-Gm-Message-State: AO0yUKUt4ApsZP3HPaKiQfAUmZNBb5NAcoNdDkIhMG/KYqdVzbwY9y6p
        892y40aCe8XlhE9fqAUjnr5qQw==
X-Google-Smtp-Source: AK7set+OmZB1EWJIySAzihrguYe0Qq5D3jqRTiHe0dRrZF9bTMJyr8KoEcCrkyVBNFrsYOFwKYhsSw==
X-Received: by 2002:a17:906:6a24:b0:888:d373:214d with SMTP id qw36-20020a1709066a2400b00888d373214dmr4547576ejc.29.1675277494358;
        Wed, 01 Feb 2023 10:51:34 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id ce4-20020a170906b24400b0078d3f96d293sm10423836ejb.30.2023.02.01.10.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:51:33 -0800 (PST)
Message-ID: <6c4cf46d-e4cf-dc9c-193a-e5dd77723b9f@linaro.org>
Date:   Wed, 1 Feb 2023 19:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sdm670: add opps for peripherals
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>
References: <20230201010020.84586-1-mailingradian@gmail.com>
 <20230201010020.84586-3-mailingradian@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201010020.84586-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.02.2023 02:00, Richard Acayan wrote:
> The interconnects are now in place. Add Operating Performance Points for
> them to allow the kernel to properly manage them.
You're really mostly adding interconnect paths in this patch.

> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
For the contents though:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 109 +++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 02f14692dd9d..c5f839dd1c6e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interconnect/qcom,sdm670-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -430,6 +431,10 @@ sdhc_1: mmc@7c4000 {
>  				 <&gcc GCC_SDCC1_ICE_CORE_CLK>,
>  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
>  			clock-names = "iface", "core", "xo", "ice", "bus";
> +			interconnects = <&aggre1_noc MASTER_EMMC 0 &aggre1_noc SLAVE_A1NOC_SNOC 0>,
> +					<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_EMMC_CFG 0>;
> +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> +			operating-points-v2 = <&sdhc1_opp_table>;
>  
>  			iommus = <&apps_smmu 0x140 0xf>;
>  
> @@ -442,6 +447,38 @@ sdhc_1: mmc@7c4000 {
>  			non-removable;
>  
>  			status = "disabled";
> +
> +			sdhc1_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-20000000 {
> +					opp-hz = /bits/ 64 <20000000>;
> +					required-opps = <&rpmhpd_opp_min_svs>;
> +					opp-peak-kBps = <80000 80000>;
> +					opp-avg-kBps = <52286 80000>;
> +				};
> +
> +				opp-50000000 {
> +					opp-hz = /bits/ 64 <50000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <200000 100000>;
> +					opp-avg-kBps = <130718 100000>;
> +				};
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +					opp-peak-kBps = <200000 130000>;
> +					opp-avg-kBps = <130718 130000>;
> +				};
> +
> +				opp-384000000 {
> +					opp-hz = /bits/ 64 <384000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <4096000 4096000>;
> +					opp-avg-kBps = <1338562 1338562>;
> +				};
> +			};
>  		};
>  
>  		gpi_dma0: dma-controller@800000 {
> @@ -477,6 +514,8 @@ qupv3_id_0: geniqup@8c0000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> +			interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>;
> +			interconnect-names = "qup-core";
>  			status = "disabled";
>  
>  			i2c0: i2c@880000 {
> @@ -490,6 +529,10 @@ i2c0: i2c@880000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
>  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -507,6 +550,10 @@ i2c1: i2c@884000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
>  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -524,6 +571,10 @@ i2c2: i2c@888000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
>  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -541,6 +592,10 @@ i2c3: i2c@88c000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
>  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -558,6 +613,10 @@ i2c4: i2c@890000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
>  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -575,6 +634,10 @@ i2c5: i2c@894000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
>  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -592,6 +655,10 @@ i2c6: i2c@898000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
>  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -609,6 +676,10 @@ i2c7: i2c@89c000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre1_noc MASTER_BLSP_1 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_1 0>,
> +						<&aggre1_noc MASTER_BLSP_1 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
>  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -649,6 +720,8 @@ qupv3_id_1: geniqup@ac0000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> +			interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>;
> +			interconnect-names = "qup-core";
>  			status = "disabled";
>  
>  			i2c8: i2c@a80000 {
> @@ -662,6 +735,10 @@ i2c8: i2c@a80000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
>  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -679,6 +756,10 @@ i2c9: i2c@a84000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
>  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -696,6 +777,10 @@ i2c10: i2c@a88000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
>  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -713,6 +798,10 @@ i2c11: i2c@a8c000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
>  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -730,6 +819,10 @@ i2c12: i2c@a90000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
>  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -747,6 +840,10 @@ i2c13: i2c@a94000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
>  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -764,6 +861,10 @@ i2c14: i2c@a98000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
>  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -781,6 +882,10 @@ i2c15: i2c@a9c000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				power-domains = <&rpmhpd SDM670_CX>;
> +				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>,
> +						<&aggre2_noc MASTER_BLSP_2 0 &mem_noc SLAVE_EBI_CH0 0>;
> +				interconnect-names = "qup-core", "qup-config", "qup-memory";
>  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
>  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
>  				dma-names = "tx", "rx";
> @@ -1028,6 +1133,10 @@ usb_1: usb@a6f8800 {
>  
>  			resets = <&gcc GCC_USB30_PRIM_BCR>;
>  
> +			interconnects = <&aggre2_noc MASTER_USB3 0 &mem_noc SLAVE_EBI_CH0 0>,
> +					<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3 0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			status = "disabled";
>  
>  			usb_1_dwc3: usb@a600000 {
