Return-Path: <linux-arm-msm+bounces-18392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 890448B026D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 08:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16A281F23077
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 06:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E10B142E67;
	Wed, 24 Apr 2024 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENwS8kEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591F36D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713941430; cv=none; b=PJaXLGXEI1xIkDrrWILJ4B6irgR8xRQI1RPnoQU1PVdfsA0sEH7VC4+ogmrxG5lstgJZUvBSwGANpy3pIg0/9O30DgtzhGIOyOR/N7ru/tqtAhRwBpXSaDZp4h+1sXGsePA/u4ndTL8Pmpas9J4faTeyWvvJdnXWNRRnaZaSmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713941430; c=relaxed/simple;
	bh=yW4LO7ywC0+GnyOZdw8x7qeRHF8OYhLShdJbOFl06x4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uuq9RWBZCFhPBirV1WuqoZrWYywVR5NrkP9rIFHVtu5c5HV+mwt6JvaoAlc9YXd5zOrB4+UHaD/v15/Jx+bkkQO0Hn6eTQzSRc1xIDqf8tjtYwxK2EE6WPiSvMTbUDicax1YqtPOC49MTJkrgqHnCEdiJajANF4IhfbOZOIcFOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENwS8kEw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41a72f3a1edso23157145e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713941427; x=1714546227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaBiQ0b2lOkapKCLRR0tvwpfXKGi9E22VmejIAtoXhM=;
        b=ENwS8kEwT4HNK/MExEkW3RnvsWf/1eRPCZ+wFJExA7VV2o17bRGj1mvt82VThdlNb4
         j/D9bhbvvEg5I2CwquOx3MEZR3jSWPWj4/mwix9meyEdNym4urIWywGbDClN+zvh+2CS
         POTBEtgShqP6sDL8b141jB/qDR/EIk3OHeWUyAaJURt9pBSDhsU2ViL1otVQ5hTmrs9B
         Rx8tDzw5TOAPuNn8uodnLzoZsz/ZF8WC3apqdh3Cq6Ats+n8Ud8l4QsGWGcNFxr5b/nm
         NY6bzyNrcuMtVptOB3HWIoi56vSwXe3M2hS+wbfS3W1BsBzDUbbTePgYfPeavKQlvNXq
         rd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713941427; x=1714546227;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qaBiQ0b2lOkapKCLRR0tvwpfXKGi9E22VmejIAtoXhM=;
        b=toAyrj6vkPftFfDkE+pSO4o6snor15XeNM6Ob2xD+L6t2frRsE1ojQacz8bdeDq1ON
         BScND59w6KFSZD9uUAJtyVa9vJWzKKTcsq97adNMM95GvSy5WTpVJ8LaPvqTi1/dSkLW
         y2urzbfRZXjsdvRWY0pWUFSNZ6O6uSdfIoTnDAGdBwDCBTGt6yLHOmdKKFT0Nile9eKc
         +ptPSYK5ocglJI9UV0BKnqrh1Rmj9DweGye6wLG5K/AeY1F7JVXRLaXuEeT+V9fjl8YE
         sScWi1W6if3qFkOE5ZaV+SujrYgOaDEj7R+kVpnJhGhPP2ILGU9wTeUwrwR3HhH4M5cb
         954w==
X-Forwarded-Encrypted: i=1; AJvYcCVTv5w3ZqvGiFtEAy/binsw98Coe4RQT96lrijER+JbzqH1bRbED4rmr9kHv5RGIfuPUCK4WZnk7zKpMdQMMIwceleRRlOyJu4k+HfcRQ==
X-Gm-Message-State: AOJu0YzPVQbEMo4qETGDMKdkURCWqwZ+McM2CXDNM6uIJGN3/F5bFmT4
	ypvOdsjlJuJCTKPV2GmtB9mLeK5vYpmY8YcUF3L6qTX/vKmvGzSJ0LPdwdGU+Xg=
X-Google-Smtp-Source: AGHT+IEqobpn4LPJICDa52t+tIRLD6OtoCizVexLBQbu6gLk5WNmi+ocD3u6ma2o9eaWM1iTp+0BvQ==
X-Received: by 2002:a05:600c:444c:b0:418:ee30:3f92 with SMTP id v12-20020a05600c444c00b00418ee303f92mr994850wmn.25.1713941426342;
        Tue, 23 Apr 2024 23:50:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7? ([2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7])
        by smtp.gmail.com with ESMTPSA id j13-20020a05600c190d00b00418a386c17bsm26470645wmq.12.2024.04.23.23.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 23:50:25 -0700 (PDT)
Message-ID: <4d6ed7e4-049b-4a1c-9330-a683a4cd8eaf@linaro.org>
Date: Wed, 24 Apr 2024 08:50:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/bridge: adv7511: make it honour next bridge in DT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240331-adv7511-next-bridge-v2-1-7356d61dc7b2@linaro.org>
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
In-Reply-To: <20240331-adv7511-next-bridge-v2-1-7356d61dc7b2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/03/2024 22:45, Dmitry Baryshkov wrote:
> DT bindings for adv7511 and adv7533 bridges specify HDMI output to be
> present at the port@1. This allows board DT to add e.g. HDMI connector
> nodes or any other next chained bridge. Make adv7511 driver discover
> that bridge and attach it to the chain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Fixed the absent next bridge usecase
> - Link to v1: https://lore.kernel.org/r/20240309-adv7511-next-bridge-v1-1-d1ad522ef623@linaro.org
> ---
>   drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 ++++++++++++
>   2 files changed, 13 insertions(+)
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
> index b5518ff97165..c50d994a33b5 100644
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
> @@ -946,6 +947,12 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>   	struct adv7511 *adv = bridge_to_adv7511(bridge);
>   	int ret = 0;
>   
> +	if (adv->next_bridge) {
> +		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>   		ret = adv7511_connector_init(adv);
>   		if (ret < 0)
> @@ -1216,6 +1223,11 @@ static int adv7511_probe(struct i2c_client *i2c)
>   
>   	memset(&link_config, 0, sizeof(link_config));
>   
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
> +					  &adv7511->next_bridge);
> +	if (ret && ret != -ENODEV)
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

Indeed looks safer.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil

