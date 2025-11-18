Return-Path: <linux-arm-msm+bounces-82201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7FC6805A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C9A84F2C28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329F6301719;
	Tue, 18 Nov 2025 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRkHZLpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvwuHxna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A32273D76
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451394; cv=none; b=X2+DZ9W7v7J6REofV0TTDDvcr1mNARYQyX75iKLNQ2M1cNVmKm+PR5Ta/ch1fARjbxU1qFcODtcHwcKmbneI9352hJQS6WnY9tR/rUNnENOSF2sfjqqwxvEVXESUVW5y2/I9fJeXSW+eb2xVLslUw/N2F3EsH/5bnNRe46WRUc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451394; c=relaxed/simple;
	bh=a/LZ3oyrnROa8Tk+iEmRadoqpeNP1ck797KZYQDlyAY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UezN+PIcgLsumzCLq67CreQCc5uW7Lq65ZPfuvB77gl0Ad7bQ2CB1CeQ9/B1F/+L5S8S3DmUkeEsq2i4OrXN8j5KQVfx0QDwBh0fpUq3fmyTbrff4qFEcvTplGe9hxlh7hJSfoTI/L/FsoV2CTzsAGKjwfMiqlyLOD3T4CG4ubU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRkHZLpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvwuHxna; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI65HmK384205
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVinXdjILSV5+JiZoUxO2kalWseMGqwJaCbzkxN41D8=; b=KRkHZLpxjmHfXXKh
	oQe3FkNW27uWFRVun+8U1fAhoyGctgOahbqKwvjOZrKUGZ7BqT24IjxkUxgQp6Gh
	h2e2fRmW12U8lqq2PDgPN4EUdyXiPEQyhNeV0YU215WhD20gPIcqSq8ckkzeyYBo
	87FwvuBmq9QuzokZIpbPJRMuy0IIivPBazXCqNEz7jXp4bvrAppM7ySMv1zumyhn
	mtuJsPxTdQWL1zc0GZj7SZEmgjMoraCMS5gp4CwSptTTjqEHhKJXKMr1WM5SH3oC
	KylGLSBnHJ0WdzQTr7U4ZL7HLeJxPpzQRzhkDPrZTRWf1l1hlpGfzm8x9D4ZT9+A
	K22YPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8hk2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:36:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b80de683efso10831748b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 23:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763451391; x=1764056191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CVinXdjILSV5+JiZoUxO2kalWseMGqwJaCbzkxN41D8=;
        b=GvwuHxnaZXp1OzMLpJOKIcR3KiJ5xFzmFULBG8UucVlTNfPhh7rh9Jw+6sLYmsV+UN
         a/lEmvS4iVAVWtgQnk6zxPr+jh7/ggQKdFOfIMvxzj/OczLjegKz1i+CfpI8VTn307OU
         jAs+VOWLA18qSeemANSrI0X/f5bSBdgpDlSMuf3DGFZeu1pJvCMSMiM3ET19MQZ8bXrL
         c1lPxOXt7QMg/V1McYL6RLbDak4ngxgL8F4q24RFs6Px1Jguple58/5caZLMi5Ab2itr
         x3m5bqvGXNMoQFXscn2Zx4CAiHXQJb1wTcnWp+tnD3NoatMFIXpWxRoPxnOtV0wqFF+a
         QLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763451391; x=1764056191;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVinXdjILSV5+JiZoUxO2kalWseMGqwJaCbzkxN41D8=;
        b=GnZflCzpD/qIJxq2LmzajTSpD3RoDM/F6veBghzJf68cWqVVofnzkFQYY+UBEmJbZi
         eRjrvJvBLChR44Ud64sguhY5PhPByL6Sfn7166o1vLJfeIfB74yVIR2IeayMCu16kUU0
         tF7XvtUno04nbuvZZd0QpCpmvZ49YC21Dw77C3pW3JSeLMLhbzqGF2y3DuCSUrCulcsp
         Q5v6eK6w/FyGWzWvikI7LWxMP16WlFfJxYYHDywjqEAOTWt/sCNAk5pSo71H726PCBFh
         1ETnu/F/TnPq6NfFBx3ipzGX09d1o5ddyeU+c6/+IPeWBjXPD054X4SG7GSbjaV8baOi
         ciYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH9gfDUefiMCXzCOT2B1kIz1U82vkGDNpCmx/YA+s4h7Z7KAmH3blxMSMkL8wCNKxvlqtkwc3aTnGeOCjG@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxKXIGIDpYTg+CfdMWI80o5w8KtmzTsQpIdkB7cj7imueYOTR
	8Tiyhu4pKKYDoVyrsB6nWq+N5m5fCs9wnxxzBsyrSvqYj0CB+Dj+9pgaIOG7R+P+mTFM/aH+doP
	pAAke8dLIh7BwzU/z8QcqGSmc/yWl/X+HTtET9BCXZ/Ucgvae+pTBuMLyrFQSKpwIeGdv
