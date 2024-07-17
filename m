Return-Path: <linux-arm-msm+bounces-26460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56447933BEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 13:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EBCEB22957
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F7617F4EA;
	Wed, 17 Jul 2024 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sn/9Q3tV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFED17F39D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721214666; cv=none; b=C12LYBQjB4y+fGhD3q1imCC44xoBveF8ITVI7CyVvp8aaXvWusO/YwzVOC1TlDDxa2N5vXSVxzGoLenf5HQRatOdwYD43wo/W/6KbLL+OLWnliZL80cS1dEnjjDEJMOCQ2Pdf4wGrpegH2pRXWVKYM3aalYjaKE8UpPGe88bJ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721214666; c=relaxed/simple;
	bh=hhutUiK+ldZmbrgZE8Dzx0T70pv9+3yHYglk4hnsQuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOtUQJh2vyRwlUjbfKpbzbGOkPc/fQB0x0oiPf6zoX5kfCRyiQXm7bfg9yQFSYvjnaUgYcIj0iJYZqa0oV5Mktk3XSf/b+pHEx731kiivuXgQ1UzBGNH7ceVgCBZVU9Xj0Ja+cedg0J3X1Qm9DmeoeoAuqb4dNVaXKNCp9IgBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sn/9Q3tV; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a10835480bso93608a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 04:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721214663; x=1721819463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OdeLjPoqRmUlYr25okuYc8K1yPtbJFc4x5bOz0ESpo=;
        b=sn/9Q3tV2y8D5NljrD1M4k5h51yxGuYK2ztENjPHvWgCCLDaWxsmclqb3sfwIj4Nvn
         cKDiOWg/A7CxC2n0ALQ0tySOE+uLARTZNWFTwuFqOo05aCMzgV+kaMUMlv7BRuqxWaw/
         k5B0sJUXSPiDXu/RR2lCxjN+6IWRa9JSqP45rrNsHQrNsHWs7yqmRWkABHjfIlQpS7OZ
         2A02PrQFIxjIzzub+h1eHcTHG6D5+p5JmH7aE3Sb+R0YeqtfcIrcIpMBDQbISd3jXr9f
         GTU+0RBfdj6Tr68hu9sxARmTbbtL2hqMMyBM9EoVpQyAAjvrsYVcThZATmfY5O+zu//0
         JLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721214663; x=1721819463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OdeLjPoqRmUlYr25okuYc8K1yPtbJFc4x5bOz0ESpo=;
        b=mh+YqMB3e51yKag9R7ejUqAE2hIA3djCagyLrgfFJSRYt3n0wZOxFatillRzXP7ks6
         zaLl++8mP/XfAnL0bJXEJtGcxi7r2KSYde6pNqah+vQ/WmSO4qZsOEbm+qTaIP+MgJfj
         7UmG8FLB7s6kN/RadPwQVCxN6Xc4+DCv9lBsMSBarVHxN9dNCFLF75nH4nSJZfKq42sa
         upegS/p8fwfY7zrw45QGyhKtF6eLUf16XsZWkeKukV/R2+4F2Li3mT7seft6SPB4tUQz
         78Lga5g+EiF9n9GEUnX8e/l8uwUolI6qZMxsIbkH6RKjBLKFQFIsALwmXOmjYBIln4Uf
         NjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUujPLqfjv4t0WPL1ws8FrQGEdLv10JSwixKvLMcFhw3D3CEoSvOXV/NQJMjiy62t6J0wHn8phM/vXXnimXAgsQbRG/m6K9jjXg4agEMw==
X-Gm-Message-State: AOJu0Yzy49gBqr50Zp4q5yFjkpuIhwTzSfurmjH1RZfJ69mT+R4GjGk6
	ER1vog3i7a35ZEAM+A2SyeOLdXahQzRMCTTb9TavfSs6a3xEeYupylBN7K3GQ9g=
X-Google-Smtp-Source: AGHT+IF/SD5/dNu9jj11HFGPBp5Nm6wXSVMHns1m4v4DrAtWWsNwrOpe57aeSit2bIQ3BRxkaPO4Ow==
X-Received: by 2002:a05:6402:268c:b0:58d:836e:5d83 with SMTP id 4fb4d7f45d1cf-5a05bfaae65mr1337759a12.22.1721214663479;
        Wed, 17 Jul 2024 04:11:03 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a28e8sm6733080a12.63.2024.07.17.04.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 04:11:03 -0700 (PDT)
Message-ID: <ce14800d-7411-47c5-ad46-6baa6fb678f4@linaro.org>
Date: Wed, 17 Jul 2024 12:11:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dmitry.baryshkov@linaro.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
 <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com>
 <86068581-0ce7-47b5-b1c6-fda4f7d1037f@linaro.org>
 <02679111-1a35-b931-fecd-01c952553652@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <02679111-1a35-b931-fecd-01c952553652@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2024 12:08, Satya Priya Kakitapalli (Temp) wrote:
>> How would it break ?
>>
>> We park the clock to XO it never gets turned off this way.
>>
> 
> Parking the parent at XO doesn't ensure the branch clock is always on, 
> it can be disabled by consumers or CCF if modelled.
> 
> If the CCF disables this clock in late init, then the clock stays in 
> disabled state until it is enabled again explicitly. Hence it is 
> recommended to not model such always-on clocks.

What is the use-case to keep that clock always-on unless/util someone 
wants camss ?

I've tested this patch on sc8280xp and it works just fine.

---
bod

