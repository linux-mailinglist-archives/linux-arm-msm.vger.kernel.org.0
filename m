Return-Path: <linux-arm-msm+bounces-12325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C152861011
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 12:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322612852A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 11:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1945D14B835;
	Fri, 23 Feb 2024 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpPkKoar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0F66312D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708686196; cv=none; b=WhITvPotZkEmfOwrbzsnmKU+d6sV7sgbnYlFFbvmeWMiqHbzA6Tvsc3knvBgbqBCRdv1TJ7HoZyDF4HnIkZAM4m7nTDEVEO/BNZqanQxcjVQqTgfA6xgHU+R5u6OZnVPEiM6zuVrPwP+j1nB/kCETd1BbOWweFYVjjuIon7rhwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708686196; c=relaxed/simple;
	bh=NXn82Khoe0kdoBKsso1dYFaPYt/mK7noyyEqxw0nGfc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lGfhc3JfVcg5tzpSc/uLbZu3YAgdr4SwNJ1XVeoJwktMCHYg6lFubDdKMAS5g69wPozx7a8LQXJEM0uXAeOcP92H1Jur7tTeu20dnPcdmeryRHVj2C34a8+gORX7MX7vr/8PaGI5MqY7Z8rYnQ0HmlZimK21/8cIxoymWBX/fJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VpPkKoar; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512ab55fde6so231365e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 03:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708686192; x=1709290992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RpTYiyFTL0cV1HIXamxy5oNLm7jD4YHf0G0C+wgOA8=;
        b=VpPkKoarV2fa1CQttXbrGMYgHOL0nusHziH0zf6EEJ+26Kvml0THqze2MaWT/63ddE
         UjpG+x0VHjKRxy1jBU4oV+t13ZBihlus0vAoRvS62oqycaAbSZdokDwBbXEQwndxvbGX
         mBrCXNBGvGGQZBs/M5kO4VQO3eFcCMpStm79Hb3mJTt5gIx9/P1pX7hSllhtDNgDBPSw
         BQXx3pLfgN1KZOe7+h0k4sYMlp+o85Yhg/ZTPtwuwrZyxNvNJblrZABJj+i3fPKqsgQw
         4BIA67CwqcX91zFjgBAh/BNURd9qasVXeYbKZVvNm7Ah2CgRPjHoexyRx+YjaDE2ZxjQ
         QjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708686192; x=1709290992;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/RpTYiyFTL0cV1HIXamxy5oNLm7jD4YHf0G0C+wgOA8=;
        b=q7s4Ih447LLedtQeiy6KyvNqCnMtd5wgyldHmK7ka5jNejq+vddnvJnN+U6Wd1PGK5
         JaF39R4dX0C69ii40tZBmRIlf2A/4I7CsSf84J0pKcVWWMnREKovncUrKX43u0x656Vj
         vu5+w0HIUJxFmTbTn3kIvh47choNm7XDjQserTILA1CgWjlAUcCcdDc9tR0iwGqBEXBt
         nVMl0hN8rmH58Qf6zWYYDB3rowz/1N3i6zdYBAmqcJLAkDHCqZhUbQWvTwJ2tzzjx5sq
         gqZZBsEEKel2+RzilqRIim6m46p624BFP/GfYDLj0FHkLEDDT384svrMP4+ITZRQGWCS
         bLdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPKlzWLEox16w8AoQ2w7GlD3nlItGp3C6SlK6P5z19sIwhPxmS5OJLrcJX2bIhKyqyqb4v0vsz0deuvGNezLVcETyC8uQSRHfk/aLhPg==
X-Gm-Message-State: AOJu0YwSbSorLwAZ6AUjSRjp+mdRnJZwhSCZcWj9+nayshcBzFb1zs3P
	NLuIkOYo+7z8XQ4hhzrSljb2a13C2arId6vXEODtyAxex7udknnI4upmsDymReo=
X-Google-Smtp-Source: AGHT+IFT9W3nGYiyOdEzCSKGOnZ74IabhMCjp6QTcpJbx2fT9JJlPrAlcV6NNwKGl1ykqb6VM2pP6w==
X-Received: by 2002:a05:6512:3f5:b0:512:ab9e:3521 with SMTP id n21-20020a05651203f500b00512ab9e3521mr952191lfq.11.1708686192169;
        Fri, 23 Feb 2024 03:03:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58e3:6b80:c446:11f4? ([2a01:e0a:982:cbb0:58e3:6b80:c446:11f4])
        by smtp.gmail.com with ESMTPSA id jj26-20020a05600c6a1a00b0041294a6fc03sm1541476wmb.9.2024.02.23.03.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 03:03:11 -0800 (PST)
Message-ID: <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
Date: Fri, 23 Feb 2024 12:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
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
In-Reply-To: <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/02/2024 12:02, Neil Armstrong wrote:
> Hi,
> 
> On Sat, 17 Feb 2024 16:02:22 +0100, Johan Hovold wrote:
>> Starting with 6.8-rc1 the internal display sometimes fails to come up on
>> machines like the Lenovo ThinkPad X13s and the logs indicate that this
>> is due to a regression in the DRM subsystem [1].
>>
>> This series fixes a race in the pmic_glink_altmode driver which was
>> exposed / triggered by the transparent DRM bridges rework that went into
>> 6.8-rc1 and that manifested itself as a bridge failing to attach and
>> sometimes triggering a NULL-pointer dereference.
>>
>> [...]
> 
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
> 
> [1/6] drm/bridge: aux-hpd: fix OF node leaks
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ee485bdda68d6d3f5728cbe3150eb9013d7d22b
> [2/6] drm/bridge: aux-hpd: separate allocation and registration
>        (no commit info)
> [3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
>        (no commit info)
> [4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
>        (no commit info)
> [5/6] phy: qcom-qmp-combo: fix drm bridge registration
>        (no commit info)
> [6/6] phy: qcom-qmp-combo: fix type-c switch registration
>        (no commit info)
> 

To clarify, I only applied patch 1 to drm-misc-fixes

Thanks,
Neil

