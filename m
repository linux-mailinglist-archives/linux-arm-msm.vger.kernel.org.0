Return-Path: <linux-arm-msm+bounces-77577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891BEBE351A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB5F4540C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 12:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6A632D432;
	Thu, 16 Oct 2025 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdkkkW/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFB732C324
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617163; cv=none; b=i7VXy0drzZ3RMJ9FE1A8XLtswzCjsqkL0lZKUPER/3uanLq7tHxwB2MXRVDj9jVcauTHa7j6VtKXIqfBNdxwL5LIdgk6Pdl4xBrhtRXgQ0K7DBuwkHrdqeU/gEM3e79CCnWEFLinI2LpfnfhdqlgRRK+iBE3JnoyAAcj8AJmMuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617163; c=relaxed/simple;
	bh=GGNMI3GPEu1sWY4diCaBz6F3wXsQrCZkTmTYg4I9RvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPnGxZbwCUiHwzEJf6WlxlHh3PbocKqlvfV1J9MIlXF3D6AhG317Fufe5ky9aYWgaFp4XyzwHZf0YWcogjyhNWPHaXX3ykhA2PGazeH2ERBUYN2iDPoO8R8yvaoKWkmBkxv8WoifcofUoAlD2OOCNcV1gmyNFV301+dvTXQ5mzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdkkkW/S; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so1011123a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760617161; x=1761221961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+bcf3umDoGYoksKlEOgW5aYfSBbLhP5hxsQ9JuZl78=;
        b=ZdkkkW/S71e6XLS4xC7ajj/CygkJCgfZG9ExdqdpeYaHFtL68jwEUJPHbQnA1XsZmz
         Jj/vv4r6rDTid4WzMQ4wNA0obq+1xG8CP8OwkOcPfESW+CA5gWyXfudHQfgzB0RO+DKm
         UgciWwrFb7pHWLt2l8Xn8Bs21Ui/APdsLZYphPTenFuIH4Qk+CcTHomaMPAbNGzQkAUl
         dxZYRi9nqJGWPeAMW4fK7o8HUQSPJS8lqaca4HbqSaG2ccB3H+8x/PWdzV1U82/xuEjQ
         6e/pk5OLyJzS/9B46r6lkcXf2g2jT17ZZ5bsD8Sko4h8eDQGUTF8PgvYOiw7g5GYE/od
         0V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760617161; x=1761221961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+bcf3umDoGYoksKlEOgW5aYfSBbLhP5hxsQ9JuZl78=;
        b=xC7jsypzWFQqQ0Vi5qLKLtzDs3Pke3zdV5o0zan3Mx48Ri6sjvIpkIUFz/64onPf07
         Zj+lomBBaKZgNVYEWf5ncKozr6N1l5n2mgQE+VBB2GIuf1fljr0OK5q/CEpnXJi07TTM
         8aIfUdM8xmf8vyCJ42xIK390QjcGEX+qfInTQZ0x2yXjvoecMznWLesxoMdFQ0MsBvQj
         bjxGN2mYtrtDHsNWade7lcRf9lMeeTFHiHlI32w/efUbO/aaTt8zcEn08Hs6epuFt1du
         vCVRuiWGphP1fiFWUM4U0hTYfnsPcRx5AfDcTF+xbyxec40e9D5iz7pcaebQlv43KAAq
         rkKg==
X-Forwarded-Encrypted: i=1; AJvYcCUNut/MNs7okcCfZJ0IT0+nETfMxCqgkFJDhFMmSGZAzpTseO5r7fo/MggBH89Ojsj+ECcmOFbPNAGPvfQ1@vger.kernel.org
X-Gm-Message-State: AOJu0YxbiBNUyZ5gHKySkjx1aXhKxOVxH9YZSB29wVddON22KQfPGWIw
	NKI5WCMhhgEg2paHilNEtJMK2Gbmk6xa8MXURUAnhms7icfgHBnWqnem
X-Gm-Gg: ASbGnctkYKUfOryl3wF3aabT466FKf95N0xrIhUXbDklGRNruM6upjL6T1g3U9uL9Pf
	O7N6Irp9u0BkRXd7OjnxYPcV6AvasRqG5eoW6NU/Cbuu+F4j8Ddcl94xvcdhl3yb801n0vZmHc0
	jglBBoiNIP9ZCGQzXjQQwMfRP5KQixYs1nN9SMkS08xpfm607fBFPLnhW+MlQdqv/g1q8O/o5M/
	tl/YbZgIVq94UnqdftMilaOhVTch5f9VoWFPOviZBWnvl87lxCNuU18m312NdXPVlLEIIh4I2Af
	q60/k/M7OtMyQ7BE6QSRn8Wficir33pPDo8rlnx4nTU48v3G1dtovyfIHAuRCOv4IvoK4DG90Rm
	e02d2TkUjdJnO+uK629l9WS319LeXTDH01eiaWrlZqkCR+XqXQB+3T9rYYFdN6eM0dFhvgwXJGP
	66kRZ6/iDtp9Gv
X-Google-Smtp-Source: AGHT+IGOqM/sSB8bc5tsx6A3B+0GYh0+swj8plpefRfH5q9tuhrr2ix8jkUCrZifLK7AgaZGx846KQ==
X-Received: by 2002:a17:90b:3d87:b0:32e:d011:ea1c with SMTP id 98e67ed59e1d1-33b51112272mr46341085a91.15.1760617160783;
        Thu, 16 Oct 2025 05:19:20 -0700 (PDT)
