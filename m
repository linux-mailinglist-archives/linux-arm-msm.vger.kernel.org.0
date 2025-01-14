Return-Path: <linux-arm-msm+bounces-45035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BD3A110FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 20:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 352303A26E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 19:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7F61FA831;
	Tue, 14 Jan 2025 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c9WwzZIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BF81E495;
	Tue, 14 Jan 2025 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882227; cv=none; b=ZgXZvytykwyrmogBeIUcMu7jdHSMrEA/92AK8X4Og8WWrx96aFYYvn024sx7169N3NHCN58TWcKFdLZsjmHsiZQ5U/6qUyfpSiSk84SzA/AaPiSc02U8nsS0aJO7ZyyCU/hjFKP3Z5H+t5luHkWejo0w+DMrbswxEuqHQmQ4hnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882227; c=relaxed/simple;
	bh=q6St12cBv9/YbZBMRd3A/TZhMfvZN62XYhmMKfi+e3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J2/DQZfsXOZkkfmgDGooAntEBVGuier/ZKoYFk5V+Y6qAWitsGEPawHBWj/9a1F2yNY6QHtl902YfJZLLBDsETscoVzI4rnyUH2sruUs6xCbZl7Dl3mgGO758DWkviviYXwfaDNVScFfSqft170E2Tfnj3kTviyg9BQaa9OCSxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c9WwzZIM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EB6wVo020703;
	Tue, 14 Jan 2025 19:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvH5MxOQWfzipKrRsqcQKh9TilVu01gtfZrL3mlBN8M=; b=c9WwzZIMxcz6mdAR
	QY8YSxigRpBPeWLmt3CVuIjwE3I5XYS+ogxxhEYHV3Av7y8sYk+vI8WUkdevGQIW
	POg/Fy39vMdJkG1s1UtiLaPU9HyYlhWGzGvzlTFIKA4sCVeglBz9xkZmJgvUtlHy
	4hKeg4AQmCZFGR8AabDOas29H31SwJllmtKX1Xfl1et4ItqUqp6P7pptmWNVPN0r
	foImK5QYuuZ3WBD/RTmTx37Nbh1reyTaH8z4Cs6fQ60ifcHw6ut0CAmIwqVs/UWJ
	IUToqn9Wwc8F+dNTmpwIJ8thR6e16uyLP8Y3+Gs45HtaQhTpFmIsJhWa0nt9IMqT
	1B64Ug==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445ntx988r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 19:17:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50EJH1XW026962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 19:17:01 GMT
Received: from [10.216.9.61] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 11:16:54 -0800
Message-ID: <59d087c3-1a4a-782f-8566-313e8355216c@quicinc.com>
Date: Wed, 15 Jan 2025 00:46:50 +0530
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
        <kernel@quicinc.com>, <psodagud@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <zn4uf3mmlmt3who474hwkr44poycfqtjtidshybbg55a3hr63y@zxefqbhiwkbg>
 <d54c6706-3c6b-211c-6acb-fa3984c30c67@quicinc.com>
 <ubasbsyspn5euygihgphyw3xg4ckveytvgnjpwdiyg4pv7degr@6y44ya4gvaqj>
 <07c41571-28ca-6f9e-bcee-899bbf77f687@quicinc.com>
 <sufmykle5inyk73i3qfmy3xqq7plgfr7txiruyahc5wgvvn6uo@kytxtb5zc3tg>
 <cf2ad828-d00d-133b-f310-1688fc0ed59b@quicinc.com>
 <6zftdu5myuporxsvxlxhojnlhnfa74pjj7nvy3wmiaw7jdsuo2@3ebcpevzvtlc>
From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
In-Reply-To: <6zftdu5myuporxsvxlxhojnlhnfa74pjj7nvy3wmiaw7jdsuo2@3ebcpevzvtlc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CPlkcTwUd9fEdnwfJ1256MQWE_Tqja0q
X-Proofpoint-GUID: CPlkcTwUd9fEdnwfJ1256MQWE_Tqja0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=518 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140147


Hi Dmitry,

Sorry, I was busy with some other priority tasks.

