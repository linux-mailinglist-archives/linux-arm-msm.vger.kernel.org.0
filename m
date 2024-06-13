Return-Path: <linux-arm-msm+bounces-22568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E45A89069D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 826E9284772
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799AB1422DD;
	Thu, 13 Jun 2024 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ormup/ZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640FE136647
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718273926; cv=none; b=CbhQza675L+V+ey37f3NFeB0XqXVT6fmQfomym3fIe07dwdZrDmRQsrcTZvWmQZ+G8eMXR41URPvJg5QyMhU4lGZ4vtG07nWjPJpvogAb3r+VU8Ilfmf87U45OSvx7T9x0Y3E2zE583sYFCCMYvTTjnseZXmnWdChEDmQ2h/Pqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718273926; c=relaxed/simple;
	bh=YUvQFJH1xmyseUhBIv/gGjLJET5MmLDldQznxc2OK4o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=B1tVhtYamZ1CtsIWwJkTeT3M7gLwmhnnZ81RBPCbe/cAqZxjzQT/W0OdKMYga6mCzH2/qbo4FjDMiGsZtHtuoMTweRLT4l/T5TnTyHjhN+PipFywyVOMSoUajntJnNtWoi8OGpszfb42i4yc1Rn2ZXFCo4CY3yp6UsYcgvyBmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ormup/ZL; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c819f6146so1278032e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718273921; x=1718878721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz8Jr9tAelbj0mz7l81bvUL2cfeH6O4EAvWrEVqr2pk=;
        b=Ormup/ZLLXr7loOq+hSvF3xgfLnE48kD4+o0l2vT+X2aR0+rYbETkss489YXtlqs/t
         7UH+v7l+TvD1UZRnrsrX0tyb3GrfCmSxLZGmli/UGnsT6lcI8VwhqjYXQNhX49FlJzIY
         qK+8jGg9bJCz+h13tZld3tV7eE0RAn2VoxbEo+Bp6xJWuxBXVXXihPLcBoe0mek3Y05m
         lwANqX5rE3VPbJpiHBITXvFkfEGLHTIb1BVpSGeu8N+0YJXyHfrYSehqipoOgWufO7c6
         VphzQKLVIg9Ywo3PNO/boFyNN74WOOOtbSPQGtu1REO0DvvQpSw4LShTHu2EVzpS4KUG
         jHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718273921; x=1718878721;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gz8Jr9tAelbj0mz7l81bvUL2cfeH6O4EAvWrEVqr2pk=;
        b=WFRQgs1/P00GiCG+jJogm/wRdZoUiysrud7YiSw6EGIPXw3WG/yF2THr5MjclA/cAM
         JF1/X5lzjkyMVlf7COUaYa83TR3v2AcTGNa5Vs7RyrVQDj3Lml9rLDHOEaMzfZ8MKBFc
         4D1fbWoCnwrMQE0MpGhTlJylVuosiE4TLg6/GKCTb1LkZlrJOjugNz6ovuvb2823UUiJ
         JSC95sccMn/+4F/p9Bmx28w8Qq9hN46UFngHUw9S4B7xpYryZAcFrRd5xTlCiJVtJvSe
         TfrG36HQETvo7qTJx/u7CvtH2+dUg4Q3V+o21v/v+4Nektu4AANWyv70cfWit/ORmfxE
         RZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCWpP2Gh5L0HLUsbMhNTPdQamaub2Veu0V78YUabHrsxWO4ibEDPN/hRf2cM074jToVEumEB8Qn6ev5DX4+hNgAx7LxEmcL2CExsOMcR9Q==
X-Gm-Message-State: AOJu0Ywz8PN9s4fN55l+jzmq8BBM15jzugYB2Yq70wy5p9hP2IoXDYCT
	pVOSnc/NvZhFJfA/x2yGCOVMeThehSXpJ1B75AIGHJdkBIADfva1cr3fgbYU96E=
X-Google-Smtp-Source: AGHT+IEbD7oLf2BGEVhBB1lM7YbvXMhQDVXURKeZcbq+vbGXByyf1yn3I2TC3HslUJg3wVBZrQ9hmA==
X-Received: by 2002:ac2:518c:0:b0:52c:247d:2cfa with SMTP id 2adb3069b0e04-52c9a3b8da6mr2924093e87.13.1718273921419;
        Thu, 13 Jun 2024 03:18:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7d7b:a9a3:893:f3c7? ([2a01:e0a:982:cbb0:7d7b:a9a3:893:f3c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e73b1sm57037815e9.45.2024.06.13.03.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 03:18:41 -0700 (PDT)
Message-ID: <9d7285d2-0dec-4d6f-a3f2-1490261c7206@linaro.org>
Date: Thu, 13 Jun 2024 12:18:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/2] ASoC: codecs: lpass: add support for v2.5 rx macro
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: perex@perex.cz, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 krzk+dt@kernel.org, krzysztof.kozlowski@linaro.org
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
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
In-Reply-To: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2024 14:25, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patchset adds support to reading codec version and also adds
> support for v2.5 codec version in rx macro.
> 
> LPASS 2.5 and up versions have changes in some of the rx blocks which
> are required to get headset functional correctly.
> 
> Tested this on SM8450, X13s and x1e80100 crd.
> 
> This changes also fixes issue with sm8450, sm8550, sm8660 and x1e80100.
> 
> @Neil Armstrong  can you pl test it on sm8650
> 
> @Krzysztof Kozlowski can you pl test it on sm8550
> 
> Thanks,
> Srini
> 
> Changes since v1:
>   - renamed all 2_6 variables with 2.5
>   - expanded checks for versions from 2.5 till 2.8
> 
> Srinivas Kandagatla (2):
>    ASoC: codecs: lpass-macro: add helpers to get codec version
>    ASoC: codec: lpass-rx-macro: add suppor for 2.5 codec version
> 
>   sound/soc/codecs/lpass-macro-common.c |  14 +
>   sound/soc/codecs/lpass-macro-common.h |  35 ++
>   sound/soc/codecs/lpass-rx-macro.c     | 565 +++++++++++++++++++-------
>   sound/soc/codecs/lpass-va-macro.c     |  29 ++
>   4 files changed, 488 insertions(+), 155 deletions(-)
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Successfully fixes dual channel output on headset, previously I would only hear
sound on a single channel.

Thanks,
Neil

