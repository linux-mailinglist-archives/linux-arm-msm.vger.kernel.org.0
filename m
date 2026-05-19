Return-Path: <linux-arm-msm+bounces-108567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JK9zD/eODGp1jAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:25:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD3D58245C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85C6A306E909
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA93407CDE;
	Tue, 19 May 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxLDXn/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FE400E1A;
	Tue, 19 May 2026 16:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207361; cv=none; b=TwwXhOhGmthmdG+kj8Awyu+VkVw2rSK1IafxCAnVCI9IlpLyN00lsyCKGAi0QJizMKgU5yi0FShuOecKmtWRLnN1aiuj5jQT8MdoPQDgGFlK81xaiKdd2if32PUTQyFm1XndwEyVC+MiUoP2rqxrY0FBFamBpGclXBUWL/zglZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207361; c=relaxed/simple;
	bh=ZvyXX+KsWZ2Bty8hNC/PaNKLRJHR5CsnAEO1Bw4UQRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtvKeSHflCV0LU78yZs2fQ/sbSKOqqJGPtDGfP8J3cukrA8H8F4iLOaDbu2+vatyyQqI1V78Sg4bhn568spefNHHOJ61Njwd1YApJ8twZ3Nojq6J/4RjtNJfVTI2xvGI+ahyvGNeMvJPzenSTx26rJEMb5XuA83dQiqgXegwJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxLDXn/w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E7BC2BCB3;
	Tue, 19 May 2026 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207360;
	bh=ZvyXX+KsWZ2Bty8hNC/PaNKLRJHR5CsnAEO1Bw4UQRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxLDXn/wxfxAUg+pVuo7jKn4NkGyioS5jTl2YNmfyEmCsXy5xxDdVtK06YpAswKZq
	 ks7jNsn7Es1zSEJjDfqeg9j6M8qewHMXnjFLxdxUmxGsbY0Uu9E0e5GXeex4QfUCPU
	 GMlCNqWktMub0bBKsVOFNbTOwP2V4BPNw8NleP6fInu0rOSsNv2DcXxoLtSKbrn6cY
	 uV+t38OFIB6jqiz4Lu+fdOd7cHBSU7ekzV/JaZWvxr+HyqG31OvTL0ICP9vnUQBCrK
	 xOsOlW+zW7oYXGb9DiHVb9Zfh25J3E6ZiG5RudqGahGfHIbxSjaCEDCrQXewTuOyug
	 tgK7WlPMFlhkQ==
Date: Tue, 19 May 2026 21:45:51 +0530
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
Message-ID: <bejh7em2a67a6wohtakovbg6wqwhjoxkuqtdompsexfm5bbzrf@yqwcqeg6yugq>
References: <20260509135152.2241235-1-18255117159@163.com>
 <beqy5ykxgo4ianya6r4mahkkyujs6lly475u26vqaemgqsdnhp@2pn5ipczwc34>
 <5cc6fbcc-98eb-4da5-b123-2c04c4d39326@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cc6fbcc-98eb-4da5-b123-2c04c4d39326@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-108567-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EFD3D58245C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:09:28AM +0800, Hans Zhang wrote:
> 
> 
> On 5/19/26 21:57, Manivannan Sadhasivam wrote:
> > On Sat, May 09, 2026 at 09:51:49PM +0800, Hans Zhang wrote:
> > > The DWC PCIe core and its many platform drivers repeatedly call
> > > dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
> > > PCI Express Capability structure. This is wasteful and makes the code
> > > verbose. And some even search for the PCI_CAP_ID_EXP offset value within
> > > the suspend/resume functions.
> > > 
> > 
> > Sashiko has flagged some real issues with this series in accessing DBI space
> > very early and 'pci->pcie_cap' being 0.
> 
> 
> Hi Mani,
> 
> We have discussed this issue in the Cadence driver. I think it won't cause
> any problems. Specifically as follows:
> 
> https://lore.kernel.org/linux-pci/5823faec-d972-4c77-90ec-a215c686e0a8@163.com/
> """
> As per PCIe r7.0, sec 7.5.1.1.11, Since all PCI Express Functions are
> required to implement the PCI Express Capability structure, which
> must be included somewhere in this linked list.
> """
> 
> 
> 
> Bjorn also responded as follows:
> https://lore.kernel.org/linux-pci/20260505212306.GA744158@bhelgaas/
> """
> It's true that all Root Ports must have a PCIe Capability.
> """
> 

Ok, what about reading the DBI registers very early?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

