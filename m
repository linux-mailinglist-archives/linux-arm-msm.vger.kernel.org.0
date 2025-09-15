Return-Path: <linux-arm-msm+bounces-73484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D984B570D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49F9A7A55BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8499D1F542A;
	Mon, 15 Sep 2025 07:05:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C72C08BE;
	Mon, 15 Sep 2025 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757919954; cv=none; b=lzV6HgTF0AChigLRRuUdsX2wPYf4Hefk8ZYkT9behHL2n9wEYDiIJBA9n0tJl3Jo1UnwsDvnyeZQMS1tKc+s1oPAV7ox/rDPc9EkOJsSMeT7EVQclRvRH0DkGdGysXRGpICxh3oJBVYjcHkB5TG8kJCEtNtKws+Dxup63r4GXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757919954; c=relaxed/simple;
	bh=EIMnJykjTERXw3Hp9tmJefnnn9xm1Sx8LbQbay9IOr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8CJw2UmEbK59JjQj1wYW7wxo6iW++7fRZZwEj4CpOUa/ZSFX/UKJARZJcYeucZxKnBoxpIDtIaOP//jNKeOjqPAcJ+Ig6WRLOXAbVqiq8bfzIcJnBFXBpX1xNiYHFBmgER5lgbidkQ6qpxI4ZxgKdHsEZXvL8RaQdwixolqJSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz11t1757919900tf5fda2a8
X-QQ-Originating-IP: 6+GqocOLC8mSQxIhBFQwffJkEU+ZOBm+O1rQWd/KJes=
Received: from [127.0.0.1] ( [116.234.26.9])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Sep 2025 15:04:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12997105335972763702
Message-ID: <8C476C0AA53F638B+b640da5b-8e9f-4580-b0f7-5c22c4429855@radxa.com>
Date: Mon, 15 Sep 2025 15:04:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 5/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable USB 3.0 and HDMI ports
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-5-045f7e92b3bb@radxa.com>
 <3d9ce086-dbcb-4e55-850e-89977cb88978@linaro.org>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <3d9ce086-dbcb-4e55-850e-89977cb88978@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N+/GyfuFbcLim/CNP6aWVDzMd+VCmM/dqcM8k2SwC6oIXRCJVvLiIDBN
	LsYpouR8KqK78FJqfTDrxk+F37pT/a+y2itBsl6/YYV7uPyVbjh5z2EZL5LLlYOO0iHwpn5
	zQo99kSthu0EmaO9NthJTuLHFjRzmqQyZJxf1VshuUpT1IPTB8l/4qi3l1LfZ66jYBsxs1X
	5Nz6FqLLrXnJKT9D6guUivJ/zuABIFerSNehiUvRfD+q5fn/g0LvYjQwi0nNF0byHCdBpjy
	FXxdlfIdwCNjxb3giRLjoc/lF9mzWvezH/3eRH+/po3HQObDiTTenfS3FZKL3dUAoX6LpYG
	1Zfzqz46HA7FG4yDX3Ja6adViYwOtUqWFA4gCyDETvWJzrVx6nQQq7AePPOgV2m/O0eYuyB
	xlZHmKx4fqNs8n/zkkH8Dri7Z4DKp9Fl28Cl6j9z5lZxoX+ygmTinqpGl67H/6xjbv//ZF3
	7P/58fl1D4orywnCDnMuHKMwZNAEe/XTzmVgdWvb1+taaU/d2BJSMS0Qy4Jl5+eT8BNSNXw
	klj3WXfFX8020gdyQkjS3AHk2OehQU8L3JSbHJGfh1tSHRdduilXNroI69mHGO0B/L70GIV
	Y5kpMEXgs5nd9c7Ay7Ffiky8TH55VSe7QdahQZp7+dsb5cnMUtb4Yvnug/Ie64Ox133YHTo
	NV8ylGMh1FQQMPtp1ZHGNzswu9aaaZcFldZI0RBgllMNeJLQ/U0D8Q6bGjgJckMZ5uTVrpp
	Ztvozjaxqd5B0evBac6xi9TfguOLS1Wjj0s3gSeLfqOnzimIL0qvjK4AJNBjdchqZDpbEfP
	vEXhqK1kBAzn/OWsdmZ+ufFdAcYdti5qAnsw8jegNi1vtHUwaj3IiSXjGaq74RJ5DbZB5GL
	q1YmgTsW/nH3GRPvGlkZjwXVMynX3ekbVad/vWGLxSRRy/DTGnlB3wRE3Sk8lP2itMxtlVD
	okRk3y+5nXibVfuqHUKFQNB3rLgJOpFA9w+M+TGxIvJhNREbNC5knD05AymKHIFXESaU9g/
	ZKOV4YCbGSYExs69GYOAHXGu7fDOJOWrumePnUq3qA3V6BWipGNG3Y4uN9ErI=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On 9/15/2025 2:51 PM, Neil Armstrong wrote:
