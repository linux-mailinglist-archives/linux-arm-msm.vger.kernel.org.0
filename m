Return-Path: <linux-arm-msm+bounces-78719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B90FDC058AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 12:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D31F1A05A76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9158230F80A;
	Fri, 24 Oct 2025 10:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OzXSt/G7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CA30E85B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761301123; cv=none; b=uldiuN57gB5a5w7HyusrQ6QvC1VXNAZexchOBs0Zrg7Xt+FaLxczHrujPcEboODLu0lfmP1s98gmeymuLmG67QSKjU3C/QKlqGvBv1FH4jMEFBalFkYwjJSW5vgAoXJJ+oP9XENRGMicnkC/fo3N95GnGVDToyqViHARrE0jlPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761301123; c=relaxed/simple;
	bh=rWQGCMzvzjTn6AJwK/FlgG0dNZ5UDWVZEtrKZxT8988=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhXxImkR+vOruVKh+uLBvDPhUT144EuRppH/xo14xcSxQjTaysToXTbljQ7kctRUOUbPgBG4H50E+4X82lVMCW9LbL3kicwbCzUoV4bRndk0Bwz6QmfIsCeO9r9x6xrJkDNUNeHGQ9eSahDQfYrz5XotG8+y/p4Ui+8H6q60z/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OzXSt/G7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47114a40161so19248235e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761301120; x=1761905920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwB3t6H0X4AgP7j1wsFO2pehPyw3gdrsIRR1+liHUJU=;
        b=OzXSt/G7s1Pd8XR/XZwH4UrD2r9AqOTs+fLRdcBCXCw0ew/eGAeA6oFCcLjDlxb8tr
         Idzn7kTQJmfK97isIX7hwplbTxD3n7O62yzGCBh7B6jK5XkBf7D2ivEvEjJED5cN5dnQ
         3dyRT8ow/ofeL+NZ7HisPBOOIo6j5MwQK1tYX2GPtLLve8XcEc5bML1WCNTD2gMFU1tY
         xgIka3la4808RMk4SpO6aQZfyizDPNUPkM1xK8AgpnCEt+rJmfyLqhPqehddeGuKG0dH
         xg5PcAC0oHHBbcexDFK8zvR6oxGJwdBZpavpBnKeoBLoLgDAdoi4Hms/6POdxHzp1TeF
         23kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761301120; x=1761905920;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JwB3t6H0X4AgP7j1wsFO2pehPyw3gdrsIRR1+liHUJU=;
        b=VHAr2W7jk0KWVweLUlSlxIEuZraY1ZiqTQmHPu/LVZ4XN1uOB7O2p4WO/4oC2K5tGJ
         TSSItlZEOgnBjAayBrowGDlBUCNQbNK1pKtC4Vrd8Lqsufd0YqMRziJNdendLBNMXvoA
         YCDkhmM/Cm/fzrO5aGUMXAuJoUhSOoZj+C3ZMv0NTNKiAmWo/mIQ2nbQTEVy1V8Xa0La
         iXG5oh68a3CGHuiiOhmhqEytYKD9fMtQpUBd8TjEmVE1dp1Yn7FUgGCjupiLJOZC4hTw
         haEKL5lvYXfb3gqfxBoY250D3IEbBigDmB0X2dVJRsXUA+bE+rpv7lqPOygp4dThxmwx
         uT1Q==
X-Gm-Message-State: AOJu0YwNfMH/qYDCj/tGUvltC13bbjnkkjvM1dIULpldKJDBZO1sGV2+
	wlCC5zFuxG4zIXrXCz9bvKBr90RhMPLrFeUKpZnJPP3MVGWEYGZO2tYqOb77HUwaCfI=
X-Gm-Gg: ASbGncuoZ9Y2NWTPDDmSjqSRFgznu7GjCxJwGRc+HoFxOJdoaysaWgYMWg06qiSgJfZ
	4ozU/fgX0JPoVhodTU9sO1GMM6fQiCyFqOEaFFF80euy2qSP32z+fqRt8G0oXaM6FgTfzcpuPqx
	J9iq87k0czkayXxGWycUigaxjJ44iGJL4iBwZi9T2iUDnjIJ+eUJ8spy32404SMCV2V8Hz/tZGN
	/EqAra3cM2dhO0QHR4RAyk7cYDhJcM5/g3dmrqiYGVMs2I5J2FLr4DRqZ+JmI8HA/0Pj43fxCOK
	nTL6egj4iEw5jPSE+kUnH/Sgk0OEGoeNxFWU5WlylF8PNtWTyp9ad2IanjKOeE4tH0Q+W1uvycw
	riJlXcCUwu68qtkUrKlHufUKoztLmMYq6jJtiWq5Wei5NyxxS0+ku6FaXB13oBSpOfDtc40y0uP
	brfQW76iKF3YStnsQ6z+xyWtJLsDiKof4vRE+gGo4oZOflymzdtp28hrkvfSiursU=
