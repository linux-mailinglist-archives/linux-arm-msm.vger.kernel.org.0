Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02043F8204
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 07:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhHZF0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 01:26:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:63364 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233575AbhHZF0F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 01:26:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="303249227"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
   d="scan'208";a="303249227"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 22:25:18 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
   d="scan'208";a="456652681"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 22:25:16 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1mJ7vv-0000V5-NY; Thu, 26 Aug 2021 08:28:11 +0300
Date:   Thu, 26 Aug 2021 08:28:11 +0300
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH igt v2 2/3] msm: Add helper library
Message-ID: <YScma3GeDyv+DIVn@platvala-desk.ger.corp.intel.com>
References: <20210825233139.1066504-1-robdclark@gmail.com>
 <20210825233139.1066504-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210825233139.1066504-3-robdclark@gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 25, 2021 at 04:31:38PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Handle some of the boilerplate for tests.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_msm.c   | 171 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_msm.h   | 119 +++++++++++++++++++++++++++++++++
>  lib/meson.build |   1 +
>  3 files changed, 291 insertions(+)
>  create mode 100644 lib/igt_msm.c
>  create mode 100644 lib/igt_msm.h
> 
> diff --git a/lib/igt_msm.c b/lib/igt_msm.c
> new file mode 100644
> index 00000000..3bd0ee53
> --- /dev/null
> +++ b/lib/igt_msm.c
> @@ -0,0 +1,171 @@
> +/*
> + * Copyright © 2021 Google, Inc.
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
> +static uint64_t
> +get_param(struct msm_device *dev, uint32_t pipe, uint32_t param)
> +{
> +	struct drm_msm_param req = {
> +			.pipe = pipe,
> +			.param = param,
> +	};
> +
> +	do_ioctl(dev->fd, DRM_IOCTL_MSM_GET_PARAM, &req);
> +
> +	return req.value;
> +}
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

Note that drm_open_driver_render() cannot return < 0.


> +
> +	dev->gen = (get_param(dev, MSM_PIPE_3D0, MSM_PARAM_CHIP_ID) >> 24) & 0xff;
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

We try to maintain compatibility with older kernels to around "yay
back". If you want to be perfect, this part could produce a skip if
submitqueues don't exist, but most often such dancing is not worth the
trouble. Letting it fail "normally" on an old kernel is fine, the
error message received already points out which ioctl failed. You can
remove the uncertainty from this comment, in other words.

Also typo, kerenels -> kernels.


-- 
Petri Latvala
