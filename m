Return-Path: <linux-arm-msm+bounces-78703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D1C0535E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA348505B63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4B33074B3;
	Fri, 24 Oct 2025 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnBri4hg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523DC306B31
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296107; cv=none; b=IObiB0r4MXuwC+J70sgaoLYYKjL/mHQu/HOuoyK6iJNT3+J0Ggcip/PdGDQ9aCtMVO/YT4cJyNSIO143w/DH1ggEN/wNXjtodi3C5xmL9BM/bUzzUPnt+7qGRnIpu9BR5r5EQloOd9hbNTdaASo243F18x0QbJgGxntjqb4OPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296107; c=relaxed/simple;
	bh=o9LIHBIMNVuwhtVPKbE8/C7LnK0F6i3Ii4cEm06JTtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ER9l7K+2F1ovOvHXgp8yGoGYye9YePh8TtaoOYBPAEZY5gnJe9j4Xi0xtaJg3/9wXKWxkBViF2wJ1XvWshANu755UYjcWD6n8Sg4udOzB2vpQVFJt1dwAzDqS6vEw0YkglewPe2p4XwSth2EPEmI1krzZiMzFogZNeSGNXnWwdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnBri4hg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FOYm022366
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QLEqj8vg3DpwyQO+fKvM+2N23Csi21bAOUajBQu74n0=; b=bnBri4hgoz4+rBAk
	vFnPyynJEUe9WRgARX+rMqoYM8KaZ/M1MF5QmTz3hudKIaQSTrHo/t25UzM5R1u6
	TSsKSke3zTvVtqMX1P0/NGJTE0x+TvUMvucmFGPsfehqjLeZ7d3xxRSvoOQfDM7r
	8aNjdp0GJ7IZQkkR7ypwSH+9lgFNJrLUZVHXY94O2Fu3ZtH89SXWRC544xixwdbA
	ODR6HqY5EFBZIXxv0JCJaD2tbrbYlL41/J2g63OcWa3DaZmzfQ9dzvHKthGAGqaw
	ZREGW2/Pz2+Ypha/jSoaA52BsObqVMfjKf+vXB6xHpNdNJckD5W33rbyG8mu4BQQ
	YyerDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qncyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:55:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-886eaf88e01so70801985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 01:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761296104; x=1761900904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLEqj8vg3DpwyQO+fKvM+2N23Csi21bAOUajBQu74n0=;
        b=an+i5jlEFgJ1yLd+fiGKSy9rC1TkmNat1p7N7ekpbV30jdN+ZM1kYldNRiOvkoh2u5
         t1zOIBKY9vjZrnNoFtxrxRPGXAoPw6Lzq5dPcBfcbSlZPIXkGBCYB1pr1YKObmXrAPcW
         vxm9Jz7dWCoiSPyw2dZ5LEJG4GNBtaBLWbUBdZux83GGMgh4ZTorkS2EhgH45I/0XW4i
         qvJOS1Om2D/YF7/8m3pJF3gt+AuPmxBb2+5PQ4k4bk70oqwZW3Ss4vQrRTv7qT/sCxjm
         njfXLHg0bdNdaGcSy6PTVMSbT+yUwseWJO0n4ERMAAUh/inUvl0045qZq6+qPuvPhOZ8
         2g+w==
X-Gm-Message-State: AOJu0YyvBnb2ZBrR13pIMtGvC453q0vrRXMYBl6Uv1PeOyTtiT3gOpl/
	YOhs/tPt5wfI+neuG/zVNI3K6JLYikhU2q3qHn1P6nvTV+mTNlwrYngqMhObwGHN8Lsshra1yFS
	H7V6ZKnIluu2/iaoNqv/LTmAOfbUicPZegCsktoJTDOed0N1Q2HxLACqcivtRaUig0X1S
