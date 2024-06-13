Return-Path: <linux-arm-msm+bounces-22569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08149069D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D26DB22AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3201422D3;
	Thu, 13 Jun 2024 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MCN8Todj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4931422C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718274037; cv=none; b=TrN0UU6e1gVnKijGNWYmJLvz4kFV6toAZpwabU02kmbzE66YjKi/fosdXLwA8VsWRvvaEA357hMtLnw5zWdA5eDvJWPldJNaVDjnbImMhLWp9TYL+bYHBHgrUff1q2xYgQo7A1Tet1BhFMVyCVivWhOh44TH8yR+mUoI/WFdqmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718274037; c=relaxed/simple;
	bh=QNkIEu51DQcZ/rYzs3XDlNauHS42tIn5fBb8WrbdE9I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QD/NFZ8nlnyhoBY3EeTXaoijiY2mQk0dSsTk5xbsM1OXAvY8SXMuQtfooc0tGQElSMShXlBAJ6R8nL00nmStg5wQr7fmemZFQUwcRUC2bOsO2WGOLQ/aDw2rSYxH8pwix1IRZxBaLXs+5oSQSKu0j7LlZMxJvMQ8vs49EGMoBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MCN8Todj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6266ffdba8so92310366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718274034; x=1718878834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QZ+NCLQgLbaVK6YbbCv1p2KuIYd+8NexPeaQHEj57A=;
        b=MCN8TodjfXlzscencDMf3cvd7lSPDyWPH7fKZ5WJOCs06rZQb1RzGZZsH+JdJX1Nwb
         YLvOu0jjYRt8qCSjnGod+w7iiWalnxHw1bUVig+sjgH/ukaflnE1GSEfGfKllZWvjgKS
         k+TxhZnNsV44VcVUH78C01dMIG1yfKtbrkJWeNAeAHM84yAY0WAxht2EsOl2Msub5735
         ERUoSqLAGlfXaolxrsPByamjlWLEKZl1BqmSFVlIjaxv5ESHQ8/v9cF4q7cuxFMnc5QN
         9JCSqZemUv6Tw0QsH8ZEbodB2NPO+DwM0DpBW2t63Hm/sqdOAFf9/pD90uKnmBJSUhXm
         iAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718274034; x=1718878834;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8QZ+NCLQgLbaVK6YbbCv1p2KuIYd+8NexPeaQHEj57A=;
        b=gso2rBuPGf9CZBZfPe4eI5rQT+TIXXIHrkzFGjf6MDA7pzAihZI6tBXbJA1maDF0fa
         7WJESeZN7KDatmJrcn2ZdfCXVc8/J0P3Gl0bw2EgrjImKdTSOFFeqsPF4kYysWW8TVkj
         v1k3R68aO3CvMKr0m5FwA9R9QZqIcVpoYCkBZtP9GyRJWkG+EhPVzUBvdeoX4A2oGdix
         G2RzMsXtBg4DOtBHZc88DRI/Pc/9qrAptXXU8tzpCSiLt6YbD+PEl6QGEIkfpzHMAxfL
         V8dQm12mgcxVI8Z0DaDF1+J7NbgV50El732J3H8MrbvwWvFQ6e7Lk7y9VoTSaa/HIzuq
         TLTQ==
X-Gm-Message-State: AOJu0YxYNtI72Yln0D48gJW+o51cMPk9kZ7v3giFBhJVAu4/5e2TrW3f
	RYYHyhANU1yBQrMmc8uypITz5NpnIVaX053mUTEBbl4GXTDbx4mzqEV6UBfwHVBhVxi1HwMkhUz
	yJ3A=
X-Google-Smtp-Source: AGHT+IHhLuwN6s2pgs2GbMvTpm2SCanz1Hu7FntRJZJCf6/a3NbHRkedsMTRJiQMmKNGepEbJ6+n2Q==
X-Received: by 2002:a17:906:7f94:b0:a6f:277c:d890 with SMTP id a640c23a62f3a-a6f4801378bmr263358366b.56.1718274034038;
        Thu, 13 Jun 2024 03:20:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7d7b:a9a3:893:f3c7? ([2a01:e0a:982:cbb0:7d7b:a9a3:893:f3c7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f5952f85fsm42543366b.11.2024.06.13.03.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 03:20:33 -0700 (PDT)
Message-ID: <b0670c4a-9663-4ed9-8eac-45efce5527f4@linaro.org>
Date: Thu, 13 Jun 2024 12:20:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/3] ASoC: codecs: lpass: add support for v2.5 rx macro
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
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
In-Reply-To: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2024 18:57, Srinivas Kandagatla wrote:
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
> Changes since v2:
> 	- added some locking around version variable.
> 	- split 2.5 changes to a new patch.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Srinivas Kandagatla (3):
>        ASoC: codecs: lpass-macro: add helpers to get codec version
>        ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions
>        ASoC: codec: lpass-rx-macro: add support for 2.5 codec version
> 
>   sound/soc/codecs/lpass-macro-common.c |  23 ++
>   sound/soc/codecs/lpass-macro-common.h |  35 +++
>   sound/soc/codecs/lpass-rx-macro.c     | 555 ++++++++++++++++++++++++----------
>   sound/soc/codecs/lpass-va-macro.c     |  29 ++
>   4 files changed, 490 insertions(+), 152 deletions(-)
> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> change-id: 20240612-lpass-codec-v25-4e960abd661f
> 
> Best regards,

[replied to the wrong version, tested v3]

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Successfully fixes dual channel output on headset, previously I would only hear
sound on a single channel.

Thanks,
Neil

