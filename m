Return-Path: <linux-arm-msm+bounces-116780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CaLMDByxS2pqYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:43:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A287116A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:43:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Y7nnWQrA;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116780-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116780-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDCFE3473D47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80874424670;
	Mon,  6 Jul 2026 12:11:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD36423773
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:11:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339874; cv=none; b=FjNWa1KouKoF+7njEwjXwFkvuZm8SssNbB3T6iCZOoYuALgmxLzi9duJpZYwb4SX0U+vlVg+D9UDvxALYnt3gF76d/4f/7JYqOqNyHuMvmteRqw5d/cGHrfPmDNW6mMV7Q/r1UKBsXi5ottopghWSri/6xQk1dJUGEulZ+qiLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339874; c=relaxed/simple;
	bh=Q2U+Op+VJBwZYOYmZL+6AFPmXvDyszSs9SWc4mWsXTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pohfUyXctH0eRLgE78+RicX0MP3UXuTdbXQE3Rg5Ch8KwYybdy90NjJuB31lgdkhv7LmMbsNvdiI5FaSmYmNJ/3k1iix99MkExaOm9246Id8BMz6OU5R9P+03c3z65R3atx/9y6ZELuSWlr5YGdKKjfBjrYEvmQpZU81Le6ypN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7nnWQrA; arc=none smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c12620ed112so398052566b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783339871; x=1783944671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PaIUyVR1PWkAm9FdD5PygQC8S63mBB2HotoKGs4tuv0=;
        b=Y7nnWQrAQH33hTrdMgl43FOkIkiPgwjlyVmPXc0AeLtOj95DJ/Bf3Qv9CLpmn6ekM4
         ThgMWcZ1Zsun/imq5Re0PE4p8/l+4x5m52h/PCM42DA1HpuEEl/4q1SbTMe6nOONX3+e
         qmZ1/JSFx5+eEiL8X5FTaBpSZY0CL5ND0Qztn63yEctP2IgJMn/FKB7EQC7JrRTiI8hM
         urq6scDiwaSJSWHsFxwNJCSZp5aWs/zlerN05cAtzVpVq8keecsMt/0VucnGlcY5Xn39
         cDgE6QBOunNPfTIYXbT+f/fawD3NszKM9bchaye7renITmT21R3d5DCvAuWO7LGE0OOg
         Z0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339871; x=1783944671;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaIUyVR1PWkAm9FdD5PygQC8S63mBB2HotoKGs4tuv0=;
        b=ZxbTuHECNxWSGWMtD9LjjhepXdcpDjirICrhlPG1zikArgxGTsrLIfe8sy22XHp9/s
         5o9JFkU8EJ2RcfCvlNENbeIzUDlI2Ryyzo1KNmjByYFqH3nPeWWvRLXvuW6BvPXmatgY
         eAPaSUSTrGH2KIgfbsMtLGI1GycPLIIuPhtDs2AVdIAEp2m5nYUWLjg0aOAvPH8AcaEa
         KXdeIx+0tl9LjdC2ZG3bn4GwUJNL8eQd77i16Cklr5cMW5r89dBTCS30/BzKRGCaUP+L
         u8FTwnC5INSdK5ei44oSeP2hd3Rpd37JSaeiaiA649izGpxrmxFKX55000G+VMB5MzTO
         PmOg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8sXi1Xuw6uR8prKZvT7Se+Q4fLUMxp8X/XNmR9Wh7WWj8y/pR4SFTPa37zhw+E9oB6VDcFhG0CLyRuZT7@vger.kernel.org
X-Gm-Message-State: AOJu0YyjL0Hwgf9Fvl0W6bM8l9sj41E+h/YMByIaGNtr/cy0UL+0v4rh
	9y1J7ZNSeoR/CyJk9RS8pjxnQ8vToYEZtgus2fgLohOB5HyhMToDsj3ghft+K3jKyTQoiQpT7+4
	i+aDx
X-Gm-Gg: AfdE7cmqqIvNHKbOTXzBkOq31fZYvz7ClYw5Ad2bumP6NAcbl4sqsfY0nj54bpdRFBF
	v1hePD3Z0/4jL59vuVYq6w3mRkDcTAWzW7Mur6K88Sh7HbJyy4efu5t0hIfylf4iXs4HYsvrwLf
	bFA2qborecQGAQDJt0ywvRmqlMOJQt9nketuBjzaXzNLO6e2+VViS3z2ER7W9BaOwwFC6KaYgAW
	IPozSM4rox+PPse4vhgE4hT0obsX4WaqWXh5zbLmbWb4+QqBpXUFPqYj6Y2ObovDp5yXJImkhp1
	DUqX+XfnNCcnt0t5I3qvqON0eQXLijJQYaeA3ZUcROrXWYNJI/4O5d+Sb54Vq+fDS1mQ1xPpsJl
	Ov++o5CffTbC3YMS4k0kM18oQ5BENuE8t8PQTsLIeASbbt67N+jU16R2HKaXSGHT6jtgffeGd5K
	2qlJV9UtrxWYyEf3CjgWyHW2QsEg==
X-Received: by 2002:a17:906:d30b:b0:bd7:f75a:817c with SMTP id a640c23a62f3a-c15a67f809fmr14565066b.17.1783339871421;
        Mon, 06 Jul 2026 05:11:11 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6054fe7sm732082766b.10.2026.07.06.05.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:11:10 -0700 (PDT)
Message-ID: <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
Date: Mon, 6 Jul 2026 13:11:09 +0100
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-116780-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89A287116A6

On 06/07/2026 13:00, Vladimir Zapolskiy wrote:
>> There is no "master" device in this block of devices - save perhaps for
>> the CSID mux / wrappers on some of these parts.
>>
>> We have shared resources like camera noc, system noc and external clocks.
>>
>> Please include power-domains and interconnects.
>>
> 
> Why? The common power domain and interconnects have already been
> described as resources of the parent CAMSS device, there is no need
> to duplicate descriptions in every child device tree node of CAMSS.

CSID, IFE etc are not parents of the JPEG encoder.

The idea is to make all of these peers, eventually. Not particular block 
owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.

---
bod

