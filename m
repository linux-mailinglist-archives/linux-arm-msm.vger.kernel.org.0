Return-Path: <linux-arm-msm+bounces-116888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gM5IC5S7S2p+ZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:28:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C877B711F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:28:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=MA+Tf+UY;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116888-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116888-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7A6C3025BE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32806379C56;
	Mon,  6 Jul 2026 14:12:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF6379ED4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:12:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347133; cv=none; b=bGG3TVJcK6tGsi129vX/aXfayQhgT1LhVSjz26NhuTLmRb6CbBkbdZZkwqqQSvytBJKMyw8lfZea+GYHCwXKtRb/7lz2yZnQ7LQ79u0WXQImFWrI+SMFDuB01afckyEqe2VD8mZB/3nY9vpJn4h4sjNdgU5yUtShuOf8437le2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347133; c=relaxed/simple;
	bh=AUKedEW8L364I8JPQAlKye3yP1O85tY325vvcI429kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXWeIV0aIZgWNyPgkTL0qb5WQLROizlITSwNPB4zcT85n4bdYfbVv26s6LKDEWP7rqxmpkJcIFpiaVx+3mPK/bJZu4dkjmtbH0sdnso32Nujn0BuXDmzcefUpFJZp3zkMJ5hCHIAX69XLst1wyXmmmE+9lCqy4SEklQA3Xb9DP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MA+Tf+UY; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c733f15aso31350465e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783347126; x=1783951926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRglC65mYb/1PKnmY3GPB+Y//IKYaoRtYD9DfcwlSuc=;
        b=MA+Tf+UYpjIp5PwnmckYY7d65jEoi6xAkwBfJEDSFfM7S0DeC1DSCJnqYtPfxFWpK7
         SaW37deSkncxbWk4Vjiy0TX3EVCkZaypDiNF3OV7Z0uC1JxtpzQv7VdkdqFXk+yKuKZg
         sWo2+opfDfCtNmEqmukrcKYZWj0zfHdMUlHftTiwPTZSP3tLVkRYxObUDCypYNMJC8b0
         NHP8iwxXSKdy4TgU8SZOPUrDEWwrhIZiwIDTcY0CePmwqtguer0l2lzA5DG/xVlKGc8e
         T0yvlpOczcurrmZJtiApFTLgS5X8aYFgthqxcoCOu3UrBEv4hTFR0evrRCoL649V7g9F
         BzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347126; x=1783951926;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRglC65mYb/1PKnmY3GPB+Y//IKYaoRtYD9DfcwlSuc=;
        b=H+9EndhuP442nJg/OhibV18tnpeE97I6VtD+/kVU4hxqLGR4z3sm4AKpY1c5d5BCPq
         7/w9pENDJiy4LsigzYf1UJfepHa89NitnzW/O1vSvFB7IBxZgbNMEGcp0IkdisFZK6MY
         me4vs2/cwdpzBrgf2nFn/8nFAu4E0efe1Fr70vehVL9XBvGgTiP57OtXRdzfgBClJeau
         4bTy8ux3bRZ3MfjKZhulS0ZUy05AXByK1mgMEp0Xd2R3aWpZgWURhPLzstDxcOjNAuOF
         tGCzddpvkz9OA3QoD5WWywvAEoa1tCF0ZJRwQ81/b5YQwZrhbSFd9RJFMJ+H+rXg4yoC
         6rlw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+iQWSRpdVHBnGF/xEzLDxZO6IwyUAIklpz9XYMhlLu2nw5GFFrk2MAuE6/8fMFwhFNDVndXi2WWj9Sx7V@vger.kernel.org
X-Gm-Message-State: AOJu0YyT0ECdon7aHVdyJhzL+y2E9UqR3WXRaQtB1wW0Pzep+6MILEMC
	wvKd7c5nW04iWE081kGlbWVa3uwGRqaQDLb6M3AzAiuvxSTSampqsIl18+/jakNNOf8=
X-Gm-Gg: AfdE7cnDhXGZx7RGoU6lvLdczTNaX+bXbdpDl36eq/oVABEzAc71CHwbS5pgDrpP+t2
	zLEUuUVhBN6RoyxweS37vaPwYILOzxEclFqrKP4QrbRQDbhlGnZw+FCJebU/aBkafEmJgB2SZ0O
	hxCZ1NmsG9G6k4T44K16ufekk6hG9upi9pUnJXBNou7uug/Fbpc3BtNXowdQm6LZnRbCXSMxO40
	khcm40lMtj7Y/RhVexnsJRPV3zUZ37pvkUGV1tsMNwXnqXcfvssU7OJTnoSA42cMP0oCQZB67x8
	WxCtqV18JJQdMKcRkOObqYcWCWka3c1xOs9ZsnnIetUfGFaVs/4SbtCpkJR+U9IEhWIsG7LJsdr
	dgpQ9RpSRqZnglFJgDW0T4uGMDW2NwpYPxd/YgVl/riAXH5f0qypD45NWGxlu/eTuo/n2vv03jb
	MIUjPzCIm5327crDNGby2L8JbAeg==
X-Received: by 2002:a05:600c:4747:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-493df093146mr8495275e9.21.1783347125751;
        Mon, 06 Jul 2026 07:12:05 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm25651263f8f.13.2026.07.06.07.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:12:05 -0700 (PDT)
Message-ID: <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
Date: Mon, 6 Jul 2026 15:12:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-116888-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C877B711F7F

On 06/07/2026 14:57, Vladimir Zapolskiy wrote:
>> This debate is going nowhere. Check the downstream you don't need the
>> docs titan_top_gdsc is provided by CAMCC.
>>
> 
> There is no debate, since my arguments are not debated so far... Why?

An odd claim, since this is the fourth ? level of email reply.

> And at the same time you didn't provide any support to have N identical
> spread hardware property descriptions instead of the single one.
> 
> What is a good enough reason to prefer complexity over simplicity?

I'm not sure I parse your here. The core fact is there is no "thing" in 
the CAMSS block that can be modelled as a provider to JPEG in lieu of 
TITAN_TOP_GDSC.

That GDSC is provided by CAMCC not by any other silicon block. So 
omitting power-domains for individual nodes is incorrect. Best practice 
and in fact the _only_ practice that can work is to list power-domains, 
interconnects in the individual nodes themselves as - I've pointed out 
multiple times now - those blocks have to ramp clocks and scale voltages 
dependent on their particular use cases.

---
bod

