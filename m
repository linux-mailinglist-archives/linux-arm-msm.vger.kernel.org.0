Return-Path: <linux-arm-msm+bounces-86994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9FCE9F9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 226F030150D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8328C3191D6;
	Tue, 30 Dec 2025 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l5CYbXUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+rBhx3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B597318131
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767106272; cv=none; b=SHGYKXk/Axb4DBIbckSnPZ0voREPY+6rru01q3a+PmPKOmyhRP+pIoUK0nLiQvAgsHCsLz40O1nOUvgyP7b8EyX/cFgFS3Ko9dekBkcKEAGEUIJCUXQJhyVqgB9GHodkoimI0G6VFExt4c6bp/sDCpnIRs7lE235h+auhrh6Q90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767106272; c=relaxed/simple;
	bh=IiF1c3u4rp9iHh+96BFtbjILDmqjiKEfbIHKMbPt+Hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPVsV6dDY+6ZPfVSpqtysIS1B0vFORGr2J6n3cbZANhK72YMiRzmu2E5gZZDTTohEMf3bQQ1FxFJVCC06Qj5UOBBLBjJfOIC9IoC75cDc3dcUXWGXrOBvJ7AvhTJmXrGQ0/iWk4wWW8Sr1hPsqpvhdb/xF9FhHyrLIOuNBYgTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5CYbXUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+rBhx3U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9Wog72551069
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsMeU+DNb3dWUzggZmnZIryb8fe97Lkah5M+iOlelsY=; b=l5CYbXUHjmhQzIzT
	1uixQu10HsCo18ML01r8G5BtnHC7VlY/xRrwzu1INGH1VhZQrDX4RYWg75An1VIX
	dGtBQLS7WJov31HH8Xeou2q/xav5grZaB/bIN62rylMTcgAdiOl7e3wOEREyQUi5
	P6d3alIk1arp8S8qRV6HRKUAva5QixgnRjvPelwzBf2h2rcOUpGZPuMYI6pynhke
	nawrDaxKOroJcr0ASloAGX9nt94nb2xywMlC0/hsjjnY1o8O92ekot9VNDf9fet8
	boi4pH2aYX+JfxOihGQTPgNtEXAxecf3UAKhSR/0yZinMzjsXyE8kTqoKlalYDHe
	K0kIlQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skj4wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:51:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88882c9b4d0so33693556d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767106267; x=1767711067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsMeU+DNb3dWUzggZmnZIryb8fe97Lkah5M+iOlelsY=;
        b=R+rBhx3UjYU0DutPoyc3ZNQFLQPSqr/QKAkY/6HXRJ2CqlPDBetutb/okdH4il4ZZR
         ycCJBgMeWQq1ILce3RYxM+h647LE8/HlhEUNLAAPi+5kXHfLTjvOh2fE/I+wIhdxXJyD
         IDoa3HSeOVHbeMsfYmuxVCXtoU14VO0e5qzHYmWlopQYqen6vF7ECUATKA8JNvcpMIdG
         NE7xgUH88mLFDX5EWCByRB91i/SFJmx8KzQZRIwufrqDXkizzPOlIW9i8/7BdzrZeNCF
         qjZ1Osk8kscpnVd3FzDGQcSrIzuh3nXhHf9xBSe2yJXbdQ/beHJdyVjT/Beg1dHJBkoT
         5GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767106267; x=1767711067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsMeU+DNb3dWUzggZmnZIryb8fe97Lkah5M+iOlelsY=;
        b=iILT6/2r7ZweosrLRTc6Iq0ZtYTNb09lJjJzMZIu48D7I+KFB2nuG91y2pDe4ms+l4
         Wj6o66qb8PRbZEqpf6uaf1BRIlv1uaTZq1cROuGZxo2O3j9ZnflynvK20nxYldNOGPdX
         n+PrgZ9SZysetd6rWphDH3zS2Jrz5IAJ7Akf0NCw1MuP7nyQYj0Q+eocEUf1YtT9U9MP
         aUBfbeG7ky2B3m/GrvkYm9lH6aGXYtnPvUHeELxhl4UXzjLZIsokP1Z2dDT17H2I+hM6
         NF/g3J50SAsBLYHWfzAoj2UBHdVAkPcFpVU04beEZ2+8sBpVX/J4Gmw3wiMj/nOyVNmN
         VLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxr3CyXvb3FhIPiBWdCyiDML0t4V5FoBB+bdT9CSUNF0A/gvNDksr2cu7Jglgg2Z5hPMk0JUYOM1PgNfhp@vger.kernel.org
X-Gm-Message-State: AOJu0YwPOWBtueFYty7hJ5alDRfIJirf2WnKFymmi3q0pFQO2W2XvCi4
	rLrty68VXUGtnokNEGF8809ym2b1HdpOBPf/NgHV8HxZ6mxtcbNRIVPxuzuVaBgbwvPDnJFX6xo
	BV1vUZ3JXZJ16SB0OX5oN/POzDUFv13vV4bKi1Yl282udvOUmFK4v815nTnytS50kqvLI
