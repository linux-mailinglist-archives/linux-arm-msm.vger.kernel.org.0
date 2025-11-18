Return-Path: <linux-arm-msm+bounces-82200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 32264C67FF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 953BD2A8F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0562FF15E;
	Tue, 18 Nov 2025 07:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYIWN+iU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MH/2qQUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B09F305972
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451339; cv=none; b=EvULFa/J96riXg4R3v+4ff5TVKl/vEMFr1cCyEMeO/AwGLp2O9BO9QvPbp76X49iEg/BB6yoqMhlO/OQOyF+NLlrgioIwOF3/ADTfNxe2n59PsVQBILPNtNU+EofEaAeAXf/oIjqQidC2BZ1nsKJsv+CYQUi6AgVjEGGySsTM68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451339; c=relaxed/simple;
	bh=Od+8mqK9gUz5h8V4K8u0Dd8wlB1sQmBPXJ0pymplXS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qb26Pme1tgSrHFTaP7Ubyti+210+QrJ4poc/dJHhpusXzYNpewezPvSN6Hf5DoZ+wn6MB2KWCzv/TnLtZ7X+C5OSYbaSAUWXkYh+SdmKW4yjek2z5/IqBZZ0Rbt0ObF/a0WkMe3TE2HacfFZ/NSL4oM2IbCM/zKjTDiaB0jyovE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYIWN+iU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MH/2qQUw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1M2lt4166714
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yq8woC8pgbQ3SOPgqnbBsipou8bq9JW5nKurx51oso=; b=QYIWN+iUuJNGbqN4
	oatlEUbyw73N9pN68K47xoblc8nwtDTSX8bptoCYdafw8L0dHJ4yeWaswlW+FVGX
	ZFe8vVMBHNjmxydQhbctYLoOSoU8IjuStEkoAEFhD19veTeXWNmdJWLQmgI0rmHA
	RxOyvjJzr6PJLtEp9c9/bMNAX3dDn3jOGPhU2VmoK+Ku/Q7jCIjiKLnsDAVXfx2Q
	cMA5bYpcv1gTxdg842Bjjm79Hw9y191RxUlROYp6BaAZSeeLASnL7GTflNE7/aHx
	9f7u2ndwnom2hienlImWeX3c7atKuiN30qcZvDDOlPN77iFfISstadrs8WFKWmb8
	fse3pw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593tn9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:35:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-345b4f2a8e8so243345a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 23:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763451336; x=1764056136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Yq8woC8pgbQ3SOPgqnbBsipou8bq9JW5nKurx51oso=;
        b=MH/2qQUwZ942KKCtM/IJdJHLR8JvDWGcraU4r1hb+G5HaIl7rvbczYI5qzd/qzJpJB
         H048uA1FrX0M29Lxn53nDVEpm7jf4ysue4NN7lkl6KVRQgSEZQhr8kSm2EisrQRMRMXK
         0upFVQadTMWkWu2PRLCusEjj++lplkhOcBZ/lOW2g2POa89AGWq8qtQdRi9WpKK+q/Y1
         UtKpFKPRHGrm7UpagAfTA462jGi9L2jBnZccjC+wnhEDmAIP+1WAOMvofj6xHhGx829/
         hcO0oOCv5IFLmr1eDWHRyyOkAyKCQhowXGIGD1upW+4E//m7ov2GdIs1H0Lfw/d3SAwz
         Nvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763451336; x=1764056136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Yq8woC8pgbQ3SOPgqnbBsipou8bq9JW5nKurx51oso=;
        b=WicRiUjAqTjhn/9S7/s9mO+JCg4YyMZImq8P7jvsb4auD+RI9ssYx7DU7uTjjtha46
         S20w8ClS914UF5OglWpgifOBzomq5HBPaSEhlOaIcsX1f/d/8dpLIZgk1j96mUVwulJn
         WFBgPUbkVJwyPI813aFohhhbHc2Pqm/Pv4AgWKWpm5KL9N6ftt+CoXuaLGUHuGTKsfnX
         27uaa3Ggt/g6MZOxn3wRqJlgMiMZB0B55WrmaPCO/vHMEe6toABAlv3gTUMZ93EwRGVa
         dlDvttmOn5fXbC1rV3SNrD1paiWKMzeylzqHP4ajOxfgAUYMbjGJO6yTM4iiDhIagdTx
         i/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWjVn1zO8cYVlbIvgccFiANfFx6SqgMrSjkuLTJKltMjtPxbC5/aBQRYGkLtp2DS5fbljbqXy1qcbutfOf8@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQmQ+jh0Rer1CBskuVDGfOq7vwR0cnwqOrD82qbjcSj7sxV8c
	rKDlQrDos7noAxVbUfXp7cRTKws7JnvZ+2A6xslvRS5Hz0/1u001vEisAWHsf7xIPjE9jKm2qWa
	M0QogsOtX7YHAXIkHm4AC1ASDlj0MmaP7pPCCDzBODVy4l0rxiivTmowIT1qzGofpEPpw