> On 14/09/2025 17:57, Xilin Wu wrote:
>> This board doesn't feature a regular Type-C port. The usb_1_qmpphy's
>> RX1/TX1 pair is statically connected to the USB-A port, while its RX0/TX0
>> pair is connected to the RA620 DP-to-HDMI bridge.
>>
>> Add and enable the nodes for the features to work.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>
>> ---
>>
>> This change depends on the following patch series:
>> https://lore.kernel.org/all/20250908-topic-x1e80100-hdmi-v3-4- 
>> c53b0f2bc2fb@linaro.org/
>> ---
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 152 +++++++++++ 
>> ++++++++++
>>   1 file changed, 152 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/ 
>> arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> index 
>> 3bf85d68c97891db1f1f0b84fb5649803948e06f..12bc9a0fcfbfeaabf6ede351f96c61193a8261c0 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> @@ -78,6 +78,71 @@ chosen {
>>           stdout-path = "serial0:115200n8";
>>       };
>> +    usb3_con: connector {
>> +        compatible = "usb-a-connector";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +
>> +                usb3_con_hs_in: endpoint {
>> +                    remote-endpoint = <&usb_1_dwc3_hs>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +
>> +                usb3_con_ss_in: endpoint {
>> +                    remote-endpoint = <&usb_dp_qmpphy_out_usb>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    hdmi-bridge {
>> +        compatible = "radxa,ra620";
>> +
>> +        pinctrl-0 = <&dp_hot_plug_det>;
>> +        pinctrl-names = "default";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +
>> +                hdmi_bridge_in: endpoint {
>> +                    remote-endpoint = <&usb_dp_qmpphy_out_dp>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +
>> +                hdmi_bridge_out: endpoint {
>> +                    remote-endpoint = <&hdmi_connector_in>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    hdmi-connector {
>> +        compatible = "hdmi-connector";
>> +        label = "hdmi";
>> +        type = "a";
>> +
>> +        port {
>> +            hdmi_connector_in: endpoint {
>> +                remote-endpoint = <&hdmi_bridge_out>;
>> +            };
>> +        };
>> +    };
>> +
>>       leds {
>>           compatible = "gpio-leds";
>> @@ -504,6 +569,21 @@ &lpass_va_macro {
>>       status = "okay";
>>   };
>> +&mdss {
>> +    status = "okay";
>> +};
>> +
>> +&mdss_dp {
>> +    sound-name-prefix = "Display Port0";
>> +
>> +    status = "okay";
>> +};
>> +
>> +&mdss_dp_out {
>> +    data-lanes = <0 1>;
>> +    remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>> +};
>> +
>>   &pcie0 {
>>       perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
>>       wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
>> @@ -753,6 +833,22 @@ platform {
>>               sound-dai = <&q6apm>;
>>           };
>>       };
>> +
>> +    dp0-dai-link {
>> +        link-name = "DP0 Playback";
>> +
>> +        codec {
>> +            sound-dai = <&mdss_dp>;
>> +        };
>> +
>> +        cpu {
>> +            sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
>> +        };
>> +
>> +        platform {
>> +            sound-dai = <&q6apm>;
>> +        };
>> +    };
>>   };
>>   /* Pin 11, 29, 31, 32 in GPIO header */
>> @@ -967,6 +1063,58 @@ &ufs_mem_phy {
>>       status = "okay";
>>   };
>> +&usb_1 {
>> +    dr_mode = "host";
>> +
>> +    status = "okay";
>> +};
>> +
>> +&usb_1_dwc3_hs {
>> +    remote-endpoint = <&usb3_con_hs_in>;
>> +};
>> +
>> +&usb_1_hsphy {
>> +    vdda-pll-supply = <&vreg_l10c_0p88>;
>> +    vdda33-supply = <&vreg_l2b_3p072>;
>> +    vdda18-supply = <&vreg_l1c_1p8>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&usb_1_qmpphy {
>> +    vdda-phy-supply = <&vreg_l6b_1p2>;
>> +    vdda-pll-supply = <&vreg_l1b_0p912>;
>> +
>> +    /delete-property/ orientation-switch;
>> +
>> +    status = "okay";
>> +
>> +    ports {
>> +        port@0 {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            /delete-node/ endpoint;
>> +
>> +            /* RX1/TX1 is statically connected to USB-A port */
>> +            usb_dp_qmpphy_out_usb: endpoint@0 {
>> +                reg = <0>;
>> +
>> +                data-lanes = <2 3>;
>> +                remote-endpoint = <&usb3_con_ss_in>;
>> +            };
>> +
>> +            /* RX0/TX0 is statically connected to RA620 bridge */
>> +            usb_dp_qmpphy_out_dp: endpoint@1 {
>> +                reg = <1>;
>> +
>> +                data-lanes = <3 2>;
>> +                remote-endpoint = <&hdmi_bridge_in>;
>> +            };
> 
> In this WiP patchset endpoint@0 is suposed to be DisplayPort, and 
> endpoint@1 for USB3 lanes.
> 
> And you must not have colliding data-lanes, so it should be something like:
> 
>              /* DP0/DP1 is statically connected to a RA620 bridge*/
>              usb_dp_qmpphy_out_dp: endpoint@0 {
>                  reg = <0>;
> 
>                  data-lanes = <0 1>;
>                  remote-endpoint = <&hdmi_bridge_in>;
>              };
> 
>              /* RX0/TX0 is statically connected to an USB-A Connector */
>              usb_dp_qmpphy_out_usb: endpoint@1 {
>                  reg = <1>;
> 
>                  data-lanes = <2 3>;
>                  remote-endpoint = <&usb3_con_ss_in>;
>              };
> 
> But I just found out while reviewed my patchset is wrong... it should be:
> 
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            description: Display Port Output lanes of the PHY when used 
> with static mapping
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                minItems: 2
> +                maxItems: 4
> +                oneOf:
> +                  - items: # DisplayPort 2 lanes, normal orientation
> +                      - const: 3
> +                      - const: 2
> +                  - items: # DisplayPort 2 lanes, flipped orientation
> +                      - const: 0
> +                      - const: 1
> +                  - items: # DisplayPort 4 lanes, normal orientation
> +                      - const: 0
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3
> +                  - items: # DisplayPort 4 lanes, flipped orientation
> +                      - const: 3
> +                      - const: 2
> +                      - const: 1
> +                      - const: 0
> 
> and in driver:
> +static const u32 dp_2_data_lanes_mapping[][2] = {
> +    [TYPEC_ORIENTATION_NORMAL] = { 3, 2 },
> +    [TYPEC_ORIENTATION_REVERSE] = { 0, 1 },
> 
> Neil

The driver change in the WIP patchset assumes endpoint@0 to be USB, I 
forgot to mention that. Either the driver or the binding needs to be 
fixed indeed.

And I think there's another mistake in the driver:

--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4221,7 +4221,7 @@ static int qmp_combo_probe(struct platform_device 
*pdev)
                                 if (!memcmp(data_lanes, 
usb3_data_lane_mapping[i], sizeof(u32) * 2))
                                         break;

-                       if (i >= TYPEC_ORIENTATION_REVERSE)
+                       if (i > TYPEC_ORIENTATION_REVERSE)
                                 /* Property value is invalid, ignore 
property */
                                 goto usb3_mapping_done;

@@ -4265,7 +4265,7 @@ static int qmp_combo_probe(struct platform_device 
*pdev)
                                         break;
                         }

-                       if (i >= TYPEC_ORIENTATION_REVERSE)
+                       if (i > TYPEC_ORIENTATION_REVERSE)
                                 /* Property value is invalid, ignore 
property */
                                 goto dp_mapping_done;


After fixing this, the driver works properly with my DT at least.

> 
>   +        };
>> +    };
>> +};
>> +
>>   &usb_2 {
>>       dr_mode = "host";
>> @@ -986,6 +1134,10 @@ &venus {
>>   };
>>   /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> +&dp_hot_plug_det {
>> +    bias-disable;
>> +};
>> +
>>   &pcie0_clkreq_n {
>>       bias-pull-up;
>>       drive-strength = <2>;
>>
> 
> 

-- 
Best regards,
Xilin Wu <sophon@radxa.com>


