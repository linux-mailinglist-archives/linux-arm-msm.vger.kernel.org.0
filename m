Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B80452955
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 06:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbhKPFEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 00:04:01 -0500
Received: from mga03.intel.com ([134.134.136.65]:57752 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237567AbhKPFDt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 00:03:49 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="233565264"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="233565264"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 21:00:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="604169840"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 21:00:51 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1mmqZO-0001tZ-F4; Tue, 16 Nov 2021 06:59:46 +0200
Date:   Tue, 16 Nov 2021 06:59:46 +0200
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH igt v3 2/4] lib/igt_debugfs: Add helper for detecting
 debugfs files
Message-ID: <YZM6wpV9Yy1/prh2@platvala-desk.ger.corp.intel.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
 <20211116003042.439107-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116003042.439107-3-robdclark@gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 15, 2021 at 04:30:40PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a helper that can be used with, for ex, igt_require() so that tests
> can be skipped if the kernel is too old.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_debugfs.c | 21 +++++++++++++++++++++
>  lib/igt_debugfs.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index dd6f2995..7211c410 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -307,6 +307,27 @@ int igt_debugfs_open(int device, const char *filename, int mode)
>  	return ret;
>  }
>  
> +/**
> + * igt_debugfs_exists:
> + * @device: the drm device file fd
> + * @filename: file name
> + * @mode: mode bits as used by open()
> + *
> + * Test that the specified debugfs file exists and can be opened with the
> + * requested mode.
> + */
> +bool igt_debugfs_exists(int device, const char *filename, int mode)
> +{
> +	int fd = igt_debugfs_open(device, filename, mode);
> +
> +	if (fd >= 0) {
> +		close(fd);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * igt_debugfs_simple_read:
>   * @filename: file name
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index b4867681..37e85067 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -39,6 +39,7 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
>  int igt_debugfs_pipe_dir(int device, int pipe, int mode);
>  
>  int igt_debugfs_open(int fd, const char *filename, int mode);
> +bool igt_debugfs_exists(int fd, const char *filename, int mode);
>  void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
>  void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
>  int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
> -- 
> 2.33.1
> 
