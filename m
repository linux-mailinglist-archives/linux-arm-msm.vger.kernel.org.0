Return-Path: <linux-arm-msm+bounces-81826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D45AC5C659
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 10:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 437D03A3E51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669D03081D3;
	Fri, 14 Nov 2025 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxsQalZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A420327D782
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114118; cv=none; b=tXr/Ee6FC+vs8Cw5puhcAn55bAYVCOVj0+4Hfo4gQ4AMMosoBprUxbtUNQOqrU24/WlACs7de59XAD98jasAUxT60y6t4wUORcULk/DEqTcTT8tCOM2Ng42iIBHL5iplrriM6FR2nryGIERz4Y0MTWocVi/R/sOd71h9oLi5CQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114118; c=relaxed/simple;
	bh=6ykatkHi9vk1jJ+BUO783kon7P4OsdSmpxFrAex1tu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWIDIXucEYLtaVnj/2PmUeF9l7xVD6jcxZdmiTzjEUxNmNsdU0j6QSTaDRGWYf5co3VBULPWQvKkuFS89KnB9+bTqMI1LtXDU/9S/2Mr7WZiPIJmhk/85PPMXo1zm50aHOgLpiIJJS4qhwsN8sw+tWFuPOvBjmBWEKEiYEHsVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxsQalZn; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2984dfae0acso21507235ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 01:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763114116; x=1763718916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B3rF2qP54FtUyeehy8NT4VAPppHdkI/TPlGoSBBxV4w=;
        b=bxsQalZnqE2qR3yz+OIYNv/8kzVvwQ1cIrlDJ2jvBtL0RsS5BENZnWRFeWQjsUMLJT
         Ld8aM2j8Q/OQpi/UXGLDRbVw6T5pee9UtQafNK799ol1n0HUAlqdsTR1ypeWepqBImo3
         u2/sErjM4RTp6uM1uFg2aORuCTq9nlcnM0Aus9Z9vmfElVlt+nxaFDPepDYMFocwlApk
         uGMzI2tSTRsFRXZ2WvZq4JrPocBPZ+GZ/2Le503R3WJ3xJsOuML+eBK/9wv+Izjt7cWW
         Ru9oaqRK+d/SP3LYA0LW/rBiZ//xnBVIyn7n0Wiuvz6EVbuze2PmkDChhyjhGnkdsO69
         UzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763114116; x=1763718916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3rF2qP54FtUyeehy8NT4VAPppHdkI/TPlGoSBBxV4w=;
        b=Sz0P12qz9HpJkRTNddaUURw9rNtAgSdSNFRZxCaF4OHEX4A4AWbVlVaDx6SsdkY1pf
         n9eCVYAUiZhCW/juQg+hN61z63exwhOOU1sMEBni/OJA1mdhduOGne26BoWbV+EqKtiO
         zDQnrCzWavh8yu4ZBg6usWIw93SpBC/4PZlIMmf/xRc+Vtg8oKyKjR1jiJBgrNy+rn3X
         jYzarYV1GfL8IsAv7ptmLo5wuDdl/3LExg2fD3540k+w2kIdtbEy4b7ttldOK7mNJhff
         Rt8Wzgt8aeZslPby82K3Y5rNqNngNFdXTKZRHeDV3GHZDSalm2EMU2g0cl4nWeRMk1D5
         Ai8w==
X-Forwarded-Encrypted: i=1; AJvYcCUwmhRSJ6UBosVdEvmbs7WnejxpXq3u34RFBlCa5gyjYWPdq3+bpF/SnW+Xzi7JvnfNjz+sEBa8bjiPC/CQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGItniQi9E8iE2MKJYQhhF67/L14gS7gRl30Mv+pgrcRkzMQV
	AQJEO5I35zbDp3LQOkh559F0La4YnlL3sylrD8Depw3/Afu+oRo1edwN
