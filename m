Return-Path: <linux-arm-msm+bounces-16959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D589E271
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 20:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 059901C23613
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 18:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C00156C50;
	Tue,  9 Apr 2024 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WnTCnBnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF1156C4D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712686943; cv=none; b=R7Bf7KssOYtjFGeRORJsTjY9wJ2z80SkYAIJqPSkBxOr72Qc5Fzf69XN/4qpmdQVQPQaENX5gtofoMGIyCOsJqZhKcYrqYi7aLE0QUgCUKPEDNCJ7N0L/OgCaELY1dB6KLNfoSl5k+mtZ0No8ugqzbjepxgr1Ey8inQDmdX39mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712686943; c=relaxed/simple;
	bh=R9DZNLUvihF/0j3bu67pYVxV0LWbPEJ6hRj4T6N26Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRm9EynD0NfoJZ6Wb1a8IqGg74mf840xWgvninHXhpcaMXsXh1R426Sh+OuIyWdQ9hfnRdsq/kst4jnDHQa0OsT+ytM0LVfwWcrtKNIgHrOSUrUl6KKYWRR+wnxAdTgws1/rvB1EFkp7I04SMYnr9UdVR0f7zCfRC2Iic4W9tAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WnTCnBnr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516d09bd434so6404530e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 11:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712686940; x=1713291740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqU5kinVkYgX6Ul5/vMEToQj2v8t2TlPxIkdUFIbDKA=;
        b=WnTCnBnrqZycYn7QEm/5YqiVrH08CvCVgEsC62IUioola1C2GkpY0jdXbPP3c/8x2C
         hApP2bAemZ6zbyvNzub0Z+lP1MZLkTtaTRL0jmVxlVb1ecBPd/JZegcipPbe8H9mfoKm
         lwhkAT8cJ15fliWfxhYULfZfGu1qhPwrQb08Qzjy6h9PgRwGAeqBBvBV/voY5xbTxltv
         gzCZ9xH56IT9os0W8RT2OJ6+WzkE7vlc0mmerm8v8nQx/z5Eud7Q4dGIxGvhWcSXA4qq
         3tVheNOMWfcEY0ffjqcAbbSBIES/D1qUQ5/3yvGzXVnGtu6JaoRT9QnapiyxvxxH2BJK
         FJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712686940; x=1713291740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqU5kinVkYgX6Ul5/vMEToQj2v8t2TlPxIkdUFIbDKA=;
        b=QSrPvw/4HDc35p7Y2CXKhga8ibKGScr5NSD74PQMhtU3E6Fql0luPMlf3sgCeSIZy0
         c04AVjCIaJAc47MltBjHZo67RU3CwPEDzneGHn6l0+4gIt0RhELH+31qivKKybVdFphw
         HcwqNqLXJ1tZOJIsPbjKwXV2sAue7Y4olh0NsYV6hbE57guq40y+MKesWFaBGfIFGc6Z
         0hW893nZOnC3yd53/b/8hPZXh5C93kxZs/Tgil662XE+3tvqFGn7zUU2SQZXobYkpmOD
         dBHeKCMRq0sjwO8OqwSJS7zpRQQQjwexjTorwX9TJpW5NS7sCocuvr8KkoDg8BiW8e3K
         Jb6g==
X-Forwarded-Encrypted: i=1; AJvYcCXYFZ6lve6nPfgXo8kb98WmNomigX84xnFV8ghuCe0lxNrW+eE+by7C1uT7i0pq3JGTeU7oXTDHsEhjZZbEXac+y/WVuIiwSKH+2JwmDA==
X-Gm-Message-State: AOJu0Yz6rmHO4BO94VdtRzFql3IqN4J1RvWevURI686L6QHojWLMUXgl
	IEpUoxTL0y5l5icd01Zq5TAK3zgMbmInkxw8jwP28Fqbmwvxce4mW9bO3vLZHH4=
X-Google-Smtp-Source: AGHT+IF8WoDWjHVt9X8A67BNNBX6KY67tFf3C7LO/8eXvn8MdtBStRcN0SEflWbW6WpVON+EE16RYA==
X-Received: by 2002:a05:6512:3ca5:b0:516:c099:e785 with SMTP id h37-20020a0565123ca500b00516c099e785mr202781lfv.20.1712686939738;
        Tue, 09 Apr 2024 11:22:19 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w1-20020ac25981000000b00516d6924bc6sm1503203lfn.175.2024.04.09.11.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 11:22:19 -0700 (PDT)
