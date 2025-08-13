Return-Path: <linux-arm-msm+bounces-69084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1ADB25770
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A1375A6698
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCE92FC881;
	Wed, 13 Aug 2025 23:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOlzgTDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96A301485
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755127439; cv=none; b=WrlJJLD/WxNNRQWZ50d3NjZig9ZdG3hSeiIcaVKlaE3aCJugK/TNVnpJgxrvCjCIseJo51gMGrgG7H9pJo3RD8yy+NbVexQN62wTB2tOAon1Zx3jmtKg6qd5jIa9fvSOPI8txmuiCouZUwfLIxSezWGUfupLk+iRVxJ5LnzadaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755127439; c=relaxed/simple;
	bh=D66gSkXwljvzFre/FOcNCT6buXirBv7V//dYm97gyAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzU7wuNqV20phe5zeLtXvlrHIugLSv+fw++cbapICMcgKRsHdTCzIjjiNSbzEINcSYtThoY+Uimy8rIqhHee6Lpf0fEUgCmfP+IG7eDTzXh3YqsqBCWWzyMR5IfxWRLXfgij4YilfqpVvwLgRX2OmjwhhFPTURg29kPegWvNv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOlzgTDK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMHT3H002874
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iA6096032O8eraf5ErblJhkD3Z0jA/+vFYM4Vm1Ntuw=; b=TOlzgTDKGLoL6c3W
	60rRpgi2e6BWCynvvUsTJimxfrH1Jx8J+fCpYryKmW7KR/hvmWWF2Jfo4T2p6uCN
	noWNhlxOve1trqDf6IhHj/SMuv0NQfd/FHIVd8oi+iG7+QYRck3i+NtVgSXpU977
	MD2t/VBfUroL47SCDqUCaAGSnHVsr4viZcuBVwSig7q1InVKvA/MDVALiwsF0ME4
	JICcAwhzADnlR0Vr0LDHRdy6A9LPxvYsnxI2o9CO4yneATGRz5mwmSljp6/IeV3f
	q8IFZw4KKqV8sRseqjUy2KqIZEHjqEIXbf7mOOIirlaYQ7B6bEVevDhviQwWLwdh
	9inxbw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv5hnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:23:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24457f42254so6429595ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755127435; x=1755732235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iA6096032O8eraf5ErblJhkD3Z0jA/+vFYM4Vm1Ntuw=;
        b=Nqf+oWuecVtJXRkOE9J0lTdjRST1RSa/Zuj47bQgy104V6R0jPl8FPEnQVn3O65Hb1
         S7kFFP2EDvpmfJrHg3v93THLkAQlSBUtF4L8bcmRruywbDp029QBiJCPFG7hUvVYTXMs
         Qb0VVkEVLYYp1txEkUm6n+h6LMJqfP0DxN46ajAaoGnagugByr3rmlTl2y5xEFPXzgBz
         gg6HW77bZdiK8qskkVxtz4XfblU+0O9I5UCR2+txdPrfp7O+lE6plWVt6rmpH0F6kmJp
         GWZSou5Y3ocb16B5ey+0Aje1CzaFA3bcUB6ZFXZ8pZR8gssrD+9uDufarghlbSX5+vBN
         Vq8A==
X-Forwarded-Encrypted: i=1; AJvYcCUIjaoEHh7qjl9iz0asZne8qsvGxwsqFNJf8/kWrYpm73SIBa5BZ5Znxm+IdwMNP3UBBUZelNOJ63786zHR@vger.kernel.org
X-Gm-Message-State: AOJu0YwkxDsXIAEJ3mPLHDGkiOZVG/YRFV8CVegSwyNgCNdJSMZv/PQu
	h8Vf8f6TJFbA0oggI062P2oY2IqUqmmfgECFLRuaECYXMNZD8dGHgdfahgg1pLJy/ief6tInTOZ
	Ao0kglhbro5fzmAWosasace3g1SVr9/GjHPy70W+Yu7N0oZ2OHPa4RYOGzAaCk6NC6vY=
X-Gm-Gg: ASbGncsazxJEDswrMNpDWZYqgEo2cL+mjVtoakyJwXNBwxrUw2ssO5/Gnpo6BfaVDCb
	rHx7WRq+wzfz5nPYje+rrUOaCsF7DoGNU9ie5YxpGI0+G5zEVh9asNe5IkieBtTsiHPCXVkCJ+j
	lxgvRCQF6w6rBJHtYs/k8TcO6VfyIQwLq6GJHhPoi9Z4AXFL2JmUES/nZs2Wh7Qizx6OQ7oV2h5
	PYuDthFo/GV0AgZbgG57kLR2VLqKh8deIKrcbMpM9iOA/R3BQWQ2XxJi7eNI6z8qGZK/G1rFT22
	cCRtN9VdGyGXl0au6M54cM1L8HU8BQuWyfdQtz3eybQA/tFA7D94S65g5xL4OWTnMJh02lS9gp9
	tRru8rY4F1meptk3OPdNRvLd3zV3jEGyqVBl/AA==
X-Received: by 2002:a17:903:1c8:b0:23e:22dc:665c with SMTP id d9443c01a7336-244586c46fbmr13119865ad.33.1755127434797;
        Wed, 13 Aug 2025 16:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHDCnRh0Js6W0SOu+on6VKjPDQGJcgj0Cg2MJ13k4MfvzHuV5x1VI5U3usKguIYljIv3YAFA==
X-Received: by 2002:a17:903:1c8:b0:23e:22dc:665c with SMTP id d9443c01a7336-244586c46fbmr13119515ad.33.1755127434369;
        Wed, 13 Aug 2025 16:23:54 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b77f33asm28118326a12.5.2025.08.13.16.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:23:53 -0700 (PDT)
Message-ID: <0cc814ae-ea8a-44cd-b502-1f89876e61b9@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 09:23:45 +1000
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
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d1e8c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=pGb8jkpG1LKJgODn460A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aocy8u2W7iNtcuhvdmYtJ7zSwL9aknkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5FhbvT1qK3iz
 uBizXP3each/JtRyERNydIp8nanfEk81WM5Jv4Cnl7CelFFr4u9I0iiQqHco9FgsyhPBuBGAqvc
 DcQauNYkrkW2951vvzDNuibW28uguh4Pajt0w+n/mpufj4dxwn5ML0zMVY2Ocq839OuuZCCfesD
 52ZcX7PN8g2SbpwOTRFOtaJzfyP+Ucz2grerMPuxJPDCGKbuYX8aLx/GPXt5xl2CkNJ1x6IVcUf
 tpDsPL75Osd62YVeZPqYC4Z8PQl244VVQtpS5b9cbVxwdTSOPWRqASUSufNf0DyoMyDoPUqA7rr
 v6NgZ7khKY6NElHz4706nBDuQ5ZZDNMLhoEXAvph0PWIKi2wjuTy+BZotUXISRvXqytZKibcJsu
 hWBn1RMe
X-Proofpoint-GUID: aocy8u2W7iNtcuhvdmYtJ7zSwL9aknkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



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

Ok, I'll update them.

> 
> Konrad


