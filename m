Return-Path: <linux-arm-msm+bounces-38725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D36D9D55A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90C8D1F21446
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 22:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55CE1DD0FE;
	Thu, 21 Nov 2024 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbHx9+Dr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF55695;
	Thu, 21 Nov 2024 22:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732229252; cv=none; b=OO7asPfbRVgMo9MRIoMAOkuTFz/FgZkqDWkrtaN++NBqjjEcrWy3TndImvOj2W0TOT/m+7S61XiM37R2YjSpMleqQ+SA1EaRPekLAoS1qtJenkgH05ZaVUJVsS4S8E6pNTxHkdIbaO0aOMAlV1KUAi1cM52Q43J5yDQwiVoDp5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732229252; c=relaxed/simple;
	bh=VW7tTRiIAv1QMTyboro/hE7Usujn5p2rlmQqvJdRP2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbfOGISmH83tFL68VcO80Vh7NGMz5zsp6BXYEpOlqxy6ruexsvu2I/pbvDOS34B859fkzksa12ytHFa6c68NkjunhDNco+ADTqjLa2RJlY6yRwtkseqFIxpv2JkRskEBSf5KQdCTOaTIeuokiM29tsijrIFV3c5hXzsM17fVkMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbHx9+Dr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4319399a411so13143305e9.2;
        Thu, 21 Nov 2024 14:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732229249; x=1732834049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Nk9fK4JWlgagJ1kpp8N9NH5gPa4sBDA9mJEW1eUThs=;
        b=hbHx9+DrZxLkLABSTyJRSrjIhEz/58VvWDNZYj3mdE5w96Ilvuo1IutWHXewg3DcSk
         QBJPUbi0A6qI3dLiXahi6+50EXYQ5AgkFBCyys4JxCHMhq1s1/+ag5G+phwK1Yan0+o8
         hqUfqV6030X9J59SHsGZ2cK2pF+xh0TXXtvi8dPBf5apW1Y7veNPPhDTbjPad5dEXuqu
         smdpD7n1WTVNs8X4cTH7L57ifAFC8shIKD7klcC8HRHmaMNTXB1ujT+sN1JGnlXdI0wh
         5x8EWw9IuDznz8vt0BHgkqUSiZZgYtYeyQYBY32b3NS23VAGV2WwvKX5bx/J76UKnA9u
         8zJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732229249; x=1732834049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Nk9fK4JWlgagJ1kpp8N9NH5gPa4sBDA9mJEW1eUThs=;
        b=IRKw2OYRKjA3gvmtrGGWmKfku1q165m4Tf1IpVLs/401ktOKX8pFlPQtvlyScxWo0P
         ubwoJ8c0V1yGTbpYfP9SZLW4IzDZ21k8sJJ4TK/npBjSuU/TOTXmndIJj35a0THmjbSq
         56juvvegCH89u5s2v36DEqPRRFb71WXJu/Ry1DEcmY+uab2Q1ilkfeTScgKBzYPYcKgV
         Ou18gRuTJB/laBLs7+84POCFz9inGiLY2/5Bf9VkGTdyJXPVFMNc0Bxe+6e09Z03MgpM
         y6ZqLWs5oSn3HshTZ4pOOzOJEUAJYpivtdYML5ADLuSQYnvSlZuH3rl0oWDVQo9Ze5E1
         NJFw==
X-Forwarded-Encrypted: i=1; AJvYcCU2M7kh1zT9diHuo4qfvBGboRCQECRL7GUdLTvxzeTSFaMjAXuwr5Cf/uHaC5v4FjDoapASusSzdSa4PYPy@vger.kernel.org, AJvYcCWli6MjfQbUqN7Fcam3SH47WRN8BIzVsq5pdqy0KEK/Di+mJH12MjzqmOP2LOXgVu9YusfsEajh@vger.kernel.org, AJvYcCX/HeKiNqmxTr/F20DAhBr0vOy8in471785TfL/2ug6lHDETxfSZnkJTQL/5i6ocDX9u1TjWc/JM9wZVafZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyJNA9Az0PCwpD0O0CN1zoL0NqfSKRlT5XwrFlUk1EDli4Qj4Kk
	FjEB8t326tDT2GcbghQiU5JCBh9mIjhjUs694hxAzHwgfm7cm7+z
