Return-Path: <linux-arm-msm+bounces-98217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GiQFwFxuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:19:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531E2ACDE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66D0030318A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463E43EB7F6;
	Tue, 17 Mar 2026 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jyX8lFYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F493EAC7D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760068; cv=none; b=jYYeZLmrq4iycRx1pB0jHKBFE54dmW3XViKrfFHoPu4GP96lAONfvWOO4gd+WE9kjkKn3nOD6+pLaYss3qaae7Mub+0HRKiLoTqxLidsKabQZgKh+hfJOBdoIwHg5RZMrMLxTHjAk5mLH5Abii/bR6tOk4SiBgFln0iQGN6vaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760068; c=relaxed/simple;
	bh=ugLXSOQq7QSCgho2RoIr1fLG4lvZP4+2+LFPJMLE4ls=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cWFNm4pRrRPakKuBsb9+qyPQu2Cd+++7JPxVg+3umwyn4KUieKS/2L2XqtCFKiivLBgxJsVlLbCqYD019QXataicppB4QhApzz6aFBRhNc/CICqoYFQoFE0jBx3m6XNig3QNYFqfzjoowGMgVIdK6VYpmCmSL/bAAYupBowk/LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jyX8lFYk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439af7d77f0so4355528f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773760065; x=1774364865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m89VOcIDuR8pU5+lfBINwqojWHzS8GSlw/sbPEudCRc=;
        b=jyX8lFYkECFWfZ0uCwgGLWwmXyER+V5DbQuT6ntwPFxAaulYS8cBZjn+qDp3PNd4b6
         L43HuLCedOhtCNgkC76DO56lbqrB7xW5xevqx4ecSmT/rGIeQTdbF62LcbylF/JktMkR
         CeqX5LGlYL54JKcmqKDvF9Eoc+BATtvw2uyc3L5ulRajdf/K5vKJefgTXD156NCwtOwo
         Diyh+1QzdTKvm8ATW2Hvn3Idz+b6rekCYCRw1pw71Z8MI95JzTlFteE1R3YYPtZ1T1Zy
         rgziuD4LjknvTbAz5pJ5QFqAy6981We8C723dnbWqtkjBI+5lY3aQDHKWiVDIs7mhz3D
         CJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760065; x=1774364865;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m89VOcIDuR8pU5+lfBINwqojWHzS8GSlw/sbPEudCRc=;
        b=Sbc3WArPOjrzpVBmltNABSSEgEAPApA6sR9UhKXbxX3NSpIFaKTLx63ZgPsYsNjViW
         sS5R2L24/hND72j+g6iKX+izoq5+p2b5HPU3R1dtmg1hfDmDW8HCKWXvSp+6kuV8DZOs
         urY56e29h3d/aPYbFiCOmgGsjjFLWX10yiplxWeuOiYRibRQc4dn3Xqurq9Zr9GfiAJ9
         BBmbIKb2NMgfvOOI1cdJF/EWt+x09P7Y6OTLhiFJoEt1mKhM3nQQk0P1+WV0nid1ITne
         tqklvbCBJWGs+QfkGX0iiJPY26hNkOsabPROj3M7DwJHt1zou+Y5ncjJ5+6fqvnCoxoj
         dUCA==
X-Gm-Message-State: AOJu0YwGhrYZV+L2Azp23i93t65nZhAKGxFunGwgvNHpszDhc9cIQPTj
	RuwPoHFvZKjdv+RLB0afRlLzn8LZzHv3b5WsqUFlSsAqLe5SLrR4e/Clj0Nsus0Kc8I=
X-Gm-Gg: ATEYQzzowswxPesB2ROENeuy0JV7/6FAfd/7up5Tbu9gibN/27zdnxHIL1R6cpMttCV
	I6ujsY81RoQedr4dti2qZ8bYKxQai4SdqfOJ5XscOgbIhvz0SnxNTZT7Zzi9gYO4yR1g0I9Xeqc
	EnTco0nfuBf+HVlSwEK2u+xlQzev7u5bPWim1rxNNQnp4FPUSYegBl2vFgwU0Fgk54uB1mAr9hI
	lQK8F8wpLB0hShwDig98QU4wth/FE5WxJiaBI+JXoPMnutu2rRRY4uzsIaIxuHw+SAj8K/1QKIH
	KzKyjyPvoi/bdD13y64/hahN9HbC0CdAiK2CkPdkGzxV9//KFjVWpdrCwW6Zz4Wd5qI76dxxcfK
	nr6NU5YD34VXV30enGoeCQu4FT2XzYaIzNNxBEFzt/zNr3W2zT9R30PN+0oczeUzMtrJo9o7F5u
	f42+9YV7w3sjzAItmcJTCGY9lP8jJHPK07ECibnn+ChFR+DP9ATWyoQuqX5kU6mXEyAMjK9nYEj
	uKqah6A9PmKpHtBoA==
X-Received: by 2002:a5d:5d09:0:b0:43b:4faf:a496 with SMTP id ffacd0b85a97d-43b4fafa6cfmr3562311f8f.31.1773760064888;
        Tue, 17 Mar 2026 08:07:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c778:639f:c042:aa01? ([2a01:e0a:106d:1080:c778:639f:c042:aa01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852ab3sm165071f8f.12.2026.03.17.08.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 08:07:44 -0700 (PDT)
Message-ID: <a5cc6da7-b530-4acf-8014-4c24ffa2130f@linaro.org>
Date: Tue, 17 Mar 2026 16:07:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8550: Fix GIC_ITS range length
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
 <20260317-topic-its_range_fixup-v1-4-49be8076adb1@oss.qualcomm.com>
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
In-Reply-To: <20260317-topic-its_range_fixup-v1-4-49be8076adb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-98217-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,1.5.137.32:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 6531E2ACDE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 15:41, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, the GITS_SGIR register is cut off. Fix it up.
> 
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e3f93f4f412d..0fc86967bbeb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -5274,7 +5274,7 @@ ppi_cluster3: interrupt-partition-3 {
>   
>   			gic_its: msi-controller@17140000 {
>   				compatible = "arm,gic-v3-its";
> -				reg = <0 0x17140000 0 0x20000>;
> +				reg = <0 0x17140000 0 0x40000>;
>   				msi-controller;
>   				#msi-cells = <1>;
>   			};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