Message-ID: <b4c56cad-0a3c-4b74-b9fa-0931204d1514@linaro.org>
Date: Tue, 9 Apr 2024 20:22:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/19] media: venus: pm_helpers: Add kerneldoc to
 venus_clks_get()
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
 <20230911-topic-mars-v3-3-79f23b81c261@linaro.org>
 <80c0ecb3-1157-1d7a-0829-c3b68b65f17f@quicinc.com>
 <66492657-3649-3bdb-b7df-0f5196418e06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <66492657-3649-3bdb-b7df-0f5196418e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/5/24 14:44, Vikash Garodia wrote:
> Hi Konrad,
> 
> On 4/5/2024 1:56 PM, Dikshita Agarwal wrote:
>>
>>
>> On 3/27/2024 11:38 PM, Konrad Dybcio wrote:
>>> To make it easier to understand the various clock requirements within
>>> this driver, add kerneldoc to venus_clk_get() explaining the fluff.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>   drivers/media/platform/qcom/venus/pm_helpers.c | 28 ++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> index ac7c83404c6e..cf91f50a33aa 100644
>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> @@ -23,6 +23,34 @@
>>>   
>>>   static bool legacy_binding;
>>>   
>>> +/**
>>> + * venus_clks_get() - Get Venus clocks that are not bound to a vcodec
>>> + * @core: A pointer to the venus core resource
>>> + *
>>> + * The Venus block (depending on the generation) can be split into a couple
>>> + * of clock domains: one for main logic and one for each video core (0-2 instances).
> s/main logic/controller. Applies to below places as well.

Ok - so "controller" is the cortex-m3 (m5?) that power-sequences
the DSP etc.?

> 
>>> + *
>>> + * MSM8916 (and possibly other HFIv1 users) only feature the "main logic"
>>> + * domain, so this function is the only kind if clk_get necessary there.
> To be checked, unable to get the clock document to see why only core clocks 
> (VENUS0_VCODEC0_CLK). Will update.

FWIW 8916 only has GCC_VENUS0_VCODEC0_CLK (and _SRC) and AHB/AXI/TBU clocks,
no (currently registered) clock for the entire block.

> 
>>> + *
>>> + * MSM8996 (and other HFIv3 users) feature two video cores, with core0 being
>>> + * statically defined a decoder and core1 an encoder, with both having
>>> + * their own clock domains.
>>> + *
>>> + * SDM845 features two video cores, each one of which may or may not be
> s/two video cores/two identical video cores
>>> + * subdivided into two encoder/decoder threads.
> decoder cannot be split into core threads. you can keep it like "each of which
> is capable to do any encode or decode"

So it's not about any splitting, but rather the ability to do both encode
and decode, sort of like how the displayport controller can nowadays do both
eDP and DP, depending on what init data you send to it?

> 
>>> + *
>>> + * Other SoCs either feature a single video core (with its own clock domain)
>>> + * or one video core and one CVP (Computer Vision Processor) core. In both cases
>>> + * we treat it the same way (CVP only happens to live near-by Venus on the SoC).
>>> + *
>>> + * Due to unfortunate developments in the past, we need to support legacy
>> why unfortunate? please re-phrase this.
>>> + * bindings (MSM8996, SDM660, SDM845) that require specifying the clocks and
>>> + * power-domains associated with a video core domain in a bogus sub-node,
>>> + * which means that additional fluff is necessary.
> Some background:
> It was done that way to support decoder core with specific clocks and similarly
> for encoder. Earlier architectures use to have different clock source for these
> specific decoder/encoder core clocks, now there is a common clock source for
> both the cores. Hence if any one is enabled, others gets enabled as it is
> derived from same source.
> So if we see the later bindings, the clocks were moved out of sub node to main
> venus node.

Yeah and I don't really see the reason why the binding needed to be changed
for this, you can simply get the clocks by name and poke at the specific clk*
(or an array of them), no matter where they were _get()-ed from.

Konrad

