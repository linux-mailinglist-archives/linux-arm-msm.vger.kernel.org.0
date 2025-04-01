Return-Path: <linux-arm-msm+bounces-52977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E27CA77FB4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 17:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C32B4188F55D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 16:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E29820C460;
	Tue,  1 Apr 2025 15:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2BzDNkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71991F0E24
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523193; cv=none; b=P8S9X0MUoUODoh5NjBi0Qyu3gIkwwhdbNd7oXqnp45LE6Rt88kgKTteKQ+THfs6v9tiZ2Q55429dw8CrZDbdcIwDRKK+BVDWmHJegkpMOduoOVobkC8JooEhcif14vbFj/Splb4QtvWQYrT/Q9h0l4kxXvskp10EBZ/T1FIODJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523193; c=relaxed/simple;
	bh=s5G+D4Y4H48hG+JqN8iTc8KNENEqqJ+iDJISsHqOWj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBW6uyD3155sMfXeBJY3InbTjaej2UMYLyi4S55BBUaqYWvRnA44y1lpZFEVdDC0F+qOlK+38usXCBoUQH2fNb1tLmlNNPzHQ9RolOHHvoZn6yP7XYj4Pwus7FA2m63jxwpDnQpQEnr2AxRNbns4haVCb8JbPzSQEf6QOVA42lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2BzDNkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531C22p2026705
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 15:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVsiqH8BYsZ0fSUtLECQBLTo683Jv0XmjiQt/jiR8+c=; b=Y2BzDNkDrnHvj5Sr
	5ZWeCx9WABWv4Pdu5vqPYZLVVEhtJauoKguZa5ZJU7XOInjoKTXavRe7TxhcoBJS
	/wePpE3vtGLO1UeY+iIiTMyO2OVFcGbULvwCm+J18qwvYD++S/Nd/Q0EoLeAIOGK
	CsCvTNo27wxOna5HIw2ouVsFoiymWSo4PZPBErZYULJqGZuzNC6t8FactF4CoI6G
	a2garVXJhEVdelujTVZurNj7etbHTgDzA5dmnClJd0zlLiiL5tOPKeY6fZPlQFlW
	xuXsqP4UnZbnAQ558EVMhp0dsWWhuXNNzun9UIT0Ggg3yr++fsfqP7/fbOpy3q/a
	3Mi/Iw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v8gm1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 15:59:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8fec7ab4dso11526396d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 08:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523190; x=1744127990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVsiqH8BYsZ0fSUtLECQBLTo683Jv0XmjiQt/jiR8+c=;
        b=hHxjlzTEMAohK8r047T+2sdKX9N6istrERRaq88tOpKBxZa/Ri5PdVoZD8epLp2odW
         0cxAKoE0WqOsOkYunckF1VDERzMxliTtfv0C/FsVSgUtHjw4+hd6ZrLBunS9BHY5jycH
         QWrJ8ydty54ol6G39JoPhvX29zmiUKj4fWfSugi2+wZH+na6byzYxrlChZxUbPfE343B
         b51SbTAHXnUfuVu+oTbSnV0v3omoIHHeXdMuqJuB4RBlvozi2kVI489lceKT3hu0Mgyd
         8SazITn+YKKo+hw8LPPzKG2ChLk+ZpUUe6w3jhj5RYrlSLUnQ+8U9uXgryIvaADDyaQs
         Hs4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYn5jybf0qatu8I29aYe/W5eg8fEV/+8q3nJU1oklx7/NyRY7dsNBatIZ83b7/NOZ64DkkGRB0eLiL6xlW@vger.kernel.org
X-Gm-Message-State: AOJu0YxDpT11P56/U+6inpOaECYO6wfgpGSdGTVxfgw4kbmIEw2tKvF8
	PiSLIB8zODGpH49ihKS/p+iLZPMIB676m5sEWhrZuFm0ld8uAYulSgEwQVa1aISUtJIiNcxBepV
	qY9L1kDmeWguOR7ZsNQHQdljXVKbq1oS+SMZGCPc+4oEI8BU+0lP5ZMv1+G4L+rEl
