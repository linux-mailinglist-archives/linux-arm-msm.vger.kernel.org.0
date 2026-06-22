Return-Path: <linux-arm-msm+bounces-113960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nwNMAIoFOWorlgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:51:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F2E6AE6DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=GDpfwImt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113960-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113960-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52C2B3002136
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35AB359A68;
	Mon, 22 Jun 2026 09:48:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612F939A7EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:48:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121683; cv=none; b=FXsSjeZ+RFDIkasrexdf8hPcKb3vQt4jndrzYezKX0nzzu84dqHh7XqEcLnC2o5NHCEscGetJnDxfwP8amXKM2PSJGFLiNUO608BkAjJavq9zYWo+88ZG3/s7lzFKEZEq2DnKBY1bFpXvcRIOn7tqrnfTAIbJJ0+FyM0iLb4UNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121683; c=relaxed/simple;
	bh=VYinWnQae4+B7P9giZn89VNsIC55c8o48r0FuxCS1fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANGrXCprtqmLaV8Oal+PrlQSxLGyJd3AkmCz4AXVxle5CTBobABxeFlPHEUsiCecBP39XuRz9G6UbazDPx3C3Scj6WJzyFmrtDlDJLEaSxAy3j8mYt82my1U298aWCNtGUCU0cRw6ydZtsYY183lJ7J7UR4NEZFrnjBnBNaa+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GDpfwImt; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490a76757e5so25749905e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782121681; x=1782726481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePKCrCfHq5Y2KE2FBQXmlLc3ZGDked2vfFdF5rmVAmI=;
        b=GDpfwImt5qjA5n3wEDm9T3ARzIekakf42LXNbdSNZ1uBA8gIvMhuhxinKpjSxHuBLC
         cZ6X+AhUw1/f8tu4zHdfrI7XupYrB0TLONV/zq4O2tiPoEsXXpMI4dGgGEgNYLdKcQ/m
         SsR5SQb5mZsEsXW7WyjtfijyYC+MzIgZA5k3IzT9S14ivdAoSBfUeSvLCr6Jxyjq4php
         O0kq/MKLlWk42ibyQSA7f8L01nZXTRcxtdR9x3UvqUdYSJNC2IhKuMI8X5CP4CYQIGmW
         TCidNEu24mV76Ni1Tdi51joJtbYH1oDHIfSu1mStySQHHv7qzp1k6R1lihOsJsjPZ9zP
         z+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121681; x=1782726481;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePKCrCfHq5Y2KE2FBQXmlLc3ZGDked2vfFdF5rmVAmI=;
        b=V0f9LOj/X6BkY9uZMObh4WF66x6x5lr0liePlNJ+LY3GHv6X5Kzf4ckP5J1bKDZa9u
         SKBlF0u2pmxYXsIT9fKh46Ik4rrRrIM+SWKH3ngoHY+Wt/LZXiXnz5lc8tqURI4RJCHO
         sKN7dcDTN08fByfX46A9dVg7lI4R62bRemkTUw0NwVpTLy7U8R8K7vM17xycdeJCGhgU
         MrpQKS3d2RZIS5sUL83nS3wRWQjDuEtguwBTJpKDut7ge5x9rp1+zK2kwP6cPRTaSylI
         KJg6L/0jy26R5owhhjOs3F0HM92jPbnuGIRyglKOgGHiZtznTZDG91GzPhfwwrMjYIxJ
         jfLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Lf49PLgdshu0SgX6XdTOPxjYIlFywS32ZxsE13KGdFHLxFNRimTqGq+YLMVBoCw5Ism4XmjyxKX5FgjG2@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNi3/FUJhEXBNXpBoufnKRhjwupe1k8abUzTo5Vzh1MlfJFdv
	gUTaZIN88UC3nk2njGxPU7CvTsqBCrk8jkYccfqCY4Rhi9enSezLEpkzTmYJ/IImXQw=
X-Gm-Gg: AfdE7ckM/tVN0AYt+nqu5aeOZUmzJRgAw2obAQ1SDc81T8W/r6ydwoslyFychowFIyO
	TuWYMQcWQWkc0MVERc7rl8pCQ/JvKZcxZHF6FJ46OSOFNjYsvm/x4yWZCLTQCMIavJvrumn6cwE
	OTedVBIuQFTijMOlxUobY1yOE4+7Hn+2jiUVmZlD4hIXuzB+/v2IuS5nj7mWHFbd6DOmc2aTx3y
	zzAeV2R9Urg1ipDnNJXz1SHso3WAaDitR3jM+40QXqwCaLHF3SstJnEgyE6lEyB5NhG7/3i+w5M
	R7ZNOr72p2mf99FmCbvefTTpIOs0yp9Q2iUXUvLwuP4eO9W0qH24SywwXRiqryZWJ/BC1httThD
	11lKJ5dk//vhwBJ76OccjNuXYLCgLcJBAUxRLWnthTiiCmBlKSKAhsVD2icESS97AjRn4Ys5P7y
	tEyidS10+UbDhYk0P9NLBXQcUhOffeELRDNG+OWk0JES2r/dVN5b2BZrOc7IP1Uhh99JMk56FAK
	BJP
X-Received: by 2002:a05:600c:3b20:b0:490:e196:e8df with SMTP id 5b1f17b1804b1-4923f5730cemr270851925e9.23.1782121680570;
        Mon, 22 Jun 2026 02:48:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9f24:cdc:bb10:65f9? ([2a01:e0a:106d:1080:9f24:cdc:bb10:65f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221da1sm24089038f8f.36.2026.06.22.02.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:48:00 -0700 (PDT)
Message-ID: <5686c654-8627-422d-8726-aafe63c2dfe2@linaro.org>
Date: Mon, 22 Jun 2026 11:47:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: install DT overlays via dtbs_install
To: Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>, krzk@kernel.org
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 kbajaj@qti.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, robh@kernel.org, snb@qti.qualcomm.com,
 vudupa@qti.qualcomm.com
References: <0f045b88-94fc-46b5-8a49-8a53235fc8fc@kernel.org>
 <20260615162739.787779-1-vishwas.udupa@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260615162739.787779-1-vishwas.udupa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vishwas.udupa@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:kbajaj@qti.qualcomm.com,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:snb@qti.qualcomm.com,m:vudupa@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113960-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66F2E6AE6DE

Hi Vishwas or Claude ?

On 6/15/26 18:27, Vishwas Udupa wrote:
> EL2 DTBOs are used at build time to construct DTBs corresponding to
> an EL2 (hypervisor-enabled) boot configuration. These DTBs are included in
> distributions [1] as complete boot configurations (e.g. EL1 and EL2).
> 
> The EL2 configuration is not enabled by default and is typically selected
> after the initial boot by updating a UEFI runtime variable from userspace.
> Once set, firmware selects the prebuilt EL2 DTB on subsequent boots.
> 
> Although EL2 DTBOs are not used directly at runtime during initial boot,
> they are required to generate and package the EL2 DTBs in the image so that
> firmware can switch to EL2 when the configuration variable is enabled. Hence, el2 dtbo's
> need to be retained.
> 
> 1: https://github.com/qualcomm-linux/qcom-dtb-metadata/blob/main/qcom-next-fitimage.its#L273

Pretty sure we can directly ask the question to an AI assistant ourselves,
and I'm rather sure Krzysztof which is maintaining and reviewing DT for years doesn't
need a lesson from Claude or any AI assistant you use to assist you.

Neil

