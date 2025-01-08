Return-Path: <linux-arm-msm+bounces-44429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A40BA0611B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80F13A1740
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 16:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC0E1FE455;
	Wed,  8 Jan 2025 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HdKApLP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DEF13D52E;
	Wed,  8 Jan 2025 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352516; cv=none; b=C+cOJDKL8wGSD61DixkYtBIRJmbqZp/S+5E2OPQMW96Jf/RgjY1inyQuGYjFolcUzizCwPZgEs/I3HuXBexSQEq0G5NPaYQh2e+/1/poRP/Iw90iFavPqoiK3i41BQNvdTmVqV3wBgI7w4A/wHtdHTZVrsEUtcjMcLmc5tLBxwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352516; c=relaxed/simple;
	bh=H9kr5sv6YWuWgucBcqUXv6Qq59FuW6uIHCVUtJA2/s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sALnYJMrVkdoqn2drIUvaSWVzM+ut53nvMwOZBdaCOfvqkg3fZXPBnzGAAt+wDHqLx/QylpqZUbOWD3PLzSEwxdbFN6kVxbR7Xa5MSG/vCpnu/7S20QDcN71wFMwiXnTev8rQ9vfkawWkQK/3EculKJqTIgX7xkCytv+jVueRFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HdKApLP1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkTED002282;
	Wed, 8 Jan 2025 16:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/+q++c4M8S7wUaTOFqJ/qehcs3vC7iAAFMLaVVM1i4=; b=HdKApLP1PmwUXucN
	IwFOOFE2zoOMg5EX68O481mGFTfyvxbaipVAJIltJ4pvMO0LgAGGgJFkUAAsWjYK
	ZIv7GAn3fG/8DeouOz9WqzWiM5GtiP2fjB55d7Gaygvzfzsmt5x745sDxLoTMEwl
	9vjK0V6ygUT+lMBebefZK50iZj8IkFP5W+L4T+KN6bEVm3uq5Eptb/G7DkR36/N4
	tfODsq16vunuiZ5xTEUvPGQVPo4r4BlLP5kjwERWIMmQ0NmiujibK0Byk5aSheWj
	QDs7CNd4PQ0i4yndMrRscAxZ+W3W0CNkBl3aoODKQQ/o0vrRp2w9glg/8v2qwmvp
	QJCpkQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441md31c97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 16:08:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508G8Scr018269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 16:08:28 GMT
Received: from [10.216.3.216] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 08:08:22 -0800
Message-ID: <cf2ad828-d00d-133b-f310-1688fc0ed59b@quicinc.com>
Date: Wed, 8 Jan 2025 21:38:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <zn4uf3mmlmt3who474hwkr44poycfqtjtidshybbg55a3hr63y@zxefqbhiwkbg>
 <d54c6706-3c6b-211c-6acb-fa3984c30c67@quicinc.com>
 <ubasbsyspn5euygihgphyw3xg4ckveytvgnjpwdiyg4pv7degr@6y44ya4gvaqj>
 <07c41571-28ca-6f9e-bcee-899bbf77f687@quicinc.com>
 <sufmykle5inyk73i3qfmy3xqq7plgfr7txiruyahc5wgvvn6uo@kytxtb5zc3tg>
From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
In-Reply-To: <sufmykle5inyk73i3qfmy3xqq7plgfr7txiruyahc5wgvvn6uo@kytxtb5zc3tg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XIv7h7sffdi3Tv5mQvI9td5vzseq8BhY
X-Proofpoint-ORIG-GUID: XIv7h7sffdi3Tv5mQvI9td5vzseq8BhY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=378 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080134


Hi Dmitry,


On 1/8/2025 6:16 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 08, 2025 at 05:57:06PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Dmitry,
>>
>>
>> On 1/3/2025 11:21 AM, Dmitry Baryshkov wrote:
>>> On Tue, Dec 31, 2024 at 05:31:41PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 12/30/2024 9:10 PM, Dmitry Baryshkov wrote:
>>>>> On Sun, Dec 29, 2024 at 08:53:32PM +0530, Wasim Nazir wrote:
>>>>>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>>>>>
>>>>>> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
>>>>>> does corrective action for each subsystem based on sensor violation
>>>>>> to comply safety standards. But as QCS9075 is non-safe SoC it
>>>>>> requires conventional thermal mitigation to control thermal for
>>>>>> different subsystems.
>>>>>>
>>>>>> The cpu frequency throttling for different cpu tsens is enabled in
>>>>>> hardware as first defense for cpu thermal control. But QCS9075 SoC
>>>>>> has higher ambient specification. During high ambient condition, even
>>>>>> lowest frequency with multi cores can slowly build heat over the time
>>>>>> and it can lead to thermal run-away situations. This patch restrict
>>>>>> cpu cores during this scenario helps further thermal control and
>>>>>> avoids thermal critical violation.
>>>>>>
>>>>>> Add cpu idle injection cooling bindings for cpu tsens thermal zones
>>>>>> as a mitigation for cpu subsystem prior to thermal shutdown.
>>>>>>
>>>>>> Add cpu frequency cooling devices that will be used by userspace
>>>>>> thermal governor to mitigate skin thermal management.
>>>>> Does anything prevent us from having this config as a part of the basic
>>>>> sa8775p.dtsi setup? If HW is present in the base version but it is not
>>>>> accessible for whatever reason, please move it the base device config
>>>>> and use status "disabled" or "reserved" to the respective board files.
>>>> Sure,  I will move idle injection node for each cpu to sa8775p.dtsi and keep
>>>> it disabled state. #cooling cells property for CPU, still wanted to keep it
>>>> in board files as we don't want to enable any cooling device in base DT.
>>> "we don't want" is not a proper justification. So, no.
>> As noted in the commit, thermal cooling mitigation is only necessary for
>> non-safe SoCs. Adding this cooling cell property to the CPU node in the base
>> DT (sa8775p.dtsi), which is shared by both safe and non-safe SoCs, would
>> violate the requirements for safe SoCs. Therefore, we will include it only
>> in non-safe SoC boards.
> "is only necessary" is fine. It means that it is an optional part which
> is going to be unused / ignored / duplicate functionality on the "safe"
> SoCs. What kind of requirement is going to be violated in this way?

 From the perspective of a safe SoC, any software mitigation that 
compromises the safety subsystem’s compliance should not be allowed. 
Enabling the cooling device also opens up the sysfs interface for 
userspace, which we may not fully control. Userspace apps or partner 
apps might inadvertently use it. Therefore, we believe it is better not 
to expose such an interface, as it is not required for that SoC and 
helps to avoid opening up an interface that could potentially lead to a 
safety failure.

Best Regards,

Manaf

>

