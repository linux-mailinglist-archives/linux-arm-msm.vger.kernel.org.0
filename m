Return-Path: <linux-arm-msm+bounces-82127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CBDC64B14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8AAC74E91BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1696B2749DF;
	Mon, 17 Nov 2025 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilgPcbIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0943C30DEA3
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390737; cv=none; b=pn3RyzwzuUoUzzjHpm6v80bx/gQWaR3MakiJfc+qI1jDtzRbiHbYp4Doyui0orsLIBjIDiUzoWSjGK63FkN8cQmjzsQhTclWgsC0L1//0Mt8G2ZHAOhmdh8Lcix+sB2MerNIC4RCJv5YuZ5W/ZZizp+lj8D/CpUz9Ia8cHNe6mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390737; c=relaxed/simple;
	bh=Q6zm4hF/iuyshuI8ZTVRPYLVS9bhIMvZAtEoGBwphH8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FUvggTyPh8jR8TuiCLt7NKulUYB38fOqc1RdLdUeM4IENAFAk14LTu9J6XCGWApnQqMzeUqCPv12UkJgs5ECPESI7GscAUqJGYhZYaIHWaAb6yyM4di4I4ebN19zduyXih5g2AMpiJg1E59/d59fcjJLQ1T6GshJzYFbdWyfsxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ilgPcbIh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so14987135e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763390733; x=1763995533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk1rjAouZOijY60x5awEeFZKndj7NK9f5IbkSRl7Hig=;
        b=ilgPcbIhX64PZXxn2qgIjAK8KupZkkjeaBdC6GnUi9CDSeTkOFM+VL63LkVDzmzQOF
         HfR0lXyqfRZcRv+hM9OkgVfZ5kpyeSJglbL+5X2hlKO4znxkZv0AYiOWyFGIULeU/UH6
         is/BoMcuP+5Ja+/5On3a/KGXiff3Fi6iLjYYUUZUbS7S8QjZUcG+N8D5BPN0K20DUFTR
         c99Oqyc/jWpA+6i2brxgZ6PvXeMaHs2/4DgQtlwrQEZlxtqYy1YwO7+VKedqWBiCY79u
         onCPY3LcDjM6rB7zW5bxdMiELWCdD8oFHGDjDOG906yThOE+ftsqWw0ZPA2MR3ddN2qD
         HIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390733; x=1763995533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk1rjAouZOijY60x5awEeFZKndj7NK9f5IbkSRl7Hig=;
        b=HtIbO/+OGgpQDqwoY2Bz3G7ljQQyZCn6iiGrT6kLjf31Vw1Gc/pXSzWK4hT9u60LN+
         5t/7RvHfCSTktUjmWBNJvnIhiHvDlaffAn58zoPK+UzV9lCM84YowgWqgf+A+ONFXJuo
         MXmXk20dRxxyvRl0stPBmJv+GZhWCIeEzcsbo/r9RDRXxYyB72QDjldoPl5NzwoJpr5s
         dDlA5Whl4TjrY8L5vmv2RfULUfpi945MNxtYaUtEEwVHhwHfbov8xEdy45vFcKoK40+5
         JJkcZExkE/+KPrhFJHOWBCErtfJaULqkIUSTwlKhQFB+BWN/g+1uoASYj0Ho0Zh9A9sv
         9C2Q==
X-Gm-Message-State: AOJu0YylbGN8eseeP4sEvB1fcsq3ODWnTEM81O2cagNIuLnZwVX3Kamh
	U2RA3b0Fxt1w3EJSQCHofIntYb0KxGF1kSPXDU+iCKbjji+1dPK0lT4DaX38cYHM01U=
X-Gm-Gg: ASbGncuut2UuOMOxZZEzHgZVxMp5W4syfUCu+w2wOQt8IIguYr4bViRQZKwUM0W2C9e
	57dMDgS27IAReRrivhJCZ7kyVkmrl07HUSjzfFFr0MOg9VaADt1nTZbR47wclevMjtRgCXiM4jV
	S4gU+YbryO4UHW1j9QqcpWE7TfZEfmiZNRVBUJQCPsYAe646gtCgG85sLoBMW0oiwIk/C2dwMF6
	H0QhSgbQ0XCckF+xs0O+RDsaaOcISTz4xqfYp6SnI+OxdWNwxL1zsnEHKE8/zMqdLDnBfgbLoG0
	JAfguQISEVVUAxS7/JhZBcNuXBUtRYCohRqEV68fy57nhR+rxR91r87ZiA2hDttLjpxqUupjgvm
	USbdOwefzqD2KIhmVMxwINBBYIdnB8yezj9+GWCeYZJNNcg3dPBTH9HWtjtOJDs8+tSykuhkiJv
	bSzAd9MgNBWEWky0rqKENt5xPDws785p7Bs/gtHzpOf9dHl5gOXWHs3C5W1tQTC7E=
