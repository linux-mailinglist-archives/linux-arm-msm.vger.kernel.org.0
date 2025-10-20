Return-Path: <linux-arm-msm+bounces-78015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 893E0BF18E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B74B818A4D7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894CB3176EF;
	Mon, 20 Oct 2025 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IbqcSJt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BB5319879
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967322; cv=none; b=UkHm/KzSrEvny/FuSemj7GVgO9yd8abNaA+GZzg8SK/WI0YjcdBchRPwxSqYuOpXECu3KliO/VLmwLd695rnDPOvc9Xe32e9WGvaMMjdQogzFVAZyDBe4btmqjeXIMsJQBY66mXcMOhdp8cmDBs/XC3fIRqpkL62yDbf+kgo8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967322; c=relaxed/simple;
	bh=yFCAkB4FB/szNXHuo+qfIpsxub94n/l/Rq5RMCliHyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CeChIO2RfJeAOZ1I6T6rbjR//Fp7qDrKkIT2x312y7oPfBDmsB2fdQOslJ83ublS7H1yIgMq6sXpuhepE1OvrE54xPDbNEM4c6PAnxSk1mf7Ou3TsGCkHim7kHK9p8bZlYiu9nfP7ow2LaG93PBgX3akUJq4ZKfJmS2eSrW7fP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IbqcSJt/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5848a2b3c8aso281688e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760967318; x=1761572118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTVK75Z+r3PeIEvAgwCwXV8zi1kuAXvJOmtFkcbSutM=;
        b=IbqcSJt/arMlK+CQRgURM01/b1wEZwbctCsp7AlNxM1ub0ulaYQaCvLolVH4pkLjeO
         xslc/PPtkPm6VM92SzPxYWbt847q+gDTv5qV6+hd7waNQwbf+IuT1UrVaY1M+QMrDcRW
         r3/XvhvcLKFy0ZgBEY+I/0JWRp+oR8huaWWxw4Qv6zQL64lXXdYqIWPsUWsXUlYd+Wb4
         p69VCQ0SzQY0yv0Trwp++y2/JiLVG4Keom3uPg3R7OChmyeeAuCDjUw6XL8JadKxin8e
         Ejf4UWrDn2t0bq1GKGuTmuCJnhvDexbLMkEjvI7WK1VcUWS2oNKLKCeN2AYHfKsLQBhD
         ttPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760967318; x=1761572118;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iTVK75Z+r3PeIEvAgwCwXV8zi1kuAXvJOmtFkcbSutM=;
        b=UMMVsxhi7Ly5SK9+kjdkkFPBeRNCPIawEtEUlpv7f+OzGimvIL67mPV7tY5610irgr
         6LOm8rscZ3gBZgESPl/AV5ZnCsQIlQvT7sy6GAAaGIhSzkAjwnD/JvrjyFJMyKGpFMGb
         n9FA0vsFeESUoBHhD5NJbHrIsQ2f40LUO+meo27i/V5ZjOGKYLMw0hqhE6VSGWnPJFYp
         R2R78+qY5GlPJ2cuFNO8PJ6yACEVu9YI27PRtBvmYupZADElbcMsOvqcULJ1w1NLGlQL
         Q1ToPGg1s85m5txPTwDcfWoZzlX1nDGqaU3jhmoftnfZs6tneEDXbjq5JRNr0+E5ecGR
         spew==
X-Forwarded-Encrypted: i=1; AJvYcCU5mskNI7UGm4gFwp2qIGBuuJmsr1S0Hw3mt96kgDg2Mohki4HFJ9DSyG9XMXmec0waDNzFPSMsh+49z6W7@vger.kernel.org
X-Gm-Message-State: AOJu0YzMrdiUukx2jbJWE97rwHu5eKPR3SJph4z1c0n2ljidL2Qds+wV
	0Rw3x7EOE/0etyowCZD2nxSco93xHu1afK93HHpVRmW49PhyVyveHgAsp4DYC4K4mrQ=
X-Gm-Gg: ASbGncuUnDuv4iCS06Rx07uNqrQuxgUWbHseI4rMImX7B9fSx8Es3oRyJ3GqkS+dckX
	FcNRtP+H2UQ3Wtm5A8VNlgAOFYKJ3M4gbg/pKQwGNH6MBsZMIDDgVzLby73tKBpjcXBUWmk1Nbu
	SuhkThZ7ZzxQBTYmLY41ctsFPABMP92jVu6oGBl+eBv5ECDkyYvYDGN+jGqf+w9Mb/sCA6tbHL0
	TP6tjUB1NsC86iKcQPvciGqdJkbo2NjSY3mXVTM139AjyP5EM3LQC6hoEXXSHZJI0CJtgdBD3zA
	nj73299S3sKGFR58VVkowx7KCMhTFYW/9ZAObYVOmw2FARpueb3Afq3OPVI95cV35OGu39IuRzm
	aAmr8tvuDzAYwhJOOUKI062HTvyooxxpqv10L9D2D0LXM4fsWjXzvL9foSGZPyppnzfgMiqbmBX
	+4Gaok+seApCWZAq8i7j7zu/PwFl5fs0zhjO2r8WmqJgvXHvuctyySNrAP7WJNDjJufQ==
