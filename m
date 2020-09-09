Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA3B2633DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 19:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730605AbgIIRLL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 13:11:11 -0400
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:42810
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730307AbgIIPds (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 11:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599661184;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=WjDONsuBH7IGcBm3DuSDqu/G8Oq6gOfRjVZiH4J/Zdw=;
        b=gR1qzHKQVGqAvDMd8Sl1M4Hf+SCteui5S9G/1NQVaUAr7GleRQnQsIs4Xt8i4j7Y
        0Iv6Ub/sDh5ALCVnKt1KIasjozEC7yQvkdZaLA9bZi4f77wXJNNOBbK02LcULD7rL7N
        Cz8mk8YwkhZlXWK/p5z6+m+OnPEP/JxaMcQUyldw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599661184;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=WjDONsuBH7IGcBm3DuSDqu/G8Oq6gOfRjVZiH4J/Zdw=;
        b=VkNDQtylz+1BehymhumYgj2veKe4Sypp/lqs5bacOb8x/ThrRB6JWjc+mY59cZGE
        XNhVbKgv6XFiE8WhoqfcKX9TsdBBg3NyJ5Q4mecxCUwUD2XaP/pMKe70uRXFrRd9m7g
        +exA5sSk2j5WIyLyJ0A8SBOaUkz1s9clAkjnJPMs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 9 Sep 2020 14:19:44 +0000
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V4 1/4] arm64: dts: sc7180: Add wakeup support over UART
 RX
In-Reply-To: <20200903160524.GH3419728@google.com>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
 <1599145498-20707-2-git-send-email-skakit@codeaurora.org>
 <20200903160524.GH3419728@google.com>
