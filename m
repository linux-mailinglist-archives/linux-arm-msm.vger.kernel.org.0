Return-Path: <linux-arm-msm+bounces-106178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAg5IrWG+2kscQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 20:21:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F804DF422
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 20:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7B593005159
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 18:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C8F4BCABD;
	Wed,  6 May 2026 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="MXQ1ByoQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DECF4B8DDC
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 18:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091695; cv=none; b=KPlyQOMsE+sgsIscd8nBmjiact7PzKiNUbG7wpdTwsiACP3OjZ5ub14qKNSt2UHTcIDUk8zeF7uRWlLGi4T12p/y+2uaR9LZ/ZDAMBgFk/uhHGSzeKSdcbwzTuNJGF7eFLfRqk6e7nNqNUvL5qp8HqnT2T6RG+u9FA2bNCbivdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091695; c=relaxed/simple;
	bh=l9RL6ffZ0V6p/nZhYhiJ/k+Ncl3ace6QHYzBN675cRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxBl1Amk410itfZKMsDfqZ1RfX+1w5NUiXMOnM6uzEfvYS/+oPwFxwBVyA/aAcWxS+PCnx6ZZ1UNLp4gCtHnK5kij8sqOTeLUDJ7TzcnWdHBMZh5yBJkgyClSzvndZjo0CZ0W6vTRm4msU/jPwQPONh5sBVMrAVmtWY0NvAHrQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=MXQ1ByoQ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8ef2118b478so419885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778091693; x=1778696493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oBqOeQFggE8v+cavTTn16m1Xk99yYA0Xp28tAkW6v4=;
        b=MXQ1ByoQInRWPvTL/VCZ1IQuPvW37sz9uZec9IY6HESSYPe434OaNktzL4FV46P8hy
         GUHNPZdb3PM+G9O981LjNDaf5vwazehHtDvvz3JMB4QTAFsTeVjeN0c8Y9ebS64Zwkx+
         CrQoawpsKZHIL3PepkgbpA5SemfLG/37+pA7nvC0UnvYN/kw9kY1icXlnELq6tkGiPs4
         yBxYhbZqdPumQCerXDNlJlqHnb9GnlMkvq3oHVRKbjDVWkYoCIrr+80sI1ReDp94/9Ig
         SYYiZqxGJiZmFPHseAQ49nWXI7UuneIUnVf4t3XyDYo/rg/4vkeJMPgIar/acqRQOZF6
         cpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091693; x=1778696493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oBqOeQFggE8v+cavTTn16m1Xk99yYA0Xp28tAkW6v4=;
        b=J77DAvPjmED47JLvZGazmgbtXMn9UJAF+naG5ob/xqrgxLgmO1pgXAw+Njtayo3m7G
         yk7j93EkkFl/1AToeaQfcvhj2xp3uofdWjlOexb+7DhJaUjOa6moO2SL9VoMl1yCCNFe
         4CWFjJI6WXx+obiocMmp5diCFIh4zp4ENOSQcbR+RVngqDazZHE0n0lk29+4v/URq8y4
         s13twcjUpbfqcGd4lsjNdovisRN7Mn/DxNYJh/K/YLuxoaL4AMbiRQGZE2LEnvVCn4tM
         RDD05B2Q62T069Y6X4obFffoA6iRdb/SjtGqRJOZTz7JmRYdTo6eh6vgxmu0ksXY00oB
         Oriw==
X-Forwarded-Encrypted: i=1; AFNElJ/0Y0ufPd3Mm8QJ5cYxPjsLjuyeqVzAPYAa83izvjyAD78opn3/fpm1IIzHPGRLzvCU/mj210Nr++NaJwjn@vger.kernel.org
X-Gm-Message-State: AOJu0YyzOZTM/D5T5Z0rVKXI71HlqzrAeyiwWOcwP5ogjab85nGgLeg+
	9xH1OjWqQspVMr2m/YMgmmsMyDaPWiK2thlz5uuBvapDOmrCIaBGIaIdG/jsXQPSb4c=
X-Gm-Gg: AeBDieuMgLDDVxdWuvaWBpx8boERzuv4NpcKsJXqpOnnx7cHvRIL8OvWQhrEYJw7l9n
	MYJARURY2XCC6Ycj7xL1/qedKB7mZN/jYqbENU8zlgJrXLJsPctMu3+6mo0wtFxOrA0ULpmQejx
	XtsKa0BGOfFVPr0DrZBR5UG+odXOe+M3jCi8m/eLoTcvpaPtxBCfeAJwOdIu9pvXgFSEyxhdS7z
	RFxSrlQr2ToPIwrQotf/G5N/dJtfFZ0Ewb3tl9ixUqNGqeO7PK3Lp3rHCxhdjBu5fagZbAMNNQj
	BpV6AMz/BM95kCa+BlXkPAVKhFONvfvh5vphrAYU7dsG4M1FzJRXYIZSBSOuKBYnluyLz4MabBs
	jP/MI7asbwd1Mj1O3OJJRpJehS24crvZDQ2fVtHKawP1trcpu7XpYiJhz3lQrcamaDwJbHm1ZBH
	C77KpmGTu5PpM+e2/QmBOH7If32Rd16ZzcE47I95t+cSurmywr9NtHAEmaIJWhywF7tylBgIVWl
	w==
