Return-Path: <linux-arm-msm+bounces-98555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIb9M9DwumkBdQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:37:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DBA2C16A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0372430217D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930983E2741;
	Wed, 18 Mar 2026 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHQmSalt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956D487BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 18:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773859019; cv=none; b=N5yoCJ8W85zH8TDSrmmxaVQ2O1iEuhPnJW1CHfH66ki1Lr+W4nkBaJH0cJnuaiiOckAqjId1D+D0uxGfNf6a+T0oqOj5Ws0YysPyHp1DGbcvVX03wOx0u/Vs38sugvj/yfRF9x3IS2qK3z3Y14sQTSESQn5JoStxGri5+OvufIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773859019; c=relaxed/simple;
	bh=1mOSMuTvP9eFl3iJE6ZPdb9kBZ2e4hPoHeHyrnWBuTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmL//rfk4FgGO5/uVtCqSNzgOrDOrxxFAtuNyrs/o89X/wqfM0l4GvZwDnuViSokGBXNmrJv9tZDzH4xB5UPqbvNDBQKH9TmtU1RhXKj5voBWmfXIly+WRhvFLzkNDkVXQJUI691Vm2WiapnOTvhuwq4v7KQpGTmmRO4nrfBxdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHQmSalt; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1279eced0b9so376093c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773859017; x=1774463817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JG3a4KxNFIP7nCbp5anRqi9wj8EbnHmkTO8Vs8QIZFc=;
        b=aHQmSaltW9Mv3yJwJ99chpzduVTF+jfCLnQz8YAf/LmWjq0NiZpRkg7GDecRoVXLc7
         ZzqTcTCYUpORRRZo01NDMlk0igbn0hKCFaGA/ujNfqhNZJaRPVFTbbgg+tfgzX+ovP7U
         5Zee6Up3/z0XwaXwZB/F6IkTkLTUv6929k5cvmvyn9WMDREHwoM4t4XB7BZVETZy+gjF
         JEL2vWXDZp1KvtYwcFAA2WiMRrZLa9XzBr7Ov/6l2vb+Zca0k5QjDp1TgEIajAPjyNJ2
         KtiOs8Qf1Y59qiO/ivCq3NSKgEduhWCQS5R9QvIwIS/asH88rpDVkO7cdFmu8I5cBIUw
         PIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773859017; x=1774463817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JG3a4KxNFIP7nCbp5anRqi9wj8EbnHmkTO8Vs8QIZFc=;
        b=nIAm1/OBV4VlgtaQYKb2j1x5h7PON82C9KOjQIClWA84vUAt+ZUzFCIOOe/rPl9gXv
         3w3FXmI0OUXftf34eALzc4/TdyBMbWaIFpxf+jg6FKD6rel0cKLwX6qhUT8XnBbyR+ot
         +jMWJJTT+F0pbeByDkxRS92hyDwLQAzMeoMUNDDGwoZyCzNhIu0TJyLw4rd68glRRwyx
         ZlSAgXQsNOK9NP3nZMDOqXkISxx9mLR1ysCBD8T0HOvxOxohCmsLF7HJnOCSRC2+6O3w
         9uHurZibjgXERYU+2fG7uGk/wPQkRPL3cGWdHP612oX0tmNFdm3exhM6cHQUC+gxXiDd
         sZug==
X-Forwarded-Encrypted: i=1; AJvYcCVEoMj0kdaTlRvp1Sv9BaCfultdwC2A8SFIPZm+Kace9vLK7olTioIQPB+fA0EdmDRTVkfG6QUqJmINZQ+g@vger.kernel.org
X-Gm-Message-State: AOJu0YyOPLhupoE0zB9rKVf5HK0RuaOMNtxZ1MxiyV2np5BOjwfz8c8s
	JkhJF6ZulSHk8GG1eZjvNthO6niusHWGDg4YhFLNfLuYBFPo28IHlLOR
X-Gm-Gg: ATEYQzy8qCP/SZLIk/M2dFXicJo8zc+K7dkFyYeGvatJdlrVYplBr0AKcn/ctRtwRjD
	j7xF3zml9FP3VLMrzJySWsCJyhImodvVfWCoZ7Z+3ypHhGYpIJEWD9+UFZZHe+CJpApYddk6SJT
	GRN7qAiew+iCTb/O25aC05/HgBL1KjHwLUDQ6y/ofiuvKr7xP+nAokpFFu9sXozqgmjKFs5sUu9
	Wnwqmd5JjFLxCU9VYU4MerBBdlbvPv2b4myX9yB7YI1IXlA4VNGSnQ8h0atZ8v5ySRfc9uP8aii
	gVUeqzCtZDk6QkOJo0jzFR/HleLctZCn8XNLJLxQJaPC0W0+uBiUIYqbi4Fj3mqwdn63WWPCnhl
	ES0cXinhud7/hoB07rQgYBmRLUrySzTH+r7yObIiM/f8Vz0jmMo6pgMvZZ37KqyRGUA8SWs2aRB
	RrLbkkIzXtNw+jvODTW8HKELxF2pNpu0lKqFcogwbahu3rA60utMaiOCcQVRTn7rr4k1tQygPbM
	GFGBg==
X-Received: by 2002:a05:7022:41a1:b0:128:d843:7d6e with SMTP id a92af1059eb24-129a7177824mr2232348c88.34.1773859016922;
        Wed, 18 Mar 2026 11:36:56 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a723e246sm4295653c88.3.2026.03.18.11.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 11:36:56 -0700 (PDT)
Message-ID: <d24c313e-1079-4206-8d2a-4ac96078dd56@gmail.com>
Date: Wed, 18 Mar 2026 11:36:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: leds: rt8515: Support single-GPIO flash
 ICs with unlock gate
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
 <20260306-expressatt_camera_flash-v1-1-b1996f7cdfdd@gmail.com>
 <CAD++jLkAQreycoUd=kjwn7xdL+Lksiuq06u4tQrVMfAUEbTRiQ@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CAD++jLkAQreycoUd=kjwn7xdL+Lksiuq06u4tQrVMfAUEbTRiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98555-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74DBA2C16A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/8/26 16:20, Linus Walleij wrote:
> Hi Rudraksha,
>
> thanks for your patch!
>
> On Sat, Mar 7, 2026 at 1:58 AM Rudraksha Gupta via B4 Relay
> <devnull+guptarud.gmail.com@kernel.org> wrote:
>
>>     ent-gpios:
>>       maxItems: 1
>>       description: A connection to the 'ENT' (enable torch) pin.
>> +      Optional for single-GPIO flash ICs where enf-gpios is used for
>> +      both flash and torch modes.
> Fair enough, that can be done.
>
>> +  unlock-gpios:
>> +    maxItems: 1
>> +    description: Optional GPIO to unlock the flash LED circuit. Some
>> +      boards use a PMIC MPP pin that must be driven high before the
>> +      flash IC will respond to the enable GPIOs.
> But this IC has no pin named "unlock". This is something else.
>
> Given the way it works it looks like a regulator enable signal.
>
> If you don't have any better idea about what this is, I would
> suggest adding
>
> vin-supply
>
> to the RT8615 bindings instead and then use a GPIO regulator
> in your device tree to provide the voltage to it from that GPIO.

Hello Linus,

Thanks for your comments (both in this email and others)! I have 
addressed these in v2.

Rudraksha


>
> Yours,
> Linus Walleij

