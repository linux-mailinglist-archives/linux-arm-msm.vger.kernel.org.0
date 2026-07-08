Return-Path: <linux-arm-msm+bounces-117797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7UEeK0OqTmrbRgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 21:51:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B5729FFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 21:51:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=R7bg9A51;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117797-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117797-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7681330BAD57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 19:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE793BF677;
	Wed,  8 Jul 2026 19:49:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B273CE4B1
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 19:49:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540156; cv=none; b=EHOiOqaUdZeA6Cap84SKNHqiqwDGiMUlpjgys9AXPcP0kDRsXDBluHOUEyuGjLTFMske5dwn7LMTbLanXd+fcUzuCgLuJVFu8SXf1D26M40HypgP3XMLQh/kUR0DG/4vtWyjlKWZmw8k5wpudDTotLQIB5/SCK3MJET9I87XcA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540156; c=relaxed/simple;
	bh=8FitnCOIzymqmh2SJdD2U8RGsIUomwearn9KBz4ki5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UteeEx0JF1nXAdinF/b7r4ySd5RP7WgRQALpm0hTUGf/zcAqUfowKjH0iglR+FvEyYNCBJtBxRskIXdQNEeCMpL2jNIuyZ2gtomp/CMG4YAGwXxZZ8s9SxJW+b32n0bZB97MP7DEICMa5wV9D4gQeghXffssOxhy2NsY9w4aI6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=R7bg9A51; arc=none smtp.client-ip=209.85.219.47
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so2169426d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783540152; x=1784144952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COlIbGYEylMlg+08j+MrlBTktSUlvEsQ0xCdXam5qLY=;
        b=R7bg9A51U2YEVq96hR0rQnFcFnePpmgs57hHYELToqG26iKAaKYzzryl7w/TTKf2CC
         +lGxw+QEA9jAjDWuJn8o89jmSiM3in+PWfOWE9KLcsBGhWY2ChCF0mDU/sjTsZbur2Zf
         ogpg+pkh7VIirM2H6zajzbuFunp9cbVfshGIliWJAJhqPYiJLh9kOTUzf2C7BaxOH/ah
         wFgrmuPXqEJkxBbUjbsthpspMBb6yTB4Q7opegffUhodST78YirtVyvZuDyYD78A2Koi
         v7fHCLfLDRHflzsnPdLx/b44MM/2+Fq0b1Mp/SxN+A8d2S1dSVc2uLtjsNP260VozBDP
         mYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783540152; x=1784144952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COlIbGYEylMlg+08j+MrlBTktSUlvEsQ0xCdXam5qLY=;
        b=B9oJRofRSdcOJJeSF6mGncbM922Guf3a4W7Cj8qTI9Sc+78zOc6aYVrRqmhWyXn+u7
         iY91w6V919l5dORwPZCArc0QfzKGCl28Q5Amr5XaZBfp94dosFE2aFBGj+toIOTVXdts
         UmADOeX5MV28WjQXc8b2UfuCO5NROxPUKB/9WF+8ZbNhF3Gry3LYac5BXP3zMcnvATd0
         urOI1upvU8to1Z+Boa+7u0F9e9AABkjeQBQ67tle4EvsMkRG5QEbcLAyu8z6GrIPdKDq
         Yx/TzjIYMvVibE10DHiJQQTiD4MovreghBNZgZdJc3Q/qlJ/fhhiq4SsqUJvuSLzSrmT
         WRuQ==
X-Gm-Message-State: AOJu0YzvDxmlvfo/+2b1yeXqe4XQzgqhfaD2Zcd/YazRGTVfND8bKhax
	wUaPXhL15t1JaMXhhdBurhdQVFi3cjzA25NzWJ2UqauRzQXk2fCOA2U+ZrhHSasfPEk=
X-Gm-Gg: AfdE7clNP90lk9d2wNYBFHKFYbjGqN0dxkoCA/8/AlpPIcp0hmU14kQmahftFFgy4AX
	/+CagWHNXS86Qm3GyJL6d6PGycktZnSmitEnhdthd26tbxEh69AwPTl6ahR2tC7E9UuueNUa2I+
	i697ISMmKJ8HbtSiqThSyBxsuGhCqt1m8UN62WedI//19aG+THobVAHNkrq0iXeX5zh1j2GP6H2
	HB+kxXaG5k4eIciXCZac70q1QkVwfN9zdb6SKZTHLmIPFp4WqLlfbC3jdyipBHuMzNjTo1l1lz9
	C/VM8TetIpjeAIhLbBqCHB6ybQ1H5GBgGzeWjM77QlXAb+LEiyZO75vjn/C88CLMqfD1VCJz4ex
	LTC1nQu7leYOP/Jdqav121/QbBtluXUN2pCZMEC/l3g3um2r53F+Ktr+9lEJk1iVsyEWEqCw84g
	iAedWHSx337RkG
X-Received: by 2002:a05:6214:5293:b0:8ea:c243:84e0 with SMTP id 6a1803df08f44-8fd38f9b4bamr95685346d6.1.1783540152153;
        Wed, 08 Jul 2026 12:49:12 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f472a9b1c4sm193173066d6.48.2026.07.08.12.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 12:49:11 -0700 (PDT)
Message-ID: <8309e9c7-a110-478b-8cd4-c002070d2b4c@riscstar.com>
Date: Wed, 8 Jul 2026 14:49:09 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] SM8450 IPA support
To: Esteban Urrutia <esteuwu@proton.me>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <959db395-ae71-4a50-bd46-ac5add545a52@riscstar.com>
 <48c624c3-5408-4862-b4ec-9321ad279bf9@proton.me>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <48c624c3-5408-4862-b4ec-9321ad279bf9@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,riscstar.com:mid,riscstar.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 163B5729FFE

On 6/23/26 8:57 PM, Esteban Urrutia wrote:
> On 6/23/26 11:56 AM, Alex Elder wrote:
>> I assume you have implemented this based on what you found in
>> some downstream code.  And if so, could you please indicate
>> where to find that (so I can do some cross-referencing myself).
>> I no longer have access to any Qualcomm internal documentation.
> 
> Hello. Yes, that would be the case. What I used goes as follows.

Thank you very much for sharing this information.

> 1. My personal findings regarding IPA:
> https://gist.github.com/esteuwu/bd49ed67ed9290f41612bdae1cacb5bc

This was interesting to see.  It's something I should probably
document better.  Most everything maps to the downstream code,
but it's not always completely obvious how, because the upstream
driver has evolved substantially.

> Note that these may be subject to errors since I mostly cross-checked
> values to get here.
> 
> 2. SM8450 downstream device tree:
> https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/blob/lineage-20/qcom/waipio.dtsi#L3304
> 
> 3. SM8475 downstream device tree:
> https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/blob/lineage-20/qcom/cape.dtsi#L2624
> 
> It's worth mentioning that between SM8450 and SM8475, IPA SRAM size is
> different, so I used the smaller SRAM size to support SM8475 as well. Hence
> the reason why I included SM8475's downstream device tree as well.

This means that the SRAM size (ipa_mem_data->smem_size) should
possibly be defined in devicetree (as the IMEM address and size
now are).

The SMEM region is used for "IPA filter tables", and access to
it is shared between the AP and the modem.  Unlike the other
(host) memory regions, the size used is *not* included in the
ipa_init_modem_driver_req message that communicates from the
AP to the modem where the regions are, and their sizes.

So it's possible that the size used must actually match what
is expected by both the AP and modem.  If that is the case,
using the smaller size might have problems on whichever
platform (SM8450?) expects the larger one.

So I'm not sure whether using the smaller size for both
platforms is OK; someone from Qualcomm might be able to
answer that question.

> 4. SM8450/SM8475 downstream IPA driver:
> https://github.com/LineageOS/android_kernel_qcom_sm8450-modules/tree/lineage-20/qcom/opensource/dataipa
> 
> Most of my cross-checking came from the source code in this folder.

Yes, "ipa_utils.c" contains a great deal of the information
needed.

> 
> Finally, for some values such as qmap, aggregation, tre_count and
> event_count, I had to cross-check on the same folder that all
> ipa_data-vX.Y.c files reside, since I couldn't find any reference to these
> values in downstream code.

I'll try to explain those things separately.

					-Alex

> Regards,
> Esteban
> 


