Return-Path: <linux-arm-msm+bounces-37580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 737079C5246
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0BDC1F21DFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 09:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C6820E007;
	Tue, 12 Nov 2024 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MFYIjDSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE97820DD6A;
	Tue, 12 Nov 2024 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404581; cv=none; b=ICEQofHXukja+nQr1E2CDq2ues0Em5sQNg84g9BAAldh5OTtKOgNmxA8AT3LNOGqh2MMF3O+BkLBCkGd9puaLLtj4HuU0nxURk6iPPDSX7fR444+ZsuF+iU92MG8ZUlJgJisfKPA9Ddz4IYxWZVez1mEbYXbz91JumE5I95ps4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404581; c=relaxed/simple;
	bh=6g6aFamBCbsgmM2Kll17oCcLkyohHq5dYAcbk0wDiaE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Cs8XR+cweEBsV7Z5Bk3VT1ZWqFPeyDd09hJoHowpwQNu7HzLWtqMp8azlL2MYCuUb7+GZtNyuVE1GGrSRA1o8qQGRLXM3sp4UamBMvPkAKDWba7OpewAtlGUP6w4UCMl0P+B8zz/dm01XTG2H2u7UJBqnEfH6D3BnFeC2nl83AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MFYIjDSg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2jl57016587;
	Tue, 12 Nov 2024 09:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KByY0kIBH1HQhw/Gdf/sRSakA2CaTD+WaOS4phb0L2Q=; b=MFYIjDSgTC66d7J/
	JDtgsmBKq8Q+IHNnx3IvhnAyHecpEX5AKJ4TS1anlvUHsbbavSxum8HnPq+ICF5c
	PKtceL4NF0V4fIKl5ZbZTwufuj1mmx2w0fYllhq17j6fHsE/dr/neCTfLQQ7V/8r
	F6sJueBhpdya2IoiWrzrIknPYjex9vZ5nA0/3wQW+VLg7+U75k0TXBQOKjLVr8P8
	YJKw3H8OeXo17MCMBkXnUIAVr0CDc6KAsXhmEtOgjLLgmqNanAQ3OOBASkLVM6Yk
	+S4MBAxXNS5fL4uy/UFVQZICGy1M3lBxq8Yy+KQw41YDYcsdeyxBVyQq0tg3Yrau
	kMKakw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gkxr42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:42:56 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC9gtXr015619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:42:55 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 01:42:49 -0800
Message-ID: <e5910555-ace1-4abd-af09-136011cbe124@quicinc.com>
Date: Tue, 12 Nov 2024 17:42:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
To: Elliot Berman <quic_eberman@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
 <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-2-f0778572ee41@quicinc.com>
 <j4ggfrynyoriseef5r5x6uwgo6cespll2np7uitc64yagoa6pz@r3ro2cpqrrry>
 <38cceae8-5203-4057-bd8b-f20fe3656474@quicinc.com>
 <CAA8EJprYHjYVM58e7i7Sxj64DSth4hhW_cUZ3hGqX7u0ecZFQg@mail.gmail.com>
 <ad9c7e47-8a7b-4aee-8d88-cabf42ec3298@oss.qualcomm.com>
 <csxhtspv4klk3yrdqx4rkoag3ssaagim74nvdpglijkqzfux4d@btniilyxnnwm>
 <20241031115300700-0700.eberman@hu-eberman-lv.qualcomm.com>
 <9b352f6a-0040-4efd-9971-45375036a16a@quicinc.com>
Content-Language: en-US
In-Reply-To: <9b352f6a-0040-4efd-9971-45375036a16a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TCTcV3w_OKF-d9os9u_39F0layKFHnXK
X-Proofpoint-GUID: TCTcV3w_OKF-d9os9u_39F0layKFHnXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120079



