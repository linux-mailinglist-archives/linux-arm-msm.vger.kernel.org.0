Return-Path: <linux-arm-msm+bounces-114260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eJ0HGKLROmocHwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 20:34:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8156B9759
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 20:34:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mrs.ro header.s=mail header.b=JG7pVemT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114260-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114260-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mrs.ro;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C374F304D462
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AEB35E948;
	Tue, 23 Jun 2026 18:33:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mrs.ro (mrs.ro [142.132.237.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B0413B5B3;
	Tue, 23 Jun 2026 18:33:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782239617; cv=none; b=TCBpEKUMGqcnDajq35PAViT34Ba6VzNNqoEWAtPjHdtG/eYQRmeGmrjE45U0/serBdWfePieCj29FL+fXrIM/EYlhjHKNA3n21AVy0u/FLw58nqz3/PM7FxBw7CEAZhO7cvBFnFXVS9+HnNAf7qEwTuuapETGKgkU3WeHwIT0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782239617; c=relaxed/simple;
	bh=XrHhZiPLRFdDnfe75B5Sj5kViTe/S8yPL5sa8BZ8ClU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=s4F25ZeblpxprIbCELI2m9NEfetuLMYG765EBJlkEg3x9vxn66i8jWuFnfxOVfakhvBCnqzLoiYGam3KrvqS/lsNgZyYR7ux9qqfFc9/JNo0vBlqoOteHZx4NJTn6F6DSqFwvv8IrRlDj+X/GspL9YNvF67rR7RwQxBO+ZALzH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mrs.ro; spf=pass smtp.mailfrom=mrs.ro; dkim=pass (2048-bit key) header.d=mrs.ro header.i=@mrs.ro header.b=JG7pVemT; arc=none smtp.client-ip=142.132.237.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mrs.ro; s=mail;
	t=1782239231; bh=XrHhZiPLRFdDnfe75B5Sj5kViTe/S8yPL5sa8BZ8ClU=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:From;
	b=JG7pVemTi5vz8uX1ktlfjD/UssavmJw2HOunU6lxRc7HTyRUDwuICJa5d9/fWdfcN
	 3Max0v4cnX/5MnTpM37jng/PJT7YpVff07jbfwJNswyE4MntlNp6DLqlr/USfjXTGn
	 JpXIe+e9rENoVRExgmxag855hVPhpDjRa2m6cRi7OoIUmPi53yti3FbpXgKbvaLvj9
	 fWj1l7l3lOBNLOotKMOQtnpJZCNq2iC0xjq8eRmInAumhiI0qqrxrEpdFkijnq1B57
	 LCzrUtLTSoyDy3eFrNagxYGBiL8SEoI/ZjM+md6nMhBNJQF58TMLkuupOi3uhJHOWN
	 HFZppnNMCu9Nw==
Received: from [192.168.1.103] (81-197-255-239.elisa-laajakaista.fi [81.197.255.239])
	by mrs.ro (Postfix) with ESMTPSA id F0D941467FE2;
	Tue, 23 Jun 2026 21:27:10 +0300 (EEST)
Message-ID: <2095cb86-6729-41f3-a0f3-b806d6acafd3@mrs.ro>
Date: Tue, 23 Jun 2026 21:27:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: mail@etehtsea.me
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <20260515172926.16597-1-mail@etehtsea.me>
Subject: Re: [PATCH v2 0/4] Introduce HONOR MagicBook Art 14 device tree
Content-Language: en-US
From: Valentin Manea <valentin.manea@mrs.ro>
In-Reply-To: <20260515172926.16597-1-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mrs.ro,reject];
	R_DKIM_ALLOW(-0.20)[mrs.ro:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114260-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mrs.ro:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mail@etehtsea.me,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[valentin.manea@mrs.ro,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[valentin.manea@mrs.ro,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD8156B9759

Hi
> I'm using it with an external display connected to the HDMI port as > a daily driver for quite some time now. > > eDP support is broken 
(screen is eigher grey or grey with noise), > thus, keeping it disabled 
for now.
The reason for the eDP problems is that the firmware enables DSC for
the panel at boot, but the msm driver does not yet support it. There are
some patches floating around to add the functionality but they seem to
have some problems. In the repo with my name that you quoted I have
integrated them for testing, but as they are they already have been
rejected for mainline, so I think we just need to wait for qualcomm or
linaro to finish their work.
Now I have a simpler solution for this problem, I just made a copy of the
one of the eDP panel drivers and do a force disable of DSC on resume,
which seems to work perfectly fine, there is enough bandwidth to
drive the panel even at 120Hz even with DSC disabled. You can find my
patch in the quoted repository in the qcom-x1e-7.0 branch.


If this is an acceptable solution I will cleanup the patch more and
post it here. Perhaps the other solution is for the msm driver to
disable DSC explicitly for panels that advertise it, because it might
be enabled by bootloaders/firmware.

Valentin


