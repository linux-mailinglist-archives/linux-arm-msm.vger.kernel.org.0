Return-Path: <linux-arm-msm+bounces-26049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B792FCBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 16:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD954283F44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 14:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150EB17277F;
	Fri, 12 Jul 2024 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pygdGV22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0F171E66
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720795183; cv=none; b=Gb85fIblHnrkyORHFnsVXQPZ3pWRAAKjoDA3RM/i0ATpNXtgfE3qCt9Jlw14jdIgGkRyo56CiVCX5xpilG4m9F1AGUtGj4I86ODXFyR9HnFYcRsrzMaK4CMXOL9Bq0A7sCcdEW3nx9bELwSBFemPb2dS64Zvoec14Zkt5hIFZo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720795183; c=relaxed/simple;
	bh=vCag917Ay33RsHIAYI483LRvFB14mVxaZIpusLuag/w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DNpkZfEc5WBaaBOGseO4eME+OGLCyHdSmi8iCJrwVU3FGddJhEVE6b5HefaMWGBboUv0J0bMmxL+QoUT1ylGw551XIqoplUc1ht3vmV/eQELl0xxo/Rnz1kSg+pc/ighKgTa6qQB3vjSToeF+ccxN+IjbWL0/YtkTIVfMTS8lus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pygdGV22; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so23528701fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720795179; x=1721399979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+529H3GiijTCXecWV4ffQBMI7Sa+Z0BYJ6CZ1mod40=;
        b=pygdGV22A3lSDkoGSZm2+Bqvl+KTy+8iA/J8lVAsQx3y4xjCuABoXSvsd1oeq1gZYZ
         vUaghTadeitpyWLSJ1OUgq803WaNO9H3IwAk3fOutxykiYVgjM4vbS/dQbSvjaHP/B//
         CmgPCnb8/+CWT2YMQvYbMWcBOBAkUC/X9uqb5aM8/EVKWvQS7gCPqAuYLOPgrj4TGNZN
         ccdc+X+TbuHRwVRaFeno4TOvOz9AIFXjyw43is9QWtWubL6xJZ06s5opwD0eR3xtxoUV
         vv83p9z78uA0L16QTmdbulQ/o1TKTCm/6jFT6sRdhrxj11e2vfu1m0tjmHBRajwbvhh2
         NRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720795179; x=1721399979;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j+529H3GiijTCXecWV4ffQBMI7Sa+Z0BYJ6CZ1mod40=;
        b=HO51V2uQSGaHuZnP8DTrAxayfVNYwXmjfiI4WD/szJCxX31vHt75dC3ThHxWvhouV/
         6MDg0OJujsyX3SaVH836VY/dWsZ58OQTak1hoSEjs4z1Yuly0jeHUkVzFeaX0Grn1URE
         62oAY2/lNB6zwQBViajea58K0wynD/8nLscHBvnVvRg1exAd4PlpBrFvuqePMuzB3M6T
         H28Xf/2K+A8EUTwWdIzWGgbe/Hmj0qY4m8HNsN7YaufL2oqBxnffKw1eG/XuW/XEb9tZ
         xRJEuOaZNJmM6TtCGGyPynEN0PYsxcg1usKhmQMiIAx4Cf6WzfVN8Fj2bbEB4pUdIkr9
         a8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8GkjVicShl6JAhzn85r6bnzyoav7BF/RLtk3MmjJxVu2w1DXai1p89agoY5RJwjxcJCQWVWo8AQnlVImrvVgMMayAxK+HWkJhWXdXyA==
X-Gm-Message-State: AOJu0YxhtRttEHWsVNAAf+8KLejSVSXPmUgWyRLhZ6wMux1owuWQ35ag
	AI2xvgbNFQlB/HDSwkSPH7kpj97LgHemFspkbZ5xCTfJBBiBMNypZgoDQHcBL8Q=
X-Google-Smtp-Source: AGHT+IEUJv2E2YmWwP9keqGtBKgVNIRhkD50j8KUevpEmBZBl6UJ/Ph9d40mcCJXS6cKySEZWRH03Q==
X-Received: by 2002:a2e:b8c4:0:b0:2ee:d8f3:188d with SMTP id 38308e7fff4ca-2eed8f345e7mr5211101fa.14.1720795178997;
        Fri, 12 Jul 2024 07:39:38 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:123f:f92c:4c8f:b8cc:9804:975e? ([2a0d:e487:123f:f92c:4c8f:b8cc:9804:975e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f25b946sm25336675e9.19.2024.07.12.07.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 07:39:38 -0700 (PDT)
Message-ID: <306baccf-0106-4253-b6b1-72eaee9c5911@linaro.org>
Date: Fri, 12 Jul 2024 16:39:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/5] Add support for MBG Thermal monitoring device
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kamal Wadhwa <quic_kamalw@quicinc.com>, Taniya Das
 <quic_tdas@quicinc.com>, Jishnu Prakash <quic_jprakash@quicinc.com>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240712-mbg-tm-support-v1-0-7d78bec920ca@quicinc.com>
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
In-Reply-To: <20240712-mbg-tm-support-v1-0-7d78bec920ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/07/2024 14:43, Satya Priya Kakitapalli wrote:
> Add bindings, driver and DT for the Qualcomm's MBG thermal
> monitoring device.
> 
> Please note that this series is dependent on [1] which adds
> ADC5-GEN3 support.
> 
> [1] https://lore.kernel.org/linux-iio/20231231171237.3322376-1-quic_jprakash@quicinc.com/

Since this dependency was sent almost 7 months ago, and had plenty of changes requests,
this patchset should've been either delayed until a proper support of ADC5-GEN3
was accepted or marked as RFC.

> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
> Satya Priya Kakitapalli (5):
>        dt-bindings: iio: adc: Add ADC5 GEN3 Channel info for pm8775 PMIC
>        dt-bindings: thermal: qcom: Add MBG thermal monitor bindings
>        thermal: qcom: Add support for MBG Temp monitor
>        ARM: dts: qcom: Add vadc support for pm8775 pmic on SA8775P
>        ARM: dts: qcom: Add support for MBG TM for pm8775 on SA8775P

Those should be: "arm64: dts: qcom: sa8775p-pmics: ..."

> 
>   .../bindings/thermal/qcom-spmi-mbg-tm.yaml         |  63 +++++
>   arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi        | 210 ++++++++++++++++
>   drivers/thermal/qcom/Kconfig                       |  11 +
>   drivers/thermal/qcom/Makefile                      |   1 +
>   drivers/thermal/qcom/qcom-spmi-mbg-tm.c            | 269 +++++++++++++++++++++
>   .../iio/adc/qcom,spmi-adc5-gen3-pm8775.h           |  42 ++++
>   6 files changed, 596 insertions(+)
> ---
> base-commit: c27723304c1f6af79f7bece5edacace6a8d46167
> change-id: 20240627-mbg-tm-support-7bbf25c246e1
> 
> Best regards,

Neil


