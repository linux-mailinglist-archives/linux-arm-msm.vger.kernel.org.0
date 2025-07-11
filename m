Return-Path: <linux-arm-msm+bounces-64628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E28B022C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 19:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E2851C20BAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 17:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125112D3754;
	Fri, 11 Jul 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0hYY/nr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C3C522A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255647; cv=none; b=pX/gRs3SW269v1iSkYVqAcay7vdGWk87jYCFKvT2vo/5HNIVTe+0AVXvLTFD2w2S213H27ifj4Bz2SdVk9L3zB+kZ8lA06x9pN5MXD00XQ+07vh/LsOvtMpuyEqtADM94qdXeeFd2jjyhr65Z57MiZ+Br1H1ixtaRC9J3yz9upU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255647; c=relaxed/simple;
	bh=+eOaamIjPQ1aU1OkMYDqbWxTf7TfeGAIEmt8eke5fUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kcsroj74k9nP5Q7xhF4ORYBYUV5QZZlhs5Hn5o3KF2HGDHTM8EG+vHN7FxbJo64yVvT6nAgUWtflhilswq/cE/KoYyU4z1e7XwVWmdNwNWnRO+PBdhRoeQ5OGyO0UH29/o0AhWfOrOn+F3uL3i6+OTGaQBEw1PRrDDFjuyMakBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0hYY/nr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BARtXW018181
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bSezsz2wXgTichUOuspk0FPIeAlYJ0bxEsO1UFLnzmo=; b=Z0hYY/nrrlBJik1F
	7yVA9QtxJ/aLHlPP3bPTJNmgQW8BOtB00MfHuN+TPuQ25N6Xnxdg3IIMvQVUIdye
	8uYP/8m/HLTjESmX7YB5xmzsKbXegTBa6ZUTYPE9mZMjbGDu6zehHid3jjkpfaeU
	ING/wn9fJk2qWAPky4kOim61wZN/5CGU/hJ6nmaZsYdwzEpy6/guCmzDQ5C9KwmK
	FT98QK5OWkFLdIuXrn7Amezke6MP7jozasPWMiZk5Shh2/fNCcZ6w2dEd3FKLVT5
	42f/m3JjCzgarYVIdTxvlF0KjTGT4yxcKhxrd85NIZ1HL5ToHqPTbFsJZfl2TKUD
	O7llpA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf33aer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:40:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2349fe994a9so21192475ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255644; x=1752860444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSezsz2wXgTichUOuspk0FPIeAlYJ0bxEsO1UFLnzmo=;
        b=IW8Ra9oJvUhgxq3J7GcffoQVct4Py6kX5b7WsnFhXYzXYNrsOVQ+Cd5Ta/rjNF0177
         Rw/G0nGmoEqg4aygpn/K4sluM3/5tiRc0XS3kb8Sj6NN1d5QBjj0YswIVPxSpWj9+zL2
         WuTeSVJSlsf02sAjiVgwgJqllohLFbVviHVqyGLO/xXXreNnvlEv8cUVI/Gc3WXCav3l
         VRVOoyTVG2R5o5to1tLO4pMTjDDwUAzjLDAs1UbrLIVQ20tJpzGUePyuk+C5BLvybnVk
         VRzU+ztI/olp6RM9i7I6m/2/dxJt3z2FurfvZIfHuVfL4+PcSK/zzfpcf9AMPL4TF3X8
         QQaQ==
X-Gm-Message-State: AOJu0Yz/WbWcqLSac+bcMDW9GfBwhVAjMHoOF0WwcHja5eVz1dQFl4yX
	ZLHamOfNd8mV18ISn6zwviBMa5XpbooMYb+h+PgoY1Z4/ZiNlITjw/sNRflL1K3O9UYc5APESZI
	IbiDkW5tH4KA8VWsm6mXhZBtVgPUzPOHNYiHiiGofK8h+4PPtCv8WxXfF+E4zLEWeyndR
X-Gm-Gg: ASbGncuJewLyw8a7WQAH5jzrtn0EzVxBfB5mxhX1hEJBKzqRkEuJaB+BzdclxMGrFD0
	UcJR6+7j3s9C+mhbqe+tOyCg3Z2pitda25TPsTTpaoZdA5vVBNlm6RE9GdkkOvt9XhAmei9L7oJ
	icRpxZucooANVBwCnjPkLbB4OYAcrFWSoujQAgQVn5dHqC54Sk+xOS8Mkr2yGIClNfGfBkpITSx
	dThE6l8KWAo9YDfUrYOIGMbYmLpWn9ds0Rmf9aarOJfUuK+E4Ukrlp0bh3t9ptA3dB14Nbzf+1I
	BHOcDVsGR6B6d15kLWL94KWhgbvPqP24zb7DNCxuTfGDEf7sMHmVBJtTusOk7oTC3dN6fih7kJC
	QuvQ0vqeF/o4NeDKulU8xig==
