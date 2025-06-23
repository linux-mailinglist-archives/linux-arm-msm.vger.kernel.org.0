Return-Path: <linux-arm-msm+bounces-61992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC1AE3595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 08:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4C4816DFA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 06:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764C51E130F;
	Mon, 23 Jun 2025 06:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9ZRlXqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5851D3C30
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750659668; cv=none; b=HAwtjzcgUlmERbA8SLQpnCAn/wBZRf2rpZXvJ+Zqn+FbsW/3/LJGfSk/Q5FjVcFDf8+rMzjkRXojjfpZovevINg17wMArYAAiCq99J69gVn14CGD189KSHzBhV/pRY1P+OJwpWe7+zC5oqkk5NT970PPYBXW6u7tjTsq0EwIWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750659668; c=relaxed/simple;
	bh=DgIcFFx5Zy0ebN43YQFG+rfzyV3VHdBw8geFFhhE7o4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K5KoBG78oDWBXPUAwyOr7lsWKRoEIx00D/Sx6GXRfbNEewkyNBvUYrtC8g5mrYLURCPIe45kbiNmr1NOGWChd/H/fWRf5d0I7SO/yocc6q86HWtg3bg9LVmZ7xU6AvjwP6RruVLPjk68HUVz1sdvWPjWWHe2U1Uc2yfZ0aY7uHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9ZRlXqR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a36748920cso2896613f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 23:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750659662; x=1751264462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PU7TNhyENMZb7ONfPQmGsoiyVicY8JSe279Y/TzDAqE=;
        b=P9ZRlXqREi4bB20RFYLAvwANiWmlh6YSAXN3OzKk1cqpVlxM6I/gL+DEN0FZwiOrXe
         D9/6ZDgOVvxrebIggaAgqVvJg7L5AhfDH2kwaMekT/R+9s3vANEWP3ksB6U9mZPXOp61
         HGo1Kw6yDZLKoHblqa8cXqdZ2mYMd2oGYLt34N7lQcgNf6daVKCTk1wq3VLXyMSnlag6
         LzrNtno1BVv3MTmRUWo5KPd1tISuJqfQrQCn90PNKXy/LPaoP79Kpx0MLPY4lpC+MXQo
         NbjVxcUn1MKmUQ0mFhlKv7jo7ZZRfHdTDbxINOt10ReGXJTqpRnv9ssriCjO7LeWc6g9
         ckSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750659662; x=1751264462;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PU7TNhyENMZb7ONfPQmGsoiyVicY8JSe279Y/TzDAqE=;
        b=KgkvZN/ZtxB0LyJe7/YK5OTfbCooH2/F6aQZFJgxowsNh1JkwpkjjYFGLs36J+F7gU
         ahV5Br1g5H9cRD/zWNyh3AasLCzdaF9jBEjeRhny9fA9TTgGHO2XG72ov4i7tFCRmpsj
         RMXHfbZC6U5wKya3bS8aKeDC/af21yQ5SImaS8Y38o7ri3buJznA9ekZVIW1q3ZVyWB+
         UCffu3wzyofCGZ9Vv3W+4TB3Ijr5RbTWah6gL8oRdjyYJsV7v48r/W1MM421AyBkb7ZT
         ADVeTO8AgD5QxfMOudUBfoia3ILD89ccWcIosB9NWd5BBBBkLS/W+hG2iT29+BOMBzmJ
         XLrA==
X-Gm-Message-State: AOJu0Yz1Sfz3YVe3yKrsJTvFRyuVTioRHYpRvHHG8Gcaws5QDuUyCRT7
	wLuwIJD47ezQZugwTpIODeERmby3ljqyBGlv7p4D/xQ3j+TuYrxSlKyfdOM6I1nulvKhOS6bPce
	r/f+wxo0=
X-Gm-Gg: ASbGncuXKUOaVD9CZNVoIYf26DJuAlYD6b5BfbD4iaRwGGsQOVyPZ0uAgcO08OsK4ay
	WiYcPc0kOnWJTexoLT50342Mk4Cj6oJ1++gn15aUWW4zwzMC6/AQj2h/yuf+F7N3UhU1HFSbayb
	XpZsCldHl/r1L5YU+Ov1+Y8cC+cn7d2XuTGeKJ9w1QCaqAEMuPUER4Woh5Au/d1C7q1/Nxqj0o5
	bU6UDMwlu8z9foUp50RlUuiFuVHPrJPkxyh7v8Qtnht2rwXkUcRYYkkpQjyliyLU3cUA7I1nEDm
	4VPlmaRC5sxn2Au9ogFtfeXtNsskaHAO2qep+b71EJSP8QeHPzzskm3s2zcZdPT0ewl0WNhrf3S
	fd8EBUvHnUXZqLX+IXr+wYwWALJ7P6cx+0NiIUuc=
X-Google-Smtp-Source: AGHT+IEoD0I/MODt36l2xC6utkVqh5dE8YDeYtwr14jrvCJbhfCfD8cqpddkVlVOrMFwLVNxPDy9Wg==
X-Received: by 2002:a05:6000:2d11:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3a6d130707cmr5274325f8f.32.1750659661628;
        Sun, 22 Jun 2025 23:21:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d? ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844c3sm133674355e9.11.2025.06.22.23.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 23:21:01 -0700 (PDT)
Message-ID: <84868edc-87fd-44ff-949f-60191f9bee35@linaro.org>
Date: Mon, 23 Jun 2025 08:21:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Add RSC version 4 support
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-rsc_v4-v1-1-275b27bc5e3c@oss.qualcomm.com>
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
In-Reply-To: <20250623-rsc_v4-v1-1-275b27bc5e3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/06/2025 07:49, Maulik Shah wrote:
> Register offsets for v3 and v4 versions are backward compatible. Assign v3
> offsets for v4 and all higher versions to avoid end up using v2 offsets.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>   drivers/soc/qcom/rpmh-rsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index cb82e887b51d4401edba713348eed9621622b73b..fdab2b1067dbb13efbbef5cc3ef795a65fc2d6a1 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -1072,7 +1072,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>   	drv->ver.minor = rsc_id & (MINOR_VER_MASK << MINOR_VER_SHIFT);
>   	drv->ver.minor >>= MINOR_VER_SHIFT;
>   
> -	if (drv->ver.major == 3)
> +	if (drv->ver.major >= 3)
>   		drv->regs = rpmh_rsc_reg_offset_ver_3_0;
>   	else
>   		drv->regs = rpmh_rsc_reg_offset_ver_2_7;
> 
> ---
> base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
> change-id: 20250623-rsc_v4-ec10a1aadbb8
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

