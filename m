Return-Path: <linux-arm-msm+bounces-71173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D193AB3A9B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 20:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9033717605E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 18:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC652236F3;
	Thu, 28 Aug 2025 18:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVtx8NFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A2042AA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756404991; cv=none; b=Yn5u1Fq410Z7dUa+1GbBKrrLBfr+hHD2AFNFKm8VsvtezqJulFvRIGfoS7hFbL2WQ8Wb52UIb/NvbgUfCHFN57p2nW9GP1I6DQ+rTyU8xf1PnXkdV/sMu8ENR3KVuJWCa304GiW/zWOApsUve24hQl+Wq4YDfnRIV+IfgBVY7IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756404991; c=relaxed/simple;
	bh=M3HQCiM5KYRjRQ/WjF0auNC6AvPAf635gqp+hRXNtAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJdF7bY5TheReyXjA4OMFlaBG7TsSppkmvKcj9y3Bu4XcaYWW9ImtfyeO6CdDF9SfJ8FCwZSBvNMDwmBZOKRoavzyD3K0TnS0jEVxRUjnRGOv8xR+epv6Q8sP1Wp9IQkVXXQOMMcFkNgcAkYhq+e3JyGJe8/7AunYRT8oysImuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVtx8NFj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHvBW5006977
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 18:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dNA65guW+NvhqNBWZahbcbYrQpvet8rF5DHP3CXwC0=; b=EVtx8NFjx1LQ164Q
	eIJ/iHS1YF4mwAPftJw3WaMvCLNhprY5B7fMVPbau8TGOEDNCv4NOvTjaitibEkk
	Tq97WF5Q/NbWuGbrDmwNWk2vSCSgzlB682qXOoUrqadK/n1onj8AVMcnlRPJ1mUl
	i6xJPLQMIeglzZHbooj7WSxnvuA1DGutJW9repM51fcOTTgwTDAwygxPmJjUsmOW
	JJyj25m37eJM4zVAlEJ6VEt17pvgllBTuw5pXDLVVIri817kQRYRTJlv7r9dmfCL
	D+7owS2uZ94ufEjCGyGmO+995Qnj/No452TpjL72NAO3NpknkyBnIqf6+I9RlCBq
	fHW/WA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tn67hdnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 18:16:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4716fc56a9so1688364a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756404988; x=1757009788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dNA65guW+NvhqNBWZahbcbYrQpvet8rF5DHP3CXwC0=;
        b=Dt7idYiFFylX231fpCVpc3Ssmt9PDeh+XCcHt8WtqrI1uX8aDA46gSnlpMzv0WGL/r
         M57syb34LWf4dPhUt1zodVNehTyrzezOp5hxMsIJi3wU/ied7wDk11nyMwwZUNxnaXAI
         zFkiyAb2AT55angVIPwJlHf4kMD8b2AM62bQZPS7K/ypt0qQOBtuy/2mgenrjj4Ribp6
         nEFkX6WbjO/droksg4iDMb0mFm56/MjlpYdrpTPGc9DTT48FIrc4GQkPuvpQbKiMWY57
         s+MLVGseK1x2KPsoy/Tj7VmJejUDlJ5EDtxFGusc9KTejLDUjVFB5S/SaUhuP7xKsMry
         g8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBylsuyGfwxtqSdC8BxytFKOswa2I8gvFc/zWBdX8OKTnpMQ8PzZvxA58du6BKS2zZOelYYaH9HvZY8nQu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1NlUFZRGOahGBk3xQvQFvo9rW6i352nOFSpu88jtRPjtKhZCR
	h7RBpJbq1KtqO35g+kBUGM06WgP9bwd/4vQiEjhczQZPT04g8+QKv9jFCegXbwgWptyQ1qosXiy
	4ooskiwCRT75cxmpOjFw9aIS/NVFwdJ3aJRVtvsYODlyA9Zg5CK/7e3y82t8MJYMDjYBM
X-Gm-Gg: ASbGncuyecEC/J9Cx/h8qifL9Pp13PI3xHfHdAPQcPgpZ0JwfG04NGumr9pXUZCU6ru
	Z5kVHxhp9kPOSwQUC/4KwB+xQ336g4IP9k+WKmSzQqnufEj3hABcmD7Z6l+tqpBecCdszgK0DEN
	qygoxmXxMzjikRDQDYZanW3UP0dk2V/Emuboy1hZF5+4I1k+knXjDgtWLNbWJ7sS7RPecyQ2aA0
	UEd9+LYEOLUNzpRGts66ep33T7NWbzccBLAJUtvvBB6jTeJUiX9+jF3iYlutlI7CxIPHcbe35FA
	x6lQhwNb/t6Rk7qbDYQ4utwJCqH9l+M3wMToK6SZi3aS/VC057Sf6kWVeKL+ifw2h0hMZko4
X-Received: by 2002:a05:6a20:4321:b0:243:b52b:c97 with SMTP id adf61e73a8af0-243b52b1499mr3374480637.2.1756404988014;
        Thu, 28 Aug 2025 11:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWc/uGOqMrJNITtI/IuoZY7KUw8N7dOMChku9OrZXXhErY7DhsaxinUs69MN8iRPDDCck2Sg==
X-Received: by 2002:a05:6a20:4321:b0:243:b52b:c97 with SMTP id adf61e73a8af0-243b52b1499mr3374418637.2.1756404987463;
        Thu, 28 Aug 2025 11:16:27 -0700 (PDT)
