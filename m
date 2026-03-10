Return-Path: <linux-arm-msm+bounces-96625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA8FBqcGsGlregIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:55:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A77B24BC23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1341A3128717
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7B338E114;
	Tue, 10 Mar 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nIuy7otu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038138945E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143045; cv=none; b=oUOm5HCWORsPevu7+DgT7i4Qp3b1/GFs2+feSsp4krn1SuazbZsP3YO2VmcahPBApvpeUPvG2yBwkR/t+jm3ACc6BwjNCQfpLlEQmpMmzIiGjD7giQQlXYI9LM62G0oExYwFg1x3ySnnGodLBNYeiF/gPxalvzYdsfJAEWJnTvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143045; c=relaxed/simple;
	bh=6nMT4wlyiNVRBXFe+dSwAnIlszsiaCybW7HVaXPiKwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMWeJ3+yuCdISr8X9XOcueiox74+KZvDD/jcLwEKj27nuQAgoLZ9A15lWDJk6p3klslCQG4RjUQC1cvh65PgNe5o0dxHneLtWjxMvBma8OlRSDknUpGjLsSSs9sqC2VLo4s1Pw1pzVCRxt9HFsZxtZMZLBinPgShDNwXMfibPII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nIuy7otu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso10141580f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773143042; x=1773747842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R97tn2L3rYLkasHPwhwzmeqbdEI0z4ZT3QVJc2HyTK8=;
        b=nIuy7otuk+IauXvw+pS2GsFrb3RRcqz4GIcBhICQt4vDkHT/dsnMe3/7dGVkj00G/S
         HtUsz00zeiJ2EOFEbRGZzH6uN/tCqUabVio7IuxgULDq4OJadYm1qMxpLxJLb66XSWng
         UoasT8iqJjoTprZWufdAbUBVSxZcgykPG4AMaEI9nR+8Q8lvXwxM2fr2r/Hai9QVk6mX
         37JR4VhYL8efr/DRTr1WiJWv/2pCRqvxZUoQsPrUH3XwT35MFZZoZqfbEPsDRzhFgk0Z
         XMukvN+AsuoQgN+bhnBD0x1qnGmGzARoxBYpXHJ2WQ2nJ2q/sStE3yRiu7k+Ma4L3pa2
         1q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143042; x=1773747842;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R97tn2L3rYLkasHPwhwzmeqbdEI0z4ZT3QVJc2HyTK8=;
        b=R5reE7bfY2yobVnkMuntQnmFQpglF9o+J/vEiNNJZorrjdbKG0NaRmyWAM0ftLn+tf
         Duma9Ig3+zrNbnJAsQYo2ocFjAVflen9boOKMG6OEOkNhegLjRPWIDPMQh2SknlVEGas
         9QvfkfX0h0srnR5ouf/KzlXJwyqyk03ANoBVN0lxd14bh8rz/xG5U8cCG7NcaLnWDVw4
         4V1kFWX9CL/gs9aW5HF90tl+IiVaL1agEVmncRF1J6nmktZahDWO3lgjwr/+yq70ZYmL
         O1yX5ZeE9V+er8INH/5NhXBf9DSWVdeJC+EEmv3n3VPyFdoS8JIpYRcpyhRlGvT07L77
         wZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyllN5o8F0yMbq3gU2TT9SA0s2753S+AFiK5jueZsbMWVojJCAhSnbFBE/mvEpHc4Xko0vY4fdTTI1pQA4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9AeCIMvWTsasSEuVCyKJBGWVqzHESSQNMhTHc2lf02rekXJo8
	w/+kb/nQYMw9uTkaLIC1uzR6Px4q5y982KVHkVgj2QKcdSKHZnR7g7Oy6sXZ+h/LJpk=
X-Gm-Gg: ATEYQzxoSf7JdtYxn6D46gOuzacIHQ9n+3jZB81kYWBDjQlw8dKJQVYB9OWhuuy5Vy3
	SKJLEDgSXqt3SfighfTJ5NXgnSla+eK6ieMwUEeRlh42Y5mXnIn7chiE9yjZPNsFzKYJD0duwyP
	Ne3f5U1cMSPkHUy/4CUF8rKONHADrHHdM7LnyJuYJFxq6J1awEwy8J/p9Kk7jHqwmDhaVmLCYME
	59H4bJ+2HN4WA9qyHO1cbGAOPupUdaYZpUDvz5V2eVN6VOhoPh+LeAMo2s/4tkTiw6bvD05vJ1X
	winKW3kKaoGe/Vb9D+byM2xLJMUmHA/do5TLnQED1IBvLEJgi5geSY/VmsyXWi1IaDZ/9SYfoIa
	DddTL+gnI6L1KqELKOnEr5wWGpRYhWHkJ+Wv1b6BjGHxmru9ghp701YnLVyGx5ERZLq/Z/N87Qv
	uKfLaBsi5PUmtwYfIOtQ526VG623RxzzXlWV6tKTpnpDQwjgtGxEj4efTcVKY8YwbNWqPoVrZl8
	sxg
