Return-Path: <linux-arm-msm+bounces-67728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42DB1AD39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 06:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCD877A7C56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 04:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E22A212B31;
	Tue,  5 Aug 2025 04:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJMyP2nV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D584201269;
	Tue,  5 Aug 2025 04:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369284; cv=none; b=eUGk6mZaxWx4ryhXs0oTmXVvQJx5XyHF4pv/tyMmvU80+aln4s3nigegKE9s/kxeImeUMhX7EE5AHSykkeNzyPaSFi9MMlx2XUMDhClcplZ3tuNCl/ZwAF8q98dwlRT+swm//ze7PHv9eaE494UK0LXw+euBsbMKzT4TPwquRng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369284; c=relaxed/simple;
	bh=LoCncB0T59vM/YkkVlcIhEh0yb/IFkNXHSj+2ArsmPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJsiwjyrrQSWbNkAWFmx1qNbEfZAqYQzgMVX3YzWC0FNsLc5IPftWNV9/KnVAihKBDnystW2lZItXOqe9J3esJOGG/9f3OrsVqdFP939bkzSzNmoq6YA+LS+S01zDiup5ZwI8UjDOUAjZtl64yrHDsfw6iRK/IscFY2+CQ8hMWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJMyP2nV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D26AC4CEF4;
	Tue,  5 Aug 2025 04:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754369283;
	bh=LoCncB0T59vM/YkkVlcIhEh0yb/IFkNXHSj+2ArsmPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJMyP2nVjI/Ojpw0jHVvM/d0xQcdh27oI035+1DsLhGY/TKIo32vUwNMs4ckKFHc4
	 axcsxLeAv1bXze6etwdJ4n1hWERU64YNBZjPSK4RjpRLHi8snQOIaUITjlfPWWTYbr
	 p4TicsKIwuOPmfSsgbcCioAdOEVvzDjKREzufyx7LRuaBbczue4ZMejrKlnmJkyL2a
	 v2SFWE/b8yvpjsSqQNzz2/gA/ArQxTIL+cD2nutLf/7cHWWJm5u1v1Gfg25SMyYpQA
	 qfE/TbBlQmYuEd5VmJSDV9BN9vfFctr+aV4yq5XpbisNCX59O06ylNJFbt4DRHhYEz
	 uSKUrKmO2twSw==
Date: Tue, 5 Aug 2025 10:17:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add
 SNDRV_COMPRESS_TSTAMP64 ioctl
Message-ID: <aJGM2zXS6hOLDFm1@vaman>
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801092720.1845282-3-verhaegen@google.com>

On 01-08-25, 10:27, Joris Verhaegen wrote:
> The previous patch introduced the internal infrastructure for handling
> 64-bit timestamps. This patch exposes this capability to user-space.
> 
> Define the new ioctl command SNDRV_COMPRESS_TSTAMP64, which allows
> applications to fetch the overflow-safe struct snd_compr_tstamp64.
> 
> The ioctl dispatch table is updated to handle the new command by
> calling a new snd_compr_tstamp64 handler, while the legacy path is
> renamed to snd_compr_tstamp32 for clarity.
> 
> This patch bumps the SNDRV_COMPRESS_VERSION to 0.4.0.
> 
> Reviewed-by: Miller Liang <millerliang@google.com>
> Tested-by: Joris Verhaegen <verhaegen@google.com>
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> ---
>  include/uapi/sound/compress_offload.h |  5 +++--
>  sound/core/compress_offload.c         | 19 +++++++++++++------
>  2 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> index abd0ea3f86ee..70b8921601f9 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -13,8 +13,7 @@
>  #include <sound/asound.h>
>  #include <sound/compress_params.h>
>  
> -
> -#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
> +#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
>  /**
>   * struct snd_compressed_buffer - compressed buffer
>   * @fragment_size: size of buffer fragment in bytes
> @@ -208,6 +207,7 @@ struct snd_compr_task_status {
>   * Note: only codec params can be changed runtime and stream params cant be
>   * SNDRV_COMPRESS_GET_PARAMS: Query codec params
>   * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
> + * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
>   * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
>   * This also queries the tstamp properties
>   * SNDRV_COMPRESS_PAUSE: Pause the running stream
> @@ -230,6 +230,7 @@ struct snd_compr_task_status {
>  						 struct snd_compr_metadata)
>  #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
>  #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
> +#define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
>  #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
>  #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
>  #define SNDRV_COMPRESS_START		_IO('C', 0x32)
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index d3164aa07158..445220fdb6a0 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -736,18 +736,23 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
>  	return retval;
>  }
>  
> -static inline int
> -snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
> +static inline int snd_compr_tstamp(struct snd_compr_stream *stream,
> +				   unsigned long arg, bool is_32bit)
>  {
>  	struct snd_compr_tstamp64 tstamp64 = { 0 };
>  	struct snd_compr_tstamp tstamp32 = { 0 };
> +	const void *copy_from = &tstamp64;
> +	size_t copy_size = sizeof(tstamp64);
>  	int ret;
>  
>  	ret = snd_compr_update_tstamp(stream, &tstamp64);
>  	if (ret == 0) {
> -		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> -		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
> -				   &tstamp32, sizeof(tstamp32)) ?
> +		if (is_32bit) {
> +			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> +			copy_from = &tstamp32;
> +			copy_size = sizeof(tstamp32);
> +		}

Most of the applications and people would be 32bit right now and we
expect this to progressively change, but then this imposes a penalty as
default path is 64 bit, since we expect this ioctl to be called very
frequently, should we do this optimization for 64bit here?

> +		ret = copy_to_user((void __user *)arg, copy_from, copy_size) ?
>  			      -EFAULT :
>  			      0;
>  	}
> @@ -1327,7 +1332,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
>  
>  	switch (cmd) {
>  	case SNDRV_COMPRESS_TSTAMP:
> -		return snd_compr_tstamp(stream, arg);
> +		return snd_compr_tstamp(stream, arg, true);
> +	case SNDRV_COMPRESS_TSTAMP64:
> +		return snd_compr_tstamp(stream, arg, false);
>  	case SNDRV_COMPRESS_AVAIL:
>  		return snd_compr_ioctl_avail(stream, arg);
>  	case SNDRV_COMPRESS_PAUSE:
> -- 
> 2.50.1.565.gc32cd1483b-goog

-- 
~Vinod

