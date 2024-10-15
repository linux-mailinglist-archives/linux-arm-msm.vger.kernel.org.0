Return-Path: <linux-arm-msm+bounces-34494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8EA99F6CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 21:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AFBB285A4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 19:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496101F80C4;
	Tue, 15 Oct 2024 19:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTLT/HXu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D5A1F585D;
	Tue, 15 Oct 2024 19:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729019422; cv=none; b=NI0D+PhcETZj+yrMj9wFz769B6DU45M7KXAVs9doSPQZqKqn8TPBARovUS8D7vM7E4IaVTtjTV7J37HMX4rz8dLOAowzaBWGuk+TBsEix1VHp8E49IoTDL9kR6/IdPpK5zWu6srmoATISp0vwG0auOjeRrwChw6s9+dQmWkWqcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729019422; c=relaxed/simple;
	bh=ihmSNqolTKBiiiM70WcLuZBVNYQgdPlqo5c5+tAg6Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfRNLdpj2z8c/BW7Gyc+mjvRJCEtUDUuCJLURujFBhJE76Uj47oTGwVx9L8ihpscA2pm5Ouyar5yqZnA3e4ROEtqDBNjqer9wEsllHgavtDCTuWX3JGhOiCF+wCsxwqN4EXvQ4R4DWTmWwUJvOiYj8dTsD45igF7IJE7m97TtvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTLT/HXu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4311c285bc9so41979525e9.3;
        Tue, 15 Oct 2024 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729019419; x=1729624219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OGKWsuddELHtQYb9bXGQDuBGzTg8aShe2wjuaHBaImE=;
        b=HTLT/HXuhdRaeWJEmk3cab6xHMAnKPkPMHShhLEL7FU1DiW/HE+oUlEyWRtYjYxeVe
         xOyyNfRdsnhcMQRkkLyY9ZqaJOF2GtdtPVi83MNOpdS0HqzLo4TmZ1mDz5Yk7YBsGAr1
         OKbmpz5CcKXLeonG1uH0cTEGolaiL4lfvY7WxpPjpv805g+pRnljhfsWSxeJ3AfZfWNx
         1Q5TBRCp8SVoXbE6l5E8I7WbQ/EZdEydHN/Jykg9ZpVimB3DibbZH9T9fekMg5BuVukU
         CNCGPZ7H/7X8C5yl5xFN+sQ7dSp9Iqrv9zmEBXXnMvFjNPUGm7YfJHjkM2WhkVtbkBZN
         htRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729019419; x=1729624219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGKWsuddELHtQYb9bXGQDuBGzTg8aShe2wjuaHBaImE=;
        b=s24FSZJkbMiD95RCUDwIDM9KO1dTYIH8zQ6bZnZRWyeo2+41edcohjugFRu+H/Nj8M
         tOeajRmv/Wj8odaMyDrlOjBSxqQtnWgLOmIG3U2TsCbKJwq5ySlHe/YEQ0FUac27mUG5
         y29Hq6jYj6O6Hr0bx79DGpgjId+hmyYGrrnQy+Tn4hKGwksiA6KAsrvCxENUOlWZrLtd
         YLgcIXm64oC0OTlRMWr4JWuwUceQHGTG1wwDEIfuzPw9XdxRpGjG56uBHT+wMPoGKVP7
         WcrovCpf0HyKF24LQXVOl3FHfvWYdsrEbtpeay63YgF4CFe0yDyaarzFG0SQc82go2fd
         EuKA==
X-Forwarded-Encrypted: i=1; AJvYcCUNJG8+s8r0XF61rW7eFGn8VSPG2w3uppF1DkMK+DfI3JGi2uodG6eWcQi6k1XAoqX5un2PONMKG0Jn3vHk@vger.kernel.org, AJvYcCXEQWu0/5uWVUX9iezzoNhB9g+iY6Oj1a7HgQWHym1ffzyd4i1ZGTjZHp/DTfiHu5f6ARHBCDN0EvLHnOmPng==@vger.kernel.org, AJvYcCXVWsy0CYyM1Xau6nXY/+TbpDJ2fvV+TmF12UH56uuQvfu/Gu/6zGBJm14Lb2jJ6WYIVKxM/bcPBbHC@vger.kernel.org, AJvYcCXs0g4MLEydftGigRGxyrybSxTYUP5lrhYvHGsHpqojaoQ6XLiNI4POm99xayAjAFI46kWfOjIL45/r@vger.kernel.org
X-Gm-Message-State: AOJu0YwpB8k9mOuGvVYdhaxu2cxgKqpcVdMbK56aG2um/aCL30Y7MoTZ
	CcpaZWBEZKDXk4Rr3Cvte5pFPpf177HtRgNwbLqjy+bYPcT1VWZMmw4U8Qrc
X-Google-Smtp-Source: AGHT+IEutnNqynOG4Wf+eWTXk6+7XPReQX7ZugZvNO8APwPPG8HOjRVLgcYFJj/SKks39PcSHfcQWg==
X-Received: by 2002:a05:600c:41d1:b0:431:3bec:4390 with SMTP id 5b1f17b1804b1-4313bec447emr35470135e9.1.1729019418403;
        Tue, 15 Oct 2024 12:10:18 -0700 (PDT)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56eb0bsm25737835e9.22.2024.10.15.12.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 12:10:17 -0700 (PDT)
Message-ID: <2ed80ba6-e64f-4122-a6bc-c224c4e92e0f@gmail.com>
Date: Tue, 15 Oct 2024 21:10:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] usb: typec: Add new driver for Parade PS8830
 Type-C Retimer
To: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <Zw5i9dcSMOG4n3PW@hovoldconsulting.com> <Zw5oOUeN/v+tz+SY@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <Zw5oOUeN/v+tz+SY@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/15/24 15:03, Abel Vesa wrote:
> On 24-10-15 14:41:25, Johan Hovold wrote:
>> On Fri, Oct 04, 2024 at 04:57:36PM +0300, Abel Vesa wrote:
>>> The Parade PS8830 is a Type-C multi-protocol retimer that is controlled
>>> via I2C. It provides altmode and orientation handling and usually sits
>>> between the Type-C port and the PHY.
>>>
>>> It is currently used alongside Qualcomm Snapdragon X Elite SoCs on quite
>>> a few laptops already.
>>>
>>> This new driver adds support for the following 3 modes:
>>>   - DP 4lanes (pin assignments C and E)
>>>   - DP 2lanes + USB3 (pin assignment D)
>>>   - USB3
>>>
>>> This retimer is a LTTPR (Link-Training Tunable PHY Repeater) which means
>>> it can support link training from source to itself. This means that the
>>> DP driver needs to be aware of the repeater presence and to handle
>>> the link training accordingly. This is currently missing from msm dp
>>> driver, but there is already effort going on to add it. Once done,
>>> full external DP will be working on all X1E laptops that make use of
>>> this retimer.
>>
>> I was gonna ask you to include the devicetree changes that enables the
>> retimers as part of this series (to facilitate review and testing), but
>> perhaps you should indeed not post them again until LTTPR support is in
>> place.
> 
> I was thinking maybe we should not wait for LTTPR support as this series
> brings orientation support as is.

It also happens to bring an undesired crash-on-unplug feature when
DP is enabled.. I suppose it's fine to bring this series in if you
separate enabling the retimer on devices from wiring DP up.

Konrad

