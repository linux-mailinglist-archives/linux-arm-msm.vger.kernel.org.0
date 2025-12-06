Return-Path: <linux-arm-msm+bounces-84533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0ECA9E59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B56823060F02
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D23425B1DA;
	Sat,  6 Dec 2025 02:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k236bMne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRUqLALd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91CF259CA9
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764987517; cv=none; b=cytS8ITedwj8Q5kWW2G0szS/hkfUYJyFnVDOrrkCUdSJLqK3gES3u8KH+yCXgeE9LnZgLQqnjQstemF3/yHUlh58BV48Yu3udK49tS4oYy/Xqtz5Z3IOozh8cBXLgEb7flOgmJEDE9tezLluAYpu3abKJWHeIgAGpAwzxxx9dJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764987517; c=relaxed/simple;
	bh=zQH6Y2thqTFD1/7ihGNg5izxMSqSeZgtIzAF9bOUMS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itikTT0g/+QyRq6QI2JX4Su6q+y26j0ApoDEAmiE0I8j1y8OlNGpyjOGLqmDQNHkSg02RNUxwENJRxuveZheNCTH12fgOOY4UONDI8RAbIoitcg3AHTb+IuCuHeRjd/kSDwtUWgtpXc8fTC3Wdx6urP6PyEa/bVo5mU4n/xAXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k236bMne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRUqLALd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBKAV4177201
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kkzU5i3thP5jZhkyiy8X8cip
	wrbG15cjXunYoj7ejAM=; b=k236bMneyoCWQrDuILc5Vv8p7JOl7gqYRoJqFO0D
	vo+5hQOsi6jIdy5uGtE2fIIgT0XQ9X6MPkKlJ8OdWjr1QFp7c9BkwZ7EbjidU1a8
	CsNXF54tazAF2/NpFxWisT13DY0B8T3rYOSbh9Vqu56Uu1E7UBCFNfDCb0wqMrvZ
	htgMSJ2c/3Aw7Iiz8xwGsW2XD11CZdMnfvd/zoAzrxzgLsVWR7kjRAvrNmYjCiYp
	vkmL15KzAng3EKvKEL1PPbGdgXOqDbMe0t9EM5jkRFK5tp7NyIu5/fARTPKl7cDa
	0JapdtFbzSE14jIIN1ZE6NT4OBtR8J/Y7lEGUCMR+8i4Nw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm5aabs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:18:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2f0be2cf0so835826285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764987514; x=1765592314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kkzU5i3thP5jZhkyiy8X8cipwrbG15cjXunYoj7ejAM=;
        b=MRUqLALdkWNXeTgqwbVrlYaMuElVzh4EqELjowOZiJubadmCua+UdTQIb9bpG6/aYo
         qjcNeNFFsLyo8AQ1bP+YWkqr/EhNexYvCfP4a5cSPTToU4RnA2Qj+ClZz6PajUWzGHfA
         PI5DJxBz2tPQ+D2M0rV0bikC0gkqUmaES4P3uV5p4bsrM6k+jxZpKp9ZvjMANWygpOYJ
         io1N+7ur6IKO1Mk8OceaInlcFuIEeWEhnqnIh4lItFwQ9/VFg16IRfx9TWlesfEVCLKd
         KNOS4U6CFzEr7rwa+G5NyQnosaww3lHaMNb6l43rcL8y7l+w1zqLbkcqv5+4MxJRftSd
         lEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764987514; x=1765592314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkzU5i3thP5jZhkyiy8X8cipwrbG15cjXunYoj7ejAM=;
        b=ChL8cyFXS4YQ4oI3FeC2hmPr+IbUfnA/z015gNv085norrhNwfChpEbXc04cwoFp05
         2eaaeb3H/WQ4YWaR+aVFAAAbFOQb2t0uIyJnjmcQCuq42xX9GUe5R+R9NYhAA6fujHxV
         cL1687oi4wy1g2B/ltNc3RvgBG5O/inEfNC0zOVbUTyBQd3F8yx/Al/SC3VTdXv77u3/
         jxMdzUu089HbfUPo2++qVBJJxfK4TLMRXsH8geHs9JtQBJ+mp5C38Ygd9LYf4R/iWqDK
         tcyjwxN4+UGa8to4KviFgsiLX4JqAw04TW7LEQ4Pbp+qCfMFcsBNuNkycm6eVraOBXBm
         LTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEzMByAKNEYxjD8nY57ZLGgUPcuctzFDNeGoFVD9QV9aYqI8u3KTNu7+1RZbZxUnaLyqXdgYEcUKCYGif+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx54XBJ3WcyYBNekeEr6ZRF5GL/Du1MSSU9mX+yPJCI8xo8zZGO
	hIZB6lkjZ0otA/HUUSJ2Nt8GXJU5YPTEf2z09TyGzk4lPPTjV4q61QHOSnlXhhYrVUvUlcboO1O
	Dkk0AfEK0MLCiWA+S3EkL77k7qYsd0fAPvotwymmPV8tAMRGN7PZWL1BxW7fG4spBIC9kx8Otx2
	FU