X-Gm-Gg: ASbGncu6PMg7MGMi6IpkTwsy6ei/Oze68E5e3nZ5nwlkpTCGqECt8sH3cs7TSH3Zh1w
	ojspp6XmVR6DyLkJrNTJ3q9knrqZVugMClbrXprE/RoXakPfy6VSfciHLdBiWLUlPqlK08nF3C7
	AbO0o15PiH4pJfrIq94ZwtED/x3mprgvJvw/VgYMejrnxdQq0BFSi7aJR9z4Zvw+p/KpPHcGcDd
	mJWAV9/rPBCey51+e3/REXzaAFJRJMrMwoA6RqNDm3aoo705W2edVVOTBAvFFT0JP8DgCtpOOco
	hZhQrwf28Y4LkUJCNEwEjZh41sfLY8r/nPkXurzVawpIsaeDnUgkfHA/+hHCuk0+Jcq8uv+mkYM
	HIQ2JU4Qf85k6ri05bjNi9GFTqSxTGH84sm2YlfU6EUDokWX6YmXGbES9
X-Received: by 2002:ac8:57c2:0:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4ea1177c509mr118203741cf.9.1761296104181;
        Fri, 24 Oct 2025 01:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWZ/AyCKsRVq/DeeaOVV3qlQdtXKIx3PeDH8Nx8c0mJpXsDEkee8YBg64b/7qGPs+6AarhGA==
X-Received: by 2002:ac8:57c2:0:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4ea1177c509mr118203471cf.9.1761296103588;
        Fri, 24 Oct 2025 01:55:03 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d513199d0sm462820166b.37.2025.10.24.01.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:55:03 -0700 (PDT)
Message-ID: <c79c55fb-3aaa-4256-a71b-fa86cd0166f7@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:55:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a
 driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
 <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX3Vbzt4YBA67q
 nknUtcH5wfpDF/2cJA/I/uBljpK2uWjtvCyMXQ6xjg0+UcVzUm9PpFC4HfPZWe6o/I7tXwZ+Al4
 lLSKxjzuxCMGmKnF1cAt1deoHYkeL14h1dt50d+Fwx7bGmTc/xMA+eZTH/EaVgRt/OPpZLDuuZ2
 o6/xXGgkkXF1mFfaZD1dKe2klBKVcHydykip9dHc4nyMMZcYW3TB8xJnfh8pZZFm+GbYcZuUoNQ
 kusmFo9da52izjEEPYnDUYSZBMtnvZ53ho+ZIwM2q/RRrtfZLdXKXEcEFbG5y/50KpHD9aNfCFj
 MwyllyGUjCHDwNx8sgNRuin82fZaRV0d48ZtfXXaIlDZuhKnxGtsnb1Xk4sHEyZg8pTFNDM4bPc
 f3KwpExxifTXIUrQ10Wg69rVBjaiUA==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fb3ee9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=5e8rntOtLM__4sLSfr8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rWciagB9eLmnul7UnGijZKgjxaiKNWEj
X-Proofpoint-ORIG-GUID: rWciagB9eLmnul7UnGijZKgjxaiKNWEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

On 10/23/25 10:27 AM, Neil Armstrong wrote:
> On 10/22/25 19:09, Konrad Dybcio wrote:
>> On 10/22/25 2:44 PM, Neil Armstrong wrote:
>>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>>> full performance:
>>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>
>> Does this *actually* cause any harm, by the way?
> 
> ?
> 
>>
>> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
>> to a pair of GCC clocks and GCC refers to VDD_CX
>>
>> and I see these prints, yet:
>>
>> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
>> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0
>>
>> /sys/kernel/debug/pm_genpd/cx/current_state:on
>> /sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes
>>
>> I'm not super sure where that sync_state comes from either (maybe
>> dev_set_drv_sync_state in pmdomain/core?)
> 
> The way we handle the GMU so far is wrong, it abuses the driver model.
> 
> And this is a symptom, whatever the impact it has, it needs to be fixed
> in a proper way.
> 
> The sync_state is retained because the gmu device is never probed but
> has some clocks and power domains attached to it, which is clearly wrong.

Yes I agree, however I'm only debating the commit message claims of
'leaving the resources in full performance', which doesn't seem to be
true

Konrad

