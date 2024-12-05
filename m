Return-Path: <linux-arm-msm+bounces-40443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D39E4F2B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D05B167A8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137FE1CEE9B;
	Thu,  5 Dec 2024 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocVCW4fa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954981946C3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385766; cv=none; b=VC8H9ZRVVoaLbHHDOSa37GgJibZU6x7PnZoLRgQtZiPRyNLCz96Pruielr1mmsrV9n1yDDc/WsyTvQTOF0wEdzSsm2Aq4y38rnhUyLSoEeKEgj4uh66rjdndL+fEJVVoIW0hzbrfGJdG7dDgeLMSpA0JCAGkEMqjpvDZUi5mrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385766; c=relaxed/simple;
	bh=XwrjnNkQ4knvmDC7/9/Z1Nk8C/X91nId4SNN1HJvRLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQJvCTWcy85EeLP+cIma1A1Pyz321ua9PyZoMQgt1WK5/CNvDNvl3Zn4eMJft2kzsjU+bCi+iacgNznQqkAKyyfqq9E/rwQrzeXm4e5YBGj3H/DOnPrFRadkIny5vZUgs0VC+5cIWSQuvD09e0ZPDN0kPN0LX+Cgh6t1p9VnuMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocVCW4fa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B55BUnK032120
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 08:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqbqqcJulAmbWewF5le6MsZzz4kokdCOT6f67ZVo8NM=; b=ocVCW4fa/Q1LgQWQ
	bdgwCfPTS0t6awWhQu+TRKU6UgdPcDCIKYZJOgk7klFa0diIGbp5PXqQI45DRTgZ
	sUiE8NZU3LPNUWMlSRNjtzVu5ieuZy5FxJqMumDFC3iN+jcVZ0kOTnz/XDIkQyPa
	xcEiLlfxLj1iXnK7ECN+laP6mYq4RKwgqHfOupENK0LtGgZkWbrC3Y8C4xXXKH8O
	HpW0nrAp3/QCn7kAQp1I/MMBW9WBtoadx9PCPFrRj9AoblbXRWnGBemDMi8Y1Ok5
	mNtCXJQFFq/KY73YzNp/Ho55jvbdoyIanohg+c09hYupoVj8RynxEs30B6RB64lV
	X8rJEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3fawq24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:02:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-7f3e30a441aso490460a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 00:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385756; x=1733990556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqbqqcJulAmbWewF5le6MsZzz4kokdCOT6f67ZVo8NM=;
        b=uXf+qfnLt94/JnvnGUiHNnO06QsUJg/UbbVB0xBcZbXDXhSV6ra7jwg5hECH8j2TUm
         f6muyT7Vk0YphUjwiJhmxDyn7ROa3tMfCY/z/WWLngYVfMicIFJRlbTFDXVVveKrNn9Y
         4FIvPYELmdsnIHuPnipaDxs5bFI5wZHazEh/0A4R8j6ug7fsoLJyQLuQLAuhcnJXy4Nz
         /WaxL1ilshGgJz34QeCX4dQUdNeGPwAsGVrJcbyQz78kRaSDxKechuFsqq1ef9mwMNTa
         jrAxl5kM+crEAEtdLqF/djLJJ7KHO3mcsN14ivkbFOVzMK33NfFkOlU7CbUgvk7J881I
         Wnaw==
X-Forwarded-Encrypted: i=1; AJvYcCU9rZopm2wbQX4xOE3mZ8itypxVrTDnNYa4tlNt0fZ3TR6fTqcZ62yqCmsoSL0mMbG+hRc+0HRTntC6E0RS@vger.kernel.org
X-Gm-Message-State: AOJu0YzxGhwv2WMmN+a1z6kMY550kdBAleEAJOV8ufSDY3NLUujBPXgm
	V++ua7vZMKO0JsULveo6qIl0ba1LTeZt0U/+G6XnfjZd3Pd5JOXXtiDQ0JJournUqyQlKXRBfGI
	i0eCUJn4kU32zz55xxGl7y83gPHgAKv22Cyv0t/P3qqwWwaUWw+h0zaGc5a+r077Mh2JVYtpi
X-Gm-Gg: ASbGnctUvIVMnEMQtjdbyFJROkxq65HCtRApmJR/znKo5FC5QN84jbb+JdJHTPbm4YB
	OihZw8byfdkBik38hoLt2V1NcQmdW9OPVNvvYRfAvocYC7FXRvE8LCwZMBBdiIfMbXUgPhS8cu0
	jBQCfMWOE68EwffVgaYMDZEinWfL0f4xvG8sbflORA9MQr+Pz4G8zMAlgsDvVzFgblJ+3LoGNAL
	N0GOTcYb3RWDIIjYYS6hQVILUhBIELE28eEh5HhrvDKs7+XkSt8iyd0XwbHBAtnZ7kY1TsrKEYU
	YNHFXQ==