X-Received: by 2002:a05:620a:29c1:b0:8ef:12de:1337 with SMTP id af79cd13be357-904d60f5233mr705172585a.38.1778091693050;
        Wed, 06 May 2026 11:21:33 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd057acsm1895096485a.47.2026.05.06.11.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:21:32 -0700 (PDT)
Message-ID: <0751a051-9894-45be-92d6-0d46f2c39293@riscstar.com>
Date: Wed, 6 May 2026 13:21:29 -0500
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
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
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
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 80F804DF422
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106178-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On 5/2/26 10:05 PM, Andrew Lunn wrote:
> On Sat, May 02, 2026 at 08:45:48PM -0500, Alex Elder wrote:
>> On 5/1/26 1:36 PM, Andrew Lunn wrote:
>>>> + * There is a TC956X PCI power controller driver that accesses the
>>>> + * direction and output value registers for GPIOs 2 and 3.  These
>>>> + * GPIOs control the reset signal for the two downstream PCIe ports.
>>>> + * Their values will never change during operation of this driver, and
>>>> + * this driver reserves these two GPIOS.
>>>
>>> Why doesn't this power controller driver actually use this driver to
>>> control the GPIOs? Chicken/egg?
>>
>> I am not the one with authority on this, but yes, that's my
>> understanding.  *Something* about this chip requires that the
>> PCIe ports need to have some configuration done on them *before*
>> PCIe is powered up.  So that driver uses the I2C interface to
>> apply these settings.  Meanwhile this driver uses the PCIe-mapped
>> memory to manage the GPIO registers.
> 
> The diagram you have is:
> 
> 
>                ----------------------------------
>                |              Host              |
>                ------+...+----------+........+---
>                      |i2c|          |  PCIe  |
>      ----------------+...+----------+........+------
>      | TC956x        |I2C|          |upstream|     |
>      |               -----        --+--------+---  |
>      |  -----  ------  -------    | PCIe switch |  |
>      |  |SPI|  |GPIO|  |reset|    |             |  |
>      |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
>      |                 -------    ---++--++--++--  |
>      |  -----  ------     downstream//    \\  \\   |  downstream
>      |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
>      |  -----  ------   //PCIe port 3       \\     |
>      |                  ||                   \======= downstream
>      |  ----+-----------++-----------+----         |  PCIe port 2
>      |  | M | internal PCIe endpoint | M |         |
>      |  | S |------------------------| S |  ------ |
>      |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
>      |  | G |function 0|  |function 1| G |  ------ |
>      |  | E |----++----|  |----++----| E |         |
>      |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
>      --------+.......+------+.....+-----------------
>              |USXGMII|      |SGMII|
>            --+.......+--  --+.....+--
>            |  ARQ113C  |  | QEP8121 |
>            |    PHY    |  |   PHY   |
>            -------------  -----------
> 
> The two Ethernet controllers are hanging off port 3 of the
> switch. However, the GPIO block is just floating in space. What
> address space is it in?

Well, that isn't easily representable.

In fact, the GPIO (and UART and eMACs, etc.) is accessible
multiple ways.   They are in a single "SFR" range of memory
within the TC956x, which is partitioned into sub-ranges for
the separate IP blocks.

E.g:
0x40000000	Bootup config registers (size 0x1000)
0x40006000	UART registers (size 0x1000)
0x40020000	PCIe registerfs (size 0x00010000)
0x40040000	EMAC0 (size 0x8000)
and others.

The MCU has access to this SFR space.  The host CPU can
access it via the I2C interface (as the PCIe power control
driver does).  The PCIe power control driver actually
touches the GPIO registers to be able to assert reset
on the two downstream PCIe ports.

In addition, BAR4 for both PCIe functions has access to the
same SFR space.  So in fact, both of these functions are
capable of controlling GPIOs.  We are having just one of
them (function 0) be responsible for that.

> I'm wondering if the GPIO controller should be a device/driver of its
> own? It probes first. The PCI power controller driver then probes, and
> has phandles to the GPIO controller so it can activate ports 1 and
> 2. Parallel to that the Ethernet driver(s) can probe, also using
> phandles to the GPIO they need.
> 
> Looking at this diagram, putting the GPIO controller within one of the
> port 3 functions is wrong. But maybe the diagram is not accurate.

When the PCIe power controller was implemented, the GPIO
functionality was not separated out.  That driver simply
touches two registers to manage asserting reset on the two
downstream PCIe ports.  (It changes these only during the
appropriate times during power-up and power-down of the ports.)

It's possible *that* work could have implemented a separate
GPIO driver.  We did not pursue modifying the power control
driver to work that way.

Instead, we modeled it starting with the STMMAC driver (which
is how the Toshiba vendor driver works).  But we separated
the GPIO functionality into a separate (auxiliary) device,
which has its own driver.

Because the internal endpoint won't operate until the PCIe
power controller has enabled power, this GPIO driver and
the PCIe power control driver won't interfere with each
other's access to the shared registers.

In short, because this "SFR" space is available in various
ways, there are several ways the GPIO (and other) IP can
be managed and represented.

					-Alex

> 
>       Andrew


