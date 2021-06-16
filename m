Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106193A9B61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 15:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbhFPNED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 09:04:03 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:45495 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbhFPNEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 09:04:01 -0400
Received: from [192.168.1.79] (bband-dyn73.178-41-129.t-com.sk [178.41.129.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B28843ED71;
        Wed, 16 Jun 2021 15:01:53 +0200 (CEST)
Date:   Wed, 16 Jun 2021 15:01:47 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v3 1/2] arch: arm64: dts: qcom: Add support for SM6125
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <ZIPSUQ.3JME0AID86CV1@somainline.org>
In-Reply-To: <YMlF/aPn+253UIHn@builder.lan>
References: <20210613080522.25230-1-martin.botka@somainline.org>
        <YMlF/aPn+253UIHn@builder.lan>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On Tue, Jun 15 2021 at 07:29:49 PM -0500, Bjorn Andersson 
<bjorn.andersson@linaro.org> wrote:
> On Sun 13 Jun 03:05 CDT 2021, Martin Botka wrote:
> 
>>  This commits adds the Device tree file for SM6125 SoC.
>> 
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
> 
> Thanks for your work on this Martin, just spotted a few minor 
> finishing
> touches below.

:)

> 
>>  ---
>>  Changes in V2:
>>  Update compatibles for mailbox & pinctrl
>>  Changes in V3:
>>  Fix reg for sdhci1
>>  Replace hc_mem with hc and core_mem with core
>>   arch/arm64/boot/dts/qcom/sm6125.dtsi | 603 
>> +++++++++++++++++++++++++++
>>   1 file changed, 603 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sm6125.dtsi
>> 
>>  diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> [..]
>>  +	soc {
>>  +		#address-cells = <1>;
>>  +		#size-cells = <1>;
>>  +		ranges = <0x00 0x00 0x00 0xffffffff>;
>>  +		compatible = "simple-bus";
>>  +
>>  +		tcsr_mutex_regs: syscon@340000 {
> 
> It's no longer valid to have a stray syscon like this, so please 
> update
> this in accordance with the tcsr mutex binding.
> 
> If this platform needs to poke at the registers at the end of the 
> memory
> region, you can do compatible = "qcom,tcsr-mutex", "syscon"; to make 
> it
> represent both things.

ack

> 
>>  +			compatible = "syscon";
>>  +			reg = <0x00340000 0x20000>;
>>  +		};
>>  +
>>  +		tlmm: pinctrl@500000 {
>>  +			compatible = "qcom,sm6125-tlmm";
>>  +			reg = <0x00500000 0x400000>,
>>  +				<0x00900000 0x400000>,
>>  +				<0x00d00000 0x400000>;
>>  +			reg-names = "west", "south", "east";
>>  +			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
>>  +			gpio-controller;
>>  +			gpio-ranges = <&tlmm 0 0 134>;
>>  +			#gpio-cells = <2>;
>>  +			interrupt-controller;
>>  +			#interrupt-cells = <2>;
>>  +
>>  +			sdc2_state_on: sdc2-on {
> 
> As I just forced Konrad to move the on-state definition to the board
> file, can you please do the same?

ofc

> 
>>  +				clk {
>>  +					pins = "sdc2_clk";
>>  +					bias-disable;
>>  +					drive-strength = <16>;
>>  +				};
>>  +
>>  +				cmd {
>>  +					pins = "sdc2_cmd";
>>  +					bias-pull-up;
>>  +					drive-strength = <10>;
>>  +				};
>>  +
>>  +				data {
>>  +					pins = "sdc2_data";
>>  +					bias-pull-up;
>>  +					drive-strength = <10>;
>>  +				};
>>  +
>>  +				sd-cd {
>>  +					pins = "gpio98";
>>  +					bias-pull-up;
>>  +					drive-strength = <2>;
>>  +				};
>>  +			};
>>  +
>>  +			sdc2_state_off: sdc2-off {
> 
> This should be common between all boards (except possibly the cd 
> line),
> so this is okay to share here.

Do you want me to move the cd as well or
do you want it to stay in here?

> 
>>  +				clk {
>>  +					pins = "sdc2_clk";
>>  +					bias-disable;
>>  +					drive-strength = <2>;
>>  +				};
>>  +
>>  +				cmd {
>>  +					pins = "sdc2_cmd";
>>  +					bias-pull-up;
>>  +					drive-strength = <2>;
>>  +				};
>>  +
>>  +				data {
>>  +					pins = "sdc2_data";
>>  +					bias-pull-up;
>>  +					drive-strength = <2>;
>>  +				};
>>  +
>>  +				sd-cd {
>>  +					pins = "gpio98";
>>  +					bias-disable;
>>  +					drive-strength = <2>;
>>  +				};
>>  +			};
>>  +		};
>>  +
> [..]
>>  +
>>  +		usb3: usb@4ef8800 {
>>  +			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
>>  +			reg = <0x04ef8800 0x400>;
>>  +			#address-cells = <1>;
>>  +			#size-cells = <1>;
>>  +			ranges;
>>  +
>>  +			clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
>>  +				<&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
>>  +				<&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>>  +				<&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>>  +				<&gcc GCC_USB30_PRIM_SLEEP_CLK>,
>>  +				<&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
>>  +
>>  +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>>  +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>>  +			assigned-clock-rates = <19200000>, <66666667>;
>>  +
>>  +			power-domains = <&gcc USB30_PRIM_GDSC>;
>>  +			qcom,select-utmi-as-pipe-clk;
> 
> Stray space at the end of this line.

Oopsie.

> 
>>  +			status = "disabled";
>>  +
>>  +			usb3_dwc3: dwc3@4e00000 {
> 
> These should be usb@ now.

ack

> 
>>  +				compatible = "snps,dwc3";
>>  +				reg = <0x04e00000 0xcd00>;
>>  +				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
>>  +				phys = <&hsusb_phy1>;
>>  +				phy-names = "usb2-phy";
>>  +				snps,dis_u2_susphy_quirk;
>>  +				snps,dis_enblslpm_quirk;
>>  +				maximum-speed = "high-speed";
>>  +				dr_mode = "peripheral";
>>  +			};
>>  +		};
> 
> Thanks,
> Bjorn


