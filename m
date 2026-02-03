Return-Path: <linux-arm-msm+bounces-91682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPPNKTEFgmmYNgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 15:24:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F737DA87B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 15:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9F37311FFAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 14:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFDC3A9008;
	Tue,  3 Feb 2026 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ITm17Gom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19D3A8FE3;
	Tue,  3 Feb 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770128442; cv=none; b=LdWzO0BQS7xwDN6box6y6MhC/xc7zENaJbFrYPp1DF7bIpEQovJzhZg6ePbpSjXvreRnV7mZI1hkr9SqRqBPWnaqmJiK3Wt0x+hL5+kRIjzn8g0ARv1N2RUyhPn1RP69yihx6LLOsT1apVzOYyXyNrUSZS2bdr/GY8PqsMU8cRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770128442; c=relaxed/simple;
	bh=YzHWWLyPmYVYllBbHIN2b996bUg6VSpCKy2fOccKpUA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Aczo16mhRpApuBmC7ZCfC9wk/oFxHtP+RmVQJcujFt/yzqxZrRd1UfMQnLzD9idma0PiWHBN10XAiie8FTgFy2R3FXhFyZ/7lIQlEX65emx9z4ei75ZM3ruT5kiF1XURkDj1bsm/vWNbmJlhLy8nob5iDVikL8lYdM7o6esN274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ITm17Gom; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1E716C211FF;
	Tue,  3 Feb 2026 14:20:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D67B060728;
	Tue,  3 Feb 2026 14:20:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A28D5119A8888;
	Tue,  3 Feb 2026 15:20:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770128436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YzHWWLyPmYVYllBbHIN2b996bUg6VSpCKy2fOccKpUA=;
	b=ITm17GomWUm3JBxrTsaokQAr56Gc76Yiuz7QkjAbmc5xKNyFmsIw8ZYF+sR7ZbrUjNqsjR
	4hMwKE6Pep4iqQVALMeMMSZSpvGWx+kT6aRqTiOAwJuJ6RwKNx0FuI07TixY4OQ2LtCpp1
	hg14v2KaywJPYxSmYLSMudYf2Z9RtZL+0xURZIwm5s5c4cDfuhzbb4eM2HGVDbjuCl6FOu
	s+9ukkIZ/waeW9gBtHFDmBnyOfPJcnIDv3kHybTu+6Mc1EO25XxewpjGVu2VdrtW+SfaP3
	KvqEYs+a3xLsovzrNrGqroHMloRf27tqs5V0PNXPmrwP6GnZNtxpAOGr2Y0ZbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Junhao Xie <bigfoot@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  Xilin Wu
 <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
In-Reply-To: <8B3AF14A70DEB168+16bb085f-6930-45c2-ab70-83eef50624b5@radxa.com>
	(Junhao Xie's message of "Sat, 31 Jan 2026 00:45:14 +0800")
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
	<x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
	<86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
	<87ecn7jin5.fsf@bootlin.com>
	<8B3AF14A70DEB168+16bb085f-6930-45c2-ab70-83eef50624b5@radxa.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 03 Feb 2026 15:20:28 +0100
Message-ID: <87jywthpsj.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-91682-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F737DA87B
X-Rspamd-Action: no action


>>> For something like the "DPP" partition, I think it's better to access it
>>> from userspace than from kernel.
>> If it's a MAC address that you are accessing, direct userspace does not
>> sound like a good fit. If I may, NVMEM cells are there exactly for this
>> purpose: identifying the content of a subpart of a storage device in a
>> storage agnostic way. The NVMEM cells are made available to in-kernel
>> drivers (ie. network devices have all the infrastructure to get the MAC
>> address from there) and their content is also exposed to userspace
>> through sysfs now.
>
> Qualcomm's SPI-NOR boot firmware uses a GPT partition table. The "DPP"
> partition contains a FAT file system, and the MAC address is stored in
> one of these files.
>
> Because the data is stored inside a filesystem rather than at a fixed
> offset, it does not fit well with the NVMEM model, which assumes simple
> offset-based access.

Not anymore, there are nvmem layouts now that are much more
flexible, so if a network driver shall get this MAC address, it is still
doable.

Otherwise there is no such need, and in the case of a file in a FAT
filesystem, I guess it is preferable to use mtdblock/ubiblock in order
to expose a block device and mount it from userspace.

Please note that exposing a FAT filesystem on top of a SPI NOR is very
inappropriate. FAT is a block filesystem, not aware of all the MTD
specificities (like bad blocks).

Cheers,
Miqu=C3=A8l

