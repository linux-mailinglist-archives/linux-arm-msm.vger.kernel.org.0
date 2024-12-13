Return-Path: <linux-arm-msm+bounces-42085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A0E9F11EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8CB5188C8DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E5E1E3DC6;
	Fri, 13 Dec 2024 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+wwqVfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF401C3BEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734106858; cv=none; b=qxegWhHTA0gQPIQxA+KzQkpuIXW+eaiU5tQcyf9UllhSywlpGyzrJ0VFJ9qg/IXA5whTiZx3LbYf3nTtIeIHb4/T24PJUkx4IgD8SIOmGKoEYQ+hTwwywhdUm49n+Zy/OTeEtpKXkEeYAOwgNPaYGQEK02Wd2HnGOLvx9Ww5PjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734106858; c=relaxed/simple;
	bh=9hq1g0pjsoUii6YVzCSmhXuyGLhuos+zyRqM+tcBC40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWnxYrhu01B6vudZvVzjXFOjsep0yFKqrAETC+bZNNmVSyRakr+GJEhKnioQk0qBiOI7RdyfjH37nFl45AStoL5iKrvUyVHqa5zVJK0H+SqhhcTpqFk0VznkmtXS/UOeGlG1R48SnjMCat3jar8xv4BbunE27aqDvIDS7vxs+1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+wwqVfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDEM6UQ018816
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJzNiX6iYpTiDnCLLyKz3UVsvFtEyVBnlS5uhDkC/hw=; b=T+wwqVfVwXu/aRbt
	5d2NQFCt3JJauOjFxhu1kw6riF7ptTYfDmGjQp9urSyNqEazD8Ufe2lwOcrPPlqN
	RPXIS8OLFhcPR/+2WNHfDrUEKWNgMDCImLeEL8g5+Rsv7fmSV9KOpxed9Gekxq2J
	AYng8A8ib5B7U+PxH4IzpdcdO9en+9QYxZBy7YfMNQM5QsEHtL66Are1hYb57HPy
	RnpAhiw6JvI4aGAQtVa3B9DddB1k3fBNLmpLMdIQLIxBmGz2IS65qrURAgL8mE8V
	y9lE5/U82cXIvY3ddpJuNf/CE90cmE5ryvdEYWk2BJCH1PSHzXNmqyYkIG4jmBwC
	XSfOxg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn1vpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:20:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d887d2f283so4890496d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734106853; x=1734711653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJzNiX6iYpTiDnCLLyKz3UVsvFtEyVBnlS5uhDkC/hw=;
        b=up0Jz+gqkOlVjyf7FKCRLOoPyrCwORHI1C2f/7y5WIXTWmML5KnguOtp7BrX9IshrI
         oSr/AVkYPfrP5awYXWXncVqVQCmDb/TtIyX7GZRTecbY6006g/XDM7Uof/llddCuit9F
         wsoQ3toO40gEe72zouJRBuXRtpujhG/lmYiEcITPEmCw93r/8MjNtAyjTIynXVB8ohX+
         nrXywAJ9nYJ1Lxg45pbf79Acg/IsPZd76RaGJOLVchtNI9RsWE6PnE4nwPTrZcDxKsp6
         +bhWlQY9zSidwjUtuP3LV8CkTJYlnJ1cV6M54WOATGtjSXn5JdXC2zS3G23sQwtrfxLD
         knNA==
X-Forwarded-Encrypted: i=1; AJvYcCUFKZqfGLIVbf0KL1Pu2E5nq3kXX1rFCE+HiH4CVntOp+RzR3Ew0EsqIVeppJvuUfWyba9GiJ2WfgU7A5bh@vger.kernel.org
X-Gm-Message-State: AOJu0YxdBHVPt7mpbKpmwGG7Xaan04UF0nai5PuaKi7tIWBDf08+TJ8F
	LAWwLezuezLMrPRKc4cMhkKJG5NKIu/WXEufIcc/bYD8e1q1AKTRbzf7wFOcUTUl7P4z4M99nYO
	oO6kNFDJOv/CvppOsLxH+ncjUA+25nDwx3vC26FDG3Vl2jk/8jTiTLkdaYkanwN9I
X-Gm-Gg: ASbGncspJLBH+CsYcRZdGJN6b3ipv5wboLFCk6UqZgq54IsFufXq0Ngmy0Ocsv0CKvj
	7JhCswuLkvxP0/Rvu5/ADvoJHXVDvxLjSc2gK6ovDLjp79ReVHzgQjMJ8Q1ISGuYrnBXBAIPkIn
	xjgwf7aq2IonYz+Pdx+eQrIxI67fw37hbKbLNZos0lXv/Flb2zzR96c2bNQMfCyvsyg7jLTCttt
	0pcJ9UKNNVEnCdO6NVxoN2F57AOgMbEEW5SPF0/Ryx33r0nwtQl3sDUb0r6eSkYGLJqZxnEqQyr
	t4EOvq3tEAQcgJ5QAnFJJZGa1vXpJze+rbLE