X-Gm-Gg: AY/fxX53/Y80B/01KFkM468QcHx8yJ7m4ddc46EAw4fIrnaOKro+fLuC2wROltkoBXk
	dBDT4AQ8F8H59i5syLsDPnPi6QSQ9jK3SG/5WJkxHGAjpFZ3GVHMO9n36ScYcOMBippB5iNSqsS
	oCHw7j308lF3sd4AJeuH7KYYUyVHoDrwengFCepi9zvZNn/7ouc+WPuH921pkQ9JidAx7qFqAoN
	4HdbRSebLcv6mWxq7p+x9gQrEm+V4Cfoe8YTq6+Tuehaoh1wmF5OawemI1XL9q/3DOQFHd8Pyfj
	VhzSAhB9XUBMHPp8OmkmFC2YpVn3F/VM2x5uxuJ3Oh9htUwFrFMBBoYpEdJWrAW0duLdhDW6obF
	YsfHO2D7Vl8hWrk3AEJLuUs6XT7rh6/3vFadyNxxQ5tM5AOL2SKev1zBeyVNLGU5l6w==
X-Received: by 2002:a05:622a:cc:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4f4abcf3ba4mr391083251cf.3.1767106267406;
        Tue, 30 Dec 2025 06:51:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5OEshsq3tBs6p+dR5ZRcyitw9aC/nlfCN7CImHWgb6q7KFoia0dUeAt3oNkAbTOQF1VirAw==
X-Received: by 2002:a05:622a:cc:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4f4abcf3ba4mr391083011cf.3.1767106266956;
        Tue, 30 Dec 2025 06:51:06 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105655asm35092579a12.9.2025.12.30.06.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 06:51:06 -0800 (PST)
Message-ID: <30ee8541-3ec2-49ac-8fe0-987cdc5b16e7@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:51:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-6-tessolveupstream@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230130227.3503590-6-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEzNCBTYWx0ZWRfX/0UI33L7ZMD/
 j1jXkIRKERwvqpP2OROaXd/veFSfpuVSdVTwEmdAt7pcRIHhmtr5fTGGILq1EvmgIsWj3LBU/Hi
 C4O+Rw4bcYD547iiy1axeL1iemzsDKM/T2wN+7wfDAteX7YxIVTWYCxYUMXsdVi7f2FN2yF1KjK
 f4pzV2U1aAE01ytDafkRP8VXfJzZ6NNg2cQJroxmflIrOKcZhfRWXteQDj0IU/x7WkAXrngZyT8
 n5zfyfyiE0biZ94YqalD0Gqbt7hL0JSsykquV+Il8ENvIV7PpGM2BHBEw+ic9GE3udxp6/BJaJv
 uwnhWszwCJpZlFi6rpHHWMGPFDB0lZzqi7snJEhmi1cTCXY8d7YvOpNgzo0t6QKMbdgl6hhE/mx
 sT8U/xDDpEbN2VGZyFK3qDNOvFblUah/oIyVpSPYTLEUIaiW+G+vG/tGCGs5WcGFiomPiqDIMyc
 2Lz4lmcMO4/yfXYkXvw==
X-Proofpoint-ORIG-GUID: 1451xTjX7jUHnfWUeUt0vgHujwQ0tfOu
X-Proofpoint-GUID: 1451xTjX7jUHnfWUeUt0vgHujwQ0tfOu
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6953e6dc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OLXAHnxLARgaXDuhxGIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300134

On 12/30/25 2:02 PM, Sudarshan Shetty wrote:
> Add the device tree for the QCS615-based Talos EVK platform. The
> platform is composed of a System-on-Module following the SMARC
> standard, and a Carrier Board.
> 
> The Carrier Board supports several display configurations, HDMI and
> LVDS. Both configurations use the same base hardware, with the display
> selection controlled by a DIP switch.

[...]

> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
> +			<&tlmm 115 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +	};
> +
> +	hdmi_connector: hdmi-out {
> +		status = "disabled";
> +	};

This should be a &label_reference

[...]

> +	wifi_1p8v: regulator-wifi-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wifi_1p8v";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_reg_en_pins_state>;

property-n
property-names

consistently, please

> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	wifi_3p85v: regulator-wifi-3p85v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wifi_3p85v";
> +		regulator-min-microvolt = <3850000>;
> +		regulator-max-microvolt = <3850000>;
> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_reg_en_pins_state>;

ditto

[...]

> +&tlmm {
> +	bt_en_state: bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		bias-pull-down;
> +		output-low;

output-low/high should be unnecessary as these pins are governed
by the kernel driver

lg otherwise

Konrad

