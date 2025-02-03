Return-Path: <linux-arm-msm+bounces-46774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E94A25C37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11953162DD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E222080E4;
	Mon,  3 Feb 2025 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AH0xFT/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF72080E3
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592601; cv=none; b=qRq+VpKl+2KfGmzl4r3uDP5ZCgMqb7SFnNWQ/uBxvELPf+Db82FRsr8py9n8rIgRGgzqPt5eTXhlVkJO7hB0xTNo+CV4CwsAVZ6AgMPxJCj9UJKRBggTBL7MttdVG2V57JN5MMqTy9Da2CsTFor6I8Vnif12Qzjj0FnapZ5e9Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592601; c=relaxed/simple;
	bh=5TY83yTZMJt+WJR243C9KKqHeLZC/2FOoflW1n4/Z9M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uCB3D6FNRxtB6CYtCzP8yTeIwJNaZtFc7tdiioxF6Jwh+DcjIh9ALw7dvhwJlsgU1NLoi2vz+3eYOG7jNZ5i7GiYGeN0cid8e0O0WrSaYvHWCHRTGLS9l7T13eaJoH4P/2KoLZBze+AQjxULIT85kjCGMln6UdyNfIWaER4Rt24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AH0xFT/g; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so44985585e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738592594; x=1739197394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JETyfRXJq12Xcur9F4/dJvLidwKyQCSflTktFGp74z4=;
        b=AH0xFT/gSXsYN8U0P66GC+3kW9Bm6hEmydQvCwHxugz63BOtxzLhV7VsvpvP42oIEb
         kePx3QVahc1EWSyQ1XEuJGSblEvAWBLWBSPYoe0im9V1AndQWRqcMq5IwoeH3b8T7f+o
         Squ1kDvy+dV2DflSZxxkSB4cRlqdChRrcbKcN14trUQuBvLejH7ZP4F+ibRxxMpz7Y5K
         nOyDw7bl0t0LOiZsILE3bRYT10eNzYOQhbh9i5pAlYtKtSabGtFvU3DhHudiuNofnTIH
         ZJr25W7qhUS0TOQNhsnyFM2habLvjgdpA1YCKKYyQCmxkKkFokpn+eEASxxlrh+Ej9rl
         xukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592594; x=1739197394;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JETyfRXJq12Xcur9F4/dJvLidwKyQCSflTktFGp74z4=;
        b=o1YiU3d6ikA+UEVJ+9e+iTeP51ZlUB6iEBwfzWqMQLP62L1dcdFVbaokE+fe/L8vKo
         BCE9K7GfF/2cx2CB3uy069V8G0hShOYNNuSdr76gmc/7Rt2legBN+eIo8IKNseZsRItH
         hjnON3HrRcaANrFjHhouvdhWyt2hr1kQLPvki5C5L+s34sdLfXd8GxewHwxb1GC5Z3yF
         mqSEYl3ZDfMRMVTLvcTzsLiqV4fj59FUcWENsLaNAiUYJ7fgcXRPb+9uc+6YT+9rxSMz
         vFfrgj7iCr6b6DiHE3aNlUCRMd9vyqlmA5HUuHToA9THzGNhWCZkwbFe+10F58QYHJUU
         8soQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhxRhTgl8MIL3pn6Mn7927T+UALdTvQHWwDH1R/evZfnzxGHKILGChiB1Bcpjr+OIowq0cEPtEELFW3/K9@vger.kernel.org
X-Gm-Message-State: AOJu0YwJdhw5YMXvTkxTBzF+pmJYldaHeHU9YVZ6AxWc5hhXNt+NmJxW
	bvk98hUqRVQ9HdChN5trJOWAoiPl4/RtHOa0J7uo7ZSlwjZ8y2AKHj+HDGJjPXQ=
X-Gm-Gg: ASbGncspjqm3NvtQbQ540KWGpF3ybZUxFfwF6Ilc2UiT3aTRdoAWNpWlC90ps0ulxU5
	eTiFzUN/D4a8gz1KUALn57PEYyTGzG7m+T+1JaRjqrRErxGJyHl/xnrSE6b0l56dY5SlgHdxEXE
	QLaLJrDw4XZw9r/i5N4H5LyPRz+a+R8g/G/7cKDj354R9qobSNK64fL6XrPl3PdSqb8ktdfC0PE
	oVvi5Y2Q54ufFv+V1WozXwxY2sDIA1o95wpFeHrp4GQoQ1qXYGRiiwG5KdHKYfe4TSNTNYE1Y8F
	B9qHO+kIAvhv5ZfGH/E+O6nE27oGQmpym09ZFjO/rzQXod15ByDUEW2yCdDYM9NFRSCL
X-Google-Smtp-Source: AGHT+IGYuz4oqLCApkYRCF33w+FsChPj8LKIA3wn1kEgbPVMNx0W3DLx862n4J8wcI9T6dUA+xOH4A==
X-Received: by 2002:a05:6000:1faa:b0:385:fa3d:1988 with SMTP id ffacd0b85a97d-38c5194ca8emr19688381f8f.8.1738592594608;
        Mon, 03 Feb 2025 06:23:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e2ce:628f:fe98:a052? ([2a01:e0a:982:cbb0:e2ce:628f:fe98:a052])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b61f1sm13142299f8f.68.2025.02.03.06.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:23:14 -0800 (PST)
Message-ID: <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
Date: Mon, 3 Feb 2025 15:23:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
To: Danila Tikhonov <danila@jiaxyga.com>, srinivas.kandagatla@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250203113857.34728-1-danila@jiaxyga.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250203113857.34728-1-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2025 12:38, Danila Tikhonov wrote:
> When using primary mi2s on sc8280xp-compatible SoCs, the correct clock
> needs to get enabled to be able to use the mi2s interface.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 311377317176..03687de1ebb0 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -14,6 +14,8 @@
>   #include "common.h"
>   #include "sdw.h"
>   
> +#define MI2S_BCLK_RATE	1536000
> +
>   struct sc8280xp_snd_data {
>   	bool stream_prepared[AFE_PORT_MAX];
>   	struct snd_soc_card *card;
> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>   
>   static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>   {
> +	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
> +	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
>   	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>   	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>   	struct snd_soc_card *card = rtd->card;
>   	struct snd_soc_jack *dp_jack  = NULL;
>   	int dp_pcm_id = 0;
>   
>   	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);

How is this possible ? sc8280xp uses the q6prm clock driver, and there's no
way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I totally missed
something.

And prm is neither a dai nor has the set_sysclk callback.

Neil

> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>   	case WSA_CODEC_DMA_RX_0:
>   	case WSA_CODEC_DMA_RX_1:
>   		/*


