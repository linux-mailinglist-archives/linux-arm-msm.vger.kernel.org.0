Return-Path: <linux-arm-msm+bounces-88912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927FD1CB0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FC9830038D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 06:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD4336CDE8;
	Wed, 14 Jan 2026 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7MCmfJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/Bqv71K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91F36CDF2
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 06:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768372657; cv=none; b=qeAQOnjcoZCWUbU5KD7vTOVdYZl928F5Zp+EcblJC3wI+sMKXXfoyrjqa/FH0cr+txOmYtQaukOZSu6UtZtwsKRVR+cGdiGa1a6W/jmEng7tQ9nTwpRPt39v1ECcn4TVu+FdwWiMey88fCvsn2f8NEDfyG8D23APS377wA5fLqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768372657; c=relaxed/simple;
	bh=RzIjDmRcOusdLVG/Z/S9Qc24M/jxtlfD2LQCgYeNkL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/G/zR/ZG3FT7Lc2galgIK9qrtVfopQSGw8KCI1+4afJopDa+qumGacb6S6U35Lx6iYT68rltgujo2bUW8Uhxd2n5j+MT2co+fcEq7f4Kkm/RC/1gFhxT2YVe/Jamg7lwRpy6xIloZoHmwma2O+KpF/GrqAPyFzzOzw6YoDahng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7MCmfJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/Bqv71K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E65wuq2631977
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 06:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCcmZoBzN/A3JPIeppt/PGfNgz11ZDMQFaZXR2up6DI=; b=P7MCmfJ6SjTJn5WA
	S+Ivy2xD7sKNHJkxILSng+KfJQrOT3sOR0vk7rxx/c8eNiv2IgNKrkFQ2vTN6Wnw
	CR9z7nHplebMmdjNOrsA5rqhAUxv7BSp8IN3bB650qa+8B6B99B3QiavNcbeb1V8
	qX9TtiST1LvPD8nVDVVBK8gMwhUfbWzvq5r/F0Mx4Q7YckEIb5Xg1FHFab03vi+F
	YcO4vUWqPozCV25NSIgsVyIARdSkqzjpX3Ckp7xp9mmBECiuZBuY+A6BdOHrkKY5
	2Sgm8bwsI2Gqg3VLQK+HMrPrOujeqLnmPr3c65SZW1uDO8rwlpB75UxIagre0G2s
	FJs8UQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnuk923b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 06:37:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so6014515ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 22:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768372648; x=1768977448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCcmZoBzN/A3JPIeppt/PGfNgz11ZDMQFaZXR2up6DI=;
        b=e/Bqv71Kntr0Y+S+UgJ4AtJ1Otk4qvkKBLcqLaZ7tD6wCMroRAMvX8LKs4dMFcadmh
         EWIfpZLLPT2Ep5QLtplrLhKWjlK/2jlcJF2bgf36hEbyNaE7yoUhm5evsDe0JF9Ujrsx
         kbPwxC0Yt3n71tM3lS7mlJzYIDmPCCijkp66yb4Hi55SAJtbHo+NdOHAO0lOh1z7MsUN
         zWqyEjnFjGild+hn/axGXCNzRpPJYwvx85L0snXlWOACUUzSOi8dp0gd+E/53LmSa/92
         MvixycQSSdcyUpulCaUSSW3R/+aWMtcFd6V9KaKpVy+tTtqjuvKc5f940njW51TJ8mQ8
         nVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768372648; x=1768977448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCcmZoBzN/A3JPIeppt/PGfNgz11ZDMQFaZXR2up6DI=;
        b=K86YVfS9jVZWxZwZByuAhjpHn+pa4MKXtH1ISTed5o+a/x7B3EVFlc+mJ9+gGZb130
         AFmm4KeerYv44V2E/MnGzIbVehWCJdBkwIFdR7oGhe3kb1iWbpQvQF7hV3BLWK+9bBcw
         cFR6xhQ+IAYjtqDLrxxx7lU03HNshxJYQ97w6L6M7gSkBQ2d0aykKsf2LSwjlZNtqsIY
         4WFlpSYR2gen/eJ1XRiJdS/8OWHxrkP4ZZ2n6JIEHyga0djHiaSjyesWC4g7Uhh0N4O0
         zge6lPoMCDJ0cXwah0is1MDH8C98y2kYq9OBNEWAUmz38pGvBQDwr9F/HZYPK3Djp/h0
         hOMw==
