Return-Path: <linux-arm-msm+bounces-30840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D4296CE73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 07:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 885F41C21E8A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9C4186615;
	Thu,  5 Sep 2024 05:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IdydUlej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9612186E40;
	Thu,  5 Sep 2024 05:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725514180; cv=none; b=Y3czjvybOI4aPx/i7aLPrTF8/vkyALhqWx3GLK0BucU0dVyzx/n++6q/TyNA8yfC/8VKfLpxzaU7tFYGYvmysSLCjYzS9huvOU5zugYTlMC8sVzaNmx1AtwSz/2/3lC4xwlVqr7/9QfdRfe7g4N+tULi8TxKCR+26Hg/UdpNPDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725514180; c=relaxed/simple;
	bh=/Rhq3bcvhDCY1UoEacLynJ+6olDrrMFt7zADnn7EHPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s1tPVea+I/npgTCvHObzzKAjR7U1EToBsGLib1JXpnDiPvDBoCWGURRWWg3908v6l94pyyXBffph/MCjdN/buJYvugdRrmRdkv69frNGKl9zw9S+kZum3lXBAfzCdaA+SEb+4WHGIEWmP10uJZIwenzl55I1PYritPKRxShJVTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IdydUlej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484MNFtl006359;
	Thu, 5 Sep 2024 05:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FldfljLyXuI4lAm/Zqq6fjxP/R364/OKwHtuXRjqMc=; b=IdydUlejU9DNatqb
	B+oTikCTGDkfTiKI+aZOLGSTP/gebc6sJGdfxSmvM0pdFL6FymLG6oCeNIgp3SE0
	JK8uY4E4JhN10ZqnR8Pok/W6piUK4m4CrKJHDkmdHbppsZdn36UlLu4X7ay7xcpm
	FqgnYgrMxKsOgEVK4y523j9LHSAKX2QE96zdeotwUJ0VhGNPDT5y6kB53YPe4VmL
	f0EUdict6/E0CUy90ODnJcqEmWrbobSaltw+tsG7EUln64ak1shPx1mPsSqInIOD
	5UhkHXw4ghtz/hczZen5uv1SYcRKOvDVSIS94fzc1zSSQhNdQxzGEqIcywH7/QPt
	L2GfNQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41enbwjkvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 05:29:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4855TVeJ001937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 05:29:31 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 22:29:25 -0700
Message-ID: <ded66421-9425-4b9d-9922-dacc66777b83@quicinc.com>
Date: Thu, 5 Sep 2024 13:29:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add base QCS615 RIDE dts
To: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
 <22qkvfravm6sxiq3xfavahg2u6b2pwlyzqbqvd55zym5zef3gi@m4bsqkdvggty>
 <17d0017e-b55d-4b32-9fd3-1a1a84e5ebf9@quicinc.com>
 <0ec92d59-0648-40ed-a522-307152b5c37d@kernel.org>
 <148451f2-6b1b-4616-b703-fd52e7afa2be@quicinc.com>
 <90c98fee-770c-4b83-9e05-6f04866094c2@kernel.org>
 <729deff2-d5df-4409-b941-af22de408521@quicinc.com>
 <9ded31cf-5b14-426a-a10c-694f20d4fb9e@kernel.org>
 <22657edf-5df9-44dc-b2a8-134ae613d819@kernel.org>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <22657edf-5df9-44dc-b2a8-134ae613d819@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 79xC2Ticx_-2CQVYrO3Qd1FO4IpF0QkN
X-Proofpoint-GUID: 79xC2Ticx_-2CQVYrO3Qd1FO4IpF0QkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050038



