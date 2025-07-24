Return-Path: <linux-arm-msm+bounces-66506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A2B1097B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239D8189492D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A55C1DE2B5;
	Thu, 24 Jul 2025 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frQzUmw4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5CC1853
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753357596; cv=none; b=QIJ0uufn0sJc8s9T9nM9A2uNxTZgK+tTNzTGC2kzmF8c/YF/QAHfJ0fnWDDyoyZew7W4QawxDoPQJoFLzxIfbsEBs48dYVqWK5UZGALCS5f87OQtfC921iXXPgLvbUEdeVI3RDtkAY4ks37TWfAI4JJTxhGELKaVLG3QfXoh1j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753357596; c=relaxed/simple;
	bh=/FGjupYue3yt5l/qKRuWoZ1t5XoeHaJlH6xIoC7bsaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZnT1AkpmfsSHfywRPcQ6EwJgnxFOVD0hVkTjs2VSOhqT/lNwG5GisV5ep7lK2XBvlPlZ+zH6m2TILrvsuo7jqaTWx4FSTvbnE/P2BPVPJs0SyVMdoOfhbMt5yl+IvmBYwEKc3b1T+PAFlgca7onKtchNa9e/ZYgBeI2/iwwOJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frQzUmw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9XO6b006573
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLrYulJ1G5wKAXlR97Yrx07n3cFEqdg7AeV4aB+OSos=; b=frQzUmw4OQ/nyaxi
	DifxPVH1JstwaB7Ltf+ncVZTFUqweuUbvRPYUH2OlWSTMkbwHklOX2WoiNoZ914p
	UKYD/Nd2hLbE2HtDBzxvkjhdhcrshgkwLn7dYJhoYfCzme4rMPpBNEcb/+szMm4V
	vY7M5IBnuwxOTOsJCxpmvEHbHwpnF00EwZqf9Cth8ldzJtgBQ0bMA2dhPqy1UOLz
	WmXwD5MBzXi8OiQGK6BRXcXq+a3MeFL8aaxtUrXGnlr4Ksogi2UFC9/L6JVjXP0B
	2zVSTp1/QNS3sv2EFCKmXqyibGrtX1LVh+9c1u7jLX5p1qwrgI6vILXo2bSmqaXy
	ls+HUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qgkhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:46:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7de3c682919so18283885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 04:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753357593; x=1753962393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLrYulJ1G5wKAXlR97Yrx07n3cFEqdg7AeV4aB+OSos=;
        b=g23EwkWc0EpIHzNKeezVVQbkzGJsBnlTNi+f3ZEUoIsxufZQjfTtsQWoCVdH8Wc5wv
         E+8xlxnd3Dm1Z+M5+tl4PmMLLg4zU4xyDapY5kIkYnWWj3xyxV9TMfxD7brXI4OceBq+
         vRWljp67YteDmEl78FQMJkpoxw4BljAOcLSoIPvw3jro7D9037hyxeLB74lWI77fq887
         zG1IPXlagCy0TFFWdVPAh51GZETF2fUSl5fTNre7v8iTt/RdqfZiAckXVGYrIwob3MrL
         Kdc/+oKadHs4fAL6Jw8LeiyCGDfE/2hqtYzdJNYr3DtrynBYZoG33PW+gv35rpTp3DIb
         Llbw==
X-Forwarded-Encrypted: i=1; AJvYcCVYZ5I2bDhGybTRORzgvND+kFR5llTq6HeJeoVl2yrVIWgsvO2iGH98cOg3ZxWYXcjEcY4511GIxeoMV+U7@vger.kernel.org
X-Gm-Message-State: AOJu0YytBOpaXMnwnh/EVu3CaNmPkWpY2AF+3nTsk0YYItDtGfC7jAwM
	F19TSRT7IqT5njVTqwja9Wq8TJ9ij1XOQoUfUwhL5HpgZzjsoQ0cJfgLGKm88P5KQtRtEUIXJif
	aIu3nvQzlz7nPM3hzShoOCvDnZoHXILPOXApB6yrZzqmi4m1yjBntlwealyOQ0XZiUMBm
