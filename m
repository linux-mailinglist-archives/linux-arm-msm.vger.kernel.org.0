Return-Path: <linux-arm-msm+bounces-69103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59DB25B50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 425E61BC3FFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 05:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C1D2236E8;
	Thu, 14 Aug 2025 05:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvVOo5Xg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0AA1F37D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755150655; cv=none; b=HttnFhwNPlzntG6d7RfKIVgG4fV+QfCHgo02yaI1PgY+R7RQhvXZiCI1Ty9iRxqTqzxNbhzWJqgldCVd75SUfMG+hXYT4LLvSAY86k0Y/5vAKX/KnK8zTItLt849p26qdFm4nL8fIkGKQQvKZcfwNZN8S3uH2jlPNqXmq4MYlRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755150655; c=relaxed/simple;
	bh=lomnEJ9yPVx44OUpUFVsAUpjLoAdKXlzeGHzBgBZ8co=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCIC1WSrDPqWkQJellzPmef32QbTTrWwPHxevXyURONF4rNKBZlgNLPPCioeNpLwpDzb3TBx3Kmsf2Wqkw8KEd75yT+LYeP9ohKROWeevPQMyuuxwz1iSA6YdiJALGQrQgr7ws4kTgzVtttebk3/UMCdll7ni0mz7L9aDr+dzBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvVOo5Xg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMwVZk030136
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 05:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOJ5RR3PqgCQNdZV6tHlQpMWfAVJArmZDw7MU6+DL7M=; b=XvVOo5XgoxdS+3Sf
	Bq2yXWJ0hiwSTa0MEuZoW4IjIJC86W8OrGPMHs40+cf+tOMSGGaYuKi7i2oPVGqe
	gSWw1VbakLMUewkEiRv1vIbQjopB4W4bdMf67x+MclV95o1iXuDkfsK1sau/aKQv
	VhIikW19P9Bevhi8z17Bu4IrPqlmDJJp4k9OK73+oqjS7XZt9u5HR6yfL8wFwz77
	0gV49EtbSLRjR1YvMPZeSDnV9uKscVy7QYe2Iot+qf+vee8/8A7pjLGkH4JCW5K/
	HorgUiylHUufqpREbDbZCaH+kbcZdkZg5+arxe1Kgc/kbYdf+Mo/szhMVvUp85zv
	DNaEqg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vsb28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 05:50:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445806b18aso5515715ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755150651; x=1755755451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOJ5RR3PqgCQNdZV6tHlQpMWfAVJArmZDw7MU6+DL7M=;
        b=LQJZzOpkaYNkM8sM80xP0Ks7LpyMVTOgqZicXFFsH2R+Dwn4nUamNq0uaruq78EkXA
         6TMqxINRh7z97zYgOF4vVxRn/l0fdBILgYsqhKhYZulFEtZqLOE5BMy2RHAotmbltju8
         UqDZEfLaY0P7P9ALOmQIkAitY5hsplf28zyzpBqIllGnDAbal44sncj5j3fIxW9dEOTx
         mdIbTKvYHeKu/Gs9Ps1t/36P7kV4JO4U1BIoF9r2LfKfqyYfnANRm5Sivs/gvlTsT8E9
         C+fQTfflR3nuuXtwC+xi61T4CRC/uwFHLT8jd0Va67q3cQVHp4MzMb8GzVlZ+H8xjCXe
         asmg==
X-Forwarded-Encrypted: i=1; AJvYcCW6BUa/Ybtlbzwm58/OSqYTx5m8BrLu2jO3m2paa/7aR4+SxgOzvwjoyd3YIr9uF7K0h5TlshYZmEznRFkq@vger.kernel.org
X-Gm-Message-State: AOJu0YxIAt70VdF0RA+zVVM5yaSdVVLG0CKWEcOjwZlJ0zDETnPi/rze
	UCUSnTxx/gzctMHcegVTTb7Ate4PYk1CWJ307wU14yX+Z+zbrND3+kXxZUjySxYGxmuVg7bFTEY
	8dxnurNwCAHsaJw7WRH5Qzn40BraNXN4M72I7bh1XdwLVM2T/vvF7GUw6Epc0Uy8KBSg=
X-Gm-Gg: ASbGncvpw5Rvse5cC+UOZo+tCVEv195iAPqJ8AUPY00TEJNNqNw4cIPCGYHEzEXhsxz
	zh/ioCXBwYmK+vXRaSlVRI1QhbHUvlNCU5VVdZnngjxhqM/h1hUGa4hTcwf5xfnIisxtlXFrPw5
	haYXlxE/YD0IU/wbpMVxSz0isyOtYgKmC1FuYdoQSI2160VYFIV7Wr09xM2yiAmYvSDyIr7fe+w
	EFpI1T0MyFCmPJ0F4TIgJ2xR86mGfP0oxB95vv01O9sIex7HQWAiwGQ26oE4pjHhuWUa1RDw58b
	irB7BS78amTCQzMspA2fV6jvGl0SdDENFHb/A/Elwzo1122Ew/C/y0ibuSe+xnEJK0mDu6/sOfx
	XssdQebA1Tre9sT1k8OMULHyrHuQZR0qa+x8dbg==
