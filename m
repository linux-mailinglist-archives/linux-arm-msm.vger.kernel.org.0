Return-Path: <linux-arm-msm+bounces-108530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DudOopsDGpKhgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:58:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2FD580202
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11C84303DA3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179CB3ED3B2;
	Tue, 19 May 2026 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjXyKLC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D9175A69;
	Tue, 19 May 2026 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199083; cv=none; b=IO2YZiUNlcqQ/XZf35aKFC0jiTV25riuYCb2qogNwPJkQyZB102JDIn4ZEnvhuNFzOmUVAtJ7GEIHfT1FkKYzGBt2rwI1P0VWfKJsu96sL/aW7L4RBZDprIfis0tfx/XcWzFPM5Vedhy5FjaE/8PN2ahmK6LYPEe5XLtEp9xDhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199083; c=relaxed/simple;
	bh=nfEX+4aODCvAUv+wyKcqPTid35QTc5cD/VwXCz3ADcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRLkCvASc66hI1sD8lOAkkzVyHv+WEZMLzoPMcbKWPwPhj6YFJD6gtsFN7dLj1n0G0ggbzgZK2A+HawGR7s2DdA42mBeahwa91MBI+/WAeO8qVo0Ctz+QPOHAtrgnPTamv53e1+ZkjbgmeguDXaY+4s7Vx4rMPyyzTjxv4ZlS6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjXyKLC6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AC3C2BCB3;
	Tue, 19 May 2026 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779199082;
	bh=nfEX+4aODCvAUv+wyKcqPTid35QTc5cD/VwXCz3ADcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjXyKLC6RnfU2IV5vALZIj8Ip/8qoyK/R3psuwMTG3JXO9BTcuOc3el0D8NNI8chT
	 s0gGRepmdjn02maEMVKdztKHkmL0PIRI1De0REdgunGfSBH+Jxn7oMMz0xGiu00Bnm
	 V2FTqeNiIYu+Dh6VViDLtkb4Ds0j2QzD96R1MrZyXxs7u8yH5s+l1TzD4x35lylgJ3
	 9/G+prDp/+eIrDIqw6OrAJVNIFWXJr5E3BqmCHSGMhvHJnGYTvBoElvWGf0y8kqAcN
	 2Iq5THM2nomRkDRaKihObdG6sjEnVdNnX2RH/YlaWNy/FEJXedmSno2xWIrD0A4HU7
	 zfFdSHFaj+oqg==
Date: Tue, 19 May 2026 19:27:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	jingoohan1@gmail.com, mx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] PCI: dwc: Cache PCIe capability offset and simplify
 drivers
Message-ID: <beqy5ykxgo4ianya6r4mahkkyujs6lly475u26vqaemgqsdnhp@2pn5ipczwc34>
References: <20260509135152.2241235-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260509135152.2241235-1-18255117159@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108530-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CC2FD580202
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 09, 2026 at 09:51:49PM +0800, Hans Zhang wrote:
> The DWC PCIe core and its many platform drivers repeatedly call
> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
> PCI Express Capability structure. This is wasteful and makes the code
> verbose. And some even search for the PCI_CAP_ID_EXP offset value within
> the suspend/resume functions.
> 

Sashiko has flagged some real issues with this series in accessing DBI space
very early and 'pci->pcie_cap' being 0.

Those needs to be fixed.

- Mani

> Add a cached pcie_cap field in struct dw_pcie and a helper
> dw_pcie_get_pcie_cap() to initialize it once at probe time. Then replace
> all explicit capability searches with the cached value across the
> entire dwc subtree.
> 
> Hans Zhang (3):
>   PCI: dwc: Add pcie_cap field and helper in designware header
>   PCI: dwc: Use cached PCIe capability offset in core
>   PCI: dwc: Simplify platform drivers using cached capability offset
> 
>  drivers/pci/controller/dwc/pci-imx6.c         |  6 +--
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  4 +-
>  drivers/pci/controller/dwc/pci-meson.c        |  4 +-
>  .../pci/controller/dwc/pcie-designware-ep.c   |  4 +-
>  .../pci/controller/dwc/pcie-designware-host.c |  4 +-
>  drivers/pci/controller/dwc/pcie-designware.c  | 16 +++---
>  drivers/pci/controller/dwc/pcie-designware.h  | 17 +++++++
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++---
>  drivers/pci/controller/dwc/pcie-eswin.c       |  3 +-
>  drivers/pci/controller/dwc/pcie-fu740.c       |  2 +-
>  drivers/pci/controller/dwc/pcie-intel-gw.c    |  2 +-
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 11 ++--
>  drivers/pci/controller/dwc/pcie-qcom.c        | 24 ++++-----
>  drivers/pci/controller/dwc/pcie-sophgo.c      |  8 ++-
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c |  5 +-
>  drivers/pci/controller/dwc/pcie-spear13xx.c   |  6 +--
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 51 +++++++------------
>  17 files changed, 85 insertions(+), 97 deletions(-)
> 
> 
> base-commit: 70390501d1944d4e5b8f7352be180fceb3a44132
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

