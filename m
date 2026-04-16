Return-Path: <linux-arm-msm+bounces-103453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DhrKqs04WkEqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 21:12:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E1414007
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 21:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CF6630EAB41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 19:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F9E226CFE;
	Thu, 16 Apr 2026 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ik2rhivZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3533F5BE;
	Thu, 16 Apr 2026 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776366673; cv=none; b=KasdrSxEH4sRNvc+ImZLm9kPMyt5jKg4N5ZBq0lsOQSoutYRQUXm8LDCQiqkip3zrPxNgxGcB7r8WlprAk1/jOmyM7gFTPgq3DVhX4icCCZq0+4jliBtLx3vzjYtHss/tuDLFA+NOo/o6TcXxsCpNVT+YU9hAnr/LAqwnUxGyX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776366673; c=relaxed/simple;
	bh=Q2H3x8CdirEHfVoa08O/a+N+b/S6QwlAH7SlxTlmmfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=f0CzWC0AuXFJlDl/4xIirfCVDzFr87yweWGyssrg+xlkiRZQhOUzs/8esvIZehQZXQknI4Q10JRuDWd0KI4oTIkrJPjZ5d80neEbSy3d2W9R7BGNq3AaPEW8Kl9C+vCYFSvWBNUFilVscLIvBrr2PfwupDqIe+h+2nnAg83los4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ik2rhivZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B72C2BCAF;
	Thu, 16 Apr 2026 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776366672;
	bh=Q2H3x8CdirEHfVoa08O/a+N+b/S6QwlAH7SlxTlmmfg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ik2rhivZKSXgN5rKi/dWwx3Hgk21VWQffi8tBP/cwrpj6Y01UiKcQoXv37K6MDg99
	 cmta1Pz8Jdr5BxvUomqb2r+EILw2ONnyLXpBh3hvYq7DiEpN2NrpxMp4AMiE679pao
	 JA3ycbMLQY7v0X2uc/aeoPmi50YD61iaOD1acTZZOHxnwzPUjcylcfB11I5//Md2Ok
	 XuWtabYZFKCjaBDObM4WqIVOxuGn0cwutpM0etxUvP6MpPFNaTb83sQYZCFGWvZ9aU
	 bnGhSzEGoKuTooYlB77rwelwHnFwmQEwuybTt7LGfvsgBdLnMr5YCzOlZdqkyn6IaB
	 oJrhZLIfEL9RQ==
Date: Thu, 16 Apr 2026 14:11:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 0/4] PCI: Introduce pci_dev_suspend_retention_supported()
 API
Message-ID: <20260416191111.GA21551@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103453-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 019E1414007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[+cc Rafael]

On Tue, Apr 14, 2026 at 09:29:38PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> This series introduces a new PCI API
> pci_dev_suspend_retention_supported() to let the client drivers know
> whether they can expect context retention across suspend/resume or
> not and uses it in the NVMe PCI host driver.
> 
> This new API is targeted to abstract the PCI power management
> details away from the client drivers. This is needed because client
> drivers like NVMe make use of APIs such as pm_suspend_via_firmware()
> and decide to keep the device in low power mode if this API returns
> 'false'. But some platforms may have other limitations like in the
> case of Qcom, where if the RC driver removes the resource vote to
> allow the SoC to enter low power mode, it cannot reliably exit the
> L1ss state when the endpoint asserts CLKREQ#. So in this case also,
> the client drivers cannot keep the device in low power state during
> suspend and expect context retention.

I don't know what pm_suspend_via_firmware() means.  The kernel-doc
says "platform firmware is going to be invoked at the end of the
system-wide power management transition," but that doesn't say
anything about what firmware might do or what it means to drivers.

Based on d916b1be94b6 ("nvme-pci: use host managed power state for
suspend"), which used it in nvme_suspend(), I guess the assumption is
that pm_suspend_via_firmware() means the device might be put in D3cold
and lose all its internal state, and conversely,
!pm_suspend_via_firmware() means the device will *never* be put in a
low-power state that loses internal state.

> And these limitations may just keep adding in the future. Without a
> unified API, the client drivers have to implement their own logic
> which may cause code duplication and may also lead to drivers
> missing some of the platform limitations.
> 
> Once this series gets merged, we can extend this API usage to other
> client drivers as well.

> 
> Testing
> =======
> 
> This series is tested on Qualcomm Hamoa based Lenovo Thinkpad T14s latop with
> NVMe drive.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Manivannan Sadhasivam (4):
>       PCI: Introduce an API to check if RC/platform can retain device context during suspend
>       PCI: Indicate context lost if L1ss exit is broken during resume from system suspend
>       PCI: qcom: Indicate broken L1ss exit during resume from system suspend
>       nvme-pci: Use pci_dev_suspend_retention_supported() API during suspend
> 
>  drivers/nvme/host/pci.c                |  3 ++-
>  drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
>  drivers/pci/pci.c                      | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/pci.h                    |  9 +++++++++
>  4 files changed, 56 insertions(+), 1 deletion(-)
> ---
> base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
> change-id: 20260414-l1ss-fix-6c9cf2451944
> 
> Best regards,
> --  
> Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> 

