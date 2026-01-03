Return-Path: <linux-arm-msm+bounces-87336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC54CF072D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 00:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3329300EA3F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 23:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD5D2877ED;
	Sat,  3 Jan 2026 23:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcmhY4Q1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B43C191F94
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 23:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767484681; cv=none; b=CeIBOBJ+UgIuvPhVNKesIcUfBFtufrzT0hyOofGbPmdr7xPuIWreTwgss9tkdqTx5dQ8+IH9CV0kSzgpbQ1jKkrwXrTQg5TYWgSji44pI8uoshryDLvZOa3466WGGtMOxu4lMG+f9btrPc2ao0dcWg+av+7kZfqe9gFWPsSipGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767484681; c=relaxed/simple;
	bh=Nc0bv4pj2jQS1zXWwXvjiUVnCrXsy+PQZzamWQEOi/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osbTzp3lAeeGG1melGaaP9qs6AX10OZkxga29TO/rZ85hnvHz+kyYEP2HkIkIayDNgUcQVXdpbmJuP8LhcrqjYul662F0037GSQmywalwPnU2NOkaaQa4vbj0opX9GbQbxukKmCYrllM/eCn4OInHLUOTUOR6mSTM+gs6ha9SbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IcmhY4Q1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5942708701dso1312871e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 15:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767484677; x=1768089477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB1LagwegptwwLHmXyd1osJA27FSZTcIsYt0ExTrUgg=;
        b=IcmhY4Q1VROUpEIn0PP0vEUnJ3UnOVKso3pWBHmiMrDJtyunw54KWFgXkpxy15saTO
         9SiOAl71hK3KC9gstLtRuPRgvhP3HzHHwAnlwR5OxnJGFZU5WJR0NYosfRdqxobgzuvF
         HXDipGhaxZsfx34XxO3j2X9ABG7ogtHl3WBnnB+xcI7kq5JfBpVDt97ztu9gc4pLsRgs
         pNc3pfO8kfpBc1tx/WSioIqY+SmKxvCjIWr7Ej8p31hM9uQIv90FMZUlDbzEnkUqvgJh
         MTkUoDiKLk4HVlCmDnVIoqFAcktaJAAolg08LtoeCbMOHCLTx/lb33+7vzGuJ122SkMs
         rWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767484677; x=1768089477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dB1LagwegptwwLHmXyd1osJA27FSZTcIsYt0ExTrUgg=;
        b=ibbA1gOa4+kbKXhFSQTpJvT05k6rQwQs3jrpUicDF4Kdq4Cz6aOWijGy9mUtDuO7xf
         YRd+V99g9MseFslEKLbzPrDYk4PlwzUxFhALy/Yr5FPFpVWLVEPNbIGjaWUMhzyaPbAw
         jKKoB4vUp56O6AKbMmCZ8KGRNCxarAujZjr3F64uefJIN/oOJB6FI2MS3fLpv2XTgDHN
         GL54gkZk5SKjxqFgBUGUIpFQfY+ZLoy09A3TBlQ2C8y3QEsPzqDzPxoJ/K4wyvtLffep
         +1vbS7fcV/6k1Y4JEzpmZGS4t5bz+JMO+V7h98e9AGRQ6X7xx7phjkog9uqVcNPxGJJY
         ClVA==
X-Forwarded-Encrypted: i=1; AJvYcCX//CyvStnHgsmZOkeHjL8SGElctGIAB/8gdII9/vizdjhJri1Sys+9J7bYcEZUEokzfqFdSq0aXvA9jOvk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy4Kyz+pEYHUBAMFKVCFXImnfgPikmUCB1MnoHYgKZfoA9HMJh
	OuSCcN3ZXOoyjExC0OgmvTFzgDO0hga38eLctE39ew1iOnwGxVX8AmpTl4yQU/wrCLs=
X-Gm-Gg: AY/fxX6nSNk5WflBtc4U641D0CAzEZWOOfQjrbCqa/UJ8vy1GeDAAoHlKxiitSitMCc
	D79P45fCs+c5sVLz/mPDDPjwPwp3eUNyanxI/dm8KJC7Sejs58cRG8LlRsGUr9Jy+ygcqf3rdVS
	y1NKPDkLLNxiyTgQrQvjOTE9SrEJQgOwnW03C7cCwrK4uJYVVsfVwRR4DejhxcvFEwLTBAmLYMP
	0t4RBXeRbSfraTbLvV9f7Fvh6DLhjPWDxBLcIho5V4tvdbbPuWT5EHII42M1KWtvvfw5r7FLHRr
	h/nSqaYjay4o5qk3t6zFlASaXMPNDdyETZmZ5h8J8LAIY0ZaSf5evV/m4PR4K003VeQB+M4NCC+
	LQDzZe603VxBnfEtiNh86D6sxn2fTRePnsx4d6zOuYd1LDiRIwk/27+A7MIRHvEoj80PQ3llQxR
	9Sas2UaqWkS2QtJXoA5I2EdRh6F1fuIa1v71LIwGlsDCDBDb8b8PWvMt8vTtZYuoXC1g==
X-Google-Smtp-Source: AGHT+IHsnTa0hbn+0Wh1C3VR25cgPSQ44uvQseVE0kXGNojATuxFAd6n7Pd80xTUUipMQpgZdEmtvQ==
X-Received: by 2002:a05:6512:3ba3:b0:597:d7d6:eae1 with SMTP id 2adb3069b0e04-59a17d74eb7mr10048358e87.2.1767484677292;
        Sat, 03 Jan 2026 15:57:57 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd90esm13558109e87.31.2026.01.03.15.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 15:57:55 -0800 (PST)
Message-ID: <ad801501-cd9f-41f5-97b3-bf8b628d6e1d@linaro.org>
Date: Sun, 4 Jan 2026 01:57:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Manivannan Sadhasivam <mani@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
 <86a4yw87g8.fsf@kernel.org>
 <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 14:38, Krzysztof Kozlowski wrote:
> On 02/01/2026 14:33, Pratyush Yadav wrote:
>> Hi Kyzystof,
>>
>> Thanks for the cleanup.
>>
>> On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:
>>
>>> Use scoped for-each loop when iterating over device nodes to make code a
>>> bit simpler.
>>
>> Nit: the commit message is a bit too dry. I had to go and look what the
>> difference between the two variants was. I could make an educated guess
>> by looking at the patch, but still.
> 
> Really? That's old and widely used syntax, replaced so many times and
> sorry, but really obvious.

The made conversion changes are not exactly the ones, which were asked to
be done.

Commit 34af4554fb0c ("of: Introduce for_each_*_child_of_node_scoped()
to automate of_node_put() handling") says it clearly:

     Note that, in the vast majority of cases, the _available_ form should be
     used and as code is converted to these scoped handers, we should confirm
     that any cases that do not check for available have a good reason not
     to.

So, likely this and many other similar changes miss information in their
commit messages, why for_each_available_child_of_node_scoped() form is
inapplicable, thus it still could be improved.

> We should not explain core kernel API in commit msgs, except maybe first
> months of usage.
> 
>>
>> If you end up doing a v2, a one-liner explanation of the difference
>> between the two loop variants would be nice to have.
> 

-- 
Best wishes,
Vladimir

