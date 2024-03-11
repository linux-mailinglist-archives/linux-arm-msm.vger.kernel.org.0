Return-Path: <linux-arm-msm+bounces-13872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36061878A38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 22:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE7B3B20D12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 21:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2591B56B77;
	Mon, 11 Mar 2024 21:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gTEP+qU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2B856B6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710193935; cv=none; b=f3UepLjmmJsoDyVI3jo/LcPy8MJ/RPoNE22961Zz6TWEpXKrj13NJ7DJiwTy2DERJnt+uHR0PC7z3kIPMlhHK/aKqYr62xa3mLRWgyeOVEgEU5x8TPZL/Bb25alQ3egWvc9Q4DqWZdC8CFj83LAbhqKj7kYo9I7QK0VTI4W4vII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710193935; c=relaxed/simple;
	bh=G3PsOHFrYJtHkNhKadH4zMG3Rkf5nMiw+jz9fku5Ijs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hds+/97bIoaH7cnxg+ws8JHIWmRSZ2uVBHdy3tEZe6S5zeBc8/DrFyAiDBqUN4iI5Udt+MEKeNZe1x4Jz/wHJkSjqYn6hBqeGfu+sTbGQrNsLeO1fkJxUE9PZhSpLTqd3J9jacrtHwc3hxTAamIm4VeQ0V3Q9972rC7+sH7p0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gTEP+qU+; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <03fe26b2-1b6b-49c8-ac34-e90c76562114@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1710193930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3PsOHFrYJtHkNhKadH4zMG3Rkf5nMiw+jz9fku5Ijs=;
	b=gTEP+qU+CrDNEe+UqbIGyHEDITEIH6ZCbnXqkhAaC/NEp/42LkFaVLwHPSvhKmRFh4EXoK
	7wAIXQFNQ8YGzxV+NiKnK3uIzUx+SctMmQPXRsxBs27pV4tQA3PPx+ydlh7ZPc6jVOlLSV
	NKQQ0EZZCwY6ASqyrph/T80T22GVoQ4=
Date: Tue, 12 Mar 2024 05:51:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [09/13] drm/gem: Acquire reservation lock in
 drm_gem_{pin/unpin}()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 christian.koenig@amd.com, sumit.semwal@linaro.org,
 dmitry.osipenko@collabora.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240227113853.8464-10-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240227113853.8464-10-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/2/27 18:14, Thomas Zimmermann wrote:
> Acquire the buffer object's reservation lock in drm_gem_pin() and
> remove locking the drivers' GEM callbacks where necessary. Same for
> unpin().
>
> DRM drivers and memory managers modified by this patch will now have
> correct dma-buf locking semantics: the caller is responsible for
> holding the reservation lock when calling the pin or unpin callback.
>
> DRM drivers and memory managers that are not modified will now be
> protected against concurent invocation of their pin and unpin callbacks.

'concurent' -> 'concurrent'

> PRIME does not implement struct dma_buf_ops.pin, which requires
> the caller to hold the reservation lock. It does implement struct
> dma_buf_ops.attach, which requires to callee to acquire the
> reservation lock.

which requires 'the' callee to acquire the reservation lock.


> The PRIME code uses drm_gem_pin(), so locks
> are now taken as specified. Same for unpin and detach.
>
> The patch harmonizes GEM pin and unpin to have non-interruptible
> reservation locking across all drivers, as is already the case for
> vmap and vunmap. This affects gem-shmem, gem-vram, loongson, qxl and
> radeon.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>


Tested with drm/loongson, play with a few days.
Switch to virtual terminal, then switch back is fine.
not found problems yet. So,

Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>