X-Google-Smtp-Source: AGHT+IHXeppyLMbbfZFM901/QbMMs5mlNKjTRPDgUNBA3WzjQcRIE5pgrN+y8XRnEocb/XETZ6hZpQ==
X-Received: by 2002:a05:600c:6085:b0:471:133c:4b9a with SMTP id 5b1f17b1804b1-4711786c79emr234558875e9.6.1761301119804;
        Fri, 24 Oct 2025 03:18:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b4ee:479d:354c:6970? ([2a01:e0a:3d9:2080:b4ee:479d:354c:6970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4298d4a49ffsm4623186f8f.13.2025.10.24.03.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:18:39 -0700 (PDT)
Message-ID: <0cd8f4d4-d418-4634-abaf-f66b350c81eb@linaro.org>
Date: Fri, 24 Oct 2025 12:18:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/3] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Collins <david.collins@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 kamal.wadhwa@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
References: <20251024-pmic_arb_v8-v3-0-cad8d6a2cbc0@oss.qualcomm.com>
 <20251024-pmic_arb_v8-v3-3-cad8d6a2cbc0@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251024-pmic_arb_v8-v3-3-cad8d6a2cbc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/24/25 11:33, Jishnu Prakash wrote:
> From: David Collins <david.collins@oss.qualcomm.com>
> 
> PMIC arbiter v8 supports up to 4 SPMI buses and up to 8192 PMIC
> peripherals.  Its register map differs from v7 as several fields
> increased in size. Add support for PMIC arbiter version 8.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>   drivers/spmi/spmi-pmic-arb.c | 324 +++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 294 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 91581974ef84..612736973e4b 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2012-2015, 2017, 2021, The Linux Foundation. All rights reserved.
>    */
>   #include <linux/bitmap.h>
> +#include <linux/bitfield.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/interrupt.h>
> @@ -25,10 +26,12 @@
>   #define PMIC_ARB_VERSION_V3_MIN		0x30000000
>   #define PMIC_ARB_VERSION_V5_MIN		0x50000000
>   #define PMIC_ARB_VERSION_V7_MIN		0x70000000
> +#define PMIC_ARB_VERSION_V8_MIN		0x80000000
>   #define PMIC_ARB_INT_EN			0x0004
>   
>   #define PMIC_ARB_FEATURES		0x0004
>   #define PMIC_ARB_FEATURES_PERIPH_MASK	GENMASK(10, 0)
> +#define PMIC_ARB_FEATURES_V8_PERIPH_MASK	GENMASK(12, 0)
>   
>   #define PMIC_ARB_FEATURES1		0x0008
>   
> @@ -50,9 +53,10 @@
>   #define SPMI_MAPPING_BIT_IS_1_RESULT(X)	(((X) >> 0) & 0xFF)
>   
>   #define SPMI_MAPPING_TABLE_TREE_DEPTH	16	/* Maximum of 16-bits */
> -#define PMIC_ARB_MAX_PPID		BIT(12) /* PPID is 12bit */
> +#define PMIC_ARB_MAX_PPID		BIT(13)
>   #define PMIC_ARB_APID_VALID		BIT(15)
>   #define PMIC_ARB_CHAN_IS_IRQ_OWNER(reg)	((reg) & BIT(24))
> +#define PMIC_ARB_V8_CHAN_IS_IRQ_OWNER(reg)	((reg) & BIT(31))
>   #define INVALID_EE				0xFF
>   
>   /* Ownership Table */
> @@ -96,30 +100,33 @@ enum pmic_arb_channel {
>   	PMIC_ARB_CHANNEL_OBS,
>   };
>   
> -#define PMIC_ARB_MAX_BUSES		2
> +#define PMIC_ARB_MAX_BUSES		4

Why PMIC_ARB_MAX_BUSES is changed to 4 ?

Neil

<snip>


