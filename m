Return-Path: <linux-arm-msm+bounces-103148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OIrEnhS3mlIqQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:43:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 411ED3FB6E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FC7F302528A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4687A3E8C7D;
	Tue, 14 Apr 2026 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NJ6CG7OF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72CA359A8D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776177611; cv=none; b=gP/4Y/qvcLPnTygACQDz9s97AHkRXFXc0g/sN1N/JGyklb75EBIBotHfgoVvwDqIZoaYhxucO3dAZO9AuMo3CxHyzHQkECbrR9eQedYY9YHvWlimkzHzNVfPELws4ai5aXXAOjRTcViiavGfSI2p2w5q6fHquPXexGw7KBBvUCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776177611; c=relaxed/simple;
	bh=guf8L59H/u9RADU1vmjMkCpYrwLvfvNDL0u7B8d2W3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sd3Y/LKsbUldwx9OznVGKiDBhDaETvkbHRQmL2wRS9N5CJfTU76n10gzaGkzaPXuCQu45nMwAkvMv54+5CPgfgWFhBPDjU2gMW3fcd4RH3zXiogNN9MFoH68A2JyLbbMxeppE5+aN0R6OiWskQAroczylC7x3X0DRXgXnHbmPR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NJ6CG7OF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso93876505e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776177606; x=1776782406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8qee+KfIDH6hTZmLHBgoLxBoCZQb660HR/vvyLnLl0=;
        b=NJ6CG7OFk4TbUoRNCgfpGQqKvx+gRhG784SS6LvMMVk/VM/kgC2wOyWpUlbcJ5oBYY
         HwgpA47Zta/FX9r2pHRkVx4yIRuMk97WXh1n26VlFTyd2rz/YZ608kZFI3+EHD+PBx0q
         ZSmlbBWbh4pwoMZVethPbEIf2neXcrbCFX3PAPHomuzAUgxPD5HD61Emz/GIKXENVQJn
         KJOjJ+H4QEBveBEDwDkUb9nwL56iHPznUeN5ZaJrExSp1OCCU13uKD0q4SOQxiNQe0Ms
         lHAt6OuM5Y+WaBZwfV+z3rq7Nl8G4n855fvzdiMgmHbC86dR7kZDPGSRvjeyRL6pG3hi
         JC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776177606; x=1776782406;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8qee+KfIDH6hTZmLHBgoLxBoCZQb660HR/vvyLnLl0=;
        b=Adi5RMQt+3a0tUlWJHQZvdS8Tv0isk3sZ/tMtMz154x1DS0pmEAFi+/OUrbzu5wnlZ
         jyKObho+MTuHOqrAbOqBpBIGycd2SJMteKxYxcVk3ww08WGhxYLTBX8a1ASCM1RQasQF
         3L010moa1nH2+8G18kiL5xfOQWP4k2pl08NeDCCvgmHVYWh1stW2AQz9TXkzzCfH/8Zh
         wKovYqcoMysWjyYSQajNpZXdbChYmDwmWZrchOKjhseFfj0EsBINgp0QDVSNEP3aIBNr
         Gwsf8xdoP3S8y0+N9kdllRGAaBB99yB3xRuFDKLogo69Shmqzv73fv0rPEFrsmDwfYJ6
         tpjA==
X-Gm-Message-State: AOJu0YxrMn7VAIEmQNv1u7iH2CWY8MxRveG6Vdu7X8k6/B3QbLsuHygs
	K6muzpTJOAR55gkXkam9XJ5ojh6S1oP0rto0hZ9wSaEv1DlpnDFVqZps4p4g1lOhov8=
X-Gm-Gg: AeBDietHDPy85Lhsrc8R1fF6ZkYasQQJYrGzj9QT47bh0O/6czpN2cX4Kod2Ix//oxq
	gO8q2NJr4qETZYMTAlUmE5OSw54BspB/9OSOxb+ysSwo4Dwjycp6+8s9sr7s+KShxl49s152RF/
	TnzspIKQ8u3YIoeJoZw7kuHB+SG8C7EgTYKy5YVgI/yvbEw9E3hRgISQ03LAwNNYcinATN09fYY
	DMaAbpehqDklAVMPLj7odn0FgacFqgyMjpl/KPJyHfdbQ/czdNZR7NAgOecj+tqkWNpSCQjhNZr
	6jx+Ren7BP4YjSOS0rHBPA5lCIWFTzswGEdE6z2cHnaHTQaWj8+xnnjTQUhEiFpbidE4GgRyiXw
	dZKC3eQHbH3QASSEAeMIMinBdwvCkuQcZGXwFDeGP9J8wKhOAr8xVv2RDYU6SLGz5pZ6HZ3LKNl
	pxGKiM/eVFa+NxMf3/cuIwQTV3UyChq5L1gbDhfI2j5XPzOiKH+NGaIG4FKz6/t2xP3HiGDEB1V
	NPYNmc6AMNkCdo=
X-Received: by 2002:a05:600c:1f83:b0:488:a82f:bba9 with SMTP id 5b1f17b1804b1-488d6864dd2mr244312555e9.22.1776177605671;
        Tue, 14 Apr 2026 07:40:05 -0700 (PDT)
