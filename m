Return-Path: <linux-arm-msm+bounces-67729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62734B1AD42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 06:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 097D91893B50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 04:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFBB21639B;
	Tue,  5 Aug 2025 04:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYFALg3n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0B20CCCA;
	Tue,  5 Aug 2025 04:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369418; cv=none; b=RrZc3tujiOabkLCL3mxqJUj7byp2D93s4mcz3naSmFEQ/db2OYvFA4vtrwh+oZjRXvOXgOQAmM///3jHA772RLzOU5I6JG4fof+ojxNsqiR2XC8OQSjVP6rcnhyFH0htZM5rNOmh5OtzRJ7OtCEuDPN7h+xQZfeNul9FSpOcKK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369418; c=relaxed/simple;
	bh=lULS2E6RBkVGFWW3aExebEAX+iEu+9RQVxkr5znckPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/232Udt4WkCx0C1c7cyRUBtTv++xsyNei9HLrztOLS8NeFu83DF+PLIlOjo0xRaXZZ9YutXC9NabClSvfWhbHNfmCrl3ZxHroLFSiFIuttBG8YGtLyyrv6Zfzs526ftAFXHrN5nWrXJKRjS02J/hyPq5cb7YBpk/GKTjQfAODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYFALg3n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703CAC4CEF4;
	Tue,  5 Aug 2025 04:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754369415;
	bh=lULS2E6RBkVGFWW3aExebEAX+iEu+9RQVxkr5znckPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYFALg3ncbPPhdfOwyjtX2Tx3pDsJ8R/8B/oam59S/XzVqJIXhD4WttdKR/Anw86N
	 GxxzOJaa9nixOHvIIIoA4iSdei7hsZH64inIBibHcBZ7wGENenUgp1EPxjLTMU+KWn
	 wOGX3ZNbA/PhUkOLxvC3wYAG9WQ7D94NsOpOPDuz5HOACi5zci8NuKomTIFVmUU7a1
	 QQOi1yJK9efcBZNR13Upa21BWPj7UDMYqzjeio36rBRYHhqrjsb/OIVqKFSbSlKx2Z
	 +ar30LUWFVG0yy8zZ7if7aHLlggkUPTIvDN3L7rOkidcCsv5cZm+DxhaJfRps52IPE
	 qA8fn7GJes8Cg==
Date: Tue, 5 Aug 2025 10:20:10 +0530
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
Subject: Re: [PATCH v4 3/3] ALSA: compress_offload: Add
 SNDRV_COMPRESS_AVAIL64 ioctl
Message-ID: <aJGNgphPCTuE7FFD@vaman>
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-4-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801092720.1845282-4-verhaegen@google.com>

