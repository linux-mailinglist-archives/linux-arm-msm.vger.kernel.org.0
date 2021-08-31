Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8269A3FC282
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 08:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhHaGOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 02:14:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:64193 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhHaGOM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 02:14:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="205540186"
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; 
   d="scan'208";a="205540186"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 23:13:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; 
   d="scan'208";a="687546953"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 23:13:15 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1mKx4B-00023j-Hd; Tue, 31 Aug 2021 09:16:15 +0300
Date:   Tue, 31 Aug 2021 09:16:15 +0300
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH igt v3 3/3] msm: Add submit ioctl tests
Message-ID: <YS3JL6lDT8ZdBNWJ@platvala-desk.ger.corp.intel.com>
References: <20210830162232.1328594-1-robdclark@gmail.com>
 <20210830162232.1328594-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210830162232.1328594-4-robdclark@gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 30, 2021 at 09:22:32AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an initial set of tests for the submit ioctl.
> 
> v2: Add NULL inits, igt_describe()
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  tests/meson.build  |   1 +
>  tests/msm_submit.c | 194 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 195 insertions(+)
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

Alphabetical order for this please.

When more msm-specific tests start appearing, consider an msm
subdirectory. Not needed for now.


Acked-by: Petri Latvala <petri.latvala@intel.com>



>  ]
>  
>  i915_progs = [
> diff --git a/tests/msm_submit.c b/tests/msm_submit.c
> new file mode 100644
> index 00000000..95f8318f
> --- /dev/null
> +++ b/tests/msm_submit.c
> @@ -0,0 +1,194 @@
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
> +	struct msm_device *dev = NULL;
> +	struct msm_pipe *pipe = NULL;
> +	struct msm_bo *a = NULL, *b = NULL;
> +
> +	igt_fixture {
> +		dev = igt_msm_dev_open();
> +		pipe = igt_msm_pipe_open(dev, 0);
> +		a = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> +		b = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> +	}
> +
> +	igt_describe("Check that a valid empty submit succeeds");
> +	igt_subtest("empty-submit") {
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe,
> +				.queueid = pipe->submitqueue_id,
> +		};
> +		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
> +	}
> +
> +	igt_describe("Check that submit with invalid submitqueue id fails");
> +	igt_subtest("invalid-queue-submit") {
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe,
> +				.queueid = 0x1234,
> +		};
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, ENOENT);
> +	}
> +
> +	igt_describe("Check that submit with invalid flags fails");
> +	igt_subtest("invalid-flags-submit") {
> +		struct drm_msm_gem_submit req = {
> +				.flags   = 0x1234,
> +				.queueid = pipe->submitqueue_id,
> +		};
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
> +	}
> +
> +	igt_describe("Check that submit with invalid in-fence fd fails");
> +	igt_subtest("invalid-in-fence-submit") {
> +		struct drm_msm_gem_submit req = {
> +				.flags   = pipe->pipe | MSM_SUBMIT_FENCE_FD_IN,
> +				.queueid = pipe->submitqueue_id,
> +				.fence_fd = dev->fd,  /* This is not a fence fd! */
> +		};
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
> +	}
> +
> +	igt_describe("Check that submit with duplicate bo fails");
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
> +	igt_describe("Check that submit with cmdstream referencing an invalid bo fails");
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
> +	igt_describe("Check that submit with invalid cmdstream type fails");
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
> +	igt_describe("Check that a valid non-empty submit succeeds");
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
> +	}
> +}
> -- 
> 2.31.1
> 
