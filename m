Return-Path: <linux-arm-msm+bounces-58458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6FAABBF24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 15:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 280D93ADDA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B480027A112;
	Mon, 19 May 2025 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ddplbHC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D32279906
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661406; cv=none; b=axbY9jvauFGVOABLg/O7tUYQigW79exJUkC4VyscLQftZZmy5V+plurkPrxThe3UAihx9zVAOKVPxNKfstOuZnIxczkSabbLfF7hYbLutBGwfAAtQSddZOACbOzTLfqP66pmxoIVtD5h/iqNaTxs9VQJsJdVR9YiycHY6TRzqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661406; c=relaxed/simple;
	bh=ceoocduNlo16bShRSxr/bYEvB6DSdiuerrL0JPRXSZQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z+Qt766vSNAV97j7CI7cDpgVBNxfOnMXqiywuMKaQw3sHgHj0nnuCVoAUQz+P2v/oqnoVDRpJDiTnixWSk2IYJNTKjBofUyULCa9GiwcupWO9zkqeNkHQaoYx5sfl1Pc5zxCcpC1DruIjjObEzlAQgtyFtliMtKw0CUWZHER6n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ddplbHC8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso29426005e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747661402; x=1748266202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDBNlQ3g6oC2KKNqaV/PvSTd0uwtCUXu465+xGLQdN8=;
        b=ddplbHC8dawZY+lqgmoo04W0T15X1fbiqizQtDbLLU/iJ2uqq+HRfULyLJBjs4Vdo8
         KkBeSp036Sl+7YUGPO25jRmMd+Zm7rVeGMfavWj/1r9jL6e+ZyLH1yQbtxiDm1oug3+Q
         zIH4x4a6Q6WH5Wkv7n8VxRhriOtUl1mQOBUzt1cWQZirGXZx4523hLOjcsi2lOda1fEL
         0SUmenTy9vz58mg/XVzC1U5FcY7Jk0whh5OefVEyDCymjUCuZxUXpotspMOIpeKBcuYP
         3OAmJX0+feMcdMpcKPIgUslOLjo+XLcgue1zJPg7LL63Ku5jhXmwEdbWFaxw0FQK4ZXu
         JpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661402; x=1748266202;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mDBNlQ3g6oC2KKNqaV/PvSTd0uwtCUXu465+xGLQdN8=;
        b=WZ70ztdISyIi15ISZPAtWL6n+nsPJc7GkUguvMP3IGqDyjZLKin8ilnandCv5JQxkR
         QcZg89r/88KYH9YeLeg2IOIcdW9UvUMeqmQ5VYLYaYGvdfT+VKTMDbuR6y9mVAkX4dzA
         worQ7UUYmqHj1mleXwkH7WcwsJAssFuIs69KGZB0ZQ7OlSrv6NrhBEl5kamBrC13rVCR
         2b1KbngfXcieBDyuch/EBfp5oTwRjZUXoTrMwWT5y/NbDE3iutceZUS9dC8rvfuzQZxE
         QK5SlFnL9bhUWCllwIQNbpiCQYE5DCXaLf0W5nmXFcH/V4f7U9wdtrV99pTKZrSGy4k2
         LvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYXeM9KWUJeXZCOD1Dvtlgnzh26Oo3BNdSrk3SyKu4fgtsvCQwYNFg20AbqAhmvszpcVWygwMTcE/YFpFi@vger.kernel.org
X-Gm-Message-State: AOJu0YwNfwM9IhMpUlwSlNTcXScaAMxrjgdiHWm+u3oKsx2zt6xlvY2C
	TduHO4cSghas+ucggsa9do6VUO0clTiG+LyeNo4QlETD7i5UkoHyMXh1C1OrnuLrZU8=
X-Gm-Gg: ASbGnctMHa0VgEMGrgrRZzalRRvcdcLh6DHfUNPOCHvW+2S2e284UUdKjHmtYz1iFcU
	suD41jf1aS5UvWU7473ysllItwQNlHwpVQAkHp2za2J/Njqjt4xZzpHDyZp0y+kA9+CG5Kf4AWr
	0Yf5JwKNAQUcQL6qJJ3AdzfaI3gSmjXsAYI3dn5posOqkdmq4z6m1ZRdHkRkXTJHZusOooyaciI
	apf34YxvA/v+aQuEt1I0ntWdusESM3SVLO1IyThDzu5Qyjjp+vtFNem4SYWgw/8ipqhwsOrIjyE
	PdaEq04LfNdAdaizeo/WbRGF9HoaCycpjxpk3uLxQCammuZv08Puu2YmfcNFTv1SE+6KLu446wf
	ShHRJ3KkFME1WZ2v/hnddNT41mygn
X-Google-Smtp-Source: AGHT+IEZZaVnqBZzCTNrAs0XlbgmkZpK+jBXgRrvy+8bDHfECKm5po9fM93yC+ioRRyCDCBRZdM+5g==
X-Received: by 2002:a05:600c:3b94:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-442fd60ce91mr110613535e9.7.1747661402047;
        Mon, 19 May 2025 06:30:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18? ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5beccsm13020104f8f.36.2025.05.19.06.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:30:01 -0700 (PDT)
Message-ID: <2328c351-1bd8-4ce8-afe5-a6df675a2738@linaro.org>
Date: Mon, 19 May 2025 15:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] interconnect: qcom: sm8650: enable QoS configuration
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: djakov@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250407-topic-sm8650-upstream-icc-qos-v1-1-93b33f99a455@linaro.org>
 <20250519082305.81258-1-mitltlatltl@gmail.com>
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
In-Reply-To: <20250519082305.81258-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 10:23, Pengyu Luo wrote:
> On Mon, 07 Apr 2025 17:16:47 +0200 Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> Enable QoS configuration for master ports with predefined values
>> for priority and urgency forwarding.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> [...]
> 
>> +static const struct regmap_config icc_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.fast_io = true,
>> +};
> 
> [...]
> 
>>   static const struct qcom_icc_desc sm8650_mc_virt = {
>> +	.config = &icc_regmap_config,
>>   	.nodes = mc_virt_nodes,
>>   	.num_nodes = ARRAY_SIZE(mc_virt_nodes),
>>   	.bcms = mc_virt_bcms,
> 
> Hi, Neil. It seems that the config for clk_virt, mc_virt is not working
> on some devices. My device Oneplus Pad 2(pineappleP variant, mtp based,
> but without modem) shown the following.
> 
> Apr 30 01:56:16 oneplus-caihong kernel: qnoc-sm8650 interconnect-0: error -EINVAL: invalid resource (null)
> Apr 30 01:56:16 oneplus-caihong kernel: qnoc-sm8650 interconnect-1: error -EINVAL: invalid resource (null)

Right, those doesn't have registers, let me check

Thanks,
Neil

> 
> Best wishes,
> Pengyu


