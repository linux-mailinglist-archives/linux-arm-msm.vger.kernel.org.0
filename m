Return-Path: <linux-arm-msm+bounces-22107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63F900EBE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 02:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E380E284F78
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 00:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1A3A31;
	Sat,  8 Jun 2024 00:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYgzyN7g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7921391
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jun 2024 00:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717805432; cv=none; b=KWKIFEEhHqvLBzDP1aH9yKSH2ctIRQtjFsGCC7HnyoqTh5cdiakCW10g6a/Q1sFfXf/OTMumu7aLnEMjN9Fh+Gl6WAiMxo21aWWSLiVSqVicPGbyygQWoeEQhg4319HxeSx09sRPx90Ll8B0HPd34jljPyrV9N7KGdzfGYtoluI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717805432; c=relaxed/simple;
	bh=3Z0zbhdACaOweT0p4Zo9vqZ/2iKMThY/VCjBhXk2B98=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=APMgzV+AEtwc3t3Q7l0HUVK6Br6HfoUj+SlOCk+/M8cTDAMUj8aRlxbZdbXTED1k7U8yQ/LBmGq4xN2g2eyePLto8lvsJRtv7XgdZ4mwxv3h9apJ6850LIHmF0VW4JgEwGTdzQcEGJVnrxV1o89/yrt+hYrjh287qlXn9pGIf64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NYgzyN7g; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso265784266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 17:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717805429; x=1718410229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ecYbGPjfLKyLt3DQ3SIRGpflUimkoU9cxy6SCcr4fJc=;
        b=NYgzyN7gQwaHHOnT33RYm7H51KHPHEEyCb495wDg7e/+F/eaU8fwiA/e0b7XNljIFz
         HTpCaTAX74ZX+Jgxr8fr01JMhoApgcc8alS9xeAmHDcNcZcCB5yQPr9VbmlDUtUydBvt
         nPjO2QnwSfCSyz61so+vYO0QBawY4QP2n9gUzIWveRRhpmUv5pbwwTcoVS/78LRvWiaa
         NRbyuY5UtNoy+cEjp4tgkQgqgXiIVp5O76B9rf6OOQqN2p6MTvKBUEaGnNkFsZU3Fcac
         1vOtHR5sLJbTzqKv6/8Bob9zwR1H2m8ldJ9q1r3BeoBFtTxcVQJCdxGqEmnNNumC9dMs
         tqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717805429; x=1718410229;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecYbGPjfLKyLt3DQ3SIRGpflUimkoU9cxy6SCcr4fJc=;
        b=eirlY7cGSTluB7EBDE/SoGqjc3uT3v8CTG1qqGHUgDO38Ltd4Fm6KMcw4THtaqwz+3
         9r/w6m5Umls5ZJbKAdAEeS18OCviL3XsqpqqUb54iVbmSndXc2lHQ5NPfDT3zDCfQICi
         fRQ8UDXrUGRtNYTIuI/ACdNJpN6wOOw22iEUHi7FoO8Ex1KiqZaZrOBHy3UUQB4lGIfV
         KnAItG4MnoIfX5VRpIrnHgKbB9wWzwlAf7zTwg2OqLhT6P6unGeSuVdh+ebH9T9ZJowN
         TtlxjRUxLiabcRPn33yYmZs3EK08tmNpvWzOak5Df23OCECNxZEPhkBlnDh/dp1pDAYD
         safg==
X-Forwarded-Encrypted: i=1; AJvYcCXJXISrMj/oT7rAKDcj5lW+21U2yd3en5SkxbaQJd0rGteB9bLj83pRBesqNtaGhyBrKtvv3fi7CSOGujmHjzMnJxuw+LVwrRK2pb5c7w==
X-Gm-Message-State: AOJu0YwzDsAyawiHI5dphz5DAzhgDdk3vCF/COK7wW/B+yfKgd984JKf
	Fe8EnrpQuYNW+bVpSbBRRZqu1V8u22u2wDKBqGqqV5tncGoWk3JEz0eiw7ofXhg=