On 9/4/2024 6:23 PM, Konrad Dybcio wrote:
> On 4.09.2024 11:32 AM, Krzysztof Kozlowski wrote:
>> On 04/09/2024 10:35, Lijuan Gao wrote:
>>>
>>>
>>> 在 8/28/2024 5:34 PM, Krzysztof Kozlowski 写道:
>>>> On 28/08/2024 11:31, Lijuan Gao wrote:
>>>>>>>>> +/ {
>>>>>>>>> +	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>>>>>>> +	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>>>>>>> +
>>>>>>>>> +	chosen {
>>>>>>>>> +		bootargs = "console=hvc0";
>>>>>>>>
>>>>>>>> Noooo, last time I agreed on this, you told me later it is different.
>>>>>>>>
>>>>>>> In the early stages, enabling HVC is to more easily verify clock and
>>>>>>> PMIC related functions, as it’s difficult to debug without the console
>>>>>>> log. After the clock and PMIC are ready, we will enable the UART console.
>>>>>>
>>>>>> Working serial is supposed to be part of the early submission.
>>>>>>
>>>>> Okay, I will remove it in the next patch.
>>>>
>>>> Can you post next version with proper serial device?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>> Hi Krzysztof,
>>>
>>> Can we use the dts without console enabled as the first version? When 
>>> the clock is ready, we will submit new changes to enable the UART console.
>>
>> It is very surprising not to have console available in the first, early
>> submission, but it is not a blocker for me.
> 
> Lijuan,
> 
> I see that the initial submission is very slim. GCC+UART+TLMM is
> usually the smallest we tend to accept.

We are exploring various ways to improve the efficiency of the upstream
change merge process. In the current QCS615 project, we are
experimenting with a slim "HVC console" verified base device tree to
minimize dependencies and enhance parallel work efficiency.

Currently, different developers are working on the same QCS615 project.
One developer is focusing on clock support for QCS615, another is
working on interconnect support, and a third is handling TLMM pinctrl
support. Additionally, the QUP UART validation depends on above soc
specific GCC clock/TLMM support.

Here is the proposed process chart for reference, Clock/TLMM, even other
functionality like LLCC can be validated apart from current Base support
with HVC console enabled:
                               +---------------+

                               | Clock         |

                               |               |

                               +---------------+

+---------------------+

|    Base support:    |        +---------------+       +-----+

| HVC console enabled |------> | TLMM          | ----->| UART|

+---------------------+        +---------------+       +-----+



                               +---------------+

                               | Interconnect  |

                               +---------------+


It is suggested to have process like this:
1. Have hvc console enabled base device tree support.
2. TLMM/GCC/Interconnect/LLCC/etc drivers can be pushed along with the
needful dt changes.
3. QUP uart support change after TLMM/GCC dependency uploaded.

Here is an original example of qcs8300 project that the base device tree
wait until have all qup uart enabled support for reference:
1. The first soc support[1] pushed at 08/14.
2. TLMM support[2] pushed at 08/19.
3. GCC clock support[3] pushed at 08/20.
4. Interconnect support[4] pushed at 08/27.
5. LLCC support[5] pushed at 09/03.
6. Initial device tree support[6] pushed at 09/04. And it have 5
co-developer in the initial device tree support.


[1]https://lore.kernel.org/all/20240814072806.4107079-1-quic_jingyw@quicinc.com/
[2]https://lore.kernel.org/all/20240819064933.1778204-1-quic_jingyw@quicinc.com/
[3]https://lore.kernel.org/all/20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com/
[4]https://lore.kernel.org/all/20240827151622.305-1-quic_rlaggysh@quicinc.com/
[5]https://lore.kernel.org/all/20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com/
> 
> While hooking up these drivers may take some time, please consider
> at least describing a subset of the clocks and the QUP UART, as
> everything non-SoC-specific is already in place.

To be more specific, are you suggesting like adding the base device tree
describing with current nodes subset which only have non-soc-specific
info, like:
1. "apps_rsc" nodes without info of
"qcom,qcs615-rpmh-clk","qcom,qcs615-gcc"?
2."qcom,geni-debug-uart" nodes description without the clock properties?

> 
> Konrad

-- 
Thx and BRs,
Aiqun(Maria) Yu