X-Gm-Gg: ASbGncsrpcFYjhnlRM7rCtVNjLyCiC8tGldnOWFX/nYCSSAnMXxcxmyuApRDAVl8Bks
	u4wFQh2GCFh45CJ99k4YimV6wAROWKEVlL/QBEXajyfcpOdxkXv+xTsELGE42jytXGvrU/LWl2B
	3/HznkbMV9qr7TinhhHd1s59I/Dz70bRGJ/LqdkQJYGZ5I/STvLPsdwDTuxLHexZBxCoU6WRJjz
	bGEiGOcyMCEeIiMOiqEO6dDkOUYk+cxUtCxQVrpE5aNIZq6Z303/qfSwe0GdQvvKKSgnHhF+3jA
	Q9s1IdHl/khfLB9K5z3D+WbX2L3POafYhz04tyuQW2CpsiPa0YeCnjyzpg8IwRsjD8OB3aq8ztz
	ohwbqk+SU7tR5F+irEVg6ZitFOyIf+tSj4/AXJasxOvVmblPYLfA7QCrioadu
X-Received: by 2002:a17:90b:5405:b0:340:a961:80c9 with SMTP id 98e67ed59e1d1-343fa74b8a5mr16652639a91.30.1763451336264;
        Mon, 17 Nov 2025 23:35:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBoN0HzW8pQq/whBUvfkVN5aiUXblrVdghEnXtwzRxzuYGPyg1BqfuJZkOol16XFTb66lVSg==
X-Received: by 2002:a17:90b:5405:b0:340:a961:80c9 with SMTP id 98e67ed59e1d1-343fa74b8a5mr16652601a91.30.1763451335790;
        Mon, 17 Nov 2025 23:35:35 -0800 (PST)
Received: from ?IPV6:2401:4900:1cb4:7658:a83f:a091:98a7:4ddd? ([2401:4900:1cb4:7658:a83f:a091:98a7:4ddd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456518b32bsm11932558a91.16.2025.11.17.23.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:35:35 -0800 (PST)
Message-ID: <8d94324f-80e0-4952-b344-23740d1dbf54@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:05:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691c21c9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LXHpuTL_QG3F6QEsHmwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1OSBTYWx0ZWRfXw6oqnf6GNazD
 w32Q0kV3MF9bW9FpTydKnFOuovHbAkX3zZ3xTINaEIQacSvrWsyygG94F22ktzgtJJ/eMbphZ/8
 XucuC0wpD0cSE1yMFPtepTMYuqwtZam1vkO0oLgV/rfVJsWJUjJMgLzU1ZvX+X4mZECmUwItSrj
 7ml+EC7QNKRBYMNx/Smh2mCNOkGHdmdMtriaF+mfVSCINjaZ/0YSqwtFNapv51IGVRDLZFa2yO7
 wfmBGf3WkQ24LKxZs48SjhdYpQAbQzGfHC8YtsrqW5pQFibLZJmwh7qMFV6iyUBE7KaZ+Nv3hQn
 UzRhmqAWaugAimO5O5LH+J2t3MVNhlSI7a9oFm4gZ/QUOItOOBo+OuXH/RzP2kZhg2W8BRZCIy5
 ov+NyouB76r7sKVgiiU2rVIWPZaKuQ==
X-Proofpoint-ORIG-GUID: of1cFiMGm8AVA0tPX6gbQ6oZEeOtvX2-
X-Proofpoint-GUID: of1cFiMGm8AVA0tPX6gbQ6oZEeOtvX2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180059

On 11/17/2025 8:21 PM, Neil Armstrong wrote:
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

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Thanks for fixing this. Chia reported this issue a couple of weeks back.
Probably, we can add his S-b tag.
https://lore.kernel.org/lkml/CAPaKu7QvBZmx0b8SDBY1H3u-Em+0py0BrGkmrfGUXkx1uQrg3A@mail.gmail.com/

-Akhil