X-Received: by 2002:a05:6a21:3941:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1e165438833mr16445334637.46.1733385756364;
        Thu, 05 Dec 2024 00:02:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFerYsbdp1Pj/tRpDFeOsFzKZusCyeQcW368bYmYk17ZSI8YNxJAIjpZrugnZOIdSlvtWUTQQ==
X-Received: by 2002:a05:6a21:3941:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1e165438833mr16445278637.46.1733385755960;
        Thu, 05 Dec 2024 00:02:35 -0800 (PST)
Received: from [10.92.169.167] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd157b229csm735543a12.52.2024.12.05.00.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:02:35 -0800 (PST)
Message-ID: <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 13:32:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
To: Johan Hovold <johan@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VD_TMve-WXOiTEnSglChKr42ICk5V2dY
X-Proofpoint-GUID: VD_TMve-WXOiTEnSglChKr42ICk5V2dY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050058



On 12/3/2024 6:45 PM, Krishna Kurapati wrote:
> 
> 
> On 12/3/2024 3:50 PM, Johan Hovold wrote:
>> [ +CC: Krishna, Thinh and the USB list ]
>>
>> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
>>> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
>>> multiport controller on eUSB6. All other ports (including USB 
>>> super-speed
>>> pins) are unused.
>>>
>>> Set it up in the device tree together with the NXP PTN3222 repeater.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 
>>> +++++++++++++++++++++++++++++++
>>>   1 file changed, 48 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts 
>>> b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> index 39f9d9cdc10d..44942931c18f 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> @@ -735,6 +735,26 @@ keyboard@3a {
>>>       };
>>>   };
>>> +&i2c5 {
>>> +    clock-frequency = <400000>;
>>> +
>>> +    status = "okay";
>>> +
>>> +    eusb6_repeater: redriver@4f {
>>> +        compatible = "nxp,ptn3222";
>>> +        reg = <0x4f>;
>>
>> The driver does not currently check that there's actually anything at
>> this address. Did you verify that this is the correct address?
>>
>> (Abel is adding a check to the driver as we speak to catch any such
>> mistakes going forward).
>>
>>> +        #phy-cells = <0>;
>>
>> nit: I'd put provider properties like this one last.
>>
>>> +        vdd3v3-supply = <&vreg_l13b_3p0>;
>>> +        vdd1v8-supply = <&vreg_l4b_1p8>;
>>
>> Sort by supply name?
>>
>>> +        reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>>> +
>>> +        pinctrl-0 = <&eusb6_reset_n>;
>>> +        pinctrl-names = "default";
>>> +    };
>>> +};
>>> +
>>>   &i2c8 {
>>>       clock-frequency = <400000>;
>>> @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
>>>           bias-disable;
>>>       };
>>> +    eusb6_reset_n: eusb6-reset-n-state {
>>> +        pins = "gpio184";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-disable;
>>> +        output-low;
>>
>> I don't think the pin config should assert reset, that should be up to
>> the driver to control.
>>
>>> +    };
>>> +
>>>       hall_int_n_default: hall-int-n-state {
>>>           pins = "gpio92";
>>>           function = "gpio";
>>> @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
>>>   &usb_1_ss2_qmpphy_out {
>>>       remote-endpoint = <&pmic_glink_ss2_ss_in>;
>>>   };
>>> +
>>> +&usb_mp {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&usb_mp_dwc3 {
>>> +    /* Limit to USB 2.0 and single port */
>>> +    maximum-speed = "high-speed";
>>> +    phys = <&usb_mp_hsphy1>;
>>> +    phy-names = "usb2-1";
>>> +};
>>
>> The dwc3 driver determines (and acts on) the number of ports based on
>> the port interrupts in DT and controller capabilities.
>>
>> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
>> that would still be there in the SoC (possibly initialised by the boot
>> firmware).
>>
> 
> The DWC3 core driver identifies number of ports based on xHCI registers. 
> The QC Wrapper reads this number via interrupts. But these two values 
> are independent of each other. The core driver uses these values to 
> identify and manipulate phys. Even if only one HS is given in multiport 
> it would be sufficient if the name is "usb2-1". If the others are 
> missing, those phys would be read by driver as NULL and any ops to phys 
> would be NOP.
> 

However do we need to reduce the number of interrupts used in DTS ?
We don't need to give all interrupts as there is only one port present.
We don't want to enable all interrupts when ports are not exposed.

Regards,
Krishna,

