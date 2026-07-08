Return-Path: <linux-arm-msm+bounces-117791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U2ueKISWTmoGQAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:27:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE07297EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:27:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=smankusors.com header.s=hostingermail-a header.b="B/jGNJ49";
	dmarc=pass (policy=none) header.from=smankusors.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117791-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117791-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B20833041BA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 18:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23373B9DA9;
	Wed,  8 Jul 2026 18:25:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99693F8EAF;
	Wed,  8 Jul 2026 18:25:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535155; cv=none; b=iYKFMgikMS7hRvoxe3uiNwJtULeGswZJ/v7ot1tFpYBBqnyScw9EEh19Fo/aSKoDJu4mPLJBm1gOrKiCPC9CYdix9Ciyh1ePsBNTAkkmNbc2PuYb+sCBjWdJib6JjvApKGYEHFrhHCbXLa4JUhFl8lnv4ZuJ/+f1oanBFi/fil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535155; c=relaxed/simple;
	bh=5yXvn/gpOR20miOVd4WiDzvuALdUVB/cU2rjTKrJMCc=;
	h=Message-ID:MIME-Version:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=IGg999geGYhsSW4DI7E0HPeFuRQTiD3wjf0n1sbH3wabixRQLA3zPkH34CqadM7nUxe5XShxrzpH3wp72TS1MtDiALzPviG7DS3CqkrWbwqxNhdlYlWtBxf2POrU5T9DCjkyuGVbQg4xiP1eVPHgQfMFXUkRwsnegd7yvXoYyy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=B/jGNJ49; arc=none smtp.client-ip=23.83.209.14
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1752372437C;
	Wed, 08 Jul 2026 16:04:24 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (100-99-1-218.trex-nlb.outbound.svc.cluster.local [100.99.1.218])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 72E347205DC;
	Wed, 08 Jul 2026 16:04:21 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Tasty-Spill: 137317f657501c95_1783526663875_289215567
X-MC-Loop-Signature: 1783526663875:31143019
X-MC-Ingress-Time: 1783526663875
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.1.218 (trex/8.0.2);
	Wed, 08 Jul 2026 16:04:23 +0000
Received: from [IPV6:2001:448a:c030:316e:b8e2:bbc7:3d89:8c8f] (unknown [IPv6:2001:448a:c030:316e:b8e2:bbc7:3d89:8c8f])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gwNFV4GCnz3x4r;
	Wed,  8 Jul 2026 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1783526657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kr7VQf8ZzO2JBmOdnOiu+PrPMNuw6QONG49N8QeykEI=;
	b=B/jGNJ49X0fWqW3aHfokZe/pwQf18mV67nc7Y1b2aFjRWKqqvCFtdHaKeQ5PMly2ObVzBu
	5QcZSQaHMYAlWG2XdSPdzNoI1TW2h4sGo7L0HD0xhTG4ZfspIoGCgWMidgI5gga+oBpGkJ
	VXPsRu8luv96ynQfAo/CPdr8Wj2GnT7SNidQdM7Pm5M4J9TyD3Wuc8yVapSBTlW1b1LZ2o
	H1aQKW+3Vx2mTKn9/TJvhC3rTNYEGLqm1JClO3mnnExFOJXOW4wP58nHLuHw/H52vVWq7T
	d6O7LtTIrY+QRZ7jChMhqfBLlrbuB4WPdpGPzV/WWInksII63UwZEjGKBxnybA==
Message-ID: <39a31586-aa7d-4f86-b50e-3ec6716f8b1d@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Herman van Hazendonk <github.com@herrie.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
 <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
 <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
 <e129178c-6079-4538-89a2-247185dd0ce7@oss.qualcomm.com>
 <f1749c0a-bb54-4ddd-94cb-75af9386a47a@smankusors.com>
 <48a406d4-0033-4538-a9bb-75ccc4897a3a@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <48a406d4-0033-4538-a9bb-75ccc4897a3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed,  8 Jul 2026 16:04:14 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=6a4e7501 a=lpteb6p+8y13cqEB7rv2Fg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=YaxdAi0B3nudGsBNGgUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfGsgijK+z609f1Ly48tLKs6Xovg614oqKSuBIinQj0OWa2ShF9DWJe4eirzMm78ymdT5bm++fexpbe5PAJuXXc4oV4zKD2OET9oQFgc+cGp27OlHN+nX VuBbY23Mo1wfk28f85c6+qN4raK/m51oLWmMAasfKH78Zr6SO3rgRE3zTxWnOzX8+BQob5SjTqDlwOtaRsNqMc0s8VPeBqh2pnHWuC/uAuKlvWFcEItPHlwO Roe6dhJ1F1qRlAsqJ8ruX5L3pLSyfKc486XMwAVlZiv0qISwoovWR1gXCmNgTGGAYlKT+DoX1jhdP/MfEosYrAwTNlWhJmcu36r+Fl0samI6gnvl/n8miZ6i Om24Sqn03P5q2okdgGSzwYZ+XUL8Gl3NkIngpBFEPL1HIk7uxNqtI50A1Bvk9HE4JoZ7B793rVENQsdNwBrIUJ0QuU9NvDzzVbc1Ri7yP5H9ERiU2WPAkLmh 2ZzZTwQj5ITGYaQVVAVY3XegnmagMQwOmVWt1Wxqx4DJSZ1+tcapXewWC8K294hjFG+2TtmbX+chH41pqD4JeCK4ozEZJUH1QyNzirWFIoK9gVnHlOb6qg7C HgE1Z/Im8gsldIY32LQQ1vwR7D7pjFILl8r6bIyA0wz9B5+7u8RoZm04+x/RqNon2fEegrGwrrgyEtyg/39e16RT
