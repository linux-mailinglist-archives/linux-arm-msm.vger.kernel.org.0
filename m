Return-Path: <linux-arm-msm+bounces-112345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3tv2MKEgKWpyRAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:30:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E596672B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:30:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=VgIleMGE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112345-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112345-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D98FB31B523C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0CE3A7F45;
	Wed, 10 Jun 2026 08:22:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178333A3E73
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:22:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079724; cv=none; b=ryvTMgFN9x3W5KLwMDuo6TaBg/x3nO2mjc/rUgLVGe8EPVPALkbMJkHIsZEeUQCSo2zdrZRu0iZBMO1l5kCvuwGH2uo42KdHkqIuSC6TdqWgc11ZHXpyOUd+COG4WB8LCqPWJBDLDJ3wtMi9SZQOLyDzpAs4NmrJvs+kaRLFQ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079724; c=relaxed/simple;
	bh=nE8gNuplIhw6p4dYDUNxSa5zUE0zr4R5hqpSrc/T3vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmZpeYsTb0DkVIqr1VEadl69Oa/nYP5n+gYdrXzgtfvdg61Gg7p/k8yDTaytUAaJ9Kdcg6XZGLmurxKaFMrwKdgOvQGRCrPAifgD+3PoRIrPKQuxwqWK074E1WDhfrDeg1qSxpy7aqJrSWf9D7eaaqagNMF9089eTyp2oJjpysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VgIleMGE; arc=none smtp.client-ip=209.85.208.169
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3967720c093so5313001fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781079721; x=1781684521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ujN0Hk27ShmSn5usfdP+E/0ZsnXl4co2IQGGfBFpB8=;
        b=VgIleMGExBkSnjjOc4t/4oVkLqb/wW3BDN5gIuV0n2IIkmcqVs7bs/K2pgOMleaNJg
         u45VT7CMx65c7dLyf9a+tV6DOAs+zCehwZLk10kvE6gFedHTrHjez3IzToivnbzWF8Cx
         JzywrjkAkjLo3bLgXtfEOxQfpdDb7NrYyc/ojjSFqKv+y3XAL1Lcil51ayZ6935mnYv8
         5+cdCICEdaSuUjHh/fY2319gL3ApNFFTM0w4KNS3U5Wn+E8UGKMBurtjgsxrgS6hUJQj
         BEFxvDFrnqS/u6IY6E93HpqrHDiqOsAWHhD42FSIdVvRPS3/EpkCArXN/q+u3Q1WcD61
         pEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079721; x=1781684521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ujN0Hk27ShmSn5usfdP+E/0ZsnXl4co2IQGGfBFpB8=;
        b=AhnKvHJYVMP4eBJDjhnOmu4L6BU6tER4+8/jF9RL9TU+rGzgVnM09gfQzity2p7Fxg
         eFtdNwhooEXMCLmEL8yE3ui3hCi0M8+NaRLq439cdlN2xpLqLgb4KTq/GXxlJrgSVbDA
         nREJarXPOGkpkilA9nkXrVEKfwG5UQNxq9sd50bQiTg5NG7pXH2xKrdVkMuvzE10pYfZ
         UE0il0VcAOGtJ01KNEOdBWSsriMe8wKhzo/rRVCA2kjCc9xfUNMl1LztE6tHq5BUcnyV
         Rpkg+ZpcP1UzM8HFE5AR/DXMeO7iKfokuWrHpjpPAIuvdqA6tXxsWfQBk6CtGX0vNdpy
         w29Q==
X-Forwarded-Encrypted: i=1; AFNElJ+aHGBoZX3NWnapos7RGmul47LvPA9fKEGdT7bZm5YO33gjCgvk0PX2lU2C29VGZgx55HQXvl6tN/SOs6AE@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUQkdTLSblnz5cWKutNH9DnMiOUDGFhxiouNsdqcY3UuQ0b+A
	7w59jTL4dqqtRBwbrqKqjCsyjkT0N2iZ9kQTHt0FZyoy4UVvMA4QcyQvwyNb3Lq/XpDeTNWqvKo
	0Xa/ff5I=
