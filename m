Return-Path: <linux-arm-msm+bounces-69079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E08EB2574E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 606329A75B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DFB2FC86C;
	Wed, 13 Aug 2025 23:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8zOzJHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DD2C08BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755126492; cv=none; b=qD4D62Gcbv9tjRjcHoxv/C1YLZV7dTEpaB8C72614TUrkJleJrkjFgcbLklC238fk7INIkab7B1jHRZe+/fzidAiswJZ/Xedyn9rIdvYrleBH33CYGl//EHm13e1tXkURvl7dm3hlzFlZisUxdzGLCgq4VMiCy+tguj7Rw6OYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755126492; c=relaxed/simple;
	bh=dZUMsPsqmDcein2OBiKoR7Gxr/AXiObKpVab7TXGqdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewdWdf6POrfKlQi+C7OSIDer7xHFUhdZJUxQrDBM90TxPiXZVY1NklFg1NtNmMelf7asPjxOjtoAgqfGa8pmeTGiipGpU27OnYxNuuN342ljroNGcCsc2cJ7CpXt9zYSN5nCt/LtBhgTHx/+He8rFxobzrErJV0c8HHucFD0118=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8zOzJHE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMdRVt020573
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcBAK8eEeC3gYozyTRH3zfy0KnL/G+SterUWthRRl60=; b=U8zOzJHEoKmIQoET
	t4wcKyCFI4yA7ChPpRqtIZQQBQYhyHrWSjqOlZWfYSpUyY5Whw7jdUvGQ4uwLXz5
	m6tZJLWSeSkAZNn0z3M6uztHqlpsjd/4NqB8zlSEz65n3qqfkYMPMset8EKCxqOK
	4iOUP5Vu1pT75vbH8gxV1pP4tJhOfyYzY65iJ+XX5JbsXtXIuXwqyAKx77lfnqoN
	6mNNV3auWxk7Qx+aESf/UqpEybNFf83IBGLkWIknnFkCaAK6787ixCAXyPDPfB4l
	QdQZnybKpgRUJUJDa123Glpx5gwFmI/fNh1vPNXdpRBH+Yo3orQ6+VnyQROj/uPX
	ceGGyQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmdf9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:08:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32326de9d22so333274a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755126487; x=1755731287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcBAK8eEeC3gYozyTRH3zfy0KnL/G+SterUWthRRl60=;
        b=LMv5bFo554gFG3KIFLlYiHqw37kjarrwTUCoN68V9sZBBj67wka6C2vEHZCJ2UNdbU
         x8iRCp/M9qPcVCG0VtPt7boz3fcnmheGTbpQ9np0rYL15NlBd24Ror1cXlv2DumIVsh9
         V32Ge7xYGdWWs9/UDezeIjlh/WvFoghduNJjfSJJFZV+JroqvdTSfqS0DGY+362q8aPJ
         JrcqE41Y5M3gtYsMb1AGuOEgyUMI1BhUaSMXQtdt8si3XgvMMxYFHPp1AeCSPoK9Qdoj
         d3suLH4gmNuL0cwmfp59ZxAR7Su6ZrzJGZbOSZACZnEnRO8e0qTk06WqPOP3Q428EA+e
         oGYg==
X-Forwarded-Encrypted: i=1; AJvYcCUn5cyRiJiAolOAxQoxGFY+tzoQbAnHTkXyyqCO+Ry1B7eu1g9J9TFNjZw/2Fsq+RBCiJonlZJywobHIvag@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/wlm8q/DnwRw7CUhYpIFEpgM1e0RLo6E2KcyWFbKAwdf3tLAK
	mg84BexaKZTEnhBmHtDSKceNrUHJhWFcWf+aUsFIXECyRqZHhsZpwihYodxYanheVEjJMT559Oj
	tJvA0yC5ll9n5SS12DcUsn5aunXywJnhD8+ForqHY7iLNyMRgF2kAyTSOOGwiBpQOVkk=
