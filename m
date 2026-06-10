Return-Path: <linux-arm-msm+bounces-112431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wip1BFdQKWoAUwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:53:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F43668FC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:53:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=wK9joYba;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112431-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112431-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5C5C300B0BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D2A403AE3;
	Wed, 10 Jun 2026 11:52:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDE03F9F48
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:52:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092340; cv=none; b=ey/u2FzaexjM4/A2/YZLzOOICxNSmw0QVL77F+Bujl5VqDkh4LXqdKM4UrfWWFoG7Z44M0UEIBPmxkiJb/TtJwX+b053ie2Naq4ptp+aADtJARXJTiLespwzptTFYEcbguIyKvSakD4RTNnwolQtUrh6Lv632ry2jL6h63DUsfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092340; c=relaxed/simple;
	bh=1HmiDIsnKshMBl8c6DN2fBfkak63RnLLhJObnYlMCDo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hiTXNKHqA31wCIimZIatVcHcmB8fSyZ1MLz7sxt80CGOYjRv9w8+itbDbb/D8Z23tSZpVioqRWPYx2vzMEuGU9Svt2YOBC9v89JErs/CSz3V/BtUpChv3ob2RRLN101GTxJr/JrL9coMOF0pcsCUYKoRLb58nFxKOjTQ7aFUyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wK9joYba; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b7866869so73411545e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781092336; x=1781697136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfIPA1aZoEhui6Mu5CjguI7eMbQ8iYAHHH0Gm8rNQOo=;
        b=wK9joYba3UIid3tmRjJtduQcid278DMmwwYrQu6GQv2OWohRCAHDM1eu7fAZc+I6gq
         Ol32n3xAvy96kZzhIsY3l4iHzI0CSCDAS3Gx8XWtBC7DMX6PrMEQDU9psRzKW+Wl7fNO
         ex6ujRfFHs1TI4XRzQkEk7HkJQuuHhAAME3wmlGvKDkd2dulR1MTPIN4K8Aem9G7w7Qw
         MWIHtnZG71hmoD2yA43RzOiKzxZfSGV2h1F69h0o2RttMYXUnlTO29QiEWl5Qy3jp6cc
         IdCn/ATSVviVdzQfZLgTvK3Kyuhk+zS2U7i4eyf25XpqTHaisBXVjJ6mZBiMJurwlQX2
         4NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092336; x=1781697136;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfIPA1aZoEhui6Mu5CjguI7eMbQ8iYAHHH0Gm8rNQOo=;
        b=dyVxvV542rg/ECzLnzcg5KyD8pXBOmZjrT7RR9iZYsxG7TF49wcpiyLMgZhmtLXcCv
         qMkSHV/avgmFFISOAq4hB/bB0ZjFQ1jWblRwiIC/6qw+G+ZzvQ4236GVUXJUjBxqWynD
         BQJbZsFsNtGHVnnTJWcqNFWuB2QHm/x7fLj1GwBHjsLXfKMCwfPD6XN5VJ5V4K8AEoYC
         E9ZKJAMZnOgqw1BZjCr+PRRlGCJuyxG6ohzrg9a0TfYgLf1Li9YrGapW48EAlBgM3Pqd
         rJ0+1A3+vs5hYIrjplLyXNbHQZFCkr+0PAqnCxvaVcb1Xp0QEeC88B76CkThs/sOK/ME
         2SXA==
X-Forwarded-Encrypted: i=1; AFNElJ9o/krsRHqZ+ExTa8+CahoEhhAJT7FGaZ9OGNDymrCQfN2KT9W5rr76RDFfejtDZjOK/EPkz3gp3NVVIVsR@vger.kernel.org
X-Gm-Message-State: AOJu0YwlFZrFiW4N2B89Tsg5WPsmi1O4wpMZKLNYrwUYqaJxT1dFFZJA
	wNstgsHn+E3e5NAs4qyDuKdejgDeEuVnW7QEyv64kkGdiUjWVGMjJjkboxUzl9gHC7A=
X-Gm-Gg: Acq92OHcLVaM6Hp2fx4AcG3vRKecaC4oOx3hf2uvDZh2FnCsnNUJNhaF6pGcUlgyD9P
	VV8pEefbV+B1I9uos0C+oxUqVo0ko6qkLxQyFVyF9au1ectsIUcsVlJSrT7KvqS4P1YiYGVNeML
	jmJczAuV3Q3p+eeaLOLbZEXxN0JIFYcRks57arimW62+Mu9O300bcLiWtIuekVl1Aj9ftkSSmQ+
	zU5Q3S3rfZsB9ub/puptxnggbpHDk+UzAfjVZ16CED/pu11a6V+9FHxmcjHwCQbjBW8Ubq0ZXPj
	IAxPdAod1AKP4Sf1aeKPae+ejnpXRqdcTploITq4NcOwTkbMMO6UGL+fz6jW2Zf+rAhBYhwTI6H
	FSZRoAyQmqCSssC6HVxisNAqlK7zrw1rJA1c0sGv5qWMMSQ10Q1JPxwmCE9WPNxjbp+Ltjhz/NG
	g3TvcuWciEjplUgX4NXdjhwDUrjv73K3gga5eUqM5dUSFVrtYPhm/TwjxJz8JY+wh/ZhTNNtNgL
	N6PzqI2FiUos7lENA==
X-Received: by 2002:a05:600c:83c8:b0:490:40f1:5314 with SMTP id 5b1f17b1804b1-490c25b2b7bmr375153215e9.1.1781092335592;
        Wed, 10 Jun 2026 04:52:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b5bf:da7d:ac8f:8fa4? ([2a01:e0a:106d:1080:b5bf:da7d:ac8f:8fa4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm494088735e9.4.2026.06.10.04.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 04:52:15 -0700 (PDT)
Message-ID: <fbb79046-bd27-4294-869e-dce8fc0ee79c@linaro.org>
Date: Wed, 10 Jun 2026 13:52:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] sound: qcom: audioreach: support WSA speakers only on
 WSA2
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <aik4dCUlumE1A-_v@sirena.co.uk>
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
In-Reply-To: <aik4dCUlumE1A-_v@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,outlook.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112431-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:replyto,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14F43668FC3

On 6/10/26 12:12, Mark Brown wrote:
> On Wed, Jun 10, 2026 at 09:41:44AM +0200, Neil Armstrong wrote:
> 
>> ---
>> base-commit: 1ed783a6906ab62a54d631ff3e8c5cba0f4f4b54
> 
> I don't seem to have this, it doesn't seem to be anything from my tree
> or -next.

Sorry I forgot to add the dependency, it's based on v7.1-rc7 and depends on [1] for the sc8280xp card data.

[1] https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Neil

