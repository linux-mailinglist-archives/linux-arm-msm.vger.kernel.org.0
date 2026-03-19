Return-Path: <linux-arm-msm+bounces-98794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCwEHpgivGnQswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 17:21:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAEC2CEB00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 17:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7595232A6A58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8373E92B6;
	Thu, 19 Mar 2026 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlSZz7ff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E434238550C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936528; cv=none; b=hXHoytekHvdo9eoWYXg27vAZ9prKWOPG7z+4uK9w7qmha2zw/zps5kWx1aCNiSFqAN5tWzh0nyeOuSN86t7roLmG4E7yjLyJkRJL0cy5DJSBXq7e9j9pAN/d20KWPpe8YKeuDH8GTmMP+UCqo3AoslFB4+dde12mzKnB1Q8fBl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936528; c=relaxed/simple;
	bh=rlEF8rcoZ9Yhxjn4MZvft47PJFAScntl55etVD10l7M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ek+Bp6Vi6tuKTsJ4Whd3Ss30szvZ3wWyArPnoFGaOsNYVh3gzXAG/rw0BwGs2um91Zk+sduGKHqoLQ51XLqYCENtVJmfKqGFF2t8y529ZebLvzNtAJqoSPfA4NcSTxSAEM/BWasS7kGRczhuK/77EgiZIYfLAvcNXBXV8y0+Xv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlSZz7ff; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439c6fc2910so756193f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773936525; x=1774541325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICb79d2+sHzdxc1vylZi/q9n6G5oRRdWGzOcbuBbee0=;
        b=BlSZz7ffp92m2agJsQU9Ik3tmkBuCTY67uOumaHHmDo5VbLfkoTMCrs1WZVkMmBxPx
         kZj43YiLtz2ud52GvLRP6AjYFBsAExgS3U26E6qnac2KLf9Eg/WDgAqeYdZcLIRqX091
         z8vF1N81pnXMN2COHqfGHR2fEOPOcCjaaR+QztB36DDelxJ8vHalGt28+xA0gO1xfre8
         bs3qOvTJNP82HUPDyPbux7S5XokeWa+cub7rsy04qVmiz3UU2kyGhaAgSYpzJrq4RzGm
         2MQ65kvUEp9mgTPtInonnGRrioEvLEsIkU2xRPIWVu2bF9eF3Uu5+dZWrHJYrjfHlWOL
         BpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936525; x=1774541325;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICb79d2+sHzdxc1vylZi/q9n6G5oRRdWGzOcbuBbee0=;
        b=GEFWKvNNjwczdKtqIV4k6Q6dECQCTFH8HtcFc8v/9ubokYz76TTEEQ24EkqkMclH0U
         80hEHQfCJ79Gq0+MVbt2KE0WAX3UXz3IU4Sgh6F026T1t6QLTQTJmR8mu0fCkGenu84Q
         VnTpKNgBi39LPgX2S0RJrokue+8bBLkosqodd7lKD57d5M5tsZdRuwiLFgdp4qYYTQH7
         XegiyUvkfSo4tWw2Ra+1EfwyOwlh7Pk9NEjkes4/vsRpHvueBCC/vR6qvODXA/a/IA8P
         LWcMbVUXQAlf9Y57oLsxJjKz70Hk+fgr7HKniWJF9vSImkcSPtJQcxtymHx+3zRgazv+
         hNmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQJ8NynlALmDz9h82V/Ou9H5ahTxA1MtnrENQGZnYSDGZLqumZLthJcD0dLPscqiO/KBofSMhVAI7ggMFX@vger.kernel.org
X-Gm-Message-State: AOJu0YxjTjmFw0jSowXcSXiOCREiu1kYSHCi1uV2VigSa4E5eApUQZ4l
	rosVpdwR1KxyrP4bUiHCiqzUiix2roCgosxPz8lDFJVeLYHyeecIt6MvOoqWtdtNQcQ=
