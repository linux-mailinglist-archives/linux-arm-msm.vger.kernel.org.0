Return-Path: <linux-arm-msm+bounces-44316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEEAA0530F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 07:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE2F27A1467
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 06:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED6A1A00F0;
	Wed,  8 Jan 2025 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hAF3rRrP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F299225D7;
	Wed,  8 Jan 2025 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736316530; cv=none; b=uQzlPZdGxrsf3yXpebz/GZS9eltdDjQI4fv+LgL4nxCBDGzmQjrG6ijp0/WoBnIIZCQWTlDRgBQKlyjlpyd+xtx/9c4C9FFHrEy/HxPa5WE70b2HyaGTspIjwqx/BPRLXUKiDIyJXI9T3gLwc60CrqAy4VnsLqZDnPqInjvI5hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736316530; c=relaxed/simple;
	bh=COkxza++nxxw/A15euRRlm9AH5x9rtH6UknmpWTrAsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt/WB7VZ1XXh1drA/02tB79HQiap0aBO3xVWMf7VFzbtFNEV2jJz/+iKNoMfX4SUwOncgSSX9gBGb+AcurR5QErlne+AhT23aI0g4+9ewFkCxzBPExWvHQ6MdyPH9VA+50vqrKik//YVrIJVuzKbPjNn9bjJ1Nous38HRDEoERM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hAF3rRrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471E7C4CED0;
	Wed,  8 Jan 2025 06:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736316529;
	bh=COkxza++nxxw/A15euRRlm9AH5x9rtH6UknmpWTrAsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAF3rRrPdIK24WlZT7U+tFC5iHGnmmGxuwezwbmN9aj8aF9oN14WnlhdRdrOo71pM
	 mtOYWQpGrV+6UqEF/j58UtGT5JlkVbXyepcxQQoNJlhG1OtDe7jmKLjtnKJ5W1lSCk
	 CNxm6vTh/JCr0RHHPraLW8hzWII7Cg/SYAByR5jg=
Date: Wed, 8 Jan 2025 07:07:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
	quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Fix race condition in MUNMAP
Message-ID: <2025010807-babble-album-7bfd@gregkh>
References: <20250108044802.3829060-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108044802.3829060-1-quic_lxu5@quicinc.com>

On Wed, Jan 08, 2025 at 10:18:02AM +0530, Ling Xu wrote:
> fastrpc_req_munmap involves two steps to unmap memory, first to locates
> a matching fastrpc buf in the list and second is to send request to DSP
> to unmap. There is a potential race condition between two operations
> which can lead to user-after-free scenario.
> Lock unmap request to avoid use-after-free.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..9ad092d3a705 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2117,7 +2117,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  		err = fastrpc_req_mmap(fl, argp);
>  		break;
>  	case FASTRPC_IOCTL_MUNMAP:
> +		mutex_lock(&fl->mutex);
>  		err = fastrpc_req_munmap(fl, argp);
> +		mutex_unlock(&fl->mutex);

Why do you grab a mutex here when this function grabs the spinlock too?
This feels like an odd fix, shouldn't the lock be in the function at the
very least?

thanks,

greg k-h

