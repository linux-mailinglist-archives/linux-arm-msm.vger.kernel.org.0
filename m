Return-Path: <linux-arm-msm+bounces-82316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D78C699D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 59018290C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48F5326945;
	Tue, 18 Nov 2025 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwiZvw1p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUNtCT1j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351ED2F6569
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472955; cv=none; b=csxdh+BAys8uqwYAaSPtLo4rbPOk1CciXPhj+jsTXudaA4AJOwSXkiDgwqyy6TcIv2ds+TRaBI5rjO2NLxO8G0WV75YX7BvyRo49PpJIhKqLR5YkOa+Od8Ubi5M0bqUx2vmOqODKZun3vqQ/ivMtAminkYPV9n0RLOcxC68y3qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472955; c=relaxed/simple;
	bh=qB9ZhelquLeX/47JmPfyRupStQRSoMTp6VRGQjPcEAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BntcOIt8tuZnmsiu4CbBXFpwwgxexCxPxf35heUo86Sph0aQ68DEPUiMBBAxCZ+X94waIEKEoaABMpREYyqyy3inwhyyyQ00npRM1N7+Kzui+EtMCojclTrFSbpbFlqaEB74lQOSaPPNP0Vfb3TAeK4Nio3crOmkGylWNjsiybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwiZvw1p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUNtCT1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rLih2664775
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnPI+HvRCXHtDrr9MXHrsjdWCFalSnw5mTh9evIOeJM=; b=dwiZvw1pSJE/Grhw
	HJLYohoJE/tE3hqI2z9myan7EXkTKrpsrp5iiWmH2eWqe/p6LTvD57U3Zj80KZY+
	pszgS1llZ5I6c1r8vGXWQzcMdl3EbzGvYzVRUbz1x1IUFbYfz/CsSjLwY68jnyEI
	dvAr+rgwTNMCedd87Xhef8v8jprP0wYcrqmCUsSgEFr1Ra21sVdUN0Xy4AW0GoRu
	4xNmEhEQ7CSgTtIkT4VRvXx6ZQLnGwU2ul4Cnc5ujy88ZUQ1G/nxokjQgdTL/oe8
	7it8ld9jgLeQmF+5I+JCCyRElF4Y6sNqRVF0/e3NPuCglFFILhkHRYhQ64/RhAIm
	4xWBeg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk8jfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:35:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8824bb12211so19628466d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763472952; x=1764077752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnPI+HvRCXHtDrr9MXHrsjdWCFalSnw5mTh9evIOeJM=;
        b=BUNtCT1jnEpRoA2s2J8/o8WfkbYYWrX/NDXHxjYS7d8gbpzX3QywnW2Ip1V1iNXutg
         Bw8kcxlDwL+OL7eUXudXWfw7t32LIVH+1oYMHr8hu9c4n9q/mykEH+YDqxpAfHV91ItI
         VHC+K1q70a5fsV6X0vZCkgH61MI+z2OhG7oiWWSSo/BGTGZ7RDutq8rBQ884f3A4RJpN
         O+0lWWQ1bWOo2mo8yYFs/rjOxJCgVq4QjPdIT8kgURS4ZEmH8LUYVeEZnyd8v2IZ3+SU
         x9stDB6bV+mY2HP50yOxhNJOCWK+XENGvFLv51ej1EtG7Os0bxiJpE0hu6lfGf4g96Cg
         2SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472952; x=1764077752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnPI+HvRCXHtDrr9MXHrsjdWCFalSnw5mTh9evIOeJM=;
        b=Ihy/88+coAl9vv0kAqTtavrahmOlBPfNc9YdJEODWLXClKgeMjP8XNqrNG6cNU0G3h
         KRoxJ84FuAveJe9xwnSgWc+3Dz4Esa/50iwYj6MpE0A6fgrwM/q+4uakTrLjQg4NttSE
         9zUYLjOZuJ5YKjBKKpQzoKlAax4LK1gJTFZlcytXGzJBOEGk5nMCzeBUH3fbSPDjCP/n
         YHkr/MWX+kC3t+RWqESGPwxqaKeILvqu9RTTNrAhO4dII8kPnSJPwnRGSWSR+7TfHgcQ
         VZJDzVpKiHZRy5LxWlLwtFU/Y6c0XLAnN4Ja3ye6MPVP8CquyKWos5de9KC0FXkSm4hj
         Tj/g==
X-Forwarded-Encrypted: i=1; AJvYcCXlNm2FvmpkjouEqtMqrb1veXMm0OkurV8yntKJY2LZrLJ2vK9kthnFCy3XA1HzVoEfoQecHw0rb8ltZUPG@vger.kernel.org
X-Gm-Message-State: AOJu0YyBsjiitwYJyGo0u5BmAis0vI5PWzUGF2nD2j8vAyknGxb3nJjS
	a8SzscH0nQXjDXMlpyvOKqnZC1/WxlxSO3JcUOmaERJl7dR4xYBUQvbIth6NHTBezpJVjjIZRSf
	9d8KmnaQE9Dt8lP6Dr67DLcdTcHb91UKGrQsGway76QHebCJCL6uxiqkrGWYPSHKwW8C3