On 11/5/2024 3:47 PM, Tingguo Cheng wrote:
> 
> 
> On 11/1/2024 4:28 AM, Elliot Berman wrote:
>> On Mon, Oct 28, 2024 at 03:14:49PM +0200, Dmitry Baryshkov wrote:
>>> On Mon, Oct 28, 2024 at 02:09:45PM +0100, Konrad Dybcio wrote:
>>>> On 28.10.2024 10:41 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, 28 Oct 2024 at 10:40, Tingguo Cheng 
>>>>> <quic_tingguoc@quicinc.com> wrote:
>>>>>> On 10/28/2024 4:23 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Oct 28, 2024 at 04:03:25PM +0800, Tingguo Cheng wrote:
>>>>>>>> Enable PMIC and PMIC peripherals for qcs615-ride board.
>>>>>>>>
>>>>>>>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>>>>>>>> ---
>>>>>>>>    arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
>>>>>>>>    1 file changed, 15 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/ 
>>>>>>>> arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>>>> index 
>>>>>>>> ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>>
>>>>>>>>    #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>>>>>    #include "qcs615.dtsi"
>>>>>>>> +#include "pm8150.dtsi"
>>>>>>>>    / {
>>>>>>>>       model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>>>>>>       compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>>>>>> @@ -210,6 +211,20 @@ &rpmhcc {
>>>>>>>>       clocks = <&xo_board_clk>;
>>>>>>>>    };
>>>>>>>>
>>>>>>>> +&pon {
>>>>>>>> +    /delete-property/ mode-bootloader;
>>>>>>>> +    /delete-property/ mode-recovery;
>>>>>>>
>>>>>>> Why?
>>>>>> Because boot modes will be supported on PSCI module from another 
>>>>>> patch,
>>>>>> reboot-modes are required to remove from PMIC side.
>>
>> I don't know why "required to remove" is here. We *could* continue to
>> program the SDAM from Linux.
> Sure, we could continue to program the SDAM from Linux. Regarding PSCI 
> and PMIC both are dealing with reboot-modes, we need to consider more.
>>
>> That being said, I don't know that the firmware/bootloader from the
>> QCS615 Ride has the concept of "reboot to recovery" since it's not an
>> Android ecosystem. I'd let Tingguo comment on it.
>>
> About mode-recovery:
> pm8150.dtsi is originally designed for mobile/android devices in which 
> reboot modes are managed by PMIC driver, that's why I think the modes 
> are there in pm8150.dtsi.
> 
> About QCS615 Ride:
> QCS615 Ride use a pmm6155au(that's a variant of pm8150) and it's a Linux 
> system. But we involved pm8150.dtsi for "the meaning of variant". That's 
> why the "recovery-mode" is there. Maybe we can treat this as a change 
> for "the variant" as well(Only for QCS615 ride as Dmitry said).
>>>>
>>>> Do we know whether the PSCI call does the same thing under the hood?
>>>
>>> It might be writing to the SDAM. For example, SAR2130P also uses PM8150
>>> and, if I'm not mistaken, SDAM for reboot mode.
>>>
>>
>> Yes, PSCI does the same thing under the hood.
>>
>> What is going here is that we have introduced the SYSTEM_RESET2 vendor
>> resets in some firmwares which run on boards that use PM8150. Based on
>> context here (IOW: I might be a little wrong on the details), I guess
>> QCS615 Ride is being added to Qualcomm Linux stack, which has newer
>> firmware that supports using the SYSTEM_RESET2 vendor resets.
>>
>> IMO, we should move the mode-bootloader/mode-recovery properties out of
>> pm8150.dtsi and into the applicable board.dts. As Bjorn mentioned, the
>> interpretation of the cookie values is specific to the board's firmware,
>> not the the pmic*. Tingguo, can you submit patches to do that?
>>
> Of course, Should we split the "moving modes out of pm8150.dtsi" into 
> another patch series? Because there are some boards need to change and 
> this patch series is for "Adds SPMI bus, PMIC and peripherals for qcs615".
>> Regards,
>> Elliot
>>
>> *: In general, the cookie values are consistent. Some values are only
>> applicable on automotive board or mobile board though (or IOT).
>>
> 
update v4: 
https://lore.kernel.org/lkml/20241112-adds-spmi-pmic-peripherals-for-qcs615-v4-0-f0e54d8b6516@quicinc.com/

-- 
Thank you & BRs
Tingguo


