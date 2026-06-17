Return-Path: <linux-arm-msm+bounces-113533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 63hXNzRzMmqb0AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:13:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8DF698550
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:13:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=bY2BrTHA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113533-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113533-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5151302CDBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9124F3DA5D1;
	Wed, 17 Jun 2026 10:12:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942683DC861
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:12:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691163; cv=none; b=i9C6OS2Z0ND9BmR52y3c55tdk+zaw2Et1drdpZooTa8IWkebyT6y3TgLf/TXvGpmUeR1/KVokSezRiHCO7BE5N8oBhGou2DgR/h0tg2Uos/dmhvX8ulNbHlnywKrsqOYVS+M12UxTlGDT44gDBZSatHM8DDcthPxYV2iW3tV/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691163; c=relaxed/simple;
	bh=BysS5DE5SQ4JcGg29SHsYYeFCMkJUMHJLEJ7VMQuFyo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pH2kSM6Lik+TFTK2RnczNTIESwBWg9GL9wqf+njg7Cx+SlgwZ8vFZGQmQCASMb2xZhkT8jzv8QMk2MBvlFWyNSQ0V5sK/Zx5cVy4gn5+/koCWmLdwb+IjVQuBscZ76+3wmb/A6xsY7TfYm2JDLzx8Bu7lbQi1prSpWsUIdR9KtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bY2BrTHA; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so4172885f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781691159; x=1782295959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ct0Hy4xHFL/4fAYc8KtuCQL880liqSZIqsPpgmzHFEE=;
        b=bY2BrTHAT6PENzKO77Uc8DB7ycJFYBkGLP71QXWK3rYFpC54ZORDEIksB1SWJlr3n3
         LJiKauZ1d405izYMetCn/qoA7NKypsRtf94d0ANili6Ryd4TaMGMdQQYJCq0RbrHaNmo
         ABuedFZLA0iaUAHKVbRGmkfYuoUBcD9DerjoWr3P6cJ78qqjHXeq9kwB1bJyI91ycQrG
         xbEoQv2ZymO6hKWNt5BP3JpO4RGU/2fFLMDitz1PZkzM92BOno9ByBPhtikJKQjS7ThG
         fUi27gjLxFh3SqXeh+kOolTt5t6cMLrxXQzQbR3Qn3ouv/S/4WpMpi6NUJK9zCLt8gwO
         B6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691159; x=1782295959;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ct0Hy4xHFL/4fAYc8KtuCQL880liqSZIqsPpgmzHFEE=;
        b=iqO7fCevZvoEI0Me2j5SLH9FelgTQanigtSS7b8iz0Dv/U70jjCJKXdxkC3a2e/O9R
         TnsLV9O2WSel9CmZ/XeYmXU0bng7kNZ0Rklim/Ue6NGKfR/KIqBCDos67xpWnq4cHwcE
         3b4dHvOa6peWHRyg/FumnV0wjTfCipjaL6rZqQQIKWosgYd6HrUqNaOA2tcO8bUcBI5p
         +tF4Eyl7MdqwWUcNE2jN+M3URZR6miUohbjMFJ055QeBg0tWsYS8K7oLY5IYCdbIHK+W
         1t3UbMC1t2JzlE4h4KIPUYdee4/AF8odS+XVwsuetqMUMkvG+z5CZWtnypJYiZx5MkSA
         zNsQ==
X-Gm-Message-State: AOJu0YzGyEMRpZ/U2bcCdQEajggmoS3+6PkM3JV56VcAcy43VerVsTkp
	gTBfv57hzNm7UJu6hueRcSLyN08VpVR73E8jTnPWuiMgK4A+fTzWMex9SaEEvhYxwAg=
X-Gm-Gg: AfdE7cnHVWphcVBVRHY2ILeAUp7n8NZsjzf474mXjVuBNjYAp4gCfQHE0QoEJeFZaaF
	hjZ8osNShvT6aUJvMkIGmFwfYMjLM32fw2TGXTtrc2+9HJjMs8YmwSL7X7PxxVCUFipIs6V1ERR
	/Lh3yENO9dtNxU1gZ4lvYuD2Y6pdb+ASD3VFXy89XgV/rXEwkUgD3AwTZTJwop9Z6eblPiJI8R7
	XGaNYsBgiJdcma7ADCHd2OCudt/nw6na2tXrpPI9MD2GLkfNDrDuL0sbd8CH8XYAPiUScefXEpO
	tWaQg6mGFVYGNW6+Kb5F1hjkOsJVXkB659OiWrW9Gg84P5cOTaolstYkriYJiA4i++Kxn2rHl5j
	VUfldWQVeSJYzKnH93/YuGAbdZOlQ3NaBPUQplt1x2b4QKOnf4t3NWYUyLOVLUveO+Y1fW4P1/B
	4UYEEI94sxJp0F6c16tfU3eQ==
X-Received: by 2002:adf:fcca:0:b0:45e:f302:95b with SMTP id ffacd0b85a97d-46238f972damr3707279f8f.37.1781691158602;
        Wed, 17 Jun 2026 03:12:38 -0700 (PDT)
Received: from [10.12.4.106] ([212.133.41.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2cf5d9sm46101981f8f.32.2026.06.17.03.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:12:38 -0700 (PDT)
Message-ID: <f6844aea-a7b0-4b2f-877b-bdfdc2bbb7da@linaro.org>
Date: Wed, 17 Jun 2026 12:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
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
 <831ed020-4a1f-46af-95c6-38ef1f875fd1@linaro.org>
 <bae5b5be-16a9-4581-9863-4ca4eca88754@oss.qualcomm.com>
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
In-Reply-To: <bae5b5be-16a9-4581-9863-4ca4eca88754@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113533-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:replyto,linaro.org:mid,linaro.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A8DF698550

On 6/15/26 18:48, Konrad Dybcio wrote:
> On 6/15/26 6:39 PM, Neil Armstrong wrote:
>> Hi,
>>
>> On 6/15/26 17:55, Konrad Dybcio wrote:
>>> On 4/30/26 10:58 AM, Jishnu Prakash wrote:
>>>> Add macro definitions for virtual channels (combination of ADC channel
>>>> number and PMIC SID number), to be used in devicetree by clients of ADC5
>>>> GEN3 device and in the "reg" property of ADC channels.
>>>>
>>>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>>> ---
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> And what happens with my patch [1] ?
>>
>> I had zero feedback so far
>>
>> [1] https://lore.kernel.org/all/20260504-topic-sm8x50-adc5-gen3-v2-1-5cc04d6ecda0@linaro.org/
> 
> I think this approach (single generic header) is better. The existing
> ADC7 bindings which your series draws inspiration from come with a ton
> of boilerplate.
> 
> There are some non-trivial mappings in there though, e.g.:
> 
> +#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_100K_PU)
> 
> but these would presumably be deducible from downstream

I'll try to rebase on this patch, seems all the values are defined, I just need to match the old and new defines

Neil

> 
> Konrad


