Return-Path: <linux-arm-msm+bounces-37030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCD09BC745
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 08:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B257E1F2242F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 07:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA841FE0F7;
	Tue,  5 Nov 2024 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z+NmDo/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805F282F1;
	Tue,  5 Nov 2024 07:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730792871; cv=none; b=lQKk49Lnqn3uIKdVpoeSQmyLwXWK2hRzH6ZlNnaYsL7A2bshy5F/ogZsCPEo4Vy9d38HHqHZ2gDEwFnVSRCUI/Db8WMritmQtEsInYg89VLbbNoH2jPmzRqn1+YY4EpNFLIRjPvU5AkVTDxlre1YkPa3hlq8QeMDCip6Sochzj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730792871; c=relaxed/simple;
	bh=EBbRhE8MzeGYiMYt6sM4Fj5YZL7+G13zbZSbkWGLpdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cFGK70R7wbmN4qQ5bP5RLwNaZM8u44d+oe+P12jY9mG9R+gN3gYEx71B2L5TTjCTA73THiTKbEX0zaYzycsy3lbzRUZgpQf9wW0lFJXdV7LgGodoz6Y7KTlwyvfOJjwm60VJUjYQ9956A8D4ESP9uNqz/dKRTriZn3sXFCJ+0jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z+NmDo/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIoxa009217;
	Tue, 5 Nov 2024 07:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lrAcnGxbCP8oDbsVK31MBnAR/+hVIIa3Xn3I1hELUQ=; b=Z+NmDo/PCTYSU444
	rIlGUdMgIY4DpV+DFJJmWhfQIGLx4wzDqauL7guwcCXIYqM5dUvGosgVlQkVp7pA
	5TretlR0JboOCc+AI2clDTpc58Z8NxWnfCVkFwBem+kDHXOHHGU8gX488uhV+z7k
	x5r4itQdhJnEByqlBPYH7Why3ZUdPdh5LUDbEghCm3ghbOCUtWuWlYtQFkkMTnxM
	CWa+S66gjTwn1cS0jVtDW308mcZEpzzce1z1Z2fNCP+crQTEe4ZciGD3YxfqUyx3
	zICHPWXI/PK0qz6GHPFv783kk1aF5jcYjroCbJHj3r0H+mmmBjMrkDqv3suJbivq
	oEBTzQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4uptrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 07:47:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A57lhmE023878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 07:47:44 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 23:47:37 -0800
Message-ID: <9b352f6a-0040-4efd-9971-45375036a16a@quicinc.com>
Date: Tue, 5 Nov 2024 15:47:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
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
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <20241031115300700-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FnudUoHwrAEwl23AQEVrdHhcfB9mB2r7
X-Proofpoint-ORIG-GUID: FnudUoHwrAEwl23AQEVrdHhcfB9mB2r7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050056



On 11/1/2024 4:28 AM, Elliot Berman wrote:
> On Mon, Oct 28, 2024 at 03:14:49PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Oct 28, 2024 at 02:09:45PM +0100, Konrad Dybcio wrote:
>>> On 28.10.2024 10:41 AM, Dmitry Baryshkov wrote:
>>>> On Mon, 28 Oct 2024 at 10:40, Tingguo Cheng <quic_tingguoc@quicinc.com> wrote:
>>>>> On 10/28/2024 4:23 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Oct 28, 2024 at 04:03:25PM +0800, Tingguo Cheng wrote:
>>>>>>> Enable PMIC and PMIC peripherals for qcs615-ride board.
>>>>>>>
>>>>>>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>>>>>>> ---
>>>>>>>    arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
>>>>>>>    1 file changed, 15 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>>> index ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>
>>>>>>>    #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>>>>    #include "qcs615.dtsi"
>>>>>>> +#include "pm8150.dtsi"
>>>>>>>    / {
>>>>>>>       model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>>>>>       compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>>>>> @@ -210,6 +211,20 @@ &rpmhcc {
>>>>>>>       clocks = <&xo_board_clk>;
>>>>>>>    };
>>>>>>>
>>>>>>> +&pon {
>>>>>>> +    /delete-property/ mode-bootloader;
>>>>>>> +    /delete-property/ mode-recovery;
>>>>>>
>>>>>> Why?
>>>>> Because boot modes will be supported on PSCI module from another patch,
>>>>> reboot-modes are required to remove from PMIC side.
> 
> I don't know why "required to remove" is here. We *could* continue to
> program the SDAM from Linux.
Sure, we could continue to program the SDAM from Linux. Regarding PSCI 
and PMIC both are dealing with reboot-modes, we need to consider more.
> 
> That being said, I don't know that the firmware/bootloader from the
> QCS615 Ride has the concept of "reboot to recovery" since it's not an
> Android ecosystem. I'd let Tingguo comment on it.
> 
About mode-recovery:
pm8150.dtsi is originally designed for mobile/android devices in which 
reboot modes are managed by PMIC driver, that's why I think the modes 
are there in pm8150.dtsi.

About QCS615 Ride:
QCS615 Ride use a pmm6155au(that's a variant of pm8150) and it's a Linux 
system. But we involved pm8150.dtsi for "the meaning of variant". That's 
why the "recovery-mode" is there. Maybe we can treat this as a change 
for "the variant" as well(Only for QCS615 ride as Dmitry said).
>>>
>>> Do we know whether the PSCI call does the same thing under the hood?
>>
>> It might be writing to the SDAM. For example, SAR2130P also uses PM8150
>> and, if I'm not mistaken, SDAM for reboot mode.
>>
> 
> Yes, PSCI does the same thing under the hood.
> 
> What is going here is that we have introduced the SYSTEM_RESET2 vendor
> resets in some firmwares which run on boards that use PM8150. Based on
> context here (IOW: I might be a little wrong on the details), I guess
> QCS615 Ride is being added to Qualcomm Linux stack, which has newer
> firmware that supports using the SYSTEM_RESET2 vendor resets.
> 
> IMO, we should move the mode-bootloader/mode-recovery properties out of
> pm8150.dtsi and into the applicable board.dts. As Bjorn mentioned, the
> interpretation of the cookie values is specific to the board's firmware,
> not the the pmic*. Tingguo, can you submit patches to do that?
> 
Of course, Should we split the "moving modes out of pm8150.dtsi" into 
another patch series? Because there are some boards need to change and 
this patch series is for "Adds SPMI bus, PMIC and peripherals for qcs615".
> Regards,
> Elliot
> 
> *: In general, the cookie values are consistent. Some values are only
> applicable on automotive board or mobile board though (or IOT).
> 

-- 
Thank you & BRs
Tingguo