On 01-08-25, 10:27, Joris Verhaegen wrote:
> The previous patch introduced a 64-bit timestamp ioctl
> (SNDRV_COMPRESS_TSTAMP64). To provide a consistent API, this patch
> adds a corresponding 64-bit version of the SNDRV_COMPRESS_AVAIL ioctl.
> 
> A new struct snd_compr_avail64 is added to the UAPI, which includes
> the 64-bit timestamp. The existing ioctl implementation is refactored
> to handle both the 32-bit and 64-bit variants.
> 
> Reviewed-by: Miller Liang <millerliang@google.com>
> Tested-by: Joris Verhaegen <verhaegen@google.com>
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> ---
>  include/uapi/sound/compress_offload.h | 11 +++++++
>  sound/core/compress_offload.c         | 45 +++++++++++++++++----------
>  2 files changed, 40 insertions(+), 16 deletions(-)
> 
> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> index 70b8921601f9..26f756cc2e62 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -84,6 +84,16 @@ struct snd_compr_avail {
>  	struct snd_compr_tstamp tstamp;
>  } __attribute__((packed, aligned(4)));
>  
> +/**
> + * struct snd_compr_avail64 - avail descriptor with tstamp in 64 bit format
> + * @avail: Number of bytes available in ring buffer for writing/reading
> + * @tstamp: timestamp information
> + */
> +struct snd_compr_avail64 {
> +	__u64 avail;
> +	struct snd_compr_tstamp64 tstamp;
> +} __attribute__((packed, aligned(4)));
> +
>  enum snd_compr_direction {
>  	SND_COMPRESS_PLAYBACK = 0,
>  	SND_COMPRESS_CAPTURE,
> @@ -231,6 +241,7 @@ struct snd_compr_task_status {
>  #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
>  #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
>  #define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
> +#define SNDRV_COMPRESS_AVAIL64		_IOR('C', 0x23, struct snd_compr_avail64)
>  #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
>  #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
>  #define SNDRV_COMPRESS_START		_IO('C', 0x32)
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index 445220fdb6a0..4d3cf49c0c47 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -203,13 +203,10 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
>  }
>  
>  static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
> -		struct snd_compr_avail *avail)
> +				   struct snd_compr_avail64 *avail)
>  {
> -	struct snd_compr_tstamp64 tstamp64 = { 0 };
> -
>  	memset(avail, 0, sizeof(*avail));
> -	snd_compr_update_tstamp(stream, &tstamp64);
> -	snd_compr_tstamp32_from_64(&avail->tstamp, &tstamp64);
> +	snd_compr_update_tstamp(stream, &avail->tstamp);
>  	/* Still need to return avail even if tstamp can't be filled in */
>  
>  	if (stream->runtime->total_bytes_available == 0 &&
> @@ -233,32 +230,47 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
>  	}
>  
>  	avail->avail = stream->runtime->total_bytes_available -
> -			stream->runtime->total_bytes_transferred;
> +		       stream->runtime->total_bytes_transferred;

Lets not do formatting changes in current patch please

>  	if (stream->direction == SND_COMPRESS_PLAYBACK)
>  		avail->avail = stream->runtime->buffer_size - avail->avail;
>  
> -	pr_debug("ret avail as %llu\n", avail->avail);
> +	pr_debug("ret avail as %zu\n", (size_t)avail->avail);
>  	return avail->avail;
>  }
>  
>  static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
>  {
> -	struct snd_compr_avail avail;
> +	struct snd_compr_avail64 avail;
>  
>  	return snd_compr_calc_avail(stream, &avail);
>  }
>  
> -static int
> -snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
> +static void snd_compr_avail32_from_64(struct snd_compr_avail *avail32,
> +				      const struct snd_compr_avail64 *avail64)
>  {
> -	struct snd_compr_avail ioctl_avail;
> +	avail32->avail = avail64->avail;
> +	snd_compr_tstamp32_from_64(&avail32->tstamp, &avail64->tstamp);
> +}
> +
> +static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
> +				 unsigned long arg, bool is_32bit)
> +{
> +	struct snd_compr_avail64 ioctl_avail64;
> +	struct snd_compr_avail ioctl_avail32;
>  	size_t avail;
> +	const void *copy_from = &ioctl_avail64;
> +	size_t copy_size = sizeof(ioctl_avail64);
>  
>  	if (stream->direction == SND_COMPRESS_ACCEL)
>  		return -EBADFD;
>  
> -	avail = snd_compr_calc_avail(stream, &ioctl_avail);
> -	ioctl_avail.avail = avail;
> +	avail = snd_compr_calc_avail(stream, &ioctl_avail64);
> +	ioctl_avail64.avail = avail;
> +	if (is_32bit) {
> +		snd_compr_avail32_from_64(&ioctl_avail32, &ioctl_avail64);
> +		copy_from = &ioctl_avail32;
> +		copy_size = sizeof(ioctl_avail32);
> +	}

Same comment as previous patch

>  
>  	switch (stream->runtime->state) {
>  	case SNDRV_PCM_STATE_OPEN:
> @@ -269,8 +281,7 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
>  		break;
>  	}
>  
> -	if (copy_to_user((__u64 __user *)arg,
> -				&ioctl_avail, sizeof(ioctl_avail)))
> +	if (copy_to_user((__u64 __user *)arg, copy_from, copy_size))
>  		return -EFAULT;
>  	return 0;
>  }
> @@ -1336,7 +1347,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
>  	case SNDRV_COMPRESS_TSTAMP64:
>  		return snd_compr_tstamp(stream, arg, false);
>  	case SNDRV_COMPRESS_AVAIL:
> -		return snd_compr_ioctl_avail(stream, arg);
> +		return snd_compr_ioctl_avail(stream, arg, true);
> +	case SNDRV_COMPRESS_AVAIL64:
> +		return snd_compr_ioctl_avail(stream, arg, false);
>  	case SNDRV_COMPRESS_PAUSE:
>  		return snd_compr_pause(stream);
>  	case SNDRV_COMPRESS_RESUME:
> -- 
> 2.50.1.565.gc32cd1483b-goog

-- 
~Vinod