X-Gm-Gg: ASbGncvzexgv2uhfwmh+pvTl7fjor4ka5NRIqOZ4MvySmb/A833Vtn53Osk2Wlv3lvU
	wDVlb/4DFl9ZplnzfU25h8o+Bkn+fGTqRzkO4aKTs/5n9sD9wKX965Z+UQ4UNEYAbcZfDH1It+g
	HJeYwYpMsjMsfXKo8JBSeL6DWxyInkyQ+yN/0gvsIcjmXfwZZRGQHFhw+nGeuslYtdyaLf+4g0T
	uXWLhkcH3zxhB0jSjDqJEA7BI+tmHldG8cDA6cgtHje2PBna88XQIfgeQle3DeWpzUDRPm/bzOy
	S6L9yPer0YH1mB/ITFGvTSjiInOTUaW4q04LWxowBBOMrrHb+GAfDrd+C3HcdRjMURjEkwG6GPl
	02UqQZCJxZTHScXwTla1SB+dS2gXJMW6dK975b0rjFhGgLKQM9Q1CdbRxixylBSbuCczmvm2sME
	Zrl1PjOhHz1onB65VXTlXOLX+J3EX8a0EIQhVErfAAMctH
X-Google-Smtp-Source: AGHT+IEr3mbqyKY8mKpDG2kFUh800+E/XK9q1+DxiO6L6va4dZLjL/9U9P/N4bvYrkawQB5Fg7kZFw==
X-Received: by 2002:a17:902:eccb:b0:26d:d860:3dae with SMTP id d9443c01a7336-2986a6b891emr33322115ad.3.1763114115881;
        Fri, 14 Nov 2025 01:55:15 -0800 (PST)
Received: from [172.17.49.162] ([103.218.174.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b11bfsm49808225ad.53.2025.11.14.01.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:55:15 -0800 (PST)
Message-ID: <5f117868-71f9-4412-a6c6-bbe7914390f6@gmail.com>
Date: Fri, 14 Nov 2025 15:25:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: talos-evk: Add support for
 dual-channel LVDS panel
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
 <20251028061636.724667-2-tessolveupstream@gmail.com>
 <fvtwdsthi242vxxlaqsbvqec4xkduch3fcslwqsjzkz4fidewn@mku374rrwlp7>
 <90185600-c08d-4548-8e66-16d3d0de8765@gmail.com>
 <p3bd3yfyzuayp7kysri4xf4dpmhhueyy6m5iqkwebigifttwlk@gy6xkodrzrjf>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <p3bd3yfyzuayp7kysri4xf4dpmhhueyy6m5iqkwebigifttwlk@gy6xkodrzrjf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/11/25 04:13, Bjorn Andersson wrote:
> On Fri, Oct 31, 2025 at 02:42:05PM +0530, Tessolve Upstream wrote:
>>
>>
>> On 29/10/25 21:18, Bjorn Andersson wrote:
>>> On Tue, Oct 28, 2025 at 11:46:36AM +0530, Sudarshan Shetty wrote:
>>>> This patch introduces a new device tree for the QCS615 Talos
>>>
>>> "This patch" doesn't make sense when you look at the git log once the
>>> patch has been accepted, please avoid it.
>>>
>>> Please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
>>>
>>> Start your commit message with a "problem description", describe what
>>> this LVDS talos is, why it should have it's own dts file etc.
>>
>> Okay, will update in next patch.
>>>
>>>> EVK platform with dual-channel LVDS display support.
>>>>
>>>> The new DTS file (`talos-evk-lvds.dts`) is based on the existing
>>>> `talos-evk.dts` and extends it to enable a dual-channel LVDS display
>>>> configuration using the TI SN65DSI84 DSI-to-LVDS bridge.
>>>>
>>>> where channel-A carries odd pixel and channel-B carries even pixel
>>>> on the QCS615 talos evk platform.
>>>>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>>>  arch/arm64/boot/dts/qcom/talos-evk-lvds.dts | 128 ++++++++++++++++++++
>>>>  2 files changed, 129 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index d5a3dd98137d..6e7b04e67287 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -307,6 +307,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-dsi.dtb
>>>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds.dtb
>>>>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>>>>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
>>>> new file mode 100644
>>>> index 000000000000..7ba4ab96ada6
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
>>>> @@ -0,0 +1,128 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +/dts-v1/;
>>>> +#include "talos-evk.dts"
>>>
>>> We don't include .dts files, split the existing one in a dtsi and dts
>>> file and then include the dtsi here. Or provide provide this as a dtso
>>> overlay on top of the dts.
>>>
>>> It's not clear to me which is the correct way, because you didn't
>>> adequately described how the SN65DSI84 enter the picture. Is it always
>>> there, but not part of the standard dip-switch configuration? Or is this
>>> some mezzanine?
>>>
>>> Regards,
>>> Bjorn
>>>
>>
>> Thanks for the feedback.
>> Currently, the Talos device tree hierarchy is organized as follows:
>>
>> talos-som.dtsi — defines SoM-specific interfaces
>> talos-evk.dts — adds carrier board (CB) interfaces such as MicroSD, power
>> button, and HDMI
>> talos-evk-lvds.dts — enables the LVDS display (includes SoM + CB +
>> LVDS + disables HDMI)
>>
>> The LVDS and HDMI displays share a common DSI output, so only one 
>> interface can be active at a time. At present, talos-evk-lvds.dts 
>> includes talos-evk.dts directly so that the base SoM and carrier 
>> interfaces (e.g., MicroSD, power button) remain available.
>>
> 
> Are you saying that there are 2 PCBs involved:

Yes, 2 PCBs involved,
> 1) The SOM
> 2) The EVK
> 
> And then perhaps a DIP switch or something to disable HDMI and select
> LVDS?

