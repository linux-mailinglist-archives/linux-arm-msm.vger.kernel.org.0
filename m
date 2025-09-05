Return-Path: <linux-arm-msm+bounces-72245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777CB45462
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99A297AAE2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A125D2D47E9;
	Fri,  5 Sep 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDWdCbR5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E612BE02D
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067624; cv=none; b=G9Hv3NGTn7VX/mPIEY//rhHeTD23sg+ZtISeQLT5+hCXJ/6u2QNz8+PdKdMtFW3pyjvWkxT9fqqfbXqjL/C95ART7RAJuVx45ntkOpWyPxOLjhkWZ06Br3gdr9EtxUfq3GNUN/5WUnUnq/n6cy2qF5EZw61RXKTvfpp/uy/xdLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067624; c=relaxed/simple;
	bh=NhL39okvE1UQ0JDbrGcrVCu7unTeSnVwrFd1RwYqZM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibQjMrLE00Sz921HjfrRLxZWlI53S4Tj+7NxiX+6sjgm2hkTRn9Ot8NXrTYVp2YUd8TSPcy3mxG0+XiF+bmKAknidFul4LUbRVIkbgaGzQd4d7K8AM7+Zdbv1ZDmZ93BGgk7PXItIA0FqAKl+xpiP63dDG4d4B+lpw+/vKc63vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDWdCbR5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856uIOO013626
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTOVAGfJmHAMbslcDUKw3QbQxdL6mIKaKsV42CZz9as=; b=iDWdCbR5bU2UWlLU
	y4vO0uzK/G082CYybYH9KBDzkgIiLLuDfn9q4i8gWqER57Y7OtZW00rEBUuV6zl6
	Om4lUxRVewiEAxwZcqBC/hI6b6LtQgKMb416nUV1GcdIVpDXhAYBjI92I0IsjrEH
	ZBqtY176u1be2bt5W7cnnS40jG5Fh4SAJgBtc7bu/7TtEwiOVF6JHtASmiEXYg/j
	3ECvhkR55a5XHDPKKs7zB2jpTRjsUpNn5sl1hKCctVkD5/KuWPT9bIcKyZGj/zXG
	R9N/qQJ5yquVKJBOwkqppq+Cpdw1sCokN8AaSlwshVaOJa+bZaseMXoRtfbgV9g+
	FWlV6g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyeq53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:20:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726ac3f253dso6350376d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067621; x=1757672421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTOVAGfJmHAMbslcDUKw3QbQxdL6mIKaKsV42CZz9as=;
        b=uUWl4Y+HAQ9zmhyBl92B+YB8hdh3RDuP1E1W6Vm7a/cggc9ra3QqfhJVA7mVeLD3rp
         V6mbbyWzWFT/YiV1Ni2OaPzBSQxEJBvmFVbvRwWf+LJhdwKBOacyr9bC9FuZPyph0ekJ
         xwkI5KrNVbDBKvBgSH/mwEysrkTy2Hb0XGj2dLq9PwF9UAzcI/sJF0CLiZjxCLue70pb
         0NX08b1vQdma/qucqvO1BNTgC5HlngGnRpHTLwc7iMgncjuGopNE9iewaQ4hUTQZeN5B
         /MWqBZ3GOGI5wfph3SXmH+opEIXjF7+d4sbgYEnIo3TD1ljV5eS5SSSUF9Ehib13fcOG
         fmVw==
X-Forwarded-Encrypted: i=1; AJvYcCVFKwyvDHWt7Y1lbG1H2/EUs8C5I4X1SyYkHofPpJXUYW3fDfWucY739zRqz7B7BO3+tmgDbZ5FdFpUlxN+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2f3cuPPeCtNmFXc6cQ0T/Ff7c5+DD4Tdd/uidK1uQvShbKxJA
	mrzly3mQvAxBes/HIsaV+0quNPCTTlchoUvij4UEiDep63oG0yUALr5qg7Raa2PqBeib8ETd9aw
	D05A/FMoGKB1HrpztFPFkbqbdEnQddBa+iW/Ki4zFTr8I0kD/V4qhif7zp7HJ2o9JANSf
X-Gm-Gg: ASbGnctVdIc3PajphgHkeF+zsCf/kithCHuAxOwN7p7WkK6TV3KSd7UdVEGt6AvfGAA
	yyuEGjiUAp+fUJKAR0WMS1kgsrAJt0RgkDF4rrC/DYHaQCLfXBcc1w4210/7FTkLHd8HLdVagaW
	7VhebAc6oiwigNSmlN9kE6N9xShWcWH7OjVknN5ami8FobJTsDw3dC99Kkom7S+cYly+KzMg5Wa
	aU8DAgvjLyX6z71O39ba0ildeyOr2NT3V4GHjUHQtjfH4BK6NZZ3rFxmN4wd3iGm2CuKWrlIb+d
	6U24SJsJAqsDyLPD230pl8yG8l3lhByZiZBSBT7olQ+jmLdn6BHn50RqDdq2LRWZUiT9kj/AJY9
	u2GvW+7K5MUBZdCgXoK7P2Q==
X-Received: by 2002:a05:622a:1483:b0:4b4:8e4d:6671 with SMTP id d75a77b69052e-4b48e4d6f04mr83378801cf.13.1757067620993;
        Fri, 05 Sep 2025 03:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO6Dw5E5OGVqQHPhLnTT6piTScFBZOcK2M8RO2gr8kQRnOFlQeerKrV8G2BH+P30VO7Bu8Lg==
X-Received: by 2002:a05:622a:1483:b0:4b4:8e4d:6671 with SMTP id d75a77b69052e-4b48e4d6f04mr83378341cf.13.1757067620108;
        Fri, 05 Sep 2025 03:20:20 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b047373b000sm497098966b.68.2025.09.05.03.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:20:19 -0700 (PDT)
Message-ID: <e480ab16-bf98-4a3e-a7e1-67776a598201@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:20:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: add generic LED consumer
 documentation
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bab965 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=2ng2SV8iM2HKWhXzYmMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: o0CpEdkOCT-sq_aBCHTpgslzaahGmrG6
X-Proofpoint-ORIG-GUID: o0CpEdkOCT-sq_aBCHTpgslzaahGmrG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXzjWz3YG5xoFs
 Lj1u0SFOa2fXg6R6vhM5oWrAPqVBZBYJ1BWsiChtDoA9HbOGXNQrZQGRvsN9uiN6xPhJYIQoXty
 tRZ9YEqx0pFxVRjNVGAlor+BdXCPIj6JZc0Eln29lpfyzwHdTt92CrTtf8IkEAHSsnY5I2iQfRz
 dRkqHWf/GoNnXvTJ9VEjxf6MGmZ76jBX/Ysr+K/dVGZLv/6Y+HRBGjrk4MsB8QzhxXtcMMYX/vW
 nUdMUBMwvQX3jDGBkg5s/ypyWFWXu6J9xasd3tTpyNZe4avXiqG9jnqoE44Lvqef74TyXmpiViM
 RWMNYWmO862yU1vBs+AOjNxNMy2WDqC2AR83K7kjtBV2L7cGloBlztvOr8DczcLgij1PWqGqR0o
 m2Uus0uy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 9/5/25 9:59 AM, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      camera@36 {
> +        compatible = "ovti,ov02c10";
> +        reg = <0x36>;
> +
> +        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&cam_rgb_default>;
> +
> +        led-names = "privacy-led";
> +        leds = <&privacy_led>;

property
property-names

is a common pattern

I know this is just an example, but people will copypaste it

Konrad

