Return-Path: <linux-arm-msm+bounces-44735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9EAA09080
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 13:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7C6D3A5209
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 12:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6941B20C00B;
	Fri, 10 Jan 2025 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhVadb7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6120551A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512278; cv=none; b=d9m5h7i8z2NfQnM98CYYAiGzGz7jda352Bi7Oj1CHCizrUKE2iZbngIfnEFBRGqkpaHYU7jh4KGB4AEoglo4ryEgSTLtFO+EwysEBoVW5idc5UJPTtfafbPz6ZFk/5fdph8Flocw5JCTUTR8dMym5RM/McaZoOxzoxcOhvFLqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512278; c=relaxed/simple;
	bh=rMrwqgxlfciuSu+bRhxb7i4mncPieLH6nku+s5dI7Dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GewIuOATqbUF1cmfEs2MhbaPVn79MR9GrhVEZ6ByUpxIXJKvyUBodruqaW/oMKmj5JwFW0fVnwepZlJK+kU18GawU4k+c4aySHAbSnMFVoRwtnMGKTnsyqW5YfOMcQ8kU9L63AiyFUG/gkKiKn5TDun/X6kpb7ghteC8R0Q3O1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhVadb7p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A8eYL6004224
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 12:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PX0Ev9gANKBP3sx3YbqtVYsQ6wt/qp1gc3XGy10hIck=; b=YhVadb7p5BslF9Om
	C6H/vcXqU0OQioXOudzAwTeXzqRlGt9GUIOcRDeWFswv3RfrKzXa0dPK+fBB7Q3h
	kXKcL0uS3rdyv9WkzSyOlkPfSDz1yGHCtP4st6RTKA6Emw3+iHMPeOZ/16IYhRGC
	BGnJpEa1y1kbzaELZKp/KGyxFnDCAYoI+oaN24CAFb3EBc46HkRATHQcUamC65TP
	+/DuQDkQ1g0Tbg8QRvDs7SNEUV9UZL2avzn8V9b3wl3DrGZJ19ZzRXJDuupCNeWY
	LjFobp3HIm12RtsFscDSXF/hj9Qsq8cRi6icjoXb/elu/cyApDTcNRUb7nbZJY3M
	vp9W3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44308f8k5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 12:31:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46b3359e6deso4206751cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 04:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736512264; x=1737117064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PX0Ev9gANKBP3sx3YbqtVYsQ6wt/qp1gc3XGy10hIck=;
        b=PpMOTaFRbTV9tKBGObp1S+G1w8PMa+YB2P21ZgsEzT3542/5NhUEe/s+QimdhSePZz
         Z11flgQjy8gbYpuJ5aKqRQ/JfZhcCr0SINukKpaHdRzBvax4KEARFhn7EjvLHBIXyyGY
         AVcuhi2Z6MoEjQXqlQuGjcfZhT0eWkYE3Nmpxg+wjPWjhJz8ar12VKnujQ9kh0O89Y1a
         iDatxv2137nrlFGJJ28vqFoGer96lfMedPBqF22AfbAoHJzE1AhiyxGVPpmbZ1a9IrMj
         yeiFl5go7NMMoOI7D3K1vHHndUmlBygcZoNtQ0L6PtQDCKxQMQtnopJKfqI1EAWVsB4p
         Mh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYtUO5Z0e0DtOgxC4QKDngmQjwG0S9cj3UYPlMEJzmO/LC5VNHssJOnPlvR2L8pXYvLfWUOfMkuGEkz/7c@vger.kernel.org
X-Gm-Message-State: AOJu0YzeVUOuMNWDjqTch2+fMsiGFu1Xi+c+a2eNSoK7T9XWDFhIOAOw
	uRlm+r8fNTjkEkmrkUg2asu1TBONg2fc5gzQC7zS97bOuyGcAGSWlzCKXOX0GJb5t7HkInWEEe9
	Q/jCP+gBdOE3eG3pt1xhig3Hg+wuUtUxV1cgMDjp81Z2sv80+DlaWUPTGURY6anKv
