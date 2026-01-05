Return-Path: <linux-arm-msm+bounces-87525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E36ECCF4BBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AADA303A97E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A879308F26;
	Mon,  5 Jan 2026 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnP4FxFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484C2EB5A1
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767629364; cv=none; b=McztGmZbc/gGHF8JrId3SSWsWc2FiSktvvdSnjpG3Qln5cDOrNVgb5n0L7L0d0gWxpaf498YBQavHcS8wCgh6b/UZc6HQjFhnYGtoB4cqkiY67EUobKW0t/thqvIBtU/4c6iuTvlVCUwdG6icHcOLbF0INEapBQG+aPivikjcLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767629364; c=relaxed/simple;
	bh=Z+3p06bGSl4kFPKyRspFHvQZldHI21Gsn4suvtFf8q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNx4V0NWAziB5/9XFQOaslnBMyz3+NPz9k1mrmqq0IaHE9cRTtpwWk7W+j2MOdujD5BTGr/QqpBO2Ci9CMe3QG3hWQoMjSiHHu5oCjmozMIeQSA6qBeVUHP6mtjB9rhTYUILFB7yZzLKiK5aqu2oa6AbV6/0QqaoScftHgtJbo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnP4FxFN; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-65cf3d51c95so7688eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 08:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767629362; x=1768234162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjD0cFug8q5FgSi3StIcSXghk8VkJQAH5OGKsWnd7J8=;
        b=MnP4FxFNF3tPjzFuRR8KboW+3J/JQfpSn+dR+xMKjl35Hx/CIWMJsHe/KoUaTaKWFw
         WAZ0W+gesw6Qaz2TokAQjBZ+lsJiNM7+kiMNuKIyXcx7a3hwHAMK6u5zWcW9WQ2Lf4No
         CJ3fvSGx4l7rPDtQh+wJ6cwUQpCSG/mdJ4QEMw/tiIYQAzHaJoyxkTIPYIAsulnIxFl3
         SKAKWrB1XsDul3buFB+Sv2TlFmqL99LoUlr4RkVTpdluj2KbG+C/ypngZumFqE5hckpm
         OpFizEOaVIflAb5kSaHiFY6Re8Eo6ckItMb5GC7aXpfyLJiMwuNqViuya7cmKKxeHAu/
         ULvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767629362; x=1768234162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjD0cFug8q5FgSi3StIcSXghk8VkJQAH5OGKsWnd7J8=;
        b=pbcyk7ty4E77BoU2yhG2aQNmno/89X+FeoN0WMd4r1t0Yddqu5jRIoP/NwHf7ZAWDR
         JyVHTA9+gn5NfP3kHtjoRqUmNRAcyTW70Hokn5xIl/kon7QrKUxVMt6WOu9yJxsLvbrh
         u6gsIpP0ZtllXe3z+O7q0worioehfQOqcOt8PDRFEFnX44Pjw/YOrhTbc8ilrYF4cOoy
         yMpJ2BIL2BJhbg1l99aeSHW/9FQJ8BpzFFiajelUCZKzZ25iNvba6Nm+cVnpAgynUp0S
         DhNM191dZYvCddaPZvZbOrMYvRJwj8D0zseVqpkduiSHzZWWJC/BROeom+qTGz41filb
         C+2w==
X-Forwarded-Encrypted: i=1; AJvYcCU5o3VYHOZd2+UoT1FAQx8+BXgoWipwOSVBrBYmLOPFecHoWe3KWHjrNWlJh9EI5LygJQkuNQByEdf20Z9r@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFzzzhXpD2pulreRByk1Q+OyNa2Nt1pTs59Z5rGOO69RFrZkw
	h+pWL7yLV6zjFKsmFhd2UzqWUUuaVwkWcgNwvF7uEyVSQ9cDEwkzEgpk
X-Gm-Gg: AY/fxX4NEzkuF+OU9iMPuC1Isn/vxpXKkgWkBaee5Ib9l4S6MSkuII8PJAxUlTHgqLN
	h0VJYoKZXpFAeC57HyhbJRAGku7y0vF8UUKx9dsuk5CYS0VvIcAwgfQb1yaCIZwkx9ZIKx4zwOh
	n/1GbESRBzC9bzEADBlh76E9UFH82Za62Benfp2jG1CxnZBb/jXvM+N57NlEoKNjiD1zQvVsJai
	LhZtY74aNS9rqWcyMAvPfCW7iC0Y1LxTQjsgfuwHGYJ/xEvAAPpRO2So1SfD+LiO4v7zXAkbkM/
	HOoRJKKPcD/VhjdnV1O3diH+4F4XBEGp5+P9NQlOFg3TGXPCRZ5WKeUA6+Q08nYjlkpOF/rrLla
	L8K2lVWy24KzrCbqGa+wp5NgJQRXw6+7AaznPSvtiwPnleQ4d4b2PLtQR5wJNH9H1GhIeQR0gs6
	JTQJzoBSriWZD96S+0YtOqAHSRJp2vfKnB9sn7agMU0FkGvJ0KqHhvit9M4a5wTsC3XAX9w9uNC
	YWaxkkRlSiAWMKLPxgHF8LZyQZgTdfS78KnB1endYKW
