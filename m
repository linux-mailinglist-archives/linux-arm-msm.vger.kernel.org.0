Return-Path: <linux-arm-msm+bounces-42023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A9C9F0D0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E598283133
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6121E1DFE23;
	Fri, 13 Dec 2024 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/LLZD3S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D01B3922
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734095500; cv=none; b=Kf4qYQrY9VHpwfvKqEOyIxqmGq/dYmXtTUvoTcK+wo9K/+x5ujRaotHK5n00rpl8hO03sS+OuzyBcIBeh2Z4Z9sUDhluBAtSeasXMhjBAEhmQNTbR9SUnbAB3dV74oWGgxgB+1jvmMgZdtK/vNTDtoczKEm+ED2gGJ4Jb1fvS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734095500; c=relaxed/simple;
	bh=FmHIO4MpHGjzcg+u8Kof1PvRCKZhEC8j/Yw3sFoTbSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rx2L5Hl4bk52V/DiX9SJtgKXX0VKHV7E3lFrQLt4KN4NZ3twQ5YvxyojwUAAEZl5i9yFhDWv+RZLJ4rkEYWpBohaCqPdmc9nzx7fKyFbgucZrUB+oC292Bx9TMfRL9Tab+kGpaor8d7Qdgh+SpfNjJRYF9QnmsczohZTNOxgBHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/LLZD3S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9o2JI017727
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 13:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AISjWpbF1IJZMjQ/KiY66//KgqPa1EroTjBzvcG654=; b=X/LLZD3ShUhZfANy
	uqr0/DyvdeaWTRn2gU0XYtUAQ4avmLLvp8Qf95TeyPG6oOdb0HhWcjCCOEhZvkbk
	3vJdTvi1GlyYl9eydChyZcF4GT7VGP4yVplxOQ9iL/NlIcCA8CYsLjOeGIGB2dKf
	Moo8EwrLFXWeActZAB2z5Ch3WYn0zhfRjkHe3C9sk8qucngmxy6mwHtHSfzCUH/8
	WzhywjpfIQShQwLLIUJJiynTCIIq3M07lIdCnScLAd7Usadt5dzeD3nXxz9bTy9w
	ieS4A06n05+wfpU/+7nRw+K/SFDSar6CO3zrR6RBgFsaCRmN35hMdmHCFsDhPzBI
	eullOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjmt0k8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 13:11:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6d50cd3aaso10882885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 05:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734095497; x=1734700297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AISjWpbF1IJZMjQ/KiY66//KgqPa1EroTjBzvcG654=;
        b=IiUpu2JWfrNwf3vCmlXB5D/jBT46PKwrJDh8624Q5HOUxOaz+R/mb5XqANo1A7kM9m
         l965sPJ5XJY5PB7DP7R/qtSSq2qOcMmrgEvnA3RhILRMZ4M6pqPutE/UGVPiOpgtiL2Q
         /AZbxUkC00rceivLLE54CCJwxPLTBFNvXbKNkiYnX2y9VpqIlcUoUKNwg79LJE2RyMFL
         MZGQ3zUHke504IEU8hAWvVieUgLJJhKvqdXZUs6ntugGbawn27VOpLWGs4cJJnHMLclK
         Y/GT5n4QEviwe6hhhOvcbC9+xiGfQjlZ16QNv9aF+HyDLo3Ho5DBPo4RzztIS+5tX89O
         Bi7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdVGkhV4OCJPg8K/rdgrMND4ImNKw9lHtMvO6L+n8lH2R23CaNr23YsK76gMQqDpmkrXwwIXnOaUyvPIqT@vger.kernel.org
X-Gm-Message-State: AOJu0YycUlE0OOmLvwJsHi8ALGk/Ppvk0xo0HG4Lvk4VE/ryjjEh8Xql
	gIzEaO8qSOCWqfnHIuAapJiyv+jjFv2bHKtyAA61B65DGttcEaa8ufRdATqFxajV6rR8OH6vkL0
	TSj9fRNTtIpW+gkUTe+oYjDJiA5O21CIMdVemrkHO2cuJbYhqyYQggMbSwfg6ZNFR
