Return-Path: <linux-arm-msm+bounces-113220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LQPFJgQiMGpwOgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:02:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F356880B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:02:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=O9ymAksM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113220-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113220-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67B16300728B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AFF4071D0;
	Mon, 15 Jun 2026 15:53:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF25403E96
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:53:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538810; cv=none; b=VP06fF3G79PoJokYYgR6VX8OjdsaJqe1AasILDt6ENwzVPgKtsdnqtizGJ8+Bfhxx3mOyZpkBHfl3gsX0Ks+IXgdfQjsIJbBeuEZ0/WHTCyPdPj4PKIc9pnQvOuCSwxzntgz6uBbFYkutVnAtH2xkwaKHzDDnNbh0TjKNqRrUlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538810; c=relaxed/simple;
	bh=OWjIuFDMr5k8lBjDQRURgsDqtr0Jx/dWajcW6zSSIXo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NFr72yQTbniV66KgnQDm32lL+IdDcAPS7tSsY9zH+T1GMdvTNJf+Psv0gkmhVZ3huuHgMZJg9N07ZmyP6AqY8YhBLbuPL2pdrEN5/5wBwUxqaoWhHjLwvqnmrKM4y6gs1cigTsY/X9plr5rtPbQ9usEaGRke1Oww6QR61wzTI/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O9ymAksM; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso22591385e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781538807; x=1782143607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuDYxj7LVKeesPNJnO/vMFK0wNbeSfrdsobiRsfAkH4=;
        b=O9ymAksMbJlY5mEb5HdSPocoQO+F1Hrsv3Vt/QQdRrIAqpuqQPPTreW4n5jXSy8uwm
         2CenspmdaZ7pXFYKSL9YF8R4WVo/XL4dCjXianY92Add0VLhqL7yNVlg+JVWCU7asivr
         QocPMBhzq3JA9da4pGIiOK+3bK2fs0refat0CPgznBXme+kSbiFE7/cSQBcMhVSNQwyg
         bBfFL2lj32MFwWJbwKhFW532mnkoPYkGIU5WZolwmkVKqcxSQG7Kpw/J9rrpLpRYcDyt
         bWrOXO/ZcXU8pEfxkhfzQYdHvkil6wv1uKzlaiay5eD2ev+RWS+yzFFTatLj4kT3DpQG
         rXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538807; x=1782143607;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuDYxj7LVKeesPNJnO/vMFK0wNbeSfrdsobiRsfAkH4=;
        b=CVAK/Uy0z4Bhovy83/s6F/Zf1mMwQKI1vmwQub+VO0HQd3c8xC4LMmw4u2mQSloEe/
         BMhbu8p5/gJUeGOyRnOgYAmfBKsQ3T/kAgCjvzb7sVU8aYaspJ1vtnxXd+aZX3FGIrSd
         j3Hq9vhBXgGDaLMBlzC5800hQxbdC39HE42HMJqmuqOQ/QverE2N+VXyxYrO3uX1J3ht
         e6HNC/7UiyWBTQo9dUTC2Pz+xldsWKMatoYeMihHg1DkxoXQyAt9aX8HE+9eHllU3uPh
         dor1wXvSQUfHIXchhw29H8GDTsr2KS58KA1xpo2fLqUm4Dpk9eQW9KsLX9TpYKhrT1CW
         vpCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fLrAc7rH+LrW72SyXi1pJ0LWMBXLk3rytH6YgMUiC6QG5LpwOgUE/UfVgXEGfFppr7i4UWyvwrCMbu6lc@vger.kernel.org
X-Gm-Message-State: AOJu0YxEY7gXR0cCr9LddES7eo8ddt88Cll4uv1nKAr+Cw2ljPETAnru
	UXFwYwGh1UayMSALpTlWtDBKFjGrPhVgmKYf1sM1EXl45Q91n3q/wWiF6uc+XBpzJYY=
X-Gm-Gg: Acq92OH6UZrCRPoK2e6r5UkJrhhHEvYA1Pd26PC5x74yULRUz2fP2zF6ndqeJ8tLHOL
	536lgHuYan4cjP60tyiB9WnQhE3eYuI+WQff/llRLU9c0afXY3x3k058pjM6T3+OHmHsHwDHsUy
	nPV8SP8xwvdER/H8Ui4IB32Ggg9r1Xi9ov4k7DbXtbsCB8SDl4A+yq79UL6by55e9cLFd73nrtN
	y/9vKNbI/76k3vnmgZgZHfQqj8dlP3OkswS+e7JzBuJ4X0y4cH9sPRqB6VH0m0JECBWSrZKdCo2
	/w+4DjERh8SQnfS3DAlM9Eun4MGhEmc1ZD/GnRXOpwcT6JRA8tolLOEZDKUIOgzhrmQzzNM1Ue9
	KysYSXoyUnLjXuP11uGnbf6q/TT0voDWNhh+sT0HM7WP2g4ZpeeDpfnlsaPRuAp/gZFPhC6orJ+
	fFDoXdXBlzqXtRXuWrM+ijzsIFQNodRPEEn4hVwJuzipBOPJ89bCQfCAKJICsfdESYe8Z3sxIxw
	11xYrw=
