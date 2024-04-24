Return-Path: <linux-arm-msm+bounces-18391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270D8B026B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 08:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB83F283815
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 06:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AF9EC0;
	Wed, 24 Apr 2024 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5nZRVZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5475136D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713941358; cv=none; b=pCYCdlAr5omrKIkFNS/jKMIwasAT+jWr0tifJxgiF4iEbSTlmZtzcQ3mrvzDC54ZKgznYiL+YCKE1VokXyvKxACWp3sNp8F1U8RjJud1EAPQ2iBK/dfyWbE2A88sXnhy1MEUM4RD+9o8+SfPoTuXzIuoUHTDDvwXmRz/kmzdrw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713941358; c=relaxed/simple;
	bh=k3lR7N45p3uy1/aCk+d5px4niLbrlk1uy2suUr+Xqdo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MY6krapU356JXE7kr04NmNsCMXfdtkSx9wJUq/RsPQ0PdHCAsAK3uiy1ciqQTHoJbJxwqLCHaETK6C8p8cCHC8Cy9LC0QaMssxrKNLXWWTwS4qUM33LJ1p4OxokiJMTblWJp+0/+h+YC0DxAT7PVp+Mtkm7WkpbuoxNrAUkwqUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5nZRVZG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41a7ae25d53so20890955e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713941355; x=1714546155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvCwxRhS/eR197YJbXLGg46cxnilzgsJ6QWRiuu3i7g=;
        b=Q5nZRVZG0khxhVEbTFdZzY6BngH05IuE1unDp/bXuwm0BmrjhkdGzF0CQP6RwOa+aU
         ijBF8KNWptUZuKiIAP48uJhN1OZUrYSBy8BqdlEE+U9unaK5Ij2vDcFffIWjPt18/uNu
         ZQgPZQTDSNH8QiQvHbFPKJW3aCsKU/+jcZAUEJ3e1ix05k+t8fE9XCSsB3YWUDl51BgF
         mwe7zMkpWGZLJ0BG+wowe12eEwHOweniAF2LC0ZvLZeuqLfPdFFNocRtI2196Dax1pCC
         pWd8e9GijJ3Uwx93TbrUJ707IBMv4KGIgisDwR3jma2EROWtw0ZywZ6BE1GhjK4HN5yg
         E4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713941355; x=1714546155;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PvCwxRhS/eR197YJbXLGg46cxnilzgsJ6QWRiuu3i7g=;
        b=cHhuAJTDXXgTh/8sSacIcFtId8eVxv+/E/IuZQShRjG+OsVCoX08xwU6L8RjzeuUlV
         5x/zZ8sZrhADw681Db3aNRMOrNRnr3rx5DblPHY/YOX2gutelt8t1Zev7MaMnxzwf9Jr
         +v4xSTUEHW0o3HyQwArG25uX9J/vkBdydwnA5ArJesmg9kir3R99VfBl1vpAf/OS6tOE
         Jr4BLyi0SWE4l4OgsGV8G5BkV1Fq1s4DcF95QFMOqY7/7l+kcdgNUdqYk5WEGZZX5+41
         dC92CLDdYFqwhbHXgntR6QtagJso7wrgfSAagH8i+k4nvL8PyLyLrqnRz02BM++zfDQ3
         l26Q==
X-Forwarded-Encrypted: i=1; AJvYcCUt8S5ugg+ExzSkh5vPhlaOZU0Ud+44iXFHgZWe7Cx26mNyo7SK8beL1kQewH8uzr/wOdrKwWq+CeHTJzw/dEeDGyNlZf0V9W5jLgGbyQ==
X-Gm-Message-State: AOJu0YzMaHIDE/G8+xG4w8veup6DKMV86foslKPOy/LXa7EOKvheNO4w
	tLXIaNuKMO/DB0otxMQxHD+eMmHKR+XRAHIYON21a8TkshHVyP6XpKWTMGnuZyU=
X-Google-Smtp-Source: AGHT+IGwzfnWMHjRPXLIr1spmLqk3BurHQRsBsQkAFk8meM71ufsN6U4PqTPZkiWUevzjH2F9qM8Xw==
X-Received: by 2002:a05:600c:4ecb:b0:418:969a:b316 with SMTP id g11-20020a05600c4ecb00b00418969ab316mr1171308wmq.1.1713941354412;
        Tue, 23 Apr 2024 23:49:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7? ([2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7])
        by smtp.gmail.com with ESMTPSA id s6-20020a05600c45c600b00418244d459esm22832137wmo.4.2024.04.23.23.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 23:49:13 -0700 (PDT)
Message-ID: <22f0023d-d8dd-476a-bb3a-6f993e1f32e3@linaro.org>
Date: Wed, 24 Apr 2024 08:49:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/bridge: adv7511: make it honour next bridge in DT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240309-adv7511-next-bridge-v1-1-d1ad522ef623@linaro.org>
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
In-Reply-To: <20240309-adv7511-next-bridge-v1-1-d1ad522ef623@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2024 16:33, Dmitry Baryshkov wrote:
> DT bindings for adv7511 and adv7533 bridges specify HDMI output to be
> present at the port@1. This allows board DT to add e.g. HDMI connector
> nodes or any other next chained bridge. Make adv7511 driver discover
> that bridge and attach it to the chain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 39c9ece373b0..ea271f62b214 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -356,6 +356,7 @@ struct adv7511 {
>   	enum drm_connector_status status;
>   	bool powered;
>   
> +	struct drm_bridge *next_bridge;
>   	struct drm_display_mode curr_mode;
>   
>   	unsigned int f_tmds;
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index b5518ff97165..4eea9e8fb603 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -17,6 +17,7 @@
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -946,6 +947,10 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>   	struct adv7511 *adv = bridge_to_adv7511(bridge);
>   	int ret = 0;
>   
> +	ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
> +	if (ret)
> +		return ret;
> +
>   	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>   		ret = adv7511_connector_init(adv);
>   		if (ret < 0)
> @@ -1216,6 +1221,11 @@ static int adv7511_probe(struct i2c_client *i2c)
>   
>   	memset(&link_config, 0, sizeof(link_config));
>   
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
> +					  &adv7511->next_bridge);
> +	if (ret)
> +		return ret;
> +
>   	if (adv7511->info->link_config)
>   		ret = adv7511_parse_dt(dev->of_node, &link_config);
>   	else
> 
> ---
> base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
> change-id: 20240309-adv7511-next-bridge-10d8bbe0544e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Looks fine, I check most of the DT using this bridge and the port@1 seems correctly defined.

LGTM.

Neil

