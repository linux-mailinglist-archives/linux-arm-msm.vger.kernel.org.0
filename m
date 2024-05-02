Return-Path: <linux-arm-msm+bounces-19114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EDB8B9617
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 10:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BB75281FC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 08:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC46286BD;
	Thu,  2 May 2024 08:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYjmvcU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BECC1527AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 May 2024 08:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714637039; cv=none; b=Rfan7tkpzPzrlCH4hztBlQKrwnwNwGH+iN0nb2NI0TSBiVa6xIPFhrxi5ZDuvI8uBfJ11JvL/+3/WjELZ9BPJiFIMUJob8LWeP/zR8yu/xmDycNVDlXD+RH2gqamITu0ZWNLlq0PppWmh/c1M1/+IwZhE8tUSrq271ff6CaEjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714637039; c=relaxed/simple;
	bh=rQki84V1gQpoxsgNctlLi+u35Jm2zqm5hEZyXmkoUso=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZgIf6f09OSzC8sd4bjTbiZwBc8t2Dm87U4XC4j3zrY+t2DQu2XsWQ/bGRq0oHcq6bSkBDROOHnRjXjXwDdMzPVfcVqLBdRtZGPI4UqTxyHXhpZ+3yQ9NgApS+5Lv7y09yvhjpN1t1UpRi9EuV/oe6qxMGqqXaRJggSepdokn2Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYjmvcU+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41b782405d5so65257905e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2024 01:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714637036; x=1715241836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyNbWUH2AJeq8x5xkAz8AZWn5WUNTsAjnfRWU12OotY=;
        b=VYjmvcU+02gdejE563TgPqJilid3Oa/n3iToXvFphTTbIIw5rR8lXGvcotoHkuGVol
         YSZx801dxsctSVHpHrXylzRhr+e28DhV6XlL3MiUTt8jteXigwW4qJ/zPS+8SPpKgpw2
         4Ibl1LcOEtcjMVBG5Tyed1l6eJ5SlXHKoxdQxZZE2MdQmz4Lei1W8fbZdBHwvNY+tvRh
         l/gmYH7Y/d/ZCvZitBwar7CTxHf9Fm21TpDO9mbxkVT/5wrlmGfpXPSN6OjU2l/cVN9b
         CM4H8egjFvnFTvgtMvttKWLnyT+7veTPwmWM3bOix9sLfEwjg7NYlQuoJTbYIB7xt/TF
         hLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714637036; x=1715241836;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xyNbWUH2AJeq8x5xkAz8AZWn5WUNTsAjnfRWU12OotY=;
        b=SjYD5zQf1/UpjrMfa3Zhb/5piJhOKg8L2CH9rmEWy8e6Arsa5H3TTW2g8v8K6P/8+B
         ozozDjxLGzq5MP7WFfYOSGv2CqkTgA+s1ZMJpYU95GBujjmXtjzRudJz74lemy+d0/qn
         wcjZrKjcHfV3RYlLFlk68FeRvK+Y5N/uvZfavMOZyVLc5pOXWTzUYkasZz77SxeIB/zG
         6amOtwFHOzJCznGnIU6BXB8RBGvG1v74uPB+E4doyXWFblFEFX2i63Dn6F4UL5SWjbJG
         WEXTcDKE2IxkCbBxxz2IrZ4h8uEEUmXZN7xcoYorqi3dgCmG1jq39SG+0t7lDKsBm698
         sJvw==
X-Gm-Message-State: AOJu0Yzw1/Q7t7NQfI35YPqu2NJuUgxxasvFcQjOZwxz9OWMYUGVlv7m
	FWPwQPGazkGVPH+r5m3O2vjtPawSnLd4/7RlT4sIUH+tElabHTbk2yA6yyVUkMk=
X-Google-Smtp-Source: AGHT+IEQcWkhWeusdWhjO9GSKwVQwq55n2Nz9CSKWdte2v9mj2LVlIVSwZk91kA0p23BmNfbY1FXow==
X-Received: by 2002:a05:600c:3b93:b0:41a:6edd:6c1d with SMTP id n19-20020a05600c3b9300b0041a6edd6c1dmr4235253wms.32.1714637036265;
        Thu, 02 May 2024 01:03:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129? ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b004190d7126c0sm4791899wmf.38.2024.05.02.01.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 01:03:55 -0700 (PDT)
Message-ID: <11d004cd-2e6d-4d9e-84e2-7b2da08036fc@linaro.org>
Date: Thu, 2 May 2024 10:03:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
To: Connor Abbott <cwabbott0@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jun Nie <jun.nie@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
 <20240430-a750-raytracing-v3-1-7f57c5ac082d@gmail.com>
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
In-Reply-To: <20240430-a750-raytracing-v3-1-7f57c5ac082d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 12:43, Connor Abbott wrote:
> This is doubled compared to previous GPUs. We can't access the new
> SW_FUSE_VALUE register without this.
> 
> Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 658ad2b41c5a..78b8944eaab2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2607,7 +2607,7 @@ tcsr: clock-controller@1fc0000 {
>   		gpu: gpu@3d00000 {
>   			compatible = "qcom,adreno-43051401", "qcom,adreno";
>   			reg = <0x0 0x03d00000 0x0 0x40000>,
> -			      <0x0 0x03d9e000 0x0 0x1000>,
> +			      <0x0 0x03d9e000 0x0 0x2000>,
>   			      <0x0 0x03d61000 0x0 0x800>;
>   			reg-names = "kgsl_3d0_reg_memory",
>   				    "cx_mem",
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

