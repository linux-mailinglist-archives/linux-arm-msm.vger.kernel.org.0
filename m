Return-Path: <linux-arm-msm+bounces-97868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHIhE8rGt2kRVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:00:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF50729693F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39655304C0A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E66337417D;
	Mon, 16 Mar 2026 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NVadpL2I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88D4382395
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651494; cv=none; b=GRFk0VylU4Sp6IehlP9q555wxzT6cZ6TxWMdSKRYV2l6P3SstbxXFh9qBW6hYsLTmr+FHJGIZzqFARfUYnKbMoQkFYifdseYrssn5qx5RGblQUtZUmW6E7BEbzJidPcbRfDQ8JM51F8gv/kKUkmQyfsdsSmWALDLzv4KeFgK/aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651494; c=relaxed/simple;
	bh=evEz+y4JrPqlRSu8gn5s0qDG6x8WORlkpCuin/XFkEE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KyrCO+6kx6QwUQLlK117pYmgwv8446TuYfl/uyri+X9OU5KhepUGutokeqY/x1I7MtkE/7BdkKL3Pf3AUKPgjUPWTPz4TXawS7BwkaqV++tE+ScJtjDo5Pha252/nOm4vAb5LjXnNkwBzHX5T+dnqEqXQk5kzM9IJAuxKiGRx08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NVadpL2I; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso4452123f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773651491; x=1774256291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnabGK1hfiwyRbECmu0T5fADyNaY9cT0yOGHssfRU88=;
        b=NVadpL2Ih4cHSG0+6B47wFqRKXaP/HaXV+oW2dya3NxZ0TycDgNQ9ch4zI8Q53ir66
         U4mHx4LGKnQsLvCw766lF4YygTClHC+5p71IqT3TMONTo+TB0AznBl3nAt9siP1sYSe3
         9pNW9t6d98MocYCexrqIbKmhOjDNxlu3gRvYuoBgCmqU0Cfw6YMDyEgrJqoc0TgPMbQt
         9t9ULSMq+RFAGHqraXx8t4ta4TERzMdHxjpj7j0mwV1LbJxWMfIy/B1c9CaZ/6mStF6Z
         px4P1LAPwKtpm2URMMqQj4HzUDvv+19KZ2oQSGeAIHY3vbF+fYdcserrWLTXXnONqGlB
         nWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651491; x=1774256291;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnabGK1hfiwyRbECmu0T5fADyNaY9cT0yOGHssfRU88=;
        b=tP5AQLzTNK5h08Gw0POZ1/g4nB/ZPbBto1JTFJALcZqvBSbQO5oZfAhrVnUY7Ikn5J
         /PyIZ+X0/t+ACzazgXJX5I+TY2m19onYZG2y6UAICFFOFOS/UL714ZJ7O7MoqgpuibYH
         2TunZag2a67To2Z0f52WdvJfZutVi9/Gem/mIXL22PI0CGO0g2bfTuTbLlwi/dmuBCpI
         IpEAdrR+60DDIf07V/ITyGeuvFQz44xviiGsWFJfi+m84KaMvuiBSIzdLWKwu7syUMlJ
         p8py7N84C7hMIyZM3zqQ9uHht31Qr/XonXCELd7B4EmqPMkik15S/OMtYP8PihTvREa1
         K0RA==
X-Forwarded-Encrypted: i=1; AJvYcCWdAPqZg2/dfladiTaIfGd41nYg1svoyNPbLbIJWRFipwTS7QBUnsRMmw6DitKfmp+C1QUeVsUm+VRR470I@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/IDDpZyynAAxmRD2Ad+b+Qc1DwJ5oucnQmxVGa465BhKtYDI
	TVpGQDs5jfR/kDG8gVk7hD2uWsj3/bxWcy/CSSUrmfWXCaoFrTQK2Lw7LF4r/LWe8fM=
