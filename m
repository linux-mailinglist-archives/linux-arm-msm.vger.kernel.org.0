Return-Path: <linux-arm-msm+bounces-80749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A59C3F8C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 223924F3222
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFE23218A6;
	Fri,  7 Nov 2025 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W46CrsFF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A3321437
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511437; cv=none; b=h4Osh7j993SqgbPGGdFNRehR23jQWo4j96HDhKAqwZkqhao/TCGRy6H0j/wr2iVPLsdLUjX4BIc6Y9jHCZ6eq/00JTXDgBSIaA8U9OzOcG9Ucc6Rfd74T84qX6v5GlObm39RQ6Sblse8zmIz7OOgpkFWHPwJHF1H9CNEmI2xHbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511437; c=relaxed/simple;
	bh=uBd7OWZIQZwA0teWIseEIoU/S7sDMB9spsfmesIaCQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lh/RSphYP2o//t1Wtt5jPf/zpj+cMRtGQobXXA4/tOPRpjHCQqFVIn2tiPwJ8CJ/GWdLBNOqqohtKsjVFOsVT5Z1VvIdu9U3R5E0HQXHAPgQ4naTgM//Ahrdh8KAWQyzx/HcnTTOgTMVBHenMU4uoKPpLnJ+OM0rQznkpMQEqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W46CrsFF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47117f92e32so4487585e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762511429; x=1763116229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdXi1VUn5WnebblzEeFtNSpH8JjcIBHUGIXhJ5CQTgk=;
        b=W46CrsFF2DzHCCQnc/ve5Hwrr+zw2n+pr/HQzutiIHHGl4jee0onbqf/SZYbVLiTU5
         m2iO2yGQUWEWnbjqCbUEy6aNpnSSv6f88Sik3aFsQJbk1xmgyt/sAFMt+1zrW80glZHR
         MYoJqYk4jRdw70+qsI8U6CWy5z/nrvHydnm8h/C0rExcmPfWvKolZYLoHuHlIwg0sFi2
         SA2W8C6D8bDoPPQsUB8AioN5H+M37TIzS3An9LllTmnpzcCrgMcQXBG+jlC4RkCMJ384
         FP0KupYBWzb3Y4Os4v4SImKJavzTBarFGnEErzC+UW9YaawuGwUym+Eqpq3GbUuo71E0
         Pq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511429; x=1763116229;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdXi1VUn5WnebblzEeFtNSpH8JjcIBHUGIXhJ5CQTgk=;
        b=ktpt8V3EKZUePxld0H3PhgODGjEcyZtP3FtGodxdHZGE0PbuaMrDPAYAg3z6SwPs8b
         ZHMULVO+Q8nUwersHgW/A1GwEC8vtOxrQyH18KshcFjrRnYUNKF5giOmreBq4hvhmAPA
         ZZEncOWKYvDrDP1BZzBXiKaS3ZslonRSqqIbj8sy5C8HQX/cq1WniNBVIL0glnSPeUu2
         R4Ncx+XLIwArYrYKhkz/UEL0QX90vcUZdenRZaUCZ/hAE/h3sDma2n6eZgI8HMo1YhZs
         dY8JIfhWRN5VfHLK2oQuTwdkB2K6Avoms9IukECXEKoEtMxRzO++yTNvMOFbw0yGZX+4
         xX4A==
X-Gm-Message-State: AOJu0YxbZSyXRSfHmfaAiFgG45LuJDyB/sA64qhl1qnliOvC9o6dznCn
	FmGQLS2x7rG+hnMG8W05lmhp17jgplxxoIImNUWQiy5kFESvedQ8nk7BJCxVJisrd2g=
X-Gm-Gg: ASbGncuabXLsS68F264/1yh3U6PUZ3rwpON56w24CTg50yR9Ek18zF4yY4WfeZnie26
	G9GAqeFn4MC2e+PJfpqyTaYVFkQ4NRuIdbAsAcD7BJWaG8SEqQXu3fIjE9/67yENJtaz82HWd4J
	T7qTSmZm4Szx7PcW/GwvOSGjX1ecB0ZQQOHicc4x0oD7LzE5xI8j3mi0+8b4xLGfhIoFVonpBuZ
	CnfcvNXB5m0huCYytmmrabfil0Dpw1D9MmeiYAmD46DgPKI0NIe5wG7SbMrozGaaZmuc8ncMgZM
	chkOl3v4moUo8dCgu81Na5cPh63oBvqW8YaztTCQsGtIMF2zocWdd4YpPJlL3/t1alnNoTmoCvG
	pbXgcLUXqOeq7y8YVpn34vw/XpeKdXxZMGQsmTIgaqjLmLuFfSSgucZUaARSlm1hnEX7NHevSlV
	upr4UwOzloLkl9H3wuECq8Mz+Kvc1Yyv4A6w==
X-Google-Smtp-Source: AGHT+IE6wGGrTa2Of4J6WHqQuB5miuumaX9005ll7uHOZgbpYuJ46LLqftJ0moP7xlPSeD3ujFGq5g==
X-Received: by 2002:a05:600c:35d0:b0:477:6d96:b3e7 with SMTP id 5b1f17b1804b1-4776d96b678mr16427785e9.33.1762511429427;
        Fri, 07 Nov 2025 02:30:29 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcdd8e3sm39799555e9.10.2025.11.07.02.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:30:29 -0800 (PST)
Message-ID: <e928b078-ad35-461e-8aaf-d5ec036ac4db@linaro.org>
Date: Fri, 7 Nov 2025 11:30:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno
 driver
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/25 23:02, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1083598bb2b6..033675aab0d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7880,6 +7880,7 @@ DRM DRIVER for Qualcomm Adreno GPUs
>   M:	Rob Clark <robin.clark@oss.qualcomm.com>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Konrad Dybcio <konradybcio@kernel.org>
> +R:	Akhil P Oommen <akhilpo@oss.qualcomm.com>
>   L:	linux-arm-msm@vger.kernel.org
>   L:	dri-devel@lists.freedesktop.org
>   L:	freedreno@lists.freedesktop.org

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

