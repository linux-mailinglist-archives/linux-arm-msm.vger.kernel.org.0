Return-Path: <linux-arm-msm+bounces-72248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD6B454BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADDECA416BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754362D6626;
	Fri,  5 Sep 2025 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVNaZ0Md"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A328E571
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068039; cv=none; b=Ki3WE/JOiFGf13Nd5vHqVYvY/MX29aW3NRH0UF+fiDG+YLLtWsxhWgSTebmON42UISNyu4a0ELRH2cM6HeOdP9tHLrNSZfyFtXA6+etMGXF5XrPm2m+w24dQnUVbDh1w/jdMKWKzivtw1tua0S54fq17E1qRwYbPIO5c/LjSNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068039; c=relaxed/simple;
	bh=sUEiAJrOLuvgwU8MPeRFCsFvIjwbrUnWFq9tNJDXl7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPWCuumR78LEY+M71ec+SP7jrIOYYE0HQTnFjjFbE2JRvOi9NqGkzl+n7/TfcxQrasmJ5Ak1tZ/+LROaaX7DXwQjP/9zz9sWuLjEE3WuTBUZSrpvSb6ibFI49JuYBDFVSH534Y3Wu1vApyTVJrdH6t6muMXaYkV2ERfatmGeIGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVNaZ0Md; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5854oqaf018660
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKlclxedMJXaamSvpbOzBwOcBlOQHWIWmhDC0gUJg8Y=; b=kVNaZ0Md1Hflj1R6
	Tr59lF1SstQgFyY/XH7byCtFs+wsqaS1fw9QlnLv8v/QTfYaA7H3+AoypfbcPeIA
	UMlURKWm1k7UMF8U2d9R/idrljC4WCsWhbLtcIMWaDdHwUfgxmrrdxY2K9j573uf
	Wo9S3oYOey2/a8w7//3hdiLRoIfuxPpA10J0V6PCTA3A8g6VBYcL9Lta7pLfnPPP
	gplyWAnbApdGbFLfAmyfzlztV8hGSKaWtOVgxW0YZ4VsEsnasYnRM0y0upYOaH5x
	HelSZVEvoRpI1sZ469nAY94DaB63AOMpxZK0RZjJjNxuGf8MCFcqIOFLBB8wlESy
	R4ebuA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebutp0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:27:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-715c9cad6f8so2380506d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068036; x=1757672836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKlclxedMJXaamSvpbOzBwOcBlOQHWIWmhDC0gUJg8Y=;
        b=Ds8fZHkXDpgX8aibsy8q+uMhA/ZdluSTqCoatWWfOXVB9jC+tyY1m4T5SQNBVnIoyG
         RGnpLq6Us4wlwXe5FWgMti3u7gl6imPd3qKZOchN+Sb8kf1rH3D8P5PnfhtkbOzrDTR0
         bOYFh/n9YDd/utQ8ukBy6HPV5Wfz3aFA92AEyT5+TuvMLZTBu9p9uH2sBvmbijIwa3HE
         uvQ4Ep32wKQzMgeQqkQn2DZMF3ZvbXKpqh86ExDphNyZL13D0h66tnon3gMyYBhVN2/4
         X1VgqW/ySTopxuV3wRk4mm3evWoA04dG4gkCPNwayUueZYUv6GF8pb34qdFRHdmGLG5d
         XFLg==
X-Forwarded-Encrypted: i=1; AJvYcCW9hgktrgY8JpKueWpjCeWC1pOPudYiEnhMcnbnRDX7uikX9CYvu7v8FKYjrxM8HZi4ItBED6kTjUpNIBAo@vger.kernel.org
X-Gm-Message-State: AOJu0YyOa1OdBFtJWadBsfbcrtAlj4ZFmRtDKBWtPtG47fgJUM57gzkm
	AViMmymP39oJILpzWgOv5QaSEMW9TgiStXp29Ht7koqZeCfBPzP8C5hu/z4gwLBNJblgJvks+zr
	e95iZsMtbz2DVSYOjKMYksDSHry2OIrD5VqYoCDKB6FwdWiRJ2lpky6HzQ4uTxE8Vk+IK
X-Gm-Gg: ASbGnctOlOsVXUH/zy8ztxS43aJgVEs6hmsx3yRe8ajcRslW7E02DBookXREU/w5Oi7
	6Znur/RdDqzEn1b+6S8g2hHp10gqkPeC8QRGhINkh5exe6UnGWxPoXJ78PhMZVk9BvyUPubmFmw
	Mjh7Av7nxrzXfJ9L+SmeJa3FKKg9fGSerFl1BOxv6zlaqyZHoXte8jgnzmoJMnYa1xZHonG9jHS
	jUbvsTHAKlygTBKpIwOGtBGlsd5EWnXv+oLVXba0EtEduXdEdoHDja2MkbnXxLIs3KI+Er528mB
	mXpFh78spAVtnQld9IzRBElvbluro4xQd6gXd9X/PfASyjjl+u0di9Vz7vEKR5xgqR4aKAdMANA
	EHvC8okjx+4ZAz4be4H1x5w==