X-Gm-Gg: Acq92OFhB1iQkj+1jH0xLf4PNBqHx1f+T7YTABLn3d0RiKjE54ZhgjuouxsQyIGDTZ4
	yHNEc5Kpk1Xhdln64xs+QU1/ZbRGZ4PEBOkQ7Jocp6PecxyR5OwxIFH/XAVClO5Lnh4iLehDKvg
	HkNvzm6Csai3x8iDsGRvswuXBB1wKl28UuPXyFPcOC8wH0kby4MU7L70o+D6G0aG8T4/dyePQjo
	t6gLMmcvLw5+TOCeHJzPhUzHpfpRwgr0Oe1E6XbFJoO6oohAvHZ3QLm5UD8yhshqnPw1Ge5Vdl9
	YXTeOIO2w9nVxddDy7N+jkEdzzpTQTAj4B9dMy0FAjEngrDGmG3qg+Wru8sDsPJhGYGIONM0Qn2
	XzEEoB8nEcwRyAZKuvE1hHa5/TQw2Q4CTQseZk3hhq8Epm7CEEUbT8GoQKbBGKABO6hzZt/z6bx
	K3Wxh2yBZY0gdXj10c46us+4PKAgXS44aCY3kKkDeo0dDky2rWKgxxo+YrUpkKE7JVl3EVHVBgx
	SK4bewTb+5PzXvs
X-Received: by 2002:a05:651c:1a2c:b0:396:7eba:a8 with SMTP id 38308e7fff4ca-397f78270bbmr7911561fa.8.1781079721231;
        Wed, 10 Jun 2026 01:22:01 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be04esm63290161fa.25.2026.06.10.01.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:22:00 -0700 (PDT)
Message-ID: <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
Date: Wed, 10 Jun 2026 11:21:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: William Bright <william.bright@imd-tec.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ram Boukobza <ram@imd-tec.com>, Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
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
	TAGGED_FROM(0.00)[bounces-112345-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:william.bright@imd-tec.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,nxp.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21E596672B8

On 6/9/26 19:21, William Bright wrote:
> On Thu, Jun 04, 2026 at 07:01:22PM +0300, Vladimir Zapolskiy wrote:
>>
>> How do you know that these modes are broken in hardware and not
>> caused by something else?
>>
>> It was stated before, but it was proven to be invalid as the statement.
>>
> Thanks Vladimir for your feedback.
> 
> I copied this statement from when these modes were also masked out on
> sdhc_2. I see that there was progress since then and the caps mask has
> been dropped so I agree that I shouldn't have this comment that these
> modes are broken due to hardware.

Well, it might be broken due to hardware, but not necessarily due to
Qualcomm SoC IP, there is a chance of a PCB design flaw.

> 
> I have tested this patch after rebasing onto the latest tree with the
> recent changes that allowed for the caps mask to be dropped for sdhc_2
> and I still see dll tuning failing. To progress, I need some guidance
> from qcom as to what dll-config value should be used as I am uncertain
> about this. I noticed that ftbl_gcc_sdcc4_apps_clk_src only goes up to
> 75MHz so perhaps this needs modifying for DLL-tuning to pass and maybe
> there needs to be schematic/routing guidance that needs to be strictly
> followed as-well besides the usual 50 ohm impedance rules?
>>> - Forbid SDR104/SDR50 via sdhci-caps-mask, matching the previously
>>>     existing sdhc_2 workaround in the same file.
>>>     The SDHCI capabilities register on this SoC advertises SDR50/SDR104
>>>     modes that are broken on sdhc_4; without masking them the MMC
>>>     core selects SDR50 and fails DLL tuning with
>>>     -ETIMEDOUT during SDIO card initialisation.
>>
>> Which one SDIO card do you test?
>>
> My apologies, I made a mistake in the cover letter, I wasn't testing with
> an SDIO card, I was testing with an NXP IW416 which is hard-wired to
> sdhc_4.

FWIW due to https://www.nxp.com/docs/en/data-sheet/IW416.pdf "10.7.1 VIO_SD
DC characteristics" SDR104 speed mode is not supported by the module, thus
the selection of the SDR50 speed mode on the host side sounds to be correct
in your case.

In SDR50 speed mode gcc_sdcc4_apps_clk clock frequency should be exactly
100MHz, and since it differs, it has an impact during the tuning phase.

Definitely clk/qcom/gcc-sm8550.c says that the maximum supported frequency
is 75MHz, the same is found in the downstream v5.15 kernel:

static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
         F(400000, P_BI_TCXO, 12, 1, 4),
         F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
         F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
         F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
         { }
};

Can you dump CAPS1 register value of SM8550 SDHC4? What does it say about
SDR50 mode support and need for SDR50 mode tuning?

-- 
Best wishes,
Vladimir