X-Received: by 2002:a17:902:e784:b0:242:9bc6:63c3 with SMTP id d9443c01a7336-244586efd7amr26911625ad.54.1755150650519;
        Wed, 13 Aug 2025 22:50:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg+3/0CB4U2pDNP5uuELEloHSNUMx8oZuD+AyTPJ8LiDQNxpnVIDTDJbE8IvvpsAU7Y3B2/w==
X-Received: by 2002:a17:902:e784:b0:242:9bc6:63c3 with SMTP id d9443c01a7336-244586efd7amr26911215ad.54.1755150650056;
        Wed, 13 Aug 2025 22:50:50 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2430558a0b7sm52896745ad.85.2025.08.13.22.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 22:50:49 -0700 (PDT)
Message-ID: <22d6cbc1-90ad-44b0-80fa-c3c67abdae8d@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 15:50:41 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
 <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
 <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
 <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
 <87c884ed-0975-4ac2-a0fa-16e830a57c72@oss.qualcomm.com>
 <8bcb37ed-2885-4f4d-abed-5dd5ec6a254c@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <8bcb37ed-2885-4f4d-abed-5dd5ec6a254c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX4cZojBFuhziV
 lc9z3Ojt/GPBnRElj34rPDp1gnVwb913SzhphZSHXqPetrRUYhID5ud7HPtr+2OhJwiOSz+Z8xX
 9jgig8S9p4fbapnwXjrgEm/zNusI4J/2lYori5/rHHHv4msb4fF6KQc55ovLfbt9i9U+xjJds1p
 bcEADNokrmyCjndyhsJ6th6QT7w2Cg2MBrTJTHnJF+gp94eI6wRBbxiUIKZqYeN5DxCaF1eeGfq
 +yZNGwQVDU+//8rg6tz9Xiou/0Z+clrR3K7orrzrNOc9BvHloOenaxzxjaj/srAImdbaYspJyTd
 cLWmgW/GY2Iw0zxo/ZidBn2ZQAKbC7VT1CS+2t4ulfXCtdp0lGMmvGbBTYOFZ3P6O18HPnaVBaJ
 rJzw9D5b
X-Proofpoint-GUID: tWQiWMDM61RH6Vp7WBExJtHOxnNN-Fvw
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689d793c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=oZdMm6XVNGq0ThNLGeAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tWQiWMDM61RH6Vp7WBExJtHOxnNN-Fvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107



On 8/14/2025 9:20 AM, Konrad Dybcio wrote:
> On 8/14/25 1:19 AM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/14/2025 8:49 AM, Konrad Dybcio wrote:
>>> On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
>>>>
>>>>
>>>> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>>>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>>>> Enable userspace to allocate shared memory with QTEE. Since
>>>>>> QTEE handles shared memory as object, a wrapper is implemented
>>>>>> to represent tee_shm as an object. The shared memory identifier,
>>>>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>>>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>>>>
>>>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +/* Mapping information format as expected by QTEE. */
>>>>>> +struct qcomtee_mapping_info {
>>>>>> +	u64 paddr;
>>>>>> +	u64 len;
>>>>>> +	u32 perms;
>>>>>> +} __packed;
>>>>>
>>>>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>>>>> TZ will always be little-endian, regardless of the host OS
>>>>>
>>>>
>>>> I'm not entirely sure how this point is relevant. As I understand it,
>>>> the core that populates this struct is the same one that accesses it in TZ.
>>>> Your argument would absolutely make sense if the host and TZ were operating
>>>> on different cores with distinct architectures -- such as one being
>>>> little-endian and the other big-endian, which is not the case.
>>>
>>> CONFIG_CPU_BIG_ENDIAN=y exists on arm64
>>>
>>
>> Or, you are saying we may have a configuration where host is big-endian
>> but TZ is little-endian?
> 
> I was indeed about to say that.. I believe our tz is always little-endian
> but you can run the HLOS of either endianness
> 

Okay, I’ve thought about this point and also discussed it internally.
I can add an entry to Kconfig to ensure the driver is unavailable when
CONFIG_CPU_BIG_ENDIAN is selected -- for now. However, without a clear
usecase, adding all the le32_to_cpu/cpu_to_le32 conversions just makes
the driver messy.

Regards,
Amir

> Konrad


