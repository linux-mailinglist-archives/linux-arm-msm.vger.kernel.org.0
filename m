Return-Path: <linux-arm-msm+bounces-35441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E69AB278
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6155A1C221AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CBA1AFB35;
	Tue, 22 Oct 2024 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6pXHwsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFF71A726D;
	Tue, 22 Oct 2024 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612007; cv=none; b=TYksCsO0zL+IVf4gjLQU++V19ObXZRrNy0oZqrF2Cfrzki3NJMW7MTssYEcAQkekRIP1Erq3rbnUPTyrE8pR1AlaRiayC5IH0d9SzB4mmBD2AUegxmaAIZMWrHMW0/gL06QqiwRGkY464ScSwxXtPnM1AWep1FUz54dHsv9offg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612007; c=relaxed/simple;
	bh=a8JILlK0rOgCUXdJdRQk58tiu5AIo4Ljw3l2ZVC7IPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYwyl0OEiXJOZskmizsiM2bJ3DB06w4+dMvkRv9Zp3jR3ovDVXGMtB17wleCi+ADjccdzitoetdQsRfZM6xLAJsbWzGU2G5lK+26Hkb0+Gs/1gKo+N/Y+DpeLzbyLpIno9A1rWsaTX+d7R5aF7T4+XM6ut/JprgvGIyoqyd9KX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6pXHwsf; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e600add5dcso2095068b6e.2;
        Tue, 22 Oct 2024 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612005; x=1730216805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=boEXQ06yBkY9Qp9iJ/X9uFRqoqU4NRYtavinbBKuAWQ=;
        b=b6pXHwsf8BdxgX8ajJt9KrjD88YfV36/JYCNKzAHU7kSqAKwD4WOI6y0xOObdNTwcH
         l0bIheMB9z0EjJaS6lbfHXqsX7SV4V5yYmP/JuuVBGuSCAksnptbyyVRGBiIDg4//MJ/
         0KD7zTEFu4zKv1WD9uy5gXp8pU2ijn0gTY8Hu+obmoHzS8k3rDbQy1AjQPvHOo2L4LlY
         KA6KEKE0LMYGZFck2BTX2OqRm+lHp/iYo8WAfiY0NLqwytATFroxlUJiMHoGsaAyzLsA
         oTj7hjYFweon6EdeqEkiUHVVKkSCCpnIPAkASsroY/MnU1xZHvXPkjWqJboww21nwowo
         7Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612005; x=1730216805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=boEXQ06yBkY9Qp9iJ/X9uFRqoqU4NRYtavinbBKuAWQ=;
        b=G+oA2Ere5YcMPj4NxKV9JMPt4rE61mxCgEcbZG9UIB+LXPnoYqgdrPjnQVPxLat2ki
         tYr+0mEFrC1qEn/y630Fuogi9ZszGJ1aJI6ljlUFl+mDvsz+Ip3IygcCqP07FbKD+SEq
         W6pbJG2f/dcHzuCXZHPTd2BZibjkcTlTbWsnpBqrApTdOihHhhiXynfzn10ab3KA15+7
         iHGn9TmzP/iU31+eTgsP7uOBpgzPUlG3VkzR5Uz4ocw13X8XWM/eRO3XSuy3KHv0r9x3
         GDdgTxYqeoZEGu/XoPJTdwdwgCOIB9iame9TlhCKunP4+v24Mj/6IZJqfipacBC4iusf
         0jsw==
X-Forwarded-Encrypted: i=1; AJvYcCVB4eElqjNuDK6MQeEu3gOaDnQO3vB44jI0P3nWeADLcYIfXjEbq/A/MISOm03xOwLhi5S9BT/N929YIJNH@vger.kernel.org, AJvYcCWK6voFTSMKSN2lCsPqCro91by1eP0Jdo+N0dTi3pezfjgHOH202R9F2A6CJwcrRloKJmMgiJPFiCHZ4m+s@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3QDt1gWv3XCxy6AvEbbi692B2QYB0H4j1VKuSnr6bMe9gQ+s
	9NMv7UzK5H8HRwZrPrT32Qk8OZjeoTCRDXhP5xRAHTkxiVBu9t2Z
X-Google-Smtp-Source: AGHT+IFS78GXKm9ydPcOT0NuOksdZ95JgUyXNLofYNCJmFs3e78RXhsbhuhJsknF7ESBvWpcDq0O0g==
X-Received: by 2002:a05:6808:1486:b0:3e5:f766:3e35 with SMTP id 5614622812f47-3e602c7cc8bmr10852493b6e.18.1729612004789;
        Tue, 22 Oct 2024 08:46:44 -0700 (PDT)
