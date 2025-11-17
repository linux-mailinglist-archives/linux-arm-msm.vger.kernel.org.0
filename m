Return-Path: <linux-arm-msm+bounces-82070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC9FC638C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 414854F5C03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 10:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FE63271EF;
	Mon, 17 Nov 2025 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8d9Z8eN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="h1+z4cZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA8B31E11C
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374787; cv=none; b=mKGaUdfEu6YI1YR/nO6yNMye9Lus7X6OK1Ml+nGgct0ASOmwMTedb6Sl1r1g+6603eGPU2sQ0U1OviIe95mZllZarb7rUmgRTpF7Ov7RsUKfx1VIyH7wCILu2vTD5CkdIW7m05jc6VRO9Mwd0fgvYZlICFv4J3F3R6fb9K3lLoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374787; c=relaxed/simple;
	bh=L4oSZxGBXivJMe2ukmEHRiFwNHU+FBC0lpsrXgRdbkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qGR1gNntt1fbtewCprYOMsqiD/LTheTBgtGKUWxkwTka0bpvLH8nTj8FW8aD/QohwbzaqyNKANRRTGURLrwHrhA1kNqORkov+9ucZ+DIcWiiu4eF3lu1Wb+tMFx+smbkZoN7KlugQP0KZI1oZT9DkEyXQHXu/dLi03xulUVWc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8d9Z8eN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=h1+z4cZp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763374784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
	b=F8d9Z8eNtsXXt+aH06QSLZJBjfNYAr3S0nI+6M9kfZbnxql9ho1cc6zyRYrn7vJL0LwC4J
	DbWwPODziEgyo0lMgVuNxM23hv/RJ3VfPTwHxAbp3UvH7GB4UyLzFAV1aX9JENl9VMjRbA
	5TZIhEho/TzyO84ipci5sil9QemLd8M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-NwzgUFDaPCmHzzmQ0DkXWg-1; Mon, 17 Nov 2025 05:19:42 -0500
X-MC-Unique: NwzgUFDaPCmHzzmQ0DkXWg-1
X-Mimecast-MFC-AGG-ID: NwzgUFDaPCmHzzmQ0DkXWg_1763374781
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42b2f79759bso2864677f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 02:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763374781; x=1763979581; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
        b=h1+z4cZpZtbZ3GxsH9ESnqDfZiFLB1q+ey7xuSJZVoC++YjAtqZ2NgjwBSvOB6GaG2
         0cdxeGl6Hdhj2XZiVVs30KryJ5iCqZqzDWskcHjpuLoxLQJWhqk30VzYFQ9bPe0B2aL+
         2x7tylaOl72B48i+MflBvP8yYJGQhCipahCinRLK85MU+3aDTtQLnfyMM8Uf+T7GQ//+
         cPVRG3z7e81PBaXoziii0Hw1ymmS8uMI0ruln/jc7QajQoB/Yox4ouDAx6GicLYqB8bU
         t593D8goHww9excW2cHkpVxCPINfUVooTXjchCRYvupElq0XT0Qzij/Dk/3pLYgpib7f
         /RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763374781; x=1763979581;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
        b=R3G0VE8wp/q7fIvmAGOuZ++PjgEC+XPKtzewj/f5fz95ZS9WQb+RHS1G+5PmGzr3lq
         7gTglv4+FbJNNp/4QZaIQNsHGePit4Yn5DRcOdDbd8Uz6MNWdH2hmtMZlj+FCwW/OHI+
         Nf5hYbBuV9tjLumRuSbxkaM0GSv/CRcs4tqck8v7qucyyvag+hTPYVuEdJ3jIVz/e9rt
         07efnnpVAm6dS12FyoxHQJECSSi0tksfpYkV32/DFxTRe2l6gHLNBgHmwP34qkDemy6B
         K+0+XnG8tK0hLb3iyEWDTSUj6LAjPz27vxjTM6rl4ngw7rST0b5MKzro23Xm2hrtk4Ad
         2lGg==
X-Forwarded-Encrypted: i=1; AJvYcCVAjf5Hgys5PVqkbhX+uPMYWWz2NbgseyN3whazWutYxwzNRCUEtbwIhnbbhMZIURgZns+QPtxcOtYKeldA@vger.kernel.org
X-Gm-Message-State: AOJu0YyxW/AEmWSdlIowDRKhXDKVwd7VWs4oP1oV92T9j5Qp7xcMMkpn
	rjjEdOVRCEijj6IhNuIUcNRBzoCpSrOJUTgxDz4i44SE+PnsQIhp/fH5WNhmGKy5W9MtXX6kTBr
	IXDRYI7QNaon4QK4rtNtzOC81AZGj+oXDd1B67ySP/bXgX2tQnZFQKwPg39dihoakHd0=
X-Gm-Gg: ASbGncu3ddLWEvlD4AHZCaXXgC41jH/kvt42CytmOct6Aguk6XoWBfjGzz88Hb9g++n
	bYDcUhriVGQezVNLKnddhKRzhDO+1DSqde3dfWPkIqbnAqUNi9O2kJOYHtJjU/4KZDgTT5kusFG
	KRVIyqSBAJs9m1n7nwRDWQ51LfxPwuw9Ir+tc0XKnCoQ17IKPPWtqBS/K7jXzVC3jROJxR5nLeM
	W+jmVpoiJos54VnwKFBTkJangvJIuXRljf+0y0TmT/mTOxrmOCSP9smUC9ohYeAFtgc5O8xsjnN
	avETwcnpQ1a6qUmEqvc8QzdYBnZxcbjV87tzEUv15Oxfy5TwqCUXlRYBlZFv+t7JCSOoBnFP+pX
	/h6Dn0g3D1dJk0vf+PJBgBDvEcKzIFN+wl3LJ6/oW
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id ffacd0b85a97d-42b593847f2mr10779183f8f.47.1763374780951;
        Mon, 17 Nov 2025 02:19:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuLJzRkeZwRTSmYiDMNFB5b9Y04M5/X3K0AsCLwjmRlR2lS/HTXuIsn1n38y2t71o3SspdXw==
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id ffacd0b85a97d-42b593847f2mr10779119f8f.47.1763374780429;
        Mon, 17 Nov 2025 02:19:40 -0800 (PST)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b8d6sm26377484f8f.28.2025.11.17.02.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:19:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in
 single place
In-Reply-To: <20251027081245.80262-1-tzimmermann@suse.de>
References: <20251027081245.80262-1-tzimmermann@suse.de>
Date: Mon, 17 Nov 2025 11:19:38 +0100
Message-ID: <87ikf9kll1.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Move the calls to drm_fb_helper_alloc_info() from drivers into a
> single place in fbdev helpers. Allocates struct fb_info for a new
> framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> create an fbdev screen buffer. Also release the instance on errors
> by calling drm_fb_helper_release_info().
>
> Simplifies the code and fixes the error cleanup for some of the
> drivers.
>
> Regular release of the struct fb_info instance still happens in
> drm_fb_helper_fini() as before.
>
> v2:
> - remove error rollback in driver implementations (kernel test robot)
> - initialize info in TTM implementation (kernel test robot)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

It simplifies the drivers' code indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


