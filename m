Return-Path: <linux-arm-msm+bounces-82130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5DC64C8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 16:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2DD54E21D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC0133438D;
	Mon, 17 Nov 2025 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rxr5i0oi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu7NGFY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4861330B0E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 15:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391754; cv=none; b=sRVeQk1+DU2cI3FgzWL6evRIf4YAaHXPrS1C7Tz3aUd2CU5RzZ/Vuc3gD68aJsxO0+yT9x+2Wa3lHTPrfZP2smNj8NVWuaKkIdem/mLRA8nFarllROVMSJRi8Vi9RENVzRoSz7fXpGKmTQ6VK5z4rrmuAK0sqwpiwyfQulxYkCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391754; c=relaxed/simple;
	bh=ew7GBoPcDCjTaUrzg1fyYo9L4unv0OboG21mt9EvHRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWTdtxXIzR5BiaLuPcfMmjjnJVQj9iofwcBnAA9xDDyLFS9KUaVuj4wHI6ut1rLtRYUVdp+7uQUjRNBd7avDPQ1wgAoyMaPWL+KBuUJ3Lp33RY4XHHDGjeQKomY1VKOo5brn9TY3kvcg5cLftOJDnz/Ec9G38pti8a1jwyaefqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rxr5i0oi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu7NGFY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2s8k3671302
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 15:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ef1fLkfHBFXiSME/ii8xpkgp4NebP/rTeWyzU9gVLk=; b=Rxr5i0oirw1zAggV
	Exsm9UtDszwgt4OytMP/A138pIOZHoSLVbNvWFjLw0AC2Jh0IjxibjboFo2dICbj
	m3wg4hByNUpbBfr/Lae7/q/vCYSYVjVYDk3HSzcmQhAm0EdNUbZj5Z3EprZaSUfO
	V6qAWlKbe2lScqp/1N6hGPirg/XGixrVxtvCvniMeiy/rvWujvJK9soodiL8OnnF
	daKfH/gOVkf5hu+pK0Txnm2RYW3pCyx3z2maC8qXfKvoTf6cmz+8W8AuXb/3KjXC
	kljcfqGaQPDShqn4P3OwdW1xjRHT7OWrNy+9CeGUXgDSnLSVIvgGON9g+s/meWq7
	PUqNwA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g58n2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 15:02:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5dfadf913a8so473081137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763391751; x=1763996551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ef1fLkfHBFXiSME/ii8xpkgp4NebP/rTeWyzU9gVLk=;
        b=Gu7NGFY17MNrqzTBKpJKbCbeDBXH4hBjGfwdRbmbXmfDn+GkTSBWHmhKG0CQe8lwC2
         4aVFDFTbdvAAEPKK4LtQAIkgiRa2Dp4LRsCCoBPMVaco0/BNyvUHsBreNfYjxHWvWsk/
         fpZdDVz1HgaP/MKGzXVQG1MSkCAlBKAA86eFUFQXya/v080UTusJUpoYC8JGxSRg8i0i
         vkVZSLKLMNeXnog9fhzvfBoO/zj5P6r29bJoRQFXCugDzQJ3E/LCHtP1HrPLO52+zGai
         e7WiT780OJ3Gs/H2Dg7j9Z2FMzD+L3VOa4NUNPX12v8spVsoPCM83yw/HM9B4BrLXnAc
         rgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391751; x=1763996551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ef1fLkfHBFXiSME/ii8xpkgp4NebP/rTeWyzU9gVLk=;
        b=F2LBcozEb06q91mPj/IuYu37hd9bLogSRAiPEngrFaQdXpAsUT4MZ61nkRx1btYCFr
         J0073BPZxt0MQfhvOa6ai5rk/2uQJk5RxtiJfCrjeuSryocYNh6HL1qpCkvwiL6SZsqO
         Ydp3YQXdBgKMGk2tBiqOL4SXkJ0fgFU/45XClb7/NlhDKE6vPYJ5OPfwNcj/ok+5gSDg
         J3wtz4FgbulJGCbv/Gwx5WuASB58qPc/4uqh7g7nm/bEJ+7xdt41TFENciGfLakVPd5Q
         W8lIJOLBW8mupPznk2X/IsRD2m+885g9/9qW0N66FPkDbtYM7/7a4C6kYlQKXNJ7zZQK
         ygBg==
