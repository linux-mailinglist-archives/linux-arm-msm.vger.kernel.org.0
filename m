Return-Path: <linux-arm-msm+bounces-48059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB1A36355
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 17:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB1933A534F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3922673A5;
	Fri, 14 Feb 2025 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZYdMw8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3589E26738E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739551409; cv=none; b=Hgou+JAoQ2pkh8vW59GnwYJy/fKBLtzr7Ne2Sje/R1KxBAhBhiXuwCh72AvlgXsP2ia4M913dLzv266IY3yV7aXpOKB9jXcY0yDzpYoWC8goBWAe5Pob356snrZyPmcz2c84bIsAx5eowreGnw1fwarazs7UQcenhgqycWZ4eL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739551409; c=relaxed/simple;
	bh=T0Cc+z6SRVu7e06KR11IEZ4n79dP/59PiGxBJJsikh0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IxaWzo1E6Z1ISQNuFuwYhpCphxCrF537m6pcAzdYB28ZGT5f1Ypan7RjiPdj9jHXlPC9fT03JjJuLUDp9LVq+RzM4BtpwfU5AaYy2yOTpX1j9kVvug9iS4G49vov5uOcxQ2T7tjO3/aa6JEBi9Pfs7k1/+H7p1VPRPr/yvfVnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZYdMw8w; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so4070800a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739551405; x=1740156205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRqWZT3EBc1tCny87S20bhNlMrhX8IzD8m5JUC/YP94=;
        b=AZYdMw8wDlSUhHRLXRMOgWEsqhys4efbjNsUbYoGDWZOFFD1xxN2QslDnUvDhQDL9V
         tzA0UiJ6OQf57/3sLypnrUt7X3ZkIdpMhsL3upcFE1VRXHIxMIRQAEcNZvRJYz/NoPUQ
         zqtpRxZ0a/fr90L1RDp0gDWd49VUdCm1yNx0UQCqRGriwB6QwHTAs7VoSExSdx/Gn9T8
         HOMKTKYqB2fWwoJ+YroQ/vWj9P7sEXNbr9VZMbQ95XPfx4WNCk9PEC7YBmO0d1Z68QdP
         HrP67iqAKjR8JCqY0VSW+7H4PMSBdH1CrcoqaaTa8T5Z6kQ75qRMcTwhiz6T0fI5ched
         aDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739551405; x=1740156205;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LRqWZT3EBc1tCny87S20bhNlMrhX8IzD8m5JUC/YP94=;
        b=ZDLESbzPP1cKDDT8HAfoAUwIeCHkGlcqH4gf/lp6cKqAj/qhlSEgTq8MWxDGXNzfLx
         q2aA4oqRGts5vxyM1pRF753Z+eQnJpmgc7F1sjJtz/y8mdXeh1qQraTZUroRycqDtzvf
         0YpFzReYWLloAlCvUCuXr9dYI2BLoL4166lBZw6FJVzXhsXnfbh+X7t7dILKvSp6FzMu
         1IjEaA8Bysg+Do3Qt74/IHl0JtU8YBHgl/03+3YU7J9RC2VNo9ChB6klER8A+bP0OaEF
         QDUIaDBmsj5GjCwW/iVlfTiJ+b0uqZLOBf4+JGprAK8DW/M6UKWxKxN6gfGilz/szCWL
         hvnw==
X-Gm-Message-State: AOJu0Yxxa0niWzCSVUyi/dJvPDZvXqX8xSYX4iQJ/fC/lEfEbSsfbIO2
	EnofUcsxAVj2+6JcufHn4OtO3UOCc/94Xw+UURqp57PFDchgjzF5Wy6YgxXyrqE2drGgNYEt/D2
	R
X-Gm-Gg: ASbGncvuqh9y/ovUoBLHDX1EDIEoOU7hsmGDhG/mX13JCbc1HD18REe48Yx+vbhtRuS
	Hli1eAB76B7ApBswyDUjG05qXeIRXkx0K65G04gn3d6sJYjl+UpjVCn8YGk8pi0EV8hxX4McUfn
	Y5nIKmuAMeY6j6xHDjzVp56jO3XeBHVdE+D+7DKqdnoJkuqSzaoqeIqVwQ8c3siPNFGQa44sPz4
	3E3WIJipl3TE/F5LP1PQvzv3DQ55BGuYCn4qxuINYXQmPAKEAEfHy6t56F567zAsKGbjQA28Wl2
	iwPrT8Mx+QyzlQnWIma1j9HESbtFcNdRNwyO003TLbshHnEVfGqx4RXWClW1y/1aR/GK
X-Google-Smtp-Source: AGHT+IFJuSESmgIJ+f/guNQjZTVvQM42EUhcNb7YjZIMzJarYW5+AD5ul67Inm+uaDqq7havtVXdPQ==
X-Received: by 2002:a17:906:c112:b0:aab:eefd:bfd8 with SMTP id a640c23a62f3a-ab7f389f31dmr1360440466b.49.1739551405379;
        Fri, 14 Feb 2025 08:43:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:cd94:8ae7:d2b7:7369? ([2a01:e0a:982:cbb0:cd94:8ae7:d2b7:7369])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6cb77994sm11523366b.64.2025.02.14.08.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 08:43:25 -0800 (PST)
Message-ID: <0dcab844-d9df-421b-bf6d-462b40da7a14@linaro.org>
Date: Fri, 14 Feb 2025 17:43:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: defconfig: enable DRM_DISPLAY_CONNECTOR as a
 module
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250214-arm64-display-connector-v1-1-306bca76316e@linaro.org>
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
In-Reply-To: <20250214-arm64-display-connector-v1-1-306bca76316e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/2025 15:57, Dmitry Baryshkov wrote:
> The display connector family of bridges is used on a plenty of ARM64
> platforms (including, but not being limited to several Qualcomm Robotics
> and Dragonboard platforms). It doesn't make sense for the DRM drivers to
> select the driver, so select it via the defconfig.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index cb7da44155999b59aff95966f4cdc9107f2af46a..dfcc754962f7a40377d1f8e0f16983af5ace28f4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -911,6 +911,7 @@ CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
>   CONFIG_DRM_PANEL_SITRONIX_ST7703=m
>   CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>   CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>   CONFIG_DRM_FSL_LDB=m
>   CONFIG_DRM_ITE_IT6263=m
>   CONFIG_DRM_LONTIUM_LT8912B=m
> 
> ---
> base-commit: ed58d103e6da15a442ff87567898768dc3a66987
> change-id: 20250214-arm64-display-connector-c1c1569f9799
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

