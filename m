Return-Path: <linux-arm-msm+bounces-65425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0DB0894D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 11:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80523584926
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 09:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5D0289E0F;
	Thu, 17 Jul 2025 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cn99rS2j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2A5289E2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752744589; cv=none; b=PIAkX4lwmUZm4dODuqj/Kq4podPU2gfcPrmHtel3uabIiv3Fvxli63UA6Qog63sXVrm+iA3FkGh/No/Ih36XkMwhdTmOGnYuBQuEoX/Al9SBdoiRibObeMoGhiZsgbYKGuMiNVUTkes8rvv2j9nGD/VOYfGMQ7ap3RRY7DffW9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752744589; c=relaxed/simple;
	bh=rE8yPB6Hlg97Oq+SrHdkqJj1+cV5XZjvYUEm665XVng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2qw19W4TzT9+BwjuAj7T29PGbIhuxFqLTf+J5NABu87JP0HYNyprHuwAbuh3o3cETUhnWpXeq1izrrTpOX9VPDFRMRsPKM4qTdk6rJ84uhu0Hyt7N6r/rJcwmhCZyRy+2GhmjRB5xSlFLspI3pI6AdbklkFon8c+gYdbtiArl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cn99rS2j; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d3f72391so6395085e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752744586; x=1753349386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FBx9zx+OFnX0Zhf5hV0yDLTiVa32uci/a89Y9S0gZ0=;
        b=Cn99rS2jIBr6NglP8WfDbkEpX02MNGNdVZZLeoHQbCQex+Bw88q+qO93DonVWrZVat
         0+t85Irtog+9DE7+3g09ql1zdgF7Gz8rN9wOYMbz5Y8Q1t2qjMtThpFyeBlftN1oF1pD
         qbZvRkhbOrFEI7AOZrIUBeTV1OzUIdbbpu4I4i/nluzmy8/+D3EvUxgxNqFag6NI1Kzi
         5U7tvJD1yq+u0thJKFf5K7RFDk1pW35ttTubCw1NAInXEggr8WiEajDnFewEZjTu+q1X
         Sf80xOqo2jjZMGTSWRRJVrX7c47Mfq+1BW4wdhe2DXflYJWv24VGBTClQkgQnvFFqRr8
         kQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752744586; x=1753349386;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FBx9zx+OFnX0Zhf5hV0yDLTiVa32uci/a89Y9S0gZ0=;
        b=NZTdaYgQY7HAK6y5UMUJ2V6iWwuh671gnDewxB6RiS95lEiDAegvmdyzjIT7SHcsxW
         /kR+Y8YhJuKbPeiySYq1YJbH9nT5lksEGvhOVu/min9ZL0YlEpSJM/0xnYMNnskLD+2G
         3kisIpRZFvQbWh4x9ppsZh9KWISExc/UEBw7vNLlywOzpUMRt02NHkDOfLhoJgBRfYYB
         yDQMvFo4hbFukuXMkMX5kr0nsJy68OrIGi/EyT9ss0wqUwXQqsSJMq8aEfbQPuBLohs7
         n9UpFVAMdQEbgl3kEEt4PRbFCJlyuVLSjgEcOomGx2CTc+WDNmhxUlZ5Z7Fm22g4KVY9
         ORGw==
X-Forwarded-Encrypted: i=1; AJvYcCU61NmnRgfk1uPlnm7pVF95ttx4il6Z8BDRMtkavLgdtel4bPif4qhDxEwyfqPu1DdtNtUqobn2U1ESBamN@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLGMZnTDU6ed39WWW6XtGz/P86G1FZw3xIpdzd4P/16JKjeip
	MsKSDbvCAkL7/TtWr3PVyfDg5Yo8KmIUriTGm3JUnvTJvGfnxQB7psBqo01CewRj03Q=