X-Received: by 2002:a05:600c:820c:b0:490:bcf6:46bf with SMTP id 5b1f17b1804b1-490ec4cdf95mr190561735e9.9.1781538807042;
        Mon, 15 Jun 2026 08:53:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8ff6:927e:47e7:5df7? ([2a01:e0a:106d:1080:8ff6:927e:47e7:5df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f726sm33320182f8f.15.2026.06.15.08.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:53:26 -0700 (PDT)
Message-ID: <a374453a-6d85-4a80-8ddc-212be172135f@linaro.org>
Date: Mon, 15 Jun 2026 17:53:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with
 special WSA channel mapping
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
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-2-18bb19c5ca22@linaro.org>
 <4e0f7aac-fd1e-40b7-a71e-47d02f10f3d2@kernel.org>
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
In-Reply-To: <4e0f7aac-fd1e-40b7-a71e-47d02f10f3d2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113220-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 50F356880B6

On 6/15/26 10:42, Srinivas Kandagatla wrote:
> Thanks Neil for the patch.
> 
> On 6/10/26 8:41 AM, Neil Armstrong wrote:
>> The WSA Speakers are connected on the WSA2 interface, but the
>> WSA and WSA2 links are handled as a single dai and DSP interface, so
>> we need to specify the channel mapping of the Ayaneo Pocket S2 for the
>> WSA dai in order to have functional playback and avoid DSP errors.
>>
>> Let's add a special entry for the Ayaneo Pocket S2 adding a prepare
>> callback in order to set the proper channel mapping.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 56 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 1f3afc6d015c..2f1688c9f317 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -14,6 +14,7 @@
>>   #include "qdsp6/q6afe.h"
>>   #include "qdsp6/q6apm.h"
>>   #include "qdsp6/q6prm.h"
>> +#include "qdsp6/q6dsp-common.h"
>>   #include "common.h"
>>   #include "sdw.h"
>>   
>> @@ -49,6 +50,7 @@ struct snd_soc_common {
>>   	bool codec_sysclk_set;
>>   	bool mi2s_mclk_enable;
>>   	bool mi2s_bclk_enable;
>> +	int (*snd_prepare)(struct snd_pcm_substream *substream);
>>   };
>>   
>>   struct sc8280xp_snd_data {
>> @@ -193,12 +195,58 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   	return 0;
>>   }
>>   
>> +/*
>> + * WSA and WSA2 are handled as a single interface with the
>> + * following channels mask:
> It should not be handled as single interface in this case, you could use
> WSA2 as it is.

I would prefer, could you help me understand how to use it ?

> 
>> + *  __________________________________________________
>> + *  | Bits  |     3    |     2    |   1     |     0   |
>> + *  ---------------------------------------------------
>> + *  | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
>> + *  ---------------------------------------------------
>> + *
>> + * The Ayaneo Pocket S2 speakers are connected only to
>> + * the WSA2 interface and the WSA interface is not enabled.
>> + *
>> + * Set the channel mapping on the WSA2 channels only.
>> + */
>> +static const unsigned int ayaneo_ps2_channels_mapping[] = {
>> +	0,			/* WSA Ch1 */
>> +	0,			/* WSA Ch2 */
>> +	PCM_CHANNEL_FL,		/* WSA2 Ch1 */
>> +	PCM_CHANNEL_FR		/* WSA2 Ch2 */
>> +};
> 
> So we are are playing 4 channels on a 2 channel speakers?

No, because the only way we found to play on the WSA2 speakers
is to pass set active_channels_mask 0x1100 with lpaif_type to LPAIF_INTF_TYPE_WSA.

I followed your advice to play with the channel map, here's the result.

> 
> There is also a patch by Abel, on allowing userspace/ucm to set the
> channel map for WSA at https://lkml.org/lkml/2026/6/10/1002
> Its worth having a look.

It's unrelated, I don't need to change the mapping from userspace.

Thanks,
Neil

> 
> --srini
> 
>> +
>> +static int ayaneo_ps2_snd_prepare(struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	unsigned int channels = substream->runtime->channels;
>> +
>> +	if (cpu_dai->id != WSA_CODEC_DMA_RX_0)
>> +		return 0;
>> +
>> +	if (channels != 2)
>> +		return -EINVAL;
>> +
>> +	return snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
>> +					   ARRAY_SIZE(ayaneo_ps2_channels_mapping),
>> +					   ayaneo_ps2_channels_mapping);
>> +}
>> +
>>   static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
>>   {
>>   	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>>   	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>   	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>>   
>> +	if (data->snd_soc_common_priv->snd_prepare) {
>> +		int ret;
>> +
>> +		ret = data->snd_soc_common_priv->snd_prepare(substream);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
>>   }
>>   
>> @@ -273,6 +321,13 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>>   	return devm_snd_soc_register_card(dev, card);
>>   }
>>   
>> +static struct snd_soc_common ayaneo_ps2_priv_data = {
>> +	.driver_name = "ayaneo-ps2",
>> +	.dapm_widgets = sc8280xp_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>> +	.snd_prepare = ayaneo_ps2_snd_prepare,
>> +};
>> +
>>   static struct snd_soc_common kaanapali_priv_data = {
>>   	.driver_name = "kaanapali",
>>   	.dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -341,6 +396,7 @@ static struct snd_soc_common sm8750_priv_data = {
>>   };
>>   
>>   static const struct of_device_id snd_sc8280xp_dt_match[] = {
>> +	{.compatible = "ayaneo,pocket-s2-sndcard", .data = &ayaneo_ps2_priv_data},
>>   	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
>>   	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
>>   	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},
>>
> 