X-Received: by 2002:a05:6000:2503:b0:439:872f:b495 with SMTP id ffacd0b85a97d-439da891d24mr27692044f8f.42.1773143041833;
        Tue, 10 Mar 2026 04:44:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4d81:e92:c4c0:3c45? ([2a01:e0a:106d:1080:4d81:e92:c4c0:3c45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae46353sm41211750f8f.33.2026.03.10.04.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:44:01 -0700 (PDT)
Message-ID: <c3f4a9cc-303f-4652-8a27-71645e8337d7@linaro.org>
Date: Tue, 10 Mar 2026 12:44:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 4/4] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp:
 enhance machine driver for board-specific config
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-5-mohammad.rafi.shaik@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260309111300.2484262-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8A77B24BC23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96625-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,linaro.org:dkim,linaro.org:mid,linaro.org:replyto];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Hi,

On 3/9/26 12:13, Mohammad Rafi Shaik wrote:
> The sc8280xp machine driver is currently written with a largely
> SoC-centric view and assumes a uniform audio topology across all boards.
> In practice, multiple products based on the same SoC use different board
> designs and external audio components, which require board-specific
> configuration to function correctly.
> 
> Several Qualcomm platforms like talos integrate third-party audio codecs
> or use different external audio paths. These designs often require
> additional configuration such as explicit MI2S MCLK settings for audio
> to work.
> 
> This change enhances the sc8280xp machine driver to support board-specific
> configuration such as allowing each board variant to provide its own DAPM
> widgets and routes, reflecting the actual audio components and connectors
> present and enabling MI2S MCLK programming for boards that use external
> codecs requiring a stable master clock.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 180 ++++++++++++++++++++++++++++++++++----
>   1 file changed, 162 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 7925aa3f6..c2e9323df 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -12,17 +12,62 @@
>   #include <sound/jack.h>
>   #include <linux/input-event-codes.h>
>   #include "qdsp6/q6afe.h"
> +#include "qdsp6/q6apm.h"
> +#include "qdsp6/q6prm.h"
>   #include "common.h"
>   #include "sdw.h"
>   
> +#define MCLK_FREQ		12288000
> +#define MCLK_NATIVE_FREQ	11289600

Where does thos values come from ?

MCLK_FREQ		12288000 == 48000 * 256
MCLK_NATIVE_FREQ	11289600 == 44100 * 256

This is highly specific to a board, the sdm845.c uses:

#define DEFAULT_MCLK_RATE	24576000 == 48000 * 2 * 256
#define MI2S_BCLK_RATE		1536000 == 48000 * 2 * 16

And those are the values we use to output sound on HDMI on all HDK and Dragonboards.

I guess this should be configurable somewhere !

> +
> +static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> +	SND_SOC_DAPM_SPK("DP0 Jack", NULL),
> +	SND_SOC_DAPM_SPK("DP1 Jack", NULL),
> +	SND_SOC_DAPM_SPK("DP2 Jack", NULL),
> +	SND_SOC_DAPM_SPK("DP3 Jack", NULL),
> +	SND_SOC_DAPM_SPK("DP4 Jack", NULL),
> +	SND_SOC_DAPM_SPK("DP5 Jack", NULL),
> +	SND_SOC_DAPM_SPK("DP6 Jack", NULL),
> +	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
> +};
> +
> +struct snd_soc_common {
> +	char *driver_name;
> +	const struct snd_soc_dapm_widget *dapm_widgets;
> +	int num_dapm_widgets;
> +	const struct snd_soc_dapm_route *dapm_routes;
> +	int num_dapm_routes;
> +	bool mi2s_mclk_enable;
> +};
> +
>   struct sc8280xp_snd_data {
>   	bool stream_prepared[AFE_PORT_MAX];
>   	struct snd_soc_card *card;
>   	struct snd_soc_jack jack;
>   	struct snd_soc_jack dp_jack[8];
> +	struct snd_soc_common *snd_soc_common_priv;
>   	bool jack_setup;
>   };
>   
> +static inline int sc8280xp_get_mclk_feq(unsigned int rate)

				_freq

