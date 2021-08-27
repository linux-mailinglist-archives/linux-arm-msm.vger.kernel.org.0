Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B348B3F94A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 08:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244220AbhH0G4n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 02:56:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:54026 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234948AbhH0G4m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 02:56:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="278921143"
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; 
   d="scan'208";a="278921143"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 23:55:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; 
   d="scan'208";a="517211995"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 23:55:49 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1mJVp8-0003Uu-K6; Fri, 27 Aug 2021 09:58:46 +0300
Date:   Fri, 27 Aug 2021 09:58:46 +0300
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH igt v2 2/3] msm: Add helper library
Message-ID: <YSiNJjslMJpdQTUj@platvala-desk.ger.corp.intel.com>
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

You need to add

<xi:include href="xml/igt_msm.xml"/>

to docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml so this gets
included, and please add documentation for all nonstatic functions.


-- 
Petri Latvala


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
> +	return get_param(pipe->dev, pipe->pipe, param);
> +}
> diff --git a/lib/igt_msm.h b/lib/igt_msm.h
> new file mode 100644
> index 00000000..614c42ee
> --- /dev/null
> +++ b/lib/igt_msm.h
> @@ -0,0 +1,119 @@
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
> +#ifndef IGT_MSM_H
> +#define IGT_MSM_H
> +
> +#include "msm_drm.h"
> +
> +struct msm_device {
> +	int fd;
> +	unsigned gen;
> +};
> +
> +struct msm_device *igt_msm_dev_open(void);
> +void igt_msm_dev_close(struct msm_device *dev);
> +
> +struct msm_bo {
> +	struct msm_device *dev;
> +	int handle;
> +	uint32_t size;
> +	void *map;
> +};
> +
> +struct msm_bo *igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags);
> +void igt_msm_bo_free(struct msm_bo *bo);
> +void *igt_msm_bo_map(struct msm_bo *bo);
> +
> +struct msm_pipe {
> +	struct msm_device *dev;
> +	uint32_t pipe;
> +	uint32_t submitqueue_id;
> +};
> +
> +struct msm_pipe *igt_msm_pipe_open(struct msm_device *dev, uint32_t prio);
> +void igt_msm_pipe_close(struct msm_pipe *pipe);
> +uint64_t igt_msm_pipe_get_param(struct msm_pipe *pipe, uint32_t param);
> +
> +/*
> + * Helpers for cmdstream building:
> + */
> +
> +enum adreno_pm4_packet_type {
> +	CP_TYPE0_PKT = 0,
> +	CP_TYPE1_PKT = 0x40000000,
> +	CP_TYPE2_PKT = 0x80000000,
> +	CP_TYPE3_PKT = 0xc0000000,
> +	CP_TYPE4_PKT = 0x40000000,
> +	CP_TYPE7_PKT = 0x70000000,
> +};
> +
> +enum adreno_pm4_type3_packets {
> +	CP_NOP = 16,
> +};
> +
> +static inline unsigned
> +pm4_odd_parity_bit(unsigned val)
> +{
> +	/* See: http://graphics.stanford.edu/~seander/bithacks.html#ParityParallel
> +	 * note that we want odd parity so 0x6996 is inverted.
> +	 */
> +	val ^= val >> 16;
> +	val ^= val >> 8;
> +	val ^= val >> 4;
> +	val &= 0xf;
> +	return (~0x6996 >> val) & 1;
> +}
> +
> +static inline uint32_t
> +pm4_pkt0_hdr(uint16_t regindx, uint16_t cnt)
> +{
> +	return CP_TYPE0_PKT | ((cnt - 1) << 16) | (regindx & 0x7fff);
> +}
> +
> +static inline uint32_t
> +pm4_pkt3_hdr(uint8_t opcode, uint16_t cnt)
> +{
> +	return CP_TYPE3_PKT | ((cnt - 1) << 16) | ((opcode & 0xff) << 8);
> +}
> +
> +static inline uint32_t
> +pm4_pkt4_hdr(uint16_t regindx, uint16_t cnt)
> +{
> +	return CP_TYPE4_PKT | cnt | (pm4_odd_parity_bit(cnt) << 7) |
> +			((regindx & 0x3ffff) << 8) |
> +			((pm4_odd_parity_bit(regindx) << 27));
> +}
> +
> +static inline uint32_t
> +pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
> +{
> +	return CP_TYPE7_PKT | cnt | (pm4_odd_parity_bit(cnt) << 15) |
> +			((opcode & 0x7f) << 16) |
> +			((pm4_odd_parity_bit(opcode) << 23));
> +}
> +
> +#define U642VOID(x) ((void *)(uintptr_t)(x))
> +#define VOID2U64(x) ((uint64_t)(uintptr_t)(x))
> +
> +#endif /* IGT_MSM_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 67d40512..c3080fc8 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -82,6 +82,7 @@ lib_sources = [
>  	'igt_eld.c',
>  	'igt_infoframe.c',
>  	'veboxcopy_gen12.c',
> +	'igt_msm.c',
>  ]
>  
>  lib_deps = [
> -- 
> 2.31.1
> 
