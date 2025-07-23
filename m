Return-Path: <linux-arm-msm+bounces-66194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A471DB0EC6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC77754574B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB9E27814F;
	Wed, 23 Jul 2025 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhTm37q7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263566ADD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753257203; cv=none; b=J4GBJ3gxCRLHA3sweqZdV8GsCh4KUI7FsPP+2nlUeihhI9nQXhFH5pmUwsyMmWiUFytiaEMWSyztmaFHQ5+vuFgIKHIjvt95v4TE2F9P75wbPMwZrDqVONBQDzPa5sTNUWsVFTopp3dSsMjbhScxO52+xCeYhKU56hZAxCe9PW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753257203; c=relaxed/simple;
	bh=6AUA4zDaiameTtBfRmj4nc7+J78zCgRFdcNELO3I5L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWX4/8O4ih/YVkCNgbcCjxmW0dsEhBPKWi1UbLfsK7EP08fZPR5adJ6tFkh/i53vUf9kqTYNVL1iaI9wnPDpj8q5lttvQzuMf2rmAWOnnFpvGkb3ElgduEfFL9ICc1I4WwaBB9O9TLOIzgIElL0Qtatsn1r1L0pYBtLipWMPOuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhTm37q7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMOGsd024516
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdlbcmtJz0mVZF6c4pr1ox58V6mA0vz53UAjtEAd3i8=; b=JhTm37q7O2eNlk9u
	JwsS8zXMc4j+IiZMPeij+rzQCfbmmouDUpZdPzdnO80jwlI8Sz1VSK3mbsbamv/m
	GNom75E/ilxx7TVmpwFCEZ5jX1rw6sX3DLNb1Frx1AeBzXQ9HOjLmrAx7FHPEQ8A
	HCXyST7uITCmDS33KMRN1cD6dtV274NDGxKJxXhyC95svO3w+vzAVWk9qCLuu4d1
	CTRXHUvwJM/X8sEU2/ITclMaKgOqHwwIbx0Mg3v8rOldgs8yZIiXyKYn5RxrSzd8
	Tl2T2bOVkWbaBXLQiCGhT2RCtZ1kSOFmXp2nU+SzqcIR+OyYJCam1OJL9DvLZbRI
	X2oxdA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1uaud0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:53:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b00e4358a34so4238611a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 00:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753257200; x=1753862000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bdlbcmtJz0mVZF6c4pr1ox58V6mA0vz53UAjtEAd3i8=;
        b=ptgAfkJ5cNQ97lQZqA9uVkuyac/ZP2VvYRmaYeMKDo5+3y+T/tPR04n4F/6C5gJrfs
         BU9ZAxcp7fhlCyAUsNJdIsxAvAjRUiG4l0IAxQDCnPiEVciut8IG9iKVeiMP4voU+SoP
         MHS5zYArkJlWFt7JDmUzWxXf1EOCz92pumDAx8UxEb+5buapbVeHsy3gRiz9aQCG8uEB
         OE07BxStgP2mbSfXFtFCNe0V9pyiZ8HR7/1zFTp5z29CeD0YFXeMT9OVO+QhhUvmyuSx
         n8Gv00HVwnqMtV2hPyUpCYZKCSeuhyAytUSoEuHRU1J/BvidSNzXd8rzSUeQprQLiiFF
         1e1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+VCtZ7taSTZnk69ZM01piMSSL+7xNpuiyKRk508kTJw+XSaGWIrGPDBBMZXr4AudhmjY62lDnKBXxpM+v@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo8Vd3tz4SuvhjSLYADdCG8TLqVAO1RDhWDqT8tNv5PN1d5tAG
	VdC1dHELO0QPNSE98q9V+3iF8CaicRGf+QFKOvcDJeNvyb+ngUSEoChRCbLtsv0SbQ47iWZ5A7E
	0+Fk3MYdxkG5T8/b6ef5WDbCuytsX3glV1GyKpDDwU6bq7m04nLSEX/gtjxrwiiUz5yi3
X-Gm-Gg: ASbGncvw3K4QUzeccthqYd4rT7YI1XLz7djeadVuoXVtKZH7EJ6SlLsaugCs3giz0LH
	fpmsbKcOHQEqWqgspcSe+l1hXhQnV94Pocn0ALOcBNj5XGGSaucUc/yHCm4ryfp6hz9gyTx1dyi
	wxy1QZw/VYP1sdaUws/kQXfNuUDvyQJFmRHje3JBLkfRq8aTup2/UxE6QLtuDc3qCyt9IjO8oyb
	l0qHgxhgTQhXJmlKFxsBnygXxRJebsW0oG2cRXxFAp5SZ03P8BbFqcIZsCAhw3PW4n+1QzcUSxN
	chBqYFlS6a3ywbHt+ONouJWI0rRn8f7I8X5fsonUuxG6hG7/tnMhlSJb/M8STqDJByxO4m+Irx1
	ZYGeOShv/InT1A2Vr6rw2UYvCcMk=
X-Received: by 2002:a05:6a20:430a:b0:21a:ecf5:ea71 with SMTP id adf61e73a8af0-23d4904017fmr3704498637.15.1753257200298;
        Wed, 23 Jul 2025 00:53:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXv4m6IG8934XcRiMWuyLGd/m78qxsh/7ZdcHnT+rokiIcxXq6zawIQJAfrmzCzRVYOl2RwQ==
