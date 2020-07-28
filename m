Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639FA2301D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 07:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgG1FgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 01:36:14 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:36099 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726162AbgG1FgO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 01:36:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595914572; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0YRvGKV06RwAWRcPYH2gqrLsA2RjLUXvQHRcb1sufaY=; b=tL7pexQCtNiWYyv/Ot3eIs5lyRPGOyq6i4yWq3hkknPr2IavgcAL7Ro5ADOgU8RMvo1pUm84
 GGOmlEeH5PsxszuD/Nfynf/IjN+0Wh8JyT9AsLQPi4Czb8aqQR6yKcHAxI6GjuvgmGqgDvJg
 ErixwS/8KoyeP1HDAvb+d3CB3Ks=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f1fb94c49176bd382c352da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 05:36:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9C31C43395; Tue, 28 Jul 2020 05:36:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8EDB8C433C6;
        Tue, 28 Jul 2020 05:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8EDB8C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 1/3] arm64: dts: sc7180: Add wakeup support over UART
 RX
To:     satya priya <skakit@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-2-git-send-email-skakit@codeaurora.org>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <36fbe841-4b53-fcc1-80d9-2f35939c590c@codeaurora.org>
Date:   Tue, 28 Jul 2020 11:06:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595563082-2353-2-git-send-email-skakit@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/24/2020 9:28 AM, satya priya wrote:
> Add the necessary pinctrl and interrupts to make UART
> wakeup capable.


