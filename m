Return-Path: <linux-arm-msm+bounces-26173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D4931493
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6E5F28259F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B28818C32F;
	Mon, 15 Jul 2024 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VQIgH53D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAAE18C320
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721047337; cv=none; b=bu8bB0ArFLw85tj8YVVB4pnjqkiHq6lixd0pnzTsv5oYmTiPlH73uUL5t21TJfN5eOvr2KQ57kprNoVmbTbQLhH4OM9IY4rA1zk7QuQ/qnwNnDMtU6r4t0CAKTB1aG+yqlOYnBfs4TuyQe9lywtQ6b4zgKo4yuEdULqW7UkT+Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721047337; c=relaxed/simple;
	bh=EDBgzw5DNpqz9ajLvn1qdqXNoW+eqNa5B0DJrP/Swqs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=d4Y2HZ8KmyldYhJKnQFZqDuMbyMYoM2Q1+EDt4Rmm4arb7XbHtldOU0qlJnPFFszmO/QQ9gn/OaQkbiSxXqejFf78BkHHi95kTa1Xb0Hq1hhK0k9phIsavylaIEiZgRYkW8iqOEq7pLpZwnSKZeUn52pB9Ohsvzqs+F/WEKPA64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VQIgH53D; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so48169961fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721047334; x=1721652134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+EQHqWsk3KyTfpZcgFPziNWV1GVC9Hoip1sZmqcTgg=;
        b=VQIgH53DZt9MLiSkKYHTo5UySRpBK6BRx4t+gc/zlk+SDt00WimQG0eQXeuI5EwDHF
         Im+U8lHMHJeHFBYPHBR9DnS2jBNgrtoIjmhbWa7pYEQWUUVvCRWcWv7fgRZ/sBy6DGag
         nESudaeJHoCqrbagCOBrDV5OMPxUBxPgVOVCz/PaoK9S2UlClOVw83kSRANCBHtoVvcl
         TcIm7vQXEFe9lLM0FK3+Bvl5Z4RpjZ/DnDuUso7adQQSWyJ970n5tezGaaDLMPPIq/uY
         92yE1GhY6qT9BgyttHVQ2hQ7oUVMB3htEA3mFtRmZ43LwllekoICBP/yXtTuwLisspbM
         frnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721047334; x=1721652134;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k+EQHqWsk3KyTfpZcgFPziNWV1GVC9Hoip1sZmqcTgg=;
        b=wdq7rNegE3BE2DeJYhU8UENcyF0ncvvziEdOmTTAlJal7XFHL5gc4X/nNbgseW27FA
         znaOPwz/hFgYq4Q1JswG0BIbpvUzUpfKA1Z2AwoDo4zTEWa3xGGNNcOIcWjV51msxv/K
         0DklgPRmBz4LOjfB4/enGieT2dJ/jz0OjHFYQK4UzsEW4xAAVWjNpGHlf00BcndJUDOF
         3CfyQ6WyYGbcSbs9ZLL/rTpCS6pxheMnErc99uqpXzlSJlkjNiwPKLwY951BQfY2Lzb2
         nGhbYl7l342liabkCwoTIq/o3H2U0F0ti5+MMaN4I9EfA+3vxdmVbGMOxqe8Ddzxppbr
         XmXA==
X-Forwarded-Encrypted: i=1; AJvYcCXSera+bdl7tiNhg7s9kEP9xsqa4hj3g5QPn4s2kBGMt6pyZUZnC/gfjN9H84eQ1oTnWYjP7S3xU/IBsJQFKV9NcwZ2TxzaEgq5ss+Y0w==
X-Gm-Message-State: AOJu0YwYwuOC4HZL64H9lE5ysd5J9BdZ//vMT17go8iBW/ccYj38gVcu
	kP4o2cLCHmdAbc0OHxu64y5jnVwIUE9ysFjo6Yg3G5Se/56DxUZmaZJy4psXO1U=
X-Google-Smtp-Source: AGHT+IFiuC6l6e4W15chCpGMEHC8U71AzWjph63xnUIfCY9cb8EqCei/7BgC+gL95yvQZ5BUSuVCUw==
X-Received: by 2002:a2e:8710:0:b0:2ee:6cda:6380 with SMTP id 38308e7fff4ca-2eeb30e3cbbmr121814191fa.18.1721047333411;
        Mon, 15 Jul 2024 05:42:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4? ([2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafb877sm6342646f8f.69.2024.07.15.05.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 05:42:13 -0700 (PDT)
Message-ID: <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
Date: Mon, 15 Jul 2024 14:42:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
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
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/07/2024 14:15, Stephan Gerhold wrote:
> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
> 
> The panel should be handled through the samsung-atna33xc20 driver for
> correct power up timings. Otherwise the backlight does not work correctly.
> 
> We have existing users of this panel through the generic "edp-panel"
> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
> partially in that configuration: It works after boot but once the screen
> gets disabled it does not turn on again until after reboot. It behaves the
> same way with the default "conservative" timings, so we might as well drop
> the configuration from the panel-edp driver. That way, users with old DTBs
> will get a warning and can move to the new driver.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-edp.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 3a574a9b46e7..d2d682385e89 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
>   	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
>   	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
>   
> -	EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
> -
>   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
>   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
>   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
> 

How will we handle current/old crd DT with new kernels ?

Same question for patch 3, thie serie introduces a bindings that won't be valid
if we backport patch 3. I don't think patch should be backported, and this patch
should be dropped.

Neil

