Return-Path: <linux-arm-msm+bounces-110613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLISKAKVHWqmcQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 16:19:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4DA620BB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 16:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56FBF30054E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 14:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787723B9956;
	Mon,  1 Jun 2026 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZxjuRrMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB253B9DBF
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323555; cv=none; b=L34z8CW4w3vcItY34pA9mvECBP+ZSKxYq/I56gv9mVukr5x3e2xb8MO9lZv20rreFc+yDYztJGiR+JGrdSH8Q7lCCaq0z8XV2IzbQRXVgK6T+ekFpopeyyFqX/hYe4KKi7pjgGG+1Wl+2PZNoUObbClKJsdHGHjbRzfr0sF2RwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323555; c=relaxed/simple;
	bh=0WoyP4VFmcWSwZARoRzXvbXDRI6qgb1cEPd97r9v4hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9zlPY9EIWJlbbqsgpI2gZZW3K9scby0Z4qKkZvA8EYSoDn9/UMPD76zEk9gkwMKaMgYGY+ISRnsp1IKqjKFHYNMI5UlpuYSVDbn0bxLccQct/a2zAEAAJwSY5bBouPWR58jlvhocv+Jh+IEVWilQZPe8GURMd21AzY9uLJdouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZxjuRrMu; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bed4f2f0898so138790666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780323553; x=1780928353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tazzfhio5FFxMaSKRgxVkzsE+cGWlB5d7jYkUiZcut0=;
        b=ZxjuRrMuYDzA3rbOcotlPkR4hCmqVGj50n0Hkyb5ZohgwZEi0WitzUHLk20eAVDJW3
         1HIyrgzTWhSaSNw+eSMlKICJt6tWS4BPnCU7nbuKXiquJAcoRi78cFnoV/40+uzsYoE2
         xus8Z17HBFhnbhP5y0Ydh2LTSylA7nL0BP5Q5ToCEyH7k2l8x258yA6N21vutvSIFu04
         C807TFHrTBtW1cSpbQGRj+VD6taq6Wov7pXhb0D2GSK9Gg7VU+mz1s9riWRxcf6jr87N
         YS1uB4PZQUV6XSpebskCxJ8mzZVIfEHqn7kxien0rFX5Wh+OMiybYmd2A4AVRBhsHWRd
         ZvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323553; x=1780928353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tazzfhio5FFxMaSKRgxVkzsE+cGWlB5d7jYkUiZcut0=;
        b=cAODneCObqx0P/b58KtCkwaLfVSgX3CSIercfYcuBM5O639QpS1UDu9YA6bg1eBmRj
         E7w+85l9qHKF6VgvblIbA/2b0ex7sWn8ZHhEftYoFkr+iuLX1SHMvwJyylhEDYLvgHKt
         YJj54eS3o9bGtVppoxM72/Y+my+MednjMRW2jMglmok6nM3RRFdAwgJClweHnF8Ij1sX
         cRY01Q4kWmyfyLVchOy5E+UMr92akXvFW9oWiLBTEvBpFW3eb6wmUieX/SBGS4lMJEqO
         f2inihY545x2272EzDlaQgLpMW2LeP7E80KyPQkGmfDFVYbfxpFOA4BA5VYMKyr09Zl2
         q/tA==
X-Forwarded-Encrypted: i=1; AFNElJ+HjnVM/VpS+avGxAzxKFRJmiOqcTpkKD8mcpeGqPtpzs5/IXg0tTC2V9md1ZOdoPa22v9O8ALHzWP4l8+l@vger.kernel.org
X-Gm-Message-State: AOJu0YwZGzVBKDWR41ae+4H4EFJFwwP7FsWOBtPB6iMpLdzR/3402s/g
	b3kbmuSHzSfCcNhHdKa7XfkG+PBQNyYNUDUcQmklYvBcEHgzEVKLztpZOfGHdPrZHvw=
X-Gm-Gg: Acq92OFjkmdshqQ3Xj8WIz0o30lhhvxK9PMlwm9+WKiiw62lk+uWSApgVHHYv3fw/2V
	kuZnvxI8zuY+9i6IpnyWTGuimNpM1DlI6emy4o9e/x9Do1xERsIu5oPnGIFGQfiI9QHUCeuHD6j
	hUAcHc1dkR0lMpR81+k2+CYipNhSK8YV22txK7k8BRN/D/xC+qmBXdpeWacLWrk++LkHk/aOf6X
	8DbCBH4jy/MrIx4jYpve8BJjrhsOgVBUKfKNsEGSBfYfy4mgGUK9G3EzSDYsYqbitUXpmJQrIvX
	6C2zfWATxg7DZh8cTEBaDukL1N8a83ESTzi55n+/ukXFFizY2ih8grbTnVJI60ooqTKYrDmXHBb
	twZGPWEjRtqjUdNe1B/G+QJxgknm0c6cyx/cti0E5Wg4nvXySRl3QubIP3i9BnQrb0yqdKwtwf+
	mVgboA6hO35nwWRH5cHWnF5gWmL/u5Crw6IB1178v9kiz5ow==
X-Received: by 2002:a17:907:1c0e:b0:bee:215e:5480 with SMTP id a640c23a62f3a-bee215eabf1mr180015266b.9.1780323552444;
        Mon, 01 Jun 2026 07:19:12 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb7a7dc1sm2092485a12.9.2026.06.01.07.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:19:11 -0700 (PDT)
Message-ID: <624b64b4-c524-4436-a338-52551ad9c6e8@linaro.org>
Date: Mon, 1 Jun 2026 15:19:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
 <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
 <3dd46660-b01d-4c00-b3d2-d0f1fd1e4fa0@oss.qualcomm.com>
 <lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-110613-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 5B4DA620BB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 14:55, Dmitry Baryshkov wrote:
> On Mon, Jun 01, 2026 at 06:31:08PM +0530, Nihal Kumar Gupta wrote:
>>
>>
>> On 01-06-2026 17:01, Dmitry Baryshkov wrote:
>>> Is it completely compatible? If so, we can drop the driver parts and
>>> make Glymur fallback to Hamoa.
>>
>> Not fully — Glymur lacks CSIPHY2. So, A direct fallback to x1e80100 would
>> probe a non-existent CSIPHY2 register region.
>>
>> All other resources (VFE, CSID, TPG, ICC) and version-switch paths are identical
>> to x1e80100, so only the csiphy_res table needs to remain Glymur-specific.
> 
> We have all the resources in DT. Can we not use DT to determine whether
> the host has CSIPHY2 or not?
> 

With the CSI PHY driver the answer is yes.

With legacy bindings - you depend on driver churn so no.

---
bod

