Return-Path: <linux-arm-msm+bounces-77256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD456BDB98A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 00:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9622F404293
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 22:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A15C2F5A2E;
	Tue, 14 Oct 2025 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCrUZjem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7913A2E7F13
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 22:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760480159; cv=none; b=d03I1rWnQyo9gxXSjLg5IqNAFzMDx9TUtdrLJvEZ+FgjlXcZtSu4O/GgIV4TXv8prqGmZ7WoIHb1SCA5H5SLlDVI3CDvFlprCzcaRptuky1QGfozoyYVpif3VrxkLuem0EIGtmurM88iqk4IXTZPrGKv/7DDbH/vuE3RLAw94y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760480159; c=relaxed/simple;
	bh=M1j8XJ30eYUAcq6WGW4g/VpJ8uFOzrAajOSPXNfUTzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqTYNCl8ZRLkrFOsWL5pf76Iq+yX+YwG9Qaj50oIZUJ4ypnr/bvQu7hhep69C9uv5VAJwsB0jiuMkgpzjNf49F7dywu+kF2qRfZhwCyUJMpPlEaQ0iiMPkPYb0ec3mTCPPbKjZsBHf/K3xLE6mmPIW5y7QVstCImZH45lLjP86M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCrUZjem; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKR5B7013441
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 22:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dO8P+KcI/d4Q8sn/1ijHLrD1
	nE6rqhU8O9CVWEaotTo=; b=KCrUZjemirsScd6We+F96ZU48x/Bqrn9hDPBGz/x
	8fJOgcczJWxMsYS/s+FaCi1AFaaDgb0Kty9Vd7r8/0RIPMThJX17tP3H5AkQBuff
	XEewIzafvzDjwIlwI1eNLy98PtsvBKnLKq+/pV+nF0XxJ/agln6Ngaoc1jV3s3Zn
	AX2WvGeEJUubf5DSRNgDDpoQKXBX1nTyLi4g7sRQoZtF7anAcdLHTDICKvdS3xFT
	we5yaqmQE6AEElwLJSy3LG8p1LOaBUp/mDLW4fR0aFssuHSHhmVQwlX3gU+vGUaX
	tSIgIO53siZ6uZw0shQAZdY9vqQojLcF/G+xt2EBo3QApg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdka5y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 22:15:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8645d397860so1359794685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760480155; x=1761084955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO8P+KcI/d4Q8sn/1ijHLrD1nE6rqhU8O9CVWEaotTo=;
        b=oBWWfwlFVS86uuo7phTiHrj6M7iuxHN1SpfNphvNIaptlbFcgnhZiP6yysuhiSAX8T
         PCacT5XU5YFENYd7OL5rBETGyawZVzhSz6LH/eeYSMJdwjvpKaxTbkJE1f1dfW/EWGa5
         yqDnO9+rnzEHKNgDzSW4evUW/wf/OfOE1TOVrojQqzqXidmTLyBcXVbyx4T0x5PVcJr1
         A2HztYMST421QGxu4F/DR1ZMVOo65YGNFhP8IuyZs2UioMgnLt7YsATfM2bidE4L9tOJ
         E+gc/ugbFRZPQVUCtyajSi2Ta6+C3az8/7LmM5+xkVaAuOtr8iAqIu9GoBwOHcMtKh6u
         tZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXvplefDiC0uyKmA1x8YLE/U1qUquHz9r1W23d05iPw+CTmpF2HCBJ7u9YCjMsU/mZ+0aesV8Zwnzejr7y0@vger.kernel.org
X-Gm-Message-State: AOJu0YyiCMPup7N8EAPfQJrj8/nNO6f3zIC4WUhM6eitxNja6u4+WQSM
	By3PmHnbPeQJqsW773ErwFCSrFbf9MRGxNzfv28Ha8+887DoiT9fwNMBVZkUpUqSWhWvRFwtjKC
	nAX7qQTAiNc9tO1tiOqDW9jz8bF4wAG39WIa/OQh03ym9Nxj844+BIAJQ/6/Kwo+20iWk
X-Gm-Gg: ASbGncux0CuAv1pO/P08hmohGG67QmdJLAiqHvZoR/fkZUU5Q5E3KcvNwngG+KGfaN/
	HIPyNZFl7aV/Esk7AO2qvY0BD99kn8RDWGYBTWhBwqXPpsShTeU3nRnn2wJ8q8KpuYbAOu5Nda7
	TjdsM/5/V0bF6K8R3h5bqvS/vBecc1VRJ0ZFwhrfFT6d8Gb4ajC1FUAtHG96CShVFGOuyC/zxKW
	WS42UjB7j4evWkBpKrWvNlzaRk0xHKdFk13b5kvyorkuDFL8QHTHic93iYOo0ne8wfHwDr3bqlx
	bDF7XyqjZJezZa8x+x8FcSKYzsdoQ5kZRjOTdRhQl7xFrhYqoCRrLrA4UD4GqcR4TwvEUKpAtr5
	Zj515lUqADJ1TUUErlTOv7anl3VIQwt8V7ZSNSoWUCWyds6Y7S30u
X-Received: by 2002:a05:622a:1a20:b0:4e7:250e:bbc4 with SMTP id d75a77b69052e-4e7250ebfe2mr130807101cf.69.1760480155068;
        Tue, 14 Oct 2025 15:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs72WZFEkjmQ1dyXbFz1Ye6bDNuzPRKg6wSnnk2SHSqHCWIZhOamKGqEdqEJtiaZPNUA4MTg==
