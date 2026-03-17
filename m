Return-Path: <linux-arm-msm+bounces-98218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGPsOERxuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:20:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5E12ACE78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AAF413046D98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6FF3EB7FC;
	Tue, 17 Mar 2026 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKgQwR2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE653EB7F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760077; cv=none; b=X+b6J2tHR44Tck8o3W35gRILxOJ3a4NAmzCL3DU+bmxC57fj55GufgEobg84EiUREfXXmygM8guXZj2QDfzlfhYtdHShNREAliKIUL2OQidNjTgSRvGs+rH/+NGcYeny4cU0rShh/XDhiBDYQiAYTPXPlMuoMeHx4/Y5rEBDjLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760077; c=relaxed/simple;
	bh=5axsyuQX6kSpAO9yE6C9Xr9Tpol43U4sj/pTNBFqWuU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=glozxsy5UAVSBMQ8msd8kBshLD3OADjYkx7ZnbzLiqhbskEtVpmR3Gpj71L5JgXjMYUb74JtgJKVBNbQjBA5+AGsp2Bbp1IzObijm7NfbK7KzAeZSmpYkbmwbqQQfKLPRaVk1e2mtCBcIaP5rtUQj4ftrItqUuyUY6BRa5ldGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKgQwR2S; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b4121c40aso2150257f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773760075; x=1774364875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ounBg+UMN1/N0+EitrJjiPBQEsZSqjuCUXFihDm3B0o=;
        b=SKgQwR2Scdpg1O3n0a0EF0M0DvWv632bVUKhYerlLKPtF/oI7NCozVm4bjsDWnwCS5
         dXsxC7Nolxx5hbZFivydz/4qdvi+ES2XKWCudvDlciVChJ7wU7YkUlKbDTlHiru1oShD
         LRFjQfT9CWQwiY6ZidoaiRewqVyQNGOLgJQTF0CSIk3tPsrKNS3o8umCM5SuPJ9mJ+JG
         RNOlwnknJbnkjGhvThFIE1fhasjqPKtE/17MUyJH0UGf4Rsvv/Y6jvdmhhuJsLhBCBqQ
         ASMtXn6wbKa+v24gj1WDn1v0xlVVWqm42C7bKjU6Hkohi3GfWe4GsEes2omd2Zof7NFe
         I9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760075; x=1774364875;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ounBg+UMN1/N0+EitrJjiPBQEsZSqjuCUXFihDm3B0o=;
        b=HlUWDoSQEMDgFEyhm3nhuUobVVi6NfratYkk7DQOWelo1JhocZENPM8fQQv+hj1oYb
         A8e3l8YZVxlea3l/78f/9NlPPEZRnrxSnhf93pa4D4FryjBmLZZCx8HgFHVQ8ObV6/YS
         GuFY55ofMQSXKUcGxpndhF7MNTn1tSEUJrl19le8KKz/YBcFc8Qs3BWe5x7zCSEUakQL
         af3dbXKl3rtcxEdPrE2HNy/csSdHpSRdbG0LyMrLJaKvId8GNxso6+PJnfsQXIdzyFEq
         Ps1Jwj5SARQ7s7bsqhIinIRdkPLvqZXIisVZvPItKBTJAwkHONlxlf1Q8GSQRMA4ICFY
         4YOw==
X-Gm-Message-State: AOJu0YyWxG3LTJnoPhoTHavVbh4+UKZMByYcZ6/Jvyk1wCJF+/ZK7eNM
	ndR+TiRzeX5TXZewU9I+iykBwYKS8jH0BgK4kIeWrbEMp2X6w15DOEeCd5QsfL/CMHE=
X-Gm-Gg: ATEYQzzTd8t+KZuNHMozeE5wD7l6A0ZH0Yz3dWb63x5R0ze+xZIAyamZXZj0XMc9quh
	/zAyq7TDCIx+mxIW3ahjiYWXWuL9ase7HrwZrnWUNBA25QPADLqHeEnTnQQ8yGnDBN6lHyX4PXl
	breUenKgit6vAVjM6XBig9UMdhcMvL/lTsX9y/kfLvPQWpmVOqtD5Cy7ZsdLhyuB0HtMUT6ne9I
	98mbYqDRL0hKVChkXkzSBhstUV1u9NxLyRvIV1+hvp7oA7K5wa6sCN1yGBiv2Os81gHREhvHWCy
	5hW91HS3/enFHZitOk1vHD7Fs6jX2OM4jOFDEmGKy/ulFMrP2WCiCEBXBj81w67WUifbUp0bRNH
	yYeARBAALGutjpe2vMS3yfExk6gzncjs9GRBH5ejaSx6j3kEYC1C4BgUeOu5PqtfrTsKEYHrrFQ
	I1QeRMNc5/krZJQGQdqk1jTHSylqMpjcui+gpnWtfGHfpPnANKSB1dmz+Gw9HfE4loypqbewWT/
	ReZACg=
X-Received: by 2002:a05:6000:240d:b0:43b:50d6:4f00 with SMTP id ffacd0b85a97d-43b50d650e3mr2023675f8f.30.1773760074531;
        Tue, 17 Mar 2026 08:07:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c778:639f:c042:aa01? ([2a01:e0a:106d:1080:c778:639f:c042:aa01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892290sm82251f8f.20.2026.03.17.08.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 08:07:54 -0700 (PDT)
Message-ID: <7510ff5b-968e-4ae7-977f-4163aa9e396f@linaro.org>
Date: Tue, 17 Mar 2026 16:07:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8450: Fix GIC_ITS range length
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Abel Vesa <abelvesa@kernel.org>,
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jishnu Prakash <quic_jprakash@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com>
 <20260317-topic-its_range_fixup-v1-3-49be8076adb1@oss.qualcomm.com>
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
In-Reply-To: <20260317-topic-its_range_fixup-v1-3-49be8076adb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-98218-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.4.236.224:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1.5.137.32:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,qualcomm.com:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: EE5E12ACE78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 15:41, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, the GITS_SGIR register is cut off. Fix it up.
> 
> Fixes: fc8b0b9b630d ("arm64: dts: qcom: sm8450 add ITS device tree node")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index fd2d5648b92a..1f31d3eea4f0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -5104,7 +5104,7 @@ intc: interrupt-controller@17100000 {
>   
>   			gic_its: msi-controller@17140000 {
>   				compatible = "arm,gic-v3-its";
> -				reg = <0x0 0x17140000 0x0 0x20000>;
> +				reg = <0x0 0x17140000 0x0 0x40000>;
>   				msi-controller;
>   				#msi-cells = <1>;
>   			};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

