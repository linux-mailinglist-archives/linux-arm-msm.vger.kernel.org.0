Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1817B517637
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 20:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343577AbiEBSDa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 14:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244313AbiEBSDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 14:03:30 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B7ADEF2;
        Mon,  2 May 2022 11:00:00 -0700 (PDT)
Received: from [192.168.1.101] (abxh26.neoplus.adsl.tpnet.pl [83.9.1.26])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 124193F361;
        Mon,  2 May 2022 19:59:58 +0200 (CEST)
Message-ID: <6b0ef19b-a45b-ae6f-9f6f-41e72f2c71fd@somainline.org>
Date:   Mon, 2 May 2022 19:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: add uart20 node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
References: <20220501195458.4134911-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220501195458.4134911-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.05.2022 21:54, Dmitry Baryshkov wrote:
> Add device tree node for uart20, which is typically used for Bluetooth attachment.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 4fcb6e2b096b..8b9d9c2cd02c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -996,6 +996,19 @@ spi20: spi@894000 {
>  				status = "disabled";
>  			};
>  
> +			uart20: serial@894000 {
I think it should come before SPI alphabetically?

> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x00894000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_uart20_default>;
No sleep state?

> +				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
>  			i2c21: i2c@898000 {
>  				compatible = "qcom,geni-i2c";
>  				reg = <0x0 0x00898000 0x0 0x4000>;
> @@ -2757,6 +2770,15 @@ qup_uart7_tx: qup-uart7-tx {
>  				drive-strength = <2>;
>  				bias-disable;
>  			};
> +
> +			qup_uart20_default: qup-uart20-default {
> +				mux {
Please drop the unnecessary mux{} here.

> +					pins = "gpio76", "gpio77",
> +						"gpio78", "gpio79";
I think these could fit into a single 100-char-long line>?

> +					function = "qup20";
Are there no default properties for this setup? I think boards that don't use standard Qualcomm connectivity setups (like Bluetooth on this specific UART) are rather scarce and it'd be more convenient to keep a standard setting here and override it where need be instead of copy-pasting the same thing over and over in 95-100% of the boards.

Konrad

> +				};
> +			};
> +
>  		};
>  
>  		apps_smmu: iommu@15000000 {
> 
