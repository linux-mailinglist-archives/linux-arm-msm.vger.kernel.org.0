Return-Path: <linux-arm-msm+bounces-100111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGCpCHklxWkU7QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:24:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A5733524B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B6B8305CE0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052A93F7A80;
	Thu, 26 Mar 2026 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="csuMkZ9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cyan.elm.relay.mailchannels.net (cyan.elm.relay.mailchannels.net [23.83.212.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D523139A04C;
	Thu, 26 Mar 2026 12:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774527590; cv=pass; b=OEXgVmCziG7gUXDg9xkI5F25ypQhLzF4ny9EfLBE4723R2bO2YszhgChv/o9o2dvuZjqWAeFayVkwMSPCP8U9tUi5es4EYT+RVAOHVy7C4msLi59EXL/7QUjSIpOd5E6ZA5mROsGOQNlf/dt0BqkZFO/9scoJsD+vD0lky79qjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774527590; c=relaxed/simple;
	bh=Vz5S9H6Pby4OehJkIKEruyNQa86WKw88cdgPJyrBVwM=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=t3QXPOzeeU2mSRnmuymY5tEn+FtU1WkzVfv5Z5qf6qdgEEdwmqc9WrDV6flQxYhEZE9UXS2IuIqY1fSNNl/p+qQ/4GH8o8TatUDY3M7biS2MnLQ/DbGh+2Hpq0Xx6qAYUTwBBOXSFoMxv6zKKJvdogZsjDV0Aykx9t+RF0NUxak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=csuMkZ9D; arc=pass smtp.client-ip=23.83.212.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 101134E1E60;
	Thu, 26 Mar 2026 12:01:01 +0000 (UTC)
Received: from fr-int-smtpout19.hostinger.io (trex-green-1.trex.outbound.svc.cluster.local [100.96.16.108])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 90FDF4E12E1;
	Thu, 26 Mar 2026 12:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774526460;
	b=RHa03PlWrVDJ/85j0zUqDyMfNvYtMhq2SIz4mKQwxzJR/IE3saYfP1VEnKdHOmoiXN/cwS
	zOPVpIEiePpyIKAo+CLrXpBK0/rFyAFAPZKBEyG/X5hIIHYRebrHM1MxYAn2UOiyG/HLZt
	3jO24+bv+xdZf6F7GZwgdt9y+yW0W+dKZiuShgAa1iji4i0UyUPUUW3hyPGyIH8ojBBbrZ
	khKuzdogHuhh/R/Wk6OVheFkIXlIV10fT7xoxJT/gBvIe4EwqmFQLtoaChn49277UNEhUP
	1OTKPAxGrV4AJ7QI5I1688WyG1fq33PaePndycdEIGRgv/Zx46zLJYKbJq8Zgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774526460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=WnrocUNggqvz3INtqivTHgtL/XlNGyk5luM3l6z3IRg=;
	b=dVfs+qeTiJVbAsQv9imN6JTAwjIi+RHV4qI9Gge5vQVZ4bj0RYU3mfWNS57vAKELMkHuBq
	p/CMW+Y2nC7hLEq8+Z4GzNniNs72sJTXgKXabxgGPUp2IoLifojzZ7MwhIZ0cbpvTMndv9
	6NSd9GwubfBCWPo9PcKef/WXWVGHJnM5Fte4qvWrJeRE0xxkOQ7rg9ZOGMI32VW3xXbmlR
	c79OmKxB74zohO0X0C7+dXFo+dmc/3zP3t7gUpBFyFXuFC8zMRElkg+H1QzOKjhpbHI48U
	yvK62W11K8pvEH9tyKb9wreD6a4SeRo2kUe+Iq9KZLKY+0KG7/RebZ9AM+dGpw==
ARC-Authentication-Results: i=1;
	rspamd-db964497c-4fp6h;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Zesty-Interest: 7f38a29149175688_1774526460811_1763565449
