Return-Path: <linux-arm-msm+bounces-93576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIf/H9vrm2km9gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:55:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A006171FC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B0AE303049F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 05:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5B73451BB;
	Mon, 23 Feb 2026 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="hwWpglky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA8EADC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771825920; cv=none; b=DHCAfUksw4CgvUvjcqX2hCrQ4vTiTzHHxUrPXRhKqzelqXm12XLQWcBqBb5HcljSXvU18hqpUjgHLXqkHINS0LtB9Za1w0H4l0EXVv95pejzLUDz3wtvbCJE3W4xttJtikLfXNnCwpzEEQqq6tVwDWvPdEHq4eVtEybOEgt4XW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771825920; c=relaxed/simple;
	bh=tsZGinYTxVCG2zJ3moSLeuEmyjM7gf3z0x3YYcIfbrA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jtrGIbIwQxOr+f1B3PUkagYK98EDGkRi+homaxhTtxFO7BF7FwYMUWowcyYVkw1TZRRq7szvQAYE+PCWK3GFap9jyev8qoznsse/qVwZwI7H6osuLmX7N6rRk+kC+Y99+V2I1BdP1BzFMAzm7kBqMCfuDY+JyK1cHSuei6gFgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=hwWpglky; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <0397c453-e1ec-44a2-bf8f-a64347882226@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771825916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+etr68lQ0tf0G/csmk5P+HHB4sPoSNbI0nyD3l2haC4=;
	b=hwWpglkygVTXhSltG6Fky+5cXje7fl/xTQU4EPRyZFaKwZ+gfHQ7CJ7XdnaY3IFu+iteyO
	PEnQbOX2wZ916Q5zlC6WAl7m/rW4Qp7OeD160O2BMbxreAzAKhXkadMuA5GGMPXdpIr1b2
	2CfpLyS74zbxGiub6PKDrTu2P0VuyAvX7W5/5mFH5KlaKW0l80dHk1dwXQ+Tn/FDCDdAeJ
	B+SqeaQ6imww07TqAN3xnYZ/8Azk67Pndln5Ycfs9doJeHo3HSWhSiSo/0vCNoFvg0QI75
	IXNwE6xupJxpebJaZT2ZnWsRRJ0DddNbEGYmnRxQWj8xQ7Z8FVVWqcUzoJsYUQ==
Date: Mon, 23 Feb 2026 02:51:44 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa/x1: Fix TODO in system power
 domain node
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
 Daniel J Blueman <daniel@quora.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260221105245.19328-1-daniel@quora.org>
 <9defac59-ae8a-4658-ab38-dcb0559d9708@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9defac59-ae8a-4658-ab38-dcb0559d9708@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93576-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: 4A006171FC6
X-Rspamd-Action: no action


On 2/23/26 1:11 AM, Maulik Shah (mkshah) wrote:
> On 2/21/2026 4:21 PM, Daniel J Blueman wrote:
[..]
>> Fix this by using the CPU C4, cluster CL5 and system DRIPS parameters from the ACPI DSDT Windows uses, together with the Low Power Idle _LPI minimum residency of 9000us and wake latency of 5000us as exit latency. Finally, assume the entry latency is the difference of these two values.
[..]
>> Fixes: f33767e3cfa5 ("arm64: dts: qcom: x1e80100: Add missing system-wide PSCI power domain")
> Using this fixes tag, can make the change back ported to stable kernels without dependencies and may break the GPIO IRQs.
>
> Background:
>
> PDC monitors the wakeup capable IRQs during system wide low power state, hitting the system low power mode can break to wake via GPIO IRQs.
> The system-wide idle state was not added since the wakeup capable GPIO IRQs were not configured at PDC with 602cb14e310a
> ("pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now").
>
> So IMO this fixes tag should be used instead of above with the changes to configure PDC to monitor GPIO wake ups.
> I have these changes to configure GPIO IRQs at PDC and enable back domain_ss3 idle state in my local tree, which i plan to
> post this week or next.

On a previous episode of L-K-M-L… :)

https://lore.kernel.org/all/0c8735f9-eac0-449c-aa95-b82cec0e6cb2@oss.qualcomm.com/

FWIW I have just tested Konrad's patch from there that adds all three 
states (0x02000154, 0x02000254, and 0x0200c354):

❯ doas cat /sys/kernel/debug/pm_genpd/power-domain-system/idle_states
State  Time(ms)       Usage      Rejected   Above      Below S2idle
S0     367            330        9          315        9 0
S1     2719           2057       553        2520       71  0
S2     0              0          1          1          0 0

As of right now I don't see any improvement in idle power consumption 
from just this S1 thing, compared to not adding anything and having the 
implicitly-added-by-code S0 state only.

It still only goes as low as 2.5W in screen-off idle, and that's with 
runtime PM enabled for 3 USB controllers out of 4 (enabling it on all 4 
makes the system shut down), without doing that it's more like 2.75W.

---

Maulik, since you seem to be the oss.qualcomm person familiar with power 
management — could you please shine some light onto the mystery of how 
Windows achieves ~0.5W battery consumption in screen-off idle (and only 
slightly higher in screen-on idle) i.e. what exactly could be wasting 
those extra 2W under Linux? Ever since people started daily driving X 
series based laptops this has been an eternal topic/question in 
aarch64-laptops…

Is it just Windows doing something "extraordinary" like opportunistic 
full-system sleep (as deep as CX collapse), even with display on and in PSR?

Or are we still missing something big in Linux?

That issue with runtime-suspending all four USB controllers shutting the 
system down, does that mean there's some rail where USB ends up being 
the last load-bearing thing holding it up and we'd like to let it go 
down properly?


Thanks
~val