X-Gm-Gg: ASbGncuV1C9cNl9NMcL8j70T6JkMxAK2c2Ju3KATBW/9L/VyJkOrm2F81DtDxRH+qY5
	7g9d4bVd6HKVT4rZ2Nt0oHWRGps6HlWYxPSmFs32RVuXHCQD2QEpPSh7UTC0alBLM9PqbWSTxss
	ftJPEBjO3Lbw1DiuLluHV33a9MMj2n3rkbbi46k3zR53s+pjkT7ns9yBljtBFyuXMzVH8BsScDP
	QVgwUU3uWPWgQU2aKX2J2jTwdvun/G4hyQ5jWpl05ogWc3DUjATEmcUnfKWTssF3VThWQqcq3Jl
	Xe7gBKMcHGYzpDiWAOz5n4bZyKfbnpye/lpt27ypaGfOvEdIyPBS1Yl9zut6jSsvVn6rB8uDIOb
	BvR3L6Gz5NVePOHEG9ToksHYnsk7N4xo3M6c+fCLFSAux4SaET4DcTzCHu99oKSGkkBszLvvjOA
	==
X-Google-Smtp-Source: AGHT+IF47FsmRKbHX/rLmLQrUaYE+xdPrz7LbZ3X35FNDExHDUvsBvp/qgkII3tTDlHgd2onvoADnw==
X-Received: by 2002:a05:600c:4f4d:b0:456:1006:5418 with SMTP id 5b1f17b1804b1-45631b21429mr44285585e9.13.1752744585978;
        Thu, 17 Jul 2025 02:29:45 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f8cc6esm16924625e9.26.2025.07.17.02.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:29:45 -0700 (PDT)
Message-ID: <8ac6f365-205a-4140-98b1-847f54ce08af@linaro.org>
Date: Thu, 17 Jul 2025 10:29:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] media: venus: Add support for AR50_LITE video core
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-4-jorge.ramirez@oss.qualcomm.com>
 <4734edd5-8224-4caa-8844-c38dabc6b6c0@linaro.org> <aHij+NHG5xbM1paO@trex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aHij+NHG5xbM1paO@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2025 08:19, Jorge Ramirez wrote:
>>> --- a/drivers/media/platform/qcom/venus/helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>>> @@ -230,6 +230,24 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
>>>    }
>>>    EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
>>> +void venus_helper_prepare_eos_data(struct venus_inst *inst,
>>> +				   struct hfi_frame_data *data)
>>> +{
>>> +	struct venus_core *core = inst->core;
>>> +
>>> +	data->buffer_type = HFI_BUFFER_INPUT;
>>> +	data->flags = HFI_BUFFERFLAG_EOS;
>>> +
>>> +	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
>>> +		return;
>>> +
>>> +	if (IS_V4(core) && is_lite(core) && is_fw_rev_or_older(core, 6, 0, 53))
>>> +		data->alloc_len = 1;
>>> +
>>> +	data->device_addr = 0xdeadb000;
>>> +}
>>> +EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);
>> This function doesn't appear to have alot to do with AR50_LITE as it
>> pertains to IS_V6() and IS_V4().
>>
>> This I think should be a separate patch with its own commit log to describe
>> the quite complex logic of version numbers going on here.
> Let me give it some background:
> 
> According to the HFI specification, EOS (End-of-Stream) buffers must
> have 'valid' addresses. While the firmware currently appears to make no
> use of the EOS buffer contents, allocating and mapping them would have
> been a better driver choice IMO. Hoever this one has better performance
> which is probably the reason why it has stayed.
> 
> The firmware then does perform operations involving the buffer's size
> and length fields, and enforces boundary checks accordingly. On the
> AR50_LITE platform, an earlier firmware version lacked a check on
> alloc_len, leading to a division-by-zero scenario.
> 
> This has been addressed, and we plan to release firmware version 6.0.54,
> which includes the necessary boundary check for alloc_len.
> 
> I should probaly replace IS_V4(core) && is_lite(core) with
> IS_AR50_LITE() instead of trying to give it the appearence of a design
> feature.
> 
> seems the sensible thing to do, right?

I'll stipulate to all of that.

I know I'm being pedantic but, the title and subject of this patch is 
"AR50_LITE" does stuff.

As traveler from a mirror-universe - I would read the commit log here, 
look at this function and be none the wiser what was going on.

The EOS check is a fundamental HFI capability which is why I again 
reiterate it deserves its own commit log with the above explanation - 
word-for-word would be fine from my POV, to explain what is going on.

Long live the Empire!

---
bod