Received: from [192.168.1.22] (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-3e61034f63bsm1315178b6e.43.2024.10.22.08.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 08:46:44 -0700 (PDT)
Message-ID: <041ff396-c5b9-40e2-8028-2b3325a3f0e3@gmail.com>
Date: Tue, 22 Oct 2024 10:46:43 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/10] QRTR Multi-endpoint support
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241022153912.hoa2wbqtkvwjzuyo@thinkpad>
Content-Language: en-US
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <20241022153912.hoa2wbqtkvwjzuyo@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mani,

On 10/22/24 10:39 AM, Manivannan Sadhasivam wrote:
> On Fri, Oct 18, 2024 at 01:18:18PM -0500, Denis Kenzior wrote:
>> The current implementation of QRTR assumes that each entity on the QRTR
>> IPC bus is uniquely identifiable by its node/port combination, with
>> node/port combinations being used to route messages between entities.
>>
>> However, this assumption of uniqueness is problematic in scenarios
>> where multiple devices with the same node/port combinations are
>> connected to the system.  A practical example is a typical consumer PC
>> with multiple PCIe-based devices, such as WiFi cards or 5G modems, where
>> each device could potentially have the same node identifier set.  In
>> such cases, the current QRTR protocol implementation does not provide a
>> mechanism to differentiate between these devices, making it impossible
>> to support communication with multiple identical devices.
>>
>> This patch series addresses this limitation by introducing support for
>> a concept of an 'endpoint.' Multiple devices with conflicting node/port
>> combinations can be supported by assigning a unique endpoint identifier
>> to each one.  Such endpoint identifiers can then be used to distinguish
>> between devices while sending and receiving messages over QRTR sockets.
>>
> 
> Thanks for your work on this! I'm yet to look into the details but wondering how
> all the patches have Reviewed-by tags provided that this series is 'RFC v1'.
> Also, it is quite surprising to see the review tag from Andy Gross who quit Qcom
> quite a while ago and I haven't seen him reviewing any Qcom patches for so long.
> 

I have very limited experience in kernel development, so the first few 
iterations were shared privately with a few folks to make sure I wasn't 
completely off base.  Andy was one of them :)

Regards,
-Denis

> - Mani
> 
>> The patch series maintains backward compatibility with existing clients:
>> the endpoint concept is added using auxiliary data that can be added to
>> recvmsg and sendmsg system calls.  The QRTR socket interface is extended
>> as follows:
>>
>> - Adds QRTR_ENDPOINT auxiliary data element that reports which endpoint
>>    generated a particular message.  This auxiliary data is only reported
>>    if the socket was explicitly opted in using setsockopt, enabling the
>>    QRTR_REPORT_ENDPOINT socket option.  SOL_QRTR socket level was added
>>    to facilitate this.  This requires QRTR clients to be updated to use
>>    recvmsg instead of the more typical recvfrom() or recv() use.
>>
>> - Similarly, QRTR_ENDPOINT auxiliary data element can be included in
>>    sendmsg() requests.  This will allow clients to route QRTR messages
>>    to the desired endpoint, even in cases of node/port conflict between
>>    multiple endpoints.
>>
>> - Finally, QRTR_BIND_ENDPOINT socket option is introduced.  This allows
>>    clients to bind to a particular endpoint (such as a 5G PCIe modem) if
>>    they're only interested in receiving or sending messages to this
>>    device.
>>
>> NOTE: There is 32-bit unsafe use of radix_tree_insert in this patch set.
>> This follows the existing usage inside net/qrtr/af_qrtr.c in
>> qrtr_tx_wait(), qrtr_tx_resume() and qrtr_tx_flow_failed().  This was
>> done deliberately in order to keep the changes as minimal as possible
>> until it is known whether the approach outlined is generally acceptable.
>>
>> Denis Kenzior (10):
>>    net: qrtr: ns: validate msglen before ctrl_pkt use
>>    net: qrtr: allocate and track endpoint ids
>>    net: qrtr: support identical node ids
>>    net: qrtr: Report sender endpoint in aux data
>>    net: qrtr: Report endpoint for locally generated messages
>>    net: qrtr: Allow sendmsg to target an endpoint
>>    net: qrtr: allow socket endpoint binding
>>    net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
>>    net: qrtr: ns: support multiple endpoints
>>    net: qrtr: mhi: Report endpoint id in sysfs
>>
>>   include/linux/socket.h    |   1 +
>>   include/uapi/linux/qrtr.h |   7 +
>>   net/qrtr/af_qrtr.c        | 297 +++++++++++++++++++++++++++++++------
>>   net/qrtr/mhi.c            |  14 ++
>>   net/qrtr/ns.c             | 299 +++++++++++++++++++++++---------------
>>   net/qrtr/qrtr.h           |   4 +
>>   6 files changed, 459 insertions(+), 163 deletions(-)
>>
>> -- 
>> 2.45.2
>>
> 