X-Gm-Gg: ATEYQzyAA7wajigSyetTsojPJkmTOgg5HN8Y7HyZ7aa4gULKDlcdlYa8AORvkXcblpJ
	vbPcsf13uLjhhP4llt45C3Eml+Phq1nz6yIo76DAw7p+KqQvpj1QgRgX+IkOW4atfAcjV38MPY5
	MuyLh9tCZGxsMLyaJ3PzIP8Ax15tfMSj9gq50yWpEdUS1ai+JLOOg6QXaDdjxIbtDq1FMOc4WDV
	mv2BjIAFZCBqr76EVw6D1rXzNeBLI9UtvWtb/v0ZQPgcvmpJc3xMHm/YTwuecdnAyXbQXwmMrNl
	+K9h6kga+1L7tO5zEte7ysr/07ORx0C/CtRjTkEubL9ZnFd3QatYh9m9KB7ylU+zuMP36yGcc0O
	ihSTeL2ZETC6oe2bnMPsaadmtSDIByQeVOrKPe26h7wr/OhJ8ZNn7XNIMg/poPz+RSGTqzJmVK2
	Hw4dTmvqXNN+ui4jAsJTLUOYoDitUkZoupYZPUhvbpHDGYOV3uxqqIIYunZ6OAXcono9jUX25eL
	VOsUbM=
X-Received: by 2002:a05:6000:2511:b0:43b:4faf:a49f with SMTP id ffacd0b85a97d-43b527cb31amr14507158f8f.50.1773936523323;
        Thu, 19 Mar 2026 09:08:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7? ([2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51899617sm17403918f8f.31.2026.03.19.09.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 09:08:42 -0700 (PDT)
Message-ID: <7eda931a-f30e-4e01-a130-996ec7f450d1@linaro.org>
Date: Thu, 19 Mar 2026 17:08:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
 <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
 <26XTdUyQTB41Oc4D5HnMtSm_QpZRjlkljQRJVw-u1Zp3Ltn9s4LVU-LQkP6drdl3Z3GGssLCCbsVYPFEqssHcQ==@protonmail.internalid>
 <65e06b2e-eeb9-45af-97ac-4ae60f652361@linaro.org>
 <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
 <d6616fc0-75fb-47e2-96cd-ae81fa1a8e82@linaro.org>
 <f3c62284-ac78-42c6-a4f0-cd984b7124cd@linaro.org>
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
In-Reply-To: <f3c62284-ac78-42c6-a4f0-cd984b7124cd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-98794-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: CCAEC2CEB00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 16:18, Bryan O'Donoghue wrote:
> On 19/03/2026 14:56, Vladimir Zapolskiy wrote:
>>> There's no reason to remove that from CAMSS - it would be an ABI break
>>> in user-space anyway.
>>
>> If technically CAMSS CSIPHY could be excluded from the list of CAMSS media
>> subdevices, then for the sake of simplification it should be done for all
>> supported platforms in advance, such a change will be independent from this
>> particular phy series, and vice versa, this CAMSS only driver change will
>> prepare a ground for media-less CAMSS CSIPHY device drivers, hence it shall
>> precede this particular CAMSS CSIPHY series.
>>
>> For backward compatibility with userspace a noop stub will be good enough,
>> it's not an issue at all.
> 
> The standalone PHY driver doesn't require removing the CSIPHY media
> entity from CAMSS. They serve different purposes and coexist - its important to have a NOP from user-space perspective for legacy and indeed for new implementations.
> 
> How the PHY gets represented in the kernel is of zero interest to user-sapce.
> 
> That said, stubbing out the media entity is independent work that can happen in any order and IMO is a separate debate. Whether or not CSIPHY init sequences live inside of a monolithic CAMSS driver or live inside off a discrete csiphy driver is not related to the media graph.
> 
> Happy to have that debate - and if indicated, carefully apply patches separately.

So what does this actually solves ?

Neil

> 
> ---
> bod


