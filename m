Return-Path: <linux-arm-msm+bounces-89483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7613AD38A62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B5CD30151A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4483126DE;
	Fri, 16 Jan 2026 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="K7RnfShy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982D117A303
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768607246; cv=none; b=DsQTqBB69VWEmK0zR5b6mMaa8I/SgSuj1oDoKolgwIXI9QjouLP448Y3ZjR80drIwCHPjNdFbDL/zAeBllnbQs7YWkmYK2YoAuWCPMjTtugjC5CCjAuqbxQu7v+Xo8YFiMrwcvWev+GEbmWUBpcoxO4TXY5XDQbkThg8d8BKt1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768607246; c=relaxed/simple;
	bh=YCnOrVHDXhWdzQMwWovwcpqiz8uUp4sj1VBz21E2ms4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hVtbqcXrXAFIlIr8LbQMDMLmQs3ehZvifrJXrQjUll6YtjbYcKKNCMFLbAwRuswMTtPgg9Y/vTECnGarbXwizk8dT+8ixTyIkBFztDJRVM2pM6LztPlw2HzqRwPCxpLrPJObgnTDgQy/wYQ6wOuKgq9qxrI2ikL3iscDWIuabuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=K7RnfShy; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c5386f1c9fso408883485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1768607243; x=1769212043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shfPp2KoeQSvAsE+lzy86eQNZOUQOmOwfsSErLe5hXk=;
        b=K7RnfShykN/sP6cAjw0avQrmeFcPZ1nsq6m7Lf56G36KkxqT9HfDAEmFnyAop85t00
         /nB724VZ9OTdVZeXO8clT4AUZZalMpsMiNiZGfKcSpGc7WOqIYpZbACf8TJNvMblOrYj
         SUHCTLgJht3Vj7MKnirMHokMnBg657CRaXIWBea5bMvkrERfBLH6ymrXjHEdo8x7wjUU
         erZ80J2xpg6pqilNwAYu9vWpqYcU36FyNdvqSw9xCjNK8xcIOsl6ll8BHvJc7fx5AQjM
         CcCA+syRI5FlOO6iEclAXe4D6ejXTjfLtUZxcU13dcFibqDrxGMwq1s/ybYJmNPoBr6B
         LCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768607243; x=1769212043;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shfPp2KoeQSvAsE+lzy86eQNZOUQOmOwfsSErLe5hXk=;
        b=KIZB7+t6NOZLv4HR78102XJ8uAlvdfZFEp9rdMgCB0EPdgWJvunGGEMiLNAKJ676em
         eJG1TQaSGbYiDorInmsqKgHJknJgyW/J6PN3WQWfejF07E2AJYtN1rC8Piby8II+A1PP
         RDDmN6lCs9VP6JGUiBivNURlKYbz6HiQkfzhoMV/8ZSKpOHsssPafCJjwv13Ts2SID3j
         A7BMa4+N7MniScwBKxSzuCdeVqyAIGMPy07w36YHAdRN4PTZi+osfTdOQ7RqZzzzdIRZ
         Qp3iCYuugAhS1Ij7TlPuNk//OknDQWEKcchHbwlfla2ucWZh+XDH6os+1OsZzyrcnQDv
         OqqQ==
X-Gm-Message-State: AOJu0YxcONfGa+1UpyXenxcpvoDri82JAar52xTMh+ju3NPN4KE3hTyE
	1wBlUty6HLxiQGZQFJ08tHj+/QgUKP6Ybhj3Al1rn5Q3OrC3AmM/623mQLcYArn0UwM=
X-Gm-Gg: AY/fxX7kloVlQeRC/SuL/PHUpLM087YWc4AGwKMaYPL5wworqEO3vjepKfI2dGPYkYm
	ioUe0FlHpYVyx1NmuVukwWMyoRYkIO7gt0AHfUys+jm/2ltoApUrhRUi6xgeRux2/4RBHDnwPKt
	zE23GiLQblzY5X1ylv6eIMqruL5Fnb2DprXRlySseWj3yfseZy/cKUWRLdEKtTLozC1ju+iN3RP
	JdNE7Ci5px+A0BCPWGda0xSYOs8nQ2oKq8sQUMqp3mfOP+fpFMGp6sniKIrk6ctAL1LT9nUb6Fn
	L7qUjPwpPFU2tUQ1d6REThHBo2KF5YvYzchoHBoYki+ZjoRZvM8brxtuC1zmhscC4/BfMs8NceH
	ak+E5sLndFJbkAuALAKqEtZo8qi2K91Hbg1g7lk5nP529uhbsud7WKOIBEf73LcegXD6mRjhaJk
	aI6HIiVMumt9n7gU8cMqdUXG4m7SVqwZirIeqgkHvzSPlJwwHVFlTmxkA9+Q==
X-Received: by 2002:a05:620a:1729:b0:8a2:4d02:eeb3 with SMTP id af79cd13be357-8c6a68ed2b2mr616124385a.11.1768607243488;
        Fri, 16 Jan 2026 15:47:23 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d6366sm39414796d6.51.2026.01.16.15.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 15:47:23 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
References: <20251127212943.24480-1-jonathan@marek.ca>
 <176859948742.425550.1764024067188709567.b4-ty@kernel.org>
 <79b3e8ae-134c-df6d-396d-9b7f766ef666@marek.ca>
 <ycygvgw4uwm6bb7i4fbuxmzb5a42zmn6atwwdznicvili3jh2h@eaa4ddtkwc5z>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <e6b0aedb-955a-5883-524c-f602ca619681@marek.ca>
Date: Fri, 16 Jan 2026 18:45:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ycygvgw4uwm6bb7i4fbuxmzb5a42zmn6atwwdznicvili3jh2h@eaa4ddtkwc5z>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/16/26 6:19 PM, Bjorn Andersson wrote:
> On Fri, Jan 16, 2026 at 05:53:59PM -0500, Jonathan Marek wrote:
>> It turns out this change will make things worse for the (unfortunately
>> common) EL1+64GB+brokenfirmware case.
>>
>> Because of that I think the Fixes: tag and "(fix 64GB models)" should be
>> dropped from the commit message. (I can also send a v2 with extra info in
>> the commit message if needed)
>>
> 
> It seems to me that neither of these to actions will affect the impact
> of the patch. What does "make things worse" imply?
> 

 From what Stephan wrote [1]: Without this change, devices that use 
SMMUv3 (PCIe) use bounce buffers for memory outside the 36-bit range. 
With this change they won't use SWIOTLB and it will crash instead. (it 
would still crash for other reasons without this change)

[1] https://patchwork.kernel.org/comment/26681014/

> Are we better off dropping this patch?

This patch gets EL2+64GB (and presumably EL1 as well if OEM provides 
updated EL2 firmware) working without crashes. That's better than having 
all 64GB cases be broken.

> 
> Regards,
> Bjorn
> 
>> On 1/16/26 4:39 PM, Bjorn Andersson wrote:
>>>
>>> On Thu, 27 Nov 2025 16:29:42 -0500, Jonathan Marek wrote:
>>>> Unlike the phone SoCs this was copied from, x1e has a 40-bit physical bus.
>>>> The upper address space is used to support more than 32GB of memory.
>>>>
>>>> This fixes issues when DMA buffers are allocated outside the 36-bit range.
>>>>
>>>>
>>>
>>> Applied, thanks!
>>>
>>> [1/1] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
>>>         commit: b38dd256e11a4c8bd5a893e11fc42d493939c907
>>>
>>> Best regards,
>>>

