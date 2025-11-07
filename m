Return-Path: <linux-arm-msm+bounces-80683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681BC3E3F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 03:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09F281889DE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 02:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A491E2D97A1;
	Fri,  7 Nov 2025 02:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhaWPuFh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aei63Xzg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E122D8DD9
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 02:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762482604; cv=none; b=XPLVJlB7XRHzJ//2qWB0gvkeuaMAjmlQKMcKJddifHjq7q5T+iltJhSC/m6wMeT8k1x7+kkk7mYMgoZhXVtV2kqUEsGAvPo/L8sTogRiesNb7gLpZVcmn9kK1HS8hGHr4oHN2b86wcarpYGP03Eqh0n/mInUry+24p1ddamqMIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762482604; c=relaxed/simple;
	bh=iPyyX6OskGdXI7cyvJFB4Y7wVqAnR2wEu0EhTfIZlK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubQWZ17r2Nxd0oy/V532s5QJ3Pu+Dpu/BBvj/iW5yo++xTZ1M3osq5s2PGhYL8odqwOp6/Ym4nKxgbt9Ignm72h4zFMY8yc28fbzGHiMQcCN+7DJ5SjhPadftKd7BwAv0O4B7YLMnhQ9smx8fJu2krk+pNe5VZjEEHb3lVEgBag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhaWPuFh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aei63Xzg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6H3sAt557688
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 02:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIO9XgKTQBkxG4BCbwFpKECtkcJ3tpaGYIPXRP9DwTs=; b=hhaWPuFhBoFb1f15
	VBumz8oNwRiOcf08KHlDwF8Sd6ubPgz0AiC00CZl337kJJv+bRlwVPhboXtxIT0w
	AUJwZlwztyyYI8oRMOOBTjJSiMuqC34+TrNegAI0hO9DMopx+2IK+LgJI7zP7v6E
	6Rnwt7ont+Y3djhvW4Vo4wEKfuuk7G88JJMW9UKJ8u3BsaLY9+Ipb07ljCLI3xCU
	KXNm0zocZ/y9b0ct9uCK5cKTgSFoM+Is5/Zm4WiD/tsYUd9+K2un5zSvipf8woVO
	13PGGC6lE80TlCnw7qoX3end1cDDVNobZWUNKK+yYwjAlPGmW0eH4lqoOh7eIt03
	uuAVzQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yr9sdjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:30:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso738537a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 18:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762482601; x=1763087401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIO9XgKTQBkxG4BCbwFpKECtkcJ3tpaGYIPXRP9DwTs=;
        b=aei63XzgAyG20E4VTRczyajNLo90CtYiDNLMrq4ts3kNEdEvfpAPB6JIyFsp+s2UEx
         +LSgCkHkgGaS2B2abaWgxBrBW0NsIEWeegdXFTcJNwV64L2R7vGBVhpH+4D0nR02zzsS
         AN3+o40xqAOw7a/nBi326hjz54j72agfq/FJ6YHqc9QfQEM6r6tdIbB1WgVMp+aEtZpx
         1pwKsx43FXN/03QgCM3O+KvvtyUAnfOlCXaQAbofTjDJQsWh9seuuGIGKcJoakjsipWw
         qyVwNu5kP5em5KICIYepcytBylFk9BCJANEYbxR1qIZ57dDpRxKOpH45hSCerPYizm9S
         fhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762482601; x=1763087401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIO9XgKTQBkxG4BCbwFpKECtkcJ3tpaGYIPXRP9DwTs=;
        b=SZMZ4JJbe6Io6D2HnPZbdRsx1arFycfsspb8R80IjS1w6h33sP1+YlN6Xbo/yjS6sS
         nFo97rFqY25LWELmyWqDaWe2X8di3uF6w5iqmvOfRWozUfhtPe2uTFmMOQ66g3eyJlN4
         0qYEbKOOSjBCKj8rVM9/dzUbQ9tuzwihX/96yjOqusLbXDjTbaoY42qnoXhmq8mpYkx3
         3CFUAKTOecog9m7Uki6XAGGXsTTNHeo7I6nN2413pnZduKwp5YEWQduZOUVYodJDuiYT
         JeCXdioNcC9gjT2gmr2WCj0WIT6eHWo2FYdW54tBsUeke+lsYK3bFfZRA62umKFIxeGL
         F4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5gDYYmgSvgu0eQUN+bhKDIynarGgyNWVtgbicqDaJ33dfPihrxeslKWkDQa/Fqn/2t42VsoFMYTUqK/IF@vger.kernel.org
X-Gm-Message-State: AOJu0YycIme0LpdtGhs02nCZzQaC83RvXX2nQN9z63kce5lxFW/VsPcZ
	ou+bMAqDvfR187TlAg1ET0hJXlBZLirt6AfGIT+GWl2FbVbClv9kiEAcaqtg2Nxhk4UYNX3hKXe
	9t+eVfivVfQHnf7LSoHfNuXQVHlXwQk/ilM3HCtwrdvh4l+aAC8FzOPtlSs9yzDfyHuUA
X-Gm-Gg: ASbGncvXqj5OHgiNfOUMNKaWlBysLFZBI4njaEO9xBEkZLOv/flVF4BII0z7cK1qNk+
	3lXIInhDreNvBMwg1OyDIFZcZLvvrOQ6GvMd4NILRQowTPZwsAm7N7RMHm2sOYC80EzNveuX5MW
	2jYX3o8MuQ1F/tMbKa3FydCdbP7ZY3Un8fsLKekBTUL7BL/c119997dMFhacQBLQbnNBgDvt/KZ
	cLWxNZWkkYQz27jtHOqgQXShWD44xpP/nMBBaa/+9Z4m/dA+AiAEjWT1ad3NhkefvP7qUctxtu4
	EvIKNUcyMqlTNu2oi5Saexa0DG/JQPXmTRW9bKMmp78bX+YM/RKkuI14Cc49YpNK+N7qMR4siEK
	NMrNEU7eMfKgSvNE7KzwkrYt/sz9esAKADOGP45y+EQiGd7D0m7mQEsNUUGEfeJCy308K1Rs=
