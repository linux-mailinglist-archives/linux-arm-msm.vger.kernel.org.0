Return-Path: <linux-arm-msm+bounces-12861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B50C186AF89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 13:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8F3D1C23A58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 12:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C7B14AD22;
	Wed, 28 Feb 2024 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DY2PMZIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7312D766
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709124840; cv=none; b=fOtgufjOg7KjwhN0WNF0vXPOPQVvkZDuIMBCI6NFTFhAbo8ftl+UOe85rqV011DRI2fEt5yPaACvweBtDm+ljooxXWaQdD/TgATVQ6mR82zbudM5l5tRhH6rUI+FOOhFm+MAekaQXuPg3gD5dG++ns41A3gM63Qq9h/J4AR1kDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709124840; c=relaxed/simple;
	bh=2P6R1zcaVFaYRmxkpXc0heEJhQgvCIKMqUUZDvKxj60=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qJKRGz5JYPOqOoMUddwe5et9JGJBA2XO/fFfJKUNgSKwzbmji0On6T6e3xMAe6rz4f/rYQiXYj6yU2ACjwyqws7vL8nOjQ6U3yqzNScg9u0n4MW5S76Gxz0L1chR4Yk9A/8llGaQ3U8L3cDCDv/4tmLNO8W26raTuBqsW0uqhvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DY2PMZIa; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5131a9b3d5bso805419e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 04:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709124837; x=1709729637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBe+rzXrdenb0iUz0ZZGc8egCqRBZ+ZnIGgizHBx4Ek=;
        b=DY2PMZIaBJMoMJQ0Yv+CA/1SwaSfZ4HnoyWDyPI9jtEDZwUEkJRzIhy+yLJz+OqWGE
         4FRAoZ3LrCSGzrEoYJu9C7O2ahh0QPwddN+oHKCi7ZXETQJxqIZW64JLjn9OYXHHMmB5
         I9W/hC0JWVM0P2ZA0Zydk5lhJTQDdb+JSYwtthztY5VMdmth7+jZC49aye/TAYw2Aqaf
         Ji7HToI9S92UjqC/rUmYNadIJyBQ7M8u6ynsnz5volpyzgi57znBDLV+vOQCp2wSEDcv
         J9x1kboi2j9nE6ZS7UGUw655Sagse71ubwDdCeIwmd4OtGIdYo0X5oIJbz3vImRJVEgS
         L9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709124837; x=1709729637;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eBe+rzXrdenb0iUz0ZZGc8egCqRBZ+ZnIGgizHBx4Ek=;
        b=kWfrtX2tDFxuSFnWatsywcDy3VzXY4Gw9ECoxbX120JoxX+cATuWDC7JOLzDBg12bx
         SD/sJOWTyrKRSkPQIIHOD6RUU98E93Td/yqlamMBXB0doUqWYyMyrf8HhDBRyldCnwbd
         DIZmVMg/Dg0vw1F7kjQOYGVMLpHNJJvaCF8/UCIR/XGgM3ZFjQCaAotPBq/P1B2H8Gf0
         jS0o5nzoF5IyoNmwP+dUKzoiJTxbiY2cSl1XeKcsPJVKaxsvQAkjL11djB/U2Xa1tlEA
         hjN8FX7Fe5MDpUwk44YDyQxdSt4caKF37+oZklffLp1lAMqwtyljcVmRvtslXO0U+Xhx
         4Gxg==
X-Forwarded-Encrypted: i=1; AJvYcCVU8luzC08VgK7a7x7SKyJ5AGK3wFqzFmhvw1gqzUZUVNFe+h/LyjwK/WBpsTWeygYIFcCkvOtV2xZ6Fr66lDrTTUzy3ISOAesFata/8w==
X-Gm-Message-State: AOJu0Yy5wbGpxaAT3w11ipaBZ1HcrtsyK3/jLL33qgjTEF1UxG2Xjnrb
	cGSdzGfRX63V58nR0fLgOR2UTCc7kEM0ZT1xKh74ilbQrmKmZ8zKHZ9Q1O0OdJ0=
X-Google-Smtp-Source: AGHT+IGMrXWIF4BtpLNgNbQPhjweH/gzh0Midrdiz6XOkwXeasOElaYJkWmHE4FF8i6K/KbZFLlhzw==
X-Received: by 2002:a05:6512:2820:b0:512:b915:606a with SMTP id cf32-20020a056512282000b00512b915606amr10138578lfb.12.1709124836857;
        Wed, 28 Feb 2024 04:53:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb? ([2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb])
        by smtp.gmail.com with ESMTPSA id p26-20020a05600c205a00b00412b62f6e35sm1260350wmg.15.2024.02.28.04.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 04:53:56 -0800 (PST)
Message-ID: <cba58018-ee9e-432d-bea7-eb0e6e7f2c0e@linaro.org>
Date: Wed, 28 Feb 2024 13:53:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Johan Hovold <johan@kernel.org>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/2024 23:08, Dmitry Baryshkov wrote:
> This reverts commit e467e0bde881 ("drm/msm/dp: use
> drm_bridge_hpd_notify() to report HPD status changes").
> 
> The commit changed the way how the MSM DP driver communicates
> HPD-related events to the userspace. The mentioned commit made some of
> the HPD events being reported earlier. This way userspace starts poking
> around. It interacts in a bad way with the dp_bridge_detect and the
> driver's state machine, ending up either with the very long delays
> during hotplug detection or even inability of the DP driver to report
> the display as connected.
> 
> A proper fix will involve redesigning of the HPD handling in the MSM DP
> driver. It is underway, but it will be intrusive and can not be thought
> about as a simple fix for the issue. Thus, revert the offending commit.
> 
> Fixes: e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes")
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/50
> Reported-by: Johan Hovold <johan@kernel.org>
> Link: https://lore.kernel.org/r/Zd3YPGmrprxv-N-O@hovoldconsulting.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d37d599aec27..4c72124ffb5d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -329,10 +329,26 @@ static const struct component_ops dp_display_comp_ops = {
>   	.unbind = dp_display_unbind,
>   };
>   
> +static void dp_display_send_hpd_event(struct msm_dp *dp_display)
> +{
> +	struct dp_display_private *dp;
> +	struct drm_connector *connector;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	connector = dp->dp_display.connector;
> +	drm_helper_hpd_irq_event(connector->dev);
> +}
> +
>   static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>   					    bool hpd)
>   {
> -	struct drm_bridge *bridge = dp->dp_display.bridge;
> +	if ((hpd && dp->dp_display.link_ready) ||
> +			(!hpd && !dp->dp_display.link_ready)) {
> +		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
> +				(hpd ? "on" : "off"));
> +		return 0;
> +	}
>   
>   	/* reset video pattern flag on disconnect */
>   	if (!hpd) {
> @@ -348,7 +364,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>   
>   	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>   			dp->dp_display.connector_type, hpd);
> -	drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
> +	dp_display_send_hpd_event(&dp->dp_display);
>   
>   	return 0;
>   }

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

