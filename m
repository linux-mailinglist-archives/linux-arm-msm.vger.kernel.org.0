Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 486D94590A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 11:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfFNJnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 05:43:49 -0400
Received: from mga04.intel.com ([192.55.52.120]:54300 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727038AbfFNJnt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 05:43:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jun 2019 02:43:49 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2019 02:43:46 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Nathan Huckleberry <nhuck@google.com>, jsanka@codeaurora.org,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com
Subject: Re: Cleanup of -Wunused-const-variable in drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
In-Reply-To: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
Date:   Fri, 14 Jun 2019 12:46:44 +0300
Message-ID: <875zp8wlbv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Jun 2019, Nathan Huckleberry <nhuck@google.com> wrote:
> Hey all,
>
> I'm looking into cleaning up ignored warnings in the kernel so we can
> remove compiler flags to ignore warnings.

Wholeheartedly agreed on the goal.

> There are several unused variables in dpu_formats.c
> ('dpu_format_map_tile', 'dpu_format_map_p010',
> 'dpu_format_map_p010_ubwc', 'dpu_format_map_tp10_ubwc').
> They look like modifiers that were never implemented. I'd like to
> remove these variables if there are no plans moving forward to
> implement them. Otherwise I'll just leave them.
>
> https://github.com/ClangBuiltLinux/linux/issues/528

No opinion on the said variables above, but, FWIW, personally I think
it's fine to add the cflags to supress warnings locally where needed in
order to be able to achieve the greater goal of removing the cflags
globally.

In drivers/gpu/drm/i915/Makefile we actually go for much stricter
warnings than the kernel defaults, and disable a more limited and
tailored set of warnings.

You can do this both on a subdir and file level with subdir-ccflags-y
and CFLAGS_filename.o, respectively.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
