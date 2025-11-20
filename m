Return-Path: <linux-arm-msm+bounces-82640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B549C7311A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id CD9012FDB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CAF3112AD;
	Thu, 20 Nov 2025 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxmCZUO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwbh6MF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236BA27F015
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630070; cv=none; b=b5kaTDKgnIsmUc2ScrcoxZKA+dqnIpAnAr0OEmKHx6tqORN02yymef+mj6jrcijPdoqTNKqNp4dfW9drHSb4EUxJ70yVSrfuIAIxTp6pWMfK2sZEBOtGdoCTU3U2Rk2pzFhY9FFf8LHkd2U/LimX7AJ0P8fcTh0wgvZSWR5IDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630070; c=relaxed/simple;
	bh=+IGXn9AvE72m3W84TDf4Uh/2wXTRVB1LmFhE4Ua2318=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJHeCczh+0psHPBNziY9DtOX+mLAxzFUIhsnNxGunlxi/1bxI34E6NEKuRLQ8MCCr+D7yu9AiVJ6/CZFPEOPyqiP0ubOBbiYV5w50Jhw2DGu7sU5iBjwFR0HcPmUhhnTcVkKXhTzq8+JmPvQl3R9KZPSMHw/tenhI4iNZIFiGGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxmCZUO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gwbh6MF+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK56TZW4026384
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+TV6NxIFpq6J6amCzIrX3rYHFvYpcNQYkdj9hSdm1co=; b=CxmCZUO0I4AZsL57
	xoRH6gtp+DddeTClEGnE4/WaNhAzRs18pMCj5EiFuR3Ksnk+JuY+vT/terJQxOBV
	sC68FYYSu8RCx7qcUcCavhb36cjT/K3Ysrj2QhBGdBI5Zt9VwmOlgvb+8P7yjRXx
	ve2RqdJrcTYdhPhU5A9Gk/V+3Aes/+2JXK1JB9lrXN13O28HvG7ofSe6fbxNzfrm
	WNEQZuQrPcir1spfxRjkDKCVBJZtYLgyB1/YzTelekxDKsdTSzomkpbQywkgvMrq
	lWy+gYmwZCg+e2p5joIiMY1Jd9gYXhsAkJvh1hXPzM3O5s7//BjrxrT568rJibgI
	PEyn4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahvj3gprv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:14:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b184fa3ffbso20414385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763630065; x=1764234865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TV6NxIFpq6J6amCzIrX3rYHFvYpcNQYkdj9hSdm1co=;
        b=gwbh6MF+jCh59Y0ePvEvOvLcvR7TpRXx6JhcbQERpqp0SU8zvCkjYEUbOxoqjmfinr
         OlrfNO0W/cpm03z3QZXICooaHYetoGFHnqci/Wd9fIsNBP70cRl0hFp2sF4gxYrjXkQZ
         gktv3z2hROBJbrcKHT77tMH3rovR1Z7ay0fVxH6M4aTFCnX/ii5t2PUZoI34TgmQCYTV
         phUqX0OlEqnGVIGs4DhfwZyphjzpred1KGt00mwzr5XXguL7kLD0XK3gXHTfd5ZvIrlI
         t8Gbaxk6qVNmSdofAFL20abRyIiMHX+IwUhMbf92+sGPk+g4v9EGFa8gUhSqlEBpFC1G
         WrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630065; x=1764234865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TV6NxIFpq6J6amCzIrX3rYHFvYpcNQYkdj9hSdm1co=;
        b=BRCrufj1SCXZh36+B9KQseLT4ZWp3RwN3by9tBpQUqXO2L/h0Wa1TmobUGeqoh5Iiu
         7VnT+LEZj8S1MUuIWRIZhTJipbQfq6SYCjWoPt5UnXpKBicGCKRr5A5UZz0a31Ko5deO
         culqrFrTfBcrFrKjpvDj0XwA+Vz+As68Rk/jC3Om220AmJyY1UM6p/nVkVWnNiNg4w07
         jfOpCKPH5W3OL4ugxDF1N7JnTKg0NckldTTk4PxN7E61M5tQBNLn1uLxC3yppFcEFLTQ
         mkgMrucPpAm01daQqTvVVdNtuwEFYymMtzRaMquO77AUPB2KezhG2bMSbo7nFfHImvZB
         fT6g==
X-Gm-Message-State: AOJu0Yz6emg+URO8wWhuWeRrZd85jRT5TE068+CfM8AxiOvPhBXE0rdP
	RiEisEr7/JgplpgfqYczf6iIztpUaw5d/1zyG0cOgU2yBpYehoYtK1hkLkEac1il1mncgLbqJtb
	g8ahJ2AmMJ49tev9qIBicja0rG7zwSqo3dRs5wcGkM+ZJdari1YAg2SmwavE0n20rdkTC