X-Gm-Gg: ASbGncsAMENu3uU+4+xzfs1lf6QUvFSPQg5akr84nTukZ1TEcgd+KY8vQfH7BwGWP88
	RPmaV5bGdTzRHCi/1H14mw92EeOq8VfYkUcVVWVJFMeWfzHG9DhPsyXq9SSF2DjHcREZU9xNWtc
	kTgoaNqgiFomBom+XxURFObU1gPy9RAOqnqZD/DKm9TT9oPgQHa/zszKyfLxOLX7O+rtIquN9s+
	OVcAxQMBdfn+k5YnnrTWuDTK3ToyNCvD5jOIsPO768iOT3zl1i1GE6mr1hjAdj6Hmok4WDGeBV4
	rYfKPEwmaPQkDOgHvr55bzy7ubm/hAY0TUmRPhXtuZGLDF4AN0CTgsVRUh98AtMdHzBxUQ==
X-Received: by 2002:a05:6214:27ca:b0:6e8:f589:ee3c with SMTP id 6a1803df08f44-6eed5fdc4f8mr68482346d6.4.1743523189628;
        Tue, 01 Apr 2025 08:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcj6DyVh3s44alBnkASPCCH0lLtilsnzjnLJjgoTmTdUdo3LYZcKFQUcOnrnyfNVz01bfZug==
X-Received: by 2002:a05:6214:27ca:b0:6e8:f589:ee3c with SMTP id 6a1803df08f44-6eed5fdc4f8mr68482156d6.4.1743523189250;
        Tue, 01 Apr 2025 08:59:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16ed61esm7201988a12.34.2025.04.01.08.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 08:59:48 -0700 (PDT)
Message-ID: <ef783edb-c966-4ef7-b496-564420c1b852@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 17:59:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
 <20250331215720.19692-7-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250331215720.19692-7-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I6RcL9t6-vpgxRrqSQlENxqQoLqdYXH2
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67ec0d76 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=E544tAf0YMCSjjrfBEcA:9 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: I6RcL9t6-vpgxRrqSQlENxqQoLqdYXH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010098

On 3/31/25 11:53 PM, Aleksandrs Vinarskis wrote:
> Initial support for Asus Zenbook A14. Particular moddel exists
> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected

[...]

> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_indicator_en>;

property-n
property-names

please, we're trying to unify such small things even though we know
it's "wrong" in a lot of places

> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* ELAN, 04F3:3315 */
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&tpad_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	status = "okay";

It's also customary to leave a newline before 'status'

> +&pm8550_gpios {
> +	rtmr0_default: rtmr0-reset-n-active-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */

Drop the 1.8v comments please

[...]

> +&spi10 {
> +	status = "disabled";
> +
> +	/* Unknown device */
> +};

Does the device crash if you enable this bus? Keeping it 'okay' would
make it easier for folks to poke at it

> +
> +&tlmm {
> +	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
> +			       <90 1>;	/* Unknown, TZ Protected */
> +
> +	bt_en_default: bt-en-sleep {
> +		pins = "gpio116";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;
> +		qcom,drive-strength = <16>;

drop "qcom," and please keep the order of:

pins
function
drive-strength
bias
output/input

as you did below

> +
> +/ {
> +	model = "ASUS Zenbook A14 UX3407RA";

There's no strict policy, but variants usually go in braces

> +	compatible = "asus,x1e80100-zenbook-a14", "qcom,x1e80100";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
> +			"qcom/x1e80100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
> +			"qcom/x1e80100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_default>;
> +		enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
> new file mode 100644
> index 000000000000..b6c9a707090f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "x1p42100.dtsi"
> +#include "x1-zenbook-a14.dtsi"
> +
> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;
> +
> +/ {
> +	model = "ASUS Zenbook A14 UX3407QA";
> +	compatible = "asus,x1p42100-zenbook-a14", "qcom,x1p42100";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
> +};

This file is not going to work on this SoC, you can drop it

> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
> +			"qcom/x1p42100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
> +			"qcom/x1p42100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
> +
> +	status = "okay";

Are the DSP firmware files actually different between the two?

Konrad

