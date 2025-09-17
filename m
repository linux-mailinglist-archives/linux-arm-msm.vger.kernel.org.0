Return-Path: <linux-arm-msm+bounces-73854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC0B7E9FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0474324927
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 05:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497A827A462;
	Wed, 17 Sep 2025 05:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bahRn+WE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F211EBA42
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087832; cv=none; b=IwOGDB0tcbeHGDn9ogv/MBD48UHY+t5VA8L/okhyxQJkhaBHKlhnaX+O+PACrLL3Zc9so9AK/O9MV5gRvxN/R0gQSDdjHB5Bt9jHlTYhi+WzKxfjxHBby5WuPsKYNDGL7eml5km3Qwd56CLbZAsl3ny356UviKkG4ICmmRV3vdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087832; c=relaxed/simple;
	bh=2Rj2GVVJeO3cElmAMzCe+vsZ7kk7vpWF5sm/8l3AHd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIrhLOmEVcbuJ67+2NeBcWblR+eaALwbSadgZimibZLOnTpAra7YudBR/Yt1VXFik7bFdBwwgTAqNEHIO7ShohNgeQUOGlVveNci1tuUUV9a1f8kvCy8n+XeE2ptDyK5wk4a1d59JzHiE9oZ3kY9UT9KN/BfvV5z4tK4x+hCFcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bahRn+WE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b07c28f390eso850811566b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 22:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758087828; x=1758692628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CW6YRUB7XWZg6Z0QvIr5Jdp9CvsPmVtxl4KHm6Wzt7g=;
        b=bahRn+WE6Dm9TwNA8fqpX/CAWNUyUdT37CPdrvoYBZ+zF3AfoojbVZDika7I2d/O5i
         JAzevz8or6hZBhQeCy0coOVyjpNdqev5KgTseH4dv7Jvt3zucPhrSIY+J9Z978FQdIS1
         UsJUHi9S/7gUvi9thBF9ASjWAHM1wpSbMAr4YgqJoGdidfVDNDwXxwf8OXlWWxl1aCtf
         +kv5AdUQOifw85GCvDvPo3AodUv3QVhtJuPWpNSGlPQACDKb8Bqk6RjU3pqLvH9odVY1
         8DHh68E5LeURTLUuzIyKHaI5qnAOF7vSJQe5EVlPSN7/3YABk4KBHq1+F2MBNV8GvzoT
         6Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758087828; x=1758692628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CW6YRUB7XWZg6Z0QvIr5Jdp9CvsPmVtxl4KHm6Wzt7g=;
        b=b+wkeiyN5LVxftzfoWZJ2FZBQrqoRj+6cmeXysykPbEmhSNQ1Eo0JdlL0MEpzF4DtR
         bFtRlSj/gxQXO9+MyDywrjEp8zRBG3177gXsbD7ge6NMgVISj6C3gA9am5hH8DALTBaA
         BySpDBLfe17nwJv/mT5K2/jEVdyFDYPh2af99dlbUz6MrcgrCMcSKLg3nnM2IEsXqQ+0
         lOUira99EfW0xInEgE6q0EY32+Y7ZaJlbg0FmT2Iz5Vt/NmmV/Qsg8rT4/Y9+omE2MAt
         h8YKb85ofniKBKZCwQ4qU4sjzcfrUJT4m7sy9+0awzzxRkv7N/3bHTTXwG+iVfTOj6Rc
         oddg==
X-Forwarded-Encrypted: i=1; AJvYcCVDh3SVsGckRuLYM4o6yghXJMAMrBang7A04s1iOLf2PhwOdBc52ECS3mYB82YgBhSRLgKQAe99nqbeQf1n@vger.kernel.org
X-Gm-Message-State: AOJu0YzwfukrtibLOkHF18C0rrBdUMU59jRS/zsUydHG24Cz10CntdR2
	m2ZFDHNQB8RqgAuVzNQpiAYtxRBFOEnFdcSJKbUAZ0WylNz5gy78QAAMR66Evihj9BA=
X-Gm-Gg: ASbGnctc9RvoHrkHKeC+yrdPCBCfkAYWa13VvYUEvbeCf/9f0cb2YZFgDcBygUtECFX
	L9F38BiR6jHVFMTDS8VT3NXWKksqS1SDeMRkzYicsDww+InFg7wscx4aADWBlYZQwubqtBs878W
	Ag2c6GJhe+LAtW6AQEwybflMFRZiHI9nUi7rD5tLR5LbHk9cMtKZOpBd5X2Pu5XhnFnX368P28V
	tt3L7/RB4TjFmSMdIEdjnvHBtIPj/HFXY74HpAsIhkXdtg0mAHk9bZRIxmS34JN/q8VSaXcAOqc
	rAGvx56Q39+t/u/sbhRvJ66S1olxCBUoWM1yj8ZbTRHlML0jwZLkOOdxyd1tSBkfHyMSvmsG50J
	AZnONFlZlOQCyVO3PyrgdIxO/gz4I6Q==
X-Google-Smtp-Source: AGHT+IEwTeAqrWw3yRYXMNv2Kyom1bFBunp2rNawKurYFNJfFiYeBaBgK7tfvL+8o/YQVxm7ewmS1g==
X-Received: by 2002:a17:907:3f0a:b0:b08:85d0:3d8b with SMTP id a640c23a62f3a-b1bb73a69abmr108132766b.21.1758087828294;
        Tue, 16 Sep 2025 22:43:48 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c6110c27sm1088029366b.66.2025.09.16.22.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 22:43:47 -0700 (PDT)
Message-ID: <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
Date: Wed, 17 Sep 2025 08:43:46 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <87a52u9jyl.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/17/25 00:16, Thomas Gleixner wrote:
> On Tue, Sep 16 2025 at 23:10, Thomas Gleixner wrote:
>> On Fri, Sep 12 2025 at 18:08, Eugen Hristev wrote:
>>> nr_irqs is required for debugging the kernel, and needs to be
>>> accessible for kmemdump into vmcoreinfo.
>>
>> That's a patently bad idea.
>>
>> Care to grep how many instances of 'nr_irqs' variables are in the
>> kernel?
>>
>> That name is way too generic to be made global.
> 
> Aside of that there is _ZERO_ justification to expose variables globaly,
> which have been made file local with a lot of effort in the past.
> 
> I pointed you to a solution for that and just because David does not
> like it means that it's acceptable to fiddle in subsystems and expose
> their carefully localized variables.
> 

I agree. I explained the solution to David. He wanted to un-static
everything. I disagreed.
I implemented your idea in the v2 of the patch series.
Did you have a look on how it turned out ?
Perhaps I can improve on that and make it more acceptable.

Eugen

> Thanks
> 
>         tglx


