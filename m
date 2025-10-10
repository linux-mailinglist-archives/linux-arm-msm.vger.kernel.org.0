Return-Path: <linux-arm-msm+bounces-76798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE6BCDCB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 17:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BEB31A680EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 15:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E212F83D2;
	Fri, 10 Oct 2025 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baoY//RR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB992F6192
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760110095; cv=none; b=qMcczhxALcQdg8Maq+GqY4ZXwkSxTRaWOTFZ/8RVoT2jxr5AOSTsMIoPjxG4HQKM/rtKQThA49OqNgeTI3s7OuwdKKSRtPpbB8Fwf8DYZMWoMAQKB77WoJ+3/GxIqee9MoIafosa0fUyU86rtvHKr0MUq2JJkHQU5to4qdvDWxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760110095; c=relaxed/simple;
	bh=Hf+PPZeJ3zExTDiEahzcjahXZhA5Z/KhRwEov/b+S/g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JMHlIZfgJuSaD9zDD7LOsio6XstvmiZcINTaSiIhIHCEaz3ANuBYQS3E7+CB1+ulthZ/doxmTtlMAb6v+Bbr9vMbX9uA7oZ9Ow3LDtqCiypDjQCrIKb140lAzSGulTQN+gWLg6d7hx93+rPdbnl+gjBo5uTeEukHTgAV//3GMa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baoY//RR; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8608f72582eso118562085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760110092; x=1760714892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02ulIOF15u2TAsSXJa5XZYITsq/3fozin0D7AHbGChU=;
        b=baoY//RRP3u+di3D0pRdwxUAQ5HeRcCX/D74h1zSNbfLfHLs/CHfZloGWMwi5lqoCz
         eEfwtPfNWhz2KtnemRGDVsSnblnrMaObl9ybV9DWpfu5QSr+4uKsLiPBacb4s7JK2pH8
         JfSKnM2noT6lD3iNcMSgBmzUSmIECWfBcmDObGWaeZfbIgvgUEYA6POUHaf17uEBseaZ
         wS2NlVf06weUjqUZqZrJx83lara71ZEZRZGAupCP1ItLFSe2x3NPSj+58Q7WIkC5ZS9v
         WDqjAAeDOcYvZAFXCsmb25ZDYKRhZiVGVESuGbk/VYIBk/NW4Gh9WIfFajqLdBIHm1s8
         /wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760110092; x=1760714892;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=02ulIOF15u2TAsSXJa5XZYITsq/3fozin0D7AHbGChU=;
        b=OycWigPjctBmM0sBguHUjHmmpWCYPOq/SgdjGHY/rBaRH97tUzJv61XoZ5KHuN7O7C
         ar5qHxJ6mu51ZLR07MxRVMoOE4MGcwxlcSQTOPxChZGmCOcvtTRfOGbnjYRTAg4m0mHV
         I8WfGkrSfD8QKD7jB+2OCmJOi7Er7UM75iFLI3MlgqFFRwzlzAYIichDArUR921A8+1F
         2GkRFo4HX52Z3O5KWJ6lScDfA9wio6LgdnGB3V4DuXUbGMzCUl2+ft0cmzscnreV675V
         bTfzUjKq+RRqS90pYWRawaYV5sZ5fCcWUlQosuD5tjl0CBKOia8yjpRta26+PGQerCYD
         YcDg==
X-Forwarded-Encrypted: i=1; AJvYcCUP1SKc/KaeXehWXJniUiB09KbPUQEf+sW+TuLBUGj0bDUGY+hm4aA7/VuxhKMe9+kYRi3g0vfGJckqm+CZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzvORio4oOB+1EqXphStF4kTB6FwaqiY2L76+P21RHbuWpP1Fv5
	eDMqwuEQxJUFiZHQohr2FWjU0Rs0dEk9aKKEPOyuu5fF4xdrJL1HWAgYoJqT4j/gQeQ=