X-Google-Smtp-Source: AGHT+IHxso0ndVx6nhne45HeaNnUTTO1Vb73T80rCMDSgu7AycOnXxALJ3Jl5Ih4atbNPxHYTXnnHw==
X-Received: by 2002:a05:6512:2303:b0:57a:d649:9702 with SMTP id 2adb3069b0e04-591d84f2d58mr2640895e87.1.1760967318390;
        Mon, 20 Oct 2025 06:35:18 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf6e2sm2522385e87.32.2025.10.20.06.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:35:17 -0700 (PDT)
Message-ID: <48bede40-584a-409a-9bca-7ae3cc420667@linaro.org>
Date: Mon, 20 Oct 2025 16:35:16 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
 <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
 <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
 <WnfCknsSyJK68PQZkE2q7COZHRpsLOFlr3dcbwiVR6SBWtF9iRQ4MGzp_9q31O0kyhZwoncQWfHjJQvpz7nyfw==@protonmail.internalid>
 <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com>
 <0e6e1b8a-d9ae-42d1-b1ad-4314e0d76ab7@kernel.org>
 <2c0011d3-a692-457c-9ac0-a445fc82df37@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <2c0011d3-a692-457c-9ac0-a445fc82df37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hangxiang.

On 10/20/25 06:23, Hangxiang Ma wrote:
> On 10/17/2025 7:41 PM, Bryan O'Donoghue wrote:
>> On 16/10/2025 21:53, Vijay Kumar Tumati wrote:
>>>
>>> On 10/16/2025 8:31 AM, Bryan O'Donoghue wrote:
>>>> On 16/10/2025 13:22, Loic Poulain wrote:
>>>>>> I'm - perhaps naively - assuming this clock really is required ... and
>>>>>> that both will be needed concurrently.
>>>>> AFAIU, the NRT clock is not in use for the capture part, and only
>>>>> required for the offline processing engine (IPE, OPE), which will
>>>>> likely be described as a separated node.
>>>>
>>>> Maybe yeah though we already have bindings.
>>>>
>>>> @Hangxiang I thought we had discussed this clock was required for your
>>>> setup.
>>>>
>>>> Can you confirm with a test and then
>>>>
>>>> 1. Repost with my RB - I assume you included this on purpose
>>>> 2. Respond that you can live without it.
>>>>
>>>> ---
>>>> bod
>>>>
>>> @Bryan and others, sorry, I am just trying to understand the exact ask
>>> here. Just to add a bit more detail here, On certain architectures,
>>> there is one CAMNOC module that connects all of the camera modules (RT
>>> and NRT) to MMNOC. In these, there is one 'camnoc_axi' clock that needs
>>> to be enabled for it's operation. However, on the newer architectures,
>>> this single CAMNOC is split into two, one for RT modules (TFEs and IFE
>>> Lites) and the other for NRT (IPE and OFE). So, on a given architecture,
>>> we either require 'camnoc_axi' or 'camnoc_rt_axi' for RT operation, not
>>> both. And yes, one of them is a must. As you know, adding the support
>>> for the newer clock in "vfe_match_clock_names" will only enable the
>>> newer chip sets to define this in it's resource information and set the
>>> rate to it based on the pixel clock. In kaanapali vfe resources, we do
>>> not give the 'camnoc_axi_clk'. Hopefully we are all on the same page
>>> now, is it the suggestion to use 'camnoc_axi_clk' name for
>>> CAM_CC_CAMNOC_RT_AXI_CLK ? We thought it would be clearer to use the
>>> name the matches the exact clock. Please advise and thank you.
>>
>> The ask is to make sure this clock is needed @ the same time as the
>> other camnoc clock.
>>
>> If so then update the commit log on v2 to address the concerns given
>> that it may not be necessary.
>>
>> If not then just pining back to this patch "we checked and its not
>> needed" will do.
>>
>> ---
>> bod
> 
> @Bryan, I test two scenarios individually that also consider @Vladimir's
> concern. I confirm this clock rate setting is necessary.
> 1. Remove 'camnoc_rt_axi' from the vfe clock matching function.
> 2. Remove 'camnoc_nrt_axi' from the vfe clock resources in camss.c.
> Both of them block the image buffer write operation. More clearly, we
> will stuck at the stage when all buffers acquired but CAMSS takes no action.
> 
> I agree with @Vijay to keep 'camnoc_rt_axi' to distinguish between the
> new one and 'camnoc_axi'. The disagreement concerns how to standardize
> the camnoc clock name or how to differentiate between RT and NRT clock
> names if a new RT clock name is introduced. Other chips like sm8550,
> sm8775p depend on 'camnoc_axi'. Meanwhile, 'camnoc_rt_axi' and
> 'camnoc_nrt_axi' are both necessary for QCM2290 and X1E80100. But chips
> like QCM2290 and X1E80100 may not need to set the clock rate but
> Kaanapali needs. @Vladimir

Thank you so much for performing the tests.

I would want to add that I've made right the same tests for SM8650 CAMSS,
which also has two 'camnoc_rt_axi' and 'camnoc_nrt_axi' clocks, and due
to my tests the latter one is not needed for the raw image producing, you
may notice that I've excluded it from the v3 series sent for review:

https://lore.kernel.org/linux-media/20251017031131.2232687-2-vladimir.zapolskiy@linaro.org

> We now prefer to add 'camnoc_rt_axi' (Right?). Maybe its better to add
> comment lines to remove the ambiguity whether 'camnoc_axi' denotes to RT
> or NRT. Please advise and correct me. Willing to receive feedback and
> suggestions. Thanks you for all.

-- 
Best wishes,
Vladimir

