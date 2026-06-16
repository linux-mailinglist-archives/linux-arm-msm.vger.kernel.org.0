Return-Path: <linux-arm-msm+bounces-113446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id im0zFL9oMWqqigUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 17:16:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B67690DEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 17:16:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=id37jDTQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113446-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113446-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 079A730826BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D2B43CEF7;
	Tue, 16 Jun 2026 15:12:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152742EED7
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 15:12:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781622742; cv=none; b=Lyw2NZ9P07aEwacO6FDdNT6VKn2MDNuCcrtGvqvD/w8LkGgzU2WNY50eJKmPbse2eqqKlO40/5fsmNqdqO/KOalUJtgdrgSI9ZYGxxhTlrJ3uU7WYgApTYjWgBB6DptckPy9MLqaCmog1WJyGsdGCnkHJO1BjMHo0ytDOpbei6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781622742; c=relaxed/simple;
	bh=reWhnsUXA4J8bNLpaWzgqHd4V0TBZ2M5HbNmFLkfLKY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=omKLQqvyWW28Q763WfZ5O1WnrCc+neW8YsFM4rmB2cPW8HeEmaUx14/qTs7ul8abtihbNRkhs57kcd3kaNLFYsnFGHHyRe5/nkB9ghulFoFg7TK6mrSCmBViIYbnXDOKamzO/N1M5rUj0fgfaKMJkIxnVemlvd+0m+Sya7B2r2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=id37jDTQ; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4600cbb06deso2621157f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781622739; x=1782227539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZxv6iA7k0pSQBFbEcxAkbZ98OwX/xaAiQc6CH16UpU=;
        b=id37jDTQd+5Qr6ovo1S4evmFTDZpTaag4/IbgjdLI/Pu8tdBrZRsEe7ukp336FjVlC
         8buX8O8hGcGOqdQV7PLatDujDPtqzQjuFPTcpPsFTzfadMYUWjH4DxQ9oqh/09FOk4b3
         mIdia9hnMdLVovJV3Npa6Yn6/vRxsLyh+XqRWaOT7m4VZUvz5rthFwqBEnL0tXJqDpDG
         x0eYX8w3iC7Tf7bstyyiJ6dw6jYtH9wnMsnRmStpn2URO3Xzjc9WN5xHRwBzUR7HvDsb
         XMaj1ciWXyRIuYv34ZMbqAiyYIqb/1tgCaQv1lySCL9lNijG9rS9Hmo8m+QuTZHhma5M
         XBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781622739; x=1782227539;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZxv6iA7k0pSQBFbEcxAkbZ98OwX/xaAiQc6CH16UpU=;
        b=A8RMe86/1SicMzwcau3I90ciV7Sz2sQwoGGZTdaF80cYg9OYSGCuCPBtKGDNwuorbx
         4oKndXFC54jnsFULhUI8JUn+UGi124FsT9mP+Os2BkkiP4odArfIfg7b5BErDar5ASua
         Z0qN5fMPMHdJTWWozIZRWBDm7lnb6GlpTIHlN24oNhaMy932iCmif5vHvC0P/Mn5tv0f
         IqaJwbX7YMerjjyz0lSo+s1GXbPmMC43+T20Iwn01u93HOvMfSf/983PmF4sDFqscN2Q
         htqjCDAItt/xAVVKLb1qvZnMmYmF8FfsDPhJ+7sX8IanqRScdIp+5oQ1Ga1vN4fd0MV7
         LLaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/01mXdNrnF54mkKcxGvEMcPiTF7t713U0TZ4/x1fHjadd83e7LbRvhtRE43vtbwmfY7r5euvXnfARLOgBK@vger.kernel.org
X-Gm-Message-State: AOJu0YybPMfNRoa/Q650sXQQcAjHsDa9mhH7CCA3rxBiwJWZMLzEl0OT
	j2Q5yHRGiVPUVxMEJAUw1BEIJyayUzbEd/uegpcWzMJ8YC3oBY4vIrmsoqhgVoF7u5A=