X-Google-Smtp-Source: AGHT+IGlg72HMQBd44oB2inZGPtEY6S/5RoSqJOOvYSdU1XD8940TN5ihG3EtEkhqdXoOuWUP9+0Hw==
X-Received: by 2002:a05:600c:c177:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4778fe683d6mr111222665e9.13.1763390733101;
        Mon, 17 Nov 2025 06:45:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779920f2cdsm154148925e9.10.2025.11.17.06.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:45:32 -0800 (PST)
Message-ID: <168374f9-cf03-481b-b4b2-ed51787a3def@linaro.org>
Date: Mon, 17 Nov 2025 15:45:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 0/2] Add support for Gunyah Watchdog
To: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
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
In-Reply-To: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/25 08:57, Hrishabh Rajput via B4 Relay wrote:
> Gunyah is a Type-I hypervisor which was introduced in the patch series
> [1]. It is an open source hypervisor. The source repo is available at
> [2].
> 
> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> access the MMIO watchdog. It either provides the fully emulated MMIO
> based watchdog interface or the SMC-based watchdog interface depending
> on the hypervisor configuration.
> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> 
> This patch series adds support for the SMC-based watchdog interface
> provided by the Gunyah Hypervisor.
> 
> This series is tested on SM8750 platform.
> 
> [1]
> https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/
> 
> [2]
> https://github.com/quic/gunyah-hypervisor
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
> Changes in v7:
> - Convert local `const` arrays to `static const` to optimize
>    initialization and stack allocation.
> - Link to v6: https://lore.kernel.org/r/20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com
> 
> Changes in v6:
> - Fix build issues reported by the kernel test robot on PowerPC and RISC-V
>    architectures by adding IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) check
>    before calling arm_smccc_hypervisor_has_uuid().
> - Link to v5: https://lore.kernel.org/r/20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com
> 
> Changes in v5:
> - Move the gunyah_wdt device registration from the SMEM driver to the
>    SCM driver. Add additional logic to check if we're running under the
>    Gunyah Hypervisor.
> - Implement .remove() for gunyah_wdt driver to make it not persistent.
> - Link to v4: https://lore.kernel.org/r/20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com
> 
> Changes in v4:
> - Move the contents of gunyah_wdt_init() to qcom_smem_probe() to make
>    sure we're registering the watchdog only on the Qualcomm devices.
> - Link to v3: https://lore.kernel.org/r/20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com
> 
> Changes in v3:
> - Move back to platform driver model. In module init, determine if we're
>    running on a Qualcomm device and there is no supported memory-mapped
>    watchdog present. Then proceed to register platform device and driver
>    for SMC-based Gunyah watchdog.
> - To determine if we're running on a Qualcomm device we're checking the
>    presence of "qcom,smem" compatible devicetree node. As an alternative,
>    we also tried using socinfo for the same purpose. When both
>    gunyah_wdt and socinfo drivers were made built-in, it couldn't be
>    ensured that the socinfo driver probed successfully before gunyah_wdt
>    init was called. Hence, we resorted to the devicetree node approach.
> - Limit the errors listed in gunyah_error to the ones that can be
>    produced by the driver.
> - Link to v2: https://lore.kernel.org/r/20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com
> 
> Changes in v2:
> - Move away from platform driver model since the devicetree overlay does
>    not happen by default.
>    See https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/
> - Only when MMIO-based watchdog device is absent in the devicetree,
>    proceed to detect SMC-based watchdog using GUNYAH_WDT_STATUS SMC and
>    initialize if SMC returns success.
> - Implement pm notifiers as gunyah_wdt is no longer a platform driver so
>    dev_pm_ops cannot be used.
> - Pretimeout IRQ is no longer supported.
> - Remove struct gunyah_wdt since it is not required.
> - Move the contents of gunyah_errno.h to gunyah_wdt.c.
> - Link to v1: https://lore.kernel.org/r/20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com
> 
> ---
> Hrishabh Rajput (2):
>        firmware: qcom: scm: Register gunyah watchdog device
>        watchdog: Add driver for Gunyah Watchdog
> 
>   MAINTAINERS                      |   1 +
>   drivers/firmware/qcom/qcom_scm.c |  53 ++++++++
>   drivers/watchdog/Kconfig         |  13 ++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/gunyah_wdt.c    | 260 +++++++++++++++++++++++++++++++++++++++
>   5 files changed, 328 insertions(+)
> ---
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> change-id: 20250903-gunyah_watchdog-2d2649438e29
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Thanks,
Neil