X-Received: by 2002:a05:622a:1a20:b0:4e7:250e:bbc4 with SMTP id d75a77b69052e-4e7250ebfe2mr130806721cf.69.1760480154462;
        Tue, 14 Oct 2025 15:15:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591c20253bcsm957863e87.99.2025.10.14.15.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:15:53 -0700 (PDT)
Date: Wed, 15 Oct 2025 01:15:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for QCS615 talos
 evk board
Message-ID: <wbg34hghu4gl277ppitctxgs5swlchjyjk425cjf4sbojlymlj@ca62bvncptny>
References: <20251014120223.1914790-1-tessolveupstream@gmail.com>
 <20251014120223.1914790-3-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014120223.1914790-3-tessolveupstream@gmail.com>
X-Proofpoint-ORIG-GUID: Bt3JTG_RshlXYJsLCNNOk6ahbWec8RXm
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68eecb9c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=4ClYx_WmNUqONUsMR88A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Bt3JTG_RshlXYJsLCNNOk6ahbWec8RXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxVdm1oljEinR
 33+AD8OFOojy3d/tzsm81Mcz/7VzniWdbTNspC8SXWjr/ZvU9mbq9ghnc4YBuE+hM1jeEExwtWq
 IsVS9Y6rVzL0Fgs9g9zjpZ468Z7j6zwI6Dcdqzz9pqkXN/8ZYhEnbMcQ0fsz1enoM2EIBv8hWDL
 Ss8doODEysRr9ZXp4aHBvIgZby8PSAflMjBZ45SYyLI3nRgeJsE0NW667iSX9y0QOuLaFcMV5H8
 HL20W1jjSrfBlFNsBhlhbxRMYD8KNPBf+HJ/gbThp7m57gTg6zT9gZrbp7lkMiIosRrTDzKGGWF
 2/5wA42EzVhiTNsIHaZPTCo74r5k59p8e7fzNuhR7d3bOFSCNE0fVJvd+0RWOE87sbmdx0P2bB3
 SIRgggBQD+gZVKZVcTzTbB8ujzqiOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 05:32:23PM +0530, Sudarshan Shetty wrote:
> Introduce the device tree support for the QCS615-based talos-evk
> platform, which follows the SMARC (Smart Mobility ARChitecture)
> standard. The platform is composed of two main hardware
> components: the talos-evk-som and the talos-evk carrier board.
> 
> The talos-evk-som is a compact System on Module that integrates the
> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
> SMARC standard, which defines a modular form factor allowing the SoM
> to be paired with different carrier boards for varied applications.
> 
> The talos-evk is one such carrier board, designed for evaluation
> and development purposes. It provides additional peripherals
> such as UART, USB, and other interfaces to enable rapid
> prototyping and hardware bring-up.
> 
> This initial device tree provides the basic configuration needed
> to boot the platform to a UART shell. Further patches will extend
> support for additional peripherals and subsystems.
> 
> The initial device tree includes basic support for:
> 
> - CPU and memory
> 
> - UART
> 
> - GPIOs
> 
> - Regulators
> 
> - PMIC
> 
> - Early console
> 
> - AT24MAC602 EEPROM
> 
> - MCP2515 SPI to CAN
> 
> QCS615 talos-evk uses a Quectel AF68E WiFi/BT module (PCIe for
> WiFi and UART for Bluetooth), which is different from the RIDE
> platform. Plan to enable these in a follow-up patch series.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 435 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/talos-evk.dts      |  42 ++
>  3 files changed, 478 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 
> +
> +	extcon_usb_1: extcon-usb-1 {
> +		compatible = "linux,extcon-usb-gpio";
> +		vbus-gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
> +		id-gpio = <&pm8150_gpios 7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb1_vbus_det_default &usb1_id_det_default>;
> +		pinctrl-names = "default";
> +	};

Given that we are trying to switch to flattened DWC3 nodes and we are
not going to support extcon in such a configuration (commit aeb0169217eb
("usb: dwc3: qcom: Remove extcon functionality from glue layer")), I
don't think this is a way to go. Please add a proper
gpio-usb-b-connector node.

Also... This is not correct if SW1 is switched to the USB-Host. The ID
is still connected to the micro-USB port and so it might generate some
unpredicted interference. Unfortunately, DT isn't well-fitting for
describing board options and SW1 is definitely an SoM option. Depending
on its position the EVK should either use this gpio-usb-b-connector or
an onboard USB hub (which ideally should also be described in DT). So,
it feels like you need two different DT files, one for each SW1
position.

> +
> +&pm8150_gpios {
> +	usb2_en: usb2-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		output-enable;
> +		power-source = <0>;
> +	};
> +
> +	usb1_vbus_det_default: usb1-vbus-det-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		output-enable;
> +		power-source = <0>;
> +	};
> +
> +	usb1_id_det_default: usb1-id-det-default-state {
> +		pins = "gpio7";
> +		function = "normal";
> +		output-enable;
> +		power-source = <0>;
> +	};

Do you want to also describe gpio8 here?

> +};
> +


[...]

> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +/*
> + * USB1 port supports both host and device modes.
> + * By default, it operates in device mode.
> + * To enable host mode, set switch SW1 to 'ON' position on the SoM.

Is it device mode or is it an OTG mode? I don't have carrier board
schematics, so I don't see if it is possible to enable VBUS on the
micro-USB or not.

> + */
> +
> +&usb_1_dwc3 {
> +	dr_mode = "otg";

JFYI: it's a default and can be omitted. Only host / peripheral needs to
be specified explicitly.

> +	extcon = <&extcon_usb_1>;
> +};
> +

-- 
With best wishes
Dmitry

