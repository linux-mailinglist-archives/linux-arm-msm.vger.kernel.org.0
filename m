Return-Path: <linux-arm-msm+bounces-115212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ei1vGWmeQmoL+wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:33:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E746DD5FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:33:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=RCSymXuE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115212-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115212-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDEFC3026C19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3589B37C0E7;
	Mon, 29 Jun 2026 16:29:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DCC449EC2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 16:29:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750552; cv=none; b=BO684aIgrl/gjIBiprVeRnkCtz7NzDQ0bWJB1L0Ul97FffqbNBebA7W/IqSkDbE5wgdxmMfW7xylcgKx93CrpldTSXmV2a1r3im0NWKjqBOsLy16EEgWaXpxSLL49HfYLp2uvo2rg0uVKcXjF4kNCa3wqnLZDdrcStWEnmfvxo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750552; c=relaxed/simple;
	bh=7Oi/H9oHgLZ74YzIl6biA9rABQ4jltAfpUljqljAvJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXzvuKQaFh9FSUEilHsxzsVLP2BofOvIngGKLE/NxLX6+KGA9GgSkKUF8jQZm/GIZ0EBdD9S5h+Em5d/6ORTWWk1CVE9ZutG1e+RDq3gClmwpjwLcfNrCKT/Ce6bJys0fdHQg5c9QIlDtK7lCMCLI1F605I/6ri3qv1RyR6i2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RCSymXuE; arc=none smtp.client-ip=209.85.208.170
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39b1593e87bso793001fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782750549; x=1783355349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kBpmlADvOekPTeSlrl6GX0ZXy3z1mOub8IDaEgLjsi4=;
        b=RCSymXuENd2HtkhFDdB5rYu1FnN70n02U6Zkj2BBp43m245UdOo9GpMJnAF0cfNRf7
         ECmBOwGCAmsvuj7dtZJnyei1xgg3hbELNzf3ObB9LSnmnf561R8G6FNVkT82Znryn3qT
         lTGHnHPg+/U1AbfEfuWiHZyD/yNQyB6ZFoLQVquJxTwJrtfGU/zr7+ZcnQ7Ms4IG5Wq/
         XDBrwsTl/T5TUqnupQju4OEGZ4emVjcQdCbIT31XIYwretsX4im+nCZbUK/OVKWk2mBd
         u3F5h9Fhc2Xl3eNFu/S7VYn52iImRoq3iqQRirMMvXzfxEZHkhSQHx1RckyGbC03CR5Y
         4w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750549; x=1783355349;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBpmlADvOekPTeSlrl6GX0ZXy3z1mOub8IDaEgLjsi4=;
        b=WA7Np4OY8Xdxn6ykoJgj6HWkD6V2iyy9ouw/ZnRrQ7p5pkIqfYKTXbk35oQXA/Xs2L
         bRGwgNZ5MC6gst6tkf8va5VpRnWwos6qr97FVneTJyQEwbC6e9nAepAOc5sOSGnfJfzd
         Z6WUZsJfboWt/SS7syy4VsDrYYHImedLHKv0BbYlvY7K9/AOHlTwjeoV7TMBd+IgyBi7
         Jb0szqy9xO1kAkOAuFFC9uJ93VnyTd4hEvYSIzPeeuy3auRfP/qj4rKpMPHJlv9wbob8
         cbpJXE81y0QIAj/SlAycxv/T1Hitc3xChurSTs9JJOdl/bttK01L/qiduVVBkPruYSuA
         bVWg==
X-Forwarded-Encrypted: i=1; AHgh+RqZOb9qyXL1xKRTEG4LAuEW/9ExhgnLjYqm6k0GLbJdCODdavA9qXMSO5kBFWV7pgCcOMbwh08rV29lcVJY@vger.kernel.org
X-Gm-Message-State: AOJu0YxGMn+oxBL5BIRyAHsUVLg0TKFi15ERKVWPyzVeVdJFXlgIv+iF
	gm0bRrwXUbQ/KYh44QrOueAv6cjLgjY4GlmYE5ekFqnH6vscn17fPLWA3F6p+s+SyIo=
