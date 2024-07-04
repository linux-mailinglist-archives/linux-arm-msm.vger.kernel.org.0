Return-Path: <linux-arm-msm+bounces-25279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A92ED927700
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 15:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DB161F22183
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 13:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352C27E9;
	Thu,  4 Jul 2024 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZKxybKn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580951AE872
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720099067; cv=none; b=pD9njrSjU1+bl8mUzExAucZOEABd7LJ+keXSb73WF3nS3G8T4phjE5J8Znh6jluR5ED0/O0uLh2ZgBaMx6PBAgeAgfnI5Kcd1416Xny/9SyHg0nSE+328MFhWgTzFNqpW9Z28awLfgkz7McwJ891+DRTSkmn8cx/ZooqcPNx8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720099067; c=relaxed/simple;
	bh=iQk0iKyezAcjJDsTwd1vKub/kyvKiYBXOVsm0KMGpE8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sBemCkwthJACjtF+EDYefKT/UIa8dNItno1lj28/mna+QVeYLEFihrrxlsCuqjSZ5qJOg5oFxP5QZxx276WkU7uHhlpymqUjB8vPi2tI7ZHuda+eOPs4Zy4O2v//z1Ah0yq+opmrHAPv3HRMG6Nb85Oga3QHDPE5WzZxUi92KFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZKxybKn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4256742f67fso4159785e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2024 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720099064; x=1720703864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9PuZuKN/54BPKf5u/aZAc6rfKFfvxUH5iN7sPo6qDQ=;
        b=lZKxybKnNRVUWxIFPLn29e1Lc37rUXMZ3QiRcC1y8sKX8ngmSd3xRLNiq43lEyrsFa
         bEQtIPx6jTOlYzWDsQPttQ7W0/+31+OMUQSn3ZgWviSBsOgB/XDo+xvxSyUSje3UcIz1
         /ft3LbXca9jr5KX3RUfa8ioC6uyDs2WDyWzX93oNl/xQWmKqAtZckDT+2lGyGsdzLAAt
         +P15nE7AFHC0PIv8YSxPhk7hBE9JzskFRTnK7WytLt8CTT9q67M00UfhEPE2rHOBl0C2
         O1bSa1bk+oisTLfhNksL215tevY+R70aTntyw9ePHl/OX/wkRmD9xKLgdQ4P9nvt564i
         Iu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720099064; x=1720703864;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E9PuZuKN/54BPKf5u/aZAc6rfKFfvxUH5iN7sPo6qDQ=;
        b=Uodysxp0JcAzj2hbhK2ZCKcd0zlFe9FKaq4I9wqIY9kDrH0jSWEoZOX9ViopVVTJlq
         07nLpqojRRx17JVuWvK9pQlpzp996j/X38CAF1wFYhwpxhnwRnZ/xsREjO1mdwMwM0qY
         WcyjtuFvkeIo9yRE29pkJC16adoAYut2zLXL0deYGnaTjgVwEIvqVOSkzrcfaW2EYvT6
         srF6vWxZ/zixp9ZpAxsOq6zN2dA2+Y3yhSkhLuoBW/2JjSBDERBvky2ht95Al7FrPszi
         W6rPKdM17nOuAJgokZqW4fFoSdbTjoAk6qJJDmSmVVUTN+jtHgKfCZFInkyPOpQznTIP
         DjNQ==
X-Gm-Message-State: AOJu0Yz1AML8O8hy070OXpDED68Lp1Jh/uyht8D48WvSAQDgfUP8LQ8k
	OT/1GS5YuegEmaHCnl2s3BeNSr6Q8iLQmGP19Lkb/7kxeeerfc5ORDGzn8i3/Vw=
X-Google-Smtp-Source: AGHT+IGUHkLZ7SXJJe2XKqPg1k/RbIagxKVjWaApGyhdj5h1RaV3J4WzJ4L8neyuB1/3il1VFF7+BA==
X-Received: by 2002:a05:6000:e84:b0:361:93d5:782f with SMTP id ffacd0b85a97d-3679dd11725mr1482084f8f.9.1720099063441;
        Thu, 04 Jul 2024 06:17:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf0c:e5a4:4535:f45c? ([2a01:e0a:982:cbb0:bf0c:e5a4:4535:f45c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678fe13ef4sm5236534f8f.117.2024.07.04.06.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 06:17:43 -0700 (PDT)
Message-ID: <cf3ea6b2-899a-493b-b894-e82f2f69c3ac@linaro.org>
Date: Thu, 4 Jul 2024 15:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] firmware: qcom: tzmem: blacklist more platforms for SHM
 Bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240704-shmbridge-blacklist-v1-1-14b027b3b2dc@linaro.org>
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
In-Reply-To: <20240704-shmbridge-blacklist-v1-1-14b027b3b2dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2024 13:12, Dmitry Baryshkov wrote:
> The SHM bridge makes the Qualcomm RB3 and SM8150-HDK reset while probing
> the RMTFS (in qcom_scm_assign_mem()). Blacklist the SHM Bridge on
> corresponding platforms using SoC-level compat string. If later it's
> found that the bad behaviour is limited just to the particular boards
> rather than SoC, the compat strings can be adjusted.
> 
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/firmware/qcom/qcom_tzmem.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 5d526753183d..c715729f071c 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -78,6 +78,8 @@ static bool qcom_tzmem_using_shm_bridge;
>   /* List of machines that are known to not support SHM bridge correctly. */
>   static const char *const qcom_tzmem_blacklist[] = {
>   	"qcom,sc8180x",
> +	"qcom,sdm845", /* reset in rmtfs memory assignment */
> +	"qcom,sm8150", /* reset in rmtfs memory assignment */
>   	NULL
>   };
>   
> 
> ---
> base-commit: 82e4255305c554b0bb18b7ccf2db86041b4c8b6e
> change-id: 20240704-shmbridge-blacklist-021bd97b8a93
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Qualcomm RB3
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8150-HDK

Thanks,
Neil

