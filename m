Return-Path: <linux-arm-msm+bounces-47939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C6FA34BBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98CD7162E13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20E22222D5;
	Thu, 13 Feb 2025 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5eq3HP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44E42222B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467352; cv=none; b=DH3jWDVWAquhWnrEEMIfT04GC0yf39Xztda3VhR7IU01JdBEtfpn+8XuuFut5Z8zJjgE2bWhvDibW+oKZRXltjxLX2RJWHS3t4cXqTwsNJW6vPXIgxAL9RpRmm4pUPK6//KcF0gQIMQK1KRN5sBFZ37d+8GHm5sOjHawDDIQ4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467352; c=relaxed/simple;
	bh=G7hQBfdHAo9mM29YIVfHNMeDDe5T3j3p8DniWSYRb28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHU84B2wkDqxzYMjFOILKGh73jt6s0KXlENLOr4hYfyRrtmaVm/boflzEjvsmCGlX9zBEG7odod3Vl6Ay0270fnca2xfr1UscE5E6kbHYcHNNp67UbmCnzoQciwLZRnDpckF0F/Kh3p3eVqbCEhSevGTbGzij258Pq90uKO4JJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5eq3HP+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DGaiqe008261
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 17:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7/PUjGwCmpWRxWUtK4W2sPA0ZnQnvaVucugb62nb9E=; b=D5eq3HP+tMC8gmJu
	c8Ku3aXF7snUBfQSsjWuI0RLwtym21RBWvGLwPDc/m1xQu9BqX/Hnw565FBcaU/z
	fHkOSGnp5BOYKlpdS0EymHWjDcaCWxowMy7Z4K0+lpI74ucKMzY5oRlyVIAzCs6R
	sEeRNInfaRvqo/V+UDhispc/rtLNNZSYZ8iyRYLkLO4Fy5GCfftvjcwyNt5lIEId
	n0JCHpDoJhSDE7PICdAvA/G53E6nnTVfJEuAy1LmH9MFNxoqMkSxybzjDdalxtJr
	kKrUrdUc7KCHht+u5uktdwnj5+McC0Th/QF8M/qdZh1zggPZjXC8VrisMXT+TDPn
	+0j3+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewhbmrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 17:22:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e4546f8c47so3568646d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 09:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467349; x=1740072149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7/PUjGwCmpWRxWUtK4W2sPA0ZnQnvaVucugb62nb9E=;
        b=CKzA8F1F4m3F2iEXsG+fHuxAtuAsq9jvFxRIsjL4WhPyCQk95OUqPwgTjjPiJ0juKs
         jxGxpRTXDe5Pk4ZSqGwBJm+nNlhUimN4w3K2tEhM+ucywNJFLuoigr4BnbDiGGAQbZwO
         N0/G5pWQFw100zqwGRlh0QiX3FO01lE5KPZlw+WNDOaHf2KBtDBIHanLQxWhpqD5LErb
         gdJGLYr4+D2HH7hC4ISHHN4FOA+BgozZJOedG3H5Z9Fd7lnXObsI3WcdCGaKMsCjaMJg
         a25jaz6p4qN43VEVEDGAzzXpHmdwS5Xy63irl91lFTj0sDDzWLF76NpSl2Gmr9r7nP4v
         4Xog==
X-Forwarded-Encrypted: i=1; AJvYcCW3V5KVCJL2Y2Ba/UjLVOCaDGWhSYAJZoSO4VHaSLbhkYeglzuZ2yIAB+eyaXZ03/4jkJgVSGHYKZgqzjap@vger.kernel.org
X-Gm-Message-State: AOJu0YwYtuNqWSIThZPhFtee7XDkhS+rPIPkhanHrwY/IcOh/wmni2n8
	OHkaLzg3yNb5pIuMeL5Ue7zLjVNNK5HNBJMLMOifhVeRPCZtLOuzB2FyhwmTu96cSKH6iwP5Xi/
	Su0c+BSL2hFNomQfTGbOC3mrTkFf1CjxukjYr497L2e5chVHmf/pJKHDu6i8HtHya
X-Gm-Gg: ASbGncsnx6uo4CR+Fpx37G/9VTgqzVa7T9WyVypyQxYmyHoMkUXgBKeImzZ7A+4ix25
	hIPJlyQC1RMyXOI9By5y4yYvs0wrhizypAPmEC/vyrXQXJHX6G3LDMX1o8xfjSXastyfly2coge
	UkyetvlFoqnHMktNn0ZJez5ceO08n/NxSxzMyK7XrbI/NSP/B06+61EAGzapbaZi11gpMGL5kJq
	e4oqqKpsuAdM9wCwHsVjfyuGqiMVopTr9snmOe5tgjF5GoyI3WMdEeAxc5yRqdnNNf1Hdcpgjt0
	wloBO0dw/mWOlRr5zXlMlrELnaiY4fe472AYKvOMdX+bzHrK0X3Qlg1UrSE=
X-Received: by 2002:a05:6214:1cc9:b0:6d8:a150:3eee with SMTP id 6a1803df08f44-6e46f8d9580mr36939416d6.9.1739467348684;
        Thu, 13 Feb 2025 09:22:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmfP2aHbNd1c/gB4XKIkYhnCqiIT8aj9i7HRo2I1/gnzLpGgVGu1VWam9QZaenn/3b5fmEyQ==
X-Received: by 2002:a05:6214:1cc9:b0:6d8:a150:3eee with SMTP id 6a1803df08f44-6e46f8d9580mr36939206d6.9.1739467348348;
        Thu, 13 Feb 2025 09:22:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322f1sm170303766b.19.2025.02.13.09.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:22:27 -0800 (PST)
Message-ID: <0c753d83-d49d-43b4-b871-301b8a93797e@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 18:22:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
        Rob Clark <robdclark@chromium.org>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
 <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
 <CAF6AEGv6q59dpktR-zR7+4nuz05HMrY7givk8-E4rwCyJ0zNjQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGv6q59dpktR-zR7+4nuz05HMrY7givk8-E4rwCyJ0zNjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wEUrgB9EuljBcW6ExRNzAAvSlsF9uBYz
X-Proofpoint-GUID: wEUrgB9EuljBcW6ExRNzAAvSlsF9uBYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=951 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130124

On 13.02.2025 6:19 PM, Rob Clark wrote:
> On Thu, Feb 13, 2025 at 8:36 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Adreno 621 has a different memory map for GPUCC block. So update
>>> a6xx_gpu_state code to dump the correct set of gpucc registers.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>
>> So GPU_CC is outside what we consider GPU register region upstream..
>>
>> And I've heard voices (+Caleb) lately that we should get some clock register
>> dumping infrastructure..
>>
>> So while I'm not against this patch fixing a bug, perhaps we can get rid of
>> dumping GPU_CC here in the near future
> 
> but we'd still want this to end up in the gpu devcoredump...

I suppose if the clock dump is implemented as sysfs, we can export that
func and call it from gpu dump code

Konrad