X-Gm-Gg: AfdE7clJexh94o7QcM2yA0MkKZUPgC2FLuNVPwg+hZvvxAcS9rHiMv0NmkphpA5J8A/
	p3HuOj9a7EOeCrNQttpnfAZNEvoCDUnWs5vsSJo7w8JKL7Iat4sFRV+SBLg36QEhippp88zzVdZ
	79I3/cc3jULjwAFWy6FDvBN7qbetIVCsoTkEyjhjVA3NgsqqeC2MgLkvA1ultkkm4Eu9KXQKu+f
	xOvuRPpt600RiLzSGtqWzt5hKSPn7RDqls6miE5SmFTNc8fX7Zork6yUJQ4m1jlSYMRmC9yfBs7
	0b3aZdFes8zpje8zJNbvh3dvMIZWgcQFHTkO6TZeB4am/Un+QWjM/0Zy+aTpuj+rZkQ/bcXEph9
	w468Xhvyfk07aOUsBJNsaXRe8CeY1FM/S7Sf53aRzqi+my0yoNvo0t7sj9Uobh7WsrxIrS/Bzzs
	EgfSLFr8ANYlLYX67PvqoBl1Yv0cBy68Jkxusc8QVq6QuupyR8NsgZuVX91YR8ctO9tnI=
X-Received: by 2002:a05:651c:2109:b0:396:981c:94a2 with SMTP id 38308e7fff4ca-39acb6dfbd8mr20834501fa.7.1782750548642;
        Mon, 29 Jun 2026 09:29:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b100758f0sm7626001fa.22.2026.06.29.09.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:29:08 -0700 (PDT)
Message-ID: <444b26fb-b2f3-4ebf-9197-1fabec6bfd00@linaro.org>
Date: Mon, 29 Jun 2026 19:29:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Brian Masney <bmasney@redhat.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
 <akJQ7ZFODBjHrqFt@redhat.com>
 <03596c5b-9448-49e3-a035-25c0475df9be@linaro.org>
 <akKO16q4rTbS2vx7@redhat.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <akKO16q4rTbS2vx7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115212-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9E746DD5FA

Hi Brian,

On 6/29/26 18:27, Brian Masney wrote:
> Hi Vladimir,
> 
> On Mon, Jun 29, 2026 at 04:00:46PM +0300, Vladimir Zapolskiy wrote:
>> commenting the series I was also directed by Konrad's review comment on it.
>> In addition one problem, which I immediate observe, is that camcc_sc8280xp_desc
>> misses the necessary .use_rpm flag, can you please do me a favour and test
>> my series plus the add-on change below?
>>
>> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
>> index 18f5a3eb313e..a15e9754bfb2 100644
>> --- a/drivers/clk/qcom/camcc-sc8280xp.c
>> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
>> @@ -2995,6 +2995,8 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
>>   	.num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
>>   	.gdscs = camcc_sc8280xp_gdscs,
>>   	.num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
>> +	.use_rpm = true,
>> +	.cc_gdsc = &titan_top_gdsc,
>>   };
>>   static const struct of_device_id camcc_sc8280xp_match_table[] = {
> 
> I tried with this initially, however it fails with:
> 
> [    8.193803] camcc-sc8280xp ad00000.clock-controller: Unbalanced pm_runtime_enable!
> 
> I see that pm_runtime_enable() is called from common.c when use_rpm is
> enabled. So I removed all of that from camcc-sc8280xp.c with the
> attached patch.
> 

I believe the updated change is correct.

> It still fails with:
> 
> [    8.204595] camcc-sc8280xp ad00000.clock-controller: probe with driver camcc-sc8280xp failed with error -22
> 
> I suspect the use_rpm flag requires a more thorough migration.
> 

Likely it does. Unfortunately I don't have an sc8280xp powered board to get
more information about this particular failure, but please give me some time
to check, if I can reproduce the same issue on SM8250/RB5, if its CAMCC is
added under the runtime PM framework.

Thank you for the performed testing.

-- 
Best wishes,
Vladimir

