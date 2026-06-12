Return-Path: <linux-arm-msm+bounces-112883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KH48Lk29K2paEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:03:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7D26779A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:03:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=SYBodW2U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112883-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112883-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CACEA30CA175
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92103E0C48;
	Fri, 12 Jun 2026 07:59:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123EF3DC4A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:59:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251148; cv=none; b=LGDZYWnoabc45/ypMUz3uVX9gNHCWCSIyZGZzeCbGbool9a+hCLCMnALXiPV1KVNpoOiWY4GhlvEz06v+76aEf5yZP9swg7iBgF8O6ZkMtLxO+8s8cXXOXy73DFhQTTP2NZCWgsptAIHahmMYKcUQNfRSx9uPFLxBPKHQefO/hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251148; c=relaxed/simple;
	bh=cdQbHbOh7G19cgLNaR2oqye9IBbCmOZ3y0zSOEd1BB4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kItXgKfx+0inNYnYRn4OuAmnXKuuOInGNy1zmPOaSIf2YjQeTlZPnkqy0GFlv59bePYAMiFdgTB5liJsr/ggaB+S9yql6IO9IF6QL5h8dT4r21gCPOBfKXGsq7ef8xVW+tEOHMbXgqAXNNcUJYvQyyfUPVnlL+WzPvf+s0Ni2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SYBodW2U; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso4517195e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251145; x=1781855945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlA9CoTRXZR0TaMdtjA4AVATbFz6rhs9UGQiBwINUPY=;
        b=SYBodW2UaDca+a8ZO0L2hOFUGKeIqZrEQ2QSdz8Tyz7NZSDn13HIn0xZoN4no1fkCJ
         joljHgalVt3KU0+HP5CMjuW7TDDjsKMe8gSr5/mH90mmzSGVQVSXOeiOaxlkyNEXlWc0
         bh7UnHiPMcT+d7ko4rPLtQxu+9R0qJ7IKp4WrDH0TVMPv+48pEOzsZUiwecqVTOwMi3i
         jaXHyN1l3s4jhtICOQmw5elccjqL0H+5kE9hbtlUar0hTob+77JoMcQXGtEwd50dP3gD
         qjA5x+7mgkRC+QW59EmgkjKcHf9zMQHaysANo/Z5Z5GxCztusehld29a4VPNbwN+qWNR
         E+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251145; x=1781855945;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlA9CoTRXZR0TaMdtjA4AVATbFz6rhs9UGQiBwINUPY=;
        b=YNneZB1nFz2eZnkgz6NrLY/wR74Sg1RBm5/FXGsDKkRL/du+KTuqEDDY7vJ2vlVtLJ
         0wrIGIzUvURxLYe8WreHUSGHViaHpQDh0UK7Jt1FBPLmEQ8ah1KIF7DHsjCxLjIUKY+p
         6F0ip1SF3F2YGD1hlc2BFbGK10AKzAxaixyo/YPFQQe9gjz9rSIp2OrPcqruRIGCDatn
         bCwMiC1kKV1/hyt7IzxJIWE3EyyglFx7PbN9iFOo/zLbz58Z0ZP7nTxP2zFSr1OWMyou
         /Qwtg3RG4N5qqSNZclLDiGo0a/wYdejZBQjO2k1/Siit9ig0wFdStNxRKLH39sHlZP8r
         vW5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8jceNJG7zXu1Vdsv6bE6YkHBaXtAMEx1NiGlr/Cswd/XN2maLfKvQYQx3p8DrsvNBhpFRw/PKnR/po3zJp@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGpJMnkYQnYTbQe0b96o3svfqOpEJ31VwRvIBY2IVvik7R0Cp
	U2eOlykWRpGqwBhG1q8jJuHCZcI+S27Dv+p6/+h5CQ4yjZatd0RFklfvoSaIA7zEVCU=
X-Gm-Gg: Acq92OGJus5jpBq+WNu7lkfmp/iNQYej6BrCuQ6s+B41E8GaQUpCq71EsUyrae5Zx+/
	g3ut9sRXmPLHB/Fx8O+4in5Iae6oFaQ4XfiSgtoofGeQfBtnmY1jRINXQgiqfQj/M4BnAbftGhx
	a16deOKLnmP963GgifZOvihZeMZOCRTNfepZZ5VPVZmDBorQ6lVZiBfNBKucvlyK103ybJ9s1tv
	88c6CUX0dM1nvd39mrndT8RQtiiueRnQD/rp2KI3ZqPSx8i726KIB+7n0Jb+0p5QOBfaStfHbgp
	cHxWyY2JIwPcm3zSyJ3fwocwaFxJ8/z7KbdrrvrJMoN27k+jQ4oi2GBjm1Kb00VD0NPISIzSIbG
	5Aej7amNxiy3br0bY6P5Ir+4nvpZU8E15CD/RYbKGtu0UfkpdxGDCiI34myhse/3VlvaHkzYz33
	2QXghsKQPnmrYQh1pD4xigjY6jzLzD+/Z01XuKcHN2GNm9qAJ/o0h84iIaIaBtXiX9M9a2EHWHG
	d2/hZk=
X-Received: by 2002:a05:600c:8b06:b0:491:8043:5c4a with SMTP id 5b1f17b1804b1-49180435cf1mr6096185e9.31.1781251145278;
        Fri, 12 Jun 2026 00:59:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fe5a:df12:588e:baae? ([2a01:e0a:106d:1080:fe5a:df12:588e:baae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea843d63sm45658645e9.12.2026.06.12.00.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:59:04 -0700 (PDT)
Message-ID: <e7e6d38b-6d80-4c75-bfbf-eef49589ddbe@linaro.org>
Date: Fri, 12 Jun 2026 09:59:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
 <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
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
In-Reply-To: <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,outlook.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-112883-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[linaro.org:query timed out,vger.kernel.org:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[linaro.org:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A7D26779A2

On 6/12/26 09:57, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 09:41:47AM +0200, Neil Armstrong wrote:
>> Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
>> is incompatible with the default SM8650 generic sound card.
> 
> Incompatible, how?

As explained on the cover letter, the WAS speakers are not connected
on the same lines as the other devices handled by this card.

Neil

> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> index 0dc994f4e48d..508d1445bf21 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> @@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
>>   	};
>>   
>>   	sound {
>> -		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>> +		compatible = "ayaneo,pocket-s2-sndcard";
>>   		model = "SM8650-APS2";
>>   		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>>   				"SpkrRight IN", "WSA_SPK2 OUT",
>>
>> -- 
>> 2.34.1
>>
> 


