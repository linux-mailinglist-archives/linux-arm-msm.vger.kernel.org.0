Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AAEA44D670
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 13:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhKKMRe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 07:17:34 -0500
Received: from mga18.intel.com ([134.134.136.126]:2570 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230358AbhKKMRd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 07:17:33 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="219791310"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="219791310"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 04:14:44 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="589909354"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 04:14:41 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1ml8xQ-0000rA-UI; Thu, 11 Nov 2021 14:13:32 +0200
Date:   Thu, 11 Nov 2021 14:13:32 +0200
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH igt v2 1/3] lib/igt_debugfs: Add helper for writing
 debugfs files
Message-ID: <YY0I7Ld6xa4vdutc@platvala-desk.ger.corp.intel.com>
References: <20211110184213.649787-1-robdclark@gmail.com>
 <20211110184213.649787-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110184213.649787-2-robdclark@gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 10, 2021 at 10:42:11AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
> v2: Fix headerdoc comments
> 
>  lib/igt_debugfs.c | 17 +++++++++++++++++
>  lib/igt_debugfs.h | 13 +++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a5bb95ca..dd6f2995 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -351,6 +351,23 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
>  	close(dir);
>  }
>  
> +/**
> + * __igt_debugfs_write:
> + * @fd: the drm device file fd
> + * @filename: file name
> + * @buf: buffer to be written to the debugfs file
> + * @size: size of the buffer
> + *
> + * This function opens the debugfs file, writes it, then closes the file.
> + */
> +void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size)
> +{
> +	int dir = igt_debugfs_dir(fd);
> +
> +	igt_sysfs_write(dir, filename, buf, size);
> +	close(dir);
> +}
> +
>  /**
>   * igt_debugfs_search:
>   * @filename: file name
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index d43ba6c6..b4867681 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -40,6 +40,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode);
>  
>  int igt_debugfs_open(int fd, const char *filename, int mode);
>  void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
> +void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
>  int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
>  bool igt_debugfs_search(int fd, const char *filename, const char *substring);
>  
> @@ -54,6 +55,18 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
>  #define igt_debugfs_read(fd, filename, buf) \
>  		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
>  
> +/**
> + * igt_debugfs_write:
> + * @fd: the drm device file fd
> + * @filename: name of the debugfs file
> + * @buf: buffer to be written to the debugfs file
> + *
> + * This is just a convenience wrapper for __igt_debugfs_write. See its
> + * documentation.
> + */
> +#define igt_debugfs_write(fd, filename, buf) \
> +		__igt_debugfs_write(fd, (filename), (buf), sizeof(buf))
> +
>  /*
>   * Pipe CRC
>   */
> -- 
> 2.31.1
> 