X-Gm-Gg: ASbGnctEiKuHCRtZ78R6zkqbWVyOPpciPbbQVQ000iBCC+4DmvUXtRpW2cgfgNYqc2J
	jiWBCK63zL98aLMLe4iyIvlOztAJiZ0hMm/GkHzZu1NDxamUGbjy0a+ZQxRvOJQhaECcsi9DyCO
	BmC45tthwGtMTU8nuq1LXdLIMzR2qyQ9nkiApU3STnJUnrBOdVhm9UejhxbJhgzSLcPJy3sFYcT
	omtZ34lqCpnZoYVcs6zd/nm+mXUQGdO+kbSnN5UrgL+vtEX1Qy7B5Licw1J1M8p3JC1gURJO3NE
	9rFp3yyscHsqHbnMtoHb4AapU6LToC29K9JUKddjd6tLF/Cr/xRj9rFzvT0LYtAhXYNT7CpYzrO
	OhGj8qPdr3ixBMc7OXPg6b3hv1z1l/j0R/T1XxSHhm5RODdgX0muKgPTj9CfqloqfaQ1c6hxCI+
	kNxskZud+m8ki8KlECzpi6Ag==
X-Google-Smtp-Source: AGHT+IH8KzPKIJFpE9/fR16Mqofh25U6y+DeqPlrc1MYvlK/oGM8nbRNuChvN6UxIVc3BEBodh8scw==
X-Received: by 2002:a05:620a:198b:b0:810:98c5:5ed2 with SMTP id af79cd13be357-8835651732fmr1781892785a.44.1760110092256;
        Fri, 10 Oct 2025 08:28:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2a00:b5fb:c622:3102? ([2a01:e0a:3d9:2080:2a00:b5fb:c622:3102])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca2061sm440735585a.35.2025.10.10.08.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 08:28:11 -0700 (PDT)
Message-ID: <cad1c4c5-d5b4-4f5a-8d97-3c31982a5a42@linaro.org>
Date: Fri, 10 Oct 2025 17:28:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
 <20251006-topic-x1e80100-hdmi-v5-2-c006311d59d7@linaro.org>
 <141e33fc-c963-4f58-a69c-e7068c9ec6e8@oss.qualcomm.com>
 <e10594dd-cfc2-4d5e-bc1f-35aca05be027@linaro.org>
 <8c099106-49e6-499a-942e-6349fa96c246@oss.qualcomm.com>
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
In-Reply-To: <8c099106-49e6-499a-942e-6349fa96c246@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/25 10:49, Konrad Dybcio wrote:
> On 10/9/25 6:42 PM, Neil Armstrong wrote:
>> On 10/8/25 11:31, Konrad Dybcio wrote:
>>> On 10/6/25 3:55 PM, Neil Armstrong wrote:
>>>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>>>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>>>
>>>> The routing of the lanes can be:
>>>> - 2 DP + 2 USB3
>>>> - 4 DP
>>>> - 2 USB3
>>>>
>>>> Get the lanes mapping from DT and stop registering the USB-C
>>>> muxes in favor of a static mode and orientation detemined
>>>> by the lanes mapping.
>>>>
>>>> This allows supporting boards with direct connection of USB3 and
>>>> DisplayPort lanes to the QMP Combo PHY lanes, not using the
>>>> USB-C Altmode feature.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
> 
> [...]
> 
>>>> +err_node_put:
>>>> +    of_node_put(ep);
>>>
>>> __free(device_node)
>>
>> why ? ep is not allocated, it goes up to:
>>
>> static struct device_node *__of_get_next_child(const struct device_node *node,
>>                          struct device_node *prev)
>> {
>>      struct device_node *next;
>>
>>      if (!node)
>>          return NULL;
>>
>>      next = prev ? prev->sibling : node->child;
>>      of_node_get(next);
>>      of_node_put(prev);
>>      return next;
>> }
> 
> _free(device_node) calls device_node_put() without you having to
> add explicit gotos

Oh, yeah this one, of course. Indeed I'll use that.

Neil

> 
> 
> Konrad