Received: from [192.168.1.7] ([136.185.228.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006c340sm90998a12.1.2025.08.28.11.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 11:16:27 -0700 (PDT)
Message-ID: <249f8109-31b1-4cb8-a5a4-b30c27b2e987@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 23:46:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on sa8775p
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-2-odelu.kukatla@oss.qualcomm.com>
 <90b51e31-3217-4483-bb5b-ec328665a723@kernel.org>
 <28b97952-1b67-411f-a7fb-ddd558739839@oss.qualcomm.com>
 <ac83c453-c24d-4c4d-83bc-9ed13f2f9d1e@kernel.org>
 <7d3e5cf7-4167-4005-ba4b-c1915c254705@oss.qualcomm.com>
 <00f50d92-e4ea-4805-b771-147fa5f5ebe4@kernel.org>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <00f50d92-e4ea-4805-b771-147fa5f5ebe4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA4NSBTYWx0ZWRfX8Q+dXY33bwln
 Z+kYjlaIe/3O+je4y57iZbrB4kohNlC/Nc7eXs/N7xpgmgOKZcoQfEnIUdKpdpEhCisilZ8lwD4
 JtFz3WgcJFeHu5o0SJJjeEmzMmf5NvJbzy8RR8LHn47lEJ9eVR9Ot78DrJoctuujqjvVKn5jmCB
 quMy26XpFOngPh1rPoizYOtuTCpQM9+hzVWiW3Ar6RO1AZUXObwlol54ggDdeZ7s8IIMebuyUUv
 AflDAhpyglxabb1cLVhJqFYF65bEJBW8dh5CFYemDK/hlCIKwcIz9BfK739o6vhwAXG8Nl9bQal
 ro56xlOpBFcvLmLYs7kcnAD8ee/mM+pXPTdcsoiJglLqQLpkFGORHBblz4yl110mkpFurBiO335
 orn/m1q+
X-Proofpoint-GUID: eTCiiqRCB3aoFRKdWdtF7LPAkLbyzOBX
X-Proofpoint-ORIG-GUID: eTCiiqRCB3aoFRKdWdtF7LPAkLbyzOBX
X-Authority-Analysis: v=2.4 cv=P7c6hjAu c=1 sm=1 tr=0 ts=68b09cfd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=5/7ZUQgNSTcp6WzxQoauSQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=05eQtMsT6qBiqFT4EjoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508280085



On 8/24/2025 2:38 PM, Krzysztof Kozlowski wrote:
> On 20/08/2025 10:51, Odelu Kukatla wrote:
>>
>>
>> On 8/13/2025 11:32 AM, Krzysztof Kozlowski wrote:
>>> On 13/08/2025 07:55, Odelu Kukatla wrote:
>>>>
>>>>
>>>> On 8/12/2025 3:47 PM, Krzysztof Kozlowski wrote:
>>>>> On 08/08/2025 16:02, Odelu Kukatla wrote:
>>>>>> Add reg and clocks properties to enable the clocks required
>>>>>> for accessing QoS configuration.
>>>>>
>>>>>
>>>>> Nothing here explains why EXISTING hardware is being changed. I also
>>>>> remember big discussions and big confusing patches regarding sa8775p
>>>>> (its rename, dropping/changing all providers), and this patch feels like
>>>>> pieces of it without proper justification.
>>>>>
>>>> Thanks for the review.
>>>> I have added description in cover letter, i will add here as well in next revision.> And this is hidden ABI break, no justification, no mentioning either.
>>>>> Again we are discussing basics of ABI breaking patches?
>>>>>
>>>> If you are talking ABI break if we load old DT which may lead to crash, we have .qos_requires_clocks flag which takes care of skipping QoS if required clocks are not enabled.we have addressed this issue through https://lore.kernel.org/all/20240704125515.22194-1-quic_okukatla@quicinc.com/ 
>>>
>>> Format your emails correctly, it's difficult to read.
>>>
>>> Your binding did not require reg and clocks. Now it requires reg and
>>> clocks. This is called ABI break.
>>>
>>> Please follow Qualcomm extensive upstreaming guide, it explains this,
>>> doesn't it? Or follow writing bindings...
>>>
>>
>> Thanks for your review and guidance.
>>
>> I agree that adding reg and clocks properties to existing bindings is an
>> ABI break. The sa8775p is a relatively older platform, and when the
>> interconnect provider driver was initially upstreamed, QoS configuration
>> support was not available in the framework. As a result, QoS was not
>> enabled at that time.
> 
> 
> That's irrelevant reason. Writing bindings since long time ask pretty
> clearly to describe hardware completely, regardless whether Linux
> supports this or not.
> 
> It does not matter if you enable QoS or not.
> 
I agree with you. Ideally, the bindings should have described the
hardware fully from the beginning. However, this was not done at the
time of initial upstreaming, and the driver was contributed by someone
from the community. I’m working now to improve the binding by adding the
missing pieces to support QoS configuration.

>>
>> The motivation for this change is that certain interconnect paths on
>> sa8775p require specific clocks to be enabled to access QoS registers.
> 
> This does not look at all like existing device is completely broken.
> 
> You just add new feature, so no ABI break.
> 
Yes, you are right. This is a feature aimed at performance enhancement
to improve system performance under concurrent workloads.

>> QoS configuration is essential for managing latency and bandwidth across
>> subsystems such as CPU, GPU, and multimedia engines. Without it, the
>> system may experience performance degradation, especially under
> 
> So how was it working for the last 2 years?
> 
The system may function normally without this feature. However, enabling
QoS helps optimize latency and bandwidth across subsystems like CPU,
GPU, and multimedia engines, which becomes important in high-throughput
scenarios.

Best regards,
Odelu
> 
>> concurrent workloads. Enabling QoS improves system responsiveness and
>> ensures more predictable behavior in high-throughput scenarios.
> 
> 
> 
> Best regards,
> Krzysztof