X-Gm-Gg: ASbGncuzF62CiPSq4SVBxmRNH1VXh1Mg/ZFUqtQ7pY3/52d/UnzcYH30PNqNF+uzzQd
	51s1UxvwbYI9BH4z5wxzMxpSXPlamaChUGjLBRE9lD5UOIK7VJrf6KUwmJiVaprKSztsvbtsZ8P
	zP1G/6qy2iAZGEUcCSZ0ebOBlkXSuTB6hVPOc3c0bhvUGit/Z83PijMfsIkH7PcRcx4C2b5fkb6
	mDu5fmUB6Z8Ax1aHseNZxxuS5vG6Kfvd9s5eDhIGw0ir79MIWVvEJzeunPf6gWeyPFntL4j8ez7
	hKXGpWiPld/EFZp+mpvtznvOb3YUazs5npqv42Xc2aFS0tKOuUu73Fmlh2BoEDuG6qM3SZcuRiW
	0cj2STi/UTmoGn8IpdiCZhYpZrAvsKdqjIJ1cWiFZxxpX5y9EQ2rXl6Zp8q5PnjU5Q3t9vWX76l
	Rp803qLyi/+k31IVk9/ujq+1M=
X-Received: by 2002:a05:620a:45a4:b0:8b2:6ac7:aa4f with SMTP id af79cd13be357-8b6a23dc063mr172257085a.68.1764987513598;
        Fri, 05 Dec 2025 18:18:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgZLS4Ouz6l9rVGqlv9XKPunnmD1T1zKyOm+Jj5FrvCO5/UnVQORkYjq75KaWQtvr7FnzB7w==
X-Received: by 2002:a05:620a:45a4:b0:8b2:6ac7:aa4f with SMTP id af79cd13be357-8b6a23dc063mr172255085a.68.1764987513121;
        Fri, 05 Dec 2025 18:18:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6febaec4sm17923311fa.22.2025.12.05.18.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:18:31 -0800 (PST)
Date: Sat, 6 Dec 2025 04:18:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
Message-ID: <arocrbzcwvyb2te3gcujeo7jaiaisgh3wuketqkif7xvkvmbct@r26gqpw6gb43>
References: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
X-Proofpoint-GUID: DJyWyO5ETBbyqnaZYercc2G3Rx8RO6du
X-Proofpoint-ORIG-GUID: DJyWyO5ETBbyqnaZYercc2G3Rx8RO6du
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=6933927a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=qrFJLkbEr44D1RwudJ0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNiBTYWx0ZWRfX6J2Lq+YZs25z
 FSvB+aQnFHwkftGD7lnpG0obkcpnx+5iBlUnS7EZ1q0V/fTReYQKLEBWSiydEAPD2463tszZCvg
 3/gkt7AxVkUrRNjQI3N+B9EZj8S2wxhtVhvTWUqk7aY0o1IwcusRy6h/ApzWemEFcx8Sym1VsKB
 FwuNckdGusrsdj+SiYa8y6KSuoLToeVwtRiBB1jWkV93I3KdxM0Us2Hvw1om+z2TqgEqobCA/t/
 Xwn6TrHfC78Oh1lCkdsGuUvLmVEmiRvZAgcN6+tXyYQqaqLa60GhgnMFb6cOhpAcFcj79iuMfS/
 eNec5+O17KKmx1RHtc+bvLTwqyCBP45MvEDuaqiSo7Gb2zOqQ0lvIYKyZfk+UiteSDQqjeyBLIG
 nXGKLtvvk9FYze1clvNOnSIOKMRWUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060016

