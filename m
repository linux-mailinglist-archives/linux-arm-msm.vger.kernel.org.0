Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 566D810AC59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 10:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfK0JBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 04:01:08 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:54440
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726112AbfK0JBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 04:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574845267;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=/FYkTuY+LSN9o25C15XeQWbPXu5BJmnWfDm9uE5K0cA=;
        b=TMm3m1/91ExRDCMLB8pJ6x0cX5rFP8AUa2GNo5KGDKpqqNnE+h1v/m8pmNbadOZq
        15qbbBP0ZOIAVLtW4P5naY/p3Iu8jD8717CiUUPvOmDZnz1G5DBc+fHsetkQ2zb90YB
        IsicgbQYAZ0z0YdrA1mMS6shwab4DPXVY79YRbGw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574845267;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=/FYkTuY+LSN9o25C15XeQWbPXu5BJmnWfDm9uE5K0cA=;
        b=SdpIEpRHyQDsTefS5/UEb4j2gq6rYwfKjTe7s9OpQlJ0fgwk64BgO9mFKTGEpVtj
        K0kIC06KEt3Dqg2R+mGHQltz6j/v28P8WoNuNxMyCIL4ypG1ID8gKXNQlkk4QwKugbL
        kPBzHW3nxYGERsjxgNzk9LDplxikkDPyB1w7n+Qg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5641C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
References: <1573795421-13989-1-git-send-email-sanm@codeaurora.org>
 <1573795421-13989-2-git-send-email-sanm@codeaurora.org>
 <20191122005117.GM27773@google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <0101016eac17bd3b-a4e688d8-03dd-45de-8e01-8052d9227752-000000@us-west-2.amazonses.com>
Date:   Wed, 27 Nov 2019 09:01:07 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191122005117.GM27773@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-SES-Outgoing: 2019.11.27-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

Thanks for the review.

On 11/22/2019 6:21 AM, Matthias Kaehlcke wrote:
> Hi Sandeep,
>
> On Fri, Nov 15, 2019 at 10:53:41AM +0530, Sandeep Maheswaram wrote:
>> Add nodes for DWC3 USB controller, QMP and QUSB PHYs.
>>
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180-idp.dts |  25 ++++++++
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi    | 105 ++++++++++++++++++++++++++++++++
>>   2 files changed, 130 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 666e9b9..2c7dbdc 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>
>> ...
>>
>> +		usb_1: usb@a6f8800 {
>> +			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
>> +			reg = <0 0x0a6f8800 0 0x400>;
>> +			status = "disabled";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +			dma-ranges;
>> +
>> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
>> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
>> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
>> +			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
>> +				      "sleep";
>> +
>> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>> +			assigned-clock-rates = <19200000>, <150000000>;
>> +
>> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hs_phy_irq", "ss_phy_irq",
>> +					  "dm_hs_phy_irq", "dp_hs_phy_irq";
>> +
>> +			power-domains = <&gcc USB30_PRIM_GDSC>;
>> +
>> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
>> +
>> +			usb_1_dwc3: dwc3@a600000 {
>> +				compatible = "snps,dwc3";
>> +				reg = <0 0x0a600000 0 0xe000>;
>> +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>> +				iommus = <&apps_smmu 0x540 0>;
>> +				snps,dis_u2_susphy_quirk;
>> +				snps,dis_enblslpm_quirk;
>> +				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>> +				phy-names = "usb2-phy", "usb3-phy";
>> +			};
> I see the following message at boot:
>
> [    4.248436] dwc3 a600000.dwc3: Failed to get clk 'ref': -2
>
> Apparently the driver is operational regardless, however the binding lists
> the clocks as required:
>
>    Required properties:
>     ...
>     - clock-names: should contain "ref", "bus_early", "suspend"
>     - clocks: list of phandle and clock specifier pairs corresponding to
>               entries in the clock-names property.
>
>    [Documentation/devicetree/bindings/usb/dwc3.txt]
>
> The driver code also has a comment stating that the clocks should be
> specified:
>
>    /*
>     * Clocks are optional, but new DT platforms should support all
>     * clocks as required by the DT-binding.
>     */
>
>    [drivers/usb/dwc3/core.txt]
We are implenting all the required clocks in glue driver 
drivers/usb/dwc3/dwc3-qcom.c.

Also there is exception for qcom,dwc3 in documentation

Documentation/devicetree/bindings/usb/dwc3.txt


Exception for clocks:

clocks are optional if the parent node (i.e. glue-layer) is compatible to
one of the following:
"amlogic,meson-axg-dwc3"
"amlogic,meson-gxl-dwc3"
"cavium,octeon-7130-usb-uctl"
"qcom,dwc3"
"samsung,exynos5250-dwusb3"
"samsung,exynos5433-dwusb3"
"samsung,exynos7-dwusb3"
"sprd,sc9860-dwc3"
"st,stih407-dwc3"
"ti,am437x-dwc3"
"ti,dwc3"
"ti,keystone-dwc3"
"rockchip,rk3399-dwc3"
"xlnx,zynqmp-dwc3"


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

