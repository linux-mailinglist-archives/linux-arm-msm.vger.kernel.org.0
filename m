Return-Path: <linux-arm-msm+bounces-90582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD5DAXCJd2m9hgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:34:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 768CE8A308
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F753307FC35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 15:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80ECB33F8C5;
	Mon, 26 Jan 2026 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQ0xE49k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D8133EAEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441338; cv=none; b=nPYeFHOwRa3iEtaO8y4Ey4hlICpL3g4QhTtyyLjrGd2EWUEHRaVSlv5LWmtea7fY+CL1a1lPpEqszm55gFc+bS6Bim2xUEyvdtYoJASfUQGAcORZKoNd06LxZPSXf7WDj9MDnuftFjQ/jALUY7rLtKEEwRexb+pLvUKsciiIflY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441338; c=relaxed/simple;
	bh=PfvVt7hbSX5YclcFRIUb4bEbcp7jIX1EdCWeEyWNDi0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=J3zC5Mf/Fe6WvWetwpsk8YOzG4KYSxcy49cWWSw9CK0QzJ9xCpYemWUaKoV9NubrWTrKA0XklnYziCquAW5o/gZ658a/Icspj7b21IfyVHhvSPYJrUMaEwcYvKpY4BqlsrL28phkHpeiQ9iPaRxE5lPeAOjzspSLh8U1Oxt8Tvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQ0xE49k; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2842141f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769441334; x=1770046134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QD2HqzdqlPsbjYScrcAvVLLflbu8bDsCv6JnIs+Ud5A=;
        b=iQ0xE49khzyIYZ3NZaICJLbvZH+g6iNfg68AhTYN0cLaS4BCu62VZwXGT5iXIuiUaz
         DR35ASv+NZbN7XC5wcQxmp7jwYO+pUb3OF8hQY4ztTfTuSZc2AZF9bd0pZ1FppkDGlso
         cnuAw9QmkXGxb0T5KnRos5pfTJY/o5xqV1uz/gN4OTm7m+UhGZJ9P8Vsxad9qXAxk2Tq
         0MacfvB/04R/KUEzVz5/EYXFfmvykPOiKoLMvEUseQ0+yUSi7yfoh++CjX8vjFco2YRE
         iZlusJlFaAUOhVBEFlYvJ1KJpb6/47bTlGDkMcb9aNRmig7gi9aPj41dlmryMk1gb1Jx
         kqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441334; x=1770046134;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QD2HqzdqlPsbjYScrcAvVLLflbu8bDsCv6JnIs+Ud5A=;
        b=EHTrmps6QHkSZrx339gEoBcfCbnoFWe4eVvYnpGTIHzcsdA6Ifij+dcQtZUgd9fqdh
         UUiqRor7Ub88rbNKydSTHVKIf7G4E6IiaCTJsp/+0U5FzBG5llMkU/JWCRNoo1Pc/ik8
         XBVVrtqRm2GnFcplAAVO/ZdsTqlgq8uAZ8yP1W8nHOKFDNS02RwrvzP8zDHmoZ8hDvJi
         LEQhnzIiVaTGqYD6LtvU1p/TXpSjb3KBFM5GWGyVPX2LBtfLhfUPbxMFdh6O5n1N7+Dn
         vyCHm+j/3bcNqAHzwDI6X6TbMTdd8fzvdZ8MKZpBOvdBwGznH6QOVVmbcurRRDzuhCat
         BixA==
X-Forwarded-Encrypted: i=1; AJvYcCW+9KrhpnbHMccPonMNLBtKETOvWK76Ni622ghSvBQmywhwcrzit9bDh7Wjn+ndrrx83KpZPbtlDuK2GpwA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz259/MMrwPNrLyZ7CjOcBbn0HVFyOkOF0m99uzblfI1wB4MVXc
	5ZHH6guDEt5H46YXodiWjUYfRxwWYsYs+qK2DQu4e4z2aTpZHGq2/ldiAucgbH1WBF4=
