Return-Path: <linux-arm-msm+bounces-91208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I4FO9Wpe2m8HgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 19:41:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 560FAB3A99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 19:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CEEC301455A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D032F8BD3;
	Thu, 29 Jan 2026 18:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rVP9e3X6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AB2D8796;
	Thu, 29 Jan 2026 18:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769711934; cv=none; b=KQclXfjs9Skt+E5Xs/ZB9dEzo5E3lTuBrSdkiqYueLCUZpdDUwRM3r002UuxwZklVdOiZmy6GtUp08MpLqrJDZqM1ZkpmRq0x6dSLVZtQzYkaPY3DAad0ggLfU8m3GKwQDgSRkY0ow36km9AGoHTCVi94U9ydNga53TS2RDuu8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769711934; c=relaxed/simple;
	bh=RgHO2pkUFSgU4t4TLGPUHZGx0S+toOfJKk5R7JzVOLQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SftbRDT/HELzbGumvh5hS778r9/eQEAsNJOd76CUAZJR3yjx3BCmLSYd8SPPEdBXYYEaxCq7pvZsdSaDi3Nj4yRrk527VobVEzMk9RgUwzxcNcKsL6/o2snOe9MVr3CT9KwRjMciIQBYqdBt5VkvZut+Y29ifi5UuQXJOq6xFWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rVP9e3X6; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F1A41A2B11;
	Thu, 29 Jan 2026 18:38:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3655D60746;
	Thu, 29 Jan 2026 18:38:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C38B119A880F;
	Thu, 29 Jan 2026 19:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769711929; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RgHO2pkUFSgU4t4TLGPUHZGx0S+toOfJKk5R7JzVOLQ=;
	b=rVP9e3X6fXoClBPXCPhoP7BSYBOtTcPNHLgyBvFkcaicQTSZ0X0uowXMx/DwvhujyBREpm
	fM5v7tqFldp6J7Cn93HyKBwUnqXk4BrKLsUg5K87idhTveUn7IRgN/EUjdO8WkmSqaEG6i
	vex6a/y9FF6tTS7uRdHB3gOZsiYfRlRCJRK6bW9JmBnuRLtuNHhD29JcU7NZNdmnrihzEz
	+ndD/0mw6cMsrLB3WRoRxXWJfOyKCb67+fpOoCvWfkXPrOXjezr4+bgZcou+qTXRpuRhVS
	u4X4sGxLpGazqSh7p6CemlnAPcdR429XWDjVSOL4odcVglWaaiSeYmLT5tH59A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,  Junhao Xie
 <bigfoot@radxa.com>,  Konrad Dybcio <konradybcio@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Xilin Wu <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
In-Reply-To: <njrzcyhdkohsmnlisdzu25b6obqotjjrzlrs42jhq5bhlz6qco@mdk5blghdqbc>
	(Bjorn Andersson's message of "Wed, 28 Jan 2026 14:31:33 -0600")
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
	<d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
	<875x8ln7tk.fsf@bootlin.com>
	<njrzcyhdkohsmnlisdzu25b6obqotjjrzlrs42jhq5bhlz6qco@mdk5blghdqbc>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 29 Jan 2026 19:38:44 +0100
Message-ID: <87fr7ol0wb.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-91208-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Queue-Id: 560FAB3A99
X-Rspamd-Action: no action

Hello Bjorn,

>> If I may, I even skipped the mail entirely because it was not about mtd
>> in the end. There is a single big patch labelled "firmware: qcom:". I
>> believe the series would better be split in smaller chunks. Typically
>> one for the storage support and another one for the firmware part, at
>> least.
>>=20
>
> The firmware patch adds wrappers for the secure world interface, which
> without the MTD driver will lack consumers of the API - i.e. I'd prefer
> not to pick that part, or parts thereof, alone.

Yes, I understand.

> So I think it does make sense to introduce the two parts together in one
> series (if you have any requests for splitting the MTD patch up in any
> way I have no objections).
>
> This leaves us with the practical problem of getting it merged, which I
> believe would best be handled by me picking the firmware patch and
> sharing this in an immutable branch with you, once we're happy with the
> set (which won't be for 6.20).

Works for me!

I'll send a minor review with a couple of comments, but we can apply
this close after next -rc1, if you are good with the fw part.

Thanks,
Miqu=C3=A8l

