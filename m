Return-Path: <linux-arm-msm+bounces-61283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AEFAD9C0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 12:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91CC4189BFF9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 10:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0011552FA;
	Sat, 14 Jun 2025 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgPvH0y0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1DB13A3ED
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749896249; cv=none; b=RRNPUdc/zuwvq+TtH/QIJazKbmp1bT+Xv1DDB6vkDesZ0S8Yl/vOI5NQbmqQtEdSEgnVUPLEjAjfscmSjBAteoIXUYB34S6qLl6TInSfjjavicRNuhMqF9lgE2iZkQ6pAnudrrJTffZBV8je4+/qyk/vERaUghnW9yxihENFkNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749896249; c=relaxed/simple;
	bh=8MMSSOuV81jC9UC0e3mhk5q1uK3WJ+Q7Vb2Ibjx3I5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doS7LrM3jXu1GA4c/pqFidlaTW9cRxiB6TAqMzEl9VKLJWopXwby/YX9Z8mF3SKybsyIH6BkrbALP33lAhVWetIWvBovs1nEWbyFeBT9GvxEfwgqGqN8HF5JJiT/iqL3TRX4OqT+dfugjgCGeEyez92J6nbJh6I+lj/51dbdzHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LgPvH0y0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749896246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nWfzkp9DOQxWyynraH/ijyp0mDSRdle98rE+BwtdI/A=;
	b=LgPvH0y0LC9De8VQy/+T2CKF+QZQ6t74IbYQjYTiAclyWReSC3L3H9yBM9UkqnwdU4giRv
	iSktXyBIpW6eP8/dwt1WkbaN22ZU79xAnXbZyI+gGJSz+dZzLHxUZOn9cAFrLmk2qHFL0w
	0bs15uTqt8NMt8REW5s8fHO4u2JRIRM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-k0PaDuvzNu6A61tKqbeGSA-1; Sat, 14 Jun 2025 06:17:25 -0400
X-MC-Unique: k0PaDuvzNu6A61tKqbeGSA-1
X-Mimecast-MFC-AGG-ID: k0PaDuvzNu6A61tKqbeGSA_1749896244
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a578958000so52786f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 03:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749896244; x=1750501044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWfzkp9DOQxWyynraH/ijyp0mDSRdle98rE+BwtdI/A=;
        b=W0I4eP/EoEBpvlEM3dIeVmJhooIXBj1uUHxudaZ5DKdmEEI9u0u93DMPCQyE3vtq/S
         y3p0y4Bc3JvachJiHwEfHeLYg5dfRNT2eY4yI9JftovN1bu9VmmicAtvtrWzIfcIwBHs
         itdX0l25vR9kv0kNiwmNp7cbpEuD4rdmXyJtAeraot8DFlN+OG1dJOuaN0VOPbsJL41b
         3cx0BFJkheMjKhBmPvh3zE0D/NSTL0+k89RVVV2w344aiNciVddZkVCuz6mKsddmHiCl
         D6Qr4ifMtYVdgmxmj0QJf9j0ciGJmwkAbqidjqD4QZeKWSOMCUzammsiXLFujSf/Hhwj
         s5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLsWob+lnWRhitg792xpKZByNAmfyaqI1vhC4M/57gusBa4TEMzvnWgammiSlq1oRO+jvVSbZzE3MJDUVq@vger.kernel.org
X-Gm-Message-State: AOJu0YyJfKDO1YKLKBQcPOAfJz+rJnzyb23gHGVcAYlU7/k5OxtP3H2E
	mUR/JDFAtmqi6TmQkVlRUQxD8Y3VDuwU7/3KF90gvcH6cw+ZiJFcl8Vt1AOGtcySkWdpd9YQ6gM
	qnoBCu+zo4EPxvUqASnphpNmuuMTb7N0LIM1DG2LADdybxFZazRDb4azb2KrPjo87Q6E=
X-Gm-Gg: ASbGncu4h9ZUy77XJ181aGmGY1xrgwJC9rXo8a7kaKXvi6RXYKnxIRDSNsQXgck9vFv
	M6h7MPae03q2rH6GeSpyW51zYGQK9eJ6lDDKYgBPsazrZYpGiq6fHtyPkikKaYHpIzltU0A8XBu
	8eB/HrPtjEw+E4woIN5XjG2WcDTiO2UgzUYFbMPkFjYA+CJMqi1MSV6o6czQGMYYxJBofmeti6Y
	gSz57UYaerMO8VmQzBIXCx/Z0JCwhScBQuFrHLSGh2v672eXBn4mbgqSAS2JmcqAvAgOi2BeRA5
	2lDPvsGnX8E=
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2653:734d with SMTP id ffacd0b85a97d-3a572e7a1eemr2781697f8f.28.1749896244124;
        Sat, 14 Jun 2025 03:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3biEpVOuRnqziHI3bd4pkeY+o+bBTVgVmJnrCTb1g1AU1PCZyfTJ+l+vhMsQAiXihkjOm6w==
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2653:734d with SMTP id ffacd0b85a97d-3a572e7a1eemr2781679f8f.28.1749896243660;
        Sat, 14 Jun 2025 03:17:23 -0700 (PDT)
Received: from pollux ([2a00:79c0:666:b300:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm80613655e9.12.2025.06.14.03.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 03:17:22 -0700 (PDT)
Date: Sat, 14 Jun 2025 12:17:20 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/gpuvm: Fix doc comments
Message-ID: <aE1MMHrTNuCFW2ip@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613235705.28006-2-robin.clark@oss.qualcomm.com>

On Fri, Jun 13, 2025 at 04:57:02PM -0700, Rob Clark wrote:
> Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
> and names.  Just something I noticed in passing.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 6 +++---
>  include/drm/drm_gpuvm.h     | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..0ca717130541 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>  }
>  
>  /**
> - * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
> + * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @priv: pointer to a driver private data structure
>   * @req_addr: the start address of the new mapping
>   * @req_range: the range of the new mapping
>   * @req_obj: the &drm_gem_object to map
>   * @req_offset: the offset within the &drm_gem_object
> - * @priv: pointer to a driver private data structure
>   *
>   * This function iterates the given range of the GPU VA space. It utilizes the
>   * &drm_gpuvm_ops to call back into the driver providing the split and merge
> @@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>  
>  /**
> - * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
> + * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @priv: pointer to a driver private data structure
>   * @req_addr: the start address of the range to unmap

Thanks for fixing this!

> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 2a9629377633..0ef837a331d6 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1205,11 +1205,11 @@ struct drm_gpuvm_ops {
>  };
>  
>  int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		     u64 addr, u64 range,
> -		     struct drm_gem_object *obj, u64 offset);
> +		     u64 req_addr, u64 req_range,
> +		     struct drm_gem_object *req_obj, u64 req_offset);
>  
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
> -		       u64 addr, u64 range);
> +		       u64 req_addr, u64 req_range);

Not sure we need to change the argument names though, I'd rather leave them as
they are.

Acked-by: Danilo Krummrich <dakr@kernel.org>


