Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2983F713E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 10:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238804AbhHYIpi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 04:45:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:21527 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237471AbhHYIpi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 04:45:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="197052570"
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; 
   d="scan'208";a="197052570"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:44:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; 
   d="scan'208";a="494143416"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:44:50 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1mIoZU-0007Sk-SE; Wed, 25 Aug 2021 11:47:44 +0300
Date:   Wed, 25 Aug 2021 11:47:44 +0300
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [igt-dev] [PATCH igt 2/3] msm: Add helper library
Message-ID: <YSYDsJXPPZgTMYzR@platvala-desk.ger.corp.intel.com>
References: <20210824224932.564352-1-robdclark@gmail.com>
 <20210824224932.564352-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210824224932.564352-3-robdclark@gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 24, 2021 at 03:49:31PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Handle some of the boilerplate for tests.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_msm.c   | 163 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_msm.h   | 128 +++++++++++++++++++++++++++++++++++++
>  lib/meson.build |   1 +
>  3 files changed, 292 insertions(+)
>  create mode 100644 lib/igt_msm.c
>  create mode 100644 lib/igt_msm.h
> 
> diff --git a/lib/igt_msm.c b/lib/igt_msm.c
> new file mode 100644
> index 00000000..1bcb08d9
> --- /dev/null
> +++ b/lib/igt_msm.c
> @@ -0,0 +1,163 @@
> +/*
> + * Copyright � 2021 Google, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include <assert.h>
> +#include <string.h>
> +#include <signal.h>
> +#include <errno.h>
> +#include <sys/mman.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/ioctl.h>
> +#include <fcntl.h>
> +
> +#include "drmtest.h"
> +#include "igt_aux.h"
> +#include "igt_core.h"
> +#include "igt_msm.h"
> +#include "ioctl_wrappers.h"
> +
> +/**
> + * SECTION:igt_msm
> + * @short_description: msm support library
> + * @title: msm
> + * @include: igt_msm.h
> + *
> + * This library provides various auxiliary helper functions for writing msm
> + * tests.
> + */
> +
> +struct msm_device *
> +igt_msm_dev_open(void)
> +{
> +	struct msm_device *dev = calloc(1, sizeof(*dev));
> +
> +	dev->fd = drm_open_driver_render(DRIVER_MSM);
> +	if (dev->fd < 0) {
> +		free(dev);
> +		return NULL;
> +	}
> +
> +	return dev;
> +}
> +
> +void
> +igt_msm_dev_close(struct msm_device *dev)
> +{
> +	close(dev->fd);
> +	free(dev);
> +}
> +
> +struct msm_bo *
> +igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags)
> +{
> +	struct msm_bo *bo = calloc(1, sizeof(*bo));
> +
> +	struct drm_msm_gem_new req = {
> +			.size = size,
> +			.flags = flags,
> +	};
> +
> +	bo->dev = dev;
> +	bo->size = size;
> +
> +	do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
> +
> +	bo->handle = req.handle;
> +
> +	return bo;
> +}
> +
> +void
> +igt_msm_bo_free(struct msm_bo *bo)
> +{
> +	if (bo->map)
> +		munmap(bo->map, bo->size);
> +	gem_close(bo->dev->fd, bo->handle);
> +	free(bo);
> +}
> +
> +void *
> +igt_msm_bo_map(struct msm_bo *bo)
> +{
> +	if (!bo->map) {
> +		struct drm_msm_gem_info req = {
> +				.handle = bo->handle,
> +				.info = MSM_INFO_GET_OFFSET,
> +		};
> +		void *ptr;
> +
> +		do_ioctl(bo->dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +
> +		ptr = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
> +				bo->dev->fd, req.value);
> +		if (ptr == MAP_FAILED)
> +			return NULL;
> +
> +		bo->map = ptr;
> +	}
> +	return bo->map;
> +}
> +
> +struct msm_pipe *
> +igt_msm_pipe_open(struct msm_device *dev, uint32_t prio)
> +{
> +	struct msm_pipe *pipe = calloc(1, sizeof(*pipe));
> +	struct drm_msm_submitqueue req = {
> +			.flags = 0,
> +			.prio = prio,
> +	};
> +
> +	pipe->dev = dev;
> +	pipe->pipe = MSM_PIPE_3D0;
> +
> +	/* Note that kerenels prior to v4.15 did not support submitqueues.
> +	 * Mesa maintains support for older kernels, but I do not think
> +	 * that IGT needs to.
> +	 */
> +	do_ioctl(dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_NEW, &req);
> +
> +	pipe->submitqueue_id = req.id;
> +
> +	return pipe;
> +}
> +
> +void
> +igt_msm_pipe_close(struct msm_pipe *pipe)
> +{
> +	do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, &pipe->submitqueue_id);
> +	free(pipe);
> +}
> +
> +uint64_t
> +igt_msm_pipe_get_param(struct msm_pipe *pipe, uint32_t param)
> +{
> +	struct drm_msm_param req = {
> +			.pipe = pipe->pipe,
> +			.param = param,
> +	};
> +
> +	do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_GET_PARAM, &req);
> +
> +	return req.value;
> +}
> diff --git a/lib/igt_msm.h b/lib/igt_msm.h
> new file mode 100644
> index 00000000..0d302e18
> --- /dev/null
> +++ b/lib/igt_msm.h
> @@ -0,0 +1,128 @@
> +/*
> + * Copyright � 2021 Google, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#ifndef IGT_MSM_H
> +#define IGT_MSM_H
> +
> +#include "msm_drm.h"
> +
> +struct msm_device {
> +	int fd;
> +};

Why do you need this wrapper struct?


-- 
Petri Latvala