X-Gm-Message-State: AOJu0Yz8BZe15v+HV0Ph8uE/lGknQIA5gnJ3KgsxvKaLuht0xobqUyU0
	ERMsVHiIytulhqC7pZ1M7qLwNkxTPwEKXXiFv87Flm3Q6x5N4Ag9ePO959iTMh3mNjOoMP/aZ+Z
	zw4rCu60hOlpFpcqc/8p2cvKxS+uoFLVijw5FuOWaljMefuoDFvYbZyHIPnRaBugxpIP8
X-Gm-Gg: AY/fxX403CgLFl/KI7V41DG0KfwRK2vQAQWS1GezG5rN2EDZS0Sx+yt7hTC8+h0lC9p
	Xn8ZdkMbSha3M9MrBtTAVYsuwZ4sLbKLYqQ7pAAQP/FEBCKZk9VbayOG5L90OMxMeVKVcdD4O+j
	LQEPT3EQXq2HYnqBuYAS9iNJM86ILEAjli8E7LUDve4UI8+kUqBJ1wTVM8na4FLhXxKOknB3h5s
	TWSWiyEcH4XUbtxD11RsC0T88Ef3JKpf63zd2S/33HlHZ+ECmE6hNDLRU+E9TKN/ix2Gfb3NuNy
	zI0SJSDcNIc0CLcgBj9GS5+07lIkqdoezzL0S0I7M6GTUZps+coJGAJ8a29RIwa0vBDgztJlqsa
	sWZcJSQ+KZ1Qr1les2kc3Vu4cwK7gbtLcew==
X-Received: by 2002:a17:903:41c3:b0:2a0:f0bf:197a with SMTP id d9443c01a7336-2a599dac241mr16267625ad.13.1768372647628;
        Tue, 13 Jan 2026 22:37:27 -0800 (PST)
X-Received: by 2002:a17:903:41c3:b0:2a0:f0bf:197a with SMTP id d9443c01a7336-2a599dac241mr16267315ad.13.1768372647065;
        Tue, 13 Jan 2026 22:37:27 -0800 (PST)
Received: from [192.168.1.7] ([106.222.229.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2b72sm218575885ad.51.2026.01.13.22.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 22:37:26 -0800 (PST)
Message-ID: <3149158c-a6c4-4c5d-9011-de4db8d1220c@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:07:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a
 driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ebQwvrEH c=1 sm=1 tr=0 ts=696739a8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZIcQe8sNaMnfUD2ODhXWYw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=9eDHubkGBslCoLSAWpMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vTnWMdTjvcf9sEpxo-oQq-YK8ntDoz-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA0OSBTYWx0ZWRfX3Bt6g3v92XWZ
 lCOC7ZddiUFeXp3dygKblESVVCyGjSZNrZXI72uA6ln5YC9smvlV+BI7bkIX6nxlFQHqcYXg11q
 RQ9ABQRyv6mTzPUuFQW6++x0eD0C+uUC/X1cOXjQ1HTlRy2i3x9p6uZ3o+9HKtVLvodZFkKYmUX
 lz34/1Feg4sLUD6/0F4Q5dqR+EkU6DospbrgW4rj1halLmPBJSrSWzzzL3uXF/V4fm37i9s1NiX
 9Bk8Zc3CxL3lApPJY6y9+NZqieTG8zYDkbt+fE4veWIboY60ngxqYSGl0FCvi2/oBCv642HCo+m
 SlPOTsAxyfGrxYqLNnd/ioSSQFQ41vo9UU2wfm+fJOGmnK3kNnsw5k5HzgKTHY1UyMH6EvnwQpQ
 oj9IDK8GmnSOHPmwPsRdrt6kJ7GlR+JEWpQ5+O8Dv10GhFUq4ZDVPhpnFWgtXUKEZVQiN8DtZh5
 xxikyROhuH4xyweSLVw==
X-Proofpoint-GUID: vTnWMdTjvcf9sEpxo-oQq-YK8ntDoz-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140049

On 10/22/2025 6:14 PM, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> In order to fix this state and allow the GMU to be properly
> probed, let's add a proper driver for the GMU and add it to
> the MSM driver components.
> 
> Only the proper GMU has been tested since I don't have
> access to hardware with a GMU wrapper.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>  drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>  6 files changed, 192 insertions(+), 195 deletions(-)
> 

Niel,

Could you please send the follow up revision of this patch? Lets get
this fix merged.

-Akhil.


