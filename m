Return-Path: <linux-arm-msm+bounces-110023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMZnIINUF2oPBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:30:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E1B5EA13D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9851C30034B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 20:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7943C13EF;
	Wed, 27 May 2026 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAV7dp1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB6B390CAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913854; cv=none; b=qd4V7LbuAOCJ4wK9ldRX44JvEvQO7lQqbP9c9M37RAqCbL9WjfMMt+dUQM59cNiQW01/8Db2lTT0v4zesS6lPzFM5DReQp0s869A5ZPGYs4zI00I3yTt9LTlgYknS0oKqxS+S2VrfmRDonXl0f6SoEU0UmDIOB2qNRY2afFV4KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913854; c=relaxed/simple;
	bh=eSe2XyInBmI4O1S8fwP9rw23eOLnqGfEA/kmRMLHjXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpmybkC2zB7G7wcEAw4geL6MyKfeIycL4D+nQ61zJLHYrCmv9NIwib5sX9+WR/UF0hFqyIK5QtElLJXunj4zvN0d3t0r2BeInl0bhpV27YYpgtUUDqYqtH1DITgNY5/WXxEY9ZBFlcGvkRT2Po/lDbgfEyG5s+7F7MUOXj4jWVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAV7dp1T; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-367d88b9940so8030464a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779913853; x=1780518653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2OhCxIlJi2QiiC8j/rvp1ZcuO4vzfhN+zs+219JbuA=;
        b=EAV7dp1TvfLSpU01DRMn5RLVYXd/qL32AbDbK7yYtfSum+2xYbVeeWUIA6BabcwDa6
         UCPD5JIOhCqe2UD+3Fa+Gr2O9dI+XQ+0vCl4GdD2Q1FEeZhS2ayGQTFHuSTorcknWbkW
         bIrsY57l8qscIRhT3gIzXX9gyESHj1L4HZwmNDLlGkXEXt28t9mrHB8jvvG0ezHnj1EK
         BNZVDru5Z0xu33GC11Z5Xd+6ppybiinbN7AuRJ/2CO+GjzxTIj6fh+TQtamTL1pyOjGN
         rA84EuIFiaSiF9C57cOEbv/CFD3qKPJbNXfqg+WCzcvfF/A1kpJ2n06cDa3LYGG9Q0tL
         p0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913853; x=1780518653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2OhCxIlJi2QiiC8j/rvp1ZcuO4vzfhN+zs+219JbuA=;
        b=Hd9mwUgzPpGMje1WRwx0JoinbzQ5OjQzXhQBz7uAAS8vGW4hsYAcakRwsrO13T0f7k
         p/L6yxPilclfVja51l1Ugw8fOkfgbCNzraOc5xQ/80QuS31XxveJnYZ7RgZEx9IpKT3h
         5h7wDT7aL39Ih9kr5DR04D46PemylsiCOsmCIad9XI/s45Niq++tQEgk7sxY2ZvaxjlP
         0l6XK69QlPGJJZ8shp/7Ewui7pwOl8gcumpEK3Y5zNVeY3gSz4xkJ6kXh4cd2FIxjBhT
         KWxCgIdkTvHDZaNwTv77NeSpd01sWGxvzyl9P5julopCBCfw0Y/RqbDbUNUbwUhVDkwj
         x/Kg==
X-Forwarded-Encrypted: i=1; AFNElJ+cEl32dOQiwEjN5Dv/LSV+Qgak1ALRx/E4MrV+iXiny34whZjzQiEe8ey+f3NvJFSmZJMzJwo1xBUXzlsC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh0cS7tVsunuDYLwuZ265uqP94rJ5KdcHmJXDlCIbZb2d0D1Yl
	XdX5wy+cke7DnlqF2K0e0wQdef8mFZOhO0a0mvRbp55Iqe4Gul8JDXSH
