Return-Path: <linux-arm-msm+bounces-97866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEslJNTFt2kkVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:56:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16151296863
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD0BA3013A94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65186299944;
	Mon, 16 Mar 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbKhPbEO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECFA382362
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651410; cv=none; b=N7/djiCox6ArT2pRtI1ZqSJlyyFfbtZXf04IHN2+idLWvBPlfVGmbjfssryjgoMcwHNmrMcMyKzX7E1AbwcuIhD0nCWrH4wS4h8yUhYE4WFsEfXI1SfIBL30x6MA30LKg1DuqG9pXfSJ2uwen0ORl2uOWCI3XMw1gTlk0asKDos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651410; c=relaxed/simple;
	bh=1EIjOKc2OW1zkdXZ15YWCCQCUuWOz68Gp7wgEbwM7aU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=snRhbe71tM+aA1Ocqm8DEYuET3ZmwFcZSnjt/juMbWOaO8cpwdkpGmjNtAGU4wzd2ZixsqNRYiVUCxj9jziW9dx7ZauSfm2hzHpNSBNBcQL3ayIBZQr+X+XdZH95V5kQkP6GTjJkITDPAm1ZGG6qUCCoi9P9LlCcpn+C24L7Bns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbKhPbEO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so4306387f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773651407; x=1774256207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2zPE56S0s9LowxpmhQH3unI30GvsJyHBqtJOEutRtE=;
        b=rbKhPbEOAo5H7KYi3i0j6TTIgzKnQNzxkOo21MhpXsqDEIziIYvAjaNvcjoJq/RMar
         gfpYMu0j8YRLl+jeuSuVs2WJzuEZYqB+qTksQk3klNhNIp6LEGnez37Mte+Rv2w4chLp
         jfBSPupJw0/7SkifciB1CPXRZ/T/Ov9ytk7pLcNjH7j8syuae+GNurf8dQ7kl/QR0aB2
         WT8cR2iSR2gTGz13VO+2kZKyz4ZmhH2RCe0J0H1itSvdD/X7LPxRa2cjWP0f86YFzSTs
         2M6vfavlFeZ1f1X8kBYfjIv23mL6G0l3hcvVyagdT6OiQGFIuOC9L1EEgoq0BWkCXmfW
         pSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651407; x=1774256207;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2zPE56S0s9LowxpmhQH3unI30GvsJyHBqtJOEutRtE=;
        b=fjBIcki5dt0w77OOD9OaQEl6puNofk/Jv3TucZpSgb/y8oc6PYQy+3QZWmbM9Zs8R3
         Toa6+YKvn+elma+N2TD8KMhgr4b4s7u+L6H50ZywV52Vx7yP5sxhlSZQiQSp7GnqslVg
         0qCq3htG0FiSDgG5iiGLt7wMDqZa+vk9E1oxhGry5Gf1LsA8D3qbDWD/IcRWf1Zk4bdf
         giq0wU85dBL0ZKllvGATLEppglhhGh3tV8tgGV07rgyw5h8YvCJNe0SFRHz1g8PZqRvc
         M7UUtJynmA/02JVEXMRKLbZWjWVl0ywgDgRGpQOzKQmHL9YE/Hi7FmPRgCpgtc4E5NeA
         MQVw==
X-Forwarded-Encrypted: i=1; AJvYcCUMM0UHszL6c+hUGI+A64F2gKLFltZtn6JUa81s+mB7HIfU1bGxRErARRdPi6CoyW/kkzpOp7MBwjhNvTMy@vger.kernel.org
X-Gm-Message-State: AOJu0YzCkd6dBKk9+wnnxIrGDK3qQTbaaVjYcax33SwZsKtDM/nuaHeN
	1sCosP8C1uUc6WzmIEqr3FH3WtkDPX42vWdfZI4ro4gC1h/L3gRndlqBTv/ccfLZZTgBG/aDaPg
	dNux3LWQ=
X-Gm-Gg: ATEYQzxi2PqhpnxOEPTn5M1zTu4ShOaD0IRSxUWmPL1/elW0hgGewPyyLV+2ZdMhg7N
	8FbBJ5LNhHK8zhJLuMGY/ICJVoVU090oHaA6kJBGBlQ06lEaVY2gblDkOAJ76Sn0WigjLGOatW0
	6tB1vbhOBcbfPBuUDch7lwOjMupL0+jVoqVmkHUFEOOjkMUMxRmpZnr/oikbHwdS/xFpnT2zTxl
	T6YMn4wsJ//DiVrr4ZYfRZx3SvqVgHu62nIsXeGp1c1MQNtZ0C9NS0QHhoIkWrrkYTVknLhTB4D
	LxpzkD/9MSh3YVWVr5JeZVW4g0MATgvS8KEtqMS7nXIaKfM0gYfXA1tiz1dDdLabkxN4FEzuoIr
	ScOPtpBxDa1nu5gJeZbU4PGPbnu0VYT4C5/7w9KETkEbPTRncLf1WB5Cl3zmbzSn6iGaf699o5H
	yfHtutHnEuZ9miyxoqmEIqhUe1fgmDGCntU27Jq73z+yTJg5inAD3ZcRLnRu/XpV90GMbR0zJWs
	CB8WTM3qBkDGJ42Hw==
X-Received: by 2002:a05:6000:2f87:b0:439:fdd5:10b5 with SMTP id ffacd0b85a97d-43a04dbed92mr22185759f8f.39.1773651407354;
        Mon, 16 Mar 2026 01:56:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:a12d:6e5e:e745:c5e8? ([2a01:e0a:106d:1080:a12d:6e5e:e745:c5e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2845872f8f.12.2026.03.16.01.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:56:45 -0700 (PDT)
Message-ID: <efd3ba96-db32-4e3d-83ef-0047079b3651@linaro.org>
Date: Mon, 16 Mar 2026 09:56:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sm8550: Fix xo clock supply of
 platform SD host controller
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
 <20260314023715.357512-2-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20260314023715.357512-2-vladimir.zapolskiy@linaro.org>
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
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97866-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.134.86.160:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 16151296863
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
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e3f93f4f412d..03672df25eeb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3210,7 +3210,7 @@ sdhc_2: mmc@8804000 {
>   
>   			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
>   				 <&gcc GCC_SDCC2_APPS_CLK>,
> -				 <&rpmhcc RPMH_CXO_CLK>;
> +				 <&bi_tcxo_div2>;
>   			clock-names = "iface", "core", "xo";
>   			iommus = <&apps_smmu 0x540 0>;
>   			qcom,dll-config = <0x0007642c>;

Thanks, I confirm the sdhc block is feed with the xo/2.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

