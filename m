Return-Path: <linux-arm-msm+bounces-106497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uArXM+jb/GnqUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 20:37:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 418304ED851
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 20:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 705973030B1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 18:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5C94657DA;
	Thu,  7 May 2026 18:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="TDHvjKWF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA913B27D0
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179036; cv=none; b=lZiacm1OnX6zbIpGzS45pE0UkdaT5wqCusWtUebg4/1wNFFgDLtr1XEUL+ckq9Tr3PdKMBl10/EQ+Na2XA/nbFz6ySjOfMbSxRiNC5SFtqoclg56HVjM9bEbGSrjx1IewOqXaG8IVieHTQ7SSuhNfNEZ8q0FMBtfs5JKIvuBXjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179036; c=relaxed/simple;
	bh=0mU+Gr18j8ctUXlUwK5bdZXpnTobEBXi2+Wby91srKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9HJPdITR+RAtC8AUuVYSqBz0r4gUdzHGwExfVYSVDwwLE3PqqmU71foPG+1tDWnpimIu362Zc3SH8tj0p5zmZLOHs+iJ6rwZ8AyBtKaFXhb0CCNSCO8F7aRwTwSPPZbjjV9Oa/PTjrCV7QQaAbAE1APOXGryaEY0fyzqVMeLKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=TDHvjKWF; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79a2ee65171so11438977b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778179033; x=1778783833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x8i4c2z2WoES1t5qSKN6GUknygX5CCKfGDT1oqYJPeA=;
        b=TDHvjKWFJoWHC9uFBuMgwiI+qpUqrLa97iwkqGHkK6YH+7KGHpXRfS+PJZl9GG8e6h
         sw5zkqR2EGuac1g/0qK5Li6+rKi4imr+/0YiOML/PIIdvnT9MirAdTzpx+X6Gel1t1Qh
         ugXbJ58Q6MDG3W+6jAPopELHVxtJZk4uQu+ynhYF/ovQOygTd/XRfwp+0WSAZaS5+qKf
         AR2/9OX6zzDyEAa9Jp+65SrygIbNlQICtrz2IQr/QsyIOhII5ilo5DZIcmW+716/+Xfa
         pFSMvn/IW08crA2OuhcF2t4tbpxvGrbk0O4Jm1PcRrBJVpq24/+tOwi/fuT07WuXa43n
         qKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179033; x=1778783833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8i4c2z2WoES1t5qSKN6GUknygX5CCKfGDT1oqYJPeA=;
        b=pQmBckNyBslMN0gZfnP85dQezd46IV8tBF5gmxRdeM6/ugWY4rvkQuGsg5o65zGF0l
         C2y6ERxsN67aLS8gUVqe3qEdkyI86lHn0s9XfN1lXJpOx4/rBTfR7883iI/sjJqHtFx+
         yFXiH6dBF/pK72zws+iwDN103Qsp8OaM4tVRoYgjfo/xMPg4Cnthg4A/k5jZbxGBwN35
         i5DF9f50M0ZUVZuEDK79LtgZHixh397In+vLSC+V8pwNxA5dtVSKG7pElnoLnCGHmE+A
         7tFX5fSwIAwt7RtvEa9JN+/mBaNcm4mwnhk5fbuEGN8ZL4tXHVOMf2YVmQf3pVh++4vB
         8BeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UnKkApBv5uLMUHT4XWrR/AgpSjk5D9njkTLnj2QGYD0Z4suUXVLWCXniBKmYMrKxoJXfD+Mfz/8TbQA+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz9FYJZGD1MfjBNrse8J5IFm95SuAS3oFYWzi1XEpMM8/1oX1g
	YMaegrjS/yvXGHrnoR45lp5i20g2erMkuOMwDF/+rOGX/p/Ko/Hk++faot1zRdFtK6s=
X-Gm-Gg: Acq92OHCj7RQVX80/f3hXk8WFFh5MmnPQBXixgbOf7YWADrHHiK0KMORmd7XGd692dS
	r3M9A09Hm9BYzYRRmOR81jSUbSVf6GJ7Y/p0Kk8yTVX8SeD2ueL3jLBegigFc7U7HJcJaRdwVsb
	XhnC2+kRbUbN8mkfDb8aEAI23ttvAT6ORCuA71n5BrtPdaTY+ZMnc3nQp1agWmT+53hoWISTfSn
	nSGWOovDy/+SpHGW1GH/8jK+dX2ukKuNe6MmooP49NLB2WsuTQov+RFyEFkbXb9IKB+MILxGJbY
	TNRrLFejb40VO3b4a5BYycC22VDxuXLRdk3x8FLQnbbqXgsojcoxJx077ag6J4LaJshNrcHaodo
	W+ehPzChPH9B+M91CL/G/BMWeuz4txmFnKDLnEeLkDVTqquIqPeml05IvmOLNqIpBPiOVsTG4t9
	VrN6OxV5HnlY9KRsVHVXnRTavERwGKXL+IJ475t2XDIIKCFMKQLO38ngdT1AJqxruv
X-Received: by 2002:a05:690c:6101:b0:7a3:7ad3:3e9e with SMTP id 00721157ae682-7bdf5e7cda0mr98323737b3.32.1778179033551;
        Thu, 07 May 2026 11:37:13 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd976fd09asm57064577b3.41.2026.05.07.11.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 11:37:12 -0700 (PDT)
Message-ID: <3c78f48c-6478-46d0-87c2-581bb58637dd@riscstar.com>
Date: Thu, 7 May 2026 13:37:09 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Bjorn Andersson <andersson@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com> <afycOwz5TpkegkZd@baldur>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afycOwz5TpkegkZd@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 418304ED851
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106497-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:mid]
X-Rspamd-Action: no action

On 5/7/26 9:12 AM, Bjorn Andersson wrote:
> On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
>> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> [..]
>> +
>> +  gpio-controller: true
> 
> I don't have any concern with the use of a proper gpio driver to model
> the implementation, but if I understand correctly this relationship
> between gpio controller and gpio consumer is strictly internal to "the
> PCI device".

(I think you're already cool with this but I still wanted to respond.)

That is not correct.  These GPIO lines are used two ways for the
RB3gen2:
- drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c uses GPIOs 2 and 3 to
   assert/deassert the reset lines associated with the two exposed
   downstream PCIe ports on the PCIe switch within the TC956x.

- Each of the Ethernet PHYs has a reset GPIO.  On the RB3gen2, the
   GPIOs used for the purpose come from the GPIO controller embedded
   in the TC9564 (00 and 01).

These are therefore "exposed" (they are *not* strictly internal).

> Is this connection variable or is the link merely expressed in
> DeviceTree to mitigate the fact that you choose to implement the
> responsibilities of the two parts split into two device drivers?

It is variable.  These resets might be implemented by other GPIO
controllers on other platforms.

> Are there other consumers of these TC956x gpios which would result in a
> board designer (and hence dts author) to ever reference this
> gpio-controller in a different way?

They could.  Nine of these GPIOs are exposed by the TC956x pins
(GPIO00-06, GPIO12, GPIO35 and GPIO36).  The RB3gen2 uses 00-03
(and possibly 04 but that's for a PHY we haven't tested yet).

					-Alex

> Regards,
> Bjorn