X-Gm-Gg: ASbGnctuv2KNJfHD3NfkF/n56JiJix3AMFLQ+bhYFLVgJ+yy9sVk0xvTRFfLhCLQNtI
	LOdZpx4qmeyCNRjNYhmG64Js6pqjfpA3/wn8ervvo0vqSngfNjwYmWD1JRaH86serVDZoHabxu5
	PEO3gDQD5pvUkWB9nXEqVhId+uQb99MorvmFgT0Fs0sJTSQmxOxf/YmPQKIUKCwI0BNPfLvFMep
	P+4Sngnnmton1lhKgR1RsF3aqL0tzWNrBP5NGpPzXRXmch3VBwFyzWtvr4EbhgSZK108RMBdk9E
	FcwCAluTVO48lu6TJu/G9G5wzdgehI8v/S+VKDXT7yQXyYQzIPq70cBL8c6+Ep0ptYlCtzOnsB2
	PdBKTm0p36+u/uR7NW2FIDxfClJ3CghaGoPbBW1VvAct7cKEv8YF9T5DtqkuUawgK8I8=
X-Received: by 2002:a05:622a:1a19:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee317fa73emr26551661cf.11.1763472952274;
        Tue, 18 Nov 2025 05:35:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY1KZXSYMRxPN6HY6CHGoASb9AG9wqGfmmmqFipQhKzeaiMu/659NOr1Ib5Am/aZalUkf8vw==
X-Received: by 2002:a05:622a:1a19:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee317fa73emr26551291cf.11.1763472951811;
        Tue, 18 Nov 2025 05:35:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734e9e0f20sm1371741666b.0.2025.11.18.05.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:35:51 -0800 (PST)
Message-ID: <0d0e85b1-a70f-430d-b75f-a74cd19f9895@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:35:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
 <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
 <1488f09b-63b7-4412-ba56-28b1c81528ac@linaro.org>
 <a874d12a-6da4-4a2a-bea3-20c69bd53c6b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a874d12a-6da4-4a2a-bea3-20c69bd53c6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GxW11mzpW6iVKvyDp94OJvNzcRFRJ1OH
X-Proofpoint-GUID: GxW11mzpW6iVKvyDp94OJvNzcRFRJ1OH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwOCBTYWx0ZWRfX5hAcXw2kYpXu
 lfAIko5MQQgZGJmeaFdrrZAA3JULvmA+r5c3quWoOHHHrEEkKtHP1XUe7f6PUvt/eGg8IZRjhqm
 6E3B0vTSDSvgnMJMeYtjj6LDNNLOIm3ZPVEEkVjWlTKQY7no9WRSLhMO7jwVrP8wXhfmvAxlG4N
 /VvWJHjWs16fv05bUz+JAKyO21JJDpgVIDbbUSsLnq961idJJNvgkV0Xk0BanLUBNEw2EOQGGuY
 PJP29ajohvJQDH2Ss0RDAR0utZh35sividN7tHt7SyU8WF7/VDRsQAI7+ir0JX5wX14BZEg5WOY
 ZeFwrtUKYrmTOgAUP3B0yV0jOFLNbWNU3qfHIXIVGWzcIJqTI9LQ6tzHOfjpTIGhqQTLYKl+HtX
 U7XRZMDGLOuPkVVVvy2YAr4n5sJqZQ==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c7639 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=sUuaTTKWZZLiqq4pnuYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180108

On 11/18/25 8:47 AM, Akhil P Oommen wrote:
> On 11/17/2025 9:17 PM, Neil Armstrong wrote:
>> On 11/17/25 16:02, Konrad Dybcio wrote:
>>> On 11/17/25 3:51 PM, Neil Armstrong wrote:
>>>> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
>>>> if still deferenced in a7xx_patch_pwrup_reglist() which causes
>>>> a kernel crash:
>>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>> 0000000000000008
>>>> ...
>>>> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
>>>> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
>>>> ...
>>>> Call trace:
>>>>    a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>>>>    msm_gpu_hw_init+0x58/0x88 [msm]
>>>>    adreno_load_gpu+0x94/0x1fc [msm]
>>>>    msm_open+0xe4/0xf4 [msm]
>>>>    drm_file_alloc+0x1a0/0x2e4 [drm]
>>>>    drm_client_init+0x7c/0x104 [drm]
>>>>    drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>>>>    drm_client_setup+0xb4/0xd8 [drm_client_lib]
>>>>    msm_drm_kms_post_init+0x2c/0x3c [msm]
>>>>    msm_drm_init+0x1a4/0x228 [msm]
>>>>    msm_drm_bind+0x30/0x3c [msm]
>>>> ...
>>>>
>>>> Check the validity of ifpc_reglist before deferencing the table
>>>> to setup the register values.
>>>>
>>>> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>
>>> I think it should be fine to skip calling this func altogether
>>> if !ifpc || !pwrup_reglist
>>>
>>> Although ifpc && !pwrup_reglist should probably scream very loud
> 
> That's correct. It is a weird combo.
> 
>>
>> Sorry but why? pwrup_reglist was introduced way earlier than IFPC.
> 
> Pwrup list is shared with preemption feature too. And preemption support
> was introduced before IFPC.

Sorry, I somehow erased that from my memory

Konrad

