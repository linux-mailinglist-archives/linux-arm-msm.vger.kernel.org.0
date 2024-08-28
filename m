Return-Path: <linux-arm-msm+bounces-29685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 795DF961AF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 02:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE4511F245A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 00:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2665819;
	Wed, 28 Aug 2024 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x1wC7/X/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F170A1FDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 00:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724803674; cv=none; b=OP+3SfTgbFZ8ovagAe2I1DV5i6iri5q1b86zSvCR6CtK1tvH18Y5ySQNOBq9EVAFmaFM3G6lUesn6zL+uVmXYvkSCH6Q9lG/oh+2e75BbWT7NPE4fF/IqQe+eWkVXONJd/tvNn+vPP+oQsPiqHNOnDfSM1prgftDLAlfC1urIkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724803674; c=relaxed/simple;
	bh=QMUdZjGC2QmYpDOPkVE0D9YYi7Yy9Rbf/i/1r1H7Ov8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVeTDZyLyGZV7IWnQ6kOVkzX459wYkClq1KoOe3+0sT3Ki8bN5q4RJtRnbV/1ODKYS0oAA4OxlzaLTA4acZT3R5Wr4kFNPmKQAHbdNfQKwmXsFpAqSHDx7MKUnTCpbkRJ5FshJ0ay90TuIkgc25WRK2X8HPrUFEs6qoneXGrhE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x1wC7/X/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42ab880b73eso54586325e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724803671; x=1725408471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZV5iUMfoRoMcZ6Zd2j6GcTtSN2V/vbrvCSm64aXh2o=;
        b=x1wC7/X/hAE2jhMCa74iWHA1GpVhgGZF6wwn1+VWQMD+LIdXsa7mUTLccpiqyKk5MX
         Rk6WliIX291EykVe8UGqGXi0IyPFf76NXOkqwN5ao7Xc68HeoeQD75eYwTLJgvgBCts2
         AT6ioPtRj0VKYoPV53l5fQYDUs8XCqTQu5e1tk78cbv6D9R67GvDvsN4SR6tJrMKXSR2
         njU19aUVeXk3BbHTiCTQGOeWIW5cM7lfWY3VvcpSiQklWntOTUNkE1oHWhQJKGhCPHJW
         xZxqZ8smxuyIKic8prIH2k0iiujlYlwQu2GynCZMzE+3l8IVuu+Ix8n3sF/fC416jljt
         TvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724803671; x=1725408471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZV5iUMfoRoMcZ6Zd2j6GcTtSN2V/vbrvCSm64aXh2o=;
        b=SXCNQnIbSXQzY15Ak+XiJfSwnwXVcbjyFfzEaCJaClELE3EZwR8qAPFVrRlz5mHoPE
         oe2R2EultpqZ98YdKajBkfZWHj1RKGPQ5VKAfQbuhkd+A+cG/bwKmxbYmUBz62EIVvo1
         SRPXlUisrO0T9JsTNts6RgCUHu6QjRzeSGl6MLm9fvqLJTb5J8ttowLvfsv3HCUxl4Io
         1b1WIUf0mW1+hpTxwfYvPBeyQgQGw8E3UfWVmIx6D/K1oFkaPg6Gj+KKG1/8YXgcTfx/
         w8smUvRVzuLCzec22+GEFo6wbUnUxDTtqb1VZehRXUtP0v7/A5q+c3V0RH2EjnQJkUM4
         kQ3w==
X-Gm-Message-State: AOJu0Yw720t/cBEXG2Tj+d4io1Emlhv4GI41H/Bn6IUsWJtltglXC6mm
	+esLPrPLi0Vv5Xsz9C3C8kOJlq40QUhmO2qnAU8LVedFeIky50PmOgELZ+R/YIQ=
X-Google-Smtp-Source: AGHT+IGaIcNGFJW9yUTOExLdE4h+xkmIeIJSNv3W/zzwc6H+isLKaj5qd9G/r5DrurzJWeLTrYBIFg==
X-Received: by 2002:a5d:49cf:0:b0:362:2111:4816 with SMTP id ffacd0b85a97d-374968557f1mr112894f8f.55.1724803671136;
        Tue, 27 Aug 2024 17:07:51 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb475f2esm1538702a12.63.2024.08.27.17.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 17:07:50 -0700 (PDT)
Message-ID: <47aa934d-bdad-4c76-9420-ce65950f67d1@linaro.org>
Date: Wed, 28 Aug 2024 01:07:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: vfe: Move common code into vfe
 core
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-10-quic_depengs@quicinc.com>
 <0611458d-b508-4e52-bafe-7f5612c63b72@linaro.org>
 <b1e1ff88-5bba-4424-bc85-38caa85b831f@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b1e1ff88-5bba-4424-bc85-38caa85b831f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/2024 14:06, Vladimir Zapolskiy wrote:
>> Right so generally speaking I don't believe we should have any null
>> function pointers.
>>
>> We just mandate that to be comitted, an impelmentation must provide a
>> dummy but, in this case when do we ever want a dummy function anyway
>> surely enable_irq() is a fundamental operation that is core to the logic.
> 
> Why? What could be a justification here?

a) In principle I don't believe we should be adding an interface that 
requires an exception in its first go.

b) I don't think its a good idea to proliferate patterns like this 
throughout the code

if (vfe->res->hw_ops->enable_irq)
     vfe->res->hw_ops->enable_irq();

too->many->indirection->calls();

easily dealt with but "looks wrong"

https://www.joelonsoftware.com/2005/05/11/making-wrong-code-look-wrong/

So if we are adding callbacks, the exception should be stubbing to an 
empty function because 9/10 of implementations find the interface useful.

> It might be extremely confusing to see in the code that some not ever
> requested interrupts are enabled/disabled, and then to discover that just
> some stubs around VFE interrupts are added. And it's the case especially
> in this new vfe_enable_v2() function, which I believe is intended for
> CAMSS support on new platforms.
> 
> What's worse, since these VFE interrupts are not needed on the modern
> platforms, it will require to add a proposed dummy "return 0" function
> into any CAMSS support for new platforms forever. I believe it'd be better
> to clearly say that it's a legacy to have an obligatory support of VFE
> interrupts.

I think enable_irq();/disable_irq(); should be handled from wm_start() 
and wm_stop() for each VFE so that 480 and after can have shared 
top-level logic.

However VFE can raise several error cases which TBH we should probably 
be capturing somehow, if not in IRQ then in debugfs and/or trace

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/cd88d924eb55f5dfeb2283e6e0eef37d5bd4c1c4

@Depeng can you move your enable_irq(); to camss-vfe-480.c::wm_start()

just after we switch on a WM

https://git.codelinaro.org/bryan.odonoghue/kernel/-/blob/2ea8172164e2b12a629cf3d939edac9a0f7a9368/drivers/media/platform/qcom/camss/camss-vfe-480.c#L127

as well as a disable_irq() to camss-vfe-480.c::wm_stop(); @ the top of 
the function ?

https://git.codelinaro.org/bryan.odonoghue/kernel/-/blob/2ea8172164e2b12a629cf3d939edac9a0f7a9368/drivers/media/platform/qcom/camss/camss-vfe-480.c#L131

disable_irq() should also collapse the TOP irq when stream_count == 0

The stream_count variable should ensure the TOP irq value only gets 
switched on/off once while also removing the special case from your 
proposed amalgamated code.

---
bod

