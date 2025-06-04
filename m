Return-Path: <linux-arm-msm+bounces-60250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDBACE16F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 17:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 119A93A88BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D8B201278;
	Wed,  4 Jun 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oskc130A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ACC1FECBA
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050767; cv=none; b=Psj1w9QDs+4jOvLA57s1f0wAAdUyYXulqAq2dtsTtfzeLs+6PbpX1fCzjAJIAm/EtM/xsapVjtyavKnvz8fQu8vI+l2tlzxgtinmdM1bkkcec92FieI5HFyPHvNejrRziXlPQyjUgrpdYruAi1+oimT2O++kl25nCgiSqE2G4qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050767; c=relaxed/simple;
	bh=GBI1kOt6UTntFPnDAiCPurA9pwJ2CkH4038SpVinQWI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WbINJqyfl1SZ24Oxu/6qZEwAPomn+qrvVg6lQCVLfYG56E9Z1yRSNcQRxdDLevZej7di2yvUmF5CKu69hJtAhOvkyeiOvn3TIldoke1iXoh1QUlL/geWbEAYj2ueP4MhBL4Y4Vdp1Cywp/K5WBGnh0LAqcLPAU/DDV2lBeeSRko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oskc130A; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so78581045e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 08:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050764; x=1749655564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0lcqU7F4Smj0GWpb9honM7MK06fJTYKjPwZgoAkico=;
        b=oskc130AdxRjqmMxXoOYbUC9bGSUPpgyU+EUCAQJNRLzRcrcp3J5VzA4j+Z5dgFfqP
         OnNfb8D2pFYO1i/JJ8PxF2rkgjmejY0ZKCKsgMnrXcTlBW7LCIjHQ7bJ89PHUsXZ5cGn
         aj8BOLqXTpHPcdnGeRjZH/5LIcosaNh3D4XMLv+W+jsfokUjaoD7w4QlKR32tMaEeRnW
         EmBgBwY0keBv81BOAmDBNT4oYNGhJnqSjDoDK+xxwKqWbfCKBM9IIkz0bi73lYZa85oY
         SOoFLwj+ryq6nKGqStanRlJXodVDWj0qoVIIaLXeNMd07gxGyZN+eEZTkcKXp9kgCvUW
         g07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050764; x=1749655564;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B0lcqU7F4Smj0GWpb9honM7MK06fJTYKjPwZgoAkico=;
        b=EOI8J0z2qxPJHcmY+8iveu6DxNvCV7p/5Xt/TSrnmqCbufLAC0QIdJKE1OkJY9MGgO
         SSEUdTMKlt+8JTwT2Dyu2sizxcmGT6PZv4BXeSD5+RmsL9ehl+iw/guNi5zA1Q3cRpVf
         Z8kMkyhkqVGiLAHwK+/r0KS4JAjt3+XZPhfVgON5hLQdZvYNbOOQtN8bGDy16nYNhirF
         Abdcif6fJLozLt/H5O0M071H9v16e2lnNv2WTT+REPe6Gg/atWUbrnsLHbWVcKWkDZg6
         G4b+dHXEJt+7LRCHuwSEBNq7phcWMISjh9cDbkM446yJf/qVVFfttDd75aJwrTjf1DFN
         wdag==
X-Gm-Message-State: AOJu0YwrSH5oVOOeWKYsckWCeRz42vCOhM3J+45tQ/JTH+jj1qv9+4Tu
	djBEhJHshi6voVkKhqgI7yj9YIeQ0e3kqtqFv4C36gG68ySwBv1G0BKe0yjiWeegwYc=
X-Gm-Gg: ASbGnctXhxrNr9gU5ui/0YMy5/fKOGrvlMiM7yHTsh3tmAzfb2K6StdzrudZVhB45MZ
	lY2c2t0F7bYcVb7DJaVeCyJCeLWmLX290Di2rqdESJ+ktJkjVdzIbgGf9GLjnWebx1iMW14UUR3
	3qsS22z+Rgl/FunpqYzH1D4+rkuWdmOFMFgHnFGpd6aLCMoMloDmZ0bgY6PO/aPk2h4+fcMuDe8
	/Yb5PXFbw7ld4X/SlOX9H3wj2WpHN/Z4QqyYj/vnoL6rdzvB2jgFnE0azu1UCOaiikIG/11tVLa
	UyEGfq+6Y/LW0KTCELwzm7IGbCh2aeBZCT8fpBjfIzzqfzS/GOVqivNPk1uJaxLnGfCLorUeAVz
	vGL92ADF2TyiR4QD3YciQJWIb9A==
