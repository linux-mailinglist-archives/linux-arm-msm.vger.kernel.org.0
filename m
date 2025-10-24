Return-Path: <linux-arm-msm+bounces-78736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 92562C06A0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 16:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26AA94E6077
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 14:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082782DEA6A;
	Fri, 24 Oct 2025 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=valentine.burley@collabora.com header.b="G4QLpWXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388BC28489B;
	Fri, 24 Oct 2025 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761314992; cv=pass; b=afRSSQ8CJXhub32aVfh4wsV18jVctvEakuDz4OcHyUg0ND21Bfz52zApiFw0VuldVCXE07gYPAbOZZvwamekVgEGX3CgRJdeqZaYIRNGDRgf7vw3mRWg/cpqB3tfC1zGahAlq5kSUm7AQrTxnJkbdPrKKwfn0HAgwsKgIF96QTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761314992; c=relaxed/simple;
	bh=bEuktrexp5zkKPiFQiuuQTBbrzpCDKYDKNs/EpBRXlg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=NpYzZ3SWLC+EoTVLa0etCdXEqiOFdt0/jWu3SNNAE9NNAAHw4BNO8/scX0G3SF0yjuy3ep+sUrFpMmW3I9r9DntSdGhWuhpVo1IeMYtkntK2stz3T5oaJZEPTAOXQ8mXx0Ro/oQDuIPsaaOy9Mc695+OU2CgM+HzFBslqkpuiQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=valentine.burley@collabora.com header.b=G4QLpWXC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1761314970; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GSl5/dtjmw74PanlT8ifzXTlvcbVz/l4llLwJH2v4eSkpgMIzwFcXuH2UFiYQTKdTFWnxZ88v+tV1WaEXg76+gozlsLCNKKc7SXy2UvJv4xoByfRn5CJNG5W5luzFHShHTRC8fNoPJifpq16P3MANWEzNxH6YzSbrUQ5pH5g6KM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761314970; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VQHIgDhZhrUUNwFFz2m4paNGoP7NOa3EjygSQo1CRMs=; 
	b=ONyBj7gvYKh3SSCoKYO8XLIoPpSOePXvILcpCUteORCScvcxvqktAC3Yl6Z7CcfskdXTjJYpd15ApXrd8HMc8nxdlmBtn65VQTBdTdCOuffAFpjF41K4iLuyrLDoUnJ+oYWQWz/33jOZRwtk6ts/13gJMxpz+6aWjmt2iVRqOz8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=valentine.burley@collabora.com;
	dmarc=pass header.from=<valentine.burley@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761314970;
	s=zohomail; d=collabora.com; i=valentine.burley@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VQHIgDhZhrUUNwFFz2m4paNGoP7NOa3EjygSQo1CRMs=;
	b=G4QLpWXCga0i+oVqp8hInaNs3P45NFTDTg8tZEQA8QIUuBxtZp/2yxWaZPPwV/Ua
	FI42JKa1TddFB1ZJd+qbqz208hd43QQnkyEAwEX5QcSB0hWuLROv4R0X6ckbsAOMTCg
	jzVd81ArMorT/RD+v3uwg8NqlzhHWoJEnZRUbzPs=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1761314969231532.1756914526859; Fri, 24 Oct 2025 07:09:29 -0700 (PDT)
Date: Fri, 24 Oct 2025 16:09:29 +0200
From: Valentine Burley <valentine.burley@collabora.com>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
	"freedreno" <freedreno@lists.freedesktop.org>,
	"linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
	"Sean Paul" <sean@poorly.run>,
	"Konrad Dybcio" <konradybcio@kernel.org>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Abhinav Kumar" <abhinav.kumar@linux.dev>,
	"Jessica Zhang" <jessica.zhang@oss.qualcomm.com>,
	"Marijn Suijten" <marijn.suijten@somainline.org>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"open list" <linux-kernel@vger.kernel.org>
Message-ID: <19a168d95e8.7a90f7d35482131.1689650792018355758@collabora.com>
In-Reply-To: <20251022222051.10030-1-robin.clark@oss.qualcomm.com>
References: <20251022222051.10030-1-robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm: Reject MAP_NULL op if no PRR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi,

This fixes the GPU faults and hangs I was seeing on sc7180.

Tested-by: Valentine Burley <valentine.burley@collabora.com>

Thanks!
Valentine

 ---- On Thu, 23 Oct 2025 00:20:51 +0200  Rob Clark <robin.clark@oss.qualcomm.com> wrote --- 
 > We need PRR support in order to implement MAP_NULL.  Userspace shouldn't
 > be trying to use this if it is unsupported.
 > 
 > Reported-by: Valentine Burley <valentine.burley@collabora.com>
 > Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37935#note_3153730
 > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
 > ---
 >  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  7 -------
 >  drivers/gpu/drm/msm/msm_gem_vma.c       |  6 ++++++
 >  drivers/gpu/drm/msm/msm_gpu.h           | 11 +++++++++++
 >  3 files changed, 17 insertions(+), 7 deletions(-)
 > 
 > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
 > index 19181b6fddfd..f93eee67240d 100644
 > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
 > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
 > @@ -365,13 +365,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 >      return 0;
 >  }
 >  
 > -static bool
 > -adreno_smmu_has_prr(struct msm_gpu *gpu)
 > -{
 > -    struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
 > -    return adreno_smmu && adreno_smmu->set_prr_addr;
 > -}
 > -
 >  int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 >               uint32_t param, uint64_t *value, uint32_t *len)
 >  {
 > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
 > index 90712586faac..96925a0f3965 100644
 > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
 > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
 > @@ -964,6 +964,7 @@ static int
 >  lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 >  {
 >      struct drm_device *dev = job->vm->drm;
 > +    struct msm_drm_private *priv = dev->dev_private;
 >      int i = job->nr_ops++;
 >      int ret = 0;
 >  
 > @@ -1010,6 +1011,11 @@ lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 >          break;
 >      }
 >  
 > +    if ((op->op == MSM_VM_BIND_OP_MAP_NULL) &&
 > +        !adreno_smmu_has_prr(priv->gpu)) {
 > +        ret = UERR(EINVAL, dev, "PRR not supported\n");
 > +    }
 > +
 >      return ret;
 >  }
 >  
 > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
 > index a597f2bee30b..2894fc118485 100644
 > --- a/drivers/gpu/drm/msm/msm_gpu.h
 > +++ b/drivers/gpu/drm/msm/msm_gpu.h
 > @@ -299,6 +299,17 @@ static inline struct msm_gpu *dev_to_gpu(struct device *dev)
 >      return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
 >  }
 >  
 > +static inline bool
 > +adreno_smmu_has_prr(struct msm_gpu *gpu)
 > +{
 > +    struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
 > +
 > +    if (!adreno_smmu)
 > +        return false;
 > +
 > +    return adreno_smmu && adreno_smmu->set_prr_addr;
 > +}
 > +
 >  /* It turns out that all targets use the same ringbuffer size */
 >  #define MSM_GPU_RINGBUFFER_SZ SZ_32K
 >  #define MSM_GPU_RINGBUFFER_BLKSIZE 32
 > -- 
 > 2.51.0
 > 
 > 


