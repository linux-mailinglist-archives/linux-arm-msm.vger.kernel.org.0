Return-Path: <linux-arm-msm+bounces-43613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2E09FE4F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 10:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4AB93A1A41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 09:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD391A2564;
	Mon, 30 Dec 2024 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tsvCu2i0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6944D1A256E
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735551770; cv=none; b=KpuEA3aPVeDMYNoh//wTDGfTtxC19C0yom/uJ3vPQ27HftqH55/WgtGinhn8zwxyVTUEQNEPt67/abMp7jQI6vs+U8PBkaPWc1hp4HOIno3iL8u8B077BsJPnyAdPZeeN2tQOttvM//ObwtZSLVPTwL42jbjNmuvTzOwlPrgEvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735551770; c=relaxed/simple;
	bh=TYw5/8pt4THh3BFTurLzjjHnZD60iZd26cq1X0rOU0Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fBCVYMjbmHkA63zIQH+YodqRvxWyMDSMjdq2Q8Vnx9DOZveRMEVpfiz4XwI2vmTpX33KUzAn+/JDnpXsYHWteTBScl00ziOht07T80uOiPxIPUcntEuSLgmJwi2IzJFo/8ehV1BUT0TnTRTtuA6CINEvSW1C5FCH5rIqlGZOCEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tsvCu2i0; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385de59c1a0so5495311f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 01:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735551767; x=1736156567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMwQvIGyVkCUyV/IpsYbuvCQSMiHiTDiiE+Z7EPnTw0=;
        b=tsvCu2i0YiPPUmW1PyYj1d+hXkXf/CGCc1aDiA88DlLVHN8XsET0IuKPH1KsGZn6T+
         ObM7FjGhU1P2CfO5yV1ns5iw5eSu5sug4b1TG9NoL7yQzyDN2vz0XdmYGX1FVIhKrzBh
         +dKxzaN5OBDatAm5VyQX4T5L5i06fgBfbY0z8YMxJY92eAqczLwmN5Kv/7IzoUtevqhf
         bMq0s0Obe7Uq5w0vrQPrNLkBVFpkNaN9sG9ca6uOs1UobmdI3dRlDlJzqTa1tpZJs3o5
         BQaDLmapB3vj5vcAcx1ts40RogqzRwrZQclZrsdOfPQVSzlRpXDruBLb9QfSbYPkjg61
         YG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735551767; x=1736156567;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KMwQvIGyVkCUyV/IpsYbuvCQSMiHiTDiiE+Z7EPnTw0=;
        b=g7AGkapM4aH2dXk6TRUZ3OlSbIgDuI3LME5NL+yD78XI/+j2oUV1pxXBmiAYp+r5rR
         hriQRMHnhhvaDhn6F9rLtlUpntE1gh99OverZkyY1lxP8UqmlOCazSJ6p1OPxupv4M/t
         8aG0UQALC/h6LPJh6dCqQaxDzVtf+1unQjpPgW3SMlT5IG/EUGttzucKP1ZLaVveEWoG
         kSbmpx6pX9xHbGsl04FgCZ8DkMo48XW8447DGxOoVzCdL70I4xxGZxxGGL8+p+cN+Mzs
         h1vzXrM6aWl2mtd8eY/9+RPrk5meBaUS4zMCqFwFlmVuZbh2Nz+UjQ0VrKBXbq1wg72p
         coQw==
X-Forwarded-Encrypted: i=1; AJvYcCWBhcU0KAWjUm9Fym4Rl/ewZNkbu/BzDSWfmf6VujKp+DCnkjNkCMzMr9YWCzDBxeBlRI8z/aZ3HlreUIHh@vger.kernel.org
X-Gm-Message-State: AOJu0YxE5taYjA8JIdx6HS+ZHFNWwvtMk0yFx2HTLJKBbseaWDgM2eV5
	WAhAGsvO/qZcWQsKwowxElf7H5zHYkVUl3jWvmi4tl3AgDc2DIb8J/gE5bFTf30=
X-Gm-Gg: ASbGncunjE28k2jRbHogSiatH5J8nnv8orFbZb2s6eBqjUQDVAZLcahaIj6ltaWGhop
	KXLqM0R4xJ3kOcXBXrSUf4r2mGtHtCM0NYOHsWS7ggqVPFeyRcLTnp9nMl+xKiEhhlOoN1JTIcN
	p3Hr/J4+Enxh4tojLIbb7nYFEbGmZQFDs5uP86p32OV5+8C9XDLF7O9p3AvdYGXZ84stOkDr9ww
	NtzdMwycLAs87YIIG6jIZuJVTkEo9S4B2QRISLMvTrGDIgyrULEWw3I3q0rRa1mnoF5Ct+yQbQr
	FjXunsVFffcO8oEETwGRMww5oRlrT1H04g==
X-Google-Smtp-Source: AGHT+IGPIXYF0sevQ5D8W2iWMvwqdjetefwVRPrdv5IQdeYecck/HKi8ZIZb2Ho7ItZHOXvkJNA7aw==
X-Received: by 2002:a5d:5e09:0:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a223fc3d0mr34907681f8f.48.1735551766740;
        Mon, 30 Dec 2024 01:42:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:883b:3c16:2465:ad55? ([2a01:e0a:982:cbb0:883b:3c16:2465:ad55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm385758175e9.38.2024.12.30.01.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 01:42:46 -0800 (PST)
Message-ID: <77649497-8b78-48ba-9a30-64485b6ddb07@linaro.org>
Date: Mon, 30 Dec 2024 10:42:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: correct MDSS
 interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 stable@kernel.org
References: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
 <20241026-fix-sm8x50-mdp-icc-v2-2-fd8ddf755acc@linaro.org>
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
In-Reply-To: <20241026-fix-sm8x50-mdp-icc-v2-2-fd8ddf755acc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2024 19:59, Dmitry Baryshkov wrote:
> SM8650 lists two interconnects for the display subsystem, mdp0-mem
> (between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
> The second interconnect is a misuse. mdpN-mem paths should be used for
> several outboud MDP interconnects rather than the path between LLCC and
> memory. This kind of misuse can result in bandwidth underflows, possibly
> degrading picture quality as the required memory bandwidth is divided
> between all mdpN-mem paths (and LLCC-EBI should not be a part of such
> division).
> 
> Drop the second path and use direct MDP-EBI path for mdp0-mem until we
> support separate MDP-LLCC and LLCC-EBI paths.
> 
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Cc: stable@kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 173e092b15e2..4b54063c0e0c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3455,11 +3455,8 @@ mdss: display-subsystem@ae00000 {
>   			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
>   
>   			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
> -					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
> -					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
>   					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> -			interconnect-names = "mdp0-mem",
> -					     "mdp1-mem";
> +			interconnect-names = "mdp0-mem";
>   
>   			power-domains = <&dispcc MDSS_GDSC>;
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

