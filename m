Return-Path: <linux-arm-msm+bounces-29124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019F958865
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 16:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9663BB224C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 14:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A58D1917C6;
	Tue, 20 Aug 2024 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOL8kjBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9791219068E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724162520; cv=none; b=mAyuA+OlCyvVWmxJz6unNnRPDYGHVyYxEr/x9Ed8Hes2Kehlwbtr1aKuhfYIdFcq0oBOxPzwqueiBdftG+r/XAWIfIiT/nM2Vc1k7G0p1gkws3Rzw+QQBawv5opFYZlILLJjov6kVdRecbk0FaLGJ044Q94sdSLOsW5NIfJiI7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724162520; c=relaxed/simple;
	bh=W1aCTznwTEgUcFmasnrHknG0hlrRETKrRLGcr1yMS7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FeF/jKbzArK4nrC8kVNF+kP9lkXYgy+bLR0SAzUSbwAg4Rga2OgnEhVin1k4GNK6zvg93XcA8yEKC59Izt4NuXjgetozjdLqDMCAFWjqtROIOzKb+aaCR85v1Dcoq87bcSqSiNlZL37XBHa5qpiuQkOdmJE+LYaHGuajIZlhPbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOL8kjBp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53343652ec0so57218e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724162517; x=1724767317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=179ilzg0jHjhdVPMFW9T7CSDrvc9WJH5y//WgUvp4Aw=;
        b=OOL8kjBpXgRcigl2zIqN4Oc/HZwmL6b3mLSK+9DRSG5S8ZatpRyxK/RxkTasgSGrH4
         BoLgiQkTUIqqYiKnlMFjhZI/nHjtvbk/+2n7IucZK2V+wk7DdQMs/hzYMVL+1NxOQg+3
         BzQFDctygwmXBi2J8fcfNy8V2e/i/bD30uR0xTb323ycPfprmsnGcP+2F1FaAQMqFz9/
         SgTPdarqGALhvPCm4zoMWk7DSMaqXTMwtBKdkiHxYPftTjKI0FB96jOMH2P7bVwoYquL
         fE6DrdGbmYTujgBNvhPEZj5aWXMfT+UkGZUV7DU7pIhSRECiSas05AwAzugKG4qIMD7E
         e3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724162517; x=1724767317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=179ilzg0jHjhdVPMFW9T7CSDrvc9WJH5y//WgUvp4Aw=;
        b=aloQ1CqQYNSXgfq+glfyQZchpHWI0ZMcit1FFl9qsgMD3oKF4uQ+W/506vSMRleAuc
         4GwMGOngwE2HLJ0lFkgR958+plANyc+64fO/Xw4qhUZYgRPYvuG4KPzcOwK+bsW1vogx
         1BKST7tAr+2JoZfMmivfOmhlCsBX30//yTfIasTFYn/tiEHdq+ufp5TJPEBTDT/tpluU
         0HcVBYXVkCOH5xQttv7HPnouIK50MgF+jtcrDouusNs8VKdeyq6H/YD+uOhdhLy+kcdK
         TZ3WZqVviNPeAsuT6EE+cNABTpUs4gEs4zJnw6mb+G9jvAxgkEqdsh/iSYrw5LsWi8uG
         M6vQ==
X-Gm-Message-State: AOJu0YyZ259E/CpCg0tIRGRuE5VFEZobRxukX7yNh6vc6ek7pFq023na
	nQ0OOH6zaNXs4Px45t+seCVlDsnlPLMbg7/P6L9xXfDoMZAV5ZwGJIpMJENIEzk=
X-Google-Smtp-Source: AGHT+IH4zyYxaDIvbndYXLzT2iVNgnVpMaf8qpZV0fZAfNc4Ach0eZkimu4I39qB7YDt1h3vCCyUig==
X-Received: by 2002:a05:6512:3052:b0:52e:93d9:8f39 with SMTP id 2adb3069b0e04-5331c69ef07mr5292733e87.3.1724162515979;
        Tue, 20 Aug 2024 07:01:55 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5333fb2f738sm233045e87.46.2024.08.20.07.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 07:01:55 -0700 (PDT)
