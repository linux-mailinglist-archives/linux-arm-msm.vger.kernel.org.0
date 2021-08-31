Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1753FC281
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 08:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhHaGLl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 02:11:41 -0400
Received: from mga01.intel.com ([192.55.52.88]:2159 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhHaGLk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 02:11:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="240658207"
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; 
   d="scan'208";a="240658207"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 23:10:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; 
   d="scan'208";a="498103123"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 23:10:38 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1mKx1e-00022r-L0; Tue, 31 Aug 2021 09:13:38 +0300
Date:   Tue, 31 Aug 2021 09:13:38 +0300
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH igt v3 2/3] msm: Add helper library
Message-ID: <YS3Ikk76W2seZ+9E@platvala-desk.ger.corp.intel.com>
References: <20210830162232.1328594-1-robdclark@gmail.com>
 <20210830162232.1328594-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210830162232.1328594-3-robdclark@gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 30, 2021 at 09:22:31AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Handle some of the boilerplate for tests.
> 
> v2: fix comment, drop unnecessary drm_open_driver_render() error
>     handling, docs fixes, drop igt_msm_pipe_get_param() (for now),
>     handle NULL in destructors
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>  lib/igt_msm.c                                 | 211 ++++++++++++++++++
>  lib/igt_msm.h                                 | 142 ++++++++++++
>  lib/meson.build                               |   1 +
>  4 files changed, 355 insertions(+)
>  create mode 100644 lib/igt_msm.c
>  create mode 100644 lib/igt_msm.h
> 
> diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> index 0f49b4a3..189597c6 100644
> --- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> +++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> @@ -34,6 +34,7 @@
>      <xi:include href="xml/igt_kms.xml"/>
>      <xi:include href="xml/igt_list.xml"/>
>      <xi:include href="xml/igt_map.xml"/>
> +    <xi:include href="xml/igt_msm.xml"/>
>      <xi:include href="xml/igt_pm.xml"/>
>      <xi:include href="xml/igt_primes.xml"/>
>      <xi:include href="xml/igt_rand.xml"/>
> diff --git a/lib/igt_msm.c b/lib/igt_msm.c
> new file mode 100644
> index 00000000..b9534164
> --- /dev/null
> +++ b/lib/igt_msm.c
> @@ -0,0 +1,211 @@
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
> +/**
> + * igt_msm_dev_open:
> + *
> + * Open the msm drm device.
> + */
> +struct msm_device *
> +igt_msm_dev_open(void)
> +{
> +	struct msm_device *dev = calloc(1, sizeof(*dev));
> +
> +	dev->fd = drm_open_driver_render(DRIVER_MSM);
> +	dev->gen = (get_param(dev, MSM_PIPE_3D0, MSM_PARAM_CHIP_ID) >> 24) & 0xff;
> +
> +	return dev;
> +}
> +
> +/**
> + * igt_msm_dev_close:
> + * @dev: the device to close
> + *
> + * Close the msm drm device.
> + */
> +void
> +igt_msm_dev_close(struct msm_device *dev)
> +{
> +	if (!dev)
> +		return;
> +	close(dev->fd);
> +	free(dev);
> +}
> +
> +/**
> + * igt_msm_bo_new:
> + * @dev: the device to allocate the BO from
> + * @size: the requested BO size in bytes
> + * @flags: bitmask of MSM_BO_x
> + *
> + * Allocate a buffer object of the requested size.
> + */
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
> +/**
> + * igt_msm_bo_free:
> + * @bo: the BO to free
> + *
> + * Free a buffer object
> + */
> +void
> +igt_msm_bo_free(struct msm_bo *bo)
> +{
> +	if (!bo)
> +		return;
> +	if (bo->map)
> +		munmap(bo->map, bo->size);
> +	gem_close(bo->dev->fd, bo->handle);
> +	free(bo);
> +}
> +
> +/**
> + * igt_msm_bo_map:
> + * @bo: the BO to map
> + *
> + * Returns a pointer to mmap'd buffer.
> + */
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
> +/**
> + * igt_msm_pipe_open:
> + * @dev: the device to create a submitqueue/pipe against
> + * @prio: the requested priority, from 0 (highest) to MSM_PARAM_PRIORITIES-1
> + *        (lowest)
> + *
> + * Allocate a pipe/submitqueue against which cmdstream may be submitted.
> + */
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
> +	/* Note that kernels prior to v4.15 did not support submitqueues.
> +	 * Mesa maintains support for older kernels, but IGT does not need
> +	 * to.
> +	 */
> +	do_ioctl(dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_NEW, &req);
> +
> +	pipe->submitqueue_id = req.id;
> +
> +	return pipe;
> +}
> +
> +/**
> + * igt_msm_pipe_close:
> + * @pipe: the pipe to close
> + *
> + * Close a pipe
> + */
> +void
> +igt_msm_pipe_close(struct msm_pipe *pipe)
> +{
> +	if (!pipe)
> +		return;
> +	do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, &pipe->submitqueue_id);
> +	free(pipe);
> +}
> diff --git a/lib/igt_msm.h b/lib/igt_msm.h
> new file mode 100644
> index 00000000..99a099c1
> --- /dev/null
> +++ b/lib/igt_msm.h
> @@ -0,0 +1,142 @@
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
> +/**
> + * msm_device:
> + * @fd: the drm device file descriptor
> + * @gen: the device major generation (ie. 2 for a2xx, etc)
> + *
> + * Helper container for device and device related parameters used by tests.
> + */
> +struct msm_device {
> +	int fd;
> +	unsigned gen;
> +};
> +
> +struct msm_device *igt_msm_dev_open(void);
> +void igt_msm_dev_close(struct msm_device *dev);
> +
> +/**
> + * msm_bo:
> + * @dev: the device the BO is allocated from
> + * @handle: the BO's GEM handle
> + * @size: the BO's size
> + * @map: the BO's memory mapping (if mapped)
> + *
> + * Helper wrapper for a GEM buffer object.
> + */
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
> +/**
> + * msm_pipe:
> + * @dev: the device the pipe is allocated from
> + * @pipe: the pipe id
> + * @submitqueue_id: the submitqueue id
> + *
> + * Helper wrapper for a submitqueue for cmdstream submission.
> + */
> +struct msm_pipe {
> +	struct msm_device *dev;
> +	uint32_t pipe;
> +	uint32_t submitqueue_id;
> +};
> +
> +struct msm_pipe *igt_msm_pipe_open(struct msm_device *dev, uint32_t prio);
> +void igt_msm_pipe_close(struct msm_pipe *pipe);
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