X-Received: by 2002:a05:6214:dcf:b0:731:e63:4d5f with SMTP id 6a1803df08f44-7310e634e4bmr5342236d6.0.1757068035637;
        Fri, 05 Sep 2025 03:27:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENys2w9y89EnmRAiC2GvAWr1Ii/s0kJct67QLdVLXitDIodzxUlw0kVgyoYfpcuT9cqJso7w==
X-Received: by 2002:a05:6214:dcf:b0:731:e63:4d5f with SMTP id 6a1803df08f44-7310e634e4bmr5342016d6.0.1757068035151;
        Fri, 05 Sep 2025 03:27:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ae40sm16033862a12.44.2025.09.05.03.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:27:14 -0700 (PDT)
Message-ID: <4913e5eb-c7bc-4c77-ab2c-b0452e9b495e@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:27:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform: arm64: thinkpad-t14s-ec: new driver
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
 <20250905-thinkpad-t14s-ec-v2-2-7da5d70aa423@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-thinkpad-t14s-ec-v2-2-7da5d70aa423@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b8Bm9E9Xcw4LjidvZqu36-bW0FUDYGqx
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68babb04 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=l0D_vPNz536yW1AJoQEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX/pheNQgzJ5EE
 6ikXbkNPniXLSbmz33sA+CD0dVxUhX+Mxa5gyVayJapykmfrCd4lvWHHN0tGCHHtsTZN81oVZy+
 42hu7OefymfOOakIG4wJxjpWZOL8qKrJ3c+iDw3wMjN98wcz3lBobEOjtoZWTXgyXF+90WAExhW
 XL9ItcfWAm89kkVRqCCCqADFcO9U3xRUsgFky8mXtQ9sKODeT9hPsgTjXRIFjJR0CxVQw/Ps/jH
 A9nEaMzNc9wg8LccGoS0Nk0OI4n+KRktg2QTs1qk26gd/7/tIDRMq/pgw4gEG72+eJ3JYSXcJqe
 mHabll2D+h+SKDsf410jiWBBtEz4QdMBqwlODZhE8DTg6WcF0la7/7CjLU0CGa39UUcy5LKR46u
 xpqfhDp0
X-Proofpoint-ORIG-GUID: b8Bm9E9Xcw4LjidvZqu36-bW0FUDYGqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163

On 9/5/25 3:09 AM, Sebastian Reichel wrote:
> Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which is in
> theory compatible with ThinkPad ACPI. On Linux the system is booted with
> device tree, which is not supported by the ThinkPad ACPI driver
> (drivers/platform/x86/lenovo/thinkpad_acpi.c). Also most of the hardware
> compatibility is handled via ACPI tables, which are obviously not used
> when booting via device tree. Thus adding DT compatibility to the
> existing driver is not worth it as there is almost no code sharing.
> 
> The driver currently exposes features, which are not available
> via other means:
> 
>  * Extra Keys
>  * System LEDs
>  * Keyboard Backlight Control
> 
> The driver has been developed by reading the ACPI DSDT. There
> are some more features around thermal control, which are not
> yet supported by the driver.
> 
> The speaker mute and mic mute LEDs need some additional changes
> in the ALSA UCM to be set automatically.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---

[...]

> +#define THINKPAD_T14S_EC_CMD_ECRD 0x02
> +#define THINKPAD_T14S_EC_CMD_ECWR 0x03
> +#define THINKPAD_T14S_EC_CMD_EVT 0xf0

T14S_EC_ is already a good prefix, imo

[...]

> +static enum led_brightness thinkpad_t14s_audio_led_get(struct thinkpad_t14s_ec *ec,
> +						       u8 led_bit)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(ec->regmap, THINKPAD_T14S_EC_REG_AUD, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(val && led_bit) ? LED_ON : LED_OFF;

&& already returns a boolean

but I think you meant to use & here

> +}
> +
> +static enum led_brightness thinkpad_t14s_audio_led_set(struct thinkpad_t14s_ec *ec,
> +						       u8 led_bit,
> +						       enum led_brightness brightness)
> +{
> +	u8 val = brightness ? led_bit : 0;
> +
> +	return regmap_update_bits(ec->regmap, THINKPAD_T14S_EC_REG_AUD, led_bit, val);

regmap_assign_bits()

> +static int thinkpad_t14s_input_probe(struct thinkpad_t14s_ec *ec)
> +{
> +	int ret;
> +
> +	ec->inputdev = devm_input_allocate_device(ec->dev);
> +	if (!ec->inputdev)
> +		return -ENOMEM;
> +
> +	ec->inputdev->name = "ThinkPad Extra Buttons";
> +	ec->inputdev->phys = "thinkpad/input0";
> +	ec->inputdev->id.bustype = BUS_HOST;
> +	ec->inputdev->dev.parent = ec->dev;
> +
> +	ret = sparse_keymap_setup(ec->inputdev, thinkpad_t14s_keymap, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = input_register_device(ec->inputdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

You can return input_register_device() directly 

Konrad