Message-ID: <5e3b0d2d-1af1-4507-a890-6c1be0e09292@linaro.org>
Date: Tue, 20 Aug 2024 17:01:54 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <4b745c1a-33d9-472a-97af-153a2a7c8721@linaro.org>
 <2de0b7a8-b879-49e9-9656-ec86f29ce559@quicinc.com>
 <b0787142-0f85-4616-9895-72e33f21c2da@linaro.org>
 <82200889-a98d-4815-bc31-f81b15d02513@quicinc.com>
 <7130beef-7787-42a1-85c8-f27574241ba7@linaro.org>
 <5ecbcd10-d9b7-4134-9666-6df790527b1f@quicinc.com>
 <56211603-de02-4b8f-a7c6-a4d80ace4e2f@linaro.org>
 <de2c8fa3-afc1-4163-aae5-3868ca59e95e@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <de2c8fa3-afc1-4163-aae5-3868ca59e95e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Depeng.

On 8/16/24 15:42, Depeng Shao wrote:
> Hi Vladimir,
> 
> On 8/16/2024 5:31 AM, Vladimir Zapolskiy wrote:
>> Hi Depeng.
>>
>> On 8/15/24 18:43, Depeng Shao wrote:
>>> Hi Vladimir,
>>>
>>>>>
>>>>> Thanks for the confirmation, even though I add the rup_update and
>>>>> buf_done function in later commits, it is still called in platform
>>>>> specific code(camss-vfe-780.c), so I will keep as it is done today.
>>>>
>>>> let it be so.
>>>>
>>>> I have another ask about it, please move new camss_reg_update() out from
>>>> camss.c into camss-csid.c, and camss_buf_done() from camss.c into camss-
>>>> vfe.c
>>>>
>>>
>>> The cross direct call has been removed by below commit, so it looks
>>> strange if I add the cross direct call.
>>>
>>> media: qcom: camss: Decouple VFE from CSID
>>> https://lore.kernel.org/lkml/20240522154659.510-9-
>>> quic_grosikop@quicinc.com/
>>
>> This I don't understand, please elaborate. I don't ask for a "cross direct
>> call", but you do introduce a CSID specific function in the generic camss.c
>> and another VFE specific function in the same camss.c
>>
> 
> CSID calls vfe_get/vfe_put to power up/reset vfe hw in old code, but
> above decouple commit removes this cross direct call, this commit has
> been merged recently.

Apparently I was imprecise, this is not the thing, which I don't understand,
for me it was the wording of "cross direct call".

>> What I ask is just move the current versions of camss_buf_done() and
>> camss_reg_update() out from camss.c to the files, which are related to the
>> sub-IP blocks, and of course move the function declarations from camss.h
>> into camss-vfe.h and camss-csid.h respectively.
>>
>> If possible there shall be no CSID or VFE specific specific code in
>> camss.c,
>> and that fact is that it's possible.
>>
> 
> Yes, I understand what you mean. Let's take camss_buf_done as example,
> if we move camss_buf_done to camss-vfe.c, but this function is called in
> csid csid driver, so here will have a cross direct call again,


> camss_reg_update is same. Since the cross call is removed in above
> commit, then it will be strange if I do this again.

It might be strange, but what I ask is to make the code way less convoluted.

> So, I moved them to camss.c

I'm still missing the essence of having two layers of indirection instead
of just one. Previous code was a function call from csid to vfe, now it's
csid to camss to vfe, I don't understand why there is a need to introduce
just an additional layer, it greatly complicates the code, also it slightly
drops the performance.

Previously there was no 'struct vfe_device *' or 'struct csid_device *'
types in the generic camss.c, now these "new" types leaked from camss-csid.h
and camss-vfe.h into camss.c, and the reason why remains unknown.

Okay, please ignore this one review request, let it be kept as is for a while.

As a side note, generally there might be various reasons to revert the code
changes or to return to the previous logic.

Thank you.

--
Best wishes,
Vladimir