X-Received: by 2002:a05:6a20:430a:b0:21a:ecf5:ea71 with SMTP id adf61e73a8af0-23d4904017fmr3704467637.15.1753257199847;
        Wed, 23 Jul 2025 00:53:19 -0700 (PDT)
Received: from [10.133.33.46] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8d550sm8349944a12.24.2025.07.23.00.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:53:19 -0700 (PDT)
Message-ID: <39deebf4-79cd-42a0-b49e-01d556e6d1e3@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:53:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
 <aHkhcUVBnrwadKfa@linaro.org>
 <3a381014-cfe4-4b3c-a3c7-df688c1e87cc@oss.qualcomm.com>
 <aHlZu51tYDSsyFTh@linaro.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <aHlZu51tYDSsyFTh@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=688094f1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=ErcKch8FPRIGc_MFKVoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA2NiBTYWx0ZWRfX/PlR3qGtlA7U
 ZPSeYwIlwQbMVtUKH5MnickawoODmTZp+NH8HJtOCPdpvu3ccdIiXZu8y1K2Aa6K9X51FtL3ya1
 u38FL/5f0OCSxX6Xa0YgwBpDZxMyfqfFDQ9hLSpFrBlyB7fi3VcJCrlfGzUPwo4LuI7ReCFxKHW
 qS8I4+KYtDZy161F/zECm4CK7AkzkcdpVUVVx9tAy0+yjCrD1dDX7UWhlXBBgsys9tj6NMMf0Yb
 fkbBXehVt36CJgcCOuup61hFL9ThNT20ftwzqE5rYEzHohDdEaxbjms/ch/keaoGBGVqX3hSVZk
 QrZP3+gpdo//0HNZQs0mYVpHLuWo9pwqhGr//bchJXKN31/OYyQ/aIVcQSeDxNpHI8J+ULg+l6n
 qFTP1PA+WcO32SufYOy9XpCKOCY3Rvdh1leroiNfQBJ4VTUVG0Qic37p7gRlHY+i4//5/L/R
X-Proofpoint-ORIG-GUID: BnD5SQ_rVwnxN5WvgdfU6xl0XTehzX6J
X-Proofpoint-GUID: BnD5SQ_rVwnxN5WvgdfU6xl0XTehzX6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230066



On 2025-07-18 04:14, Stephan Gerhold wrote:
> On Thu, Jul 17, 2025 at 10:10:05PM +0200, Konrad Dybcio wrote:
>> On 7/17/25 6:14 PM, Stephan Gerhold wrote:
>>> On Wed, Jul 16, 2025 at 05:08:41PM +0800, Yijie Yang wrote:
>>>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>>>> on Chip (SoC) — specifically the x1e80100 — along with essential
>>>> components optimized for IoT applications. It is designed to be mounted on
>>>> carrier boards, enabling the development of complete embedded systems.
>>>>
>>>> This change enables and overlays the following components:
>>>> - Regulators on the SOM
>>>> - Reserved memory regions
>>>> - PCIe6a and its PHY
>>>> - PCIe4 and its PHY
>>>> - USB0 through USB6 and their PHYs
>>>> - ADSP, CDSP
>>>> - WLAN, Bluetooth (M.2 interface)
>>
>> [...]
>>
>>>> +&usb_mp_hsphy0 {
>>>> +	vdd-supply = <&vreg_l2e_0p8>;
>>>> +	vdda12-supply = <&vreg_l3e_1p2>;
>>>> +
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&usb_mp_hsphy1 {
>>>> +	vdd-supply = <&vreg_l2e_0p8>;
>>>> +	vdda12-supply = <&vreg_l3e_1p2>;
>>>> +
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&usb_mp_qmpphy0 {
>>>> +	vdda-phy-supply = <&vreg_l3e_1p2>;
>>>> +	vdda-pll-supply = <&vreg_l3c_0p8>;
>>>> +
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&usb_mp_qmpphy1 {
>>>> +	vdda-phy-supply = <&vreg_l3e_1p2>;
>>>> +	vdda-pll-supply = <&vreg_l3c_0p8>;
>>>> +
>>>> +	status = "okay";
>>>> +};
>>>>
>>>
>>> Assuming the USB ports are located on the carrier board and not the
>>> SoM(?):
>>>
>>> Are carrier boards required to make use of all these USB
>>> ports/interfaces? In my experience it's not unusual that embedded
>>> carrier boards use only the functionality that they need. Maybe this
>>> should just set the common properties and enabling individual ports for
>>> PCIe and USB should be up to the carrier boards.
>>
>> The PHYs are on the SoC and if the kernel is told they're "disabled",
>> they may possibly be left dangling from the bootloader
>>
> 
> How is this different from any of the laptops we have upstream? If we're
> worried about firmware keeping unused PHYs on, then we should probably
> enable all the PHY nodes by default in the SoC .dtsi?

Per my understanding, the SoM may be used with various types of 
firmware, some of which might fully initialize all USB PHYs. In 
contrast, laptop platforms typically rely on fixed firmware that only 
initializes what's necessary for boot.

> 
> Thanks,
> Stephan

-- 
Best Regards,
Yijie


