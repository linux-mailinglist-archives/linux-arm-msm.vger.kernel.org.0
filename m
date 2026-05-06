Return-Path: <linux-arm-msm+bounces-106216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJczG7jD+2kPEgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 00:42:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6044E14A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 00:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A158300EDAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 22:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C16836F439;
	Wed,  6 May 2026 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="QLEzLtPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD5336DA0D
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778107308; cv=none; b=Yb16+jr3Pek40bih7JABDUJJLIFPDQBA2O8RLWqufjsLLSH+iaWlQNDv5/qXNUkqKHgssTRbZ2TzVKdvIINRo3umPSCE78cuGOPjupQWpmAXh0mLDSepkxkjfi71xsKz/K9i+DIlUviZX60SgRZG5nFfy1wt9ppwf5WIPamk8OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778107308; c=relaxed/simple;
	bh=j2FRj+deFkHt2WLaAmO7r/2FVYSQVST0KS2E7oMmoXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeT/2p2tMhJQzRiOjOpmVLnfgUGjLP4GBWnXssHjr1uxBTPukvDBKn4hbsMOZPvp34BEUwcu1X89TfOyhaZLYvNcQCyv6eB5ZIsh1uzW1GBlWSrf9Ma0gBHKAfH9s9X7JmzpivZgYuTXwn6dFHgsDwoO/LNwKVZTkCo5JFQ02w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=QLEzLtPn; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8ec37d52c0dso31493885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778107305; x=1778712105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cYpEI+XfMfA1fnjJlUUXbcclTkGZqiM6qT8lT03dl1A=;
        b=QLEzLtPnhE1dLbAV7ROfw46TtBAx80QhnwTBTtA2FmtA+LtfeWlGSeB695RHwhb+xF
         u5wQtnm1Iucl8JL8HnLepq0BPHfRN+ij+zpomS4mgCcJgQE7hFZeymodi3J5/zkyq8U5
         m/xgdP5tT1m+S4DvK6EgTgXx2oPbJmE6skIZHAflAS0Ooh5X8maB8a1FJKO24HPldpay
         ScL7f7MEzuZQ1NJecMhDaZ60x8iT3vqcq29ttdkdaexCORpTSFGcqEVXZdmMLA3sxJ77
         oWqpS+xVY2PkG08NQ9IDpkIZFYwoYKciES/P1sDKIoEzS8uK7fACaz4iD3Eqx1vCM5m9
         acmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778107305; x=1778712105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYpEI+XfMfA1fnjJlUUXbcclTkGZqiM6qT8lT03dl1A=;
        b=VUC53P/vfWDX/+zbKcz1VYAmMLibUg1yclivWxwnXPF3yX3vsgWikpXXg1Paqr79Sb
         zdmB7PiVAZItjk0IAtKUYEfLSLSM5u61t9RzQXNBGUqkZCymVgJ6g1CPXe6+oyoGHbcB
         n/SCqr6ibOn3QYFA2Y37Iqr3qo7sZC29CLzwCKHRm56HJnTJv6FbuSiEuFAx40DEQJrt
         7SXw9AgQvWsrk82V0Bsv78IBo2F1/fUqGqacR0OYHV8m1WAVT2VZ0IV+Ye0uOlTKY9J6
         91c1qFsR6URF/LIpw4ARhglgUL1rmAncrLt3jBYGLgRXf7mnM72OpjSINkpZMjmqAaKx
         qysQ==
X-Forwarded-Encrypted: i=1; AFNElJ8f1vL9nN0i9c9t/WjJFmz7s8FfrHyDQUHjmJi+5W2hv+OeR1M4bFnnfwUTrZTW2sWJ4eSAZ6D/Rb1OspLE@vger.kernel.org
X-Gm-Message-State: AOJu0YypBtiV81gUcTVs2jwYf1WS5aAJLWvUi4LjUpAN7cuiUoPp1L/O
	Z8Q4sokY4Tm9pV9CkvvEhyzdxyitJ8wLhCsM6Ka/KiojJKLlem7EuGfL7JRyVZJBcEo=
