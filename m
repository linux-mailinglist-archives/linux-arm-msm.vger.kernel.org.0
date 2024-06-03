Return-Path: <linux-arm-msm+bounces-21443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA408D7C99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E56F3283624
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 07:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F13347F6B;
	Mon,  3 Jun 2024 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CSRirevb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6AC47A4C;
	Mon,  3 Jun 2024 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717400342; cv=none; b=RJwsEJ7spy9YX2K+mYYcU01sa/o5pCqRvURJVBwZtdzGEPvahFMm+PHQok1xI73ioIXUW4AHSFYj3ILv7s7jHOcmTo4wvQrK3AkXCw+xsMyi6pKCSX6LNFeVIYUAzQRpTP4asjnMiZcfgSe4K+btyzUXilAIuHwr4AbzzKuGOhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717400342; c=relaxed/simple;
	bh=3OdgjKpZPkAQHLcck0rkvVYntYujmuP6aMxqQFcAWrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f5uXeeZsWhVubHMtEhu3pY97h3OIUcNEMxu2cQWPtNG2ZRckmc9wDn6DId0FMGOCho600UTcHTURxOgHUv0pZYInhmPLiQHiA+7BybF4F5+SdMglR8U4SEyjAPZsXhu4C6uw7661AS1UeRii+0WFM5JN9gBkVCjuFbdiDvVtUsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CSRirevb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452NYVca009764;
	Mon, 3 Jun 2024 07:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxEi7sRy7iK+COlhc2ROTwcgjGcfbLpHiMuNpxfg+T8=; b=CSRirevbxgEOMAfp
	EYvrbbTEp18R+tPNkiX1sUqCi8zr0LG8cR3hIgjyCy8vDIjkttfQ9rTscm0w7d0U
	j5SRl2jebaAI1WhAj8nLsJRPSRyKay7kEflU4PvD+FMP42AOnQCaEd2R8MzJqGRi
	zxNF2D/zRjS8ErEsrJN6fcu8ER5hsaXYBDSRfXur0cagm47SwMWOWsJYoP35T1o6
	5ddi3MJZ3SDSXBYJNZQTf2MBJbC2X/4rV3Mm+KQuUd3UanCL0+FZDz7hQaGbL8ku
	PbXkNSb3p8egYkhXk9lLnheBp7SAyGXcDSFWR3Ci8PQen0Xn5cRzl+uliLsiB1A2
	KKfglg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw3r3fq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 07:38:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4537croY014756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 07:38:53 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 00:38:46 -0700
Message-ID: <89c5c663-df8a-43d4-91b3-0a84b0c9a324@quicinc.com>
Date: Mon, 3 Jun 2024 15:38:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: aim300: add AIM300 AIoT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Ziyue Zhang
	<quic_ziyuzhan@quicinc.com>, <quic_chenlei@quicinc.com>
References: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
 <20240529100926.3166325-5-quic_tengfan@quicinc.com>
 <s5gt3p6zsd5ebrkop4dhd33tykln33f6ahu3pibymecxsmakyd@lg5wfgec6dat>
 <205de8b7-507f-45c9-83ce-6eceb1466cb2@quicinc.com>
 <CAA8EJpqFq=6YFcUpjdkKikN54iQ76i8Rk_z+mLH1Tt0zFFmciQ@mail.gmail.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <CAA8EJpqFq=6YFcUpjdkKikN54iQ76i8Rk_z+mLH1Tt0zFFmciQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 17CZvZQvUzItZmzYtah8R3pekd3KxjMK
X-Proofpoint-GUID: 17CZvZQvUzItZmzYtah8R3pekd3KxjMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_04,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030063



