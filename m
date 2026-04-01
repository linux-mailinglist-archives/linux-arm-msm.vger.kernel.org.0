Return-Path: <linux-arm-msm+bounces-101335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EmNOu0EzWnhZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:43:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 935AF379AA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDC12300ACA5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072F83DDDAE;
	Wed,  1 Apr 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKJa5LvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD6E36A03B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043819; cv=none; b=ZisSuF+hGoribm7Ha3YkNnnRqhBUdZNlW96QK6V2xX13W7oQb4ul5xdjzP5c+2s0Ydb5j7yZBeRTvwuPakm/pk1Gl8me4eQHjoYISoVp3nWAJ25+PNFshdpErl6lzheyIgE5lQsb9rGE/YvIbONiBUZR42Mc2m0BfAPo4DL1ZbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043819; c=relaxed/simple;
	bh=DR7P1aIkksGz5fJP1gbEDWYgLqBB6bN1oZVyA7AF31Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/ZKPVVFC4bO4scXRAimx19tbqg705OaF8JQz0sA5SyRs1wD/dWKbO8n9Yfce8i7PppujfTmyZal+ehY5y1w6LFy3f8a1Uw+99eCQi/pxv4kPV+0n3vFOIwsGPRDcEn4wO0pyNnyrHLjWV476eDYgX3HAw19iJLB1ykIs4/UhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vKJa5LvJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfb723793so2152702f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775043817; x=1775648617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7XkTmsVnKsGBJ3bVNB0W4W6t/Rs8a6UCi6Zycut7Yk=;
        b=vKJa5LvJ3xSouy4MKgUcDXQeOAOYueOQjvSmKrlCN0WUaSkJekHZ5g1eNySj/NX8V6
         WkR23m1T9fLU0UtPiGZBiJf8ezotAMrvqCT99Qz/u66Bg/86/oYd7TOqGwuboRcEW4MJ
         AqXbmCNw6JaBW0tgVwBcXHL9EAH9uhyXkz49XtMP+j7emuseQ8/REdFz3RSJkxwFTbCQ
         r4G663U2/8eb/IniM6pMOVRCIuQzDlCOEOaBinZfEKfIq+cHbrMn3Z3ivFzyIVfB15kE
         ZyK7WSN5aEjY83gsuVxmtmsyS4CotIeYX3PEsm/jUDaknlYm3iUM4Eio7B6i1nklYsOx
         FSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043817; x=1775648617;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7XkTmsVnKsGBJ3bVNB0W4W6t/Rs8a6UCi6Zycut7Yk=;
        b=Cqrb9sTYKePEQJA41IK7xxJp9eT6R6w718BJ5jS4rnMszlCd02xq4vPu9MgiAlvl8g
         +sSbB/TGtRzHRFYdqfCfhvv3aHQGQR+dzgssxsweNpiH4UyVADxz5erzPWHnhoN84mDc
         /Y6L2eHu9Qy9dTL4qtzgoiBEyNUb6UEregTtpU8w0ZGpUT81Qi6dt7DP3E4erRxuL5KI
         ZLB2f54U64r5NkexVcv8uiGsU5AoAhg4aQ5DIdCgGRpPePSqDLcdfzOWAl2qFyiatbxy
         l/VSj87TncsZGp2dz1HEAKNUOzodnvAaJkZpQe3DdsHTfUciniPMIuqyWxyFc6AwrAIQ
         FrEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnIs/nefsrE/czyfEz+760BabMLKJ9ek99nLxgSbOdNmjoXNS8g32Atugee6x5a5aXh64asajo0Q9stxwb@vger.kernel.org
X-Gm-Message-State: AOJu0YwaQNACM7aF5TCiUR4C5OBEwXh7v2rjgRYIMpVnBrjA94f84sF/
	KHlNXvrohy29HMNml97ObEYj4e149KCsnAyO50UDdDSYsEn7kL2u/jN0wA2ZgSmGDeY=
X-Gm-Gg: ATEYQzz5AvzDLw8GhoNDi9uN5oayWhjYJ5cKxwy+11vW0E+U09ksqvCgWy9VBYBSUmq
	DOh7qOEbNqywoinjq2ErVYlENTjLtxIf6ic1ABo2IShthpeJCHIb4KrnbYnadbGWT4K5cGDTo3A
	0VUzxdVb8ogtPR+/9R57Y/WQgelsGPaq+fCzrjqIyAbZSr0QT2IqB2IhF+3+bVhsMGiSutzIw9a
	jTeqV+v14fMD+XsGIhA1SMBRk5vZIsShJMfF4YhvVN1mopSvhNwWEVp8VWXsZ61sQ88uBiVXW3v
	CQidw/KsRVJ1/Wco2A9aR+9Uahp1yk8nA0s2FT2i3H46fNLz4T9B4/V7luDuQ5JGdTaDJ8ypyYr
	fYC1LGOwaOuw6RSoh9S6bVjn5CZtAzfW0u5teqf++vXOrdxRfpgFKmSSsWr63jU+eD4/8rnqTbR
	OT5UMDFi0gp9sP8EtP3WTc0xu2WXK1bBttDcI=
X-Received: by 2002:a05:6000:310a:b0:43c:f40f:6c91 with SMTP id ffacd0b85a97d-43d15047eecmr5731562f8f.10.1775043816883;
        Wed, 01 Apr 2026 04:43:36 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.235.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d14c53928sm6998899f8f.5.2026.04.01.04.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:43:36 -0700 (PDT)
Message-ID: <9ed8dee4-315f-47fd-bddd-cff0d096a9e9@linaro.org>
Date: Wed, 1 Apr 2026 12:43:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Ulf Hansson <ulf.hansson@linaro.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <gX7v5Lyaw6K_7HLFrWAPRIukMU5BJ9bGDg4RNePhYxZ4A9KcMe1HWULG-XqG1czNCzN3e2BMPQV85a2184NwPQ==@protonmail.internalid>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
 <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
 <CAPDyKFrkVbvZcnbhxbLqFySn4V+USCKAjooT3yXN56jq+D9XGw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAPDyKFrkVbvZcnbhxbLqFySn4V+USCKAjooT3yXN56jq+D9XGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101335-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 935AF379AA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 12:41, Ulf Hansson wrote:
> On Wed, 1 Apr 2026 at 12:58, Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 01/04/2026 11:46, Ulf Hansson wrote:
>>>>> The intent was for this patch to be part of v7.0-rc1, but I failed
>>>>> with my pull-request to Linus.
>>>>>
>>>>> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
>>>>>
>>>>> Is it possible to drop/defer these changes until v7.2?
>>>> It would be very sad.
>>> Right.
>>>
>>> Since it's my mistake, let me reconsider. If I rebase my branch and
>>> share the necessary commit through an immutable branch that you can
>>> pull in. Would that work for you?
>>>
>>> Kind regards
>>> Uffe
>>
>> Yes. Please go ahead.
> 
> The patch is available for you to pull from the immutable branch:
> 
> git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git pmdomain
> 
> Kind regards
> Uffe

Awesome, thank you.

---
bod