X-Gm-Gg: AeBDievRPKU0xVb5p89gxET+EYh6m0DG3uZXENI1ZOY8VJqKXj67yO6ba8KpQIqNrez
	9YratzAx8EoXJA3eO6C7eF9PPj+OUJa7e1ZB8LuAd2Jlo1OY0KiA0e/so6sh6IzpChuSGG0QRqu
	1laSeom8M1nW9WErIW0ce91DeDYHCwwomuk2nywhIZei9i+NeEbl4v3L+6qnaG6qizetS+cTkWu
	Z0WhHjO8DStKnLhCyP8LHxz11PxmMdYxuYcZkCKD88YtrRCpxLDwzZb3hmKcagMBZawWEocDgrh
	VDvwI85qfZrUCMTx6/pe1Jqx/595Pkkmg5T80TnhblGIp74SYBITOud0OlZvGA+YpWHRgJRja14
	Q73yfUWY0lF0TJjwBZzAQTsuYHh9TXxldHi4q0qR8/8YHgk+t+PMl9YigLrSBVEBpNs/P7gRpvJ
	MJbeUe3J1amrtBuRV1TcLrlDlJnz0c+WW5p/EFlpuub7nJS21dYgANwvxNRWMo9njqhKxSuxQps
	qpQ4MEd15SU
X-Received: by 2002:a05:620a:f0c:b0:8f1:9e59:220e with SMTP id af79cd13be357-904d63e7a90mr807845985a.39.1778107305508;
        Wed, 06 May 2026 15:41:45 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd06f16sm1787057085a.42.2026.05.06.15.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 15:41:45 -0700 (PDT)
Message-ID: <3e1b1859-2d02-41ce-838e-a0b7f4745d82@riscstar.com>
Date: Wed, 6 May 2026 17:41:41 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
 <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
 <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
 <0751a051-9894-45be-92d6-0d46f2c39293@riscstar.com>
 <7d7b6b89-3ef4-4891-a794-c8b11f39db34@lunn.ch>
 <79684efa-4ba9-4144-a99b-dab935007a2f@riscstar.com>
 <ec5765aa-b830-468b-8965-a95fbe020065@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ec5765aa-b830-468b-8965-a95fbe020065@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0A6044E14A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,riscstar.com:mid,riscstar-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action

On 5/6/26 4:43 PM, Andrew Lunn wrote:
>> To be clear, the reason you're asking is that you're suggesting
>> we might want to model the GPIO controller differently, correct?
> 
> Correct.
> 
>> I.e., model it as *not* associated with the embedded PCIe
>> functions.  Then we need to think about what its parent device
>> would be (the power control device, which I think somehow
>> duplicates the switch device?).
> 
> Logically, the GPIO controller cannot be part of a downstream
> function, if you need to use the GPIO controller to turn the
> downstream function on.

Yes you're right, though the PCIe power controller functions
before the PCIe switch is enabled, and uses I2C to communicate
with the host.

> Logically, the GPIO controller needs to be above the switch downstream
> end points. Where above, i don't know. Which is why i was asking about
> where it appears in the address spaces.

You are touching on an issue we have faced since we started on
this earlier in the year.  Our objective was to enable the eMACs,
but there was no device representing the "chip" (which holds the
switch and the GPIO controller, etc.).  The TC956x is more than
just a PCIe switch, and more than just two Ethernet MACs.  The
vendor code handles some of this between PCIe functions with
some reference counting and perhaps other things.

Eventually we settled on the model we have presented, which
creates a device for each function and lets one of them take
care of common "chip" things (including creating the GPIO
auxiliary device).  The function device driver creates a
new auxiliary device to represent the MAC for each function.

I also considered modeling the TC956x as a remoteproc, but have
been reluctant to really pursue that.

> But i also don't know too much about PCI, i'm used to SoCs with simple
> linear MMIO.

I'm no PCI expert either, but I'm learning.

>  From the little i know, it is more than what address space does the
> GPIO appear in. Its also, what enumerable entity does it appear in
> within the PCI bus. Because its the enumeration which is going to
> trigger a driver load, which can then drive the GPIO controller.
> 
> Or, something more radical, you make the PCIe power controller an MFD,
> instantiating both the power controller and a GPIO controller over the
> I2C bus. GPIO access will not be as fast, but is there anything here
> which needs to be fast?

I considered that, but opted not to mess with the PCIe power controller
driver.

It's only asserting resets in the RB3gen2, so I don't the speed is a
major factor.

					-Alex


> 
>        Andrew