X-Received: by 2002:a05:620a:191c:b0:7b6:c405:b586 with SMTP id af79cd13be357-7b6fbf19210mr160749885a.8.1734106853631;
        Fri, 13 Dec 2024 08:20:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKjgYE2HMUK/BdaPHwAs2/uw9TGCamOV2HO19BbVwzz0upI8ZzF1jYQWfJT7RvYnQ9qDVRqg==
X-Received: by 2002:a05:620a:191c:b0:7b6:c405:b586 with SMTP id af79cd13be357-7b6fbf19210mr160746985a.8.1734106853151;
        Fri, 13 Dec 2024 08:20:53 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa683a0a736sm752537966b.142.2024.12.13.08.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 08:20:52 -0800 (PST)
Message-ID: <8257e193-df34-4060-af51-0097bdaf11b5@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 17:20:50 +0100
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
 <b792f88b-71c3-4430-b194-0a627de2f05c@oss.qualcomm.com>
 <CAF6AEGtbSwF2NVAurJxHwb-D7=SutGtMZ-UQbFAPr0ohDsK1OA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtbSwF2NVAurJxHwb-D7=SutGtMZ-UQbFAPr0ohDsK1OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HqrdyxmIgE0YLU-sTJ6TZypj22agy3Es
X-Proofpoint-ORIG-GUID: HqrdyxmIgE0YLU-sTJ6TZypj22agy3Es
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=620
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130114

On 13.12.2024 4:55 PM, Rob Clark wrote:
> On Fri, Dec 13, 2024 at 5:11 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 23.11.2024 3:41 AM, Rob Clark wrote:
>>> On Fri, Nov 22, 2024 at 4:19 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 22.11.2024 4:51 PM, Rob Clark wrote:
>>>>> On Fri, Nov 22, 2024 at 4:21 AM Konrad Dybcio
>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> On 21.11.2024 5:48 PM, Rob Clark wrote:
>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>
>>>>>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
>>>>>>> helper macro to make it easier to add debug logging which can be enabled
>>>>>>> at runtime via drm.debug.
>>>>>>>
>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +/* Helper for returning a UABI error with optional logging which can make
>>>>>>> + * it easier for userspace to understand what it is doing wrong.
>>>>>>> + */
>>>>>>> +#define UERR(err, drm, fmt, ...) \
>>>>>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
>>>>>>> +
>>>>>>>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>>>>>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>>>>
>>>>>> I'm generally not a fan of adding driver-specific debug prints..
>>>>>>
>>>>>> Maybe that's something that could be pushed to the drm-common layer
>>>>>> or even deeper down the stack?
>>>>>
>>>>> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
>>>>> just #define UERR() to be a wrapper for it, since line length/wrapping
>>>>> tends to be a bit of a challenge.  And I have a fairly substantial
>>>>> patch stack on top of this adding sparse/vm_bind support.  (Debugging
>>>>> that was actually the motivation for this patch.)
>>>>
>>>> Alright, let's not get in the way then
>>>>
>>>>> I noticed that xe has something similar, but slightly different shape,
>>>>> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
>>>>> length problem into the if() conditional.  (And doesn't provide the
>>>>> benefit of being able to display the incorrect param.)
>>>>
>>>> Maybe rust comes one day and the lines will start growing vertically ;)
>>>
>>> Rust for the userspace facing rendernode side of the driver, in
>>> particular, would be interesting for me, tbh.  Especially if handle
>>> related rust<->c layers are designed properly.  I've lost track of how
>>> many handle lifetime race condition UAF's I've seen ;-)
>>>
>>> Re-writing entire drivers is a big lift, especially when there is so
>>> much hw+features to enable.  KMS is limited to drm master (generally a
>>> somewhat privileged process), so less of a concern from a security
>>> standpoint.  Much of the GPU side of things is "boring" power related
>>> stuff (suspend/resume/devfreq).  But the rendernode ioctls are open to
>>> any process that can use the GPU in a typical setup.
>>
>> The boring part would benefit greatly from automatic scope exit
>> cleanup.. We've had lots of issues in the past with that (that are
>> hopefully? sorted out now, or should I say, for now)
> 
> Maybe some of the cleanup.h stuff would be useful?

Very possibly.

Though the main issue is that we're juggling two "real" power rails
and two GDSCs that hang off them (with GX being juggled from both AP
and GPU/GMU PoV), and it's simply confusing for the programmer..

I'd rather delay that until some next great cleanup (tm)

Konrad


