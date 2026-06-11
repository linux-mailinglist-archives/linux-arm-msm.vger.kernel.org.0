Return-Path: <linux-arm-msm+bounces-112633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPHvA39oKmqIowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:49:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8633F66F8BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:49:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=LnPQ61Rx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112633-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112633-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAD9E3034EC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EB536E46E;
	Thu, 11 Jun 2026 07:48:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B1F36DA08
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:48:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164118; cv=none; b=dBkoHcKgDaV8tiXMzxGaEF7Nv493WXc76nHUilGnKSA/XRLKvkIDzVBhDbuU6MuqQUeQwd2xvKoafEPgBFjQOe6SnI6h7Kv0nMXXeyUuX57AeNrR0k7SUccEsr3r6hkgf7bGzSv0yiDXQoNUzmYiFcxudmzQQPAs+ZX4K6D3M9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164118; c=relaxed/simple;
	bh=8yu20Ma9s1WIvlVrAU4fqX0rWRixAxYe7co/fckb0bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7RUI6jqoNvth/E8nwUyl7mqkqTOmGSVeZcmnwQ85LbqmXYYpwho5MYZJYvmC3MLW/vR7TrZn0HG3mPjV5J6GvWN6vKCKEDg/fO8j3RyyvIxsNm93i9I3VEl8zTC8R9MUEoOHwUT5dCVzlXgx3TFa5dX1axdTSq/SKwPBZThuJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnPQ61Rx; arc=none smtp.client-ip=209.85.208.174
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39677114c7bso6609851fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781164115; x=1781768915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZcNR5v4/Eh8a44MseTXa3O5j0AC/9aZ3E3LNfBSyTU=;
        b=LnPQ61RxXY+eEap7RCIvLhicDV/eAj/JCLhXYP0od4adCDalutdVBeXdtsYc9KW0eh
         3U2Xi6v5WNJ0HWhStZRq9sZD09fl3xGH3L5L0U3fsa8IjpVsf2Xjv0Ty4wt/1ZQQ+ENG
         JsA8qTa0H6+18nv8pL+HFVEPUR7r2Ywty9S44V1JYf8Ijm//PRXhht/XLAs9PWdb4ZRC
         ds4vj+wYUKFanPr4KEahAvdsMjLyEeB5ZJQbLx2ODm/lYySPaiHJMbbUZbnmMlQxga2q
         Su2dYXCC/+Z0ztFYZqA77+OIQ2XoESu6bqsJTz5bwQDLjks+m7OCXhTz3Cmcdvcyk2Jy
         TgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164115; x=1781768915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZcNR5v4/Eh8a44MseTXa3O5j0AC/9aZ3E3LNfBSyTU=;
        b=IoGjCUIBqeebzl7OOqu6/IHZWJ/CDHHDPRcCvjGPLV2NGIZ6j51K+XFat/rtVUb4Wy
         +Ra/ROhQ4/JmadwPkrNz8EdkZxvxJyr0tMhZf9W13bd6MLTyObwYOXh4EUf9+pHZSl/O
         8R5ezUm8LYAbKiysR/roJPbwquauRnKt/aYld/D7fHNKspUySykme9RO3x/JL5AIoof0
         uV0S1cOPQJg8Ee3PyZ5n23UG1B/HuadEYOXUgGuSZAjuUm4PzK8mc+ILrKhhUwF2CWQV
         LjB5Itll8EmBPqyb417eP3fufXIzgzfQs/zy2vpiUKQ1KoOW8eAUXaMBXj0J/VxweDuW
         7ZwA==
X-Forwarded-Encrypted: i=1; AFNElJ9aIlEMBqstHuvxVu6nrp0A7v6veNf+a7kYpsADkSvwcxpbG3AJzmT087xqh73dAlt9gnE1c7EzBAlX0aKq@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLrLFF98lRnV+DZ3JYCNphAMOYU5cLNbaLmopGNYSn/X1gKXl
	6gXsTSglp82k5EYDVzTJ13BkeWSWFsiv0VRjGlZyF5gkETUSELf56tb7+Vr8/mB1QQOip11y8Cn
	tvW/LZkI=
