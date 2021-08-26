Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BE63F820A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 07:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbhHZF3B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 01:29:01 -0400
Received: from mga01.intel.com ([192.55.52.88]:20623 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhHZF27 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 01:28:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="239863227"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
   d="scan'208";a="239863227"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 22:28:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
   d="scan'208";a="474084920"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 22:28:10 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1mJ7yj-0000VU-VB; Thu, 26 Aug 2021 08:31:05 +0300
Date:   Thu, 26 Aug 2021 08:31:05 +0300
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH igt v2 3/3] msm: Add submit ioctl tests
Message-ID: <YScnGRjPt48cEtF1@platvala-desk.ger.corp.intel.com>
References: <20210825233139.1066504-1-robdclark@gmail.com>
 <20210825233139.1066504-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210825233139.1066504-4-robdclark@gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 25, 2021 at 04:31:39PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an initial set of tests for the submit ioctl.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  tests/meson.build  |   1 +
>  tests/msm_submit.c | 186 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 187 insertions(+)
>  create mode 100644 tests/msm_submit.c
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 1bdfddbb..ff7c709a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -107,6 +107,7 @@ test_progs = [
>  	'vc4_wait_seqno',
>  	'vgem_basic',
>  	'vgem_slow',
> +	'msm_submit',
>  ]
>  
>  i915_progs = [
> diff --git a/tests/msm_submit.c b/tests/msm_submit.c
> new file mode 100644
> index 00000000..da93c574
> --- /dev/null
> +++ b/tests/msm_submit.c
> @@ -0,0 +1,186 @@
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
> +#include "igt.h"
> +#include "igt_msm.h"
> +
> +igt_main
> +{
> +	struct msm_device *dev;
> +	struct msm_pipe *pipe;
> +	struct msm_bo *a, *b;
> +
> +	igt_fixture {
> +		dev = igt_msm_dev_open();

What I replied on 2/3 applies here: If opening the device fails,
igt_msm_dev_open() does not return and 'dev' is left uninitialized,
those other pointers likewise. Leading to...

> +		pipe = igt_msm_pipe_open(dev, 0);
> +		a = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> +		b = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> +	}
> +
> +	igt_subtest("empty-submit") {
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe,
> +				.queueid = pipe->submitqueue_id,
> +		};
> +		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
> +	}
> +
> +	igt_subtest("invalid-queue-submit") {
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe,
> +				.queueid = 0x1234,
> +		};
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, ENOENT);
> +	}
> +
> +	igt_subtest("invalid-flags-submit") {
> +		struct drm_msm_gem_submit req = {
> +				.flags   = 0x1234,
> +				.queueid = pipe->submitqueue_id,
> +		};
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
> +	}
> +
> +	igt_subtest("invalid-in-fence-submit") {
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe | MSM_SUBMIT_FENCE_FD_IN,
> +				.queueid = pipe->submitqueue_id,
> +				.fence_fd = dev->fd,  /* This is not a fence fd! */
> +		};
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
> +	}
> +
> +	igt_subtest("invalid-duplicate-bo-submit") {
> +		struct drm_msm_gem_submit_bo bos[] = {
> +			[0] = {
> +				.handle     = a->handle,
> +				.flags      = MSM_SUBMIT_BO_READ,
> +			},
> +			[1] = {
> +				.handle     = b->handle,
> +				.flags      = MSM_SUBMIT_BO_READ,
> +			},
> +			[2] = {
> +				/* this is invalid.. there should not be two entries
> +				 * for the same bo, instead a single entry w/ all
> +				 * usage flags OR'd together should be used.  Kernel
> +				 * should catch this, and return an error code after
> +				 * cleaning up properly (not leaking any bo's)
> +				 */
> +				.handle     = a->handle,
> +				.flags      = MSM_SUBMIT_BO_WRITE,
> +			},
> +		};
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe,
> +				.queueid = pipe->submitqueue_id,
> +				.nr_bos  = ARRAY_SIZE(bos),
> +				.bos     = VOID2U64(bos),
> +		};
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
> +	}
> +
> +	igt_subtest("invalid-cmd-idx-submit") {
> +		struct drm_msm_gem_submit_cmd cmds[] = {
> +			[0] = {
> +				.type       = MSM_SUBMIT_CMD_BUF,
> +				.submit_idx = 0,      /* bos[0] does not exist */
> +				.size       = 4 * 4,  /* 4 dwords in cmdbuf */
> +			},
> +		};
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe,
> +				.queueid = pipe->submitqueue_id,
> +				.nr_cmds    = ARRAY_SIZE(cmds),
> +				.cmds       = VOID2U64(cmds),
> +		};
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
> +	}
> +
> +	igt_subtest("invalid-cmd-type-submit") {
> +		struct drm_msm_gem_submit_bo bos[] = {
> +			[0] = {
> +				.handle     = a->handle,
> +				.flags      = MSM_SUBMIT_BO_READ,
> +			},
> +		};
> +		struct drm_msm_gem_submit_cmd cmds[] = {
> +			[0] = {
> +				.type       = 0x1234,
> +				.submit_idx = 0,
> +				.size       = 4 * 4,  /* 4 dwords in cmdbuf */
> +			},
> +		};
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe,
> +				.queueid = pipe->submitqueue_id,
> +				.nr_cmds    = ARRAY_SIZE(cmds),
> +				.cmds       = VOID2U64(cmds),
> +				.nr_bos  = ARRAY_SIZE(bos),
> +				.bos     = VOID2U64(bos),
> +		};
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
> +	}
> +
> +	igt_subtest("valid-submit") {
> +		struct drm_msm_gem_submit_bo bos[] = {
> +			[0] = {
> +				.handle     = a->handle,
> +				.flags      = MSM_SUBMIT_BO_READ,
> +			},
> +		};
> +		struct drm_msm_gem_submit_cmd cmds[] = {
> +			[0] = {
> +				.type       = MSM_SUBMIT_CMD_BUF,
> +				.submit_idx = 0,
> +				.size       = 4 * 4,  /* 4 dwords in cmdbuf */
> +			},
> +		};
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe,
> +				.queueid = pipe->submitqueue_id,
> +				.nr_cmds    = ARRAY_SIZE(cmds),
> +				.cmds       = VOID2U64(cmds),
> +				.nr_bos  = ARRAY_SIZE(bos),
> +				.bos     = VOID2U64(bos),
> +		};
> +		uint32_t *cmdstream = igt_msm_bo_map(a);
> +		if (dev->gen >= 5) {
> +			*(cmdstream++) = pm4_pkt7_hdr(CP_NOP, 3);
> +		} else {
> +			*(cmdstream++) = pm4_pkt3_hdr(CP_NOP, 3);
> +		}
> +		*(cmdstream++) = 0;
> +		*(cmdstream++) = 0;
> +		*(cmdstream++) = 0;
> +
> +		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
> +	}
> +
> +	igt_fixture {
> +		igt_msm_bo_free(a);
> +		igt_msm_bo_free(b);
> +		igt_msm_pipe_close(pipe);
> +		igt_msm_dev_close(dev);

... crashes in here.


-- 
Petri Latvala