DIP switch is used to select either HDMI or LVDS
> 
> Or are you saying there are 3 PCBs:

No.
> 1) The SOM
> 2) The EVK
> 3) Something that provides LVDS - and disables HDMI on the EVK
> 
>> However, as you pointed out, including a .dts file directly is not
>> recommended upstream. To address this, I am considering the following 
>> restructuring options:
>>
>> Option 1: Introduce a talos-cb.dtsi
>>
>> talos-som.dtsi: SoM-specific interfaces
>> talos-cb.dtsi: common carrier board interfaces (MicroSD, power button, etc.)
> 
> I'm guessing that what you call "carrier board" most would call "EVK"?

Yes.
> 
>> talos-evk.dts: includes talos-som.dtsi + talos-cb.dtsi + HDMI
>> talos-evk-lvds.dts: includes talos-som.dtsi + talos-cb.dtsi + LVDS
> 
> 
>>
>> This approach avoids including .dts files directly and keeps the carrier
>> board interfaces centralized and reusable.It also cleanly separates SoM
>> and CB content and is consistent with how other Qualcomm platforms 
>> structure their EVK variants.
> 
> Can you point to an example where this is done?
> 
> The examples that comes to mind is e.g. the vison board/mezzanine. Those
> are separate physical things that you plug on top of the other boards,
> that's why they are described the way they are.

This example that comes to mind. Which is restructuring code that matches
Device Tree and hardware. 
> 
>>
>> Option 2: Move CB interfaces to talos-som.dtsi (disabled by default)
>>
>> Move MicroSD, power button, etc., to talos-som.dtsi with status = "disabled";
> 
> If those components are physically mounted on the SOM, then that is the
> correct thing to do.
> 
> If you suggest moving them there to solve some other problem, then it's
> not the right solution.

Understood.
> 
>> Enable these interfaces in each top-level DTS (e.g., talos-evk.dts,
>> talos-evk-lvds.dts)
>> While this also avoids .dts inclusion, it may make the SoM DTS 
>> unnecessarily complex and less reusable, as those CB-specific 
>> peripherals don’t belong to the SoM hardware.
>>
>> Let me know your prepared approach here.
> 
> My preferred approach is that you write DeviceTree that matches the
> hardware in front of you.

