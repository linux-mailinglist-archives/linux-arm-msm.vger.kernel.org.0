Return-Path: <linux-arm-msm+bounces-116862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ncM1OR/KS2osaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:30:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF07129D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:30:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=n+llEDPV;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116862-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116862-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66ED9309356C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D71346A02;
	Mon,  6 Jul 2026 13:37:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26E832B111
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:37:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345079; cv=none; b=LidrPK+NDkEhagBN7V1KCd1yARPoA2YlugFoYXfieE3oGpOt0VTYt+z6ajQdQmDW7x7wUNzX+QrvcoSRqlkQOz/hcN5u1sSBxfdnxXY89gPnHhbeDzuNfbnP6lazNJJyra1TKpD/iQIgNbJaxRhhH5vuVmCjvxFvk/wftP4vEPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345079; c=relaxed/simple;
	bh=pQzZVG68wLqA4MOLkstXGFK0Y3+t6u/6Ggjx/nGFUAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+HmDq/SA0cjOpYOuXGzBjsEoJNSR4g9ydEdNz2oPZss2QcS4Ak+ZXuJOmWYXI83paWZveTQ/SxFz+OZ7Hi5dk2gLzUSkSQ87k1ZyzkEPHx/188j2u2VB6YkGsd4oH26Jo5fwb6Bdgv0mVmK9noB/pBe3vwKpAlJA8JWSK5FaxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+llEDPV; arc=none smtp.client-ip=209.85.208.44
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso5086659a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783345076; x=1783949876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5Jq8Dzzgx40KsRam3OqWjyEnrA+cneHoYjGfjryQms=;
        b=n+llEDPVizmi+M1/OWAbMb3MfTOFXarZT7RmGOfdAr8UP8ERv8+1Ztujcff26iAgCk
         OWFlHAMwX0MkWtDJjMu4NEx0kSH1icFzkrFEeVqy4MkX+zut8VBNonqmo5Yryg9zLdw3
         wlDNpLVHGSWTleLGV0xKlSIiNQIR73X1io2FmnCudDxhkrHU1pQFuxZk4FxwzhN9PwvL
         Su71z4zjDw3/2JIejLz7KO0k3Jia/oOyKLr29jAPSZTJfuVhEUnFYFEEIMeK2uMPohoB
         IRGGkTx2Hd1o9+yX86/6zTIs5h9q13S3pqAIsggWIvMfTtSBomZOwPJMB9LisTMjqbuv
         TzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345076; x=1783949876;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5Jq8Dzzgx40KsRam3OqWjyEnrA+cneHoYjGfjryQms=;
        b=IeyLHefy4Zr+l527Y7dszfkmgu9jSvdISBYGPzhpkptfAIwLKlCLgwAzKYlMMu80E7
         igdMaDgN3ZAAWoZ/cAu+ErP7aRknh8g7W3RsGW9Goa+fxcXhLEo5AgqnzQq0S6j4dpRH
         JYFW4xH46ZOuqN/RaDa8AWRPppLM70nksjGYdJYZFHPpNdylkIb2uAmYw/qZ3MXOCjl6
         AF0dympPbrJnUTd2+OemTg7gASUORmkT0q5rmbEdhnxd5g5wXltRL56uUGYtPmJC+sld
         71peEuOXwXkzGfVuhUtu35ej0LpQCxcfN3bID4mPUNtTkrJVzphymZROLfP4EzYSLtdM
         mhaA==
X-Forwarded-Encrypted: i=1; AHgh+RpvHiPQedss/U/+oBc+J9F+OypAmzMfbsygjdUDKVVCWO6VlVZgyqG6dzn8E0P7hrK4pjwGy/5PwOcjWFtG@vger.kernel.org
X-Gm-Message-State: AOJu0YwfW/L/vEK1Bw6GJAB87qWWVtYRY/mbehMXaMf7H4TQDLOKfZx/
	NP81PDn/jtQa3qUCBCr0Zy5viEWHC9Rp5GIwFBuoZk0goeXYOedW8nHOXl0nHhKbJI8=
X-Gm-Gg: AfdE7clCysQBwU8RALVtbhm8L3yWHyLFGL2njyt8Gn0j6EsUB1bG4PFUm7Z7aSvaHKH
	CIKxROLwbjIZxlPLqPbVsECXyVGFfOeq3tusitLeYp3JUO8C1g4bH+giJZ9KsBMntEmpU0QT4np
	9s6CQrwrbQWhfDABj8C5ak4XwMC7M8RhYLIzb0evHtXMzcPuEKWujXvDyRKoA3kVl1JIjE/CMPC
	ro+1ydag/6X5u/DBUD4Xg/z+l6n7ka96hMnejJFBwU86bbrWrvnh3lzuIx+gIHgqk9OyM2BZTAl
	csM3AD93vVgMteDpX62OJ9245pQJPLOOQHboTkkKqvzs0eEHJIs/vHxZDTaqBbsSbTdUL3o+W0A
	4AqWh5Z9sQRcza6AzR/UCvIobF2VE9MUHoZh6jDbt7t1BA1rymf7RpXZQxjVyohUtJn/7giDPQt
	MXhDHEw+xy5Ml9iGkSoV1ERVhlrQ==
X-Received: by 2002:a17:907:9725:b0:c12:7e24:a76f with SMTP id a640c23a62f3a-c15a67cc186mr40096266b.20.1783345076089;
        Mon, 06 Jul 2026 06:37:56 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12bc53e065sm724560466b.46.2026.07.06.06.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:37:55 -0700 (PDT)
Message-ID: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
Date: Mon, 6 Jul 2026 14:37:54 +0100
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116862-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,nxsw.ie:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46FF07129D0

On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>>>
>>> Why? The common power domain and interconnects have already been
>>> described as resources of the parent CAMSS device, there is no need
>>> to duplicate descriptions in every child device tree node of CAMSS.
>>
>> CSID, IFE etc are not parents of the JPEG encoder.
>>
>> The idea is to make all of these peers, eventually. Not particular block
>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>
> 
> The statement provides the same information as before, e.g. it's found 
> here:
> 
> https://lore.kernel.org/linux-media/fbc018f5- 
> c025-4747-85f2-53b45b0f0496@nxsw.ie/
> 
>      There's no functional linkage between CAMSS/IFE and JPEG - they are
>      peers within the CAMSS power-island.
> 
> Thus "the CAMSS power-island" exists, and it got its hardware description
> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
> a natural resource of all devices on "CAMSS power-island",

Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of 
the nodes within it depend on that and it is _external_ to the block.

There is a CSID MUX on some SOC other than that I'll restate it again, 
I'm not sure why you won't accept it.

There is no dependency between JPEG and IFE, one is _not_ subordinate to 
the other and trying to find ways to invalidate that statement runs 
counter to the facts.

CAMCC provides TITAN_TOP_GDSC external to the CAMSS block, that GDSC 
effectively _is_ the power island.

This debate is going nowhere. Check the downstream you don't need the 
docs titan_top_gdsc is provided by CAMCC.

---
bod

