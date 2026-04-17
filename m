Return-Path: <linux-arm-msm+bounces-103521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ0vI4gU4mnZ1QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:07:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E741AB28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E31E305B2B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD1C3B6BFF;
	Fri, 17 Apr 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvFyvFeR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7F038AC8A;
	Fri, 17 Apr 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423904; cv=none; b=FG1oEQUCJyoznBkTPbIGfaZN7v6nvBazaaDdalivZ88SvumHFsUmeK2wOw3a7GKhj2uiO47uqlV+3GZc8tyDNEvAVhWh6rdjityKAPc0NekMMJSMI9rasMPySpPEoULo2qYu9kib39lmO4S1mT6RJEpizsZ6XHZK2Rng1ZCXid0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423904; c=relaxed/simple;
	bh=ZBam/+xG2IwtfYcUy/KBiLQ1KHTf9QZBls6Dnr28a8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esOH8NX1LVh4wCpr8VhrrU9hH+ly+9dOPncUYaJDGLgzPys8w60eHHoand2JBsKVx/HPRAndBJwmFPKbK3GBgKVA5g29Ji5tQwDwsTgJSklKIiAiH3YBtvnRtbLzC4llg9ykUg+hOZujA8w1gMFoEY6pgNsquTnxACV/JMpYGks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvFyvFeR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE17C19425;
	Fri, 17 Apr 2026 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776423904;
	bh=ZBam/+xG2IwtfYcUy/KBiLQ1KHTf9QZBls6Dnr28a8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AvFyvFeREjmDAdzq+8psWIA8mIeGpYdB8CeF3MUYfBA+RkSMQUHoGqtKH7QHKdCKC
	 2ziWJs+xs1ZKK9VOB93JPcIcSbB6YUFrJTcRNNUKt6iU/bWccR43BmYYLpjHZJFWU7
	 /QaA8VFRcDM4eyAb4klUKVUsLktjZJNZaHKJmoJTgLiyDyvm6/irO4kgIcWE0qYFzB
	 5Q4aB31M1By3TjCLY7En3DHMB2XI3OpK7M7fTDsUD6jGmXTJSu5m3gUiT0rC4oGlvc
	 SYNmN94UfzmfuA2oVZ7qwx4bljISWb9K4J1Ksy/TEGMLjownF0KUqNNpwNtYR58G4c
	 3GaNAOGX6Bh7Q==
Date: Fri, 17 Apr 2026 16:34:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 0/4] PCI: Introduce pci_dev_suspend_retention_supported()
 API
Message-ID: <3smfckgl2vwhha7rtlqlpfzlfpg2rebyump77cbi5pcgwubn3y@d66eu7axo7xi>
References: <20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com>
 <20260416191111.GA21551@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416191111.GA21551@bhelgaas>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103521-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E15E741AB28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 02:11:11PM -0500, Bjorn Helgaas wrote:
> [+cc Rafael]
> 
> On Tue, Apr 14, 2026 at 09:29:38PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > This series introduces a new PCI API
> > pci_dev_suspend_retention_supported() to let the client drivers know
> > whether they can expect context retention across suspend/resume or
> > not and uses it in the NVMe PCI host driver.
> > 
> > This new API is targeted to abstract the PCI power management
> > details away from the client drivers. This is needed because client
> > drivers like NVMe make use of APIs such as pm_suspend_via_firmware()
> > and decide to keep the device in low power mode if this API returns
> > 'false'. But some platforms may have other limitations like in the
> > case of Qcom, where if the RC driver removes the resource vote to
> > allow the SoC to enter low power mode, it cannot reliably exit the
> > L1ss state when the endpoint asserts CLKREQ#. So in this case also,
> > the client drivers cannot keep the device in low power state during
> > suspend and expect context retention.
> 
> I don't know what pm_suspend_via_firmware() means.  The kernel-doc
> says "platform firmware is going to be invoked at the end of the
> system-wide power management transition," but that doesn't say
> anything about what firmware might do or what it means to drivers.
> 

It's hard to predict what the firmware might do after it gains control from the
OS. But as far as the API goes, it just expects the drivers to save the context
and reset the device so that the firmware could do anything it want.

> Based on d916b1be94b6 ("nvme-pci: use host managed power state for
> suspend"), which used it in nvme_suspend(), I guess the assumption is
> that pm_suspend_via_firmware() means the device might be put in D3cold
> and lose all its internal state, and conversely,
> !pm_suspend_via_firmware() means the device will *never* be put in a
> low-power state that loses internal state.
> 

Yes, that's the assumption. Though, the firmware might not do D3Cold at all,
but the drivers should be prepared for that to be compatible with all firmware
implementations.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