X-Google-Smtp-Source: AGHT+IHx5JMKb4vB/eajpN4o0f0cfIbQQ1XHTN78lppzSydrQP2y7T0NaVMBD0ZodkkL2GmZxmljaA==
X-Received: by 2002:a05:6820:606:b0:65c:fc7b:4c23 with SMTP id 006d021491bc7-65f479ffb03mr3349eaf.30.1767629361663;
        Mon, 05 Jan 2026 08:09:21 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f478c6a4esm23427eaf.9.2026.01.05.08.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 08:09:21 -0800 (PST)
Message-ID: <7f6754a4-4a3b-4b6f-9220-a1790a9ba393@gmail.com>
Date: Mon, 5 Jan 2026 10:09:19 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
 <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
 <12223416.nUPlyArG6x@nukework.gtech>
 <55d70e0b-7a6b-4979-9ae9-4443e54ab584@oss.qualcomm.com>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <55d70e0b-7a6b-4979-9ae9-4443e54ab584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 6:35 AM, Konrad Dybcio wrote:
> On 12/23/25 9:21 PM, Alex G. wrote:
>> On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>> Q6 based firmware loading is also present on IPQ9574, when coupled
>>>> with a wifi-6 device, such as QCN5024. Populate driver data for
>>>> IPQ9574 with values from the downstream 5.4 kerrnel.
>>>>
>>>> Add the new sequences for the WCSS reset and stop. The downstream
>>>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
>>>> using with the "q6v5" driver because all other parts of the driver
>>>> can be seamlessly reused.
>>>>
>>>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
>>>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
>>>> register. The second set of clocks, "clks" should only be enabled
>>>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
>>>> tries to start the remoteproc will hang.
>>>>
>>>> The downstream kernel had a funny comment, "Pray god and wait for
>>>> reset to complete", which I decided to keep for entertainment value.
>>>>
>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
>>>>
>>>>   	struct clk *qdsp6ss_xo_cbcr;
>>>>   	struct clk *qdsp6ss_core_gfmux;
>>>>   	struct clk *lcc_bcr_sleep;
>>>>
>>>> +	struct clk_bulk_data *clks;
>>>> +	/* clocks that must be started before the Q6 is booted */
>>>> +	struct clk_bulk_data *q6_clks;
>>>
>>> "pre_boot_clks" or something along those lines?
>>
>> I like "pre_boot_clocks".
>>
>>> In general i'm not super stoked to see another platform where manual and
>>> through-TZ bringup of remoteprocs is supposed to be supported in parallel..
>>>
>>> Are you sure your firmware doesn't allow you to just do a simple
>>> qcom_scm_pas_auth_and_reset() like in the multipd series?
>>
>> I am approaching this from the perspective of an aftermarket OS, like OpenWRT.
>> I don't know if the firmware will do the right thing. I can mitigate this for
>> OS-loaded firmware, like ath11k 16/m3 firmware, because I can test the driver
>> and firmware together. I can't do that for bootloader-loaded firmware, so I try
>> to depend on it as little as possible. I hope that native remoterproc loading
>> for IPQ9574 will be allowed.
> 
> These are two parallel questions. I didn't even know that the bootloader
> preloaded firmware on these platforms (are you sure that's the case?)
> 
> qcom_scm_pas_auth_and_reset() is usually preceded by qcom_mdt_pas_init() +
> qcom_mdt_load_no_init() where *you* supply the loadable firmware for the
> remote processor.

What I mean is that the init sequence is implemented in the trustzone 
firmware which is loaded at boot time. Irrespective of what Q6 and M3 
firmware I supply, if trustzone doesn't cooperate, I can't start the 
remoteproc. I don't have that problem when the init sequence is 
implemented in the kernel.

> The init sequence provided by this interface will be at worst identical to
> what you're proposing here (except abstracted out), and at best containing
> some fixes and/or workarounds that may be necessary.

I think this portrays the TZ path as somehow superior. That's not how 
things work in my use casee.

The bootloader/FW versions depends on when and who made the device. So 
while the newest TZ from upstream may have the latest fixes, I have no 
guarantee that they will be present on a given device at runtime. The 
best solution I found to get consistent behavior across devices is to do 
these sequences from the kernel. Is there something incomplete in my 
init sequence that I can fix?

  > Please try using PAS and see if that works.

I found the v6 of the multipd series [1]. It needed some minor 
adjustments to compile. I went as far as loading the Q6 firmware and 
starting the remoteproc without error. I did not test any further.

Alex

[1] 
https://patchwork.kernel.org/project/linux-remoteproc/patch/20231110091939.3025413-1-quic_mmanikan@quicinc.com/


