Return-Path: <linux-arm-msm+bounces-12371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF758614E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 15:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6F6F28514D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 14:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8031D37C;
	Fri, 23 Feb 2024 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdlStzzb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCCE7175E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708700117; cv=none; b=MwMRZOt4rXoP7H6cPltArD9sxlEs8b5nmjbt/hqP2AmF2vJmpVw6+OeBdDUs1XbilRvhgAasm7++X0cOLQA81IX64wxLwBDhmytfb+5GpTJ7CABt+2KzxbXkeWgsfXzlKboPzRnw1jnWQi5Ks4bWyLreHc9MbLOJ7V8bM9lYwTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708700117; c=relaxed/simple;
	bh=ZBFhLRAE7XbX4NeELamTI/j/q2KNJrRTVvDwq+sNiu8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UtGzot+cQdkRR19hIXEz6abMxAU+LrCurJkjJzCD9tGPq4qpWuN9prqivJTDDp88WmvCUAucjQhjO30GT9q2WCSc+HIc4vOLVC8RKzLHVtmdvQ98NfdWf4JLjQDyWLQeKYEQkCQ9SII1yfoiVdzQ8A5MsKby4tsPZVodf3ECDDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdlStzzb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41276a43dc3so6648895e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 06:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708700114; x=1709304914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR4FOB3mTjpSyt3x+AV6258Jdc3Bc2u/zffBWrsEEk0=;
        b=RdlStzzbuSOJgjSvfconPXDYA2LeXvH3PrNuKrmBwU6GghRSqfqVnTyJ8fjxfCWRQH
         UGsJ25w2eJ7xtG72EKM9V/RxElsdKdArMHJ8YVbtTZhU1QmSNG7ymQas7qsV9vyuu7EZ
         fnPrRs1RsZOqa4lWlpUL+V88YUrULFueWeSw39PSDzaSvsEZQ48kmTY62hRF/jG/OC+1
         VyBgrezFb9WZ+W0LUl4pmZncy8dmzR6hyCr19ouqfAdN5UnUVdMPGzkvzAU/5pBw5FJz
         I76nYDEaovtHeN3bvhl+IJjGUqiZSKGhsQkZYy/wo7mUbEx/UO+z3+IllqX/1rKAJHHB
         uGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708700114; x=1709304914;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YR4FOB3mTjpSyt3x+AV6258Jdc3Bc2u/zffBWrsEEk0=;
        b=DdBHhDvMv9j9ebire31eIiLHoLQE4g1nKTbU5OYS9RoP5z6bGl9uUL+ALaqrA9dyiR
         C7ppasZ/DEfyo+um5oZ6g1J07SYUI4w2m1whOOSLS7b2EMBjqwNnZwGwQpJXseg+Ww4J
         kFYf2GSUv8wKFKDdNRi/BF95gz3NrRdEFLyUvXiQsE4Oden8iEw6KX6AiOuQjAg8Oxl/
         H1t/mi2nvllvNv5iPmbpeBzvPtFaPmZUrcLYMjbAp+ekvkletrJBCfx9BuNPBFnyhK6r
         IFJd5i6knKIzA2oYqROttVvfA6y8PvRbNSOg88yazF1AN74a+B147T7o6XT7oFiB5+Uw
         j77w==
X-Forwarded-Encrypted: i=1; AJvYcCXExgW9cjQnSvnul91kL/mRcqr6i+kGT3dQRhDn6+e/qe8UN/zgfBd8Fvc+9VbEzz11FYGZHIXOIU5SAbPDrsrxmQV3MB7y7nSz0SltaA==
X-Gm-Message-State: AOJu0Yy/oYwUIg4RwyHRPUgWTgFx+FMvgbo24RdE4wx7uE7OX8DgOQth
	th1W3QjUogGcuS/pDUZoF0OLogjvrZnVcrUerMC5kaSJAH/Nhifs6dvhS+V1PXs=
X-Google-Smtp-Source: AGHT+IGAy96HbSPMW3k44GU39oK9LfJtPL+l0X+t5AUlvKsigL3XKGl9EWcCWb2kXfdcmrgGHf2JOw==
X-Received: by 2002:a05:600c:46d0:b0:412:5fbe:3740 with SMTP id q16-20020a05600c46d000b004125fbe3740mr36553wmo.24.1708700113947;
        Fri, 23 Feb 2024 06:55:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58e3:6b80:c446:11f4? ([2a01:e0a:982:cbb0:58e3:6b80:c446:11f4])
        by smtp.gmail.com with ESMTPSA id fa15-20020a05600c518f00b0041294a1d7bcsm2314742wmb.36.2024.02.23.06.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 06:55:13 -0800 (PST)
Message-ID: <b5401b19-09d9-4907-86d6-9aab9dc2970e@linaro.org>
Date: Fri, 23 Feb 2024 15:55:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Content-Language: en-US, fr
To: Johan Hovold <johan@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
 <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
 <ZdiU2z8rzo542_Ih@hovoldconsulting.com>
 <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org>
 <ZdiqAPPTn9SvsjL8@hovoldconsulting.com>
 <77715ecd-ddb9-450c-98bf-4fcade0e81c0@linaro.org>
 <ZdixFo2EjUQDgeFh@hovoldconsulting.com>
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
In-Reply-To: <ZdixFo2EjUQDgeFh@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/02/2024 15:52, Johan Hovold wrote:
> On Fri, Feb 23, 2024 at 03:38:13PM +0100, Neil Armstrong wrote:
>> On 23/02/2024 15:21, Johan Hovold wrote:
> 
>>> But it is *not* standalone as I tried to explain above.
>>>
>>> So you have to drop it again as the later patches depend on it and
>>> cannot be merged (through a different tree) without it.
>>
>> drm-misc branches cannot be rebased, it must be reverted, but it can still be applied
>> on drm-misc-next and I'll send a revert patch for drm-misc-fixes if needed, not a big deal.
>>
>>> I thought you had all the acks you needed to take this through drm-misc,
>>> but we can wait a bit more if necessary (and there's no rush to get the
>>> first one in).
>>
>> If you want it to be in v6.9, it's too late since the last drm-misc-next PR has been sent
>> yesterday (https://cgit.freedesktop.org/drm/drm-misc/tag/?h=drm-misc-next-2024-02-22)
>>
>> Please ping Thomas or Maxime, perhaps it's not too late since the drm-misc-next tree
>> really closes on sunday.
> 
> I don't want this in 6.9, this is needed for *6.8* as this fixes a DRM
> regression in 6.8-rc1 that breaks the display on machines like the X13s.
> 
> If you guys can't sort this out in time, then perhaps Bjorn can take
> this through the Qualcomm tree instead (with DRM acks).
> 
> But again, this is fixing a severe *regression* in 6.8-rc1. It can not
> wait for 6.9.

Right, I can't apply them right now, I send a patchset ack so it can be applied ASAP,

Thanks,
Neil

> 
> Johan