X-Received: by 2002:a17:903:1a0b:b0:23d:ed96:e2b6 with SMTP id d9443c01a7336-23dee2a09c6mr60377045ad.44.1752255643660;
        Fri, 11 Jul 2025 10:40:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdn8HQaoW/XQ9oZfpcgpjf8lK7LzxLVyZK79thkB/L5CABuXts7BBynHCZ1AX8U9kj0TvvpQ==
X-Received: by 2002:a17:903:1a0b:b0:23d:ed96:e2b6 with SMTP id d9443c01a7336-23dee2a09c6mr60376615ad.44.1752255643074;
        Fri, 11 Jul 2025 10:40:43 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad295sm50602615ad.81.2025.07.11.10.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 10:40:42 -0700 (PDT)
Message-ID: <fdc5c2a6-1df8-41b6-b0c4-5557f8e5d720@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 10:40:39 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix build with KMS disabled
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Arnd Bergmann <arnd@arndb.de>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250709140838.144599-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250709140838.144599-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEzMCBTYWx0ZWRfX0jR+3d5hsiNX
 TF/NUW3qnARdHWxZ4oJ5aNGVBc3OKDJrOb/mp1HkyeZilwHi8oHIhJt4a8d9hW9o1Q69gkgIFAS
 0VEW1LG1kVLxfVaJV1zMTB2ItZdnupNlrdB2rSzgTcRiX+MpLEs8VHjbxVC5UFthsZJ1/LFA3M+
 YeuRn/jlpO+z3EH/tgpZ0M3a2vm62hFJDeiIIoXqn2TcVzMNrY49LYJZeljTk//h+eKc/46jWDc
 hltIhtCPOapqwgHKwIOnDXDxG5MH3QgYP5q1sFylNyCgtHp57cPJP0hTb/8waepFok8t9chxb6e
 Gn2J3Bz+c55eD8lw8rsILPocOUzXhqv2TNzs7uxeYG0YchbgV3CzfADuYCVjUWLAlk/clQYe8/W
 6JncRfx2CBYkYHRmSuTR2OjZy446lZRpw/mE6Gp6uPxFLZ7iPEBtHCu0/sMT0Nb5sh5/+BFG
X-Proofpoint-GUID: CmhMRedEpG3JJP_CpNIFHoKCdpLi1Gjb
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=68714c9c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Mfb-Jb5ACYakjZQR0UMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CmhMRedEpG3JJP_CpNIFHoKCdpLi1Gjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110130



On 7/9/2025 7:08 AM, Rob Clark wrote:
> When commit 98290b0a7d60 ("drm/msm: make it possible to disable
> KMS-related code.") was rebased on top of commit 3bebfd53af0f ("drm/msm:
> Defer VMA unmap for fb unpins"), the additional use of msm_kms was
> overlooked, resulting in a build break when KMS is disabled.  Add some
> additional ifdef to fix that.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 98290b0a7d60 ("drm/msm: make it possible to disable KMS-related code.")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/msm_gem.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 33d3354c6102..c853ab3a2cda 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -96,7 +96,6 @@ void msm_gem_vma_get(struct drm_gem_object *obj)
>   void msm_gem_vma_put(struct drm_gem_object *obj)
>   {
>   	struct msm_drm_private *priv = obj->dev->dev_private;
> -	struct drm_exec exec;
>   
>   	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
>   		return;
> @@ -104,9 +103,13 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
>   	if (!priv->kms)
>   		return;
>   
> +#ifdef CONFIG_DRM_MSM_KMS
> +	struct drm_exec exec;
> +
>   	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
>   	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
>   	drm_exec_fini(&exec);     /* drop locks */
> +#endif
>   }
>   
>   /*
> @@ -664,9 +667,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
>   
>   static bool is_kms_vm(struct drm_gpuvm *vm)
>   {
> +#ifdef CONFIG_DRM_MSM_KMS
>   	struct msm_drm_private *priv = vm->drm->dev_private;
>   
>   	return priv->kms && (priv->kms->vm == vm);
> +#else
> +	return false;
> +#endif
>   }
>   
>   /*


