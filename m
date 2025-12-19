Return-Path: <linux-arm-msm+bounces-85779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC75CCE9CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 07:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B44F3007940
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 06:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924942C0265;
	Fri, 19 Dec 2025 06:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyYXxxxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftHOAQP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4571288513
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766124491; cv=none; b=PJna4bt4KalRsYZbZOL4GtmuqS8AjFI8BSdHwoL7XMKdp5/CtXlIlNmbY9Z516oyi4Rby4Pv/EQn/4cL/4LLyJBEJxxjkXB4wiWawfrtSTuNoZORyion5IuyLz8OBjpsauOLYBNErPDsGm1elI79ozwHrfQzzWxVFMR53Gngyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766124491; c=relaxed/simple;
	bh=YrWw4SI1dfd75aFnM1ITR4tExGnN65Poalmp4RXc1ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhDujzKVOZp5eKMg0hueBFC6bAax+yOg4/Y6xiVX/Ww3SWErL9M3kuB9OuWDbmpJiBV4Zenkyg4nrYLMqBykZmasmwYGKoFk3jUIvyJGVdpQxZdOFsjNWjE+v4trAjhKDwxReUZBjWyAwDz10cIzJ+wDsmG6A/nAKNMbDgBoB+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RyYXxxxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftHOAQP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cLcw3976261
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWh8Qa72FRBPny9J88Lzhr1SBSaB2jUL90JK9UwCbFM=; b=RyYXxxxqHNA7rmmq
	1L2Iz9FyV4Y80owj9vnwaL5rfqvHxwhA3nCt+amUw+koCadpTuzH/EZtdoDIs8EP
	rgTaFP0aRXeohsmukVszDJ9Q2RtFlXfKnnHziX0rPAj/j+SwPw3AYmskaVkyWcKs
	lkN6d84AGZn4Egf8wi4vSgqAIlgbTuJlCZ58evM4yE8Vh2SKr0/gzuougcn1L2FU
	M7ge9jZW5AeiqhQwPT+hM4eMrWwdCoaSEuzkUxfW0bVww19QU5t7VVabJ+PP3CeH
	2lA2aKhsiqVHsM2m+hayoo54gr6t1gTRtNk95pxIQHcO6Zp/16ovVC48iCAeeJQn
	WmzLgw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fhdu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:08:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a4b748a0so29967915ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 22:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766124488; x=1766729288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TWh8Qa72FRBPny9J88Lzhr1SBSaB2jUL90JK9UwCbFM=;
        b=ftHOAQP2018htMFXAxX667bSh2TeyR9m17KcpII/n75TCys7VDjD9cJk+OkmevyyuD
         zFLX+Iut+nxwTfiyHJ1AC162o3uuz92qkXXBe97ShXE+jjXU0ZMrlZRxoz/vuDCzHWnq
         s+cceQykoBkmrRl0g6jv/ezftnCtGjinSLyuCBENW/+sSaSHERIzdQNOripzJeDX8/K3
         IORJJgjXlRu8TNzBIo3Y3bu0/HSVYJh26qJ2E4yxFTf83XvFZL6tak4qWlPDFjWPqoQv
         oNFP7HUZmabS99c8XTV2xz5VhSJeZp5cZHVPxdr+TKGNw1pqFPsCbJBZ7TU65i5xRQzJ
         7uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766124488; x=1766729288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWh8Qa72FRBPny9J88Lzhr1SBSaB2jUL90JK9UwCbFM=;
        b=hpD6bkev1opM5BHE7Gy6mJYUNCmm+JGizflqtmzMw5Kupmn6HQmVmyPRXCIJ9zblHP
         GNl7eYBnJNglkL7JBrKJ1PxtvcfbrpiwVNyQGAFhcO45ma1PrB7ZGu3A5TTUPbkfHiPW
         n0m8G67NXDm631whIrQfXBQxu7kX44c/VLzSddleFmVYdOUJjoe6tDCbLJ6b4qlbk2dA
         dsMVJzHLbuf/3OqlJfgjPWwUfL5+9td+6XvrUtpKUyqPSUQ6BtbhY9zbHgXhS852xK1q
         9+3xuGyPGvgtyRoPTmhYOlhBD9RkSUli+6HfBhzWvrGdd1OffN8Z5fP1i9iToMrmr8Pv
         9/4g==
