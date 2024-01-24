Return-Path: <linux-arm-msm+bounces-8145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBD683AEE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 17:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4E70287FDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EEE7E772;
	Wed, 24 Jan 2024 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uhfsk2sx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714A7823BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115409; cv=none; b=ojXbZwPKlyZcMEcpWGBWWRpIoMfNHJHOh9gtv0Xp/PyX4M1W+eivr5HG1G5kfhzSpkKiTV87RRwY07nGJFoJuqjELD8IjUSs6v0VeBJR6jvDd7LAhCqe4h8WX9kK8xyUzke4DPk+Yalugn5zratNbJZaokrxZfRDNwpv8iH32Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115409; c=relaxed/simple;
	bh=7DtMbw8R/RTGGwz8VPBp7rkT6a9VmHbqT3Nu49oKlSA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AMWUbhmYrmWNrtMUHniF3NkUsSlpomwOL7RlhuwRZ66lIXn2upY+qxWYjz8PpVSQvEOhY79UCzM30iaQ5FGHpWrr71HsEQLvT1MslcvNVOO9ADXufoi3gSo1YML8dvR1wwdl5Eoi73XXeu4/XkovMYlzmgUazvSFhb+80SoGTQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uhfsk2sx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e490c2115so41508865e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 08:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706115405; x=1706720205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NFV4jdULG1OTsCLoq1bvIzj8nMbrxNVWLnFh+iXbUk=;
        b=uhfsk2sxlx8cU6lApCjaebbIAZgFOYNV4dje+yag5HqcgiBsu5BR03YWZpph7tM6Fq
         hiQEAw6Px4+LedmzMd9DUytEN4MCVxOXQEqu9IDKfaNuyJ4DInQWlfW5H9eysAvhECL0
         E7hlsWffziftMZcjcEuNalhQPzarZxHGSf3fIlbLP/ZyNCW9rE00mNnPwsunu1PRguPH
         NTp6XvEqljNqDx9RzWiFEdNyComjz5mBvNUdi9xNeOYreVMElBxo4h6sHqc+Ij0VB2EF
         tLVWrHz9MWlMEVfpj4Ust5NkUwbiUnwYkczooWVZz0fovqQQL8j1khGDmPu47/01CShU
         pLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706115405; x=1706720205;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+NFV4jdULG1OTsCLoq1bvIzj8nMbrxNVWLnFh+iXbUk=;
        b=oIFavGxO5yio5+29+9Ax4Xi2wia94WVWnf37PAOy3TEf7TJH3EjiiYaAuSyIxmoavU
         op4Y0/w/zoQnAlYahRBxr+BdHKMqHvK/vbwKqpxI3gaiXQC0RWyqTlQSjepIiJTMeLMK
         s2e5at9Zco8DJy4zRnURHzLihYM1ThnHTLlB/L5nWtdLDD7PnwsfhAYTdDNosLJ/GJhm
         KinQxL1V6oXSiKeXyEor547OTegA7u/43fIMZh2phHD5BTKqOgu0HLZkQtE4rKITE0qO
         IXq4WW8CBS3CwffczhLoOvtHKWLFKaweCSsKFL7QWnyDRBMJThPiNfb13Mb7Gp5EXyR0
         Wd5Q==
X-Gm-Message-State: AOJu0YwZJaCBPmMGXHwQuC0452vIZ5NFaZbonP6YVM0puMHr63U6h0Sh
	1MXVz8pd550zRO6TC2VcV057PZPSj3p4jL9sbsna80N+zH08Ht56xcHWpHYzrq0=
X-Google-Smtp-Source: AGHT+IE5ZwsSoOTIkUYRVRb+W5kbdRWetCuozPXiEAkOkU5OJ4DlCGPr8+mOTboe9c6+xNWRtK+09w==
X-Received: by 2002:a05:600c:4fcf:b0:40e:c63d:7514 with SMTP id o15-20020a05600c4fcf00b0040ec63d7514mr741743wmq.38.1706115405625;
        Wed, 24 Jan 2024 08:56:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654? ([2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b0040e559e0ba7sm227140wms.26.2024.01.24.08.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 08:56:45 -0800 (PST)
Message-ID: <e20b2752-c874-4deb-b7c7-a890817cb861@linaro.org>
Date: Wed, 24 Jan 2024 17:56:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8550-mtp: correct WCD9385 TX port
 mapping
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240124164505.293202-1-krzysztof.kozlowski@linaro.org>
 <20240124164505.293202-2-krzysztof.kozlowski@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240124164505.293202-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/01/2024 17:45, Krzysztof Kozlowski wrote:
> WCD9385 audio codec TX port mapping was copied form HDK8450, but in fact
> it is offset by one.  Correct it to fix recording via analogue
> microphones.
> 
> The change is based on QRD8550 and should be correct here as well, but
> was not tested on MTP8550.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: a541667c86a9 ("arm64: dts: qcom: sm8550-mtp: add WCD9385 audio-codec")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index c2847fd3c209..393702fe61aa 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -745,7 +745,7 @@ &swr2 {
>   	wcd_tx: codec@0,3 {
>   		compatible = "sdw20217010d00";
>   		reg = <0 3>;
> -		qcom,tx-port-mapping = <1 1 2 3>;
> +		qcom,tx-port-mapping = <2 2 3 4>;
>   	};
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