X-Gm-Gg: ASbGnctQPFcgebY041cKn9FAhGLWJrGrXVhPVk88OfGS8vebQiNOCiC6dyVgBuNtVx1
	SGksV+bC9Zrq6dQEnR8MTy6qx+bNrxMegQ6lBxIzZbL9PhFdve0RXkRxcFRv53xTw24skf4aqFc
	4p7xJdIbO1kCZpCf0Pt7Z0xEP/rhjzHiqqKU2WxmDv2jSMZ+ddVN3PxyLERVAwOf+yoWO3WQ7wT
	CWmCZLDb60qnLEvGLAhemoS5Oszz5UpcNPQNpjTd+IbsDGP2r3pQuOfwLSbygO8smxMLueXxfwf
	OsLGE3bUjh7IQHKGxk3OEB9IrmulhoHuKVxkrvHZSL/eUP5KCz0Frshopzw5FvH0UFF++mqaP8/
	KJw7lmlkUUA1vJlBcDg==
X-Received: by 2002:a05:620a:462c:b0:7e1:79eb:18a3 with SMTP id af79cd13be357-7e62a153087mr339853485a.10.1753357592555;
        Thu, 24 Jul 2025 04:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRFI8LZO/kxL2pkMtgYwoe0pvQX0WhY72KM+q23vQZMuy34RvG006zcOmvJhV+CLGyBp1TWg==
X-Received: by 2002:a05:620a:462c:b0:7e1:79eb:18a3 with SMTP id af79cd13be357-7e62a153087mr339851585a.10.1753357591935;
        Thu, 24 Jul 2025 04:46:31 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f861e8bsm98426766b.113.2025.07.24.04.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 04:46:31 -0700 (PDT)
Message-ID: <1d320aac-e928-4fd0-812c-268a3a943575@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 13:46:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
 <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
 <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
 <d696e7df-7f11-4491-89ff-ba71274ae101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d696e7df-7f11-4491-89ff-ba71274ae101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4OCBTYWx0ZWRfX7shL3gKg39Rg
 Rq6d4PsaqwQiIhBI2eG1w9jJTk4Q5/lC+3Yw+1K0GfV6zeDoUnf1X2LOGq8faJr8MpFF4m84sJF
 JGuIMq2nk6Zfb/9GE4r35SIx6jAelZCsCid3ERoHdK8jOh6am/MmsEYtiNSFDho0oHoDe0NpAh6
 vWxXTpHtA72k4tgQrc8nep9VCdQozDPGKbFq60fu6hOsntzHscG/xL3O8ekkRpSjmdVNYWLDQO/
 QiHfCeIDyC2WLPP0IzeC8TtIMFHgRnW5msu2MpRtt6uWuJunGwfm2hwJrRhG4YWmAqnUwgg8xNO
 UBvkgZ+F954mgUNaAbz0IZXxCmq8JmfPMjqE66/bHNsHIws2zpPDLF4TzsaU5q14ybEh8x03U6B
 FCzD4LGidZstoK0rYTydx/PERAxoqhzvlHOPYX1D5Tfove7vsJQk60jD0g6LC1/WjWC3Qjjr
X-Proofpoint-ORIG-GUID: SoUx1jTAB5V_i1F0DrpxfOO94CvOYVU_
X-Proofpoint-GUID: SoUx1jTAB5V_i1F0DrpxfOO94CvOYVU_
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=68821d19 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=sJC1-YunKCaHe1VmF0sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240088

On 7/23/25 11:06 PM, Akhil P Oommen wrote:
> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>> There are some special registers which are accessible even when GX power
>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>> wakes up GPU from power collapse and allow programming these registers
>>>> without additional handshake with GMU. This patch adds support for this
>>>> special register write sequence.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -16,6 +16,67 @@
>>>>  
>>>>  #define GPU_PAS_ID 13
>>>>  
>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>> +{
>>>> +	/* Success if !writedropped0/1 */
>>>> +	if (!(status & mask))
>>>> +		return true;
>>>> +
>>>> +	udelay(10);
>>>
>>> Why do we need udelay() here? Why can't we use interval setting inside
>>> gmu_poll_timeout()?
>>
>> Similarly here:
>>
>> [...]
>>
>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>> +		return 0;
>>>> +
>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>> +			offset);
>>>> +
>>>> +	/* Try again for another 1ms before failing */
>>>> +	gpu_write(gpu, offset, value);
>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>> +		return 0;
>>>> +
>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>> +			offset);
>>
>> We may want to combine the two, so as not to worry the user too much..
>>
>> If it's going to fail, I would assume it's going to fail both checks
>> (unless e.g. the bus is so congested a single write can't go through
>> to a sleepy GPU across 2 miliseconds, but that's another issue)
> 
> In case of success, we cannot be sure if the first write went through.
> So we should poll separately.

You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
== 202 times, it really better go through..

If it's just about the write reaching the GPU, you can write it once and
read back the register you've written to, this way you're sure that the
GPU can observe the write

Konrad