X-Forwarded-Encrypted: i=1; AJvYcCV+PVMaa/kNZrMwVj3+fQXBPst2QYueYL4szFPZ38DDCRUOvO/I1+Se+z8099wdEgEEg52GY7jv/E+EQOP7@vger.kernel.org
X-Gm-Message-State: AOJu0YyfvuOsAcj4p6onKxgD24LzOmC7jZz0vwVySCxf1wRDYZKq6aBk
	IRrE7O5Rj12tO/jozhx7OlMA3kNi2LCrPqTSG/Z0zd3k/MKUJOay+BAcyDNMtiquJDA2emGb8k1
	dHcWqTj1pHBEBoHGnP8VrQBjjHkQXOqgPY2HzciP9EFWoAoOFABvgi3yBZhkxc5jWnFDU
X-Gm-Gg: AY/fxX7rPDJiy3flpJRbsMKe2hF9lZcEwZ8HlKdgTr7xbbyDoBZ3d0CMXRyyHIuJbCS
	O8/7l6BM2dx9OHpnilQmAlN06v6sKKTEt+WIXgQP5i6pMggroYw5i49ov6OHCvyOn8xHOnc0hbA
	JEVlp9ATp31S+khrrNUBwVsGJGjY5VqxVPfoboZDLbGqrfqTzZaQgZtNT9Jb7WHJf7hQR47a3Pl
	DXa11/AR+NZ5TLdIVhImTej2GBfWCdvaywgF2bP3cK4SMJxv9xgxpSYZHMycjeoj7j6D89+nr2S
	8aVUNJ7K9hsnvt8aJWfMd1QFdJoBD4LFmqeRRCbWiUnyf58KiyO5/r4JAequas+r33vd2sAqxkG
	4DNxPV+cnSnQnT1KMuwlmHRGWAk5G7d9l3iGAPC1CsC9ltHi0goCRyg==
X-Received: by 2002:a17:902:cec1:b0:2a0:e195:b846 with SMTP id d9443c01a7336-2a2f2c4cde8mr15179365ad.54.1766124487675;
        Thu, 18 Dec 2025 22:08:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQXB5CVxSaJpBpO5pjk19ga0Lctdiga/JupI5qOZaVLXRyMv6/bonV7xtXiHrCO33TC1CZ+w==
X-Received: by 2002:a17:902:cec1:b0:2a0:e195:b846 with SMTP id d9443c01a7336-2a2f2c4cde8mr15179135ad.54.1766124487103;
        Thu, 18 Dec 2025 22:08:07 -0800 (PST)
