Return-Path: <linux-arm-msm+bounces-70466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5FFB32596
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 02:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D0CAC238A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 00:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABF215D3;
	Sat, 23 Aug 2025 00:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJmKgGTl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52BD184
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 00:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755908057; cv=none; b=h5e62ugDZGJIbvOImwLCAz9Pwm59bp58GkK3TNF2M/VvFYl4VlDIh7hOs2W0QaO3TxHUfPtaKZhuJcDchhM6w4Gv2/mTkG3df8EGvd5G1S8beuWGhrqFI3ZQeCnOCAk3NGyNMSb/x1UL9X4/MH8TDylMKYX8/kJknOY0l9h5ANM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755908057; c=relaxed/simple;
	bh=BHLd4Q6QXpl1+7vDSWYb1rrLmx7bHBIAjbkFLYC2iWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjqBps0nNBbRUqFAVlVlYyn8SK1BKvkpTSWGrIhRMKEtKIHGq5tEV1uZzRauNIiJsOM9TlixELEEhVTlAQ3ywC27G6M273NviAfuQYyXAnK3Z5f4SImoXRN/pgqzA82e+HHa7/VlyJLRtnEisalNr2JQDSRZQdjGwHyze1stdpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJmKgGTl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHZqKM025568
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 00:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5q/OdSmF/cMGGczwyYiaDZdGQXvSJ/FPohyvehhsUvQ=; b=WJ
	mKgGTl0DyGDzKUz5B5rtc+cKqAltAtR7Z9CZMSv3Ac6c0utmSULuY1LnCePoCBv2
	8D9lBJlZNrwpvXyuczo2Xfft8gfahQ4bCq0YcGivFGcpH24raqH2xUovjEqQR7uG
	MCT8UPoOYBmbv5h/RgUveI62wkB3AfNgb9eIf1IHdDqBk7zvsDLhYlC5EHAMo4W7
	gZzCS8X0vXtcps/eP3olKjbOWb/i/XIxN4Yn8HWB+O2iXb1s7aWans/LrZH1hHdb
	KsiU7OoJrs2gt9otCm6VX5w2t12PFSKwSjBjHH4n7uX5sfDbpVVa+YAJpcAHTnaL
	fDqWLPNmXmfi/9bYXdDw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw3cgtge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 00:14:14 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-435de71b1adso1556424b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755908053; x=1756512853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5q/OdSmF/cMGGczwyYiaDZdGQXvSJ/FPohyvehhsUvQ=;
        b=M+qX2TFnoK3Su26z0K8hgXVtzJs9u5oprm4LT8KMRHGlOrnzjuNYDGp8JdBsvKkDZX
         eiGFj3AVfECrclB8FUg5kdOyU3issCFe3yT6VYG0Sb0tpVXq+XOY3IayI8U5clbG9Ja/
         iOZTTcIMttn0euNZRCI7WPEvZZNRdB+h/3N0UpPwscDJxtpx8kKY5DOq3OlcTwSKCakU
         bl5IetG53diBV+LzZXuvNGvBtvuFXHtm6KBsqC2nQobNi8AGkyWPD4NwuyoD8AiKsNrA
         zdKgu0gKe4mzYHrwRxA25pCPtgYgLwVbrCnANPiBOV+WDlLdrvqH1QuKERPGGfREppLp
         GpgA==
X-Forwarded-Encrypted: i=1; AJvYcCWQxhkPMKJE3SnyADutMunxKDWNmt3eOGRcgp2j9IZVro3xFJBBtVK8rFT99OofKdLy0UVcKsHaI3E9tfhf@vger.kernel.org
X-Gm-Message-State: AOJu0YyuQF6sHo56DBMHKeAoeC2TWMG7ZfQE0BAPBi6bbGu9qleKGDVL
	fh3bxWp2kfIu7ZM5316bJvY5CI9bOFDus/qEfNTdH/9w2kslgZXeIfVMRjF3D1yd2g1uUO5BpTq
	ShIsEc4+oxfYv/v0rwJdoUOA5iu4Cb+Rsqr4Fza6ybMyqkn3rsl+gz2FjWyl4TZ+LTpHW7mcRLl
	ftiWH5KajNRs/S6SWFcpvPvPYbgg35IKAYNqKTED2r3J4=
X-Gm-Gg: ASbGncv1cCs6sgaULuGeWRYty87jASPGGgGJqm6BSn4PhTEd0Z6kIQ02KzFOZPDuNbv
	wlNqtbv7qS9zHwuOpXQk2t1UdU31M16sTWWuKSPMTka39WnqLq7YiJgo/LaHYvuEATYDF2aAI2Q
	9kVyNRYLobGDny+73s2dJLSR/yhxR4InxQn8bVKeIDUiVfguirHqlH