On 5/31/2024 4:38 PM, Dmitry Baryshkov wrote:
> On Fri, 31 May 2024 at 11:35, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>>
>>
>>
>> On 5/29/2024 11:18 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 29, 2024 at 06:09:26PM +0800, Tengfei Fan wrote:
>>>> Add AIM300 AIoT Carrier board DTS support, including usb, UART, PCIe,
>>>> I2C functions support.
>>>> Here is a diagram of AIM300 AIoT Carrie Board and SoM
>>>>    +--------------------------------------------------+
>>>>    |             AIM300 AIOT Carrier Board            |
>>>>    |                                                  |
>>>>    |           +-----------------+                    |
>>>>    |power----->| Fixed regulator |---------+          |
>>>>    |           +-----------------+         |          |
>>>>    |                                       |          |
>>>>    |                                       v VPH_PWR  |
>>>>    | +----------------------------------------------+ |
>>>>    | |                          AIM300 SOM |        | |
>>>>    | |                                     |VPH_PWR | |
>>>>    | |                                     v        | |
>>>>    | |   +-------+       +--------+     +------+    | |
>>>>    | |   | UFS   |       | QCS8550|     |PMIC  |    | |
>>>>    | |   +-------+       +--------+     +------+    | |
>>>>    | |                                              | |
>>>>    | +----------------------------------------------+ |
>>>>    |                                                  |
>>>>    |                    +----+          +------+      |
>>>>    |                    |USB |          | UART |      |
>>>>    |                    +----+          +------+      |
>>>>    +--------------------------------------------------+
>>>>
>>>> Co-developed-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>> Co-developed-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>>>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>    .../boot/dts/qcom/qcs8550-aim300-aiot.dts     | 322 ++++++++++++++++++
>>>>    2 files changed, 323 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
>>>
>>> [trimmed]
>>>
>>>> +&remoteproc_adsp {
>>>> +    firmware-name = "qcom/qcs8550/adsp.mbn",
>>>> +                    "qcom/qcs8550/adsp_dtbs.elf";
>>>
>>> Please excuse me, I think I missed those on the previous run.
>>>
>>> adsp_dtb.mbn
>>
>> Currently, waht we have released is adsp_dtbs.elf. If we modify it to
>> adsp_dtb.mbn, it may cause the ADSP functionality can not boot normally.
> 
> Released where? linux-firmware doesn't have such a file. And the modem
> partition most likely has a different path for it anyway.

Firmware releases can be obtained from 
https://qpm-git.qualcomm.com/home2/git/qualcomm/qualcomm-linux-spf-1-0_test_device_public.git 
after users sign up for free accounts on both 
https://qpm-git.qualcomm.com and https://chipmaster2.qti.qualcomm.com.

> 
>>
>>>
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&remoteproc_cdsp {
>>>> +    firmware-name = "qcom/qcs8550/cdsp.mbn",
>>>> +                    "qcom/qcs8550/cdsp_dtbs.elf";
>>>
>>> cdsp_dtb.mbn
>>
>> CDSP also as above ADSP.
>>
>>>
> 
>>>> +
>>>> +    te_active: te-active-state {
>>>> +            pins = "gpio86";
>>>> +            function = "mdp_vsync";
>>>> +            drive-strength = <2>;
>>>> +            bias-pull-down;
>>>> +    };
>>>> +
>>>> +    te_suspend: te-suspend-state {
>>>> +            pins = "gpio86"
>>>> +            function = "mdp_vsync";
>>>> +            drive-strength = <2>;
>>>> +            bias-pull-down;
>>>> +    };
>>>
>>> What is the difference between these two?
>>
>> TE pin needs to be pulled down for both active and suspend states. There
>> is no difference.
> 
> So why do you need two different states for it?

Dividing into two different states can provide a clearer expression of 
whether the corresponging functionality is avtive or suspend.

We can also find similar settings in the other SM8550 and SM8650 
platform dts files, such as sm8550-qrd.dts and sm8650-qrd.dts.

[1] sm8550-qrd.dts: 
https://elixir.bootlin.com/linux/v6.9.3/source/arch/arm64/boot/dts/qcom/sm8550-qrd.dts#L1052

[2] sm8650-qrd.dts: 
https://elixir.bootlin.com/linux/v6.9.3/source/arch/arm64/boot/dts/qcom/sm8650-qrd.dts#L1098

> 
> 
> 
> 
> 

-- 
Thx and BRs,
Tengfei Fan

