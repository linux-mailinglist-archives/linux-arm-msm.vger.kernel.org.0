Return-Path: <linux-arm-msm+bounces-74026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74463B82F25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 07:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8DB5582110
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643FE27B4EE;
	Thu, 18 Sep 2025 05:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJb2KZ7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307B627B329;
	Thu, 18 Sep 2025 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172112; cv=none; b=on2XJz46i8mLSH7HIepsFHQ7X6jf5earZ6j9spgAdJeB7PHoKieN6Q6H9vD8Kpjl3mJbruAiX3dbVxYig5CV1SJSZl0mLWsH76Ky6CsmEQKnjxRLnDav8htAHx4l108d9+qtZ5cIQ8qjnqPkG4yLk6UEtXHBTvJ5cOh0UsVroFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172112; c=relaxed/simple;
	bh=g0Yl0HZreixQIp/x026YoO8ClPu4R9wzUUN3zv779gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQv2aCfGXzUxc2XimQ+6FQ7e3/CVDHOanxK2h5OTRWKTpSjwYm8Xmtfn2UuLSDQp9XmEtqEzT9LI+Oktx8g84O/KvbGFo1DczrV6erQMXK2J9mVJ/PGdzDRj8nWmRDaDa1YmQN6IT5C9MUiAL60UfkuUSFQ5VHy/NF0hDpQDvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJb2KZ7E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34CAC4CEE7;
	Thu, 18 Sep 2025 05:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758172111;
	bh=g0Yl0HZreixQIp/x026YoO8ClPu4R9wzUUN3zv779gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJb2KZ7EiqJUsQr8Esi7iOvQyOj0k0VvXE47RxRVYMWBffcGgwRpdlG37qt6lqJZj
	 iw+ssQSJ96FEWD3Ux57ruN7kLhQm8iiHxYqobY4WnRyz4O86tuhb2R7ojYc7sTYNAI
	 T6FJParP6saQvZAZKou95ORF+pHT8azhRLFkAFX11UPrSo3LB5lGMjJmJ5DWSkV183
	 9lsRGE3iWPX7LJDKjXP7WiXw0zxjnNxIjJPwN36SBM4wQhjXZN/DbqnVtMhnvCDkFw
	 /UXflwX9h2doKieVzH9tu3t/o2arPx/HVdy3elhmeXui72Br4tytZPuPz4z0DxzqpB
	 WQ7fHd4ogswMg==
Date: Thu, 18 Sep 2025 10:38:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Patrick Lai <plai@qti.qualcomm.com>,
	Annemarie Porter <annemari@quicinc.com>,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel@oss.qualcomm.com,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v3 1/3] ALSA: compress: add raw opus codec define and
 opus decoder structs
Message-ID: <aMuTyZy50IvpAEG9@vaman>
References: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
 <20250917-opus_codec_rfc_v1-v3-1-7737ad40132e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-opus_codec_rfc_v1-v3-1-7737ad40132e@linaro.org>

On 17-09-25, 08:32, Alexey Klimov wrote:
> Adds a raw opus codec define and raw opus decoder structs.
> This is for raw OPUS packets not packed in any type of container
> (for instance OGG container). The decoder struct fields are
> taken from corresponding RFC document: RFC 7845 Section 5.
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Co-developed-by: Annemarie Porter <annemari@quicinc.com>
> Signed-off-by: Annemarie Porter <annemari@quicinc.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  include/uapi/sound/compress_params.h | 43 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> index bc7648a30746f4632ecf6695868e79550a431dfa..faf4fa911f7fc2830c3ae42b93650fe40d8a776b 100644
> --- a/include/uapi/sound/compress_params.h
> +++ b/include/uapi/sound/compress_params.h
> @@ -43,7 +43,8 @@
>  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> +#define SND_AUDIOCODEC_OPUS_RAW              ((__u32) 0x00000011)
> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS_RAW
>  
>  /*
>   * Profile and modes are listed with bit masks. This allows for a
> @@ -324,6 +325,45 @@ struct snd_dec_ape {
>  	__u32 seek_table_present;
>  } __attribute__((packed, aligned(4)));
>  
> +/**
> + * struct snd_dec_opus - Opus decoder parameters (raw opus packets)
> + * @version: Usually should be '1' but can be split into major (4 upper bits)
> + * and minor (4 lower bits) sub-fields.

Please clarify, if that should be 1.0 so a value of 0x10

> + * @num_channels: Number of output channels.
> + * @pre_skip: Number of samples to discard at 48 kHz.
> + * @sample_rate: Sample rate of original input.
> + * @output_gain: Gain to apply when decoding (in Q7.8 format).
> + * @mapping_family: Order and meaning of output channels. Only values 0 and 1
> + * are expected; values 2..255 are not recommended for playback.
> + *
> + * Optional channel mapping table. Describes mapping of opus streams to decoded
> + * channels.
> + * @struct snd_dec_opus_ch_map
> + *	@stream_count: Number of streams encoded in each Ogg packet.
> + *	@coupled_count: Number of streams whose decoders are used for two
> + *		channels.
> + *	@channel_map: describes which decoded channel to be used for each one.
> + *		See RFC doc for details.
> + *		This supports only mapping families 0 and 1, therefore max
> + *		number of channels is 8.
> + *
> + * These options were extracted from RFC7845 Section 5.
> + */
> +
> +struct snd_dec_opus {
> +	__u8 version;
> +	__u8 num_channels;
> +	__u16 pre_skip;
> +	__u32 sample_rate;
> +	__u16 output_gain;
> +	__u8 mapping_family;
> +	struct snd_dec_opus_ch_map {
> +		__u8 stream_count;
> +		__u8 coupled_count;
> +		__u8 channel_map[8];
> +	} chan_map;
> +} __attribute__((packed, aligned(4)));
> +
>  union snd_codec_options {
>  	struct snd_enc_wma wma;
>  	struct snd_enc_vorbis vorbis;
> @@ -334,6 +374,7 @@ union snd_codec_options {
>  	struct snd_dec_wma wma_d;
>  	struct snd_dec_alac alac_d;
>  	struct snd_dec_ape ape_d;
> +	struct snd_dec_opus opus_d;
>  	struct {
>  		__u32 out_sample_rate;
>  	} src_d;
> 
> -- 
> 2.47.3

-- 
~Vinod

