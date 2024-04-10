Return-Path: <linux-arm-msm+bounces-17002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D619789ECB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 09:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A28CB22782
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 07:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266DB13D2A3;
	Wed, 10 Apr 2024 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sO/eDirm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DE813D26E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712735614; cv=none; b=pa7NfgDO1lUm3mAub+AOdT+JyUGKdVzqTT8U1GOHJHkGo4+G/4bOPf3fbnAAa/qoihCcXfNn6e/WYM/3jp8sQpMfV3SrSCz+Rx39DuOB7SnBcdljvZCcgV/7NBgoAzLr/9vHW6Nyod6mLsTcLVHc7+WISLUVbJK9DaPc85GPgzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712735614; c=relaxed/simple;
	bh=QVG4evRg8W5VO8NJdh62Fh0biVN6yJlwvqrMftGCzVw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UcMiuynvGdZ9Uj5gTHIoyAKW/FOSDhF8gEVvlPQ4QgHx2u3AilwTSvD4WN/HACjQVvbLgGLT5bw9NTBMSUIxYPKBe1Oan3pho9f44Nw02YlJZRmuFV6vEU1eUTH3N1cbCHfPsDbfMnDmNLj7lbXZT2MiOm5AJu3z2B1Pd+/kvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sO/eDirm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3464bf56919so429922f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712735609; x=1713340409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqeWpXq7iVkwpLCfNMJQ1hkeTu7GIqakLNWFUZcYNR8=;
        b=sO/eDirmSN3fGEb5iPJAk6clUQAd70548sqz9Eve+fW8a5c3ID80KIK85pUJyVYZk3
         F3smHfzcis+46tpUiF+nBMyOEip3VM79ElbrvL9ERl0BpkDhm8O9xPJUg7T5LZdNgrSv
         kN/6zNgkZ0tmk8J0XCABcPJ3pfSI+hgt3ATmocBb5rour4Mtb7hj6rf+oG5S/4ZeLyzE
         TbHdoxzR1B2Vgkhbx3/cn11MP6D52TKo1ORo6ujt+eBNioRHlfM8r52Z9WA1IabbHMIO
         M5H/tWkGfRiBOF3BL8ZUMDpr6ulrk/MBHjxSw1IZ4PwYpJmPsozmJa7gJf985ewe2e9d
         M8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712735609; x=1713340409;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mqeWpXq7iVkwpLCfNMJQ1hkeTu7GIqakLNWFUZcYNR8=;
        b=YTYVyxME5WuECTn9VqVqpX/BRg9LueWghgHmdI7ay0fn5CdJO3IjxrTpv6cgiFt/z3
         R109kve90NuNpf5+jApylnoMzn/c2RlAupSmBv9TEpeJqrM/N4FNemJz+8EVVLJ8kvTz
         cT6h3sS93Uouqqitu4t+MVLWP9F2DE83sZuu7qwkQAI8SYEleGxCQC3dG7xgR1ry0/HN
         gzo7g4hgHPFBnMxXSOguXgFdIpwUdlQLfiESwqfcxNv+DPy3L1T/RwCrjFxa/PEcxYUR
         A3nDaIFBn/prXLw4+7iMJd1QkLYL8TXIMKHV0XfOtUwxv7PS19Ge6zfdzPcTEf8NqzUM
         5RhA==
X-Gm-Message-State: AOJu0YyusbsqGCRLPclYhzoH+Fg7zVpvUNG/tY4Umn+6lW1LVZcbLftO
	eG8iO6RywprbfrXAgStI+Cv1+HZNOqKIk5XalNtaC+hy6MBXxBNTPuprDnBYauM=
X-Google-Smtp-Source: AGHT+IH6iDnO+uP8H0cIbAAG8d0vXfntJz0LonCnjcAsVy4AbjB4lxfmj6mpbR9+Z686JLFAOkSYzw==
X-Received: by 2002:adf:f2c6:0:b0:33e:c91b:9083 with SMTP id d6-20020adff2c6000000b0033ec91b9083mr4069681wrp.16.1712735609399;
        Wed, 10 Apr 2024 00:53:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7b0c:6cd:4afa:674b? ([2a01:e0a:982:cbb0:7b0c:6cd:4afa:674b])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c314800b00416b8da335esm1441821wmo.48.2024.04.10.00.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 00:53:29 -0700 (PDT)
Message-ID: <6ac4e36b-91b8-4324-874d-9b90c79451a1@linaro.org>
Date: Wed, 10 Apr 2024 09:53:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: add USB-C orientation GPIOs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
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
In-Reply-To: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2024 16:28, Dmitry Baryshkov wrote:
> Populate orientation GPIOs for some of the PMIC-GLINK-based devices.
> This leaves only FairPhone5, RB3Gen2, SC8180X Primus and SC8280XP CRD
> without the orientation GPIOs declared.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Relax schema restriction for orientation-gpios property (Luca Weiss)
> - Link to v1: https://lore.kernel.org/r/20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org
> 
> ---
> Dmitry Baryshkov (5):
>        dt-bindings: soc: qcom: pmic-glink: allow orientation-gpios
>        arm64: dts: qcom: sm8350-hdk: add USB-C orientation GPIO
>        arm64: dts: qcom: sm8450-hdk: add USB-C orientation GPIO
>        arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add USB-C orientation GPIOs
>        arm64: dts: qcom: sc8180x-lenovo-flex-5g: add USB-C orientation GPIOs
> 
>   .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 14 --------------
>   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        |  2 ++
>   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts |  2 ++
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    |  1 +
>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts                    |  1 +
>   5 files changed, 6 insertions(+), 14 deletions(-)
> ---
> base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> change-id: 20240408-hdk-orientation-gpios-141bc7fd247d
> 
> Best regards,

You forgot to pick it on the v1:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