> +{
> +	int freq = MCLK_FREQ;
> +
> +	switch (rate) {
> +	case SNDRV_PCM_RATE_11025:
> +	case SNDRV_PCM_RATE_44100:
> +	case SNDRV_PCM_RATE_88200:
> +		freq = MCLK_NATIVE_FREQ;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return freq;
> +}
> +
>   static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>   {
>   	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> @@ -32,10 +77,6 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>   	int dp_pcm_id = 0;
>   
>   	switch (cpu_dai->id) {
> -	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> -	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> -		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> -		break;
>   	case WSA_CODEC_DMA_RX_0:
>   	case WSA_CODEC_DMA_RX_1:
>   		/*
> @@ -96,6 +137,31 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	return 0;
>   }
>   
> +static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	int mclk_freq = sc8280xp_get_mclk_feq(params_rate(params));
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +
> +		if (data->snd_soc_common_priv->mi2s_mclk_enable)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       LPAIF_MI2S_MCLK, mclk_freq,
> +					       SND_SOC_CLOCK_IN);
> +		break;
> +	default:
> +		break;
> +	};
> +
> +	return 0;
> +}
> +
>   static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
>   {
>   	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> @@ -117,6 +183,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
>   static const struct snd_soc_ops sc8280xp_be_ops = {
>   	.startup = qcom_snd_sdw_startup,
>   	.shutdown = qcom_snd_sdw_shutdown,
> +	.hw_params = sc8280xp_snd_hw_params,
>   	.hw_free = sc8280xp_snd_hw_free,
>   	.prepare = sc8280xp_snd_prepare,
>   };
> @@ -145,37 +212,114 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>   	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
>   	if (!card)
>   		return -ENOMEM;
> -	card->owner = THIS_MODULE;
> +
>   	/* Allocate the private data */
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> +	data->snd_soc_common_priv = (struct snd_soc_common *)of_device_get_match_data(dev);
> +	if (!data->snd_soc_common_priv)
> +		return -ENOMEM;
> +
> +	card->owner = THIS_MODULE;
>   	card->dev = dev;
>   	dev_set_drvdata(dev, card);
>   	snd_soc_card_set_drvdata(card, data);
> +	card->dapm_widgets = data->snd_soc_common_priv->dapm_widgets;
> +	card->num_dapm_widgets = data->snd_soc_common_priv->num_dapm_widgets;
> +	card->dapm_routes = data->snd_soc_common_priv->dapm_routes;
> +	card->num_dapm_routes = data->snd_soc_common_priv->num_dapm_routes;
> +
>   	ret = qcom_snd_parse_of(card);
>   	if (ret)
>   		return ret;
>   
> -	card->driver_name = of_device_get_match_data(dev);
> +	card->driver_name = data->snd_soc_common_priv->driver_name;
>   	sc8280xp_add_be_ops(card);
>   	return devm_snd_soc_register_card(dev, card);
>   }
>   
> +static struct snd_soc_common kaanapali_priv_data = {
> +	.driver_name = "kaanapali",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
> +static struct snd_soc_common qcs9100_priv_data = {
> +	.driver_name = "sa8775p",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
> +static struct snd_soc_common qcs615_priv_data = {
> +	.driver_name = "qcs615",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.mi2s_mclk_enable = true,
> +};
> +
> +static struct snd_soc_common qcm6490_priv_data = {
> +	.driver_name = "qcm6490",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
> +static struct snd_soc_common qcs6490_priv_data = {
> +	.driver_name = "qcs6490",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
> +static struct snd_soc_common qcs8275_priv_data = {
> +	.driver_name = "qcs8300",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
> +static struct snd_soc_common sc8280xp_priv_data = {
> +	.driver_name = "sc8280xp",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
> +static struct snd_soc_common sm8450_priv_data = {
> +	.driver_name = "sm8450",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
> +static struct snd_soc_common sm8550_priv_data = {
> +	.driver_name = "sm8550",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
> +static struct snd_soc_common sm8650_priv_data = {
> +	.driver_name = "sm8650",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
> +static struct snd_soc_common sm8750_priv_data = {
> +	.driver_name = "sm8750",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +};
> +
>   static const struct of_device_id snd_sc8280xp_dt_match[] = {
> -	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
> -	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
> -	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
> -	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
> -	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
> -	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
> -	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
> -	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
> -	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
> -	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
> -	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
> -	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
> +	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
> +	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
> +	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},
> +	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data},
> +	{.compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data},
> +	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
> +	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
> +	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
> +	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
> +	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
> +	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
> +	{.compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data},
>   	{}
>   };
>   