X-Gm-Gg: Acq92OGwnKvZhczW8QmHxDrp+thLzkgNFpA74LQbWhPUWcLsqY/En5cOeBd06F3FmNP
	fkOy8Fd93CXlcWq9V7sFM4pWxEgpx7fKrSuO749mDhy+Zekjm9bkxvcKwE8v+8rbCxK6UlyZKwT
	w+r/xgfpvBHm7WApmgk1aQpWCMcI/zHo3wmkayN26f2HLd0U/ZHmTjtAALekRZJPhu3RCVUV/V3
	TVPYzme6lHG9C7GpQ9d98YmhWh38TDQCNo/3UyUlexJuMqddt8H6OZcZbl+lTuypaU5JA0YSv62
	iIPkIhlD2D/dKhw38fB1FhlMox6YlaLUTwK85XB/kk2hW2uOHgOqoCEq9JHzfVz+kiBM4QllK5l
	bhIWmHn8Z+pJq/qa/Cax0ASPOk477j0Z6I5KzypnjN6/b7Ov3mTL3sp7u1NroGcGWlLMXs1xywc
	abxEmxC4JmZqQB7oiJsy5lPN01It92U4seV3Bfwqg3Bc1AAxT4dgvqq2+MYFos58H5Wq22CwJC/
	t/nM0QIEA==
