Return-Path: <linux-arm-msm+bounces-110071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIr2JPkOGGrMbAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:46:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 388AC5EFD7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64A5A3071477
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9903B6C18;
	Thu, 28 May 2026 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPhcJgHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C743822B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961525; cv=none; b=ow/LQhy+kRhAuUBWvIV+MghobLaqDWX7sp3n+zxT7yhImAGYdqvCVYa1Du/+MYc+CyBXNWuyfPPRUttBn1z0/wfEOsTFvj3ILxMhO8wjKBvBggwimWvyvadg5RWKtJNzxs43HeVkiMAYpWEIPOeUEdplzvhW+rXeQdAz7s+DJ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961525; c=relaxed/simple;
	bh=xri3heExSX3O02hCSommLP9rtVJQ4RWgqS4s6DCsNYk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WkJAGFxBmhM3b1QNl9ds7drrSyrxfGde0s/zRyn1L/2SbWwg5mK5aqt/YZsSbUI5HmTxgVNEuRCertR1XxBJx/3dYjMhmjwiaTLLnJlf+kDl27VlTu79xcRoNity1/Y4vf/84ckLXgbWq5nqopBVGXBKoVrvBz2FRAK7FVTHTf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPhcJgHc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49056b9f04aso65438815e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779961521; x=1780566321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/0eF/9zyruMpO33JnJtaP+mGHWQVp58COWCcLHEVME=;
        b=wPhcJgHcziz+/AQRLwcjKIzooqo0zS85XpRbfqT3G0YApPRMXypABzl0AmleNKcBbs
         7ujFVAdLVaZu4rLJaPuFkLyBlKZuSRNUqPzd/XSd7BEr8eK9qrzIaiqeDPs/pjI+1Mqt
         afB8fXusloixXfIQufgZtJ1auxypj1UZwd4x7GSITVzW8tgeqJLN7ejurUb+BU+1vPUJ
         9p3Qi1HNo42vctYCH69kjdNwiNn/M9TZtj/pHluCHvQID+Cl6ub8Vc+6fBHrw/fUT/Jv
         go2BauqQTxuoEVfnem6aGZt2PPZa8RDO611DS7aJfEPDKAZRf2/Ai1XJCLA5bldfW68Z
         K9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779961521; x=1780566321;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/0eF/9zyruMpO33JnJtaP+mGHWQVp58COWCcLHEVME=;
        b=P7bssUG2lywQxv954kciteqM+7oI3SiiSm8yvJQF7Qn4HN44k/jVCISTjqg1VhPr6F
         IvEsaKHD2BpUPHLwt2uP0OJp3vbJAGxjaTYeTgFm4jh56/DROLQHVO6N1F5rEV22uptM
         FAcldy+YqvOQbNw8v91//81kIUhvXSGV+qNvT/py1uo37cNRvpRUt+ODYuh7jAh9s3qY
         Xs661SJVjUb/eXPM5nNN6q0xLacSeoEEFLmf9FI9Xyo5uGGD4Gs56aCcivRxx52a/2iL
         8rfJMpEwN/1fyld1baeKeqgE8Ds/iKkMRsM+lWBoSng9q96tlkgUWVkEBODvrUbePAat
         /RNQ==
X-Gm-Message-State: AOJu0Yx3ztyXQ9SF+eUKAwc99XTzGj9taX4PI8s1qsS4uzVvKoDyVwEN
	mrX8XJrkg2niYer16ao/Vp/vyiIiaXAkDU3JVbGYIpgjhF04TmUshwbT5yMmcUrxQnQ=
X-Gm-Gg: Acq92OESN4rQDbCzVZ0S6GeJYj/gcgpdTJAnGkHR45sF8Apkm0ns8sOJGJAEuDjdsGD
	Z4fH/ruKo1Km5t6CMoIL5gb2xJKWEU0YMXiMfSs+7zmzly2Jm+iBS8n8JHYFmtpmIhN9sKqi8io
	ys/gjEEcrzUlmhWPy30lyiGH8tTMGsjS+IU9DLYyIhdxgN7pGv6k236QKhdfbNBVeXtrlZ+8bKP
	IfkU4qQ1J8wmTQxk2Y1nVxvzKwLX9cbRPpSDYgONoHVtT47dnnQzydJq5FUqNdd5mrb3052kssd
	9EMfydeJlUhASzAISLqHKj45JfwK0T3xLa5kZT1V/22kaQUIRRX84C5KNCQg/fFSrINn1COLk9B
	VbLFJudPyZBKlo4h8t50Gwdo/qjUbMQ0XGnX/+t+a5ADEWcS3ERq7oPIK2xaqLoDRPaMj4G3k7D
	CItUwAIiUQ4JKyydSMzwqe7YSA+RkVaQwlBCyntMSWIkc=
X-Received: by 2002:a05:600c:1393:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490428e5b31mr439149705e9.27.1779961521317;
        Thu, 28 May 2026 02:45:21 -0700 (PDT)
Received: from [172.20.10.2] ([37.167.60.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c1e59sm11380395f8f.33.2026.05.28.02.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 02:45:20 -0700 (PDT)
Message-ID: <10cb2641-e63a-4f5e-b89b-ae2fa7b215fa@linaro.org>
Date: Thu, 28 May 2026 11:45:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sm8[456]50: Add missing CX power
 domain to GCC
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
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
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-110071-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 388AC5EFD7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bjorn,

On 4/24/26 11:07, Neil Armstrong wrote:
> Recently, on Eliza & Milos, the CX has been tied up to the GCC,
> but this is valid for most platforms including sm8[456]50.
> So tie the CX power domain to the GCC as well, for the
> same exact reasons as on Eliza & Milos.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (6):
>        dt-bindings: clock: qcom: gcc-sm8450: Add missing power-domains property
>        dt-bindings: clock: qcom: sm8550-gcc: Add missing power-domains property
>        dt-bindings: clock: qcom: sm8650-gcc: Add missing power-domains property
>        arm64: dts: qcom: sm8450: Add missing CX power domain to GCC
>        arm64: dts: qcom: sm8550: Add missing CX power domain to GCC
>        arm64: dts: qcom: sm8650: Add missing CX power domain to GCC
> 
>   Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 5 +++++
>   Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 5 +++++
>   Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
>   arch/arm64/boot/dts/qcom/sm8450.dtsi                         | 1 +
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                         | 1 +
>   arch/arm64/boot/dts/qcom/sm8650.dtsi                         | 2 ++
>   6 files changed, 19 insertions(+)
> ---
> base-commit: 4c406406070d57dbefeaad149181785330c23f92
> change-id: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 

Why didn't you pick up up those changes ?

Thanks,
Neil