X-Gm-Gg: ASbGncvbeMGG+QcseF2Ver3Mwbtn2dH8rAU206ugbSLVbAlTfLzBM728SuQyIp606H7
	liepiOc+NcRdzWAnz4A4d/V1fb3Z7doCzPu0uOQ/E8prfDU6CxUvn/9LGdcTSKvidnP2yTPHaP9
	bYmOiBMCBxESay0IiRmZJei0TVpJkHk0U+UiO2PlyAurkGAVoyi8L28taPUiDr8BeEzdH36doty
	fhhcEznPCYqZMfbEFiWMYdfdPh8QfvuVr8Cv9HCBE9QKOT9KTVzvTf7+eGPhHb/UzkRQ4fUaazr
	WJVFGpbe4ywzppXDZv1UHtEA0GqER3H322rkkQBJWb78mWKg3Ap8LMZjj87dJskYN7WZScbFkB/
	ywAmkyKj1D7OOz58L6aYmVpfKXQ2D+MlTJ+m15Ztm1F/4pb4fYAKVKhWi8B37
X-Received: by 2002:a05:6a00:3d42:b0:7ab:3454:6f2b with SMTP id d2e1a72fcca58-7ba3bb94a6fmr17351047b3a.19.1763451391391;
        Mon, 17 Nov 2025 23:36:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHukQGXJp1dGw+SE5YsWPfaB2imyUIP4jehWGiPYigS52alyMJZbGUghC4jAi+ug2iDnAHAA==
X-Received: by 2002:a05:6a00:3d42:b0:7ab:3454:6f2b with SMTP id d2e1a72fcca58-7ba3bb94a6fmr17351014b3a.19.1763451390941;
        Mon, 17 Nov 2025 23:36:30 -0800 (PST)
Received: from ?IPV6:2401:4900:1cb4:7658:a83f:a091:98a7:4ddd? ([2401:4900:1cb4:7658:a83f:a091:98a7:4ddd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be37fbsm15673576b3a.1.2025.11.17.23.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:36:30 -0800 (PST)
Message-ID: <0ba8dda1-96a7-497f-b0a3-7d6581bfb184@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:06:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
 <8d94324f-80e0-4952-b344-23740d1dbf54@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8d94324f-80e0-4952-b344-23740d1dbf54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1WK0USzO13oAPXV6L40fS3BZLXJuK_4f
X-Proofpoint-ORIG-GUID: 1WK0USzO13oAPXV6L40fS3BZLXJuK_4f
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c2200 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IXbB0Ub-vNnPxA_Vui4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1OSBTYWx0ZWRfX0dsopxe75PIy
 4CiOv1tMKrKaio1FBDAhVnBHx4+2cfwIEy5lpDCh2KiyCyMLWk92n0QdF2OBMWfJ08hKDEeT8WB
 rAVW22oH101Nv/1vN7F1HHzmVYQjoGa3iUDZ0wnTc0MyQ3sJHh+70CPIurwbqTM6XYzh8Cc30x8
 M3H2oKVxRJ9FlGsQlQrV3CE1JCsLoeNoTdr4LSYz+ZOTchzQfBY8eQV7uZ+daMDPHhV2p8K8QNj
 KEAT7jImgxmj8hXct/1Cq/P20wHIj4bcmRhXEvq03M64otsW2jDVFzY855jmE06QR7C6iKibo5B
 2nQOLjHsnMk+lZSLSsIRBWHNsBOVIIdqih2GtWIMz9s9owXx3sNOV8DyZdS4pmtpLY4CFovST02
 Lc4PBh21KRJhHd0Yamz3C6lVYNL9Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180059

On 11/18/2025 1:05 PM, Akhil P Oommen wrote:
> On 11/17/2025 8:21 PM, Neil Armstrong wrote:
>> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
>> if still deferenced in a7xx_patch_pwrup_reglist() which causes
>> a kernel crash:
>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
>> ...
>> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
>> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
>> ...
>> Call trace:
>>   a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>>   msm_gpu_hw_init+0x58/0x88 [msm]
>>   adreno_load_gpu+0x94/0x1fc [msm]
>>   msm_open+0xe4/0xf4 [msm]
>>   drm_file_alloc+0x1a0/0x2e4 [drm]
>>   drm_client_init+0x7c/0x104 [drm]
>>   drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>>   drm_client_setup+0xb4/0xd8 [drm_client_lib]
>>   msm_drm_kms_post_init+0x2c/0x3c [msm]
>>   msm_drm_init+0x1a4/0x228 [msm]
>>   msm_drm_bind+0x30/0x3c [msm]
>> ...
>>
>> Check the validity of ifpc_reglist before deferencing the table
>> to setup the register values.
>>
>> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> Thanks for fixing this. Chia reported this issue a couple of weeks back.
> Probably, we can add his S-b tag.

Sorry, I meant R-b tag.

> https://lore.kernel.org/lkml/CAPaKu7QvBZmx0b8SDBY1H3u-Em+0py0BrGkmrfGUXkx1uQrg3A@mail.gmail.com/
> 
> -Akhil
> 


