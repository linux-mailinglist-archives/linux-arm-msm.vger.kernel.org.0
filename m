Return-Path: <linux-arm-msm+bounces-31115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8396F4FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 283311C20492
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4901CDA20;
	Fri,  6 Sep 2024 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CskNCFjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C71CCB54
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627906; cv=none; b=bvLJGsIbLrl3/f450zhRHKIUCYedEkYoM2ZX2Aj0IJs1iYFrKDF00UfJy957fxcc5/y9vTUhmibtZQK94jrTh9kNWQ0DozDGekQIpNcYtaDN1RMf9z/UIJgEVi5UWJU2ymxPLsaHAIqgvZS+X1AWOER5G7++OOyVS2ABjP1W09A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627906; c=relaxed/simple;
	bh=kHPUgSS7y4wKJJKvqetjLfpPMKxSaGvMGGqoPNqinnQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Yyo1SBzlzFCkD0R0ng5MKjWKwuDGfrIZa46lYjHXx1b5vYb7fSaF0ZWtT+H3/5MQgpLGDMTKNi9MPe6vLc5Kr8teLwXcKFhmex6QXREuIttZCJ9ECz19QD9naCpR2VimZ0BmX6NzVpiRYA2B8Gnl7WzFxpBa8u+aXPz6CqQMyKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CskNCFjJ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c3cdbe4728so2165023a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725627903; x=1726232703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2biXSgPbe5V6ORrh7PNdt46gktVjsh+O8XvfdWRahfs=;
        b=CskNCFjJvn9jTjXxq/J4Z4W/CtRhHdmT/a2nF9hOlcy1gBJyn0WaBnmDMXO5rt7z92
         a6mBg4RnYz/iMZ2ngpbCt2MsoTOSdU60DQ+5ujwzlv2eLnS98YBTZuq1Nb3qajds5qHh
         GphokZ7j+MxeZR/YSJtsAZLmQxgJlWQoBPpASH2fAFryk2TpwLkbRnQ+b7CY/1MPz+k2
         VgEs52qvyEzpbEghdFsi365N2/fPJCNxVsErqHCjN0E54ijBf1m46QzVEHh1dJqBXRtJ
         GrYqBzJwkPMvlVMxBWnT7Tsq1v0ryvC8Ma8MHTUNvtJzeezDZGzg6dw4tsD26ez1f7su
         PmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725627903; x=1726232703;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2biXSgPbe5V6ORrh7PNdt46gktVjsh+O8XvfdWRahfs=;
        b=gvIkdd0xq9DTXY/vUt8xNET3EnIHNX9GLf1hJ9OT/xryhh4WwkkB2u2zG5bxRo9ess
         Jwh31RaV/gbKcdJiVukmz+ABBSIss2DEQZrmo4ZbN/xwVfET1qA/46rb7DvTnCDs8WUi
         O1xzAtT6PnJqtTTy6G5QeS4XqpQj/Sw6SpLvDwxO8IFkZ+9XdUvbBcH2L/hciA6yJQDo
         81YuGO6OOQyU8LQvB6Iz68qCgx5YwdWc9Ur3OpkoZDpQ0f4OEYTbit3fF3HHx2h7wIQd
         k2iKChlV31rt7EGI/fJW5D+n2LHRj+uHN2a2IaIHaQsM0tuv+V4t54Y9PuCcrV0jlaVG
         38Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXhArjxQEHM9zWQ7xN9ZjprcFTAcAyLBbE6at41Vup1PaqCQHcvHkzkTQqxurxqa1H4dflaHHOjkADytXgP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz57G4KDiYoECvTU+mC2Rww0knqbH0XxxrCsb2DJik7cE0dbm5J
	cfdMWEA8kRoNHa0F/uSO25thJ0zRYR8RhJF0v+StTk5Aqx7qKiSvcwQMm+OqTlU=
X-Google-Smtp-Source: AGHT+IFLq6fUbmBU5M9RjFFDJBfMNmPqHQHtoysjI8LimYd6nUyFyIFupPiGWr72sr1eMcOUSdqfxg==
X-Received: by 2002:a05:6402:5250:b0:5c2:6a7a:578e with SMTP id 4fb4d7f45d1cf-5c26a7a6193mr8670813a12.18.1725627902950;
        Fri, 06 Sep 2024 06:05:02 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc698132sm2410085a12.76.2024.09.06.06.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 06:05:02 -0700 (PDT)
Message-ID: <62c8d25f-b8d2-4364-94e8-4de33b61a52b@linaro.org>
Date: Fri, 6 Sep 2024 14:05:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/29] media: iris: implement reqbuf ioctl with
 vb2_queue_setup
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-11-c5fdbbe65e70@quicinc.com>
 <fe16671f-0fd8-4c21-a6ee-7e821b6316ce@linaro.org>
Content-Language: en-US
In-Reply-To: <fe16671f-0fd8-4c21-a6ee-7e821b6316ce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/09/2024 13:50, Bryan O'Donoghue wrote:
>> +
>> +        ret = core->hfi_ops->session_open(inst);
>> +        if (ret) {
>> +            ret = -EINVAL;
>> +            dev_err(core->dev, "session open failed\n");
>> +            goto unlock;
>> +        }
> 
> I don't understand the lifetime of the core->lock mutex here.
> 
> It has verified the state as !ISIR_CORE_ERROR and then _released_ the 
> lock so by the time you get to core->hfi_ops->session_open() you've not 
> guaranteed the state at all.
> 
> Shouldn't you continue to hold the core mutex for the duration of the 
> core->does_stuff() operation ?
> 
> i.e. the state was not !IRIS_CORE_ERROR at an indeterminate time prior 
> to the next use of core-> ...
> 
> Perhaps this is all very obvious but, I'm not immediately understanding 
> what the mutex gurantees nor for how long it does that.

You'd probably be better off

- taking the mutex at the external facing API
- validating state if you must
- doing all of your core ops
- dropping

If I'm interpreting your code right, there's alot of checking state in 
function a -> lock/check/unlock with function a then calling function b 
- which again verifies core->state and then optionally modifies say the 
linked list.

But since function b is called by function a, and function b requires 
the core->lock - you may as well have held that lock from a through b.

Moreover - what's the use case of the very granular core->stat lock 
checking ?

When is it valid for example for iris_vb2_queue_setup() to have 
core->state change state during the lifetime of iris_vb2_queue_setup() ?

iris_vb2_queue_setup() checks core->state
	-> locks - checks - release
		-> calls iris_hfi_gen1_session_open or
		         iris_hfi_gen2_session_open
			-> what is the assumed core->state @ that point?

So that's what I mean, I'm not immediately understanding why this 
granular locking scheme is in use, seems way, way, way too granular ?

---
bod