Received: from [172.17.49.162] ([103.218.174.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bbe7a0sm2701372a12.38.2025.10.16.05.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:19:20 -0700 (PDT)
Message-ID: <68db625e-d0c4-4035-a368-47d6a51467d0@gmail.com>
Date: Thu, 16 Oct 2025 17:49:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251014120223.1914790-1-tessolveupstream@gmail.com>
 <20251014120223.1914790-3-tessolveupstream@gmail.com>
 <wbg34hghu4gl277ppitctxgs5swlchjyjk425cjf4sbojlymlj@ca62bvncptny>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <wbg34hghu4gl277ppitctxgs5swlchjyjk425cjf4sbojlymlj@ca62bvncptny>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 15/10/25 03:45, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 05:32:23PM +0530, Sudarshan Shetty wrote:
>> Introduce the device tree support for the QCS615-based talos-evk
>> platform, which follows the SMARC (Smart Mobility ARChitecture)
>> standard. The platform is composed of two main hardware
>> components: the talos-evk-som and the talos-evk carrier board.
>>
>> The talos-evk-som is a compact System on Module that integrates the
>> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
>> SMARC standard, which defines a modular form factor allowing the SoM
>> to be paired with different carrier boards for varied applications.
>>
>> The talos-evk is one such carrier board, designed for evaluation
>> and development purposes. It provides additional peripherals
>> such as UART, USB, and other interfaces to enable rapid
>> prototyping and hardware bring-up.
>>
>> This initial device tree provides the basic configuration needed
>> to boot the platform to a UART shell. Further patches will extend
>> support for additional peripherals and subsystems.
>>
>> The initial device tree includes basic support for:
>>
>> - CPU and memory
>>
>> - UART
>>
>> - GPIOs
>>
>> - Regulators
>>
>> - PMIC
>>
>> - Early console
>>
>> - AT24MAC602 EEPROM
>>
>> - MCP2515 SPI to CAN
>>
>> QCS615 talos-evk uses a Quectel AF68E WiFi/BT module (PCIe for
>> WiFi and UART for Bluetooth), which is different from the RIDE
>> platform. Plan to enable these in a follow-up patch series.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 435 ++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/talos-evk.dts      |  42 ++
>>  3 files changed, 478 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>
>> +
>> +	extcon_usb_1: extcon-usb-1 {
>> +		compatible = "linux,extcon-usb-gpio";
>> +		vbus-gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>> +		id-gpio = <&pm8150_gpios 7 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-0 = <&usb1_vbus_det_default &usb1_id_det_default>;
>> +		pinctrl-names = "default";
>> +	};
> 
> Given that we are trying to switch to flattened DWC3 nodes and we are
> not going to support extcon in such a configuration (commit aeb0169217eb
> ("usb: dwc3: qcom: Remove extcon functionality from glue layer")), I
> don't think this is a way to go. Please add a proper
> gpio-usb-b-connector node.
> 
> Also... This is not correct if SW1 is switched to the USB-Host. The ID
> is still connected to the micro-USB port and so it might generate some
> unpredicted interference. Unfortunately, DT isn't well-fitting for
> describing board options and SW1 is definitely an SoM option. Depending
> on its position the EVK should either use this gpio-usb-b-connector or
> an onboard USB hub (which ideally should also be described in DT). So,
> it feels like you need two different DT files, one for each SW1
> position.

Thanks for the review.
The USB1 port on this board supports both host and device roles,
selectable using the SW1 switch on the SoM.

The board does not have VBUS or ID detect GPIOs — role selection
is purely manual via the hardware switch

The VBUS 5 V is sourced from the fixed 5 V rail (V5P0_OUT), which is
always on and not controlled by GPIO or regulator.

As suggested,
it feels like need two different DT files, one for each SW1 position.
talos-evk-som.dtsi - device-only mode
talos-evk-usbhost.dts - host-only mode

will it be okay to proceed with above scenario?
> 
>> +
>> +&pm8150_gpios {
>> +	usb2_en: usb2-en-state {
>> +		pins = "gpio10";
>> +		function = "normal";
>> +		output-enable;
>> +		power-source = <0>;
>> +	};
>> +
>> +	usb1_vbus_det_default: usb1-vbus-det-default-state {
>> +		pins = "gpio6";
>> +		function = "normal";
>> +		output-enable;
>> +		power-source = <0>;
>> +	};
>> +
>> +	usb1_id_det_default: usb1-id-det-default-state {
>> +		pins = "gpio7";
>> +		function = "normal";
>> +		output-enable;
>> +		power-source = <0>;
>> +	};
> 
> Do you want to also describe gpio8 here?
> 
>> +};
>> +
> 
> 
> [...]
> 
>> +&usb_1_hsphy {
>> +	vdd-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +/*
>> + * USB1 port supports both host and device modes.
>> + * By default, it operates in device mode.
>> + * To enable host mode, set switch SW1 to 'ON' position on the SoM.
> 
> Is it device mode or is it an OTG mode? I don't have carrier board
> schematics, so I don't see if it is possible to enable VBUS on the
> micro-USB or not.

The board default in device mode.
The USB1 port role is determined entirely by the hardware
switch SW1 on the SoM:

There are no ID or VBUS detect pins, so dynamic OTG switching is
not possible. dr_mode in the DTS is therefore set explicitly to 
"peripheral" for device mode or "host" for host mode.
>
>> + */
>> +
>> +&usb_1_dwc3 {
>> +	dr_mode = "otg";
> 
> JFYI: it's a default and can be omitted. Only host / peripheral needs to
> be specified explicitly.

Sure, will update in v4 patch accordingly,
> 
>> +	extcon = <&extcon_usb_1>;
>> +};
>> +
> 


