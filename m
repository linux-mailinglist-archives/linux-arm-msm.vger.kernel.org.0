Return-Path: <linux-arm-msm+bounces-98767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEt2HqEEvGmurAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:13:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7CF2CC7A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9733305A5E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1E13033C2;
	Thu, 19 Mar 2026 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uaJRtW1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777535949
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929359; cv=none; b=XWHrMdVU6DoJ9VQ68ChaKL/Trf6d2sleNrP9cf0lKIGZYreqB0YSpbhiCT1o15+FqPbqZgtjl/1nLSbTI9voeq9o8cTk3eaHogK8XTkV+XiZ49vwcU8UbIme2lbrbcdBPYH6vPaJzUlvLt/h/KZDmJHneWV+ncUbrAB/B2qBhJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929359; c=relaxed/simple;
	bh=DcUBhuD1MnxZGsV/EqzS3F0tkeCRGYYTaQRI5YnnkcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjWhQ/Rrgig/ADv6szQppwbdXtjuKHDtzPUAw3lVUTaiB3RWc9U9pAEY2UrpXQOwMSuhaim4d8nwgWfM5938xeapD+8YsTO8ZTL4T5Yfi+1ofAtqPeVw8oc4XdXHfDKa2H/BddofM5ubV3R0mpv5GLO5o3Oz5UEFPBI85P+8E+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uaJRtW1R; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so770273f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773929355; x=1774534155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=No+jRdZXBH1kzO/iwEkAzBKEfmzYF8fD5kLubhT3iAY=;
        b=uaJRtW1RiMM0FTcROAqj7YlfvZbsy9qcwF0+JhejNeBWp3xUb/UT8lDWk2JuctYAhi
         Cj/pZRH7Hm1Uu//7q8WKOVWQeX2FioMADHL8qhNke6qnsjoLaHYOb4yL6fNjDHa2w+aB
         eCgcqzK7Cx0r+kpQqM5j1ArJ/L/H/UC0BOeUNJ0xjFhpz/ZpGlLxRikpzn9kYCGWQSWf
         esjNh18aVDxrM+3RXvX1ppA5CudFlHS2hY1T6PzgmigwL2OUxmX6C3JHD/4Ef+r7gnlj
         fJJXAZKN0lAoOxAwlmhBgHuKjjEAtEnfLhVcV5mrCeGgHNT9Kg/Y3exL3vYdNm7zz4ho
         ftPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929355; x=1774534155;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=No+jRdZXBH1kzO/iwEkAzBKEfmzYF8fD5kLubhT3iAY=;
        b=qKP3GEQidU5yHV26gesVMMfKXvt/91hcJQQVwR2gQMX51mSGHbzsUUHKa+AwGfC75P
         RqwZmYP0iJkfttRbHzDjomJnS/aJJgWahr4lVvTusKYK/8OX4cBsvd0EDhh+7Ku9sWuP
         MHQuLgvDxgXLTd47js8a9nVS6QVfFZkxvK7+JCpeMSDpebSTvA9Wy8K9hw+THGo4okOT
         QMilVWVT1r5B0fAKK7h8uXAIcMyahXplifjP2QKP1pqHCcnGz7g32ipZZS6BAGl4BADm
         7d1UCYXrrqLMENqtgl0sAHZqWgRpyJMsLMDJkqAupGk6Gdv+TvocMAh35XPOljPuQ8M0
         7ZKA==
X-Forwarded-Encrypted: i=1; AJvYcCWfnsT6jj4PuUZyv8hsuMmYEwNCqk2Mw9hULhVpLyW9MJyNPKVbch1kFutxB+NWaOg4wgDzZgvtjJx46G0A@vger.kernel.org
X-Gm-Message-State: AOJu0Yz02fX+8MekTe9yqh7ItKGXBJXtXzgnbiRnoaY6/NzEO62waeEm
	HaX72WKmjkL31J+ohsUmYU+28ve68WJdq65//vPy4ZMNHSv3qgoesAYDL+xxUrafCp8=
X-Gm-Gg: ATEYQzzBVjKyjaDdhGpG9G/Tqz9qjw+vzge7onwlaGSlrJe6WwErX27xEZyu4Dr17BN
	cX54ZbxMIpjbfY7dbeayrd5TdDGfKjEyvGivTHysFX7KrSIm5LxI9Oywi846rdgiMaiURisutOm
	Vt/zCVXvPATTZWxy6sUwilS2jGPemcTCms3fBrjmL5fryG5K/Dr7/nITjbcyVwdkrdIxYZ+TAOy
	CofSxJ9MYfaU0IYhEU6VaJPRyN0z37mmTALKv6b3/pgD5O5eb7FdTjapjK96UOs9JdQhMr3AKV/
	69FsCOshUdTLy8TRtXxaK+1rsFyLRqgFH9vmpd46NComQTn4Qlcq2kYzBQKwdv5E3XeavmsbExZ
	0ZUCCKmm3Nyev+ioVCjIlsQ19tsYKSf6quBKcWPaDDoREUHDHp93PZQNsSCLETypMoIjzl4ggKQ
	sm+yYH3PU+9zLoskUpUGPvRmIGSAX3vVl2wIH7XoCqmDpyMFBbp94y+bBiFqmmlh9O3PqEC5bjp
	uRxIrk=
X-Received: by 2002:a05:6000:2d83:b0:43b:45c6:7ad with SMTP id ffacd0b85a97d-43b57732e56mr4966729f8f.29.1773929355079;
        Thu, 19 Mar 2026 07:09:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7? ([2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm17789468f8f.5.2026.03.19.07.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:09:14 -0700 (PDT)
Message-ID: <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
Date: Thu, 19 Mar 2026 15:09:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width
 calculation
To: Alexander Koskovich <akoskovich@pm.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
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
In-Reply-To: <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98767-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 1C7CF2CC7A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/19/26 12:58, Alexander Koskovich wrote:
> Using bits_per_component * 3 as the divisor for the compressed INTF
> timing width produces constant FIFO errors for the BOE BF068MWM-TD0
> panel due to bits_per_component being 10 which results in a divisor
> of 30 instead of 24.
> 
> Regardless of the compression ratio and pixel depth, 24 bits of
> compressed data are transferred per pclk, so the divisor should
> always be 24.

Not true with widebus, specify why 24 and because DSI widebus is not implemented yet.

> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 0ba777bda253..5419ef0be137 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -122,19 +122,18 @@ static void drm_mode_to_intf_timing_params(
>   	}
>   
>   	/*
> -	 * for DSI, if compression is enabled, then divide the horizonal active
> -	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
> -	 * is compressed into bits of 1 pixel.
> +	 * For DSI, if DSC is enabled, 24 bits of compressed data are
> +	 * transferred per pclk regardless of the source pixel depth.
>   	 */
>   	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
>   		struct drm_dsc_config *dsc =
>   		       dpu_encoder_get_dsc_config(phys_enc->parent);
> +
Drop this change

>   		/*
>   		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
>   		 * fractional part if there is fraction
>   		 */
> -		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
> -				(dsc->bits_per_component * 3);
> +		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) / 24;

It would be helpful to somehow show that 24 is 8 * 3, 8 being the byte width and 3 the compression ratio.

>   		timing->xres = timing->width;
>   	}
>   }
> 