X-Gm-Gg: Acq92OE2Gs0Px8nrDsZ59ax7b4Kj10DAnmRZwZLcmTLr2ryq2dGBQgs4YSgp55EMMzk
	l7cQQzgEydpm89476EYqtKN3kFtJCrEgd3nRSQvBW3Lp8LLvBysfudGRmy7HCh1o7mtKK9IG7os
	POfjXAG0DeccstB/7OVFaUO0pAeaRtZBGmR/rT3Q6/qEChJILVH0R8TI/87g+4Ob5UX6OTh3T+0
	ONEiXaYBeH5SOPRERFKklcvKJ5D2lLT9f3GhVaQGWihDxStH0M42TmT1x8vtRVGGy3WwbYCeqN6
	qAXkpoBq1vhGpHw0wussbI/8fHmLZQq65ma/+xX2HDUl21JD9Q37QvBsc5N5/GfYmmufUnQMB0K
	hgTBBBLDy658ygvAzyVOhYM6n/rCeBY/Vb35z5HLO3HTRx3l1RdlbQT5/yYk3Pe4v12rNTHPc9S
	BpfGmiOgB3cDE4Y0DQ6WB9F2+iW4T1OgfRGsX6rDZ4GVGdTIirfOfr8svagK5cRy4ignglKquvz
	uhFTG2Kvc8MopSy
X-Received: by 2002:a2e:a911:0:b0:396:8491:3135 with SMTP id 38308e7fff4ca-39919fb762emr1851881fa.1.1781164115468;
        Thu, 11 Jun 2026 00:48:35 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3991ad7af8csm2429681fa.21.2026.06.11.00.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:48:34 -0700 (PDT)
Message-ID: <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
Date: Thu, 11 Jun 2026 10:48:34 +0300
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
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:william.bright@imd-tec.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112633-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8633F66F8BE

On 6/10/26 12:59, William Bright wrote:
> On Wed, Jun 10, 2026 at 11:21:53AM +0300, Vladimir Zapolskiy wrote:
>> FWIW due to https://www.nxp.com/docs/en/data-sheet/IW416.pdf "10.7.1 VIO_SD
>> DC characteristics" SDR104 speed mode is not supported by the module, thus
>> the selection of the SDR50 speed mode on the host side sounds to be correct
>> in your case.
>>
>> In SDR50 speed mode gcc_sdcc4_apps_clk clock frequency should be exactly
>> 100MHz, and since it differs, it has an impact during the tuning phase.
>>
>> Definitely clk/qcom/gcc-sm8550.c says that the maximum supported frequency
>> is 75MHz, the same is found in the downstream v5.15 kernel:
>>
>> static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
>>          F(400000, P_BI_TCXO, 12, 1, 4),
>>          F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
>>          F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
>>          F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
>>          { }
>> };
>>
>> Can you dump CAPS1 register value of SM8550 SDHC4? What does it say about
>> SDR50 mode support and need for SDR50 mode tuning?
>>
>> -- 
>> Best wishes,
>> Vladimir
> CAPS0 and CAPS1 are below:
>    sdhci_msm 8844000.mmc: CAPS0: 0x3029c8b2 CAPS1: 0x0000a08b
> For CAPS1:
>    Bit 0 (SDR50 support) = 1
>    Bit 13 (Use Tuning for SDR50) = 1
> It looks to report that SDR50 is supported with tuning required.
> 

Looks like the SDHC driver behaves expectedly then. For me it's hard to say
what may be the rootcause, I believe the lower bus frequency should be fine,
so it sounds like a hardware issue, but could it be PCB/board specific one?

If you find a chance to copy the SDHC driver (and its small dependencies)
from Android and test it on your board, and if it also fails, then it might
be well concluded that something is wrong with hardware, still it won't be
quite convincing that the SoC SDHC is to blame here.

Hope it helps.

-- 
Best wishes,
Vladimir