X-Gm-Message-State: AOJu0Yw2C6Ld6oLz4LB3jCzuUP1kSaVYBUM245MK60qACX6Fcta9/RBu
	eThH7B3ndBscx4nYUEDmSIddr1N/yBRxYyu4zdxvT4ogsxM1U+GbiRl6LDXH7KNVo3pIPn4oCin
	HDjYUdwm3vqUWWzK/tpojFjOFkOoDDASwBtmTRcYhSfkamOyYZq/3sFBbZJppDx8GeeTZ
X-Gm-Gg: ASbGnctWekrpkVNzuwAihUaPVgHj3epnag7hA/ecBWYUDBHtx8jvr+tIO641J3TdpzC
	jGJVtXYEA4d8jfcsJdpsnawOmFeQ2QsoR/NhmSGRpoxP7Ga3n31EVx7p8VYAw3G240XISsDFvi0
	fuiCjJgpmKF9O4Ksk3XfRsg+Pubmgo1ZNre1E9BxFSOw0VpW177m9xulAEOf2aVrdrzkGb1GmF0
	F9FJ04/8rGnSaH0BCon4MglbafWdyg7KzLqhFxixGnSYBG4UW7MmQ0/PqtnLzd+/vxkO5jewOqH
	kAGJYu5I6+BzfKanIbi4LPRdJmYmllHtM+gubqWkAswUK8IkRYkyOgzt0g/u2ZXxtzv08V/23Xx
	NKt8VxoLn0TGg+YXOML9XlWHM2u4aPcl9sUW8BwD0Cj/QMwqzN8Z9IBaA
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b1e8e656bmr1366528e0c.0.1763391750430;
        Mon, 17 Nov 2025 07:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3gTN2k6xAY3h/CeIVWmGva+PTDh6zNiEHBeDvsWL5An00LUHJvO9nFZJUxYNN6II0l3pA5A==
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b1e8e656bmr1366500e0c.0.1763391749842;
        Mon, 17 Nov 2025 07:02:29 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-644f132653fsm981327a12.15.2025.11.17.07.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 07:02:27 -0800 (PST)
Message-ID: <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 16:02:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b3907 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=5-YDskA_wAJxIDT2F10A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UAz00-9MWt4xenYIETPb5qy8IeySkNSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyNyBTYWx0ZWRfXwedLIoH4i9cT
 0fdLRBkKqakEgoCBpfO1vN2CJhWQBbSVtk+Q8vHGrW2GzeFH+RfpBf/GRMsC3okhziyBNfKM2uj
 JxMTSrL/ao+wN4wZ7GvmIBSKOvcIzrnT8q/pF0+PyAYJ7MQcj5zSLR2lq9QS+UqO3DaQpO1KUht
 N2web40qB7NAfdK95osZwh8WNVn6K+wjZhtUBR3yl+b9D0ilYuVYvl+V9e/SczV8iYqWdcsjrGL
 rSML/TxM/oC7UoXjkMhGqfQZ7f/cRL6d/Nsy8EZpmeRqaTn3lxm+6fj9w7NdqAMeJMtvof3VKCF
 djmfdUAGFsySE+QVEA5bV6AeHBgbKJ2Tvyxzlez8NP2YfPtrqDi9AsWexbNs6Jr6NiVmN14R5pk
 rYTTHfvPKjrTd0JZcOqj8UypYzRpdg==
X-Proofpoint-ORIG-GUID: UAz00-9MWt4xenYIETPb5qy8IeySkNSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170127

On 11/17/25 3:51 PM, Neil Armstrong wrote:
> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
> if still deferenced in a7xx_patch_pwrup_reglist() which causes
> a kernel crash:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> ...
> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
> ...
> Call trace:
>   a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>   msm_gpu_hw_init+0x58/0x88 [msm]
>   adreno_load_gpu+0x94/0x1fc [msm]
>   msm_open+0xe4/0xf4 [msm]
>   drm_file_alloc+0x1a0/0x2e4 [drm]
>   drm_client_init+0x7c/0x104 [drm]
>   drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>   drm_client_setup+0xb4/0xd8 [drm_client_lib]
>   msm_drm_kms_post_init+0x2c/0x3c [msm]
>   msm_drm_init+0x1a4/0x228 [msm]
>   msm_drm_bind+0x30/0x3c [msm]
> ...
> 
> Check the validity of ifpc_reglist before deferencing the table
> to setup the register values.
> 
> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

I think it should be fine to skip calling this func altogether
if !ifpc || !pwrup_reglist

Although ifpc && !pwrup_reglist should probably scream very loud

Konrad

