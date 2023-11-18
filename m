Return-Path: <linux-arm-msm+bounces-1031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C657EFCC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 01:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B44D21F28163
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 00:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7ECEBF;
	Sat, 18 Nov 2023 00:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2ZhqhFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED4410C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 16:49:00 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507bd64814fso3683976e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 16:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700268539; x=1700873339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJXzr0OE2tNPiyGJ3aKzCqrkEywUIhP19xPsryf4etM=;
        b=D2ZhqhFy2k22qdWyPiSYxVPXl16y1F+ceBW0mxtE8bDnXmcVP+N+H8eJ8kMe2ufOpG
         ZR3Npqf/gPntk6c+4w59EEzkURBD6EsAOsAXI7tqqSZRj1vOokOZKWyzt29W3XeURR2v
         VQ9qTrSgzLNeYoL/uZjxMJ/KRoM3ekeEdgCgDyqMm5FdpaCQKvAnwoKXu4MsTnN2nKBo
         oCUN9+GF6tqwq5wQZrQqDYjbStSMhAPckpjolj7PJ+OFDBP2LP5/vVe+PplHYh1r3gCx
         z/ssPJLwznalHA9sXUGyCpGJ+S2iwbdS32iraaA8aEnk2dCY+qOdmgBi9jbMxOFR+WGi
         49Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700268539; x=1700873339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJXzr0OE2tNPiyGJ3aKzCqrkEywUIhP19xPsryf4etM=;
        b=NSAyu6mMvQnIvrSzuel+/k6jB55OqeyShOveqpT/cyG2M5I5pDoVdpnOS54rStKjtR
         InXLhKKnMW/MpPSQj1ypqNQkn7XtNaT3MQFfAPqI7aTc6yVuVwU+SY78xzm7T727sQ9B
         fZKl3WgIC9oqcPVw/NejX3lbuCsD6YfnvV2+A4iK9nzUkGb8qolf3b60TQ5JxjuC/PwQ
         dkiz2HQkFYT54xrc6f3zyl2VjKwAF2R4OdbvafaE2+YEMLulSAv/ZqDEef1na/DGLdJ+
         +aVSMzcjtfr3yu+xfe5hK4eK2VYahwIYKnax17XjYqYc0PFZdasR0M2mLjR4nUAZcYs7
         cxrg==
X-Gm-Message-State: AOJu0Ywn1Eb3sCUJlNw1zdxTdTHuku9xmXyEJzTPXYvJwqKVIpdRy5dO
	1rhT3OI2FOLW+9pvlJQPUysXtsF1AFnKkY2GeU0=
X-Google-Smtp-Source: AGHT+IGB4OCk+u4eoWOqFWAYCeveslUtHEDKr++sqaTQ5SRyj4P3pZsb6CsDwkGfGDTQRgYjxxNqBg==
X-Received: by 2002:a19:7616:0:b0:50a:a2cb:cd72 with SMTP id c22-20020a197616000000b0050aa2cbcd72mr719279lff.68.1700268538923;
        Fri, 17 Nov 2023 16:48:58 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id y2-20020a056402134200b0054873a656d0sm120563edw.45.2023.11.17.16.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 16:48:58 -0800 (PST)
Message-ID: <64a9d171-377c-48df-bdcd-1ac6d13c2da6@linaro.org>
Date: Sat, 18 Nov 2023 01:48:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-msm8953: fix stuck gcc_usb30_master_clk
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231002170021.192740-1-trabarni@gmail.com>
 <0eebfc14-dbcd-4987-9e94-ea5630b6c268@linaro.org>
 <07937184481af74c65108bae26526605.sboyd@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <07937184481af74c65108bae26526605.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.10.2023 04:59, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2023-10-06 16:50:18)
>> On 2.10.2023 19:00, Barnabás Czémán wrote:
>>> According to downstream dwc3-msm source this clock has FSM dependency on
>>> gcc_pcnoc_usb30_clk so enabling it would fail if latter isn't enabled.
>>> This patch add works around this issue by changing parent of
>>> gcc_usb30_master_clk to gcc_pcnoc_usb30_clk. This is acceptable because
>>> both clocks have same parent and are branches/gates.
>>>
>>> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
>>> ---
>> "meh"
>>
>> There are multiple cases, especially with qcom, where there are some
>> magic "dependencies" without parent-child relationship. The common
>> clock framework doesn't currently have any good way to handle this,
>> other than some mind gymnastics like you had to do here with matching
>> them against a common parent/ancestor..
>>
>> Stephen, what do you say?
>>
> 
> You can't change the parent to be not the actual parent. The consumer of
> the branch probably wants to call clk_set_rate() on the branch and have
> it propagate up to the parent to set the actual rate. Can the axi clk
> simply be left enabled all the time? That seems simpler. Otherwise we
> probably need to leave the axi clk control to the interconnect driver
> and make sure drivers enable interconnects before enabling this branch.
Yeah I'm almost inclined to think adding even more ifs to the icc driver
will consume more power than just leaving the AXI hanging..

> 
> When things start to get this tangled I tend to think that we need to
> remove control of the clk from the general drivers and put the logic to
> control interconnects and clks into some SoC glue driver and expose a
> single interface, like genpd power_on/power_off so that general drivers
> can't get the sequence of steps wrong. Instead all they can do is "power
> on" their device, and the SoC glue driver can do the proper sequence of
> framework calls to power up the device.
That too, given the structure of qcom SoCs, it should almost look like:

xyznoc-bus {
	compatible = "simple-pm-bus";
	clocks = <&gcc xyznoc_ahb>,
		 <&gcc xyznoc_axi>;
	...

	xyznoc-node@abcd {};
}

etc.

I've actually discussed this with Bjorn, but we came to a conclusion
that it's not trivial to determine which peripheral lives on which NoC
+ many of them seem to sorta overlap more than one..

Konrad

