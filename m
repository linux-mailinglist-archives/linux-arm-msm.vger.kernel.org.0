Return-Path: <linux-arm-msm+bounces-81565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DF8C569E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3BB3BF81E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851DA2D7DE4;
	Thu, 13 Nov 2025 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTwEa0O0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLRQIUer"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351A2D8370
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763026156; cv=none; b=NRqkQjIzm88y2eEVCWYiBetswswQ1M5ujFHCqiNTvvh07xysXqGeISgjpzmDc0zp0loJd7DGcIzF5UXqP86dhR9JekU/013OyrstuMEQzAjPWYWif30jaXmwZgSXJJNkbVKLp8u+mMkqZNmIrvIQogALv3LOUPAFTmy6Ng2C6j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763026156; c=relaxed/simple;
	bh=8MJNIVzao8j2hrbn+0QUZMXmV+Ny6jHql9vsW3ffK/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fj5pBXUsHXZxJjQAvHr1DmfpjHacbWiaOAYprtYYtxpPFT9ioarH6hh/4nJQEYYhAvAEURt7mmoeuCm5dvlj0hzm49YG0Gi7Q7WITMZEKs1d+wKX8I+qUXiIgCejK4aTUqgaXIObJoZN6SX/fFAfMDKOW9yuqzDVjyQOyptpTUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTwEa0O0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLRQIUer; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD9Faos3120690
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=; b=pTwEa0O01ggQkmZ+
	aheH+/m17sgjioEGYcDKKAHqaOCVf9Ch/1rOlFiqgbN8wMlMEssOojpkhNjULEA3
	bmifele/wxUqi/ey7vdSZTQ+OWlIFhL32vvnyzt0SVXs2F63ljSbPcaEJ85OG5Zz
	vNnUQa0Pyj3BkfD4FoQx3nnB9Dih/8AGkiZIHqlitAfWYroWhJvMagRXnaVglk64
	QaA1Ywc8LWOb2r7zDljj5Yxq2VdZyMJWSeVNZTNDIjNKqv3bmDD5++hxbp7H69+g
	CCcJjvk/IIqNDt94IWpVbfYjDlcoZuIONdBk1PG5k9ihEPhCbcBkFK2wAQ+eU+Ue
	Y5HoGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad5pusagp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:29:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e890deecf6so1384961cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 01:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763026153; x=1763630953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=;
        b=GLRQIUerqk5nEXwzxrVOzGCuNxpnZBRPM2OW0t3+a1CWh7yhtKU3GkX0/Mq7cOlvLq
         WBzW7BFdLlpMVFiLe0vSBvwZxghSKMCqHfPajJzjWkpq3lrqCEZIjirXmuSzZsYIkMVD
         EbfA93y4JaqM/6i/VfleVmvLhPuKwRiXspue4/IgqIfvlogRmURyzqTw7nxFtK76473+
         U6lnwErPVqPwXizthMQQ2j6CtDLUxcQuscjec4ojnjYZzfufVWmNWyRRw8cq0p8JcJSR
         B2EFY0GQ60EDiwIbujJq/9tQimYzbo9/9K82dr5UoDaG5QZ2jFNrDJwnXOkbGSDiRvJD
         Gw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026153; x=1763630953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=;
        b=YZaV7nI4OPBA/7pSzXIGbVvw81ZMF+NYx6hqe2nnECrWmIM+CnKVxFvG+vCMilGtkJ
         driD4aLSWFqLaPPhRSCZaJnQNIPbw2MVow6BXYIMGwtqnUTNmiY25dnl5yToXwBRQgdH
         cd30thOrBjIj+rByrYHDYultoBM++DQ2dCLUlztKfKSY/bdNCWmbzvWeXb1/zsMgFiF9
         rovDZsfDSuh9pq3imF4LRLvqFBSMZUzQPw5gtu9/wwm5lKyXoy1sgRLiDVYYdTEFDQgl
         LcxFRYB27Jp/7fy8uk4oM/v1PahYdEZLTPmelLv1Lg++OA+9JPpapancsLn6QqIvWQC+
         piwA==
X-Gm-Message-State: AOJu0YxIjSWWWG6IGh33k/+9irKbjEMkklB4oZ0GXlc6i+aY7vmZT8M0
	EG/KjoEyiox5xcxnuNISqk7Mipbz5AiRosRI9URldaetyJTp3rSRzWifF0mO6n5sW7sTrmdk4L1
	yd/HUmK3B0uIicCGHeME4EhVbjtAO6WUGjGXP3vnYnpqVtjUxgvm4UCMhHl99kZKF8doV
