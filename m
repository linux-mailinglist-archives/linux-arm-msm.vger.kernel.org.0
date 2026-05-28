Return-Path: <linux-arm-msm+bounces-110070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHjkHMYOGGrMbAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:45:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D184F5EFD4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0014F3064089
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13773AEF59;
	Thu, 28 May 2026 09:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwa0oTmT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2461B3B1013
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961457; cv=none; b=VvklX7l4miazjv1wuRsXe6jJuAD7w+7ZbDpqHeGIqvDZ+5PQa3i8InAfcr0WmD0bxSyt5IUxaCoTSKRe1Y44sElL5+t/Gd7nqD04kXktw242kWTyKCjtRfXNPrvFaj9XsY/AKEelSbfrxWsQxJAq3NioZesRy/yhk/8qnRIfx0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961457; c=relaxed/simple;
	bh=WYNLpKYQdp0qMDj6rWfE/UmRh30bStsXdedOXum8yc8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J2TamNf/UvYvAOAbIeHi1ue1TBj/rPaI8lQkdmi/xRSlghvNdOXaVQUK7nHTORH7UbnfH03HHJ9hXxuPAq3jNehxDBbCwAVX0Y0kpgpvzyl9xqK2dCZzL7bR2pMKubuKNAK/G2qMHGqHTHskGceovEVGI6xK/hVgWjwuDJF7wCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jwa0oTmT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso108855465e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779961454; x=1780566254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2c6drxjHyA0VWHYH3QAN85Fkm3qck6usnIDM8M3U6M=;
        b=jwa0oTmTm6f2u3+6GjCYV3MrZqRCqe/iwLcZwSTrdFDpWpSOM+YDX+IZ+x4KudYeqQ
         lcvDnhbo/krOF36DaJYDn4owwRKSDkL1Jqq5S2ZXFkXl1pl2fDs8KCK0TG+mUZ/s+4CN
         BU+n93VI+vn/HoYJHCfnUDuK8MlE8vaFL8SJmFsxXFANsCnnD9nCJtVJPoRk8/R/Mzk5
         McwrG48x5wlI3zHPWc3mG5HndBEHbJabg6VureurluNiAnwEvVigRBlCowY+1dgS8nQG
         dV63s5yeXE6TYZS8pz87i4AWDLOPrqwrGs0Bkb8O8WyqYlO5tv+ss+hDCGoTw4VE9aCb
         7eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779961454; x=1780566254;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2c6drxjHyA0VWHYH3QAN85Fkm3qck6usnIDM8M3U6M=;
        b=B27xBB+tx9iAm47JkHRJj1Soo1N9WOOzfdElXuPd35+joZm4edvSB5QtRZsHDflfd7
         S26XdD5fmSXJPZP2A3Jv6Fg/3XrKzOaRh5vw79zZTZM1FIG5f3973W6PkgKSkt9L29pS
         b2PX7H8mKZxte9t8zpLDDGkaLcX6TSmcq4wHU1wzOTjVR9wI+xMZSnhG8bJZmj2I0u4W
         p+UDW2tJDj1DoAaHjZjokBMfVDwmntWiMnhAu98OKL4k/2JbwcMvBV2xnO50bhvr8nMw
         wEPj7fDkMqNOwGwwCYE+0tXNy2uANwp5o38a2JZIhwJ+NYhlDHo12U0/jRaRmi+hl4wj
         3+uQ==
X-Gm-Message-State: AOJu0YyMGbo/gIMuw9XWgEuf88Q3lYfnllOUTSXXTLLpvH6p/qWiJd9q
	gLvB9VWbZVszzjK/66V02DngZDSa3NKwJnsVuv7glT96rPxR0Wz+8KeZ7WvZlQB1Ma4=
X-Gm-Gg: Acq92OHQwHy1EST03cyHlEirANocgDCRHrCS+UaqbSYCt5PG/U0FzHb107HkV05hJc1
	SPE1gHI3Bf6pQ8rXfu5dh7ChG+SGSXYRGudPqRwr2HyeiGgxHw/sJUhZCaF3uWupuWSpQqAitgW
	sdorIXv2AP/xb0oq2uW1SRfyCITHQ4jT+YbY8Xp988SqNVO0Xn6picNIdRL1uuXH7Eme/66Sb+B
	Ln8W0jCJ8AswPMfGuqH1n/SwIxDiiKgRvzdYGyBksjhCij+mwFlah/iBlIgOs0ZzRri06BnUABM
	44T+yFrGyiuJreOd73k9r/dSgJ3HrP3dK/Oets/RZv8dy6VErKa5XeRNmHZ/GBiYKvX2hxQ7zU5
	nJ8niOXTx+HIBnkjnqoL5TiTsyDjlgil0MGRfekNrO5xeFGOi/g5awQeolBpk7aSa0CrhbTBMk9
	tnTrl9sWrf1PClV/OO2jfDkMcWy0Rt4+FTPrVMuE4xJqA=
X-Received: by 2002:a05:600c:8217:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-49051e9e233mr358289395e9.27.1779961454350;
        Thu, 28 May 2026 02:44:14 -0700 (PDT)
Received: from [172.20.10.2] ([37.167.60.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb549addsm12108102f8f.5.2026.05.28.02.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 02:44:13 -0700 (PDT)
Message-ID: <3d544bf6-4e17-4ae2-b41d-cb8df7a776c8@linaro.org>
Date: Thu, 28 May 2026 11:44:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] arm64: qcom: sm8650: misc enhancements
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
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
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110070-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim,msgid.link:url];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D184F5EFD4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bjorn,

On 4/20/26 21:26, Neil Armstrong wrote:
> Misc enhancements for the SM8650 platform:
> - update the cpus capacity-dmips-mhz
> - add the CPU cache sizes
> - correct the soundwire ports
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Add review tag
> - Fix l2 cache size to 512KiB
> - Link to v1: https://patch.msgid.link/20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org
> 
> ---
> Neil Armstrong (3):
>        arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
>        arm64: dts: qcom: sm8650: add CPU cache size properties
>        arm64: dts: qcom: sm8650: fix soundwire ports properties
> 
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 110 ++++++++++++++++++++++++++---------
>   1 file changed, 83 insertions(+), 27 deletions(-)
> ---
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> change-id: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 

Why didn't you pick those changes ?

Thanks,
Neil