X-Gm-Gg: ASbGncvmCVxXMF1pY8j2LTpRDtRQyMKoiecDNO0qyATR8adtPaLu8+n1qyvEPuHi6rL
	QmH3pBsZPs5Jv6ZzANtGoE26Bbil0g8qqBXMmmGCHJw0LcOpvsH+oOF46Q5giQZx26uHxz6+mAC
	6HjkUyuYV8Ul4LX2xTmpnmMTeFVmz+QuReotk5zLZL+KIt4xVnpOiXINCiYmB7T0KzWrij7Pe0W
	/5CpGgGr6ky2pS1sSP6Vq3CEGTGvSAdRhw5v2qles3oZUgjsHBxzB2N9OYo+sHenrD1BYjjzQjn
	wHrP908FW1nkbqFiRxoDa8HenK0KfP4aS1Q=
X-Received: by 2002:a05:622a:1a0b:b0:467:652a:afa3 with SMTP id d75a77b69052e-46c7108fd9dmr70068801cf.15.1736512264482;
        Fri, 10 Jan 2025 04:31:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJzrcWqw0doihUt3gWiNwBbsjfHXaH4TJQ/3ZRt2H9w06ZhIyYaVQ8PCr6hJpHLe9odeetqw==
X-Received: by 2002:a05:622a:1a0b:b0:467:652a:afa3 with SMTP id d75a77b69052e-46c7108fd9dmr70068501cf.15.1736512263947;
        Fri, 10 Jan 2025 04:31:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a411csm1604300a12.72.2025.01.10.04.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 04:31:02 -0800 (PST)
Message-ID: <fdba317e-abd2-4620-a341-568ae497622e@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 13:31:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Cc: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <zn4uf3mmlmt3who474hwkr44poycfqtjtidshybbg55a3hr63y@zxefqbhiwkbg>
 <d54c6706-3c6b-211c-6acb-fa3984c30c67@quicinc.com>
 <ubasbsyspn5euygihgphyw3xg4ckveytvgnjpwdiyg4pv7degr@6y44ya4gvaqj>
 <07c41571-28ca-6f9e-bcee-899bbf77f687@quicinc.com>
 <sufmykle5inyk73i3qfmy3xqq7plgfr7txiruyahc5wgvvn6uo@kytxtb5zc3tg>
 <cf2ad828-d00d-133b-f310-1688fc0ed59b@quicinc.com>
 <6zftdu5myuporxsvxlxhojnlhnfa74pjj7nvy3wmiaw7jdsuo2@3ebcpevzvtlc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6zftdu5myuporxsvxlxhojnlhnfa74pjj7nvy3wmiaw7jdsuo2@3ebcpevzvtlc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9CJYCPhhAGwXtxx8MH3eik-ena3Ju5lQ
X-Proofpoint-GUID: 9CJYCPhhAGwXtxx8MH3eik-ena3Ju5lQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxlogscore=978 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100098

On 10.01.2025 12:54 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 08, 2025 at 09:38:19PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>>
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
>>
>> From the perspective of a safe SoC, any software mitigation that compromises
>> the safety subsystem’s compliance should not be allowed. Enabling the
>> cooling device also opens up the sysfs interface for userspace, which we may
>> not fully control.
> 
> THere are a lot of interfaces exported to the userspace.
> 
>> Userspace apps or partner apps might inadvertently use
>> it. Therefore, we believe it is better not to expose such an interface, as
>> it is not required for that SoC and helps to avoid opening up an interface
>> that could potentially lead to a safety failure.
> 
> How can thermal mitigation interface lead to safety failure? Userspace
> can possibly lower trip points, but it can not override existing
> firmware-based mitigation.
> And if there is a known problem with the interface, it should be fixed
> instead.

I think the intended case to avoid is where a malicious actor would set
the trips too low, resulting in throttling down the CPU to FMIN / Linux
throttling CPUs to try and escape what it believes to be possible thermal
runaway / a system reboot. Not something desired in a car.

Konrad