Which is taken care in v2 patch.
https://lore.kernel.org/all/20251104125208.1009695-1-tessolveupstream@gmail.com/T/#u
> 
> Regards,
> Bjorn
> 
>>>> +
>>>> +/ {
>>>> +
>>>> +	backlight: backlight {
>>>> +		compatible = "gpio-backlight";
>>>> +		gpios = <&tlmm 115 GPIO_ACTIVE_HIGH>;
>>>> +		default-on;
>>>> +	};
>>>> +
>>>> +	lcd0_pwm_en {
>>>> +		compatible = "pwm-gpio";
>>>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
>>>> +		pinctrl-0 = <&lcd0_bklt_pwm>;
>>>> +		pinctrl-names = "default";
>>>> +		#pwm-cells = <3>;
>>>> +	};
>>>> +
>>>> +	panel-lvds {
>>>> +		compatible = "auo,g133han01";
>>>> +
>>>> +		ports {
>>>> +			#address-cells = <1>;
>>>> +			#size-cells = <0>;
>>>> +
>>>> +			/* LVDS A (Odd pixels) */
>>>> +			port@0 {
>>>> +				reg = <0>;
>>>> +				dual-lvds-odd-pixels;
>>>> +
>>>> +				lvds_panel_out_a: endpoint {
>>>> +					remote-endpoint = <&sn65dsi84_out_a>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			/* LVDS B (Even pixels) */
>>>> +			port@1 {
>>>> +				reg = <1>;
>>>> +				dual-lvds-even-pixels;
>>>> +
>>>> +				lvds_panel_out_b: endpoint {
>>>> +					remote-endpoint = <&sn65dsi84_out_b>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>>> +&adv7535 {
>>>> +	status = "disabled";
>>>> +};
>>>> +
>>>> +&i2c1 {
>>>> +	clock-frequency = <400000>;
>>>> +
>>>> +	status = "okay";
>>>> +
>>>> +	sn65dsi84: sn65dsi84@2c {
>>>> +		compatible = "ti,sn65dsi84";
>>>> +		reg = <0x2c>;
>>>> +		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
>>>> +		ti,dsi-lanes = <4>;
>>>> +		ti,lvds-format = "jeida-24";
>>>> +		ti,lvds-bpp = <24>;
>>>> +
>>>> +		ports {
>>>> +			#address-cells = <1>;
>>>> +			#size-cells = <0>;
>>>> +
>>>> +			port@0 {
>>>> +				reg = <0>;
>>>> +
>>>> +				sn65dsi84_in: endpoint {
>>>> +					data-lanes = <0 1 2 3>;
>>>> +					remote-endpoint = <&mdss_dsi0_out>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			port@2 {
>>>> +				reg = <2>;
>>>> +
>>>> +				sn65dsi84_out_a: endpoint {
>>>> +					data-lanes = <0 1 2 3>;
>>>> +					remote-endpoint = <&lvds_panel_out_a>;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			port@3 {
>>>> +				reg = <3>;
>>>> +
>>>> +				sn65dsi84_out_b: endpoint {
>>>> +					data-lanes = <0 1 2 3>;
>>>> +					remote-endpoint = <&lvds_panel_out_b>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>>> +&mdss_dsi0 {
>>>> +	vdda-supply = <&vreg_l11a>;
>>>> +
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&mdss_dsi0_out {
>>>> +	remote-endpoint = <&sn65dsi84_in>;
>>>> +	data-lanes = <0 1 2 3>;
>>>> +};
>>>> +
>>>> +&tlmm {
>>>> +	lcd0_bklt_en: lcd0-bklt-en-state {
>>>> +		pins = "gpio115";
>>>> +		function = "gpio";
>>>> +		bias-disable;
>>>> +	};
>>>> +
>>>> +	lcd0_bklt_pwm: lcd0-bklt-pwm-state {
>>>> +		pins = "gpio59";
>>>> +		function = "gpio";
>>>> +		bias-disable;
>>>> +	};
>>>> +};
>>>> -- 
>>>> 2.34.1
>>>>
>>