X-Gm-Gg: ASbGncvDKdo+uBN9JA7LesTvYjOI2FBNRSk2QdwoNsd89ZMRd96Wl34JtIQUY3ttZY1
	BrJOHG4yVjWlw1EwffulXuLrfmZ2LU7QRMaALJVlvl2MoaGkiSAWWRPojHj/bB3fhu1seYBzz6k
	kI5gzmomdtrrdxZVa0BBqGDJTD8B990s2++aMjcIaJzZ+zAZsuD5M1Bds5rKmiMYMmcoLhOrqlV
	il3P1ihqQLMncN081hNr0LAwZ2w0l1LHeyaFSikIaRTLfc9WYoonuEKAxF7ce+bEIgsgGfSb23K
	jqEXh4HUybcnVPEY7kbJ0uvYzfdvWIV0Frqc
X-Received: by 2002:a05:620a:4012:b0:7af:cac7:5017 with SMTP id af79cd13be357-7b6fbed8ab9mr131128185a.4.1734095496601;
        Fri, 13 Dec 2024 05:11:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVDJkdMa3HF7ND+pxXorwnRiVDzeerTXyFuekhXDUGU+RDYHlW86M95mXzGzm2rMstd7+ocw==
X-Received: by 2002:a05:620a:4012:b0:7af:cac7:5017 with SMTP id af79cd13be357-7b6fbed8ab9mr131125785a.4.1734095496153;
        Fri, 13 Dec 2024 05:11:36 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa659f14faesm924841266b.101.2024.12.13.05.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 05:11:35 -0800 (PST)
Message-ID: <b792f88b-71c3-4430-b194-0a627de2f05c@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 14:11:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20241121164858.457921-1-robdclark@gmail.com>
 <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
 <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com>
 <CAF6AEGuwjpizRy+S-xCmGdZV9MX+CDACwQp-NNKc2eBroCt1CQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGuwjpizRy+S-xCmGdZV9MX+CDACwQp-NNKc2eBroCt1CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RcPEv5bbJspLHGlSsEx9T2xzD9vT3a2y
X-Proofpoint-ORIG-GUID: RcPEv5bbJspLHGlSsEx9T2xzD9vT3a2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=544 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130093

On 23.11.2024 3:41 AM, Rob Clark wrote:
> On Fri, Nov 22, 2024 at 4:19 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 22.11.2024 4:51 PM, Rob Clark wrote:
>>> On Fri, Nov 22, 2024 at 4:21 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 21.11.2024 5:48 PM, Rob Clark wrote:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
>>>>> helper macro to make it easier to add debug logging which can be enabled
>>>>> at runtime via drm.debug.
>>>>>
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +/* Helper for returning a UABI error with optional logging which can make
>>>>> + * it easier for userspace to understand what it is doing wrong.
>>>>> + */
>>>>> +#define UERR(err, drm, fmt, ...) \
>>>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
>>>>> +
>>>>>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>>>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>>
>>>> I'm generally not a fan of adding driver-specific debug prints..
>>>>
>>>> Maybe that's something that could be pushed to the drm-common layer
>>>> or even deeper down the stack?
>>>
>>> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
>>> just #define UERR() to be a wrapper for it, since line length/wrapping
>>> tends to be a bit of a challenge.  And I have a fairly substantial
>>> patch stack on top of this adding sparse/vm_bind support.  (Debugging
>>> that was actually the motivation for this patch.)
>>
>> Alright, let's not get in the way then
>>
>>> I noticed that xe has something similar, but slightly different shape,
>>> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
>>> length problem into the if() conditional.  (And doesn't provide the
>>> benefit of being able to display the incorrect param.)
>>
>> Maybe rust comes one day and the lines will start growing vertically ;)
> 
> Rust for the userspace facing rendernode side of the driver, in
> particular, would be interesting for me, tbh.  Especially if handle
> related rust<->c layers are designed properly.  I've lost track of how
> many handle lifetime race condition UAF's I've seen ;-)
> 
> Re-writing entire drivers is a big lift, especially when there is so
> much hw+features to enable.  KMS is limited to drm master (generally a
> somewhat privileged process), so less of a concern from a security
> standpoint.  Much of the GPU side of things is "boring" power related
> stuff (suspend/resume/devfreq).  But the rendernode ioctls are open to
> any process that can use the GPU in a typical setup.

The boring part would benefit greatly from automatic scope exit
cleanup.. We've had lots of issues in the past with that (that are
hopefully? sorted out now, or should I say, for now)

Konrad