Reviewed-by: Akash Asthana <akashast@codeaurora.org>

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>   - As per Matthias's comment added wakeup support for all the UARTs
>     of SC7180.
>
>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 98 ++++++++++++++++++++++++++++++------
>   1 file changed, 84 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 16df08d..044a4d0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -787,9 +787,11 @@
>   				reg = <0 0x00880000 0 0x4000>;
>   				clock-names = "se";
>   				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>   				pinctrl-0 = <&qup_uart0_default>;
> -				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart0_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 37 IRQ_TYPE_EDGE_FALLING>;
>   				power-domains = <&rpmhpd SC7180_CX>;
>   				operating-points-v2 = <&qup_opp_table>;
>   				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
> @@ -839,9 +841,11 @@
>   				reg = <0 0x00884000 0 0x4000>;
>   				clock-names = "se";
>   				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>   				pinctrl-0 = <&qup_uart1_default>;
> -				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart1_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 3 IRQ_TYPE_EDGE_FALLING>;
>   				power-domains = <&rpmhpd SC7180_CX>;
>   				operating-points-v2 = <&qup_opp_table>;
>   				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
> @@ -925,9 +929,11 @@
>   				reg = <0 0x0088c000 0 0x4000>;
>   				clock-names = "se";
>   				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>   				pinctrl-0 = <&qup_uart3_default>;
> -				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart3_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
>   				power-domains = <&rpmhpd SC7180_CX>;
>   				operating-points-v2 = <&qup_opp_table>;
>   				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
> @@ -1011,9 +1017,11 @@
>   				reg = <0 0x00894000 0 0x4000>;
>   				clock-names = "se";
>   				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>   				pinctrl-0 = <&qup_uart5_default>;
> -				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart5_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 28 IRQ_TYPE_EDGE_FALLING>;
>   				power-domains = <&rpmhpd SC7180_CX>;
>   				operating-points-v2 = <&qup_opp_table>;
>   				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
> @@ -1078,9 +1086,11 @@
>   				reg = <0 0x00a80000 0 0x4000>;
>   				clock-names = "se";
>   				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>   				pinctrl-0 = <&qup_uart6_default>;
> -				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart6_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 62 IRQ_TYPE_EDGE_FALLING>;
>   				power-domains = <&rpmhpd SC7180_CX>;
>   				operating-points-v2 = <&qup_opp_table>;
>   				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
> @@ -1250,9 +1260,11 @@
>   				reg = <0 0x00a90000 0 0x4000>;
>   				clock-names = "se";
>   				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>   				pinctrl-0 = <&qup_uart10_default>;
> -				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart10_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 89 IRQ_TYPE_EDGE_FALLING>;
>   				power-domains = <&rpmhpd SC7180_CX>;
>   				operating-points-v2 = <&qup_opp_table>;
>   				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
> @@ -1302,9 +1314,11 @@
>   				reg = <0 0x00a94000 0 0x4000>;
>   				clock-names = "se";
>   				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "sleep";
>   				pinctrl-0 = <&qup_uart11_default>;
> -				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-1 = <&qup_uart11_sleep>;
> +				interrupts-extended = <&intc GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
> +							<&tlmm 56 IRQ_TYPE_EDGE_FALLING>;
>   				power-domains = <&rpmhpd SC7180_CX>;
>   				operating-points-v2 = <&qup_opp_table>;
>   				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
> @@ -1632,6 +1646,14 @@
>   				};
>   			};
>   
> +			qup_uart0_sleep: qup-uart0-sleep {
> +				pinmux {
> +					pins = "gpio34", "gpio35",
> +					       "gpio36", "gpio37";
> +					function = "gpio";
> +				};
> +			};
> +
>   			qup_uart1_default: qup-uart1-default {
>   				pinmux {
>   					pins = "gpio0", "gpio1",
> @@ -1640,6 +1662,14 @@
>   				};
>   			};
>   
> +			qup_uart1_sleep: qup-uart1-sleep {
> +				pinmux {
> +					pins = "gpio0", "gpio1",
> +					       "gpio2", "gpio3";
> +					function = "gpio";
> +				};
> +			};
> +
>   			qup_uart2_default: qup-uart2-default {
>   				pinmux {
>   					pins = "gpio15", "gpio16";
> @@ -1655,6 +1685,14 @@
>   				};
>   			};
>   
> +			qup_uart3_sleep: qup-uart3-sleep {
> +				pinmux {
> +					pins = "gpio38", "gpio39",
> +					       "gpio40", "gpio41";
> +					function = "gpio";
> +				};
> +			};
> +
>   			qup_uart4_default: qup-uart4-default {
>   				pinmux {
>   					pins = "gpio115", "gpio116";
> @@ -1670,6 +1708,14 @@
>   				};
>   			};
>   
> +			qup_uart5_sleep: qup-uart5-sleep {
> +				pinmux {
> +					pins = "gpio25", "gpio26",
> +					       "gpio27", "gpio28";
> +					function = "gpio";
> +				};
> +			};
> +
>   			qup_uart6_default: qup-uart6-default {
>   				pinmux {
>   					pins = "gpio59", "gpio60",
> @@ -1678,6 +1724,14 @@
>   				};
>   			};
>   
> +			qup_uart6_sleep: qup-uart6-sleep {
> +				pinmux {
> +					pins = "gpio59", "gpio60",
> +					       "gpio61", "gpio62";
> +					function = "gpio";
> +				};
> +			};
> +
>   			qup_uart7_default: qup-uart7-default {
>   				pinmux {
>   					pins = "gpio6", "gpio7";
> @@ -1707,6 +1761,14 @@
>   				};
>   			};
>   
> +			qup_uart10_sleep: qup-uart10-sleep {
> +				pinmux {
> +					pins = "gpio86", "gpio87",
> +					       "gpio88", "gpio89";
> +					function = "gpio";
> +				};
> +			};
> +
>   			qup_uart11_default: qup-uart11-default {
>   				pinmux {
>   					pins = "gpio53", "gpio54",
> @@ -1715,6 +1777,14 @@
>   				};
>   			};
>   
> +			qup_uart11_sleep: qup-uart11-sleep {
> +				pinmux {
> +					pins = "gpio53", "gpio54",
> +					       "gpio55", "gpio56";
> +					function = "gpio";
> +				};
> +			};
> +
>   			sdc1_on: sdc1-on {
>   				pinconf-clk {
>   					pins = "sdc1_clk";

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