Received: from [192.168.1.2] ([122.164.83.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66834sm10846465ad.9.2025.12.18.22.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 22:08:06 -0800 (PST)
Message-ID: <12e266a0-4bc2-48ea-a188-044dd0d0cee6@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:38:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] dt-bindings: mailbox: Document qcom,ipq5424-tmel
To: Bjorn Andersson <andersson@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, jassisinghbrar@gmail.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, konradybcio@kernel.org,
        manivannan.sadhasivam@linaro.org, dmitry.baryshkov@linaro.org
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-2-quic_srichara@quicinc.com>
 <20250328-lively-axiomatic-starfish-f9c0df@krzk-bin>
 <321e1d4a-5aa3-49cb-8a85-e05dbaa08e78@quicinc.com>
 <2b132133-9c03-4b7a-b59a-e0f701dfbd01@quicinc.com>
 <vqije2t5ckhvquisgioidjhjfc7km7ro5yqfavdx5y3hy4rzgj@w35xlablr2by>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <vqije2t5ckhvquisgioidjhjfc7km7ro5yqfavdx5y3hy4rzgj@w35xlablr2by>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=6944ebc8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=k5tsjmQ1/71dLoadEnSjAg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=cYer0cE70J3eX0A16ewA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: n-zmElLcLzeF4awjEZdvliLFidg1UHYk
X-Proofpoint-GUID: n-zmElLcLzeF4awjEZdvliLFidg1UHYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0OCBTYWx0ZWRfX10urrqtrbZhK
 f3Sd13II2Odwbk3taSH7A5gtoMB3NWkdxnArZhrf72RgzpNWCvMtDBLAm4WdOYSiNITFYhRtzyW
 KCpNisCF5fbRUbHn/8+0Q3kZaIe6XhoBmfAv5CfuuONkfTSMrOZMkXuMg9l4/40lw/G+o04Rfmi
 8XVjVko5xWn1h5IEhPmBy2mfZpqb/Z7MN/Hjq4urE5BeaoTNPrezHZ8s6N1Wcowta7K8FGaM9d1
 s/wF8Sl02dn+t9GOtgsKG9ctzCzJcfdoQ2g3ZAR76M3Xn2YZ6cxQT5M8jKCerK5eI/Sh63jwbx3
 umW4Bkzckh1Nr1BrNMtrosz94h3RWZPg5SL8bTSdCF34EKFOuHw57k8lK7Vms3McLLyW5iAb/Ce
 my4r18ZpFWGmHsd3WVGFpLV/DoiVbVVV8SFFYtbbsmA6DilDZZtVcUQGHFrfMYHPIj4njX7di5t
 Et5PtgJt0FjGLzLEt7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190048

On 12/18/2025 9:56 AM, Bjorn Andersson wrote:

Thanks Bjorn for the comments. I will be taking over this series since 
Sricharan is moved to other team. I will review and get back to your 
comments post new year vacation. Thanks.

> On Tue, Apr 15, 2025 at 04:38:44PM +0530, Sricharan Ramabadhran wrote:
>>
>> On 4/1/2025 12:59 PM, Sricharan Ramabadhran wrote:
>>>
>>> On 3/28/2025 1:32 PM, Krzysztof Kozlowski wrote:
>>>> On Thu, Mar 27, 2025 at 11:47:49PM +0530, Sricharan R wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - qcom,ipq5424-tmel
>>>> blank line
>>> ok
>>>
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  mboxes:
>>>>> +    maxItems: 1
>>>> Why mbox is having an mbox? This does not look right and suggest the
>>>> block is misrepresented. I read the diagram and description two times
>>>> and still do not see how this fits there.
>>> TMEL/QMP secure functionalities are exposed to clients (like rproc) by
>>> registering TMEL as mailbox controller. The IPC bit to communicate with
>>> the TMEL/QMP controller itself is handled by the apcs mailbox. Hence
>>> it looks like a mbox inside mbox.
>>>
>>> Alternatively, would it be fine to fold the IPC bit handling in this
>>> driver itself for doing the regmap_write (instead of connecting to
>>> apcs mailbox separately) ?
>>>
> The APCS provides the interface for triggering interrupts on the remote
> processors, and mailbox with NULL messages is how we expose this to the
> clients. On some platforms this mechanism is exposed in the form of IPCC
> instead, i.e. another mailbox provider.
>
> It might not be a mailbox, but it's the closest thing we had and it's
> what we use everywhere else.
>
>>> Also, there are couple of other ways of designing this as well.
>>> Earlier i mentioned this in the RFC post [1] for getting the design
>>> sorted out.
>>>
>>> [1] https://lore.kernel.org/lkml/20241205080633.2623142-1-
>>> quic_srichara@quicinc.com/T/
>>>
>>> -------------------------------------------------------------
>>> Had the below mentioned in the RFC earlier.
>>>
>>> The intention of posting this is to get the design reviewed/corrected
>>> since there are also other possible ways of having this SS support like:
>>>
>>> a) Make TMEL QMP as a 'rpmsg' driver and clients can connect using
>>>      rmpsg_send
>>>
>>> b) Keep TMEL APIs seperately in drivers/firmware which would export APIs
>>>      and QMP mailbox seperately.
>>>      Clients can then call the exported APIS.
>>>
>>> c) Combine both TMEL and QMP as mailbox (this is the approach used here)
>>>
>> Hi Krysztof,
>>
>> Can you kindly provide your suggestion on how to proceed for the above ?
>> Would want to align on the design approach before posting the next
>> version.
>>
> How does the TME QMP interface differ from the QMP implementation in
> drivers/qcom/qcom_aoss.c?
>
> In the AOSS QMP case we determined that there was no benefit to
> abstracting this interface through the mailbox API - and a _hardware_
> mailbox doesn't take variable length strings as input...
>
>
> The concept of posting variable length messages onto a communication
> channel resembles rpmsg, but at least the AOSS QMP is a single-channel
> mechanism and there's no mapping to "rpmsg clients" in this model.
>
> Will the TMEL QMP interface be used by anything but the TMEL driver? Why
> should the TMEL and QMP drivers be separated?
>
> Why is the mailbox API the proper abstraction of the TMEL interface?
>
> Regards,
> Bjorn
>

