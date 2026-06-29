Return-Path: <linux-arm-msm+bounces-115188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LN+bFhGMQmo19gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:15:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D964D6DC85D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:15:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=PDHsfQX8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115188-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115188-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 807BD30855C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3B6421F1A;
	Mon, 29 Jun 2026 15:06:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8DB37B023;
	Mon, 29 Jun 2026 15:06:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745613; cv=none; b=GD4gcYqXJMqA8IjNv4aGsQgbKJdyCTthU5Tvwm49Hjd36NuXUrfrZ+UGdQBfMIw1wmaLE90aGEWrXj4NPcJfwqrv6jccqxCxUquLNtnoiK0Ikz+tfWwG9M+pIrulMiOLl2KB4WXOIvngNjSuVdEV77O6iafzP8G/vtvE+SllmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745613; c=relaxed/simple;
	bh=BONHax0KPGvnYh/wOipV0VMGtz4EIszzeU5Nj5QrZKk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Us4uG9UJPrbBvJcRq6ujqIr2M2x01woMEhya6zsN0WPk3XIWllN8MrooTwSySXG1FG5onXfTKhXi/FIIvQtmfylubz8OJeTXl/BN6aJBi7vkfKWHd9wNXGdVybpGHqOZZdHuB8NNMTAz76PzzyMrST9b9gesljddbjW+XIXcgfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PDHsfQX8; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB1A24E40ADD;
	Mon, 29 Jun 2026 15:06:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 854325FF96;
	Mon, 29 Jun 2026 15:06:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 561EC106F18BF;
	Mon, 29 Jun 2026 17:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782745608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BONHax0KPGvnYh/wOipV0VMGtz4EIszzeU5Nj5QrZKk=;
	b=PDHsfQX8vE5Gkq/pWrLB4bkNUh8x6PgT3QnB23IU5i7pjORNCFKRKuWdrR9mSiBpE8xqNf
	3Vwv1M5wr/pfypZMB/pWA3EmDYfhhGeIV9hWBJQiaVxFC/I4wBpnJww2o0z8xL2vHcIU8N
	Hb9VPsY+FnNayGPaEkwHZH0W+54eVBbD0Z0A8Yxe0A8s0F6YeIaeSGp71GiaFHw9s6Xm9y
	1QuTgFH8U7zLx73V3vZiBqu++GH8mMqLiLZwzupY+ZDQMx1m3QDymc6ysKHO1hTigZPWtS
	SLUVw4xyFsap3weTpBrM8RL7kDWPb/IPuftw0GCBsBjZx5OEvjipX7Zzvok0zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>,  Kathiravan Thirumoorthy
 <quic_kathirav@quicinc.com>,  Krzysztof Kozlowski <krzk@kernel.org>,
  Manivannan Sadhasivam <mani@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
In-Reply-To: <3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com> (Konrad
	Dybcio's message of "Wed, 17 Jun 2026 13:42:44 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
	<20260609-quirky-rat-of-criticism-aea1fe@quoll>
	<87mrx4b164.fsf@bootlin.com> <aifKejyF7n6QsI9h@linaro.org>
	<a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
	<35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
	<aifX80IHM8TLQiV7@linaro.org> <87o6hk9i29.fsf@bootlin.com>
	<aifktn_s2qmg7MzI@linaro.org>
	<3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Jun 2026 17:06:44 +0200
Message-ID: <87v7b1s7wb.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115188-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:quic_kathirav@quicinc.com,m:krzk@kernel.org,m:mani@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D964D6DC85D

Hello,

On 17/06/2026 at 13:42:44 +02, Konrad Dybcio <konrad.dybcio@oss.qualcomm.co=
m> wrote:

(keeping the context for Krzysztof)

> On 6/9/26 12:02 PM, Stephan Gerhold wrote:
>> On Tue, Jun 09, 2026 at 11:30:54AM +0200, Miquel Raynal wrote:
>>> On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.=
org> wrote:
>>>
>>>> On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
>>>>> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
>>>>>> On 6/9/26 10:10 AM, Stephan Gerhold wrote:
>>>>>>> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>>>>>>>> On MDM9607, there is only a single controllable clock for the NA=
ND
>>>>>>>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e=
.g. for
>>>>>>>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.d=
tsi) works
>>>>>>>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the =
second
>>>>>>>>>> clock ("aon") that is required by the dt-bindings. This is not r=
eally
>>>>>>>>>> useful, so avoid doing that for new platforms by excluding the s=
econd "aon"
>>>>>>>>>> clock entry in the dt-bindings.
>>>>>>>>>
>>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcom=
m.com>
>>>>>>>>
>>>>>>>> What is the problem in giving twice the same clock? If this is wha=
t is
>>>>>>>> done in the hardware routing, I do not see the reason for more
>>>>>>>> complexity in the binding?
>>>>>>>>
>>>>>>>
>>>>>>> I had that in my first draft for this series, but this would be wro=
ng
>>>>>>> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) cloc=
k on
>>>>>>> this platform at all. I'm not sure about MDM9607 in particular (may=
be
>>>>>>> someone from Qualcomm can confirm), but a similar platform I was lo=
oking
>>>>>>> into at some point actually had *3* separate clocks for QPIC in the
>>>>>>> hardware and none of them were called "aon" ...
>>>>>>
>>>>>> gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_sr=
c)
>>>>>> gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
>>>>>> from GPLLs)
>>>>>> gcc_qpic_system_clk (32 KHz)
>>>>>>
>>>>>> No clock containing the substring 'aon' in its name on this platform
>>>>>
>>>>> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all=
..
>>>>> The NAND documentation says
>>>>>
>>>>> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
>>>>>
>>>>
>>>> Thanks for looking this up.
>>>>
>>>> IMO, if we want to describe the actual hardware routing, we should
>>>> describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
>>>> MDM9607).
>>>
>>> Sounds more accurate to me.
>>>
>>>> The resulting diff would be basically the same as this patch just
>>>> inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
>>>
>>> Diff would not be simpler but more accurate. So if we go for a
>>> modification of the bindings, I would prefer that path.
>>>
>>=20
>> IMO the result wouldn't be much more accurate from the perspective of
>> the kernel. If we assign RPM_SMD_QPIC_CLK to all 3 clocks we would be
>> effectively saying "there is a single clock with a single rate that is
>> sourcing 'core', 'ahb' and 'system'(/'aon')". But in reality, these are
>> 3 separate clock domains with separate rates, as shown by Konrad above.
>>=20
>> We could try defining dummy clocks like the &nand_clk_dummy in
>> qcom-sdx55.dtsi, but this isn't very accurate either. Presumably, all of
>> these clocks are toggled by RPM_SMD_QPIC_CLK. So if we define a dummy
>> clock for 'ahb', then enabling that clock without also enabling the
>> non-dummy 'core' (RPM_SMD_QPIC_CLK) will do nothing.
>
> I can't find a good answer for what RPM_SMD_QPIC_CLK controls, maybe
> +Mani or +Kathiravan know where to look
>
> Konrad
>
>>=20
>> At the end, the truth for the OS/kernel running on this hardware is that
>> it can only see the 'core' clock (with the option to change its rate).
>> All others are invisible, with no way to influence or check the status,
>> so pretending that we have separate resources for them doesn't really
>> make things more accurate in my opinion.
>>=20
>> But yeah, let's leave the decision up to Krzysztof. I'm happy to change
>> this patch as needed as long it works at the end. :-)

Sorry to bother you Krzysztof. Based on the previous discussion, would
you mind giving an updated point of view? If you don't have time, no
problem, I can take the series as-is.

Thanks a lot,
Miqu=C3=A8l