X-Gm-Gg: ATEYQzzuw1oTuIyFu6EZa0AvqKOCF9Moy6F3Qdk1wVJVus+2yZNLSOHUODcHKiRNUH0
	6O77WUkig/Qhw92s5qT4pDvGuEHFG2Vj6MjOwTNEqgc0kitfXTa0bDTFa83RLdEx1BXYr583Qfh
	JjOarvCt+7JSb9Vl6zpoQrImZJPJDuSqmLGXGtd99OKZHu71Mqgp6gDyOhuhg3ppCuSrNKe/Vk9
	KF6ioj+A/VMBeLyekx2NsVTA4V2oGq+ExaAG/EGW/rZZRlGIZsrwoy123NvrOg74gr069Mkm3qN
	yyk701nkijV5HUCfAltdTIMuH6bXjE0a0+bAwcLFCkYbZzwcQiAlUOF2MTy0j+1Q5SvzhTNglBH
	4jNUkcaKMgOc275/wFLeiDopnj4MzjEh0s9TqfD6Bu/D1zcT776OaGXxmK1i/vbvR7cdrQtqU8L
	mAQIwZj1mPWxaSEiams6OMd0ycCF2Bqu3S8fybIXB9f18QjHnCCzNVTdVtW0AZ8WeF2YOFNVs+M
	ABPBNY=
X-Received: by 2002:a05:6000:1869:b0:43b:3f2d:7d42 with SMTP id ffacd0b85a97d-43b3f2d7f70mr7855926f8f.2.1773651491206;
        Mon, 16 Mar 2026 01:58:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:a12d:6e5e:e745:c5e8? ([2a01:e0a:106d:1080:a12d:6e5e:e745:c5e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b46b41e93sm2665646f8f.2.2026.03.16.01.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:58:10 -0700 (PDT)
Message-ID: <58a8ff00-4959-4ad5-9d6b-fcb54ee2819c@linaro.org>
Date: Mon, 16 Mar 2026 09:58:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: hamoa: Fix xo clock supply of
 platform SD host controller
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
 <20260314023715.357512-4-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20260314023715.357512-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-97868-lists,linux-arm-msm=lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[linaro.org:query timed out,0.134.242.224:query timed out,0.134.86.160:query timed out];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_EMAILBL_FAIL(0.00)[neil.armstrong.linaro.org:server fail,mmc.0.134.242.224:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.134.86.160:email,0.134.242.224:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: DF50729693F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 03:37, Vladimir Zapolskiy wrote:
> The expected frequency of SD host controller core supply clock is 19.2MHz,
> while RPMH_CXO_CLK clock frequency on SM8650 platform is 38.4MHz.
> 
> Apparently the overclocked supply clock could be good enough on some
> boards and even with the most of SD cards, however some low-end UHS-I
> SD cards in SDR104 mode of the host controller produce I/O errors in
> runtime, fortunately this problem is gone, if the "xo" clock frequency
> matches the expected 19.2MHz clock rate.
> 
> Fixes: ffb21c1e19b1 ("arm64: dts: qcom: x1e80100: Describe the SDHC controllers")
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a3a045732941..140c8f1237da 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -4714,7 +4714,7 @@ sdhc_2: mmc@8804000 {
>   
>   			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
>   				 <&gcc GCC_SDCC2_APPS_CLK>,
> -				 <&rpmhcc RPMH_CXO_CLK>;
> +				 <&bi_tcxo_div2>;
>   			clock-names = "iface", "core", "xo";
>   			iommus = <&apps_smmu 0x520 0>;
>   			qcom,dll-config = <0x0007642c>;
> @@ -4767,7 +4767,7 @@ sdhc_4: mmc@8844000 {
>   
>   			clocks = <&gcc GCC_SDCC4_AHB_CLK>,
>   				 <&gcc GCC_SDCC4_APPS_CLK>,
> -				 <&rpmhcc RPMH_CXO_CLK>;
> +				 <&bi_tcxo_div2>;
>   			clock-names = "iface", "core", "xo";
>   			iommus = <&apps_smmu 0x160 0>;
>   			qcom,dll-config = <0x0007642c>;

Since hamoa inherits the same xo scheme with a div/2 in rpmh,
it's coherent that it also needs xo/2 like 8550 & 8650.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

