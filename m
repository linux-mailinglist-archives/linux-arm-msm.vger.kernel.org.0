Return-Path: <linux-arm-msm+bounces-4341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5580E512
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 022B31C20D2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 07:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E4815AC3;
	Tue, 12 Dec 2023 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NtVbRXZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18458D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:47:45 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3332fc9b9b2so4830450f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702367263; x=1702972063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvnjApajsfS7ll1zSkL8pvqD3vMrEKzcEIPtnif3ZCU=;
        b=NtVbRXZmZFgUI2/HUnaKfhLoAaPF532FI6PALvmcUEuOPnVQaryFQY+g7ARlF+fONE
         Km7muJUMDb24UsgEd52JMYL/dMIm/wKVZh14noOomYF5iOXLJWc090XSldtAkSzzjMJK
         xzQrMWfL7LaJ810tSO/ohJJCqUir8UEdFn2BCfUbwzR90z0VsTZJMLuYEDeMWYt59sxP
         SUSWZGo0kKCRGQmlpyMSL4DTjqACdAH6XAsfyYHzTRkHOzfc0btLCfN9wp7zrWh1kn9b
         O4JjgoDobOa9WzB0RdH+H2h6fhJNWAX1PD+I+cYUCxaKoXdSCwigptlHmu/nErKQ3wl4
         jldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367263; x=1702972063;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cvnjApajsfS7ll1zSkL8pvqD3vMrEKzcEIPtnif3ZCU=;
        b=Tb5DHhj1cWSC7ScDFLBvAEPlLGhuyN97WnlbJnvtRcHHg7vXfyvrMwyEgSlbAt19io
         zsbT78Wd3kHeY8rENa0l5tk7r7MmgVwPey+9cZjFUtBLvdXKHEmCrDt3vQWWKmdklTU7
         ozG5VfRaYE0R/0RrQv+ls8IuxyBGvV7jr+tLXm6WKUGz3q9HBHzFQeytzHYnzcVv3gCF
         wXrzso509mmSnucn/vnpblCqfg0Cx1MZQzsIPdTSDXBeQDXupu4dj9MgIwoogfynn5c1
         CV5ptMGUkeNBtw3Y8eCSyofoXBn8b61I2nPgRC8CYCUihJROh4nbM85fZ4rVhjuqu3US
         fJtQ==
X-Gm-Message-State: AOJu0YzpKV0rfKVQGUdNVJIUSQSi50xrDkyOHM2xvtHBpst1kSsp8l3d
	DSCzEDsqpMrUmP/uN6DlWnm9XjkbefjNN5RBCzBEfif/
X-Google-Smtp-Source: AGHT+IGqHUhxTbBqEGCBm0JnsB2awaNpieJJ1wBIYcmLn2bjw9QKDYY4vgPY6Swe1MPPG+SlN6O0bg==
X-Received: by 2002:a5d:488b:0:b0:333:43b5:6ec0 with SMTP id g11-20020a5d488b000000b0033343b56ec0mr1384884wrq.114.1702367262952;
        Mon, 11 Dec 2023 23:47:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5894:fa62:26b4:bf82? ([2a01:e0a:982:cbb0:5894:fa62:26b4:bf82])
        by smtp.gmail.com with ESMTPSA id z4-20020adff1c4000000b003333af25cb2sm10174639wro.66.2023.12.11.23.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 23:47:42 -0800 (PST)
Message-ID: <4c170611-d92e-4dae-99a3-3decc5d25937@linaro.org>
Date: Tue, 12 Dec 2023 08:47:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] qcom: MAINTAINERS: move Andy Gross to credits
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
References: <20231211155533.106003-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20231211155533.106003-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2023 16:55, Krzysztof Kozlowski wrote:
> Andy's last emails related to Qualcomm SoC ARM subarchitecture are from
> November 2019, so move him to credits.  Stale maintainer entries hide
> information whether subsystem needs help, has a bus-factor or is even
> orphaned.
> 
> Link: https://lore.kernel.org/all/?q=f%3A%22Andy+Gross%22
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   CREDITS     | 4 ++++
>   MAINTAINERS | 1 -
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/CREDITS b/CREDITS
> index 59cdc6a9c8fd..6cb661c46985 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -1421,6 +1421,10 @@ S: University of Stellenbosch
>   S: Stellenbosch, Western Cape
>   S: South Africa
>   
> +N: Andy Gross
> +E: agross@kernel.org
> +D: Qualcomm SoC subsystem and drivers
> +
>   N: Grant Grundler
>   E: grantgrundler@gmail.com
>   W: http://obmouse.sourceforge.net/
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 82ef00014f41..37d1bb7b1fc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2550,7 +2550,6 @@ F:	arch/arm64/boot/dts/qcom/sc7280*
>   F:	arch/arm64/boot/dts/qcom/sdm845-cheza*
>   
>   ARM/QUALCOMM SUPPORT
> -M:	Andy Gross <agross@kernel.org>
>   M:	Bjorn Andersson <andersson@kernel.org>
>   M:	Konrad Dybcio <konrad.dybcio@linaro.org>
>   L:	linux-arm-msm@vger.kernel.org

Thanks Andy for all your work!

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

