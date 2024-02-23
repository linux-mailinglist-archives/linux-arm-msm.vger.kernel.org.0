Return-Path: <linux-arm-msm+bounces-12326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A2B861017
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 12:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90237B213A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 11:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B5B63121;
	Fri, 23 Feb 2024 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2QNUkq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4554250E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708686293; cv=none; b=h5sgnxQhyCWJpkc8ytZmhmv9tQnBJpHr4qVA75aK2cyQzKRGOYqwVG/38Va9s61XzenRVt4LkV5yP+bJJ9hvslcbeBNWQbUMB2TqX2jCZuna68wuQ9LlfMHHguv0KhhGDFF/rwKZuL3vofuicuYhJkvyHBJ0rPMVJJja3P8fH4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708686293; c=relaxed/simple;
	bh=n4A6R+Fhgf6BlCrcDrfkA8N5wgFe1jO0F3kW12IxQPY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iJcmmAUqyGfxmdYTPkzXXFnqEUirgO2NLv1zkURjLASesleJt+av4Qxm3OnQ1c7qjKVhgx6ToAFaQ95hE/wTTmrUkq74Jr6wBINs9nmB2lt7jxwkPpYb7LgWcX/jfgc6NyPBk9jGYTYf0t9YW5eQRVLesdt7c4BQnnbGaNJH0dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2QNUkq7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412698ac6f9so1476255e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 03:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708686290; x=1709291090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpIrZ6DID2LKFZOgEe2hRQ7/dIExMrSdp13/JdG8p1M=;
        b=S2QNUkq7iygOLHrTJbabhMlAQTI2HX1aWtPpcsIbFtw5hoS3thYz+gKUL/dKKsd29z
         YV7NWvtx2GoHYnze9h4brj7udcbjdSUI5eEaZcbMfBac3nlMJPWVoXR7bu7MCs1SD+o2
         y9EWMoBeSU4V+D+avDyQkypdI3cccQQxV+cekdQ8dxQxcynVUHvIzr6gvOsoop0LCveT
         zWBdVmA1JXwVZx91ZicPhMifMlKvsj4IkrWRggYmTKzJ+iv2klyRJ7y1024H566TDM+i
         oIHZ9K7Jw5iausXh5iHUkVyhYdsawPl7bMcZLXSlsdfxXsZoFdwRQC5ke/ykwlQVwx3i
         oFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708686290; x=1709291090;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dpIrZ6DID2LKFZOgEe2hRQ7/dIExMrSdp13/JdG8p1M=;
        b=wbUCp4E390sRRqHe1lXWNx1WXaQbWMQiyGVtXNH/6onHdwoLGXzDBhwyRpuaTpjMJU
         Bxd7RI8B9y1VWmiw2H2DcrnxgAG5+PcZVDReXEIfbO1jtlParA+mT37xc/yE5Da/p7cx
         DLlqm416R1w/3KzbfIPRBAar+HpenoAhr3F+kPLUCl+ItFu5vGSRP2yUHHGvy0Q8gpmV
         03tCtJ+Xh4NQ4GPa2cXOh720mqegIjSdPwpb9qUCtDL/QtPjpsg4286STbQI5z7l+Kj2
         y6XqcPSLCEIxf7puWF254Gl5l7xRWSY16D5es6c9qIk2ASWvVIq8LLZs1h6oGjoaVZDw
         TgRw==
X-Forwarded-Encrypted: i=1; AJvYcCWfjigpI0y6OP/5p6FoDCb2XBa8QYp5yvHlgRF54Qs/uq679FzKeZoRzdyHwwKMS03BSY86A5040/AfWOWxCx1al2yhjQc5gG0/usaa2g==
X-Gm-Message-State: AOJu0YxUohq9h0CHCTbec1DkLowYXQI/OXaGbEnyOMFfh39naFk5qzzg
	y37CeslCgpbNV838vDOhwIKoTwaXIrCcP8itvtpXrG8XkvN7tuqljt0xmpXFss8=
X-Google-Smtp-Source: AGHT+IGnhOanEmC+FFYKStze36jnGP7rwyWuG1Kq6ilYQmZZ4KpE6Mgybp5TasF6iXliwnPhK8ra0g==
X-Received: by 2002:a05:600c:3b07:b0:412:95fb:9613 with SMTP id m7-20020a05600c3b0700b0041295fb9613mr859610wms.2.1708686290037;
        Fri, 23 Feb 2024 03:04:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58e3:6b80:c446:11f4? ([2a01:e0a:982:cbb0:58e3:6b80:c446:11f4])
        by smtp.gmail.com with ESMTPSA id jj26-20020a05600c6a1a00b0041294a6fc03sm1541476wmb.9.2024.02.23.03.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 03:04:49 -0800 (PST)
Message-ID: <cd2b45d4-53b4-4a3f-88bd-116f4e6a7bae@linaro.org>
Date: Fri, 23 Feb 2024 12:04:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
Content-Language: en-US, fr
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 Rob Clark <robdclark@chromium.org>, stable@vger.kernel.org
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-5-johan+linaro@kernel.org>
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
In-Reply-To: <20240217150228.5788-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/02/2024 16:02, Johan Hovold wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We need to bail out before adding/removing devices if we are going to
> -EPROBE_DEFER. Otherwise boot can get stuck in a probe deferral loop due
> to a long-standing issue in driver core (see fbc35b45f9f6 ("Add
> documentation on meaning of -EPROBE_DEFER")).
> 
> Deregistering the altmode child device can potentially also trigger bugs
> in the DRM bridge implementation, which does not expect bridges to go
> away.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Link: https://lore.kernel.org/r/20231213210644.8702-1-robdclark@gmail.com
> [ johan: rebase on 6.8-rc4, amend commit message and mention DRM ]
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/soc/qcom/pmic_glink.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index f4bfd24386f1..f913e9bd57ed 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -265,10 +265,17 @@ static int pmic_glink_probe(struct platform_device *pdev)
>   
>   	pg->client_mask = *match_data;
>   
> +	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
> +	if (IS_ERR(pg->pdr)) {
> +		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr),
> +				    "failed to initialize pdr\n");
> +		return ret;
> +	}
> +
>   	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
>   		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
>   		if (ret)
> -			return ret;
> +			goto out_release_pdr_handle;
>   	}
>   	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
>   		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
> @@ -281,17 +288,11 @@ static int pmic_glink_probe(struct platform_device *pdev)
>   			goto out_release_altmode_aux;
>   	}
>   
> -	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
> -	if (IS_ERR(pg->pdr)) {
> -		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr), "failed to initialize pdr\n");
> -		goto out_release_aux_devices;
> -	}
> -
>   	service = pdr_add_lookup(pg->pdr, "tms/servreg", "msm/adsp/charger_pd");
>   	if (IS_ERR(service)) {
>   		ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
>   				    "failed adding pdr lookup for charger_pd\n");
> -		goto out_release_pdr_handle;
> +		goto out_release_aux_devices;
>   	}
>   
>   	mutex_lock(&__pmic_glink_lock);
> @@ -300,8 +301,6 @@ static int pmic_glink_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> -out_release_pdr_handle:
> -	pdr_handle_release(pg->pdr);
>   out_release_aux_devices:
>   	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
>   		pmic_glink_del_aux_device(pg, &pg->ps_aux);
> @@ -311,6 +310,8 @@ static int pmic_glink_probe(struct platform_device *pdev)
>   out_release_ucsi_aux:
>   	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
>   		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
> +out_release_pdr_handle:
> +	pdr_handle_release(pg->pdr);
>   
>   	return ret;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