X-Gm-Gg: ASbGncvJY4wRAfYURDMekDtAABd8rG1T3wV4ENtYFjiljBSNp9nNLC+5swUxn4iHfa2
	GMO4UXyt1G8zM3ov6DppvccEK9aJRTmLh6vtRxr22JzJ1MapG38AiKuqdneYKDLPSMcpm7O742b
	RHykSrwJnU5jCqTmH0dyT0o8ZcSFYXtjrn0FJ4JjyBMklyDyTEYCYE/2Cc18WTuzay5oZrPJ18W
	1dSx7muweFGIV2VucBKA8Uhk8I/iZZ0q9MmIQtX9AvUHToRKVZKTVCTzUUp3CNqXdSOOujTJvMH
	n/kpOUccUo5jwUSPGrYLF1f4ys6GnCFlPKDnRPIzqYCHQ+2YYrpmpbxguf0a8oFDCrwNubXIt82
	54hjSbgEhHQ0Tjb6M9vOHqEO5QZbkkvs3UE8jplPaguTM5Dg8l0mtZKGt
X-Received: by 2002:a05:622a:16:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4eddbd65318mr52613531cf.8.1763026152910;
        Thu, 13 Nov 2025 01:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBKglDPCuRYE0ZGVzuJPGPVwQT3YRBKzTtOU5WmAoz7l8pjecUcIWj985OWak6SKf5r+bgQw==
X-Received: by 2002:a05:622a:16:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4eddbd65318mr52613171cf.8.1763026152358;
        Thu, 13 Nov 2025 01:29:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a2d746bsm1057796a12.0.2025.11.13.01.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:29:11 -0800 (PST)
Message-ID: <f76b51e0-43de-40c6-8be9-cad2bd2613ce@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:29:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
 <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
 <cc4ff1c7-3158-402d-b746-5aa57b4a855f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc4ff1c7-3158-402d-b746-5aa57b4a855f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=6915a4e9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CPo_bn1fJaELX20lIFIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2OCBTYWx0ZWRfX+1gn8eK5OWG7
 DqRdu/aLfO31MbyEMBH3qUbqAH/nlSZPA0pJIcEIAfbjg9i8iqwgC55sRAQlN2Lpbpr0l50rMMo
 N5RPDVXu/9G0dc1H7VNs1G9TKzsMaeKhKWE+eh3o9H6py5Z0QGLBzdZiMtoA7SDJV2KeJthseRa
 /vOhXeBZlXNkY6Qd6RQVdUm7kj8v/9YIsGaDVd+WRjuezjNzBVjmWE8quJRQ4qlzENVX/Nn1G9M
 aH1/LD+lkEG/K8Gd+KF3Z0Rv/E86mvPFbAa6dQe/CYm8bolZEEvp8oFFRlppYBkLaJio9BmggDf
 f1y/owX/EVpMsl7mR/zD882qf2TzoDe9NlNVTGaRIGpE/wJV1bOsp+B9FKMLOD/TAX8ku+DEVL+
 nZtzXoqBg8XqS7W56a/Y695reLrPBQ==
X-Proofpoint-GUID: mAflZTBlayK31mQw1WzOx-i-yZfUIVmE
X-Proofpoint-ORIG-GUID: mAflZTBlayK31mQw1WzOx-i-yZfUIVmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130068

On 11/12/25 10:16 PM, Akhil P Oommen wrote:
> On 11/12/2025 4:37 PM, Konrad Dybcio wrote:
>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>>> in Raytracing related workloads. Add support for loading the AQE firmware
>>> and initialize the necessary registers.
>>>
>>> Since AQE engine has dependency on preemption context records, expose
>>> Raytracing support to userspace only when preemption is enabled.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>>>  		goto out;
>>>  
>>>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>>> +	if (a6xx_gpu->aqe_iova)
>>> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
>>
>> I believe you should also set CP_AQE_APRIV_CNTL per-pipe
> 
> We already configure CP_APRIV_CNTL_PIPE for this.

Aaaah right the register I mentioned is separate on gen7

>> Should we also enable AQE1 while at it, to reduce potential backwards
>> compatibility issues? Would that require solving the iommu woes?
> Yeah, AQE1 is strictly for LPAC workloads. So lets wait for LPAC support
> first.

Sounds good, thanks

Konrad