X-Google-Smtp-Source: AGHT+IHSHAjhdXAKFOooiLdh3xOijEcwpDuXOWN1lz1ky8KfmORabIgw+h1ADRjlvhvZfDXR1mvoYw==
X-Received: by 2002:a7b:c41a:0:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-451f6502b42mr12017605e9.17.1749050764240;
        Wed, 04 Jun 2025 08:26:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8? ([2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0421sm22296664f8f.97.2025.06.04.08.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 08:26:03 -0700 (PDT)
Message-ID: <35789b5b-76a3-472f-adef-cc47f6d23dd4@linaro.org>
Date: Wed, 4 Jun 2025 17:26:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] phy: use per-PHY lockdep keys
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com>
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
In-Reply-To: <20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/05/2025 18:08, Dmitry Baryshkov wrote:
> If the PHY driver uses another PHY internally (e.g. in case of eUSB2,
> repeaters are represented as PHYs), then it would trigger the following
> lockdep splat because all PHYs use a single static lockdep key and thus
> lockdep can not identify whether there is a dependency or not and
> reports a false positive.
> 
> Make PHY subsystem use dynamic lockdep keys, assigning each driver a
> separate key. This way lockdep can correctly identify dependency graph
> between mutexes.
> 
>   ============================================
>   WARNING: possible recursive locking detected
>   6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 Not tainted
>   --------------------------------------------
>   kworker/u51:0/78 is trying to acquire lock:
>   ffff0008116554f0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c
> 
>   but task is already holding lock:
>   ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c
> 
>   other info that might help us debug this:
>    Possible unsafe locking scenario:
> 
>          CPU0
>          ----
>     lock(&phy->mutex);
>     lock(&phy->mutex);
> 
>    *** DEADLOCK ***
> 
>    May be due to missing lock nesting notation
> 
>   4 locks held by kworker/u51:0/78:
>    #0: ffff000800010948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x18c/0x5ec
>    #1: ffff80008036bdb0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1b4/0x5ec
>    #2: ffff0008094ac8f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x38/0x188
>    #3: ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c
> 
>   stack backtrace:
>   CPU: 0 UID: 0 PID: 78 Comm: kworker/u51:0 Not tainted 6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 PREEMPT
>   Hardware name: Qualcomm CRD, BIOS 6.0.240904.BOOT.MXF.2.4-00528.1-HAMOA-1 09/ 4/2024
>   Workqueue: events_unbound deferred_probe_work_func
>   Call trace:
>    show_stack+0x18/0x24 (C)
>    dump_stack_lvl+0x90/0xd0
>    dump_stack+0x18/0x24
>    print_deadlock_bug+0x258/0x348
>    __lock_acquire+0x10fc/0x1f84
>    lock_acquire+0x1c8/0x338
>    __mutex_lock+0xb8/0x59c
>    mutex_lock_nested+0x24/0x30
>    phy_init+0x4c/0x12c
>    snps_eusb2_hsphy_init+0x54/0x1a0
>    phy_init+0xe0/0x12c
>    dwc3_core_init+0x450/0x10b4
>    dwc3_core_probe+0xce4/0x15fc
>    dwc3_probe+0x64/0xb0
>    platform_probe+0x68/0xc4
>    really_probe+0xbc/0x298
>    __driver_probe_device+0x78/0x12c
>    driver_probe_device+0x3c/0x160
>    __device_attach_driver+0xb8/0x138
>    bus_for_each_drv+0x84/0xe0
>    __device_attach+0x9c/0x188
>    device_initial_probe+0x14/0x20
>    bus_probe_device+0xac/0xb0
>    deferred_probe_work_func+0x8c/0xc8
>    process_one_work+0x208/0x5ec
>    worker_thread+0x1c0/0x368
>    kthread+0x14c/0x20c
>    ret_from_fork+0x10/0x20
> 
> Fixes: 3584f6392f09 ("phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Commented the wrong version:
In fact, other drivers were using sub-phys before:
./amlogic/phy-meson-axg-pcie.c
./amlogic/phy-meson-axg-mipi-dphy.c

(yeah I know, my bad !)

so it should be:
Fixes: e2463559ff1d ("phy: amlogic: Add Amlogic AXG PCIE PHY Driver")

With the Fixes changed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


