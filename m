Return-Path: <linux-arm-msm+bounces-76812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8733BBCE558
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 21:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6179B4E33B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 19:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6186720966B;
	Fri, 10 Oct 2025 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pAzpKwey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF11C5D44
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 19:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760123388; cv=none; b=m0wjbcwp3jdSybWRWX4RflErQSe5u4ZNWgM+zq4voXcWX8KTB4M1HuWpj7azFsiihVea/bc2x4l/SNt+IpO5yywXuFBK5ZEbyxk7j/5YVPHBKsLEEyR/GA7FyK6z9TeZI5i5PGWFIkUpV5uGcMpcb6Bo3nYymkNHXDW2fPkHz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760123388; c=relaxed/simple;
	bh=My3og6IGvsza1Xl3yHCcEtSIfTs10AaCir/0wvhAm8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofbXJyLuAdvEW1vWpcmc7Z26c4M+M4LeT/ffISp3adQgAZMxpvkJNgY12aGY/MMhxPiHZLVuWP0GVVudBiAm0ViK3aBY5dxjwUmVVtRqqNPDAsnfPRSPCnbMSFvQ8oVKwcMSqx2pOLHpPZXjmwxAT3utAsGClt/CrNhuFJlKgRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pAzpKwey; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <39a7f9a7-b97c-4851-9a00-ab926967d7c8@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1760123383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5diY5uCD/YJY9STm/+KyjBx0wU7pxgCFd8nIteFoVMY=;
	b=pAzpKweyoRoyM4yCIeWDl+NK4p7K4nEciI1EWaopPgazh1rJOMj3tIk+Mt+fORGTErLvwn
	g+GQIRULpCJfAj5DSygRokNrSZa4dUsoGxDmH5CqtiRRdAcgLhts8VnedT0Cl8v0Ul5Z1+
	w6rZ0ylVguxwCo6hDvvV1pz5LW+SW3dDRLtO4L2PpTdTcd56AIQPSHGh/fPVBklxxjrcQa
	uBBEsqxXLzoShWQ0uBbsrPQYqXceDeIwxewVE5LebOOlMvRYK49ioAOo8GQ2f8Dy+utGkE
	gaDsJMxDJ3+Be4P/kwozftD9wUKm7VVOvZsurer5/B/AMnOCE0CMScEEPQJP/g==
Date: Fri, 10 Oct 2025 22:09:38 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 10.10.2025 17:39, Anna Maniscalco wrote:
> Update last_fence in the vm-bind path instead of kernel managed path.
> 
> last_fence is used to wait for work to finish in vm_bind contexts but not
> used for kernel managed contexts.
> 
> This fixes a bug where last_fence is not waited on context close leading
> to faults as resources are freed while in use.
> 
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> ---
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Changes in v2:
> - Only update last_fence on vm_bind path
> - Link to v1: https://lore.kernel.org/r/20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..75d9f357437006ff261db148901e176eae670d41 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -414,6 +414,11 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
>   					 submit->user_fence,
>   					 DMA_RESV_USAGE_BOOKKEEP,
>   					 DMA_RESV_USAGE_BOOKKEEP);
> +
> +		last_fence = vm->last_fence;
> +		vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
> +		dma_fence_put(last_fence);
> +
>   		return;
>   	}
>   
> @@ -427,10 +432,6 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
>   			dma_resv_add_fence(obj->resv, submit->user_fence,
>   					   DMA_RESV_USAGE_READ);
>   	}
> -
> -	last_fence = vm->last_fence;
> -	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
> -	dma_fence_put(last_fence);
>   }
>   
>   static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251009-close_fence_wait_fix-00e1c2521eee
> 
> Best regards,

Hi!

Since 6.17 I'm seeing gpu faults that were not present in 6.16, they
look like [1].

I was hoping this patch can fix it, because faults go away if I comment
out put_iova_spaces() inside msm_gem_close(), and this patch mentions
close path and faults together, ... but no. Perhaps something else is
wrong somewhere?

[1] https://paste.sr.ht/~minlexx/09a9b3d4bfff3e7be3e96cd88fe8cf34621cb655

--
Regards,
Alexey Minnekhanov