X-Gm-Gg: ASbGnctbY2xs3qUvQRwl/8zSYstbPsr3ZBIYlEkNDIei8C5vScZSupbaxQeqDB7hPtc
	X3GUQLpq5y2gmDhXpqHr1+H1g34AVTLRaxLNi2/Z2OWn4ngYx/hePBR91B0cran29DBEj4x1cKg
	/ZSlgbrjVe95YACgltg44U/x8F3u63eD0iwHS0cShq6hodiIhtWofvkBrIgwHDwhZ2pVHB16UA7
	9iSSG1vAVF4sDarzjFFhUS5IcKzKGN5IvVWPF4XU3+cKKeMf6I=
X-Google-Smtp-Source: AGHT+IHhNMpbhtfsR58XBjE2yLhVvJGJGzZJcQFDA08gpNGngBlSgE/v8hVIIhUTbWukcSqs8HgN3A==
X-Received: by 2002:a05:600c:348b:b0:42c:c003:edd1 with SMTP id 5b1f17b1804b1-433ce41ce4emr4943055e9.10.1732229249204;
        Thu, 21 Nov 2024 14:47:29 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde97c68sm6688705e9.36.2024.11.21.14.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 14:47:28 -0800 (PST)
Message-ID: <7c3e2575-24ea-4294-a877-59be65e4af5d@gmail.com>
Date: Fri, 22 Nov 2024 00:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: wwan: Add WWAN sahara port type
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Jiri Pirko <jiri@resnulli.us>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jerry Meng <jerry.meng.lk@quectel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241120093904.8629-1-jerry.meng.lk@quectel.com>
 <863ba24c-eca4-46e2-96ab-f7f995e75ad0@gmail.com>
 <fbb61e9f-ad1f-b56d-3322-b1bac5746c62@quicinc.com>
 <CAMZdPi_FyvS8c2wA2oqLW5iVPXRrBhFtBU8HOqSdNo0O1+-GUQ@mail.gmail.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <CAMZdPi_FyvS8c2wA2oqLW5iVPXRrBhFtBU8HOqSdNo0O1+-GUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+Jiri

Hi Loic,

On 21.11.2024 11:08, Loic Poulain wrote:
> On Wed, 20 Nov 2024 at 22:48, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>> On 11/20/2024 1:36 PM, Sergey Ryazanov wrote:
>>> +Manivannan
>>>
>>> Hello Jerry,
>>>
>>> this version looks a way better, still there is one minor thing to
>>> improve. See below.
>>>
>>> Manivannan, Loic, could you advice is it Ok to export that SAHARA port
>>> as is?
>>
>> I'm against this.
>>
>> There is an in-kernel Sahara implementation, which is going to be used
>> by QDU100.  If WWAN is going to own the "SAHARA" MHI channel name, then
>> no one else can use it which will conflict with QDU100.
>>
>> I expect the in-kernel implementation can be leveraged for this.
> 
> Fair enough, actually the same change has already been discussed two
> years ago, and we agreed that it should not be exposed as a WWAN
> control port:
> https://lore.kernel.org/netdev/CAMZdPi_7KGx69s5tFumkswVXiQSdxXZjDXT5f9njRnBNz1k-VA@mail.gmail.com/#t

Thank you for reminding us about that conversation. There you have 
shared a good thought, that the WWAN framework suppose to export mostly 
management ports. And all other debug/dump/reflash features should be 
implemented using corresponding kernel APIs.

Last year, more port types were merged. As part of the T7xx driver 
development. Specifically it were Fastboot, ADB, and MIPC. See:
- 495e7c8e9601 wwan: core: Add WWAN ADB and MIPC port type
- e3caf184107a wwan: core: Add WWAN fastboot port type

If ADB somehow could be considered a management interface. MIPC and 
Fastboot are firmware management interfaces. And I recall a discussion 
regarding the Fastboot implementation and there was a NACK from someone 
from devlink subsystem.

Personally, I prefer the firmware management/debugging operations being 
implemented using a generic kernel API like it was done in IOSM. And we 
are suggesting contributors to use the existing kernel API instead of 
exposing RAW interfaces. On another hand, devlink developers are not 
happy to see this kind of devlink usage.

Loic, do you have any idea how to solve this puzzle? And how do you 
think, shall we do something regarding the already introduced 
Fastboot/ADB/MIPC port types?

--
Sergey

