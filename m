Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87F2252BC94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 16:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238110AbiERNkh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 09:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238109AbiERNkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 09:40:37 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7395317066C
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 06:40:35 -0700 (PDT)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id F3BBD2060E;
        Wed, 18 May 2022 15:40:31 +0200 (CEST)
Message-ID: <77726e82-eaef-4cce-514a-1df04e5c33ee@somainline.org>
Date:   Wed, 18 May 2022 15:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 5/6] arm64: dts: ipq8074: add SPMI PMP8074 PMIC
 regulators
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220517205341.536587-1-robimarko@gmail.com>
 <20220517205341.536587-5-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220517205341.536587-5-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 17/05/2022 22:53, Robert Marko wrote:
> PMP8074 is used in IPQ8074 and provides S3 for cores,
> S4 for UBI core and LDO11 for SDIO/eMMC.
>
> So, lets add the nodes in preparation for DVFS later.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq8074.dtsi | 34 +++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 789fec7c6aa4..d1a0b77c38a4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
> +#include <dt-bindings/spmi/spmi.h>
>   
>   / {
>   	model = "Qualcomm Technologies, Inc. IPQ8074";
> @@ -421,6 +422,39 @@ spmi_bus: spmi@200f000 {
>   			interrupt-controller;
>   			#interrupt-cells = <4>;
>   			cell-index = <0>;
> +
> +			pmic@1 {

Hi!


These nodes belong in the PMIC DTSI (check pm8150.dtsi and others alike 
for reference).


Konrad

> +				compatible ="qcom,spmi-pmic";
> +				reg = <0x1 SPMI_USID>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				regulators {
> +					compatible = "qcom,pmp8074-regulators";
> +
> +					s3: s3 {
> +						regulator-name = "vdd_s3";
> +						regulator-min-microvolt = <592000>;
> +						regulator-max-microvolt = <1064000>;
> +						regulator-always-on;
> +						regulator-boot-on;
> +					};
> +
> +					s4: s4 {
> +						regulator-name = "vdd_s4";
> +						regulator-min-microvolt = <712000>;
> +						regulator-max-microvolt = <992000>;
> +						regulator-always-on;
> +						regulator-boot-on;
> +					};
> +
> +					l11: l11 {
> +						regulator-name = "l11";
> +						regulator-min-microvolt = <1800000>;
> +						regulator-max-microvolt = <3300000>;
> +					};
> +				};
> +			};
>   		};
>   
>   		sdhc_1: sdhci@7824900 {
>
