Return-Path: <linux-arm-msm+bounces-38892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8949D66D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 01:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74C0F2810B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 00:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1949F4A08;
	Sat, 23 Nov 2024 00:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djwadoRi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1A42309A6
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 00:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732321185; cv=none; b=O2D9Pab1fWkYQYe+PPIA6T7Okgf3Y2TXE6jK0yVug4kUAKy1yOCvxifDxWUIKiBxGv5Fmwvj1DQlN/Irxr2NfwKfiT+1vZerQHUmpe7a9agvmVxxozG56mJt56ng7XcYoqfCG1gCcjHuEZCVCoVSk1NWj9uiURtLqJjo9SksLRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732321185; c=relaxed/simple;
	bh=W1T4Zed6CRgrZT8ai/WFastdRH0qGAdtmmixOSmvyAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Juuk9oecqlEcZC7C8SMU5t3A0VUb/n80jTxeU7ui+WSWpfytKQBMwJW587pdUx3HS6PosEJF6yERJv2WFrJib12EXANHmWgH+Xmzwqy/Ufb50/sNzUwwglQu+nH7nfL0J5p9h4nKWQKyh5/MAhG/scE+RlmPnUGE+Byj13AL1OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djwadoRi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMD5bP8020827
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 00:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrWWeSVsA8o5gUZSnPUFBeaGhEjYRvTTPyQTwcDpYmg=; b=djwadoRiZsTk8XFL
	Zo+wunlm2QPYNJT5HisVogu610qeXDDgmCf4/GGNdwTXoe27lZUy7T80b8zyYDVD
	MBJdtPQNPxI7DlGOPl2VLObezPvBfgaTfx2CliEzZe6osU/fjfpa4/jwmw1BZ+Vz
	HvLep5R1DFGRqs2wbhb/jhK9p8ZD1s+w13x4zNC3WTP0Cykhdt75N6XxQ5wOTwz4
	IRNo7ZJdpNzEGFzIueZbI0okU3dZJUf9ub3Qoc1RVxeV3KdfRN6e6sMOXl61H6zY
	FUm3p5urONnd3l8Hmiqq+GaiT37GZvFk3aARquWCNbVa/aEwqga2IF7Of7pN+INy
	viSBUw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432thphdc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 00:19:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d41129974dso6992296d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 16:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321181; x=1732925981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xrWWeSVsA8o5gUZSnPUFBeaGhEjYRvTTPyQTwcDpYmg=;
        b=E93PK4VjsOb6xHeGohmY9MQXMTjkmWMcAZWVrFZbfX7WKilQMkbyvslQVi2sJCyGKM
         8e50d7z7nwKBhlmVdd3ewAuZHTTMdYekUxUkZuUgVsJdVNk+fHpKENSs1re1snqA/jvX
         NpslKZfdl4zm5OozXK63Uzgt+vV4AAAIS9H5x7lfEyWV9YbGcm93hTj423QgUVX3/LgC
         GiTd693v5k0iS9kUlpOfDRTHXLJ5oDaBxMXHTBv0Am68R05esouGMGSGW9mXzC2FNkCe
         mWcX5qE716NmLPBvG59s2gk/Z2O5lXht6F2Iw+rk/3sVL2Iw613sv+4TZVGKin5ADoeh
         Shxg==
X-Forwarded-Encrypted: i=1; AJvYcCXjxfJSF0Ijcp1aaiNVkm31TXz9VQM6BS6fZiKZ4k6wB2tqpJ6hEv9cN65d3HeyjOAkkREJicGF2yopDSVD@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtRTfERN97cfOYt4r6EkZc6D8wAqewJ8a4f7PkcJyrkbvfHOF
	B+WnndTIbr0EhrVI78D7IwbV3AOsLuxbnLpWscIFrqxARmGGdI23H7qYhWRN+LFa3voghh+jZmn
	Ucerqfy2slL9fVdrRMqHwvghnlsQ7PVdJ7BFj8gG6qLzxPJ1NlkhOGQas8nXQ0pNu
X-Gm-Gg: ASbGncs0Zf4UXn3WbSNIK7NFl4HO2LZJ3lD1cDjjzizecn67z7mVDljMVSre7XJ3BO0
	/tCD1js7Tdq+jzVuYQl25qfYvcz+qX2ThI9O8UiKSYmrUgAQrNeRxykD6VxD7UXggQgDcnJ+qTE
	rSMSfDbhL7SqKLNakuwmSMXe71cAOnYEjvMLSigM5ilHK21qYlFWwh2VrXotgs9Mq9QaGmGHzJH
	RaSOUSYOP1daBDl28llTn21w2QxiNePUey0ny/W2k9xijJr9euNu41nJfKgmIzz++XKD1Ggqo+U
	MAsTWQGcDMVAjU10Ql644QJpQZZBHew=
X-Received: by 2002:a05:620a:271b:b0:7a9:a632:df3c with SMTP id af79cd13be357-7b51457fad7mr307972885a.14.1732321181004;
        Fri, 22 Nov 2024 16:19:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGqI1WQQpUf2crWgNFFZ+pnTknQHdikQ7GCgw8JwewpNtBbLTat7WrGjpS3Ex4P+Irr7Yh0Q==
X-Received: by 2002:a05:620a:271b:b0:7a9:a632:df3c with SMTP id af79cd13be357-7b51457fad7mr307971885a.14.1732321180610;
        Fri, 22 Nov 2024 16:19:40 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3c0458sm1414240a12.45.2024.11.22.16.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 16:19:40 -0800 (PST)
Message-ID: <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com>
Date: Sat, 23 Nov 2024 01:19:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FmMdwwDx1mfgg1RTVRYUmZkwlrx2zGNY
X-Proofpoint-ORIG-GUID: FmMdwwDx1mfgg1RTVRYUmZkwlrx2zGNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=583 priorityscore=1501 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411230000

On 22.11.2024 4:51 PM, Rob Clark wrote:
> On Fri, Nov 22, 2024 at 4:21 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 21.11.2024 5:48 PM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
>>> helper macro to make it easier to add debug logging which can be enabled
>>> at runtime via drm.debug.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>
>> [...]
>>
>>> +/* Helper for returning a UABI error with optional logging which can make
>>> + * it easier for userspace to understand what it is doing wrong.
>>> + */
>>> +#define UERR(err, drm, fmt, ...) \
>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
>>> +
>>>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>
>> I'm generally not a fan of adding driver-specific debug prints..
>>
>> Maybe that's something that could be pushed to the drm-common layer
>> or even deeper down the stack?
> 
> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
> just #define UERR() to be a wrapper for it, since line length/wrapping
> tends to be a bit of a challenge.  And I have a fairly substantial
> patch stack on top of this adding sparse/vm_bind support.  (Debugging
> that was actually the motivation for this patch.)

Alright, let's not get in the way then

> I noticed that xe has something similar, but slightly different shape,
> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
> length problem into the if() conditional.  (And doesn't provide the
> benefit of being able to display the incorrect param.)

Maybe rust comes one day and the lines will start growing vertically ;)

Konrad