X-Gm-Gg: AZuq6aIkuM3MPNRu5D/IJKXJaA8RJ+s/bjcZUQi1N2dlCaJyRMR+I4mEvqxCTauOnmu
	yY0wcGqQd0enCTqfoqiY5Wltk0kiOPbJeadcdZnD2bT1Uotaijx66pnV/X015PYLJMoEZSCxhh2
	OchZ2fU9AbhgfHlvim+m+zX3mPwGZcHXwBOKFHAw6+bGXXlYsRcHPggnEdQVutOBV+Bl8QaOvPp
	SbOyiFuwvUEms3awJMR31fBUbx0i2/hbYIuT5MXiMdMilhkePAbWmhejQc1M0La7BREOxuuu+tL
	ydgNbGFFdrKMns0CPq4FkTXXzAMZz8PyRwW4n0yMhn7PY6IxwZRU3CcxnG9ipU4S4wX5p4Z4juK
	RcAAnCR+P7Wg7xi1LgUqpf1NSZzYt6ZNuckjvSwAPo98K4HRD5DXMwxPBpRZJUHXK9ymicrhBP6
	ubD2KLxnBYbMoYjSKYsLRHRwg+KroCwUC4SLcSGT6xge1Hr/TBV3P7kHgfJP6gTbs=
X-Received: by 2002:a05:6000:26c4:b0:432:a9db:f99d with SMTP id ffacd0b85a97d-435ca1ad95dmr7512316f8f.36.1769441334256;
        Mon, 26 Jan 2026 07:28:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9836:4e25:3927:bcad? ([2a01:e0a:3d9:2080:9836:4e25:3927:bcad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e717cbsm31135410f8f.24.2026.01.26.07.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:28:53 -0800 (PST)
Message-ID: <db981d2c-1432-4b63-a5c0-0008be811bdf@linaro.org>
Date: Mon, 26 Jan 2026 16:28:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add WSA2
 audio ports IDs
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, ravi.hothi@oss.qualcomm.com, =?UTF-8?B?5ZCRIOaXpeiRtQ==?=
 <kancy2333@outlook.com>
References: <20231019153541.49753-1-krzysztof.kozlowski@linaro.org>
 <06a2c115-278a-47e0-b5ba-74639b6b23aa@linaro.org>
 <0e34c780-3634-4ca1-954f-c74dc566c7cb@linaro.org>
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
In-Reply-To: <0e34c780-3634-4ca1-954f-c74dc566c7cb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[linaro.org:server fail,sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-90582-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,quicinc.com,perex.cz,suse.com,vger.kernel.org,alsa-project.org,oss.qualcomm.com,outlook.com];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 768CE8A308
X-Rspamd-Action: no action

[replaced krzk's and srini's adresses with korg ones]

On 10/23/23 13:41, Krzysztof Kozlowski wrote:
> On 23/10/2023 10:37, Srinivas Kandagatla wrote:
>> Hi Krzysztof,
>>
>> On 19/10/2023 16:35, Krzysztof Kozlowski wrote:
>>> Add defines for audio ports used on Qualcomm WSA2 LPASS (Low Power
>>> Audio SubSystem).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>    include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>>> index 39f203256c4f..c5ea35abf129 100644
>>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>>> @@ -139,6 +139,11 @@
>>>    #define DISPLAY_PORT_RX_5	133
>>>    #define DISPLAY_PORT_RX_6	134
>>>    #define DISPLAY_PORT_RX_7	135
>>> +#define WSA2_CODEC_DMA_RX_0	136
>>> +#define WSA2_CODEC_DMA_TX_0	137
>>> +#define WSA2_CODEC_DMA_RX_1	138
>>> +#define WSA2_CODEC_DMA_TX_1	139
>>> +#define WSA2_CODEC_DMA_TX_2	140
>>>    
>>
>> Patches looks fine as it is, but do you realize that this s a dead code
>> w.r.t upstream.
>> WSA2 is used only with 4 speaker setup and in such cases we use WSA
>> codec dma to drive 4 channels.
>>
>> So WSA2 will not be used by itself.
>> I would prefer support for this to be added when we are really able to
>> test WSA2 by itself.

Sorry to dig a very old thread, but I'm hitting an issue with this on the Ayaneo Pocket S2.

The soundwire speakers are connected to the swr3 which is connected to WSA2, but nothing is connected
to swr0, so in order to play audio on those speakers the channel mask should be set to 1100, the lower
bits representing the WSA channels and the upper bits the WSA2 channels.

In the current setup, we can only pass num_channels, which will fill the mask as:
active_channels_mask = (1 << cfg->num_channels) - 1

So it's currently impossible to setup the mask for WSA2 only, and since the WSA2 lpaif_type doesn't exist
we cannot use that either.. With some small hack in sound/soc/qcom/qdsp6/audioreach.c we can set the mask correctly
but could you help figure out a proper way to handle this ?

I guess that in addition to min-channels & max-channels of DEVICE_SG_ADD() we could pass a mask ?

Neil

> 
> OK, the patchset can be ignored.
> 
> Best regards,
> Krzysztof


