Return-Path: <linux-arm-msm+bounces-98662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF6fBzy1u2ksmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:35:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B79ED2C7F23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E2E03004F26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D453A9616;
	Thu, 19 Mar 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FKB3VwkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4CD2DCF74
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909302; cv=none; b=Kz9S0+gWOOjcJ63nfkc2M4/XyN/uceiH9HImY+BMT4ZuwctL4mkdZJjJyIvE0nDDeAePwyzWkonpgeJaf59gh4cqI/nNjRysfNMULNDKqc8ZD8u6iwlCL0qQ46ZithjVhnk86hGc821NvAKIPWkHUyS6Tg81LpI9y+oSc5XHJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909302; c=relaxed/simple;
	bh=8pUgiNVCyxHsRsGrGqsKlWjbAdD/+lqFZMZAxnLVClE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCUkQLa8LzcpiZwAzqte0UVA1mVzkxPjf9sCml48pYgTXA+B2lGRHiwkahYhMy0nYMcyuEK2EQitbBiVm73FwRZY9TttJYtATbHWV5cgEAbwT5IMDdW2fyK2DjPtOEg6G9FERHmG2B8PKjXqoN+D8eijU3C9tmZYWLvpdNzgr6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FKB3VwkW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so4010265e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773909299; x=1774514099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHeGhSHAyZHfpsSBccIQu+12DxQmOjEjuujaPyfYiZk=;
        b=FKB3VwkWId/TMytDt0xhO7BRpK3NuiVzCHewx/ilBg/+iht5HVuQv0QJlMEoKWbRbk
         wh5lBAr92fvSLQBQDr+anxUpOjW58KX8sM8lqCMSv0a7qtR9KJb7pHyeJi+hVPNLmALP
         NVONzp4XCV2ub3tW4RQYLoVqUuNQDbrIDkwZEI1HLQsIyypVlko2VXy6DoBS97I4jKJO
         nWOFe1+0LiWUx72BEK2sfV7+wAWWAsa0oadgh4WMZE8d3cLE79e78i7Glu5sf/C/rey4
         BMEw5Q79G2jMz3CdZvD2jmVR9ZxM7ZKbdBB2a/S5aP8a7sWp0cQBjxHWB5jVRPicNE/B
         Q6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773909299; x=1774514099;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHeGhSHAyZHfpsSBccIQu+12DxQmOjEjuujaPyfYiZk=;
        b=VaGEGK7sUA6sJbXdI3/eoCQ91XoNJHhlYCR+jqA7fwmQpWvPaKmUljKKQe8ikC71iX
         R5iN2NC9cSVgSbd1hL9DJOJalqLKNBR4lRB01ZhCPykavJjC1oyPkk1pqC3qN9DK+6vO
         a774x5RgbyVkss5tODsQX0nwjJ0Gn5Hr4Tx9yqmgsO74E8pIKmtG+pCLUodiXaegrwIz
         SS0KEFuc+TmdDxWhC7v3P4/OAp4kWsANPGH3qKx5nn1GzfmcB+dVMVUlwr5JcIIcVn6k
         OwVqfHhX9lrwbOMkTzQC5TKBTb32xGwBT2ejIUHVNbon10fNkgyX6pVZspLa78fVcBrD
         vV/w==
X-Forwarded-Encrypted: i=1; AJvYcCUqIVotKtsapoKsB7EUbF+wcnH5X75gw/vJAVBFNbievFDcofiKZXJhZYyiKosOzrIhFbhAvQlDMl0vTtC2@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+ke84FpAoPIKuA76+8zcO1wQ7vwvrOHSbPwimxa7JpmgmjMW
	0t1qVSMf7EzN76jS6oFkYNRUQFycYWR8lukZrtN6d4QsRKWjjJUIEy6wlEDRYqhEk7A=
