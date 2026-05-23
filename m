Return-Path: <linux-arm-msm+bounces-109484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGWiOc+xEWruowYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 15:55:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C55A5BF214
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 15:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 147A7300CC03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 13:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C1238736A;
	Sat, 23 May 2026 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZH/r74on"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1F119343E;
	Sat, 23 May 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779544524; cv=none; b=pK5tGhnAJTu4bxNs6rIRcJlmGPC86Y5P9fRebPWsRNg8IiaSch254M5yxTlIRdTieEM+yxShfN+7TeUcjgSPRvHIlWk6nJMaxD/upVzUGGN2lWwfklcRq5tdAEqyoLhjyXng/WB/ja6wqj6xbjA+j2ZVxu6yXRMDVQ1rgNbZSM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779544524; c=relaxed/simple;
	bh=prEQexlcIW5lkbV4n6Xh9aZDDj13ojbBRJFhNpl2VQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKNWFGrL3qm9KoFe/eZYKA8fE4zqEIbMLkH6nPKSmNeevX4vNwBPqKFQLSf0VeU6fsNop0n5yoYQELbf4KrJm7C+Typ1lZMyjnCF+Axt0bCsGLOn+oYFKc+ZhUSYrHYEMspJujrgOd4l6SCxVqH5qcgX6V/zIGNPPJQPbnjRees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZH/r74on; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842041F000E9;
	Sat, 23 May 2026 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779544523;
	bh=iwRnsgoTr2iWbUDasH4uZK/ECwCVzWUo6yYxaliU1W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZH/r74onQDAsv5o8zRPzKMkUAChwKYQAlL/s2gOMWN3QSmyGsfvdbJOHEQrTyo1fR
	 RH4Z05RX4bS5ITRFqkCdrTUuMDdWsEXv+9+d249Y3JNquLyX5PFf1Y1D1LILDo7Sjd
	 UOi1t52MF0BM5XHGjMZQCpQUdOSFFGdQsmqCC4BW/tBIXxWXIS4z0bCNFy0lkxZ1X5
	 zAVsxE6KRiRU80OXZPq2BwV47kZ/r1nCaOcGGghAOmGEzzJTCYakj45V/3osMNSjYK
	 SQhCopRhlVYACWbeeVTrXoQIxkAkpLRPmhwMYLIDwZAm8MxG8RGVtF1QCZGavoSBkK
	 MIDvSPJyyTL/Q==
Date: Sat, 23 May 2026 19:25:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 0/4] PCI: Introduce pci_suspend_retains_context() API
Message-ID: <r247uuc7ilkhn65vcbsaoxhgypif37lj3r3mvb7ooqqdg55vnm@vx3ip6klg6ha>
References: <20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com>
 <09473fc7-e91c-4e80-9d64-0d14d585d89d@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09473fc7-e91c-4e80-9d64-0d14d585d89d@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109484-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4C55A5BF214
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 12:04:02AM +0800, Hans Zhang wrote:
> Hi Mani,
> 
> We previously discussed a patch. I wonder if you have any memory of it. I'm
> not sure if it can solve my problem. As shown below:
> 
> https://lore.kernel.org/linux-pci/z4bq25pr35cklwoodz34pnfaopfrtbjwhc6gvbhbsvnwblhxia@frmtb3t3m4nk/
> 

This series won't address your issue as it workarounds PCIe controller issue in
waking from L1ss.

But below patch which got merged for v7.2 might help you:
https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com/

I'm not sure if your platform firmware uses PSCI for S2R (Suspend To RAM) or
not. If PSCI is used, above patch will turn off NVMe during S2R. If not using
PSCI and some other firmware mechanism, then the kernel driver interacting with
the firmware should call pm_set_{suspend/resume}_via_firmware() from the S2R
suspend ops as like the above patch to allow NVMe driver to turn off the
controller during S2R.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