X-Gm-Gg: ASbGncsH8ktPFymd4M0Cm4dAyWUKKFIIHlt7Xh/48Rg+peNaYVYnd16ZMpITrD8u5TX
	GEeonPlRaBC9uh6/BNq4/T5VnK3J1O8bvX18rpram9CPR5k/+sShZNoXPKwf/m1WczALzeylxYL
	+ZqhTjDIkq6cCFozTZQTZ1sz2GRPs4NijSfdY+6mwXpTzHNU2KRfUXhxEv06aaTTwfOw6PH9fdX
	wYHnxyMvg6j5U+S0n8/XAz5pYo7eV4V0dW8MBIoWnSA6I87pGfB3TGbs+fJZtkgDlpzP7KEVjzw
	3PQW0QZghzlvu+fctmQ8C4ggQp5EBqJBUPWInPzCafJ/j85A1vo1kCsHLOyrw+1YwvqRhf0plV0
	FbBmqKF8e9hh0LEhlowUSJbIKzMu1+/Y2LujKYqYJomw0dy3iZ0mYtais/85ktsAU5g8=
X-Received: by 2002:ac8:5704:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee49314d9bmr22982741cf.0.1763630065272;
        Thu, 20 Nov 2025 01:14:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzSqpjIkrynAsEMRJnm8v+9fsCfA5C+Hvuztpok8rzvBgHvc55wV/HJaapki1sZFjuTIoBYQ==
X-Received: by 2002:ac8:5704:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee49314d9bmr22982651cf.0.1763630064855;
        Thu, 20 Nov 2025 01:14:24 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cf0435sm163012966b.4.2025.11.20.01.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:14:24 -0800 (PST)
Message-ID: <161da2d4-3306-4251-addb-cc9822a112c0@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:14:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
 <20251119-expressatt_nfc_accel_magn_light-v1-3-636f16f05cf4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251119-expressatt_nfc_accel_magn_light-v1-3-636f16f05cf4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=691edbf1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2dWhQ9a6AAAA:20 a=pGLkceISAAAA:8
 a=mTMy--iH0EC1zWreqloA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: eQacAmHNlSdXW8EZoLTeeo3BH-XJP4ah
X-Proofpoint-ORIG-GUID: eQacAmHNlSdXW8EZoLTeeo3BH-XJP4ah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NCBTYWx0ZWRfX1i9EeW3Xwi+L
 9hOr+xxpUA7oPGMGJJTM2z1hx5t5FQ9k7Fo+O3En4T8tyqzeAU59oxKon8pdoUCb+I1IyDWOi0d
 MMOQ1Oe4E+ueRKLlxMWV5lf/J1vtU0nyCn8+077cplmuelVBsjrVeEGVzH9JKw2haeLdr2VRuOP
 kNDoB+zSZAhYnxNmno/uORSZzpedJp3DQi/IXi4h32EAFQNgDFIXMzHhVl791y/1oHBPEyYlsfm
 64VnRX3TbNE9cWZ/HbOizAFyNSWoghiRilKpNFzCn5txSJFtJYjVO6uG0+du58AaELmgCAa1TNv
 u0Wl0XjmNLreiLF3TlA32t9OGMmDReQpCo/4wMh3H1aPfLl0g+8tzUeVlCD4eCqJ9ZUyWx7EMrf
 oInCpyYma2sMjU2zajCYMch5eNid2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200054

On 11/20/25 8:14 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the Yamaha magnetometer. Mount Matrix is left as a TODO.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> index 81806d7ca001..403bef67a148 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> @@ -490,3 +490,21 @@ &usb1 {
>  	dr_mode = "otg";
>  	status = "okay";
>  };
> +
> +&gsbi12 {
> +	qcom,mode = <GSBI_PROT_I2C>;
> +	status = "okay";

Please add a \n before status

> +};
> +
> +&gsbi12_i2c {
> +	status = "okay";
> +
> +	magnetometer@2e {
> +		compatible = "yamaha,yas532";
> +		reg = <0x2e>;
> +		vdd-supply   = <&pm8921_l9>;

Odd double space

> +		iovdd-supply = <&pm8921_lvs4>;
> +
> +		// TODO: Figure out Mount Matrix

pmOS wiki has this:

https://github.com/SiddharthManthan/accelerometer-mount-matrix-generator/blob/master/rotation_matrix.py

but for accelerometers.. shouldn't be too different, I would assume

Konrad