X-Received: by 2002:a05:6808:508b:b0:435:7445:9b54 with SMTP id 5614622812f47-43785272d3fmr1994385b6e.7.1755908053581;
        Fri, 22 Aug 2025 17:14:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4t+fq/ZGjil0DXAYYaSwcVpbr7d7MsOBcm0bO6kgAjPfM2vJH/vRb8WNpsTKBsxfQRwH/66jLfygmardG6Mw=
X-Received: by 2002:a05:6808:508b:b0:435:7445:9b54 with SMTP id
 5614622812f47-43785272d3fmr1994379b6e.7.1755908053191; Fri, 22 Aug 2025
 17:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
In-Reply-To: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 17:14:02 -0700
X-Gm-Features: Ac12FXyYHTzWHjyweR5vLi67evbQhmIDPXKLXYX2aATF5P7xijHggxde4nM5TrA
Message-ID: <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed GPUVMs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Danct12 <danct12@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MSBTYWx0ZWRfXxFKxmIRy+mzG
 PBWe0bMDS8iBQt3zz5R3mT0pBjvS4WQ0ibZLPFLukJgGnzE7xB2ilI7Q1kFqkNG7TlOnAKg/XIQ
 cTg2i8qHU6KWagTYUI9y6SGxx9KCNvPDsuJeTgsKLftPe7fTuGtOIdL2o59zxZr6Ly+pUR21pDS
 ADuaD4VX9q1AJ6D0pccCpOXpysre+xFC9K6dmdgarbn+l4+KN+YTlTmZx4CxIg+k6N1d/gL0zjC
 ITXrI6fyHu2lGY2Uckcsx0Lic57OeyFGNglMMH598NjnYGof21FqbzoA2agk5rFZA+3Sp+tJ00M
 /JQfdg0ilQg5J+0iWQiXAUOMs0i9FMF2B22/BJHvlAI6mIIkXGl6b4LOcLhtEXjtdwnEFIPrqoH
 +BzoQTgL
X-Authority-Analysis: v=2.4 cv=EJ4G00ZC c=1 sm=1 tr=0 ts=68a907d6 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=LpNgXrTXAAAA:8 a=lOIBcmm3ity2mgyilJcA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-ORIG-GUID: yVw9_NPTQ7CsDaE9lFfnBqCDHL8jYch1
X-Proofpoint-GUID: yVw9_NPTQ7CsDaE9lFfnBqCDHL8jYch1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220161

On Fri, Aug 22, 2025 at 5:12=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
> allocate memptrs: -22" errors. The mentioned commit reworked the
> function, but didn't take into account that op_map is initialized at the
> top of the function, while ranges might change if GPUVM is managed by
> the kernel.
>
> Move op_mode initialization after finalizing all addresses and right
> before the drm_gpuva_init_from_op() call.
>
> Reported-by: Danct12 <danct12@disroot.org>
> Fixes: 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()")
> Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 3f440bc1f7106f3b0091f037611d0b433e5e2c18..6df6b7c0984da57fe64de41fa=
54f7dea0a324c74 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -368,12 +368,6 @@ struct drm_gpuva *
>  msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>                 u64 offset, u64 range_start, u64 range_end)
>  {
> -       struct drm_gpuva_op_map op_map =3D {
> -               .va.addr =3D range_start,
> -               .va.range =3D range_end - range_start,
> -               .gem.obj =3D obj,
> -               .gem.offset =3D offset,
> -       };
>         struct msm_gem_vm *vm =3D to_msm_vm(gpuvm);
>         struct drm_gpuvm_bo *vm_bo;
>         struct msm_gem_vma *vma;
> @@ -402,6 +396,13 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_=
gem_object *obj,
>         if (obj)
>                 GEM_WARN_ON((range_end - range_start) > obj->size);
>
> +       struct drm_gpuva_op_map op_map =3D {
> +               .va.addr =3D range_start,
> +               .va.range =3D range_end - range_start,
> +               .gem.obj =3D obj,
> +               .gem.offset =3D offset,
> +       };

Thanks,

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> +
>         drm_gpuva_init_from_op(&vma->base, &op_map);
>         vma->mapped =3D false;
>
>
> ---
> base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
> change-id: 20250823-msm-fix-gpuvm-init-520d87ebcf26
>
> Best regards,
> --
> With best wishes
> Dmitry
>

