Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F08946BA42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 12:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhLGLpE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 06:45:04 -0500
Received: from mga12.intel.com ([192.55.52.136]:4120 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231338AbhLGLpE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 06:45:04 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="217583298"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="217583298"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 03:41:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="605580760"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 03:41:32 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1muYpz-0004Ub-CD; Tue, 07 Dec 2021 13:40:47 +0200
Date:   Tue, 7 Dec 2021 13:40:47 +0200
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Subject: Re: [igt-dev] [PATCH igt 1/2] igt: Split out I/O helpers
Message-ID: <Ya9IP2aW5mHI5v+G@platvala-desk.ger.corp.intel.com>
References: <20211130004324.337399-1-robdclark@gmail.com>
 <20211130004324.337399-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211130004324.337399-2-robdclark@gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 29, 2021 at 04:43:23PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split the readN()/writeN() helpers out into an igt_io module, so they
> can be re-used by tests.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_io.c    | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_io.h    | 33 +++++++++++++++++
>  lib/igt_sysfs.c | 45 +++--------------------
>  lib/meson.build |  1 +
>  4 files changed, 135 insertions(+), 40 deletions(-)
>  create mode 100644 lib/igt_io.c
>  create mode 100644 lib/igt_io.h
> 
> diff --git a/lib/igt_io.c b/lib/igt_io.c
> new file mode 100644
> index 00000000..ad54cbe5
> --- /dev/null
> +++ b/lib/igt_io.c
> @@ -0,0 +1,96 @@
> +/*
> + * Copyright © 2016 Intel Corporation
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
> + *
> + */
> +
> +#include <errno.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +#include "igt_io.h"
> +
> +/**
> + * SECTION:igt_io
> + * @short_description: Helpers for file I/O
> + * @title: io
> + * @include: igt_io.h
> + *
> + * This library provides helpers for file I/O
> + */
> +
> +/**
> + * igt_readn:
> + * @fd: the file descriptor
> + * @buf: buffer where the contents will be stored, allocated by the caller
> + * @size: size of the buffer
> + *
> + * Read from fd into provided buffer until the buffer is full or EOF
> + *
> + * Returns:
> + * -errorno on failure or bytes read on success
> + */
> +ssize_t igt_readn(int fd, char *buf, size_t len)
> +{
> +	ssize_t ret;
> +	size_t total = 0;
> +
> +	do {
> +		ret = read(fd, buf + total, len - total);
> +		if (ret < 0)
> +			ret = -errno;
> +		if (ret == -EINTR || ret == -EAGAIN)
> +			continue;
> +		if (ret <= 0)
> +			break;
> +		total += ret;
> +	} while (total != len);
> +	return total ?: ret;
> +}
> +
> +/**
> + * igt_writen:
> + * @fd: the file descriptor
> + * @buf: the block with the contents to write
> + * @len: the length to write
> + *
> + * This writes @len bytes from @data to the sysfs file.
> + *
> + * Returns:
> + * -errorno on failure or bytes read on success

bytes written.

For this and the read function, s/errorno/errno/

With those,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> + */
> +ssize_t igt_writen(int fd, const char *buf, size_t len)
> +{
> +	ssize_t ret;
> +	size_t total = 0;
> +
> +	do {
> +		ret = write(fd, buf + total, len - total);
> +		if (ret < 0)
> +			ret = -errno;
> +		if (ret == -EINTR || ret == -EAGAIN)
> +			continue;
> +		if (ret <= 0)
> +			break;
> +		total += ret;
> +	} while (total != len);
> +	return total ?: ret;
> +}
> diff --git a/lib/igt_io.h b/lib/igt_io.h
> new file mode 100644
> index 00000000..eb9ffee1
> --- /dev/null
> +++ b/lib/igt_io.h
> @@ -0,0 +1,33 @@
> +/*
> + * Copyright © 2016 Intel Corporation
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
> + *
> + */
> +
> +#ifndef __IGT_IO_H__
> +#define __IGT_IO_H__
> +
> +#include <stdio.h>
> +
> +ssize_t igt_readn(int fd, char *buf, size_t len);
> +ssize_t igt_writen(int fd, const char *buf, size_t len);
> +
> +#endif /* __IGT_IO_H__ */
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index ee75e3ef..f8ef23e2 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -42,6 +42,7 @@
>  #include "igt_core.h"
>  #include "igt_sysfs.h"
>  #include "igt_device.h"
> +#include "igt_io.h"
>  
>  /**
>   * SECTION:igt_sysfs
> @@ -53,42 +54,6 @@
>   * provides basic support for like igt_sysfs_open().
>   */
>  
> -static ssize_t readN(int fd, char *buf, size_t len)
> -{
> -	ssize_t ret;
> -	size_t total = 0;
> -
> -	do {
> -		ret = read(fd, buf + total, len - total);
> -		if (ret < 0)
> -			ret = -errno;
> -		if (ret == -EINTR || ret == -EAGAIN)
> -			continue;
> -		if (ret <= 0)
> -			break;
> -		total += ret;
> -	} while (total != len);
> -	return total ?: ret;
> -}
> -
> -static ssize_t writeN(int fd, const char *buf, size_t len)
> -{
> -	ssize_t ret;
> -	size_t total = 0;
> -
> -	do {
> -		ret = write(fd, buf + total, len - total);
> -		if (ret < 0)
> -			ret = -errno;
> -		if (ret == -EINTR || ret == -EAGAIN)
> -			continue;
> -		if (ret <= 0)
> -			break;
> -		total += ret;
> -	} while (total != len);
> -	return total ?: ret;
> -}
> -
>  /**
>   * igt_sysfs_path:
>   * @device: fd of the device
> @@ -159,7 +124,7 @@ int igt_sysfs_write(int dir, const char *attr, const void *data, int len)
>  	if (igt_debug_on(fd < 0))
>  		return -errno;
>  
> -	len = writeN(fd, data, len);
> +	len = igt_writen(fd, data, len);
>  	close(fd);
>  
>  	return len;
> @@ -185,7 +150,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
>  	if (igt_debug_on(fd < 0))
>  		return -errno;
>  
> -	len = readN(fd, data, len);
> +	len = igt_readn(fd, data, len);
>  	close(fd);
>  
>  	return len;
> @@ -237,7 +202,7 @@ char *igt_sysfs_get(int dir, const char *attr)
>  	if (igt_debug_on(!buf))
>  		goto out;
>  
> -	while ((ret = readN(fd, buf + offset, rem)) == rem) {
> +	while ((ret = igt_readn(fd, buf + offset, rem)) == rem) {
>  		char *newbuf;
>  
>  		newbuf = realloc(buf, 2*len);
> @@ -330,7 +295,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>  		}
>  	}
>  
> -	ret = writeN(fd, buf, ret);
> +	ret = igt_writen(fd, buf, ret);
>  
>  	close(fd);
>  	if (buf != stack)
> diff --git a/lib/meson.build b/lib/meson.build
> index 297b0ad2..b9568a71 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -19,6 +19,7 @@ lib_sources = [
>  	'igt_aux.c',
>  	'igt_gt.c',
>  	'igt_halffloat.c',
> +	'igt_io.c',
>  	'igt_matrix.c',
>  	'igt_params.c',
>  	'igt_perf.c',
> -- 
> 2.33.1
> 