X-Received: by 2002:a05:6000:4b1c:b0:460:d1e:a59a with SMTP id ffacd0b85a97d-4622b271812mr178592f8f.8.1781622738379;
        Tue, 16 Jun 2026 08:12:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb14:150f:cf00:62e3:28a5:5976:18bf? ([2a01:cb14:150f:cf00:62e3:28a5:5976:18bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm46530468f8f.8.2026.06.16.08.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 08:12:17 -0700 (PDT)
Message-ID: <a35d7f95-c158-46d1-b136-b901dcfbf101@linaro.org>
Date: Tue, 16 Jun 2026 17:12:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] ASoC: qcom: audioreach: compute active channel maps
 from channel_map
To: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-1-18bb19c5ca22@linaro.org>
 <937aed10-9ec6-4ca4-bc60-db892121a416@kernel.org>
 <a5a957d0-a40c-424e-9d6d-622a4f624343@linaro.org>
 <05e15363-d49e-4a7b-82b3-0f07537b5366@kernel.org>
 <16d2e8e8-91bc-437d-8225-eb6eedb4bd8a@linaro.org>
 <f18fa22c-131c-409c-9c8b-3153e2272b89@kernel.org>
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
In-Reply-To: <f18fa22c-131c-409c-9c8b-3153e2272b89@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113446-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.com:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4B67690DEA

On 6/16/26 16:59, Srinivas Kandagatla wrote:
> 
> 
> On 6/15/26 2:54 PM, Neil Armstrong wrote:
>> On 6/15/26 11:36, Srinivas Kandagatla wrote:
>>> On 6/15/26 10:31 AM, Neil Armstrong wrote:
>>>> On 6/15/26 10:38, Srinivas Kandagatla wrote:
>>>>>
>>>>>
>>>>> On 6/10/26 8:41 AM, Neil Armstrong wrote:
>>>>>> The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
>>>>>> of 2 WSA speakers connected on the WSA2 lines.
>>>>>>
>>>>>> But the Audioreach DSP only handles WSA2 in pair with the WSA
>>>>>> interface by using the upper bits of the active_channels_mask
>>>>>> for WSA2 and the lower bits for WSA:
>>>>>>
>>>>>> /-------------------------------------------------\
>>>>>> | Bits  |     3    |     2    |   1     |     0   |
>>>>>> |-------------------------------------------------|
>>>>>> | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
>>>>>> \-------------------------------------------------/
>>>>>>
>>>>> No, this is not totally correct, if the setup only has WSA2, then
>>>>> channel 0 and 1 should be WSA2 channels.
>>>>>
>>>>> What is the backend dai id that is in DT, it should be
>>>>>
>>>>>       sound-dai = <&q6apmbedai WSA2_CODEC_DMA_RX_0>;
>>>>>
>>>>> I also noticed that you are using
>>>>> https://github.com/linux-msm/audioreach-topology/blob/main/SM8550-
>>>>> HDK.m4
>>>>> which has WSA as backend dai, that is not correct, you should have
>>>>> WSA2.
>>>>
>>>> So I did try that, and DSP would error out when using the
>>>> LPAIF_INTF_TYPE_WSA2,
>>>> but I'm retrying from scratch right now.
>>>
>>> Please share the failure logs, we need to change
>>> 1. dt : bedai id, codec dais with correct soundwire wsa2 instance, the
>>> routes.
>>> 2. tplg
>>>
>>
>> So I did all the changes as you suggested:
>>
>> Resurected Krzk's serie: https://
>> patch.msgid.link/20231019153541.49753-1-krzysztof.kozlowski@linaro.org
>>
>> Adapted/Fixes it to apply on v7.1:
>> https://gitlab.com/superna9999/linux/-/commit/
>> fd8cf1922d10175c5bcd8cf2a444c5825392d994
>> https://gitlab.com/superna9999/linux/-/
>> commit/0c4e89e167b9ca9c7b500577c030e550ec2a6e73
>> https://gitlab.com/superna9999/linux/-/
>> commit/6364a0a45a3f0985b872d9f504e9ea1d1f3f2a35
>>
>> ```
>> +#define WSA2_CODEC_DMA_RX_0    147
>> +#define WSA2_CODEC_DMA_TX_0    148
>> +#define WSA2_CODEC_DMA_RX_1    149
>> +#define WSA2_CODEC_DMA_TX_1    150
>> +#define WSA2_CODEC_DMA_TX_2    151
>> ```
>>
>> https://gitlab.com/superna9999/linux/-/
>> commit/9bd0ce21f73df92fb35e3db7ef570f561a106478
>>
>> DT:
>> https://gitlab.com/superna9999/linux/-/
>> commit/2fc270860e3b77ccae28e0c38228cba3e39ea78a
>>
>> ```
>> -                               sound-dai = <&q6apmbedai
>> WSA_CODEC_DMA_RX_0>;
>> +                               sound-dai = <&q6apmbedai
>> WSA2_CODEC_DMA_RX_0>;
>>                          };
>> ```
>>
>> Topology, copied the SM8550-HDK into a new one, dropped I2S and changed
>> all WSA to WSA
>> and added the WSA defines:
>> https://github.com/superna9999/audioreach-topology/
>> commit/12adc76859cde606c67e5a95df204b8d407038df
>>
>>
>> ```
>> +define(`WSA2_CODEC_DMA_RX_0', `147') dnl
>> +define(`WSA2_CODEC_DMA_TX_0', `148') dnl
>> +define(`WSA2_CODEC_DMA_RX_1', `149') dnl
>> +define(`WSA2_CODEC_DMA_TX_1', `150') dnl
>> +define(`WSA2_CODEC_DMA_TX_2', `151') dnl
>> ```
>>
>> Extract of the SM8650-APS2.m4 concerning WSA2:
>> ```
>> ...
>> +dnl WSA Playback
>> +DEVICE_SG_ADD(audioreach/subgraph-device-codec-dma-playback.m4,
>> `WSA2_CODEC_DMA_RX_0', WSA2_CODEC_DMA_RX_0,
>> +       `S16_LE', 48000, 48000, 2, 2,
>> +       LPAIF_INTF_TYPE_WSA2, CODEC_INTF_IDX_RX0, 0,
>> DATA_FORMAT_FIXED_POINT,
>> +       0x00004006, 0x00004006, 0x00006050)
>> +dnl
>> ...
>> +STREAM_DEVICE_PLAYBACK_MIXER(WSA2_CODEC_DMA_RX_0,
>> ``WSA2_CODEC_DMA_RX_0'', ``MultiMedia1'', ``MultiMedia2'', ``MultiMedia5'')
>> ...
>> +STREAM_DEVICE_PLAYBACK_ROUTE(WSA2_CODEC_DMA_RX_0, ``WSA2_CODEC_DMA_RX_0
>> Audio Mixer'', ``MultiMedia1, stream0.logger1'', ``MultiMedia2,
>> stream1.logger1'', ``MultiMedia5, stream4.logger1'')
>> ...
>> ```
>>
>> On device, all sets up without errors:
>> ```
>> [   20.710228] qcom-apm gprsvc:service:2:1: CMD timeout for [1001021]
>> opcode
>> [   20.720234] platform 6800000.remoteproc:glink-
>> edge:gpr:service@1:dais: Adding to iommu group 30
>> [   20.763797] va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry
>> missing
>> [   20.791279] wsa_macro 6aa0000.codec: using zero-initialized flat
>> cache, this may cause unexpected behavior
>> [   20.912445] wcd939x_codec audio-codec: bound sdw:2:0:0217:010e:00:4
>> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
>> [   20.923343] wcd939x_codec audio-codec: bound sdw:3:0:0217:010e:00:3
>> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
>> [   20.960741] snd-sc8280xp sound: ASoC: Parent card not yet available,
>> widget card binding deferred
>> [   20.972182] va_macro 6d44000.codec: supply vdd-micb not found, using
>> dummy regulator
>> [   20.985751] ALSA: Control name 'stream0.vol_ctrl0 MultiMedia1
>> Playback Volume' truncated to 'stream0.vol_ctrl0 MultiMedia1 Playback Volu'
>> [   20.998589] ALSA: Control name 'stream1.vol_ctrl1 MultiMedia2
>> Playback Volume' truncated to 'stream1.vol_ctrl1 MultiMedia2 Playback Volu'
>> [   21.011536] ALSA: Control name 'stream4.vol_ctrl4 MultiMedia5
>> Playback Volume' truncated to 'stream4.vol_ctrl4 MultiMedia5 Playback Volu'
>> [   21.026510] input: SM8650-APS2 Headset Jack as /devices/platform/
>> sound/sound/card0/input7
>> [   21.035151] input: SM8650-APS2 DP0 Jack as /devices/platform/sound/
>> sound/card0/input8
>> ```
>>
>> Available mixer elements:
>> ```
>> # amixer | grep WSA
>> Simple mixer control 'SpkrLeft WSA MODE',0
>> Simple mixer control 'SpkrRight WSA MODE',0
>> Simple mixer control 'WSA RX0 MUX',0
>> Simple mixer control 'WSA RX1 MUX',0
>> Simple mixer control 'WSA RX_MIX EC0_MUX',0
>> Simple mixer control 'WSA RX_MIX EC1_MUX',0
>> Simple mixer control 'WSA RX_MIX0 MUX',0
>> Simple mixer control 'WSA RX_MIX1 MUX',0
>> Simple mixer control 'WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia1',0
>> Simple mixer control 'WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia2',0
>> Simple mixer control 'WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia5',0
>> Simple mixer control 'WSA_AIF_VI Mixer WSA_SPKR_VI_1',0
>> Simple mixer control 'WSA_AIF_VI Mixer WSA_SPKR_VI_2',0
>> Simple mixer control 'WSA_COMP1',0
>> Simple mixer control 'WSA_COMP2',0
>> Simple mixer control 'WSA_RX0 Digital',0
>> Simple mixer control 'WSA_RX0 Digital Mute',0
>> Simple mixer control 'WSA_RX0 EC_HQ',0
>> Simple mixer control 'WSA_RX0 INP0',0
>> Simple mixer control 'WSA_RX0 INP1',0
>> Simple mixer control 'WSA_RX0 INP2',0
>> Simple mixer control 'WSA_RX0 INT0 SIDETONE MIX',0
>> Simple mixer control 'WSA_RX0 MIX INP',0
>> Simple mixer control 'WSA_RX0_MIX Digital',0
>> Simple mixer control 'WSA_RX0_MIX Digital Mute',0
>> Simple mixer control 'WSA_RX1 Digital',0
>> Simple mixer control 'WSA_RX1 Digital Mute',0
>> Simple mixer control 'WSA_RX1 EC_HQ',0
>> Simple mixer control 'WSA_RX1 INP0',0
>> Simple mixer control 'WSA_RX1 INP1',0
>> Simple mixer control 'WSA_RX1 INP2',0
>> Simple mixer control 'WSA_RX1 MIX INP',0
>> Simple mixer control 'WSA_RX1_MIX Digital',0
>> Simple mixer control 'WSA_RX1_MIX Digital Mute',0
>> Simple mixer control 'WSA_Softclip0 Enable',0
>> Simple mixer control 'WSA_Softclip1 Enable',0
>> ```
>>
>> I setup the speaker with (no errors):
>> ```
>> amixer -c 0 cset name='SpkrLeft PA Volume' 20
>> amixer -c 0 cset name='SpkrRight PA Volume' 20
>> amixer -c 0 cset name='WSA RX0 MUX' AIF1_PB
>> amixer -c 0 cset name='WSA RX1 MUX' AIF1_PB
>> amixer -c 0 cset name='WSA_RX0 INP0' RX0
>> amixer -c 0 cset name='WSA_RX1 INP0' RX1
>> amixer -c 0 cset name='SpkrLeft DAC Switch' 1
>> amixer -c 0 cset name='SpkrRight DAC Switch' 1
>> amixer -c 0 cset name='WSA_RX0 Digital Volume' 85
>> amixer -c 0 cset name='WSA_RX1 Digital Volume' 85
>> ```
>>
>> and finally:
>> ```
>> amixer -c 0 cset name='WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia1' 1
>> numid=216,iface=MIXER,name='WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia1'
>>    ; type=BOOLEAN,access=rw------,values=2
>>    : values=on,off
>>
>> ```
>>
>> When playing sound, it just timeouts, no printed errors:
>> ```
>> # speaker-test -D plughw:0,0 -c 2
>>
>> speaker-test 1.2.14
>>
>> Playback device is plughw:0,0
>> Stream parameters are 48000Hz, S16_LE, 2 channels
>> Using 16 octaves of pink noise
>> Rate set to 48000Hz (requested 48000Hz)
>> Buffer size range from 960 to 130560
>> Period size range from 480 to 16320
>> Periods = 4
>> was set period_size = 12000
>> was set buffer_size = 48000
>>   0 - Front Left
>> Write error: -5,Input/output error
>> xrun_recovery failed: -5,Input/output error
>> Transfer failed: Input/output error
>> ```
> 
> Thanks Neil for trying this out, I had pretty much simillar behavoir on
> Glymur device too, My understanding was that there are some codec DMA
> instances where we can use 2 channels as default for WSA2.
> 
> But on Glymur all the DMA instances are 8 channel wide. Am trying to
> check internally to see if its actually doable to get this working with
> the ch1 and ch2 mask.
> 
> Am working on this to get more details on what it takes to get this working.
> 
> 
> Only concern with this patch is that the channel mapping, which does not
> reflect the channel mask. can you confirm that in your working setup you
> have chmask as 0xC0 and channel_map setup for ch1 and ch2?

Yeah 0xC0 for active_channels_mask and channel_mapping = { PCM_CHANNEL_FL, PCM_CHANNEL_FR };

I tried to keep the leading 0, but since the channel_mapping table is allocated with
the size of the num_channels parameter, you can ony have 2 entries.

> 
>  From DSP docs:
> https://github.com/AudioReach/audioreach-engine/blob/master/fwk/api/modules/media_fmt_api_basic.h#L780
> 
> Channel[i] mapping describes channel i. Each element i of the array
> describes channel i inside the buffer where i is less than num_channels.
> An unused channel is set to 0.
> 
> 
> So unused channels should be set to zero, but the patch padding the
> channels starting form zero.

My understanding in my trial and error is that the DSP will map each
entry of the channel_mapping to the active_channels_mask bits in order
so you can have a non linear active_channels_mask like b10101010 which
has 4 channels active and pass a channel_mapping table with 4 entries.

The is what I implemented here, and it gives a lot of flexibility on how
to connect speakers to the interface.

Neil

> 
> -srini
> 
> 
>>
>> Neil
>>
>>>
>>> --srini
>>>>
>>>> Thanks,
>>>> Neil
>>>>
>>>>>
>>>>>
>>>>>> Setting only the WSA2 upper bits is perfectly valid and
>>>>>> functional but the current Audioreach code builds the bitmask
>>>>>> from the channels count with:
>>>>>>       active_channels_mask = (1 << num_channels) - 1;
>>>>>>
>>>>>> In order to enable the WSA2 bits the channel count should be 4,
>>>>>> but the lower WSA bits are then also enabled and the DSP errors
>>>>>> out when trying to play on the disabled WSA interface.
>>>>>>
>>>>>> A solution would've been to add a fake WSA2 topology element which
>>>>>> would be translated into the top bits only, but it's not clean and
>>>>>> add some special exceptions in the generic Audioreach code.
>>>>>>
>>>>>> The solution suggested by Srinivas is to use the channel mapping to
>>>>>> set this bitmask.
>>>>>>
>>>>>> This works but makes all the other calls using the channel mapping
>>>>>> fail
>>>>>> because the DSP requires the channel_mapping table to start from
>>>>>> index 0
>>>>>> and using num_channel length in order to apply the mapping on the
>>>>>> active_channels_mask bits in order.
>>>>>>
>>>>>> So we need to skip the empty channel mapping entries in all other
>>>>>> users of the channel_map to build valid channel_mapping tables.
>>>>>>
>>>>>> This should not break any other usecases since the default channel
>>>>>> mapping always start from index 0, and will add flexibilty to allow
>>>>>> some special non linear mapping for other interfaces as well.
>>>>>>
>>>>>> Suggested-by: Srinivas Kandagatla
>>>>>> <srinivas.kandagatla@oss.qualcomm.com>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>>     sound/soc/qcom/qdsp6/audioreach.c | 47 ++++++++++++++++++++++++++++
>>>>>> ++---------
>>>>>>     1 file changed, 37 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/
>>>>>> qdsp6/audioreach.c
>>>>>> index a13f753eff98..9b80cfa56e8a 100644
>>>>>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>>>>>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>>>>>> @@ -703,6 +703,7 @@ static int
>>>>>> audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>>>>>>         int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
>>>>>>         int size = ic_sz + ep_sz + fs_sz + pm_sz;
>>>>>>         void *p;
>>>>>> +    int i;
>>>>>>           struct gpr_pkt *pkt __free(kfree) =
>>>>>> audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
>>>>>>         if (IS_ERR(pkt))
>>>>>> @@ -741,7 +742,12 @@ static int
>>>>>> audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>>>>>>           intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>>>>>>         intf_cfg->cfg.intf_index = module->hw_interface_idx;
>>>>>> -    intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels)
>>>>>> - 1;
>>>>>> +    intf_cfg->cfg.active_channels_mask = 0;
>>>>>> +    /* Convert the physical channel mapping into a bit field */
>>>>>> +    for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
>>>>>> +        if (cfg->channel_map[i])
>>>>>> +            intf_cfg->cfg.active_channels_mask |= BIT(i);
>>>>>> +
>>>>>
>>>>> This one looks good, this should be a bug fix patch.
>>>>>
>>>>>>         p += ic_sz;
>>>>>>           pm_cfg = p;
>>>>>> @@ -840,7 +846,7 @@ static int audioreach_mfc_set_media_format(struct
>>>>>> q6apm_graph *graph,
>>>>>>         uint32_t num_channels = cfg->num_channels;
>>>>>>         int payload_size = APM_MFC_CFG_PSIZE(media_format,
>>>>>> num_channels) +
>>>>>>                     APM_MODULE_PARAM_DATA_SIZE;
>>>>>> -    int i;
>>>>>> +    int i, j;
>>>>>>         void *p;
>>>>>>           struct gpr_pkt *pkt __free(kfree) =
>>>>>> audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
>>>>>> @@ -860,8 +866,12 @@ static int
>>>>>> audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>>>>>>         media_format->sample_rate = cfg->sample_rate;
>>>>>>         media_format->bit_width = cfg->bit_width;
>>>>>>         media_format->num_channels = cfg->num_channels;
>>>>>> -    for (i = 0; i < num_channels; i++)
>>>>>> -        media_format->channel_mapping[i] = cfg->channel_map[i];
>>>>>> +    /* Convert the physical mapping to a logical mapping of the
>>>>>> channels */
>>>>>> +    for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg-
>>>>>>> num_channels; i++) {
>>>>>> +        if (!cfg->channel_map[i])
>>>>>> +            continue;
>>>>>> +        media_format->channel_mapping[j++] = cfg->channel_map[i];
>>>>> Each element i of the channel_mapping[i] array, describes the channel i
>>>>> inside the buffer where i is less than num_channels.  An unused channel
>>>>> is set to 0.
>>>>>
>>>>> For some reason I get impression that user is trying to set a 4
>>>>> channels
>>>>> instead of 2 channel.
>>>>>
>>>>> Can you fix the backend-dai id and play it directly on WSA2 instead of
>>>>> WSA.
>>>>> Or was there a reason for not doing it otherwise?
>>>>>
>>>>> --srini
>>>>>
>>>>>> +    }
>>>>>>           return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>>>>>     }
>>>>>> @@ -1080,6 +1090,7 @@ static int
>>>>>> audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>>>>>         struct apm_pcm_module_media_fmt_cmd *cfg;
>>>>>>         struct apm_module_param_data *param_data;
>>>>>>         int payload_size;
>>>>>> +    int i, j;
>>>>>>           if (num_channels > 4) {
>>>>>>             dev_err(graph->dev, "Error: Invalid channels (%d)!\n",
>>>>>> num_channels);
>>>>>> @@ -1113,7 +1124,12 @@ static int
>>>>>> audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>>>>>         media_cfg->num_channels = mcfg->num_channels;
>>>>>>         media_cfg->q_factor = mcfg->bit_width - 1;
>>>>>>         media_cfg->bits_per_sample = mcfg->bit_width;
>>>>>> -    memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg-
>>>>>>> num_channels);
>>>>>> +    /* Convert the physical mapping to a logical mapping of the
>>>>>> channels */
>>>>>> +    for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg-
>>>>>>> num_channels; i++) {
>>>>>> +        if (!mcfg->channel_map[i])
>>>>>> +            continue;
>>>>>> +        media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
>>>>>> +    }
>>>>>>           return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>>>>>     }
>>>>>> @@ -1127,6 +1143,7 @@ static int
>>>>>> audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>>>>>>         struct payload_media_fmt_pcm *cfg;
>>>>>>         struct media_format *header;
>>>>>>         int rc, payload_size;
>>>>>> +    int i, j;
>>>>>>         void *p;
>>>>>>           if (num_channels > 4) {
>>>>>> @@ -1166,7 +1183,12 @@ static int
>>>>>> audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>>>>>>             cfg->q_factor = mcfg->bit_width - 1;
>>>>>>             cfg->endianness = PCM_LITTLE_ENDIAN;
>>>>>>             cfg->num_channels = mcfg->num_channels;
>>>>>> -        memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg-
>>>>>>> num_channels);
>>>>>> +        /* Convert the physical mapping to a logical mapping of the
>>>>>> channels */
>>>>>> +        for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg-
>>>>>>> num_channels; i++) {
>>>>>> +            if (!mcfg->channel_map[i])
>>>>>> +                continue;
>>>>>> +            cfg->channel_mapping[j++] = mcfg->channel_map[i];
>>>>>> +        }
>>>>>>         } else {
>>>>>>             rc = audioreach_set_compr_media_format(header, p, mcfg);
>>>>>>             if (rc)
>>>>>> @@ -1243,7 +1265,7 @@ static int
>>>>>> audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>>>>>         struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
>>>>>>         int op_sz, cm_sz, ex_sz;
>>>>>>         struct apm_module_param_data *param_data;
>>>>>> -    int rc, i, payload_size;
>>>>>> +    int rc, i, payload_size, j;
>>>>>>         struct gpr_pkt *pkt;
>>>>>>         void *p;
>>>>>>     @@ -1284,14 +1306,19 @@ static int
>>>>>> audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>>>>>         param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
>>>>>>           cm_cfg->cfg.num_channels = num_channels * 2;
>>>>>> -    for (i = 0; i < num_channels; i++) {
>>>>>> +    /* Convert the physical mapping to a logical mapping of the
>>>>>> channels */
>>>>>> +    for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j <
>>>>>> num_channels; i++) {
>>>>>> +        if (!mcfg->channel_map[i])
>>>>>> +            continue;
>>>>>>             /*
>>>>>>              * Map speakers into Vsense and then Isense of each
>>>>>> channel.
>>>>>>              * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
>>>>>>              * [1, 2, 3, 4]
>>>>>>              */
>>>>>> -        cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] -
>>>>>> 1) * 2 + 1;
>>>>>> -        cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg-
>>>>>>> channel_map[i] - 1) * 2 + 2;
>>>>>> +        cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] -
>>>>>> 1) * 2 + 1;
>>>>>> +        cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg-
>>>>>>> channel_map[i] - 1) * 2 + 2;
>>>>>> +
>>>>>> +        ++j;
>>>>>>         }
>>>>>>           p += cm_sz;
>>>>>>
>>>>>
>>>>
>>>
>>
> 