Received: from ?IPV6:2001:861:c12:13d0:5627:3bd0:f3ee:8a22? ([2001:861:c12:13d0:5627:3bd0:f3ee:8a22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede2519dsm57094505e9.8.2026.04.14.07.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:40:05 -0700 (PDT)
Message-ID: <e0df77e3-d0dd-4f81-aebb-578091b202c0@linaro.org>
Date: Tue, 14 Apr 2026 16:40:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 11/12] drm/msm/dpu: rewrite
 _dpu_format_populate_plane_sizes_ubwc()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
 <20251114-dpu-formats-v3-11-cae312379d49@oss.qualcomm.com>
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
In-Reply-To: <20251114-dpu-formats-v3-11-cae312379d49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-103148-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,cosmicpenguin.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,linaro.org:replyto,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 411ED3FB6E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11/14/25 04:43, Dmitry Baryshkov wrote:
> Drop extra wrapping layer (msm_media_info.h) and inline all VENUS_*()
> functions, simplifying the code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  121 ++-
>   drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
>   2 files changed, 57 insertions(+), 1219 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 191d1f2a0cef7ed69342eceb35df0c3e99a0c373..da1870ce7680899759d09caa01050eeb9844a484 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -7,10 +7,19 @@
>   #include <uapi/drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
>   
> -#include "msm_media_info.h"
>   #include "dpu_kms.h"
>   #include "dpu_formats.h"
>   
> +#ifndef MSM_MEDIA_ALIGN
> +#define MSM_MEDIA_ALIGN(__sz, __align) (((__align) & ((__align) - 1)) ?\
> +	((((__sz) + (__align) - 1) / (__align)) * (__align)) :\
> +	(((__sz) + (__align) - 1) & (~((__align) - 1))))
> +#endif
> +
> +#ifndef MSM_MEDIA_ROUNDUP
> +#define MSM_MEDIA_ROUNDUP(__sz, __r) (((__sz) + ((__r) - 1)) / (__r))
> +#endif
> +
>   #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
>   
>   /*
> @@ -54,90 +63,70 @@ static void _dpu_get_v_h_subsample_rate(
>   	}
>   }
>   
> -static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
> -{
> -	static const struct dpu_media_color_map dpu_media_ubwc_map[] = {
> -		{DRM_FORMAT_ABGR8888, COLOR_FMT_RGBA8888_UBWC},
> -		{DRM_FORMAT_ARGB8888, COLOR_FMT_RGBA8888_UBWC},
> -		{DRM_FORMAT_XBGR8888, COLOR_FMT_RGBA8888_UBWC},
> -		{DRM_FORMAT_XRGB8888, COLOR_FMT_RGBA8888_UBWC},
> -		{DRM_FORMAT_ABGR2101010, COLOR_FMT_RGBA1010102_UBWC},
> -		{DRM_FORMAT_ARGB2101010, COLOR_FMT_RGBA1010102_UBWC},
> -		{DRM_FORMAT_XRGB2101010, COLOR_FMT_RGBA1010102_UBWC},
> -		{DRM_FORMAT_XBGR2101010, COLOR_FMT_RGBA1010102_UBWC},
> -		{DRM_FORMAT_BGR565, COLOR_FMT_RGB565_UBWC},
> -	};
> -	int color_fmt = -1;
> -	int i;
> -
> -	if (fmt->pixel_format == DRM_FORMAT_NV12 ||
> -	    fmt->pixel_format == DRM_FORMAT_P010) {
> -		if (MSM_FORMAT_IS_DX(fmt)) {
> -			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT)
> -				color_fmt = COLOR_FMT_NV12_BPP10_UBWC;
> -			else
> -				color_fmt = COLOR_FMT_P010_UBWC;
> -		} else
> -			color_fmt = COLOR_FMT_NV12_UBWC;
> -		return color_fmt;
> -	}
> -
> -	for (i = 0; i < ARRAY_SIZE(dpu_media_ubwc_map); ++i)
> -		if (fmt->pixel_format == dpu_media_ubwc_map[i].format) {
> -			color_fmt = dpu_media_ubwc_map[i].color;
> -			break;
> -		}
> -	return color_fmt;
> -}
> -
>   static int _dpu_format_populate_plane_sizes_ubwc(
>   		const struct msm_format *fmt,
>   		struct drm_framebuffer *fb,
>   		struct dpu_hw_fmt_layout *layout)
>   {
> -	int color;
>   	bool meta = MSM_FORMAT_IS_UBWC(fmt);
>   
> -	color = _dpu_format_get_media_color_ubwc(fmt);
> -	if (color < 0) {
> -		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
> -			  &fmt->pixel_format);
> -		return -EINVAL;
> -	}
> -
>   	if (MSM_FORMAT_IS_YUV(fmt)) {
> -		uint32_t y_sclines, uv_sclines;
> -		uint32_t y_meta_scanlines = 0;
> -		uint32_t uv_meta_scanlines = 0;
> +		unsigned int stride, sclines;
> +		unsigned int y_tile_width, y_tile_height;
> +		unsigned int y_meta_stride, y_meta_scanlines;
> +		unsigned int uv_meta_stride, uv_meta_scanlines;
> +
> +		if (MSM_FORMAT_IS_DX(fmt)) {
> +			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
> +				stride = MSM_MEDIA_ALIGN(fb->width, 192);
> +				stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
> +				y_tile_width = 48;
> +			} else {
> +				stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
> +				y_tile_width = 32;
> +			}
> +
> +			sclines = MSM_MEDIA_ALIGN(fb->height, 16);
> +			y_tile_height = 4;
> +		} else {
> +			stride = MSM_MEDIA_ALIGN(fb->width, 128);
> +			y_tile_width = 32;
> +
> +			sclines = MSM_MEDIA_ALIGN(fb->height, 32);
> +			y_tile_height = 8;
> +		}
>   
> -		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
> -		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
> +		layout->plane_pitch[0] = stride;
>   		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
> -			y_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> +			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
> -		layout->plane_pitch[1] = VENUS_UV_STRIDE(color, fb->width);
> -		uv_sclines = VENUS_UV_SCANLINES(color, fb->height);
> +		layout->plane_pitch[1] = stride;
>   		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
> -			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> +			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);

UV needs a sclines calculated with (fb->height+1)>>1, VENUS_UV_SCANLINES() & VENUS_Y_SCANLINES() calculations are different.

Sending a patch to fix it.

Neil

>   
>   		if (!meta)
>   			return 0;
>   
> -		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
> -		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
> +		y_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, y_tile_width);
> +		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(y_meta_stride, 64);
> +
> +		y_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, y_tile_height);
> +		y_meta_scanlines = MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
>   		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
>   			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
> -		layout->plane_pitch[3] = VENUS_UV_META_STRIDE(color, fb->width);
> -		uv_meta_scanlines = VENUS_UV_META_SCANLINES(color, fb->height);
> +		uv_meta_stride = MSM_MEDIA_ROUNDUP((fb->width+1)>>1, y_tile_width / 2);
> +		layout->plane_pitch[3] = MSM_MEDIA_ALIGN(uv_meta_stride, 64);
> +
> +		uv_meta_scanlines = MSM_MEDIA_ROUNDUP((fb->height+1)>>1, y_tile_height);
> +		uv_meta_scanlines = MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
>   		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
>   			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> -
>   	} else {
> -		uint32_t rgb_scanlines, rgb_meta_scanlines;
> +		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
>   
> -		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
> -		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
> +		layout->plane_pitch[0] = MSM_MEDIA_ALIGN(fb->width * fmt->bpp, 256);
> +		rgb_scanlines = MSM_MEDIA_ALIGN(fb->height, 16);
>   		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
>   			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
> @@ -147,8 +136,12 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   		/* uAPI leaves plane[1] empty and plane[2] as meta */
>   		layout->num_planes += 1;
>   
> -		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
> -		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
> +		rgb_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, 16);
> +		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
> +
> +		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, 4);
> +		rgb_meta_scanlines = MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
> +
>   		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
>   			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h b/drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h
> deleted file mode 100644
> index 9fc9dbde8a27c1d7078c3d6b260c8635f27a514f..0000000000000000000000000000000000000000
> --- a/drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h
> +++ /dev/null
> @@ -1,1155 +0,0 @@
> -#ifndef __MEDIA_INFO_H__
> -#define __MEDIA_INFO_H__
> -
> -#ifndef MSM_MEDIA_ALIGN
> -#define MSM_MEDIA_ALIGN(__sz, __align) (((__align) & ((__align) - 1)) ?\
> -	((((__sz) + (__align) - 1) / (__align)) * (__align)) :\
> -	(((__sz) + (__align) - 1) & (~((__align) - 1))))
> -#endif
> -
> -#ifndef MSM_MEDIA_ROUNDUP
> -#define MSM_MEDIA_ROUNDUP(__sz, __r) (((__sz) + ((__r) - 1)) / (__r))
> -#endif
> -
> -#ifndef MSM_MEDIA_MAX
> -#define MSM_MEDIA_MAX(__a, __b) ((__a) > (__b)?(__a):(__b))
> -#endif
> -
> -enum color_fmts {
> -	/* Venus NV12:
> -	 * YUV 4:2:0 image with a plane of 8 bit Y samples followed
> -	 * by an interleaved U/V plane containing 8 bit 2x2 subsampled
> -	 * colour difference samples.
> -	 *
> -	 * <-------- Y/UV_Stride -------->
> -	 * <------- Width ------->
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              V
> -	 * U V U V U V U V U V U V . . . .  ^
> -	 * U V U V U V U V U V U V . . . .  |
> -	 * U V U V U V U V U V U V . . . .  |
> -	 * U V U V U V U V U V U V . . . .  UV_Scanlines
> -	 * . . . . . . . . . . . . . . . .  |
> -	 * . . . . . . . . . . . . . . . .  V
> -	 * . . . . . . . . . . . . . . . .  --> Buffer size alignment
> -	 *
> -	 * Y_Stride : Width aligned to 128
> -	 * UV_Stride : Width aligned to 128
> -	 * Y_Scanlines: Height aligned to 32
> -	 * UV_Scanlines: Height/2 aligned to 16
> -	 * Extradata: Arbitrary (software-imposed) padding
> -	 * Total size = align((Y_Stride * Y_Scanlines
> -	 *          + UV_Stride * UV_Scanlines
> -	 *          + max(Extradata, Y_Stride * 8), 4096)
> -	 */
> -	COLOR_FMT_NV12,
> -
> -	/* Venus NV21:
> -	 * YUV 4:2:0 image with a plane of 8 bit Y samples followed
> -	 * by an interleaved V/U plane containing 8 bit 2x2 subsampled
> -	 * colour difference samples.
> -	 *
> -	 * <-------- Y/UV_Stride -------->
> -	 * <------- Width ------->
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              V
> -	 * V U V U V U V U V U V U . . . .  ^
> -	 * V U V U V U V U V U V U . . . .  |
> -	 * V U V U V U V U V U V U . . . .  |
> -	 * V U V U V U V U V U V U . . . .  UV_Scanlines
> -	 * . . . . . . . . . . . . . . . .  |
> -	 * . . . . . . . . . . . . . . . .  V
> -	 * . . . . . . . . . . . . . . . .  --> Padding & Buffer size alignment
> -	 *
> -	 * Y_Stride : Width aligned to 128
> -	 * UV_Stride : Width aligned to 128
> -	 * Y_Scanlines: Height aligned to 32
> -	 * UV_Scanlines: Height/2 aligned to 16
> -	 * Extradata: Arbitrary (software-imposed) padding
> -	 * Total size = align((Y_Stride * Y_Scanlines
> -	 *          + UV_Stride * UV_Scanlines
> -	 *          + max(Extradata, Y_Stride * 8), 4096)
> -	 */
> -	COLOR_FMT_NV21,
> -	/* Venus NV12_MVTB:
> -	 * Two YUV 4:2:0 images/views one after the other
> -	 * in a top-bottom layout, same as NV12
> -	 * with a plane of 8 bit Y samples followed
> -	 * by an interleaved U/V plane containing 8 bit 2x2 subsampled
> -	 * colour difference samples.
> -	 *
> -	 *
> -	 * <-------- Y/UV_Stride -------->
> -	 * <------- Width ------->
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^               ^
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines      |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |               |
> -	 * . . . . . . . . . . . . . . . .              |             View_1
> -	 * . . . . . . . . . . . . . . . .              |               |
> -	 * . . . . . . . . . . . . . . . .              |               |
> -	 * . . . . . . . . . . . . . . . .              V               |
> -	 * U V U V U V U V U V U V . . . .  ^                           |
> -	 * U V U V U V U V U V U V . . . .  |                           |
> -	 * U V U V U V U V U V U V . . . .  |                           |
> -	 * U V U V U V U V U V U V . . . .  UV_Scanlines                |
> -	 * . . . . . . . . . . . . . . . .  |                           |
> -	 * . . . . . . . . . . . . . . . .  V                           V
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^               ^
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines      |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |               |
> -	 * . . . . . . . . . . . . . . . .              |             View_2
> -	 * . . . . . . . . . . . . . . . .              |               |
> -	 * . . . . . . . . . . . . . . . .              |               |
> -	 * . . . . . . . . . . . . . . . .              V               |
> -	 * U V U V U V U V U V U V . . . .  ^                           |
> -	 * U V U V U V U V U V U V . . . .  |                           |
> -	 * U V U V U V U V U V U V . . . .  |                           |
> -	 * U V U V U V U V U V U V . . . .  UV_Scanlines                |
> -	 * . . . . . . . . . . . . . . . .  |                           |
> -	 * . . . . . . . . . . . . . . . .  V                           V
> -	 * . . . . . . . . . . . . . . . .  --> Buffer size alignment
> -	 *
> -	 * Y_Stride : Width aligned to 128
> -	 * UV_Stride : Width aligned to 128
> -	 * Y_Scanlines: Height aligned to 32
> -	 * UV_Scanlines: Height/2 aligned to 16
> -	 * View_1 begin at: 0 (zero)
> -	 * View_2 begin at: Y_Stride * Y_Scanlines + UV_Stride * UV_Scanlines
> -	 * Extradata: Arbitrary (software-imposed) padding
> -	 * Total size = align((2*(Y_Stride * Y_Scanlines)
> -	 *          + 2*(UV_Stride * UV_Scanlines) + Extradata), 4096)
> -	 */
> -	COLOR_FMT_NV12_MVTB,
> -	/*
> -	 * The buffer can be of 2 types:
> -	 * (1) Venus NV12 UBWC Progressive
> -	 * (2) Venus NV12 UBWC Interlaced
> -	 *
> -	 * (1) Venus NV12 UBWC Progressive Buffer Format:
> -	 * Compressed Macro-tile format for NV12.
> -	 * Contains 4 planes in the following order -
> -	 * (A) Y_Meta_Plane
> -	 * (B) Y_UBWC_Plane
> -	 * (C) UV_Meta_Plane
> -	 * (D) UV_UBWC_Plane
> -	 *
> -	 * Y_Meta_Plane consists of meta information to decode compressed
> -	 * tile data in Y_UBWC_Plane.
> -	 * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
> -	 * UBWC decoder block will use the Y_Meta_Plane data together with
> -	 * Y_UBWC_Plane data to produce loss-less uncompressed 8 bit Y samples.
> -	 *
> -	 * UV_Meta_Plane consists of meta information to decode compressed
> -	 * tile data in UV_UBWC_Plane.
> -	 * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
> -	 * UBWC decoder block will use UV_Meta_Plane data together with
> -	 * UV_UBWC_Plane data to produce loss-less uncompressed 8 bit 2x2
> -	 * subsampled color difference samples.
> -	 *
> -	 * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
> -	 * and randomly accessible. There is no dependency between tiles.
> -	 *
> -	 * <----- Y_Meta_Stride ---->
> -	 * <-------- Width ------>
> -	 * M M M M M M M M M M M M . .      ^           ^
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      Height      |
> -	 * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      V           |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . .                  V
> -	 * <--Compressed tile Y Stride--->
> -	 * <------- Width ------->
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . . . .              V
> -	 * <----- UV_Meta_Stride ---->
> -	 * M M M M M M M M M M M M . .      ^
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      M_UV_Scanlines
> -	 * . . . . . . . . . . . . . .      |
> -	 * . . . . . . . . . . . . . .      V
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * <--Compressed tile UV Stride--->
> -	 * U* V* U* V* U* V* U* V* . . . .  ^
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines
> -	 * . . . . . . . . . . . . . . . .  |
> -	 * . . . . . . . . . . . . . . . .  V
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 *
> -	 * Y_Stride = align(Width, 128)
> -	 * UV_Stride = align(Width, 128)
> -	 * Y_Scanlines = align(Height, 32)
> -	 * UV_Scanlines = align(Height/2, 16)
> -	 * Y_UBWC_Plane_size = align(Y_Stride * Y_Scanlines, 4096)
> -	 * UV_UBWC_Plane_size = align(UV_Stride * UV_Scanlines, 4096)
> -	 * Y_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
> -	 * Y_Meta_Scanlines = align(roundup(Height, Y_TileHeight), 16)
> -	 * Y_Meta_Plane_size = align(Y_Meta_Stride * Y_Meta_Scanlines, 4096)
> -	 * UV_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
> -	 * UV_Meta_Scanlines = align(roundup(Height, UV_TileHeight), 16)
> -	 * UV_Meta_Plane_size = align(UV_Meta_Stride * UV_Meta_Scanlines, 4096)
> -	 * Extradata = 8k
> -	 *
> -	 * Total size = align( Y_UBWC_Plane_size + UV_UBWC_Plane_size +
> -	 *           Y_Meta_Plane_size + UV_Meta_Plane_size
> -	 *           + max(Extradata, Y_Stride * 48), 4096)
> -	 *
> -	 *
> -	 * (2) Venus NV12 UBWC Interlaced Buffer Format:
> -	 * Compressed Macro-tile format for NV12 interlaced.
> -	 * Contains 8 planes in the following order -
> -	 * (A) Y_Meta_Top_Field_Plane
> -	 * (B) Y_UBWC_Top_Field_Plane
> -	 * (C) UV_Meta_Top_Field_Plane
> -	 * (D) UV_UBWC_Top_Field_Plane
> -	 * (E) Y_Meta_Bottom_Field_Plane
> -	 * (F) Y_UBWC_Bottom_Field_Plane
> -	 * (G) UV_Meta_Bottom_Field_Plane
> -	 * (H) UV_UBWC_Bottom_Field_Plane
> -	 * Y_Meta_Top_Field_Plane consists of meta information to decode
> -	 * compressed tile data for Y_UBWC_Top_Field_Plane.
> -	 * Y_UBWC_Top_Field_Plane consists of Y data in compressed macro-tile
> -	 * format for top field of an interlaced frame.
> -	 * UBWC decoder block will use the Y_Meta_Top_Field_Plane data together
> -	 * with Y_UBWC_Top_Field_Plane data to produce loss-less uncompressed
> -	 * 8 bit Y samples for top field of an interlaced frame.
> -	 *
> -	 * UV_Meta_Top_Field_Plane consists of meta information to decode
> -	 * compressed tile data in UV_UBWC_Top_Field_Plane.
> -	 * UV_UBWC_Top_Field_Plane consists of UV data in compressed macro-tile
> -	 * format for top field of an interlaced frame.
> -	 * UBWC decoder block will use UV_Meta_Top_Field_Plane data together
> -	 * with UV_UBWC_Top_Field_Plane data to produce loss-less uncompressed
> -	 * 8 bit subsampled color difference samples for top field of an
> -	 * interlaced frame.
> -	 *
> -	 * Each tile in Y_UBWC_Top_Field_Plane/UV_UBWC_Top_Field_Plane is
> -	 * independently decodable and randomly accessible. There is no
> -	 * dependency between tiles.
> -	 *
> -	 * Y_Meta_Bottom_Field_Plane consists of meta information to decode
> -	 * compressed tile data for Y_UBWC_Bottom_Field_Plane.
> -	 * Y_UBWC_Bottom_Field_Plane consists of Y data in compressed macro-tile
> -	 * format for bottom field of an interlaced frame.
> -	 * UBWC decoder block will use the Y_Meta_Bottom_Field_Plane data
> -	 * together with Y_UBWC_Bottom_Field_Plane data to produce loss-less
> -	 * uncompressed 8 bit Y samples for bottom field of an interlaced frame.
> -	 *
> -	 * UV_Meta_Bottom_Field_Plane consists of meta information to decode
> -	 * compressed tile data in UV_UBWC_Bottom_Field_Plane.
> -	 * UV_UBWC_Bottom_Field_Plane consists of UV data in compressed
> -	 * macro-tile format for bottom field of an interlaced frame.
> -	 * UBWC decoder block will use UV_Meta_Bottom_Field_Plane data together
> -	 * with UV_UBWC_Bottom_Field_Plane data to produce loss-less
> -	 * uncompressed 8 bit subsampled color difference samples for bottom
> -	 * field of an interlaced frame.
> -	 *
> -	 * Each tile in Y_UBWC_Bottom_Field_Plane/UV_UBWC_Bottom_Field_Plane is
> -	 * independently decodable and randomly accessible. There is no
> -	 * dependency between tiles.
> -	 *
> -	 * <-----Y_TF_Meta_Stride---->
> -	 * <-------- Width ------>
> -	 * M M M M M M M M M M M M . .      ^           ^
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . . Half_height      |
> -	 * M M M M M M M M M M M M . .      |         Meta_Y_TF_Scanlines
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      V           |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . .                  V
> -	 * <-Compressed tile Y_TF Stride->
> -	 * <------- Width ------->
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . . Half_height  |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_TF_Scanlines
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . . . .              V
> -	 * <----UV_TF_Meta_Stride---->
> -	 * M M M M M M M M M M M M . .      ^
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      M_UV_TF_Scanlines
> -	 * . . . . . . . . . . . . . .      |
> -	 * . . . . . . . . . . . . . .      V
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * <-Compressed tile UV_TF Stride->
> -	 * U* V* U* V* U* V* U* V* . . . .  ^
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  UV_TF_Scanlines
> -	 * . . . . . . . . . . . . . . . .  |
> -	 * . . . . . . . . . . . . . . . .  V
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 * <-----Y_BF_Meta_Stride---->
> -	 * <-------- Width ------>
> -	 * M M M M M M M M M M M M . .      ^           ^
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . . Half_height      |
> -	 * M M M M M M M M M M M M . .      |         Meta_Y_BF_Scanlines
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      V           |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . .                  V
> -	 * <-Compressed tile Y_BF Stride->
> -	 * <------- Width ------->
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . . Half_height  |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_BF_Scanlines
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . . . .              V
> -	 * <----UV_BF_Meta_Stride---->
> -	 * M M M M M M M M M M M M . .      ^
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      M_UV_BF_Scanlines
> -	 * . . . . . . . . . . . . . .      |
> -	 * . . . . . . . . . . . . . .      V
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * <-Compressed tile UV_BF Stride->
> -	 * U* V* U* V* U* V* U* V* . . . .  ^
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  UV_BF_Scanlines
> -	 * . . . . . . . . . . . . . . . .  |
> -	 * . . . . . . . . . . . . . . . .  V
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 *
> -	 * Half_height = (Height+1)>>1
> -	 * Y_TF_Stride = align(Width, 128)
> -	 * UV_TF_Stride = align(Width, 128)
> -	 * Y_TF_Scanlines = align(Half_height, 32)
> -	 * UV_TF_Scanlines = align((Half_height+1)/2, 32)
> -	 * Y_UBWC_TF_Plane_size = align(Y_TF_Stride * Y_TF_Scanlines, 4096)
> -	 * UV_UBWC_TF_Plane_size = align(UV_TF_Stride * UV_TF_Scanlines, 4096)
> -	 * Y_TF_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
> -	 * Y_TF_Meta_Scanlines = align(roundup(Half_height, Y_TileHeight), 16)
> -	 * Y_TF_Meta_Plane_size =
> -	 *     align(Y_TF_Meta_Stride * Y_TF_Meta_Scanlines, 4096)
> -	 * UV_TF_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
> -	 * UV_TF_Meta_Scanlines = align(roundup(Half_height, UV_TileHeight), 16)
> -	 * UV_TF_Meta_Plane_size =
> -	 *     align(UV_TF_Meta_Stride * UV_TF_Meta_Scanlines, 4096)
> -	 * Y_BF_Stride = align(Width, 128)
> -	 * UV_BF_Stride = align(Width, 128)
> -	 * Y_BF_Scanlines = align(Half_height, 32)
> -	 * UV_BF_Scanlines = align((Half_height+1)/2, 32)
> -	 * Y_UBWC_BF_Plane_size = align(Y_BF_Stride * Y_BF_Scanlines, 4096)
> -	 * UV_UBWC_BF_Plane_size = align(UV_BF_Stride * UV_BF_Scanlines, 4096)
> -	 * Y_BF_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
> -	 * Y_BF_Meta_Scanlines = align(roundup(Half_height, Y_TileHeight), 16)
> -	 * Y_BF_Meta_Plane_size =
> -	 *     align(Y_BF_Meta_Stride * Y_BF_Meta_Scanlines, 4096)
> -	 * UV_BF_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
> -	 * UV_BF_Meta_Scanlines = align(roundup(Half_height, UV_TileHeight), 16)
> -	 * UV_BF_Meta_Plane_size =
> -	 *     align(UV_BF_Meta_Stride * UV_BF_Meta_Scanlines, 4096)
> -	 * Extradata = 8k
> -	 *
> -	 * Total size = align( Y_UBWC_TF_Plane_size + UV_UBWC_TF_Plane_size +
> -	 *           Y_TF_Meta_Plane_size + UV_TF_Meta_Plane_size +
> -	 *			 Y_UBWC_BF_Plane_size + UV_UBWC_BF_Plane_size +
> -	 *           Y_BF_Meta_Plane_size + UV_BF_Meta_Plane_size +
> -	 *           + max(Extradata, Y_TF_Stride * 48), 4096)
> -	 */
> -	COLOR_FMT_NV12_UBWC,
> -	/* Venus NV12 10-bit UBWC:
> -	 * Compressed Macro-tile format for NV12.
> -	 * Contains 4 planes in the following order -
> -	 * (A) Y_Meta_Plane
> -	 * (B) Y_UBWC_Plane
> -	 * (C) UV_Meta_Plane
> -	 * (D) UV_UBWC_Plane
> -	 *
> -	 * Y_Meta_Plane consists of meta information to decode compressed
> -	 * tile data in Y_UBWC_Plane.
> -	 * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
> -	 * UBWC decoder block will use the Y_Meta_Plane data together with
> -	 * Y_UBWC_Plane data to produce loss-less uncompressed 10 bit Y samples.
> -	 *
> -	 * UV_Meta_Plane consists of meta information to decode compressed
> -	 * tile data in UV_UBWC_Plane.
> -	 * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
> -	 * UBWC decoder block will use UV_Meta_Plane data together with
> -	 * UV_UBWC_Plane data to produce loss-less uncompressed 10 bit 2x2
> -	 * subsampled color difference samples.
> -	 *
> -	 * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
> -	 * and randomly accessible. There is no dependency between tiles.
> -	 *
> -	 * <----- Y_Meta_Stride ----->
> -	 * <-------- Width ------>
> -	 * M M M M M M M M M M M M . .      ^           ^
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      Height      |
> -	 * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      V           |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . .                  V
> -	 * <--Compressed tile Y Stride--->
> -	 * <------- Width ------->
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . . . .              V
> -	 * <----- UV_Meta_Stride ---->
> -	 * M M M M M M M M M M M M . .      ^
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      M_UV_Scanlines
> -	 * . . . . . . . . . . . . . .      |
> -	 * . . . . . . . . . . . . . .      V
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * <--Compressed tile UV Stride--->
> -	 * U* V* U* V* U* V* U* V* . . . .  ^
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines
> -	 * . . . . . . . . . . . . . . . .  |
> -	 * . . . . . . . . . . . . . . . .  V
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 *
> -	 *
> -	 * Y_Stride = align(Width * 4/3, 128)
> -	 * UV_Stride = align(Width * 4/3, 128)
> -	 * Y_Scanlines = align(Height, 32)
> -	 * UV_Scanlines = align(Height/2, 16)
> -	 * Y_UBWC_Plane_Size = align(Y_Stride * Y_Scanlines, 4096)
> -	 * UV_UBWC_Plane_Size = align(UV_Stride * UV_Scanlines, 4096)
> -	 * Y_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
> -	 * Y_Meta_Scanlines = align(roundup(Height, Y_TileHeight), 16)
> -	 * Y_Meta_Plane_size = align(Y_Meta_Stride * Y_Meta_Scanlines, 4096)
> -	 * UV_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
> -	 * UV_Meta_Scanlines = align(roundup(Height, UV_TileHeight), 16)
> -	 * UV_Meta_Plane_size = align(UV_Meta_Stride * UV_Meta_Scanlines, 4096)
> -	 * Extradata = 8k
> -	 *
> -	 * Total size = align(Y_UBWC_Plane_size + UV_UBWC_Plane_size +
> -	 *           Y_Meta_Plane_size + UV_Meta_Plane_size
> -	 *           + max(Extradata, Y_Stride * 48), 4096)
> -	 */
> -	COLOR_FMT_NV12_BPP10_UBWC,
> -	/* Venus RGBA8888 format:
> -	 * Contains 1 plane in the following order -
> -	 * (A) RGBA plane
> -	 *
> -	 * <-------- RGB_Stride -------->
> -	 * <------- Width ------->
> -	 * R R R R R R R R R R R R . . . .  ^           ^
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  Height      |
> -	 * R R R R R R R R R R R R . . . .  |       RGB_Scanlines
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              V
> -	 *
> -	 * RGB_Stride = align(Width * 4, 128)
> -	 * RGB_Scanlines = align(Height, 32)
> -	 * RGB_Plane_size = align(RGB_Stride * RGB_Scanlines, 4096)
> -	 * Extradata = 8k
> -	 *
> -	 * Total size = align(RGB_Plane_size + Extradata, 4096)
> -	 */
> -	COLOR_FMT_RGBA8888,
> -	/* Venus RGBA8888 UBWC format:
> -	 * Contains 2 planes in the following order -
> -	 * (A) Meta plane
> -	 * (B) RGBA plane
> -	 *
> -	 * <--- RGB_Meta_Stride ---->
> -	 * <-------- Width ------>
> -	 * M M M M M M M M M M M M . .      ^           ^
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      Height      |
> -	 * M M M M M M M M M M M M . .      |       Meta_RGB_Scanlines
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      V           |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . .                  V
> -	 * <-------- RGB_Stride -------->
> -	 * <------- Width ------->
> -	 * R R R R R R R R R R R R . . . .  ^           ^
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  Height      |
> -	 * R R R R R R R R R R R R . . . .  |       RGB_Scanlines
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .    -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . . . .              V
> -	 *
> -	 * RGB_Stride = align(Width * 4, 128)
> -	 * RGB_Scanlines = align(Height, 32)
> -	 * RGB_Plane_size = align(RGB_Stride * RGB_Scanlines, 4096)
> -	 * RGB_Meta_Stride = align(roundup(Width, RGB_TileWidth), 64)
> -	 * RGB_Meta_Scanline = align(roundup(Height, RGB_TileHeight), 16)
> -	 * RGB_Meta_Plane_size = align(RGB_Meta_Stride *
> -	 *		RGB_Meta_Scanlines, 4096)
> -	 * Extradata = 8k
> -	 *
> -	 * Total size = align(RGB_Meta_Plane_size + RGB_Plane_size +
> -	 *		Extradata, 4096)
> -	 */
> -	COLOR_FMT_RGBA8888_UBWC,
> -	/* Venus RGBA1010102 UBWC format:
> -	 * Contains 2 planes in the following order -
> -	 * (A) Meta plane
> -	 * (B) RGBA plane
> -	 *
> -	 * <--- RGB_Meta_Stride ---->
> -	 * <-------- Width ------>
> -	 * M M M M M M M M M M M M . .      ^           ^
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      Height      |
> -	 * M M M M M M M M M M M M . .      |       Meta_RGB_Scanlines
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      V           |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . .                  V
> -	 * <-------- RGB_Stride -------->
> -	 * <------- Width ------->
> -	 * R R R R R R R R R R R R . . . .  ^           ^
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  Height      |
> -	 * R R R R R R R R R R R R . . . .  |       RGB_Scanlines
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .    -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . . . .              V
> -	 *
> -	 * RGB_Stride = align(Width * 4, 256)
> -	 * RGB_Scanlines = align(Height, 16)
> -	 * RGB_Plane_size = align(RGB_Stride * RGB_Scanlines, 4096)
> -	 * RGB_Meta_Stride = align(roundup(Width, RGB_TileWidth), 64)
> -	 * RGB_Meta_Scanline = align(roundup(Height, RGB_TileHeight), 16)
> -	 * RGB_Meta_Plane_size = align(RGB_Meta_Stride *
> -	 *		RGB_Meta_Scanlines, 4096)
> -	 * Extradata = 8k
> -	 *
> -	 * Total size = align(RGB_Meta_Plane_size + RGB_Plane_size +
> -	 *		Extradata, 4096)
> -	 */
> -	COLOR_FMT_RGBA1010102_UBWC,
> -	/* Venus RGB565 UBWC format:
> -	 * Contains 2 planes in the following order -
> -	 * (A) Meta plane
> -	 * (B) RGB plane
> -	 *
> -	 * <--- RGB_Meta_Stride ---->
> -	 * <-------- Width ------>
> -	 * M M M M M M M M M M M M . .      ^           ^
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      Height      |
> -	 * M M M M M M M M M M M M . .      |       Meta_RGB_Scanlines
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      V           |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . .                  V
> -	 * <-------- RGB_Stride -------->
> -	 * <------- Width ------->
> -	 * R R R R R R R R R R R R . . . .  ^           ^
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  Height      |
> -	 * R R R R R R R R R R R R . . . .  |       RGB_Scanlines
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  |           |
> -	 * R R R R R R R R R R R R . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .    -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . . . .              V
> -	 *
> -	 * RGB_Stride = align(Width * 2, 128)
> -	 * RGB_Scanlines = align(Height, 16)
> -	 * RGB_Plane_size = align(RGB_Stride * RGB_Scanlines, 4096)
> -	 * RGB_Meta_Stride = align(roundup(Width, RGB_TileWidth), 64)
> -	 * RGB_Meta_Scanline = align(roundup(Height, RGB_TileHeight), 16)
> -	 * RGB_Meta_Plane_size = align(RGB_Meta_Stride *
> -	 *		RGB_Meta_Scanlines, 4096)
> -	 * Extradata = 8k
> -	 *
> -	 * Total size = align(RGB_Meta_Plane_size + RGB_Plane_size +
> -	 *		Extradata, 4096)
> -	 */
> -	COLOR_FMT_RGB565_UBWC,
> -	/* P010 UBWC:
> -	 * Compressed Macro-tile format for NV12.
> -	 * Contains 4 planes in the following order -
> -	 * (A) Y_Meta_Plane
> -	 * (B) Y_UBWC_Plane
> -	 * (C) UV_Meta_Plane
> -	 * (D) UV_UBWC_Plane
> -	 *
> -	 * Y_Meta_Plane consists of meta information to decode compressed
> -	 * tile data in Y_UBWC_Plane.
> -	 * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
> -	 * UBWC decoder block will use the Y_Meta_Plane data together with
> -	 * Y_UBWC_Plane data to produce loss-less uncompressed 10 bit Y samples.
> -	 *
> -	 * UV_Meta_Plane consists of meta information to decode compressed
> -	 * tile data in UV_UBWC_Plane.
> -	 * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
> -	 * UBWC decoder block will use UV_Meta_Plane data together with
> -	 * UV_UBWC_Plane data to produce loss-less uncompressed 10 bit 2x2
> -	 * subsampled color difference samples.
> -	 *
> -	 * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
> -	 * and randomly accessible. There is no dependency between tiles.
> -	 *
> -	 * <----- Y_Meta_Stride ----->
> -	 * <-------- Width ------>
> -	 * M M M M M M M M M M M M . .      ^           ^
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      Height      |
> -	 * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      |           |
> -	 * M M M M M M M M M M M M . .      V           |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .                  |
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . .                  V
> -	 * <--Compressed tile Y Stride--->
> -	 * <------- Width ------->
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> -	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 * . . . . . . . . . . . . . . . .              V
> -	 * <----- UV_Meta_Stride ---->
> -	 * M M M M M M M M M M M M . .      ^
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      |
> -	 * M M M M M M M M M M M M . .      M_UV_Scanlines
> -	 * . . . . . . . . . . . . . .      |
> -	 * . . . . . . . . . . . . . .      V
> -	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> -	 * <--Compressed tile UV Stride--->
> -	 * U* V* U* V* U* V* U* V* . . . .  ^
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  |
> -	 * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines
> -	 * . . . . . . . . . . . . . . . .  |
> -	 * . . . . . . . . . . . . . . . .  V
> -	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> -	 *
> -	 *
> -	 * Y_Stride = align(Width * 2, 256)
> -	 * UV_Stride = align(Width * 2, 256)
> -	 * Y_Scanlines = align(Height, 16)
> -	 * UV_Scanlines = align(Height/2, 16)
> -	 * Y_UBWC_Plane_Size = align(Y_Stride * Y_Scanlines, 4096)
> -	 * UV_UBWC_Plane_Size = align(UV_Stride * UV_Scanlines, 4096)
> -	 * Y_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
> -	 * Y_Meta_Scanlines = align(roundup(Height, Y_TileHeight), 16)
> -	 * Y_Meta_Plane_size = align(Y_Meta_Stride * Y_Meta_Scanlines, 4096)
> -	 * UV_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
> -	 * UV_Meta_Scanlines = align(roundup(Height, UV_TileHeight), 16)
> -	 * UV_Meta_Plane_size = align(UV_Meta_Stride * UV_Meta_Scanlines, 4096)
> -	 * Extradata = 8k
> -	 *
> -	 * Total size = align(Y_UBWC_Plane_size + UV_UBWC_Plane_size +
> -	 *           Y_Meta_Plane_size + UV_Meta_Plane_size
> -	 *           + max(Extradata, Y_Stride * 48), 4096)
> -	 */
> -	COLOR_FMT_P010_UBWC,
> -	/* Venus P010:
> -	 * YUV 4:2:0 image with a plane of 10 bit Y samples followed
> -	 * by an interleaved U/V plane containing 10 bit 2x2 subsampled
> -	 * colour difference samples.
> -	 *
> -	 * <-------- Y/UV_Stride -------->
> -	 * <------- Width ------->
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> -	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              |
> -	 * . . . . . . . . . . . . . . . .              V
> -	 * U V U V U V U V U V U V . . . .  ^
> -	 * U V U V U V U V U V U V . . . .  |
> -	 * U V U V U V U V U V U V . . . .  |
> -	 * U V U V U V U V U V U V . . . .  UV_Scanlines
> -	 * . . . . . . . . . . . . . . . .  |
> -	 * . . . . . . . . . . . . . . . .  V
> -	 * . . . . . . . . . . . . . . . .  --> Buffer size alignment
> -	 *
> -	 * Y_Stride : Width * 2 aligned to 128
> -	 * UV_Stride : Width * 2 aligned to 128
> -	 * Y_Scanlines: Height aligned to 32
> -	 * UV_Scanlines: Height/2 aligned to 16
> -	 * Extradata: Arbitrary (software-imposed) padding
> -	 * Total size = align((Y_Stride * Y_Scanlines
> -	 *          + UV_Stride * UV_Scanlines
> -	 *          + max(Extradata, Y_Stride * 8), 4096)
> -	 */
> -	COLOR_FMT_P010,
> -};
> -
> -#define COLOR_FMT_RGBA1010102_UBWC	COLOR_FMT_RGBA1010102_UBWC
> -#define COLOR_FMT_RGB565_UBWC		COLOR_FMT_RGB565_UBWC
> -#define COLOR_FMT_P010_UBWC		COLOR_FMT_P010_UBWC
> -#define COLOR_FMT_P010		COLOR_FMT_P010
> -
> -/*
> - * Function arguments:
> - * @color_fmt
> - * @width
> - * Progressive: width
> - * Interlaced: width
> - */
> -static unsigned int VENUS_Y_STRIDE(int color_fmt, int width)
> -{
> -	unsigned int stride = 0;
> -
> -	if (!width)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_NV21:
> -	case COLOR_FMT_NV12:
> -	case COLOR_FMT_NV12_MVTB:
> -	case COLOR_FMT_NV12_UBWC:
> -		stride = MSM_MEDIA_ALIGN(width, 128);
> -		break;
> -	case COLOR_FMT_NV12_BPP10_UBWC:
> -		stride = MSM_MEDIA_ALIGN(width, 192);
> -		stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
> -		break;
> -	case COLOR_FMT_P010_UBWC:
> -		stride = MSM_MEDIA_ALIGN(width * 2, 256);
> -		break;
> -	case COLOR_FMT_P010:
> -		stride = MSM_MEDIA_ALIGN(width * 2, 128);
> -		break;
> -	}
> -
> -	return stride;
> -}
> -
> -/*
> - * Function arguments:
> - * @color_fmt
> - * @width
> - * Progressive: width
> - * Interlaced: width
> - */
> -static unsigned int VENUS_UV_STRIDE(int color_fmt, int width)
> -{
> -	unsigned int stride = 0;
> -
> -	if (!width)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_NV21:
> -	case COLOR_FMT_NV12:
> -	case COLOR_FMT_NV12_MVTB:
> -	case COLOR_FMT_NV12_UBWC:
> -		stride = MSM_MEDIA_ALIGN(width, 128);
> -		break;
> -	case COLOR_FMT_NV12_BPP10_UBWC:
> -		stride = MSM_MEDIA_ALIGN(width, 192);
> -		stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
> -		break;
> -	case COLOR_FMT_P010_UBWC:
> -		stride = MSM_MEDIA_ALIGN(width * 2, 256);
> -		break;
> -	case COLOR_FMT_P010:
> -		stride = MSM_MEDIA_ALIGN(width * 2, 128);
> -		break;
> -	}
> -
> -	return stride;
> -}
> -
> -/*
> - * Function arguments:
> - * @color_fmt
> - * @height
> - * Progressive: height
> - * Interlaced: (height+1)>>1
> - */
> -static unsigned int VENUS_Y_SCANLINES(int color_fmt, int height)
> -{
> -	unsigned int sclines = 0;
> -
> -	if (!height)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_NV21:
> -	case COLOR_FMT_NV12:
> -	case COLOR_FMT_NV12_MVTB:
> -	case COLOR_FMT_NV12_UBWC:
> -	case COLOR_FMT_P010:
> -		sclines = MSM_MEDIA_ALIGN(height, 32);
> -		break;
> -	case COLOR_FMT_NV12_BPP10_UBWC:
> -	case COLOR_FMT_P010_UBWC:
> -		sclines = MSM_MEDIA_ALIGN(height, 16);
> -		break;
> -	}
> -
> -	return sclines;
> -}
> -
> -/*
> - * Function arguments:
> - * @color_fmt
> - * @height
> - * Progressive: height
> - * Interlaced: (height+1)>>1
> - */
> -static unsigned int VENUS_UV_SCANLINES(int color_fmt, int height)
> -{
> -	unsigned int sclines = 0;
> -
> -	if (!height)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_NV21:
> -	case COLOR_FMT_NV12:
> -	case COLOR_FMT_NV12_MVTB:
> -	case COLOR_FMT_NV12_BPP10_UBWC:
> -	case COLOR_FMT_P010_UBWC:
> -	case COLOR_FMT_P010:
> -		sclines = MSM_MEDIA_ALIGN((height + 1) >> 1, 16);
> -		break;
> -	case COLOR_FMT_NV12_UBWC:
> -		sclines = MSM_MEDIA_ALIGN((height + 1) >> 1, 32);
> -		break;
> -	}
> -
> -	return sclines;
> -}
> -
> -/*
> - * Function arguments:
> - * @color_fmt
> - * @width
> - * Progressive: width
> - * Interlaced: width
> - */
> -static unsigned int VENUS_Y_META_STRIDE(int color_fmt, int width)
> -{
> -	int y_tile_width = 0, y_meta_stride;
> -
> -	if (!width)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_NV12_UBWC:
> -	case COLOR_FMT_P010_UBWC:
> -		y_tile_width = 32;
> -		break;
> -	case COLOR_FMT_NV12_BPP10_UBWC:
> -		y_tile_width = 48;
> -		break;
> -	default:
> -		return 0;
> -	}
> -
> -	y_meta_stride = MSM_MEDIA_ROUNDUP(width, y_tile_width);
> -	return MSM_MEDIA_ALIGN(y_meta_stride, 64);
> -}
> -
> -/*
> - * Function arguments:
> - * @color_fmt
> - * @height
> - * Progressive: height
> - * Interlaced: (height+1)>>1
> - */
> -static unsigned int VENUS_Y_META_SCANLINES(int color_fmt, int height)
> -{
> -	int y_tile_height = 0, y_meta_scanlines;
> -
> -	if (!height)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_NV12_UBWC:
> -		y_tile_height = 8;
> -		break;
> -	case COLOR_FMT_NV12_BPP10_UBWC:
> -	case COLOR_FMT_P010_UBWC:
> -		y_tile_height = 4;
> -		break;
> -	default:
> -		return 0;
> -	}
> -
> -	y_meta_scanlines = MSM_MEDIA_ROUNDUP(height, y_tile_height);
> -	return MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
> -}
> -
> -/*
> - * Function arguments:
> - * @color_fmt
> - * @width
> - * Progressive: width
> - * Interlaced: width
> - */
> -static unsigned int VENUS_UV_META_STRIDE(int color_fmt, int width)
> -{
> -	int uv_tile_width = 0, uv_meta_stride;
> -
> -	if (!width)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_NV12_UBWC:
> -	case COLOR_FMT_P010_UBWC:
> -		uv_tile_width = 16;
> -		break;
> -	case COLOR_FMT_NV12_BPP10_UBWC:
> -		uv_tile_width = 24;
> -		break;
> -	default:
> -		return 0;
> -	}
> -
> -	uv_meta_stride = MSM_MEDIA_ROUNDUP((width+1)>>1, uv_tile_width);
> -	return MSM_MEDIA_ALIGN(uv_meta_stride, 64);
> -}
> -
> -/*
> - * Function arguments:
> - * @color_fmt
> - * @height
> - * Progressive: height
> - * Interlaced: (height+1)>>1
> - */
> -static unsigned int VENUS_UV_META_SCANLINES(int color_fmt, int height)
> -{
> -	int uv_tile_height = 0, uv_meta_scanlines;
> -
> -	if (!height)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_NV12_UBWC:
> -		uv_tile_height = 8;
> -		break;
> -	case COLOR_FMT_NV12_BPP10_UBWC:
> -	case COLOR_FMT_P010_UBWC:
> -		uv_tile_height = 4;
> -		break;
> -	default:
> -		return 0;
> -	}
> -
> -	uv_meta_scanlines = MSM_MEDIA_ROUNDUP((height+1)>>1, uv_tile_height);
> -	return MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
> -}
> -
> -static unsigned int VENUS_RGB_STRIDE(int color_fmt, int width)
> -{
> -	unsigned int alignment = 0, bpp = 4;
> -
> -	if (!width)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_RGBA8888:
> -		alignment = 128;
> -		break;
> -	case COLOR_FMT_RGB565_UBWC:
> -		alignment = 256;
> -		bpp = 2;
> -		break;
> -	case COLOR_FMT_RGBA8888_UBWC:
> -	case COLOR_FMT_RGBA1010102_UBWC:
> -		alignment = 256;
> -		break;
> -	default:
> -		return 0;
> -	}
> -
> -	return MSM_MEDIA_ALIGN(width * bpp, alignment);
> -}
> -
> -static unsigned int VENUS_RGB_SCANLINES(int color_fmt, int height)
> -{
> -	unsigned int alignment = 0;
> -
> -	if (!height)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_RGBA8888:
> -		alignment = 32;
> -		break;
> -	case COLOR_FMT_RGBA8888_UBWC:
> -	case COLOR_FMT_RGBA1010102_UBWC:
> -	case COLOR_FMT_RGB565_UBWC:
> -		alignment = 16;
> -		break;
> -	default:
> -		return 0;
> -	}
> -
> -	return MSM_MEDIA_ALIGN(height, alignment);
> -}
> -
> -static unsigned int VENUS_RGB_META_STRIDE(int color_fmt, int width)
> -{
> -	int rgb_meta_stride;
> -
> -	if (!width)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_RGBA8888_UBWC:
> -	case COLOR_FMT_RGBA1010102_UBWC:
> -	case COLOR_FMT_RGB565_UBWC:
> -		rgb_meta_stride = MSM_MEDIA_ROUNDUP(width, 16);
> -		return MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
> -	}
> -
> -	return 0;
> -}
> -
> -static unsigned int VENUS_RGB_META_SCANLINES(int color_fmt, int height)
> -{
> -	int rgb_meta_scanlines;
> -
> -	if (!height)
> -		return 0;
> -
> -	switch (color_fmt) {
> -	case COLOR_FMT_RGBA8888_UBWC:
> -	case COLOR_FMT_RGBA1010102_UBWC:
> -	case COLOR_FMT_RGB565_UBWC:
> -		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(height, 4);
> -		return MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
> -	}
> -
> -	return 0;
> -}
> -
> -#endif
> 


