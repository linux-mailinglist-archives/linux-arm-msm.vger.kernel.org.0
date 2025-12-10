Return-Path: <linux-arm-msm+bounces-84918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3027CB383C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 17:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBAC1310676D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 16:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10B92FD686;
	Wed, 10 Dec 2025 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acYRSLa/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A78322B86
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765385080; cv=none; b=GWv+lc67C7G4i7Idh+vV53xsiUQ7RadeVuwH27Ye7rcnNn2An9tV3lIvVXyvdsJwxOpMy6IJuSktkWO3uH0FSbIe1W3mgfCA/U9ZV67cgLHIMH3lHa8vj64ORxYoWzGYeLSbFl5hVXx3C03AMYAiq2TT95SujYcTRnCQDuqd6q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765385080; c=relaxed/simple;
	bh=5lXmgs/stRMUibhuCfIoze3Ky7oqze7sWQBQR+1tz4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWVsiXaThgNudsGA3BdTMg/ZjwPWbW+qxFUPdTq2leI7e/PbWna7uzCDAxzfkk5eVfvJspaY4QSPCwkd93q7jiBGeVk1AMuWC/J1qLBUthoFgZDjnnect5DBchY7dHkrz5VYb5FMMtmCyZ2AIrs/YTDmgF8r5Zp/CrgGCGQPPS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acYRSLa/; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45085a4ab72so15120b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765385078; x=1765989878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fe+C5mqjLom5oIaj0zBUMz02S2VimkkYcLNuO4HcVKU=;
        b=acYRSLa/gZHTG8+AWq8mg9d1tcawvAuqc5NvpjxbzdTcug5aTSYrqK1Zq9a0K71N0Q
         0uCgIcmjtW4z+Mces6OP4N49c9lJ63n/5sWcvEIr7FcEZlPF8OTujaVX37Zd0WOO6O4P
         dgUxSkEyn9Kh1DHpDedl0Kb8XSToHCsZt9V/1BpeCRHxGo0Ood7dgMFy0EUEvpKiCKGm
         /I+lvIF/tSsPQVG4Bv1I0Y7AsJK8twi81YyB/3F7o+r1VVTdac2hKXDxWl1Q+GK/R8AW
         NhMkZLIZjTCO6hlhW8faniSx7q53/qdy5JAnAStKjOi6MFmC/BTUcEuyq/bb8TW1j0qj
         t4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765385078; x=1765989878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fe+C5mqjLom5oIaj0zBUMz02S2VimkkYcLNuO4HcVKU=;
        b=fTPVSKN75t6Ta7ePYwTGsFYxyID33uxf1/B/Klo3kawbRG33ktyV+q1fgxGBsXx0+h
         2WlpkuQX+AknDc5WXCXmwvMtaOXvlz5c7pqSTDH9PzX2tXBedHva1NnqcyEIdiQOCsJp
         KbWGOmWqv1hCxMOM65ozpG9+KLmmTW+VmZrUF8xKxBn84tWvsWELxuld+ROPN0ZOP6Di
         ywT67lT7J/3NSgD+sn/I7OC14I+24Wp7R4Q0mq2qphfVMfMpqJnQPzMOq8TrNX8jvwvh
         u/0glrlhUU8L8Te5PR51zoQ6scbnmq+ReaD8hlhy1su/B4lXk8PljE8m+LQeHQeIl3wk
         6d5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCOdmvgiizOOrws62KRbQxzmwBjrlS7HvB8V1fi87l0lONBjzn/fHuT/bD0Z0yldJQU98V4V1qI0Q/ggQA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl4BLYrl2BlwOogqB9cgFmaz0qnw/BiXKkwB9bI7G4+1rh2P9U
	ZaDO/4qKLPNUadImTzi/Yvh+9XUfSYnikbBrN2U8TrYJgGsI3Eaom3Us