X-Gm-Gg: ASbGnctoY02GqfOlI4gbHPL+8g/LUJ66U8nOaeEeLamEyass8Eko2FkjuEbkuQLDTWD
	/kWZD5LD8jibJpOT/yvv9IB+kzr+BHZC6//O+/Gp5lMO8SgOO5BYtWR75B6ZG1D+0Uv+WZctrTY
	usb9asGI+UbVe2uZePwNXr0/ld+gf7Xo/geSvWKIsi+e3iO6+cMkiXdBrr2Fx/yhVpxOPTIptoN
	/ls/HIZ2r5qjNBO0oV8T/ei49oTHRemQY6a3HGJyyDb3xuuKd7nS1D3IDok9xkPsm35zf5jDCs9
	4RKKFwDUzg1B0aVuub3UEdo0bSDAQfjyDGwxJ7MbqchT+/TpJsxtXMmuZZCEzG188BcgEVQx68L
	gWoZ5C2l2GKQ0JAgdNg+Cno1z2W9XxYDRp4hKaw==
X-Received: by 2002:a17:90b:580e:b0:313:d361:73d7 with SMTP id 98e67ed59e1d1-32329ae3857mr664178a91.13.1755126487057;
        Wed, 13 Aug 2025 16:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAb97Pa0qtCkny2T4Bm3SgwY7hxlZeUaAqrAvqEuROtklAwf8KwhQzp8LvQNNm/xytIym38g==
X-Received: by 2002:a17:90b:580e:b0:313:d361:73d7 with SMTP id 98e67ed59e1d1-32329ae3857mr664147a91.13.1755126486585;
        Wed, 13 Aug 2025 16:08:06 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422babfbbdsm28366124a12.35.2025.08.13.16.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:08:06 -0700 (PDT)
Message-ID: <7aa7035f-d2c4-4c00-bc46-2e98d4c2641f@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 09:07:58 +1000
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
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXz9maGB2+mQxw
 vUCnFZ48s4mSSmb3zsbW0eYTzWmC+GXXEiHMfpLWsOWjhHe8++8b6bUkbfd8OCtmn9JkfIvLhzA
 9zdVeXPtma3IGj8iQXe5F1PVWnuThSqSUhH3pEwgqbZLOOejsMwluAsh5Op/a4jvvFv5CrHNBnW
 lwZJfVb/1vRwdQuN1mmwl1DzmKNouOp8rmGk1QI3+PCLihiwClZpz5qAmds16YmC9CY2n7rtGhr
 h81D7Iu1S43RaqoYz2BDP7Hy+CTkyU27pJpElPNlOgx06SvTMo7XLZdg+HpSK3mvud8AlE/mqxP
 Up8MgKiiUgS5HlcCAoBEWt0wEWl57Dpw/KfKk4wIS80AhEUY3rY++YLQ4+9RwDg2nKOYUhCXplO
 oKhrpPxy
X-Proofpoint-GUID: -rAYP4aMmRCbmxr-iDFBPop4365PwZUV
X-Proofpoint-ORIG-GUID: -rAYP4aMmRCbmxr-iDFBPop4365PwZUV
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689d1ad8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=AwBIn8DhAZiLWRgty54A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119



On 8/14/2025 8:49 AM, Konrad Dybcio wrote:
> On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>> Enable userspace to allocate shared memory with QTEE. Since
>>>> QTEE handles shared memory as object, a wrapper is implemented
>>>> to represent tee_shm as an object. The shared memory identifier,
>>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +/* Mapping information format as expected by QTEE. */
>>>> +struct qcomtee_mapping_info {
>>>> +	u64 paddr;
>>>> +	u64 len;
>>>> +	u32 perms;
>>>> +} __packed;
>>>
>>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>>> TZ will always be little-endian, regardless of the host OS
>>>
>>
>> I'm not entirely sure how this point is relevant. As I understand it,
>> the core that populates this struct is the same one that accesses it in TZ.
>> Your argument would absolutely make sense if the host and TZ were operating
>> on different cores with distinct architectures -- such as one being
>> little-endian and the other big-endian, which is not the case.
> 
> CONFIG_CPU_BIG_ENDIAN=y exists on arm64
> 
> Konrad

That’s not what I meant. I understand we have this config value,
but the argument is whether, in an SMP system, we expect one core to
operate in little-endian mode while another operates in big-endian mode.
I do not believe that is the case. Then it becomes irrelevant.

Amir