On Fri, Dec 05, 2025 at 02:16:45AM -0800, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> 
> Test:
> =============
> - LEDs:
> samsung-expressatt:/sys/class/leds/tm2-touchkey$ echo heartbeat > trigger
> // Flashes LEDs :)
> 
> - Touching buttons:
> samsung-expressatt:/sys/class/leds/tm2-touchkey$ evtest
> No device specified, trying to scan all of /dev/input/event*
> Not running as root, no devices may be available.
> Available devices:
> /dev/input/event0:      pmic8xxx_pwrkey
> /dev/input/event1:      gpio-keys
> /dev/input/event2:      tm2-touchkey
> /dev/input/event3:      Atmel maXTouch Touchscreen
> Select the device event number [0-3]: 2
> Input driver version is 1.0.1
> Input device ID: bus 0x18 vendor 0x0 product 0x0 version 0x0
> Input device name: "tm2-touchkey"
> Supported events:
>   Event type 0 (EV_SYN)
>   Event type 1 (EV_KEY)
>     Event code 139 (KEY_MENU)
>     Event code 158 (KEY_BACK)
>   Event type 4 (EV_MSC)
>     Event code 4 (MSC_SCAN)
> Properties:
> Testing ... (interrupt to exit)
> Event: time 1761059686.899755, type 4 (EV_MSC), code 4 (MSC_SCAN), value 00
> Event: time 1761059686.899755, type 1 (EV_KEY), code 139 (KEY_MENU), value 1
> Event: time 1761059686.899755, -------------- SYN_REPORT ------------
> Event: time 1761059687.113489, type 4 (EV_MSC), code 4 (MSC_SCAN), value 00
> Event: time 1761059687.113489, type 1 (EV_KEY), code 139 (KEY_MENU), value 0
> Event: time 1761059687.113489, -------------- SYN_REPORT ------------
> Event: time 1761059688.764757, type 4 (EV_MSC), code 4 (MSC_SCAN), value 01
> Event: time 1761059688.764757, type 1 (EV_KEY), code 158 (KEY_BACK), value 1
> Event: time 1761059688.764757, -------------- SYN_REPORT ------------
> Event: time 1761059688.817516, type 4 (EV_MSC), code 4 (MSC_SCAN), value 01
> Event: time 1761059688.817516, type 1 (EV_KEY), code 158 (KEY_BACK), value 0
> Event: time 1761059688.817516, -------------- SYN_REPORT ------------
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> index 5a39abd6f3ce..c4b98af6955d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> @@ -52,6 +52,41 @@ key-volume-down {
>  			linux,code = <KEY_VOLUMEDOWN>;
>  		};
>  	};
> +
> +	touchkey_enable: touchkey-enable {
> +		compatible = "regulator-fixed";
> +		regulator-name = "touchkey_enable";
> +		gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
> +	i2c-gpio-touchkey {
> +		compatible = "i2c-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		sda-gpios = <&tlmm 71 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 72 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

I don't have docs at hand, but it looks like these pins belong to
GSBI10. Have you tried using it directly?

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touchkey_i2c_pins>;
> +		status = "okay";
> +		i2c-gpio,delay-us = <2>;
> +
> +		touchkey@20 {
> +			compatible = "coreriver,tc360-touchkey";
> +			reg = <0x20>;
> +
> +			interrupts-extended = <&tlmm 52 IRQ_TYPE_EDGE_FALLING>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&touchkey_irq_pin>;
> +
> +			vddio-supply = <&touchkey_enable>;
> +			vdd-supply = <&pm8921_l29>;
> +			vcc-supply = <&pm8921_l29>;
> +
> +			linux,keycodes = <KEY_MENU KEY_BACK>;
> +		};
> +	};
>  };
>  
>  &gsbi2 {
> @@ -198,6 +233,20 @@ firmware-pins {
>  			bias-disable;
>  		};
>  	};
> +
> +	touchkey_i2c_pins: touchkey-i2c-state {
> +		pins = "gpio71", "gpio72";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	touchkey_irq_pin: touchkey-irq-state {
> +		pins = "gpio52";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
>  };
>  
>  &pm8921 {
> @@ -420,6 +469,12 @@ pm8921_l25: l25 {
>  			bias-pull-down;
>  		};
>  
> +		pm8921_l29: l29 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3300000>;
> +			bias-pull-down;
> +		};
> +
>  		/* Low Voltage Switch */
>  		pm8921_lvs1: lvs1 {
>  			bias-pull-down;
> 
> ---
> base-commit: 0ccd3ddf45c93ab06c9b1a9d266dcab1e52bf3d2
> change-id: 20251205-expressatt-touchkey-1747c503a2f3
> prerequisite-change-id: 20251119-expressatt_nfc_accel_magn_light-f78e02897186:v4
> prerequisite-patch-id: 6fdd0efa5eda512b442b885df80774d1a7037df7
> prerequisite-patch-id: 12d296f83ccb1bdfb8d06a72e476bf51ae5f4e6c
> prerequisite-patch-id: a970acf2080143f41ae0935dd2c57bb71f5bf338
> prerequisite-patch-id: fd25fef58503c5e5cf742e79b124948c7f6b98d9
> prerequisite-patch-id: 966ae746687ebf8eb29c6185a8909b047e70dbb1
> prerequisite-patch-id: 68603a680b24921759425fc289e61fc4435e5ccd
> 
> Best regards,
> -- 
> Rudraksha Gupta <guptarud@gmail.com>
> 
> 

-- 
With best wishes
Dmitry