X-Gm-Gg: ASbGnct5DhcdcdtwK6u31Pvj7hzjvqyT6eNu6d07Q3s8T5XXFR9tXKf3+tGbphw9xmu
	CBAPmBlST529a3cN9p+Z6gCwYIKpjpP/YuJx/fDr+sFhRgZ+YMj0hYIAdo+Ece3+RxGfx8IY7V3
	UT7YMujRNOMZc9H8qPyqEVeaTZncENZ9CMhQZrVWYYnVQnkh8Y4CZbf7Q7QplwMKrNNGta0/shd
	WS2XUu6Z7oT8wg7oX7AOutB3qn/0V1o5/dZlZxDkASK6qn41UpOy3JrmlRpjgReea0EQQuiCjaD
	T2c9TL+Sg9rysR3TVnTK9QtQj6IpEXwKf/YASJwd1ExYwPGXDEepth1FTCWZETXu8d/OjiWIUMr
	pTIBwEFWzsbm808E5fJ8jklxWMeiEWR09hg7PMMbvFLsS54s4n69ZgR4YhUQDG3H5zKA5hnsw9n
	jOgxwLA40Riho+cIsMNbTbfEaG0Zr0Lrz36qKbfau23F4l5nouqk9/xpC9GhUHSeATWuwRi3PXr
	iXz44Z/RiFNVXb6AFmg0NdIm+5Lky4ssA==
X-Google-Smtp-Source: AGHT+IGWObYgECUCpc8Zzt8XtuRcY/+814VNZUAhoHSJ0G/slzeqGFO7/OFiiyxzKvwoDpst4n0Mqw==
X-Received: by 2002:a05:6808:118c:b0:43f:b94a:14f2 with SMTP id 5614622812f47-4558659502cmr1844848b6e.16.1765385077854;
        Wed, 10 Dec 2025 08:44:37 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f5d513ed2esm95536fac.17.2025.12.10.08.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 08:44:37 -0800 (PST)
Message-ID: <5749e29a-79e7-4a0e-b23c-aee0df23820a@gmail.com>
Date: Wed, 10 Dec 2025 10:44:36 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Use 'usb-phy' for node names
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251209160755.3878878-1-mr.nuke.me@gmail.com>
 <xmserprghzwpcxt7ionh2ju7o3cudj5emtkycvurbz5obztzr5@lkllnnsag6ri>
 <23d3bc82-0909-42a4-b4a9-742834faec76@gmail.com>
 <959b3e2a-c11e-47b3-8d8a-03dd9ae18254@kernel.org>
 <b167f406-c5e6-437d-bb34-57f253258f54@gmail.com>
 <ca3934c2-532f-4744-bf7c-2480048c7fef@kernel.org>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <ca3934c2-532f-4744-bf7c-2480048c7fef@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/25 12:03 AM, Krzysztof Kozlowski wrote:
> On 09/12/2025 22:59, mr.nuke.me@gmail.com wrote:
>>
>>
>> On 12/9/25 3:48 PM, Krzysztof Kozlowski wrote:
>>> On 09/12/2025 17:26, mr.nuke.me@gmail.com wrote:
>>>> On 12/9/25 10:17 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Dec 09, 2025 at 10:07:54AM -0600, Alexandru Gagniuc wrote:
>>>>>> The devicetree spec allows node names of "usb-phy". So be more
>>>>>> specific for the USB PHYs, and name the nodes "usb-phy" instead of
>>>>>> just "phy".
>>>>>
>>>>> Why? "phy" is more generic.
>>>>
>>>> Hi Dmitry,
>>>>
>>>> The goal is to be more specific. I find usb-phy, ethernet-phy and others
>>>
>>> We do not have such goal. Where did you find that goal documented?
>>
>> If the goal isn't to be specific, clear, and readable, what is it? Why not be generic, and call subnodes node@, or dev@ ?
> 
> 
> Did you read the spec you referred to? What sort of class of devices
> represents "node"?

My statement was intended to be a reduction ad absurdum to the generic
naming argument, rather than my public exam on the dt 0.4 spec.

I find it useful to have node names that identify the function as
clearly as possible, or to see ethernet-phy and usb-phy under
/proc/device-tree/soc@0/ and /sys/bus/platform/devices/. That was
_my_ goal. Obviously, you and Dmitry disagree with that goal.

Alex