X-Google-Smtp-Source: AGHT+IGKs8zL5jX+MjTfJtki6oImzN4o0EMy+BZr6R3i98fBPLE4MH2FIlQhLNTGaTXRFSDGtvJabA==
X-Received: by 2002:a17:906:e949:b0:a62:2eca:4f12 with SMTP id a640c23a62f3a-a6cdb203fc6mr247661566b.59.1717805428632;
        Fri, 07 Jun 2024 17:10:28 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eaa41sm312424766b.115.2024.06.07.17.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 17:10:27 -0700 (PDT)
Message-ID: <e4973e07-c608-419c-94f3-de70d3abc6fc@linaro.org>
Date: Sat, 8 Jun 2024 02:10:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm8450: set OPS_PARENT_ENABLE on
 gcc_sdcc2_apps_clk_src
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org>
 <2337ba58adb3fb127710bead9b8665a9.sboyd@kernel.org>
 <11bd7146-30cd-4b71-b2ca-d76875763731@linaro.org>
 <6ba2967c6c9d24e3f1c9b76496176010.sboyd@kernel.org>
 <3a3c4279-a254-48d0-91ad-70b7f1e3eb77@linaro.org>
 <7baef7a173dc4d1ecf8b0dafde565b1a.sboyd@kernel.org>
 <aeaa72f6-b227-4b54-9836-0b8f4dba6ffb@linaro.org>
 <9440dd954294db7c02a11a1807d75ad9.sboyd@kernel.org>
 <93eb11e7-21d7-4d3b-b033-b66898ea7874@linaro.org>
Content-Language: en-US
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <93eb11e7-21d7-4d3b-b033-b66898ea7874@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6.06.2024 1:56 PM, Konrad Dybcio wrote:
> On 7.05.2024 11:52 PM, Stephen Boyd wrote:
>> Quoting Konrad Dybcio (2024-05-07 14:17:01)
>>>
>>>
>>> On 5/7/24 22:28, Stephen Boyd wrote:
>>>>>
>>>>
>>>> Can you share your patch that prints the message? What bit are you
>>>> checking in the hardware to determine if the RCG is enabled? Do you also
>>>> print the enable count in software?
>>>
>>> I already reset-ed the tree state, but I added something like
>>>
>>> if (rcg->cmd_rcgr == the one in the declaration)
>>>         pr_err("gcc_sdcc2_apps_clk_src is %s\n", clk_is_enabled(hw) ? "ENABLED" : "DISABLED");
>>>
>>> to drivers/clk/qcom/clk-rcg2.c : __clk_rcg2_set_rate()
>>>
>>>
>>
>> Ok. You're reading the software state because there isn't an is_enabled
>> clk_op for RCGs. Can you also read the CMD register (0x0 offset from
>> base) and check for CMD_ROOT_EN (bit 1) being set? That's what I mean
>> when I'm talking about the RCG being enabled in hardware. Similarly,
>> read CMD_ROOT_OFF (bit 31) to see if some child branch of the RCG is
>> enabled at this time.
> 
> [    3.998362] gcc_sdcc2_apps_clk_src is SW-DISABLED, CMD_ROOT_EN=0 CMD_ROOT_OFF=1
> [    3.999896] scsi host0: ufshcd
> [    4.006712] ------------[ cut here ]------------
> [    4.013751] gcc_sdcc2_apps_clk_src: rcg didn't update its configuration.
> 
> [...]
> 
> [    4.288626] gcc_sdcc2_apps_clk_src is SW-ENABLED, CMD_ROOT_EN=0 CMD_ROOT_OFF=0
> 

Err.. one more thing.. After removing the HW_CTL logic that I introduced in
Commit a0e0ec7424c9 ("clk: qcom: rcg2: Make hw_clk_ctrl toggleable"), this
warn goes away.. I suppose I was already asked whether it's actually necessary
to drop it, and IIRC I shoved it in with my GPU enablement.. I'll retest whether
it's actually necessary, but I don't think so.

Still, doesn't explain why we needed this flag on so many other SoCs where
HW_CTL was left unset

Konrad

