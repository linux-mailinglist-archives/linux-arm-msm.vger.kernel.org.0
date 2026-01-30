Return-Path: <linux-arm-msm+bounces-91317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDFGMva7fGlVOgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 15:11:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64114BB778
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 15:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAA23300B3F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 14:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C329D3203B4;
	Fri, 30 Jan 2026 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tbZYpIjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4353631AAA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 14:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769782249; cv=none; b=IiUo4z01mERRNQekzpRo2bMgT0AYriMmxYOtys9QD912vyzgr04hN2su+ueXA7taD9a0qfRY5jju95Grpj6w+oP4V4pph3i2v+DyUz/0i4aHRtNx0bhDcSzrSYqS5UH23Blr7zvak0ypTELTVRGY3cD5khSeksJ5wBXP/EU8rB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769782249; c=relaxed/simple;
	bh=ecDc80eooQS9rlWWy0Md7i2Jn9Ijn5zzrwYvHvmNqtM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MTMOqtnk23F6aUakCyg7OtJH7UfmnGGX8A0kU3xC1a10jmo9uxqYg+so8sSorfbSOgd78HFVtf46qagGtFyGZ7vaxW34A3H3s4kHuE3w+btQkosEse9gMVv/qOvMqcS+c9NDDY0hqUpIupIq4WINOTH56jQfisG7Hgli46lNCQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tbZYpIjf; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DD7F3C22F5D;
	Fri, 30 Jan 2026 14:10:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71A896075A;
	Fri, 30 Jan 2026 14:10:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63704119A8874;
	Fri, 30 Jan 2026 15:10:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769782244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ecDc80eooQS9rlWWy0Md7i2Jn9Ijn5zzrwYvHvmNqtM=;
	b=tbZYpIjfTkEL05J9upskFufDDI1w6rhle+M3XAUwMupurQKBLsGw9vkjN4fJH49PEBp+En
	OklUD9QY8712XBHX23LRoAySawwuyJFAPSSutn2ApMNmx0mlWH3e159qEJobM4SDLtoUY1
	rTLdLPjQ72OmclqnHfQtYsvfm8ihgW1+2BBF3rJBI1wD98ammweJSYyON18a0UHK1YodhT
	ngpDwfHp66BO4VAk+Rz4Zzr6PZgfGSzQqQYvEI4LXkrjxfirJOSbSdZ9fD43zsDDAqtuiY
	hng9Ls9kcjdrVOLX5VHeCC5zNvE6eShhJdJZlNEq9yC1qicEeQEsZcVF4rBibQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Junhao Xie <bigfoot@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  Xilin Wu
 <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
In-Reply-To: <86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
	(Junhao Xie's message of "Fri, 30 Jan 2026 21:39:48 +0800")
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
	<x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
	<86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 30 Jan 2026 15:10:38 +0100
Message-ID: <87ecn7jin5.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-91317-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64114BB778
X-Rspamd-Action: no action

Hi,

>> I don't believe you answered my question regarding how to access this
>> interface from the kernel. On many of these devices we can find the MAC
>> addresses of the system in the "DPP" partition. Do you have any ideas
>> about how we could access this from within the kernel?
>>
>> Regards,
>> Bjorn
>
> I agree with your point. I will add a module param in v3 for default
> read-only mode. e.g.: /sys/module/qcom_scm_storage/parameters/allow_write
>
> For something like the "DPP" partition, I think it's better to access it
> from userspace than from kernel.

If it's a MAC address that you are accessing, direct userspace does not
sound like a good fit. If I may, NVMEM cells are there exactly for this
purpose: identifying the content of a subpart of a storage device in a
storage agnostic way. The NVMEM cells are made available to in-kernel
drivers (ie. network devices have all the infrastructure to get the MAC
address from there) and their content is also exposed to userspace
through sysfs now.

Thanks,
Miqu=C3=A8l