X-Gm-Gg: Acq92OE+UeuovP31X09D4ZfiQWEbuSHkwxGfuwTKDqtyft7WAkUlX5YHMuCXFdcr7nx
	wTbO2NWBTVivA2KkNeK42Ek7yHTHGtqYq+qfJSX7bOHOUMB0xXbhyE3MzyD227ztOjVunw/FIGX
	wmB3ZLaCMP3G69OODbjYsqtHjg/+6hmd6x8KiGvAsWDmkWrXQ0KYKaXspkiU00Tcm8471KXSjMg
	I6H0n4RxkNHgw5E3B1yNOYprkYRVrtnBHL2ZnzRTe5MmVG4wCoYWxiuqg0NLRjobU5NBimt+lbE
	3Rl8Q4ivsWckR9xKrAu8X6Qh6rzkl6PEgHoZHrfRLwXa0ir2b4U5kAvb0PxmXViEWf4sooUFqui
	nz7rC9Jib2eusRmBw26pkbjGiZHa3omZdOvcXyGsoQTOmNIdXQ63Hy4Jjkhv35sznHRMTeO5u/d
	o6TSmBO8lzqW8gOMFwGUXXAMvWulvZA4MhD9HxOUF3SzLIqCg=
X-Received: by 2002:a17:90b:134f:b0:366:3ac:f725 with SMTP id 98e67ed59e1d1-36a6788d912mr24792193a91.25.1779913852550;
        Wed, 27 May 2026 13:30:52 -0700 (PDT)
Received: from [172.18.227.108] ([219.88.198.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm16549405a91.16.2026.05.27.13.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 13:30:52 -0700 (PDT)
Message-ID: <4b911ed0-64b1-48aa-a00f-e2ade66afa1c@gmail.com>
Date: Thu, 28 May 2026 08:30:42 +1200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] soc: qcom: rpmh-rsc: Skip TCS init when RSC is
 managed by firmware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-2-graham.oconnor@gmail.com>
 <934e6039-4639-49bd-8cf9-a1674f86b8c8@oss.qualcomm.com>
Content-Language: en-GB, en-US
From: Gekko <graham.oconnor@gmail.com>
In-Reply-To: <934e6039-4639-49bd-8cf9-a1674f86b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110023-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 82E1B5EA13D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad,

This one is confusing.

I started the bring-up on this board on gentoo-sources 6.18.18 but the 
board would not boot. After an almost subliminal flash of tux the board 
would lock every time.I found the solution from PostmarketOS who 
obviously faced the same issue which formed the genesis of this patch. 
With this patch applied the board booted fine so I've applied it ever since.

However, as a result of your response here I tried booting my current 
kernel (gentoo-sources 7.0.10) without the patch and to my surprise it 
booted just fine. This leaves a few options, including:
1) the kernel source has changed
2) this is a firmware issue and a firmware update fixed it
3) It's a timing issue.

To eliminate 2 I would have to test 6.18.18 with the current firmware, 
then regress the firmware and test again. The do the same with 7.0.10. I 
can't honestly recall whether the firmware upgrade was before or after 
this issue first appeared.

If it's a timing issue it's a bit more concerning. If the kernel is 
taking slightly longer to initialise before calling 
rpmh_probe_tcs_config() then it may just be missing the solver 
activation, everything appears to work and nobody is any the wiser. If 
the existing solver code doesn't deal with early firmware TCS 
initialisation then it could, under some circumstances, lead to the 
security reset that I was seeing. This patch specifically tests for that 
case.

Based on the AI review feedback I've also modified the patch to not 
simply return early but to just skip the sensitive parts of the code to 
allow any other setup to complete normally.

My current objective evidence is that the board boots without this patch 
and it's quite possible this patch is unnecessary if the above is incorrect.

Graham


On 26/05/2026 00:40, Konrad Dybcio wrote:
> On 5/22/26 8:06 AM, Graham O'Connor wrote:
>> On QCS6490-based platforms booting via UEFI, the RSC hardware solver
>> is already active when the kernel takes over from the firmware. Calling
>> rpmh_probe_tcs_config() in this state reinitializes the controller
>> while the firmware is actively managing it, causing a security
>> violation and system reset.
> 
> I don't think this has been an issue so far on other platforms..
> 
> Do you have some more details?
> 
> Konrad