On 1/10/2025 5:24 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 08, 2025 at 09:38:19PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Dmitry,
>>
>>
>> On 1/8/2025 6:16 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 08, 2025 at 05:57:06PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>>>> Hi Dmitry,
>>>>
>>>>
>>>> On 1/3/2025 11:21 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Dec 31, 2024 at 05:31:41PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> On 12/30/2024 9:10 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Dec 29, 2024 at 08:53:32PM +0530, Wasim Nazir wrote:
>>>>>>>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>>>>>>>
>>>>>>>> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
>>>>>>>> does corrective action for each subsystem based on sensor violation
>>>>>>>> to comply safety standards. But as QCS9075 is non-safe SoC it
>>>>>>>> requires conventional thermal mitigation to control thermal for
>>>>>>>> different subsystems.
>>>>>>>>
>>>>>>>> The cpu frequency throttling for different cpu tsens is enabled in
>>>>>>>> hardware as first defense for cpu thermal control. But QCS9075 SoC
>>>>>>>> has higher ambient specification. During high ambient condition, even
>>>>>>>> lowest frequency with multi cores can slowly build heat over the time
>>>>>>>> and it can lead to thermal run-away situations. This patch restrict
>>>>>>>> cpu cores during this scenario helps further thermal control and
>>>>>>>> avoids thermal critical violation.
>>>>>>>>
>>>>>>>> Add cpu idle injection cooling bindings for cpu tsens thermal zones
>>>>>>>> as a mitigation for cpu subsystem prior to thermal shutdown.
>>>>>>>>
>>>>>>>> Add cpu frequency cooling devices that will be used by userspace
>>>>>>>> thermal governor to mitigate skin thermal management.
>>>>>>> Does anything prevent us from having this config as a part of the basic
>>>>>>> sa8775p.dtsi setup? If HW is present in the base version but it is not
>>>>>>> accessible for whatever reason, please move it the base device config
>>>>>>> and use status "disabled" or "reserved" to the respective board files.
>>>>>> Sure,  I will move idle injection node for each cpu to sa8775p.dtsi and keep
>>>>>> it disabled state. #cooling cells property for CPU, still wanted to keep it
>>>>>> in board files as we don't want to enable any cooling device in base DT.
>>>>> "we don't want" is not a proper justification. So, no.
>>>> As noted in the commit, thermal cooling mitigation is only necessary for
>>>> non-safe SoCs. Adding this cooling cell property to the CPU node in the base
>>>> DT (sa8775p.dtsi), which is shared by both safe and non-safe SoCs, would
>>>> violate the requirements for safe SoCs. Therefore, we will include it only
>>>> in non-safe SoC boards.
>>> "is only necessary" is fine. It means that it is an optional part which
>>> is going to be unused / ignored / duplicate functionality on the "safe"
>>> SoCs. What kind of requirement is going to be violated in this way?
>>  From the perspective of a safe SoC, any software mitigation that compromises
>> the safety subsystem’s compliance should not be allowed. Enabling the
>> cooling device also opens up the sysfs interface for userspace, which we may
>> not fully control.
> THere are a lot of interfaces exported to the userspace.
>
>> Userspace apps or partner apps might inadvertently use
>> it. Therefore, we believe it is better not to expose such an interface, as
>> it is not required for that SoC and helps to avoid opening up an interface
>> that could potentially lead to a safety failure.
> How can thermal mitigation interface lead to safety failure? Userspace
> can possibly lower trip points, but it can not override existing
> firmware-based mitigation.
Both firmware and software passive mitigations (CPU/GPU) are not 
permitted for Safe SoC. As mentioned in the commit, it is the 
responsibility of the safety subsystem to take corrective action for 
high temperatures. One of the safety requirements (not a functional 
requirement) for Safe SoC is to avoid scaling of CPUs and bus DCVS, as 
this could impact safety-critical workloads. Therefore, Safe SoC will 
operate at maximum frequency with the performance governor. Enabling a 
cooling device for the CPU would expose the cooling device sysfs 
interface, allowing userspace to request different cooling states via 
the cooling device cur_state sysfs, which could potentially lower the 
frequency and violate the safety requirement.
> And if there is a known problem with the interface, it should be fixed
> instead.

There is no interface issue, as it is not required and can be disabled 
for Safe SoC. This approach has already been used for commercializing 
the SA8775P, and we do not want to disrupt it now. Therefore, we believe 
it is better not to add cpu cooling cell property (CPU cooling device) 
in sa8775p base dtsi.

Best Regards,

Manaf

>
>> Best Regards,
>>
>> Manaf
>>

