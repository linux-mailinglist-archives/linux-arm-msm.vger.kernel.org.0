Return-Path: <linux-arm-msm+bounces-113227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yynfJc0rMGqwPQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:43:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F86887F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:43:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=gPib3msO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113227-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113227-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1EFB304B288
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5716040DFC0;
	Mon, 15 Jun 2026 16:39:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A0640E8D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:39:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541573; cv=none; b=UddunOrV9aw6PuxpPc/E99ahcY+ShW/p1lJIhNACM7Xdp/Ojac/AgcAwP6pz0+Uo1HoajgWb+6GqJZOHCOqqRqa07I57TMII/fM1F49rGFWADX/Oqk3ucLdJ7grbDttoutHgoahBIIDZYBepyaZJY5hQcBfRQiRTep+r7ZSji1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541573; c=relaxed/simple;
	bh=PinZeU6ZFTvsqgRx9PSx0PJyo2g8IsvsiyyekgnBBFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMdLUPNneofBZOUqRyR0aR2ewlO0eNH+8551v3EsFeEmQHzUrAoIbPwld7WVcdTWcyKPF/LxNPTfq2aUjKNrVlOmhoNnJJLX8yiR4vBYs4Zn1BwCYHMDvWVbECXf218nTIwcE9oK9ZYlhkVWPfzmS7dJL6z/MUYETi6aXzaAYd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gPib3msO; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso17387185e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781541569; x=1782146369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEnc7IU386ndnILVQYV7G4oksFbgz8rGdzJQI/dF1ZE=;
        b=gPib3msO2D5VMmPFaoIDaTje7Z+4sZUdNXdKmqvftvu39DCI9wHRxVMAtPpBLN1mp7
         IsGfSdq1OAbyRX+2R5pRqoDjfXvmP5d3xDvKuMVJ4e7VT4A3ZCVydX30GXV1oelkb+uE
         w6OEXWAxWV5NF+oObnt/5kBePjjZCjzFp2shhCG3bvZcOK2xNoKuCKRziF+19LNhQH3i
         c2uqXXGeFLu+Ogw7d5hiVN3rzQ7rBO1pjIAw0f/I9Xms/2M8Eh5rd1Mk6D9AcXabfKII
         EA5yzHGRdnN7OJ4NHqoqGIOCASjaHTg3ql8P5FvVyr5QzESUhMC+wm6EOuglQCeETUKB
         aUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541569; x=1782146369;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEnc7IU386ndnILVQYV7G4oksFbgz8rGdzJQI/dF1ZE=;
        b=imfSlvPw5V0UsjNSPeIR/OqaV4iSlfT2gtXI35anY6GK6/XZJOy+PaL4nSx/J8tqDN
         +eS9UTixLUH2wzpRhyT8C4smJvNJ+x5FfhwCxhTS5ZiRt8GB6fSJmOvANGRFREgvoiOK
         3jEuCNg2jZsI3eHeWW1+cvOq9sKKWbmYtc1fBr0QIm3sJWKHSULTZDLLCxWmhwY1qfLs
         gFk9dKniBNTu99FGgKXWv8erh4l3jzGvyI/ChJiNDU8QtF6dBTPpRAhKFGcWGDtmOBhl
         8plrM+Tgj4tcVXIZswTfIovle3v0hLbGvyFra8KNhFNTDGJTefMSxzFTQFyPI4rbWhs7
         lW/A==
X-Gm-Message-State: AOJu0YyJG4Irdx9vJGghW/qP/bEvtzkawmQF1jBd5Z9EPqolj6/y/eTW
	0R2T9OBBoTUaz6ChApGWymEgkPIMyFcAjWUVJBFDebB6CCiKPpncBCBKw72tVuFCt4c=
X-Gm-Gg: Acq92OH8XJoPl5ZLMXGtveI2Sid8jdIcuSK5Cea+k2+inmMyWgk/QcZObMIJiwlEr13
	d0v0CwrWZ0r/4iyU3heN6lMTvxnwG4K5jhwodegdtA+Tn7VfePThpL+3nYzK+q1cwJoL0s3IbkA
	+nLkCw7p90gIukAsmiZJgFdCQbRJdvhYlG0cIidRA+5TTb5UFZE+wKhCcn4m09PIoizRELWxaAJ
	XVQJFSUJDed7HTIeqF+Vw4habJtNr8X5YPkTcZG/Ia2HnB1nag57sM8iKR3fTFB2jInjwtmskqF
	urWU1ipayu68NaVryO2h7nqIKxvv4eKtHKyfanaUr4tJ2ZKDNOEGY1AyZprbe/c6KRoh9Ap9D1T
	za2ragxHL4Cz4LzpnBau+zDfhiXzFX4qwwrb5ZduXGFjSFHZP5nqiWyINYXrSMEBG+1nzujnWmM
	5DIGswl0JMZPvwSg5Vb8l+LQY47ZSUYWrh8YEta5NTlBts05BxScq+ZpT/lLBYImZC//iWXi6KQ
	VXBVpk=
X-Received: by 2002:a05:600c:21da:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-490ec4c1712mr136532995e9.10.1781541568379;
        Mon, 15 Jun 2026 09:39:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8ff6:927e:47e7:5df7? ([2a01:e0a:106d:1080:8ff6:927e:47e7:5df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c5266sm41043307f8f.29.2026.06.15.09.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 09:39:28 -0700 (PDT)
Message-ID: <831ed020-4a1f-46af-95c6-38ef1f875fd1@linaro.org>
Date: Mon, 15 Jun 2026 18:39:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
 <60170148-2fef-4282-ad68-f784e4fdfe23@oss.qualcomm.com>
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
In-Reply-To: <60170148-2fef-4282-ad68-f784e4fdfe23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113227-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:replyto,linaro.org:mid,linaro.org:from_mime];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A0F86887F8

Hi,

On 6/15/26 17:55, Konrad Dybcio wrote:
> On 4/30/26 10:58 AM, Jishnu Prakash wrote:
>> Add macro definitions for virtual channels (combination of ADC channel
>> number and PMIC SID number), to be used in devicetree by clients of ADC5
>> GEN3 device and in the "reg" property of ADC channels.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

And what happens with my patch [1] ?

I had zero feedback so far

[1] https://lore.kernel.org/all/20260504-topic-sm8x50-adc5-gen3-v2-1-5cc04d6ecda0@linaro.org/

> 
> Konrad


