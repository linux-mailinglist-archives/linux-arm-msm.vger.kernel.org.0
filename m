Return-Path: <linux-arm-msm+bounces-70057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B48DCB2ED5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 07:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71E271BC7325
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 05:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D717FBA2;
	Thu, 21 Aug 2025 05:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aa7TKd2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939103C17;
	Thu, 21 Aug 2025 05:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755752508; cv=none; b=cC0CJdywophzQmDluPpoQQ1i/Wtgtk9/YeSl+38xmIML3SmcP9Whh/M9yn5wSoiGnyMZLab1kQxzPeRPN8TfFgACKYfZtZSW1nUg/wLgCYErob239T5zwbYZf9VD0URkEE8U27wioZWWFNDnVA8lIwHhr8XqzWDZe6mned+OvrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755752508; c=relaxed/simple;
	bh=y17oh05KWAMEIEy/khXMdgn0rc3Brufsz34KAhUY4M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kltiYnDqNChB6ZA9i5aGDqRSSu/gJMQVUSrj2V6NjlT3bBbHu7h7FMXaVRSXCwA+aZo6oq90aMVIb3mVL5Hx+tsqVPZBj4JIcrgen5vgpkDMYthwDJZmIU0MGfc4hoIPaeu1SKbDosXXNkS4MJrOpZHc1lS+hmbqLLbHEoZq+Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aa7TKd2u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CC5C4CEED;
	Thu, 21 Aug 2025 05:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755752508;
	bh=y17oh05KWAMEIEy/khXMdgn0rc3Brufsz34KAhUY4M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aa7TKd2u1Ezy8RbzW0I66PiwqfKtxCBwOLp29CdY3Tq+faAXGHShoUUkvINvAltVF
	 OymjuuvUyoekaK0Qt5v2s5TBkzcO6xxpmVd8YZu+/WZZKRLamaJ7PHySZ66PpB3hi+
	 2Lbzd8X/pC/yHs59kufy83AXMXcdqn53EylLJOyADkQScBtgiiQQSzSMza/ty6tUAz
	 vVEMhw01P4xtLmDZzo5nczr3Oq5yyZoaTrhJQ/jFyF60uPCImSylHUPVqfKrHtY3z6
	 p536P8LhTlj+PTjGASRZ3FOgQrnNpYuBAYpxPaEbitWKd86S1A/qLZ9ZXJoJuPJCBG
	 zqP8fExOZj9Pg==
Date: Thu, 21 Aug 2025 10:31:43 +0530
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
Subject: Re: [PATCH 1/2] ALSA: compress: add raw opus codec define and opus
 decoder structs
Message-ID: <aKaoN7CmnXfojq-5@vaman>
References: <20250820-opus_codec_rfc_v1-v1-0-54d5c7560856@linaro.org>
 <20250820-opus_codec_rfc_v1-v1-1-54d5c7560856@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-opus_codec_rfc_v1-v1-1-54d5c7560856@linaro.org>

On 20-08-25, 22:15, Alexey Klimov wrote:
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

we should bump API minor version with this

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

Please define bits, this is an ABI so needs to be properly defined

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
> 2.47.2

-- 
~Vinod

