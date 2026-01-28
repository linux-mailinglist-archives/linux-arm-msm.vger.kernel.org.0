Return-Path: <linux-arm-msm+bounces-91075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YADkH0Jzemme6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 21:36:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBFA8AA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 21:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5A5D3082CEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 20:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1378937418D;
	Wed, 28 Jan 2026 20:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxfXdXs0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3398374187;
	Wed, 28 Jan 2026 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632297; cv=none; b=uTNuU4prRry+88OgSibscc+qffPMzpV2LgM5cicIrhzRiWSN7HGqpe2ry0KnUFWvcH2gtx7JDV4dhcMbqYmy6+BBCyh02s9pXSpAMApLIPVIphFyxUxWzLOswJyUBRrrRWyWfGW3VUPT2WYAMWHrwp5GX9FdAas5dMFgecEZyvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632297; c=relaxed/simple;
	bh=zAqUqPi+IJHuKdMpXct3vGpjh9gKEStrN87eWkKsWY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5uh/78SdCJ7Y6a4CeUt4//chlB9rjROQsVU3O7VaHT+sWXBFpGIs2JVvWLBuKS92i8Ji193oN0mC8XN72Nj2Ieoe4LXjDet4z60ZpvTrf8Id+V5lz/R7XMoIB++ipEhTcTt5fWPWgP2SUsFTxxeA/t/qzaHveLH+tS04SF92mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxfXdXs0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970CEC4CEF1;
	Wed, 28 Jan 2026 20:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632296;
	bh=zAqUqPi+IJHuKdMpXct3vGpjh9gKEStrN87eWkKsWY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxfXdXs01pXHiAmQc0/u1JpjsRZXtWGwuifttmwBRE4g3GpE17c1CMG7INg5kYmRH
	 I8itvJwrMvZq2hIEfdCVob/BcZpXt0F7CPE0y0gcYvb4ZVDQmw0v5ct6qt2d33ICvj
	 5iohKgkktwBdHip7agMiraRtYPexXj0o9ls8xuyRD4F8T0eRcAsshse4ISB9qFjFRn
	 bnfqM2WyDlUrbRkFLbQ6xwQUJdVWyUb64IOP3EaQqeWHwtWNOGuQX3c6LnO2FVDauN
	 fIa6jkUCpYvUh/aYlMRIMvbIVvdfFYLWSQp0d3kqgCEsBSBXLChhTIXrPTn3cmrFAU
	 wkG0/gKWhTNVA==
Date: Wed, 28 Jan 2026 14:31:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Junhao Xie <bigfoot@radxa.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Xilin Wu <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
Message-ID: <njrzcyhdkohsmnlisdzu25b6obqotjjrzlrs42jhq5bhlz6qco@mdk5blghdqbc>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
 <875x8ln7tk.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875x8ln7tk.fsf@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91075-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6BBFA8AA1
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:13:59PM +0100, Miquel Raynal wrote:
> Hello,
> 
> >> Junhao Xie (2):
> >>       firmware: qcom: scm: Add SCM storage interface support
> >>       mtd: devices: Add Qualcomm SCM storage driver
> >> 
> >>  drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
> >>  drivers/firmware/qcom/qcom_scm.h       |   3 +
> >>  drivers/mtd/devices/Kconfig            |  17 +++
> >>  drivers/mtd/devices/Makefile           |   1 +
> >>  drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
> >>  include/linux/firmware/qcom/qcom_scm.h |  34 +++++
> >>  6 files changed, 481 insertions(+)
> >> ---
> >> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> >
> > This is 6.19-rc7, please rebase on linux-next/master (the series
> > doesn't currently apply because this base is essentially a full release
> > behind)
> 
> If I may, I even skipped the mail entirely because it was not about mtd
> in the end. There is a single big patch labelled "firmware: qcom:". I
> believe the series would better be split in smaller chunks. Typically
> one for the storage support and another one for the firmware part, at
> least.
> 

The firmware patch adds wrappers for the secure world interface, which
without the MTD driver will lack consumers of the API - i.e. I'd prefer
not to pick that part, or parts thereof, alone.

So I think it does make sense to introduce the two parts together in one
series (if you have any requests for splitting the MTD patch up in any
way I have no objections).

This leaves us with the practical problem of getting it merged, which I
believe would best be handled by me picking the firmware patch and
sharing this in an immutable branch with you, once we're happy with the
set (which won't be for 6.20).

I hope you're okay with such plan?

Regards,
Bjorn

> Thanks,
> Miquèl

