Return-Path: <linux-arm-msm+bounces-59800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A800AC7B07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B6C1BC6991
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC8121C9E0;
	Thu, 29 May 2025 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGct+kP8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07069214232;
	Thu, 29 May 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510974; cv=none; b=YS9z/0yAqRLcCprsOLXijul3G1zzf2euX1V82dwP2D62ZQxDKACav1f+Wdl2KTPK0pg7lhHwzMt7m3wKE/a2/V9ZpmKTMYUK0Dvo+TjdQIaGRHD+0dYdjFBhBslgEacTyHjS/zTkKTlW4MH+3m+Q7udrdCVHT5keNUQcArL52wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510974; c=relaxed/simple;
	bh=1tBBO+cgXcp5OfaiJhEIefeBs/Dvbl63v8GotYrHEG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2zDMEFYEdAyrvpUfTyaF4c/gB5ZeHjqXW3kUblfUDZOSxBIDihZig6ioi+xWaz01rAG+EDy9/9OzHXx4al1NMUgvaPGePz770jatDg6KrjJ+4CDoGOZzniEQ4a8FMksEPNXSa0FovSs0LG8AJT1BMeK4vkO0bDCKOlGBLL3c7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGct+kP8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a375e72473so379603f8f.0;
        Thu, 29 May 2025 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748510971; x=1749115771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukmwsK7wLoEmd7Mwc9Kn6d/asl3JL4qrg1VLtN/yAWY=;
        b=aGct+kP8YCz2M8np2mXiFhjTuIVseGfeyKqI1mIjsBK0boBPLWk9k09VwuZFvuYQhV
         tQ066NQN3/mcqgbyk/F9raOxzz3WltVSatq7XSejWw3fHZwNuhuXZ9umrD54K3thl8zb
         ubA0XNG0UCzOCqdcNfTXpTEUL05heVHEb+WTilxbas1z//R1H+0TdDoPbl9YwkzECpYp
         ppdzXyB9Q7N+ZxJNO7JvgtY8EsEjrN+aHQhZrc5yyfF7Otawvuef2CARlvSzrxn5aXQA
         44E0c4haLqIqoDce9G9B63TXmkg+AzTgpc/60jHnKn62An3MpvAnKKu6J0tYsHET7N5c
         vd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510971; x=1749115771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukmwsK7wLoEmd7Mwc9Kn6d/asl3JL4qrg1VLtN/yAWY=;
        b=fmF9BHy+FAFF3DYQp34bE52785JMX2mhN/TEF0d1vJ91lFLlB9nwS0FN9gF0OTizDQ
         wXfMvN2KizImrE1UksN/W3UMpEIOOosKGyJhBz/bis8TZcx2Ky5n8ZuVH19Dp9u2zvjY
         ZZNe+aJjDEIiHqa5Br4DjYoY0YR27X03rP+GEBb/uJ8kxlsL+d1iOwTSB+f3NQ5nYB/4
         oECinbU/mjsGDs4mQwVCcRYYCD2wHWwE5Yq3z1RatZNvPBXoeFrgVNKr4yQkyTDDSeVb
         4eVdyooOlo1EYvxq4WJY0HBSM9Fwrs3lWeJWy7/dUhos8W1IDDPNi9IIeFYFqF/PSTAz
         8dSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZkUgCkxvV0Ez/d0lHkE4S7gB/RL3KH5Ijz37boHmBJNLQQXnNCXeve5+0Bh2xoNe3bGosKVlYEsVQtXqO@vger.kernel.org, AJvYcCWUFw7Tvg/naW0runkbd2d/djjqGLFqEZXuTFDBjch+8OZd9ZCygkHqMndoeAb6P0NYDY0ED15YguVVaTJm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5IDhcgNTdkkv1+pAxnPrpFP8A4VK3+CwmoB3hgjPF18qQJ2qf
	SI7z6JPMH3hLD6CkJ859dMR5S8Q/or7JKb7KBtcaa6Cfij1JQ5yRUyNz
X-Gm-Gg: ASbGncv6iD3qzBJ7RFKC0yHYmWKx8IfYy8tbf58r25gOPVXVwTIRw4LURF6JY429vfZ
	yMagSyneWDPl51ocEgUiEfOet4D99cSbAXh2UAeR3LBG1kC2o8/n6DZCDq7uAXG2W1ggNwcWYEI
	knb9Es7FtTFo5nHpogheJk3MRNt92RRVLDUwSEvblcYt6GB+mPmRU36nVwyTBF+tqm4U8PeIqX6
	jthdRAUDPrV1oqVfyGoPswp2Pt4vfdyun+D+QuzGuiW8VKen8bzS2U8OaK1E1h8UpNEpXHAOCyU
	PKuCed3wogFPZ8gJD0IBv6MTEeBtzdH10MFH98SeRSP4OmiFNpKsRCJgXDQ=
X-Google-Smtp-Source: AGHT+IHmyQo7dsL5dPNTJ2TjaO6JEct4cSd+Aq2yaMATqNTe3OPulS7WP5rhQN0bA55QtDtTcdbAlg==
X-Received: by 2002:a05:6000:1a89:b0:3a4:db94:76f9 with SMTP id ffacd0b85a97d-3a4e957b9f7mr4850618f8f.38.1748510971118;
        Thu, 29 May 2025 02:29:31 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74072sm1457237f8f.52.2025.05.29.02.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:29:30 -0700 (PDT)
Message-ID: <a3ea3e51-2bd1-4155-906e-a39b35ec693b@gmail.com>
Date: Thu, 29 May 2025 10:29:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] ASoC: codecs: wcd934x: Drop unused
 num_rx_port/num_tx_port fields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-4-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini.kernel@gmail.com>
In-Reply-To: <20250528-asoc-const-unused-v1-4-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Members wcd934x_codec.num_rx_port and num_tx_port are not read anywhere
> after assignment, so they can be safely dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/codecs/wcd934x.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index fa69817c97eaf1bf226b140f3a89095a50a128b2..1bb7e1dc7e6b0a5528cbdb7ada943a7d417fb684 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -537,8 +537,6 @@ struct wcd934x_codec {
>  	int rate;
>  	u32 version;
>  	u32 hph_mode;
> -	int num_rx_port;
> -	int num_tx_port;
>  	u32 tx_port_value[WCD934X_TX_MAX];
>  	u32 rx_port_value[WCD934X_RX_MAX];
>  	int sido_input_src;
> @@ -1928,13 +1926,11 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
>  		return -EINVAL;
>  	}
>  
> -	wcd->num_rx_port = rx_num;
>  	for (i = 0; i < rx_num; i++) {
>  		wcd->rx_chs[i].ch_num = rx_slot[i];
>  		INIT_LIST_HEAD(&wcd->rx_chs[i].list);
>  	}
>  
> -	wcd->num_tx_port = tx_num;
>  	for (i = 0; i < tx_num; i++) {
>  		wcd->tx_chs[i].ch_num = tx_slot[i];
>  		INIT_LIST_HEAD(&wcd->tx_chs[i].list);
> 