X-Gm-Gg: ATEYQzyFTG5XSCDaxAbxwBXV6Kn3dq5kpr8K+Pmuog/hWdqmlhQkqkTNQVUvZ2NJNDW
	RLUAJr0lvW9rcRumLDuGWKbbOKth4Zz+bxpcJbY47ZQpOgZydgbZ8gtQd+hW5qVnvHC0n8GttJr
	HjujjjncPIbE6hAbGk/Y8TDogMnX8Uv7Uk7zpJey8ktMs+h8VzJ7ddsWSpaAKK+W2TLAb+hgmsS
	ZZYX0vWjq+hcq+LbtGhpWk10s2L6+QDC4NYpp25BeS1Lr1XMB/ZOUGCsTY2kr6h7+ZSfCBnHDUW
	6CEU8SkkRure15Ujp4RMifX08dWE4sLUbNL3qLY+sCp7KTK2Z0VDJ18VOvI+BA07DUGOb2leMQR
	x2GB7dxbB5DZMTUD2WA/nbdmii/1shnynB53P6AybU8JMkiKGmcNPcpVPeyJc8WJjbbLN6rpnWb
	+u2M0eciVay0YBu5SYoymjXn5e5lJM2pJF/c2m34bzIA8AzvfRQjLIvG/1tmTTHLFhedNKyjFOM
	kRGLp8=
X-Received: by 2002:a05:600c:3551:b0:485:3e00:9440 with SMTP id 5b1f17b1804b1-486f4474b56mr107037965e9.24.1773909299273;
        Thu, 19 Mar 2026 01:34:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7? ([2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba73b4sm39934325e9.22.2026.03.19.01.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 01:34:58 -0700 (PDT)
Message-ID: <c9d14a74-8e59-43bb-827b-577c8f675c8f@linaro.org>
Date: Thu, 19 Mar 2026 09:34:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: fix video mode DSC INTF timing width
 for non 8 bit panels
To: Alexander Koskovich <akoskovich@pm.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
 <20260318-dsi-rgb101010-support-v2-3-698b7612eaeb@pm.me>
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
In-Reply-To: <20260318-dsi-rgb101010-support-v2-3-698b7612eaeb@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-98662-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,linaro.org:dkim,linaro.org:replyto,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: B79ED2C7F23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 05:00, Alexander Koskovich wrote:
> Using bits_per_component * 3 as the divisor for the compressed INTF
> timing width produces constant FIFO errors for panels such as the BOE
> BF068MWM-TD0 which is a 10 bit panel.
> 
> The downstream driver calculates the compressed timing width by
> dividing the total compressed bytes per line by 3 which does not depend
> on bits_per_component. Switch the divisor to 24 to match downstream.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 0ba777bda253..9b046a0e77aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -122,19 +122,21 @@ static void drm_mode_to_intf_timing_params(
>   	}
>   
>   	/*
> -	 * for DSI, if compression is enabled, then divide the horizonal active
> -	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
> -	 * is compressed into bits of 1 pixel.
> +	 * For DSI, if DSC is enabled, use a fixed divisor of 24 rather than
> +	 * bits_per_component * 3 when calculating the compressed timing width.
> +	 *
> +	 * This matches the downstream driver and is required for panels with
> +	 * bits_per_component != 8.
>   	 */
>   	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
>   		struct drm_dsc_config *dsc =
>   		       dpu_encoder_get_dsc_config(phys_enc->parent);
> +
>   		/*
>   		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
>   		 * fractional part if there is fraction
>   		 */
> -		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
> -				(dsc->bits_per_component * 3);
> +		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) / 24;



@bits_per_component: Bits per component to code (8/10/12) <= how the DSC pixels are encoded in the stream
@bits_per_pixel: Target bits per pixel with 4 fractional bits, bits_per_pixel << 4 <= the target display pixels

- bits_per_component is the transport width
- bits_per_pixel is the display width
- 3 is the DSC compression ratio

So for a RGB101010 DSC display bits_per_pixel should be 10 << 4

But here you say bits_per_component should be 8 ? can you share the downstream config of your panel ?

Are you sure about the bits_per_component & bits_per_pixel values you set in the dsc parameters ?

Neil


>   		timing->xres = timing->width;
>   	}
>   }
> 