Message-ID: <01010174733c94d4-bf866578-b2de-4720-bc0f-bed3472a4070-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.09-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2020-09-03 21:35, Matthias Kaehlcke wrote:
> On Thu, Sep 03, 2020 at 08:34:55PM +0530, satya priya wrote:
>> Add the necessary pinctrl and interrupts to make UART wakeup capable.
>> 
>> If QUP function is selected in sleep state, UART RTS/RFR is pulled 
>> high
>> during suspend and BT SoC not able to send wakeup bytes. So, configure
>> GPIO mode in sleep state to keep it low during suspend.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V2:
>>  - As per Matthias's comment added wakeup support for all the UARTs
>>    of SC7180.
>> 
>> Changes in V3:
>>  - No change.
>> 
>> Changes in V4:
>>  - As per Matthias's comment, added the reason for configuring GPIO
>>    mode for sleep state in commit text.
>> 
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 98 
>> ++++++++++++++++++++++++++++++------
>>  1 file changed, 84 insertions(+), 14 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index d46b383..855b13e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -793,9 +793,11 @@
>>  				reg = <0 0x00880000 0 0x4000>;
>>  				clock-names = "se";
>>  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
>> -				pinctrl-names = "default";
>> +				pinctrl-names = "default", "sleep";
>>  				pinctrl-0 = <&qup_uart0_default>;
>> -				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-1 = <&qup_uart0_sleep>;
>> +				interrupts-extended = <&intc GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>,
>> +							<&tlmm 37 IRQ_TYPE_EDGE_FALLING>;
>>  				power-domains = <&rpmhpd SC7180_CX>;
>>  				operating-points-v2 = <&qup_opp_table>;
>>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt 
>> SLAVE_QUP_CORE_0>,
>> @@ -845,9 +847,11 @@
>>  				reg = <0 0x00884000 0 0x4000>;
>>  				clock-names = "se";
>>  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
>> -				pinctrl-names = "default";
>> +				pinctrl-names = "default", "sleep";
>>  				pinctrl-0 = <&qup_uart1_default>;
>> -				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-1 = <&qup_uart1_sleep>;
>> +				interrupts-extended = <&intc GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
>> +							<&tlmm 3 IRQ_TYPE_EDGE_FALLING>;
>>  				power-domains = <&rpmhpd SC7180_CX>;
>>  				operating-points-v2 = <&qup_opp_table>;
>>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt 
>> SLAVE_QUP_CORE_0>,
>> @@ -931,9 +935,11 @@
>>  				reg = <0 0x0088c000 0 0x4000>;
>>  				clock-names = "se";
>>  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
>> -				pinctrl-names = "default";
>> +				pinctrl-names = "default", "sleep";
>>  				pinctrl-0 = <&qup_uart3_default>;
>> -				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-1 = <&qup_uart3_sleep>;
>> +				interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
>> +							<&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
>>  				power-domains = <&rpmhpd SC7180_CX>;
>>  				operating-points-v2 = <&qup_opp_table>;
>>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt 
>> SLAVE_QUP_CORE_0>,
>> @@ -1017,9 +1023,11 @@
>>  				reg = <0 0x00894000 0 0x4000>;
>>  				clock-names = "se";
>>  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
>> -				pinctrl-names = "default";
>> +				pinctrl-names = "default", "sleep";
>>  				pinctrl-0 = <&qup_uart5_default>;
>> -				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-1 = <&qup_uart5_sleep>;
>> +				interrupts-extended = <&intc GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
>> +							<&tlmm 28 IRQ_TYPE_EDGE_FALLING>;
>>  				power-domains = <&rpmhpd SC7180_CX>;
>>  				operating-points-v2 = <&qup_opp_table>;
>>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt 
>> SLAVE_QUP_CORE_0>,
>> @@ -1084,9 +1092,11 @@
>>  				reg = <0 0x00a80000 0 0x4000>;
>>  				clock-names = "se";
>>  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
>> -				pinctrl-names = "default";
>> +				pinctrl-names = "default", "sleep";
>>  				pinctrl-0 = <&qup_uart6_default>;
>> -				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-1 = <&qup_uart6_sleep>;
>> +				interrupts-extended = <&intc GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
>> +							<&tlmm 62 IRQ_TYPE_EDGE_FALLING>;
>>  				power-domains = <&rpmhpd SC7180_CX>;
>>  				operating-points-v2 = <&qup_opp_table>;
>>  				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt 
>> SLAVE_QUP_CORE_1>,
>> @@ -1256,9 +1266,11 @@
>>  				reg = <0 0x00a90000 0 0x4000>;
>>  				clock-names = "se";
>>  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
>> -				pinctrl-names = "default";
>> +				pinctrl-names = "default", "sleep";
>>  				pinctrl-0 = <&qup_uart10_default>;
>> -				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-1 = <&qup_uart10_sleep>;
>> +				interrupts-extended = <&intc GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
>> +							<&tlmm 89 IRQ_TYPE_EDGE_FALLING>;
>>  				power-domains = <&rpmhpd SC7180_CX>;
>>  				operating-points-v2 = <&qup_opp_table>;
>>  				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt 
>> SLAVE_QUP_CORE_1>,
>> @@ -1308,9 +1320,11 @@
>>  				reg = <0 0x00a94000 0 0x4000>;
>>  				clock-names = "se";
>>  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
>> -				pinctrl-names = "default";
>> +				pinctrl-names = "default", "sleep";
>>  				pinctrl-0 = <&qup_uart11_default>;
>> -				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-1 = <&qup_uart11_sleep>;
>> +				interrupts-extended = <&intc GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
>> +							<&tlmm 56 IRQ_TYPE_EDGE_FALLING>;
>>  				power-domains = <&rpmhpd SC7180_CX>;
>>  				operating-points-v2 = <&qup_opp_table>;
>>  				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt 
>> SLAVE_QUP_CORE_1>,
>> @@ -1638,6 +1652,14 @@
>>  				};
>>  			};
>> 
>> +			qup_uart0_sleep: qup-uart0-sleep {
>> +				pinmux {
>> +					pins = "gpio34", "gpio35",
>> +					       "gpio36", "gpio37";
>> +					function = "gpio";
>> +				};
>> +			};
>> +
>>  			qup_uart1_default: qup-uart1-default {
>>  				pinmux {
>>  					pins = "gpio0", "gpio1",
>> @@ -1646,6 +1668,14 @@
>>  				};
>>  			};
>> 
>> +			qup_uart1_sleep: qup-uart1-sleep {
>> +				pinmux {
>> +					pins = "gpio0", "gpio1",
>> +					       "gpio2", "gpio3";
>> +					function = "gpio";
>> +				};
>> +			};
>> +
>>  			qup_uart2_default: qup-uart2-default {
>>  				pinmux {
>>  					pins = "gpio15", "gpio16";
>> @@ -1661,6 +1691,14 @@
>>  				};
>>  			};
>> 
>> +			qup_uart3_sleep: qup-uart3-sleep {
>> +				pinmux {
>> +					pins = "gpio38", "gpio39",
>> +					       "gpio40", "gpio41";
>> +					function = "gpio";
>> +				};
>> +			};
>> +
>>  			qup_uart4_default: qup-uart4-default {
>>  				pinmux {
>>  					pins = "gpio115", "gpio116";
>> @@ -1676,6 +1714,14 @@
>>  				};
>>  			};
>> 
>> +			qup_uart5_sleep: qup-uart5-sleep {
>> +				pinmux {
>> +					pins = "gpio25", "gpio26",
>> +					       "gpio27", "gpio28";
>> +					function = "gpio";
>> +				};
>> +			};
>> +
>>  			qup_uart6_default: qup-uart6-default {
>>  				pinmux {
>>  					pins = "gpio59", "gpio60",
>> @@ -1684,6 +1730,14 @@
>>  				};
>>  			};
>> 
>> +			qup_uart6_sleep: qup-uart6-sleep {
>> +				pinmux {
>> +					pins = "gpio59", "gpio60",
>> +					       "gpio61", "gpio62";
>> +					function = "gpio";
>> +				};
>> +			};
>> +
>>  			qup_uart7_default: qup-uart7-default {
>>  				pinmux {
>>  					pins = "gpio6", "gpio7";
>> @@ -1713,6 +1767,14 @@
>>  				};
>>  			};
>> 
>> +			qup_uart10_sleep: qup-uart10-sleep {
>> +				pinmux {
>> +					pins = "gpio86", "gpio87",
>> +					       "gpio88", "gpio89";
>> +					function = "gpio";
>> +				};
>> +			};
>> +
>>  			qup_uart11_default: qup-uart11-default {
>>  				pinmux {
>>  					pins = "gpio53", "gpio54",
>> @@ -1721,6 +1783,14 @@
>>  				};
>>  			};
>> 
>> +			qup_uart11_sleep: qup-uart11-sleep {
>> +				pinmux {
>> +					pins = "gpio53", "gpio54",
>> +					       "gpio55", "gpio56";
>> +					function = "gpio";
>> +				};
>> +			};
>> +
>>  			sdc1_on: sdc1-on {
>>  				pinconf-clk {
>>  					pins = "sdc1_clk";
> 
> It seems only the RTS pin actually requires a pinmux change. One could
> argue that only the muxing of this pin should be changed in sleep mode.
> But well, changing all pins to GPIO simplifies the config, so I guess
> it's ok as long as there are no side effects.
> 
> I noticed you changed only the UARTs that have RTS/CTS signals. Do the
> others not support wakeup? I understand that the pinmux change isn't
> needed for these UARTs, since they have no RTS signal, however I'd 
> expect
> them to need the 'interrupts-extended' entry if they support wakeup.

We are planning to add the wakeup related changes(interrupts-extended, 
pin ctrls) to only uart3 in board specific file. As we understand, this 
wakeup is an optional feature and cannot be added to all the UARTs. So, 
now all the changes will be added in board specific files including the 
pinmux change for sleep state.

Thanks,
Satya Priya

