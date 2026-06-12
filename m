Return-Path: <linux-arm-msm+bounces-112894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l2kND6jDK2qBEgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:30:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A525A677D5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:30:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=TtR+VJcB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112894-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112894-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DFB1302254B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C061A36CDF8;
	Fri, 12 Jun 2026 08:30:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A23624C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:30:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253026; cv=none; b=B9QE8MMbnUDscncHe6FB0U7ju6YEf5z6ZZnsPD4YG2QJ8oTcYaI8Qpkl7nO24uMWM9mGBcf6h3Nz9Pwki4xAGqYyCJc90+Yp+8bUFCyg9rTSkn41jpePwOOJkMxsYqluJheeOH3a1DdErvn6gL5YQkFwuTBOnWrUByjku+wjQ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253026; c=relaxed/simple;
	bh=WQZeV3uuxuMZ/eFoHnuhbZDCYnboZroqa/RsuKWP158=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y979aQroyeQiNp17IbV/IGVhIQzJvqrg0TZv+wK8NTmOR1XAnFwl/aiQJd6yjQDtC+69YBwu+JPShXxrZQqhqTmnKWVEr4GKuJRKHIIody76+7ujmXnScIHYZ6oYpK7lNSIKOsZJ3HHnE7dr0HgwhdC3B9Ht2TG6cZ96c2qvL9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtR+VJcB; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eee266c6cso590889f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781253024; x=1781857824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gqvsj5yCApToz/Rg23PwADlEjw5eNlHYXwzCtWvvj/4=;
        b=TtR+VJcBVgikeIMHMvyp3+Ibl5yK1Lt1GG7u9pHItxaSHhOueE8aRAD7Ml6R1lztB7
         DE3n9JtWMPcmMM+QiCJSymtAK50JEByg48lntj34HkaegmxASXcGTmbA4kDUHesYmKfI
         iR1HuKosAC/u4hCgX3q/ckjuo5gxfpV5cN4fH26vRTfzAHCNHrTmOLkAnN5bReZgra9f
         +B/jY4RWgeG1aIYHcqAgXRBPZLAorOaq8vybiR2tmky+NBhJRo1DFLOJWFZ3/B55HWZt
         b0xEPrgsWHk2FDJbe9XzhyJHO5/Tcq1QBzmxiZ7IXlxHIIz9BDpFgTkf7ScNTfkAnNaf
         qEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781253024; x=1781857824;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqvsj5yCApToz/Rg23PwADlEjw5eNlHYXwzCtWvvj/4=;
        b=AVXiVzNAnMxHasa6rF8N2tI5RAI4SeDuk+H9ulS9zTiAF2Q7hpzYLfXBG6jonktqFi
         BXmYDvxYPAhadv+vtE7Z/QyY+Qf6KhKCTwS5ERblgC195MyqhTltTR7B6FqElt3VAdmj
         1wlZK5hfVOhOuoIN9NPHGN2QyffHGySdmFUBlPpqaAOI9MbPVRYItN/qGBTtHJyJJXAn
         ijrxXRZpb5agSMZtCh+4gGwzP+lyMz1er8IR9v1FgyiYneA/CHpFwznGt/SzCtEF8/af
         tlhaQit8dAs+PolJcHVSLJNMcV4hVNpKX81uCPcMA7jzDnZYHn08lH02Rwjmrlr+JAH5
         j5sA==
X-Forwarded-Encrypted: i=1; AFNElJ/83H4jYsQ6OZCFDinYmJbg1r3cudoS1marMAaAHdCZPhpV8xyHGeWnLIHfuDEIda/IVZAMl6iJZhxSUB0t@vger.kernel.org
X-Gm-Message-State: AOJu0YxbU50k+oXF/nMkPX6gvAlDOvLcM8+c0lla7iXvtLLtQ5kRsqHH
	MwOCxGZAESeEQAPDc2tPrClFQDPAb8jE1Xk/HqT0t+8nNWtQEo93Pl5ZR3Wk5UPVrQ8=
X-Gm-Gg: Acq92OG44ewcy8g0pNuGc7pECd+eiuu00Y01SisxrD9vaFV08XWBh8niyu4YHHJIb7A
	GXkcumpIBiC3Y4AN+MNTNETMQX4JwlcHSJ94S+3Ol+g0pt6pnlZVWXCFR+wr7R4T4bSFIQzDUAq
	aEBgyp6NIUR6zP1+XiEvRp/WR7J6rfzmvGnsHLU3gJYK9+EN+NhsErm74LSeioh28gjenT6thM2
	rlEy+sTtb4BKH/1BFaVrAcl847h4lHvIn6GHe2IWj+TQB0WRo8qjl1OLWN4T34Pol+Di/vKXN8P
	fbPkLmTvQRdE4dDk+UdkBK/PMUkYhnGIYkKUgRbeIchQ7qIjqLsrJgg7DGAw0C5kTAzX9L8Tk4k
	1w3XDJ3oY+q8l0jLkjiou1b7JQOvvdqOSG3WQhHmLpwSBQlR5vVKMwtS6PXPqENyqUwQOw+MPpg
	cTHd/JuroDjE9GhDfmZ5vmtLcVF8jxIKzruK2RJLFaILWb9KeaaPwmQQ5NGgb3yHIK8A1mR3PaQ
	Bn/1b8=
X-Received: by 2002:adf:e102:0:b0:45e:e50e:3bc with SMTP id ffacd0b85a97d-4606dba5451mr1747177f8f.29.1781253023511;
        Fri, 12 Jun 2026 01:30:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fe5a:df12:588e:baae? ([2a01:e0a:106d:1080:fe5a:df12:588e:baae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm3550044f8f.12.2026.06.12.01.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:30:22 -0700 (PDT)
Message-ID: <8e1ef34b-7c64-4981-bd5e-33f6341f5aa5@linaro.org>
Date: Fri, 12 Jun 2026 10:30:21 +0200
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
 <e7e6d38b-6d80-4c75-bfbf-eef49589ddbe@linaro.org>
 <lm3yngkad2wcw3bfjcsfsmucsekmulhov4c7oygtp3e4f54fhl@lgj7gidpma57>
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
In-Reply-To: <lm3yngkad2wcw3bfjcsfsmucsekmulhov4c7oygtp3e4f54fhl@lgj7gidpma57>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,outlook.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112894-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:replyto,linaro.org:mid,linaro.org:from_mime];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: A525A677D5E

On 6/12/26 10:23, Dmitry Baryshkov wrote:
> On Fri, Jun 12, 2026 at 09:59:02AM +0200, Neil Armstrong wrote:
>> On 6/12/26 09:57, Dmitry Baryshkov wrote:
>>> On Wed, Jun 10, 2026 at 09:41:47AM +0200, Neil Armstrong wrote:
>>>> Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
>>>> is incompatible with the default SM8650 generic sound card.
>>>
>>> Incompatible, how?
>>
>> As explained on the cover letter, the WAS speakers are not connected
>> on the same lines as the other devices handled by this card.
> 
> The cover letter isn't recorded in the Git history. Somebody looking at
> the commit in a year should not have to look in the mail archive to
> understand what is incompatible.

Will update the commit message aligned with the bindings change.

Neil

> 
> 


