Return-Path: <linux-arm-msm+bounces-113784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1PAkHM76M2phKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:03:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF666A0C8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:03:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=y76c6z5E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113784-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113784-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AB42301CC1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9103FD159;
	Thu, 18 Jun 2026 14:02:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6530F3FD13F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:02:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791367; cv=none; b=PHVbtcVTZHMPPGFkUiumkvJVeCtUrbPtuapRcyFO/7GuVRx3875i0ZPhGON3Yq93oygpAHyVCi1U7zFjM5aq1cgem0mV+40md9ZnOq8wr/c6CKzG6AciyIBhwHZ9xavwUxg4LrtSEFL20Yd+cvXr/IW69mzHy18YUnhvbxRw8p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791367; c=relaxed/simple;
	bh=Zm88aDHqan80xJtYX/bGH6MO8Kts60eFfVrY3vZn1jA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t20fGx6BR7oeYtcBs96dug+0JjmcRz6x6zNeJV8tYb/ZRJCGW4mFK7qMkfxPtKk1HWZtiXBsWctGNNryUvjgu3v4P/uTYCE/4uLpXxqFYa7bUnS/8KBeDJugjhKqsNMf1BWcvI+p/7ld2DBsaFtFwsW/vVmZHEiAYSRpXzLYOdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y76c6z5E; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so7408055e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 07:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781791364; x=1782396164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxK0imfm+1QkrAHskYa5t0rNBEyGWHeSjGaPl9WwcgU=;
        b=y76c6z5EQ+4zLVHOi5hcfL5bqG3Qemmo2WiZi/qdM2rggCZacayPIkwyOF2jBbZQQb
         uIN11HO5cUz7SbXmErXCPjr0m/30BjSgmseQEyWabzeHu/+qYNj1MWjsg+5PzT6qbpJD
         dZfbty/X87ttman0vv5C8Bw8HFPRmOOzne3QqbVFVwX4g6jiP7team126JWFNbmen7Aa
         irRX5MUmRdWAv0ojcKEWj7/cNtptax0/6Qz/VLbNMi1CZiPkrPzw7T5fvvUZ2apyvNU8
         lb3Wf6ACovUu2myx0G+gCD0xCBE0uOAFk4oI753B4A+RfWyXNUQ684A4bmOMqF1+7nIZ
         Yjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791364; x=1782396164;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxK0imfm+1QkrAHskYa5t0rNBEyGWHeSjGaPl9WwcgU=;
        b=AxlaoQlmHVxDp4lOF1m2aXE9PRXXWeo9VcGIl/fLTPpDxDVyOjygVihEB/psl990eP
         ZniozndRsDEVejz8eiHPQOM7xlanwdAmYxaGLSFj7weZjxkL8W8120daxgCbC2StHDIY
         w9cIC8tTTKnTp1njX07DU+S1lPL2ubY88KZ5iiUAvXmrKzMkKGrHnLhk0QSbQDLJmtZ6
         mu0VeqFeHQqWyW1AP1PuKuwjGqPyECHGjiGlohlTP2F1KtY4ZpS4+SiJ/PvXZQkPmKvp
         OLh0juGMXNEU+i+MKr9xq++aHk6TVushNaGwNITbU1uu3Fa7/p8Nf4vx5pTFYhkwBTJl
         Eniw==
X-Gm-Message-State: AOJu0Yw+kNPTkFl/xquBQ/FKQn1dvCAxnprgIv5c01QbLgXj1kJQ3IcS
	4pBUye0IcQ4o7mUDE+AHaBxHX3nIPAry06MaWCPzPCcV7cx706OysR6+bhGcE9ZN1hQ=
X-Gm-Gg: AfdE7ckkB5MIvUf7dg2e+YsftbGVhAfDsEqYxxMB5Ftxof7s7cvdyd9RU4hx/DDQqRt
	z5qug/lLR34vRerVaJ+CV0LUt5bOQqIV/1dkaYevslveorarzDK0qT1r2f6k46u5lPH2orrEPfC
	ZZR3jVONbkWkK/+y4kwbVP1Jd/LUsrkK3KOxmqm0G08PuQ5YBvh+F6evcJ2HdXMxg2KYBZeR5KU
	nVmPEthdTyghC1qRCoS0cnhhA1NrKzNefi4LuyC8ZkXm/C7ik6k/liywtTLw6dTvzGe/x9WZ/7J
	LtjKpzRwYDNez47OjFDoUEWwoomjIHf+nwFLP2su/jpAm9Jj9J/HH91xQqSTrZ3FBw+/KDZAaRV
	7RC5sMhrF4BjXR/Y9XhvPxhNbqoRDtrx3EBE8XylGYhEgX0BZdHxgeiWZOSYb/VDOAr6JT3ynEN
	4WcPDPpsQwKgNxz/i4pFXuXe22W0EGVs4awSy7DD3DmCQm/3Uo5TseaNW3mxl7DMi6QcWx7TKf7
	p1n
X-Received: by 2002:a05:600c:6b69:b0:490:a1dc:e542 with SMTP id 5b1f17b1804b1-49234100c1fmr92175145e9.6.1781791363260;
        Thu, 18 Jun 2026 07:02:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0? ([2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a58becsm240825675e9.7.2026.06.18.07.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 07:02:42 -0700 (PDT)
Message-ID: <45034b95-bbdf-4dd4-bcb8-5bbc74d86120@linaro.org>
Date: Thu, 18 Jun 2026 16:02:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v8 0/6] arm64: dts: qcom: Support AYN QCS8550
 Devices
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Teguh Sobirin <teguh@sobir.in>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
 <178179131851.245596.10889069443600186081.b4-ty@b4>
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
In-Reply-To: <178179131851.245596.10889069443600186081.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com,sobir.in];
	TAGGED_FROM(0.00)[bounces-113784-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:webgeek1234@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wuxilin123@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:teguh@sobir.in,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CF666A0C8B

On 6/18/26 16:01, Neil Armstrong wrote:
> Hi,
> 
> On Sun, 03 May 2026 16:48:42 -0500, Aaron Kling wrote:
>> This specifically includes:
>> * Odin 2 Mini
>> * Odin 2 Portal
>> * Thor
>>
>> The original Odin 2 dts is not currently included as it has not yet
>> been verified.
>>
>> [...]
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
> 
> [1/6] dt-bindings: vendor-prefixes: Add AYN Technologies
>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fc917a533da47a5d0fd2f3df9052ee6dc5e6adad
> 

Applied it for the panel bindings,

Thanks
Neil

