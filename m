Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B102644D66B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 13:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhKKMQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 07:16:33 -0500
Received: from mga18.intel.com ([134.134.136.126]:2516 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232203AbhKKMQc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 07:16:32 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="219791194"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="219791194"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 04:13:43 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="452682152"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 04:13:38 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1ml8wP-0000qq-1D; Thu, 11 Nov 2021 14:12:29 +0200
Date:   Thu, 11 Nov 2021 14:12:29 +0200
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH igt v2 3/3] msm: Add recovery tests
Message-ID: <YY0IrRC0ZtkQvxJd@platvala-desk.ger.corp.intel.com>
References: <20211110184213.649787-1-robdclark@gmail.com>
 <20211110184213.649787-4-robdclark@gmail.com>
 <CAF6AEGsh4ow448Y5xtt2rnX=zcFCQvqk9Mf59AB_ifmw9mm0Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsh4ow448Y5xtt2rnX=zcFCQvqk9Mf59AB_ifmw9mm0Lw@mail.gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 10, 2021 at 11:00:41AM -0800, Rob Clark wrote:
> On Wed, Nov 10, 2021 at 10:37 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add tests to exercise:
> >
> > 1. sw hangcheck timeout
> > 2. gpu fault (hang) recovery
> > 3. iova fault recovery
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  lib/igt_msm.h        |   3 +
> >  tests/meson.build    |   1 +
> >  tests/msm_recovery.c | 172 +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 176 insertions(+)
> >  create mode 100644 tests/msm_recovery.c
> >
> > diff --git a/lib/igt_msm.h b/lib/igt_msm.h
> > index 1a66c806..421d23ed 100644
> > --- a/lib/igt_msm.h
> > +++ b/lib/igt_msm.h
> > @@ -97,6 +97,9 @@ enum adreno_pm4_packet_type {
> >
> >  enum adreno_pm4_type3_packets {
> >         CP_NOP = 16,
> > +       CP_WAIT_MEM_GTE = 20,
> > +       CP_WAIT_REG_MEM = 60,
> > +       CP_MEM_WRITE = 61,
> >  };
> >
> >  static inline unsigned
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 0af3e03a..166e3494 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -60,6 +60,7 @@ test_progs = [
> >         'kms_vrr',
> >         'kms_writeback',
> >         'meta_test',
> > +       'msm_recovery',
> >         'msm_submit',
> >         'panfrost_get_param',
> >         'panfrost_gem_new',
> > diff --git a/tests/msm_recovery.c b/tests/msm_recovery.c
> > new file mode 100644
> > index 00000000..b71326b8
> > --- /dev/null
> > +++ b/tests/msm_recovery.c
> > @@ -0,0 +1,172 @@
> > +/*
> > + * Copyright © 2021 Google, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including the next
> > + * paragraph) shall be included in all copies or substantial portions of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> > + * IN THE SOFTWARE.
> > + */
> > +
> > +#include <sys/poll.h>
> > +
> > +#include "igt.h"
> > +#include "igt_msm.h"
> > +
> > +static struct msm_device *dev;
> > +static struct msm_bo *scratch_bo;
> > +static uint32_t *scratch;
> > +
> > +/*
> > + * Helpers for cmdstream packet building:
> > + */
> > +
> > +static void
> > +wait_mem_gte(struct msm_cmd *cmd, uint32_t offset_dwords, uint32_t ref)
> > +{
> > +       msm_cmd_pkt7(cmd, CP_WAIT_MEM_GTE, 4);
> > +       msm_cmd_emit(cmd, 0);                              /* RESERVED */
> > +       msm_cmd_bo  (cmd, scratch_bo, offset_dwords * 4);  /* POLL_ADDR_LO/HI */
> > +       msm_cmd_emit(cmd, ref);                            /* REF */
> > +}
> > +
> > +static void
> > +mem_write(struct msm_cmd *cmd, uint32_t offset_dwords, uint32_t val)
> > +{
> > +       msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> > +       msm_cmd_bo  (cmd, scratch_bo, offset_dwords * 4);  /* ADDR_LO/HI */
> > +       msm_cmd_emit(cmd, val);                            /* VAL */
> > +}
> > +
> > +/*
> > + * Helper to wait on a fence-fd:
> > + */
> > +static void
> > +wait_and_close(int fence_fd)
> > +{
> > +       poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
> > +       close(fence_fd);
> > +}
> > +
> > +/*
> > + * Helper for hang tests.  Emits multiple submits, with one in the middle
> > + * that triggers a fault, and confirms that the submits before and after
> > + * the faulting one execute properly, ie. that the driver properly manages
> > + * to recover and re-queue the submits after the faulting submit;
> > + */
> > +static void
> > +do_hang_test(struct msm_pipe *pipe)
> > +{
> > +       struct msm_cmd *cmds[16];
> > +       int fence_fds[ARRAY_SIZE(cmds)];
> > +
> > +       memset(scratch, 0, 0x1000);
> > +
> > +       for (unsigned i = 0; i < ARRAY_SIZE(cmds); i++) {
> > +               struct msm_cmd *cmd = igt_msm_cmd_new(pipe, 0x1000);
> > +
> > +               cmds[i] = cmd;
> > +
> > +               /*
> > +                * Emit a packet to wait for scratch[0] to be >= 1
> > +                *
> > +                * This lets us force the GPU to wait until all the cmdstream is
> > +                * queued up.
> > +                */
> > +               wait_mem_gte(cmd, 0, 1);
> > +
> > +               if (i == 10) {
> > +                       msm_cmd_emit(cmd, 0xdeaddead);
> > +               }
> > +
> > +               /* Emit a packet to write scratch[1+i] = 2+i: */
> > +               mem_write(cmd, 1+i, 2+i);
> > +       }
> > +
> > +       for (unsigned i = 0; i < ARRAY_SIZE(cmds); i++) {
> > +               fence_fds[i] = igt_msm_cmd_submit(cmds[i]);
> > +       }
> > +
> > +       usleep(10000);
> > +
> > +       /* Let the WAIT_MEM_GTE complete: */
> > +       scratch[0] = 1;
> > +
> > +       for (unsigned i = 0; i < ARRAY_SIZE(cmds); i++) {
> > +               wait_and_close(fence_fds[i]);
> > +               igt_msm_cmd_free(cmds[i]);
> > +               if (i == 10)
> > +                       continue;
> > +               igt_assert_eq(scratch[1+i], 2+i);
> > +       }
> > +}
> > +
> > +/*
> > + * Tests for drm/msm hangcheck, recovery, and fault handling
> > + */
> > +
> > +igt_main
> > +{
> > +       static struct msm_pipe *pipe = NULL;
> > +
> > +       igt_fixture {
> > +               dev = igt_msm_dev_open();
> > +               pipe = igt_msm_pipe_open(dev, 0);
> > +               scratch_bo = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> > +               scratch = igt_msm_bo_map(scratch_bo);
> > +       }
> > +
> > +       igt_describe("Test sw hangcheck handling");
> > +       igt_subtest("hangcheck") {
> > +               igt_require(dev->gen >= 6);
> > +
> > +               /* Disable hw hang detection to force fallback to sw hangcheck: */
> > +               igt_debugfs_write(dev->fd, "disable_err_irq", "Y");
> 
> note that this depends on [1].. not sure if there is any constraint
> about landing igt tests before some debugfs they depend on lands
> upstream on the kernel side?
> 
> [1] https://patchwork.freedesktop.org/patch/462625/?series=96725&rev=1

The usual ordering dependency of kernel vs userspace, where both sides
are reviewed and ready to go before anything lands. But then the
actual merging with IGT is not so strict, IGT can go in first as long
as there's a consensus that the required kernel changes are going in
in finite time.

That said, IGT is supposed to do the right thing for kernels some time
back, especially LTS kernels, so this test needs to properly handle
the debugfs file missing regardless of merging order.

Some kind of igt_require check for the debugfs file takes care of
that.


-- 
Petri Latvala




> 
> BR,
> -R
> 
> > +
> > +               do_hang_test(pipe);
> > +
> > +               igt_debugfs_write(dev->fd, "disable_err_irq", "N");
> > +       }
> > +
> > +       igt_describe("Test hw fault handling");
> > +       igt_subtest("gpu-fault") {
> > +               igt_require(dev->gen >= 6);
> > +
> > +               do_hang_test(pipe);
> > +       }
> > +
> > +       igt_describe("Test iova fault handling");
> > +       igt_subtest("iova-fault") {
> > +               struct msm_cmd *cmd;
> > +
> > +               igt_require(dev->gen >= 6);
> > +
> > +               cmd = igt_msm_cmd_new(pipe, 0x1000);
> > +
> > +               msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> > +               msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
> > +               msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
> > +               msm_cmd_emit(cmd, 0x123);                /* VAL */
> > +
> > +               wait_and_close(igt_msm_cmd_submit(cmd));
> > +       }
> > +
> > +       igt_fixture {
> > +               igt_msm_bo_free(scratch_bo);
> > +               igt_msm_pipe_close(pipe);
> > +               igt_msm_dev_close(dev);
> > +       }
> > +}
> > --
> > 2.31.1
> >