X-AuthUser: linux@smankusors.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117791-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EAE07297EF

On 7/6/2026 5:58 PM, Konrad Dybcio wrote:
> On 7/4/26 11:02 AM, Antony Kurniawan Soemardi wrote:
> 
> [...]
> 
>>>>>>> Seems that way - cpu, L2, and GPU, maybe others
>>>>>>
>>>>>> nope, tested on Sony Xperia SP (MSM8960T), the phone hangs
>>>>>
>>>>> [...]
>>>>>
>>>>>> [    2.679716] L2 @ Undefined rate. Forcing new rate
>>>>>
>>>>> This seems odd. What's the reported rate there?
>>>>
>>>> if you're asking clk_get_rate(clks[l2_mux]), it's 0 Hz.
>>>
>>> Hm, are the parents registered?
>>
>> pardon me for stupid question, but how do I verify the parent
>> registration?
> 
> Parents are just other locks that happen to be specified in the
> parent_data/parent_names field of this L2 clock.
> 
> For checking if they're registered at all, you can check if they're
> present in the debugfs summary I mentioned (they would also have their
> own directory in /sys/kernel/debug/clk). For checking if they're
> registered at some specific point in time, you could hack in a
> clk_get() and null-check it
> 
> [...]
> 
>> Do you have other idea how to solve this? I added some pr_err if the
>> read poll is timeout:
>>
>> [   11.164436] [pmOS-rd]:   ❬❬ PMOS STAGE 2 ❭❭
>> [   20.400232] krait_add_pri_mux: krait0_pri_mux, hfpll_name: hfpll0
>> [   20.400793] Enabling HFPLL hfpll1
>> [   20.455491] krait_add_pri_mux: krait1_pri_mux, hfpll_name: hfpll1
>> [   20.456081] Enabling HFPLL hfpll_l2
>> [   20.560623] HFPLL hfpll_l2 failed to lock (val=0x6, ret=-110, hd->lock_bit=0)
>> [   20.758961] krait_add_pri_mux: krait_l2_pri_mux, hfpll_name: hfpll_l2
> 
> I noticed a bug (patch attached) in the enable function. I then realized
> the patch from the OP also fixes it.
> 
> I then tried to validate that the code we have in Linux even checks the
> right register.. Unfortunately because this SoC is so old, it's difficult
> for me to find docs for it (and the register layout I have at hand isn't
> itself enough to deduce some things), so that's inconclusive.
> 
> I then took to msm-3.x and lk sources, but they simply never check the
> value of the status register, they just call udelay(60) with presumably
> very high hopes and a lot of prayers..
> 
> Can you check the state of the gcc_base+0x3420 register before and after
> the /* De-assert active-low PLL reset. */ line?

I assume gcc_base is regmap on clk-hfpll.c, I dumped 0x3400 to 0x3420:

[   21.089748] HFPLL hfpll_l2 mode_reg=0x3400 (before reset) regs:
[   21.089775]  3400:00000002
[   21.090300]  3404:7845c665
[   21.095944]  3408:00000000
[   21.098714]  340c:00000000
[   21.101404]  3410:00000001
[   21.104098]  3414:0108c000
[   21.106787]  3418:00000000
[   21.109478]  341c:00000000
[   21.112169]  3420:00000703
[   21.114858]
[   21.120243] HFPLL hfpll_l2 mode_reg=0x3400 (after reset) regs:
[   21.120262]  3400:00000006
[   21.121903]  3404:7845c665
[   21.127540]  3408:00000000
[   21.130228]  340c:00000000
[   21.132916]  3410:00000001
[   21.135605]  3414:0108c000
[   21.138299]  3418:00000000
[   21.140993]  341c:00000006
[   21.143681]  3420:00000703
[   21.146367]
[   21.251760] HFPLL hfpll_l2 failed to lock (val=0x6, ret=-110, 
hd->lock_bit=0)
[   21.271774] L2 @ Undefined rate. Forcing new rate.

-- 
Thanks,
Antony K. S.