X-MC-Loop-Signature: 1774526460811:3013558152
X-MC-Ingress-Time: 1774526460810
Received: from fr-int-smtpout19.hostinger.io (fr-int-smtpout19.hostinger.io
 [148.222.54.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.16.108 (trex/7.1.5);
	Thu, 26 Mar 2026 12:01:00 +0000
Received: from [IPV6:2001:448a:502c:4ea6:f59a:8eea:dae5:9f6f] (unknown [IPv6:2001:448a:502c:4ea6:f59a:8eea:dae5:9f6f])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fhMmh2MhYz1xy3;
	Thu, 26 Mar 2026 12:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1774526455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnrocUNggqvz3INtqivTHgtL/XlNGyk5luM3l6z3IRg=;
	b=csuMkZ9DeSB5Mn7kzz/JWo3ZtTdopKQ3wc7i+YUjubdzDfQGpMIdRdJll1gSqayO7VOOUo
	JfgxDa7lXKDjdCY1sv6X2AlFt8KXNBNlsCpyGqLG4uHggkUrktNwvNxwoN1wE6QkYia8jd
	qC2XRv8an6FMejIMn8KAqHdVW0cCzcXBedOCpCNZL5MOEUVCbR5jJjCEa44PYhmBumvuhz
	oimLN4fzFZS0OaHRL2QzN0SiaGyqROMEZDWLTiqyZCoOrBNeQu01QUSFV49DdDokLaDEaB
	nfW+DUccsXllYaXZdQ/4Ei2dE0EyMxhVJQ3hDC3x69XmwQrlEqDJ3BVPLOEA2g==
Message-ID: <0b85a229-219f-4457-8fe4-bd4b3545684f@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: qcom-pm8xxx-xoadc: add support for reading
 channel labels
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
 <20260326-pm8xxx-xoadc-label-v1-2-027805dad4db@smankusors.com>
 <acUIAh_r7mSfIiEB@ashevche-desk.local>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <acUIAh_r7mSfIiEB@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Mar 2026 12:00:52 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69c51ff7 a=1IylDFeuS8XspTXaodopzQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=o-qGAwvgtZWI0aAfrXgA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfEJbGOOMJFcoSDip9GVhDzxy3RTdNLi2Pj75jTPWSN/LqpOUlqw30nxPqxINYmumlmZV09yvfURl/iz5uTi5v27joQfPArNaMKV72xu97lmprqHt7eNX 6cNvmQk68faXYMzN2jh9ucymnaoKWGB0Y99LenjoTze6jHscKYDtu3oVbsjTzAexKK/8eE+g71dQzpbYratRvQr3Sk1cQo6pnVxqGFktTTmheXT0l0O7OIRd e3Fa+6NENVm0r14LySe6rDwPACWWdR8WqUbLaWgTvEAQPmQAqGDtuENku0G4ii152UgEv/y48Pz49We12aN4SjDmdFLP86V64t1SWskKGkXcYM1q+I9FutVM sxzO2XNEwkkkKy92rOWpnz3okoSIA9rWyHmhzGz6MA0hpuyS0xj3kzAsQlJGqZMD73PcZBR68jgVAnHaNwNAPug8ITkstCsZfRW+SMKmab9fFml9hnHqqGZj 5r371m5PY6ZlDfAsfNTQ4aG/wXcwwRGS+F5NBD0S42NXWBf+7JAup+Ft80l/jKmEHquAAo3WIuWPYM6elGrx8WdDtbnKufs8BKUU2/zvOluIP4wR/orTm166 mGnyNYz3cIXGBgyHLPqhjSQIOqbaFs2suKQnhnPPKEtyGOUT/SblOnFc13u96xRncaBCH0wX0Ki2onyMKmaG9qA05Uu9Izwp0WUUDyxbg5dsHquMOQGwt3RN MTii9hQMCde6wr8oV4OCe8A9hHTZ3sBVmd7qlbhk+L0fMwSyEM21wi5IZiqJ5QoND8thTSQlH40=
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100111-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72A5733524B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/2026 5:18 PM, Andy Shevchenko wrote:
 >> Tested-on: Sony Xperia SP (PM8921)
 >
 > Interesting, never saw this tag before.

Oh, I just realized I misremember Tested-by tag as Tested-on... Let me
know if it's not acceptable.

 >> +	if (!ch) {
 >> +		dev_err(adc->dev, "no such channel %lu\n", chan->address);
 >> +		return -EINVAL;
 >> +	}
 >
 > Isn't it a dead code? Also poisoning dmesg with this recurrent 
message is not
 > good idea to begin with (the user space will have a door to flood it, 
which
 > might be considered as an assistance to hackers to clear immediate 
logs after
 > a successful attack).

Good point about the successful attack hint! I was copying the existing
code from pm8xxx_read_raw. Do you think those checks are unnecessary for
pm8xxx_read_raw as well?

Thanks,
Antony K. S.