X-Received: by 2002:a17:90b:5448:b0:341:ae23:85fd with SMTP id 98e67ed59e1d1-3434c4fef8emr1725540a91.11.1762482601277;
        Thu, 06 Nov 2025 18:30:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpDVzgh/5BzCwNilviM7KKhSxSWY52Ks2D1HEpwxKEuKP0veIjNAr5Af3/EKb87PI8gztx4A==
X-Received: by 2002:a17:90b:5448:b0:341:ae23:85fd with SMTP id 98e67ed59e1d1-3434c4fef8emr1725518a91.11.1762482600758;
        Thu, 06 Nov 2025 18:30:00 -0800 (PST)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a69b33c7sm7630913a91.18.2025.11.06.18.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 18:30:00 -0800 (PST)
Message-ID: <2364b381-b789-4a95-bea0-06a0838c4694@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:29:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add backlight support
 for eDP panel
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251106-hamoa_dvt_backlight-v2-1-9f844c8f8110@oss.qualcomm.com>
 <vycaiobp3kpwu5pntzwbbzyp753ugvprkiu5sf45een2mu433m@2rbvtg5y5hw5>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vycaiobp3kpwu5pntzwbbzyp753ugvprkiu5sf45een2mu433m@2rbvtg5y5hw5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrpbOW/+ c=1 sm=1 tr=0 ts=690d59aa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=f3SE6yzH9HcG1KY4tSQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ws1xQIJE2kba_myhOCOAgXo1qItLEx6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAxOCBTYWx0ZWRfX6EeVujDxG/DE
 qMrq1h3XkqMrOHFcNgf2aeJcQOHuqBIo9aiHcuAmc2N5MTYG/uhDHH8IFZ68FWFbdmEEaxrpDTx
 wmDcS1eJY+yLY+dKjoA3X/ni1hdD6/KaLMcaNaEhE8HauIlnDW5WOypBsK0onfIaEaVELdsmqJx
 t18cExedW1lpr4MPRXAoxB9yUhUQqg+sTG1QztDLuIGuljakLgJrBU/4KfRJsDVAmVf5yrv8f3A
 bI5V+KafWdOzjppPrWaVikQ/xdepYm1E39/NdTGqdlYUfk9NzSbl3/2OUbOGGXz349MeFpxFAj4
 8vsYFPV11pM4bm7hpqhF1fFrq7zfq5LXeF3BlR3M69GCgyab8H2OFMg+8Af0TdO8cxs5N/bCvo9
 qQdINVbrofb8ZO42ZISWIfhDmapACg==
X-Proofpoint-GUID: Ws1xQIJE2kba_myhOCOAgXo1qItLEx6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070018



On 11/6/2025 4:43 PM, Abel Vesa wrote:
> On 25-11-06 15:12:06, Yongxing Mou wrote:
>> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
>> control node in kernel DTS due to some meta may not enable the backlight.
>>
>> Aligned with other x1e80100-based platforms: the PWM signal is controlled
>> by PMK8550, and the backlight enable signal is handled by PMC8380.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Add hamoa-iot-evk to the commit subject. [Konrad]
>> - Correct the property order in the vreg_edp_bl node. [Konrad]
>> - Link to v1: https://lore.kernel.org/r/20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 ++++++++++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> index 36dd6599402b..454aad40de34 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -17,6 +17,16 @@ aliases {
>>   		serial1 = &uart14;
>>   	};
>>   
>> +	backlight: backlight {
>> +		compatible = "pwm-backlight";
>> +		pwms = <&pmk8550_pwm 0 5000000>;
>> +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>> +		power-supply = <&vreg_edp_bl>;
>> +
>> +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>>   	wcd938x: audio-codec {
>>   		compatible = "qcom,wcd9385-codec";
>>   
>> @@ -183,6 +193,22 @@ vreg_edp_3p3: regulator-edp-3p3 {
>>   		regulator-boot-on;
>>   	};
>>   
>> +	vreg_edp_bl: regulator-edp-bl {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VBL9";
>> +		regulator-min-microvolt = <3600000>;
>> +		regulator-max-microvolt = <3600000>;
>> +
>> +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&edp_bl_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>>   	vreg_nvme: regulator-nvme {
>>   		compatible = "regulator-fixed";
>>   
>> @@ -819,6 +845,8 @@ &mdss_dp3 {
>>   	aux-bus {
>>   		panel {
>>   			compatible = "edp-panel";
>> +
>> +			backlight = <&backlight>;
>>   			power-supply = <&vreg_edp_3p3>;
>>   
>>   			port {
>> @@ -879,6 +907,22 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
>>   	};
>>   };
>>   
>> +&pmc8380_3_gpios {
>> +	edp_bl_en: edp-bl-en-state {
>> +		pins = "gpio4";
>> +		function = "normal";
>> +		power-source = <1>;
>> +		input-disable;
>> +		output-enable;
>> +	};
>> +
>> +	edp_bl_reg_en: edp-bl-reg-en-state {
>> +		pins = "gpio10";
>> +		function = "normal";
>> +	};
>> +
> 
> Drop empty line.
> 
> With that fixed:
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Thanks, will fix that next patchset.

