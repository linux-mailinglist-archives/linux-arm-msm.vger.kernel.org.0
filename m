Return-Path: <linux-arm-msm+bounces-108570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONyUBrOUDGp1jAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:49:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7700582A15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 315B7301A159
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E804B8DDC;
	Tue, 19 May 2026 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcJ/m4Me"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBBF19ABD8;
	Tue, 19 May 2026 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209382; cv=none; b=bLnqy+gOGSaO6Vg/gcNcxx683Zfk4vNF/+q3IEkShoxHjLkaFChifMx7KsyTfU4j+StgaqJSkTDW2SkuMy7evi2DG3tfW9N7ygyeA3SiXB+kYrBQy8fDBoRFLACuVM5CRWpLLMKyKsmSbWpgXrr+2yVvAIHQbGD68njFGuIzKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209382; c=relaxed/simple;
	bh=xK7G16bEnZgohr2GyDq+tZifrjDBAqojOxTNLJhUbiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0Y1bDxxL1eQVd3uexerW9Yp59Y9yDFioZ9GYhLud06VOyPDjFGV8TOUmV7pio+tMincgV3Ha4NBseDFkdhWK1CivrPbbiBkRO5UZkzaEOIOzmuzv90MH0c22Yt+5i7M6lAO+1OrSW8BDIH4QNK/EzdYfDBnGUMJqV/wbmOkNZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcJ/m4Me; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA12C2BCB8;
	Tue, 19 May 2026 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779209382;
	bh=xK7G16bEnZgohr2GyDq+tZifrjDBAqojOxTNLJhUbiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcJ/m4MeM2e98nnOTWyxvz0J/hHpuy2z+cR32k07YBEdAsrTReXtpj7hfVlMsvGlw
	 yJJYp5kvNjdIqpCwscGHQA56+TjGyzl/dZsVPXAwpVk/HE52dM8WNVt2xHGifb4268
	 ukJWQPCeyERVndgALRGPasfOJTh3aaHh6ONkilTpHGPTz0XWSJ3Rxa62xrSxHMjseK
	 e9TsViLHyP+GvHcE8couHEqJSm2xfg/nxEOorcVP9VnTPlk8LKolVT7rgg0EWrpzpU
	 AeYCgpVNMG7Nn2SNACkuPVj0jHTyxhbuG1qAcXJpBwk+7Mvp/PN3W6YUEaVF7Vm8Up
	 P+3U6rw/fm8ZA==
Date: Tue, 19 May 2026 22:19:33 +0530
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
Message-ID: <m332ocvmmdzcgnzmzxmbn2nmczxuhplt5efh64fd22fagrot42@x3okixj5qjb2>
References: <20260509135152.2241235-1-18255117159@163.com>
 <beqy5ykxgo4ianya6r4mahkkyujs6lly475u26vqaemgqsdnhp@2pn5ipczwc34>
 <5cc6fbcc-98eb-4da5-b123-2c04c4d39326@163.com>
 <bejh7em2a67a6wohtakovbg6wqwhjoxkuqtdompsexfm5bbzrf@yqwcqeg6yugq>
 <3464ded9-721a-4eb2-afb6-bbca6fdc8a46@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3464ded9-721a-4eb2-afb6-bbca6fdc8a46@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
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
	TAGGED_FROM(0.00)[bounces-108570-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: A7700582A15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:27:21AM +0800, Hans Zhang wrote:
> 
> 
> On 5/20/26 00:15, Manivannan Sadhasivam wrote:
> > On Wed, May 20, 2026 at 12:09:28AM +0800, Hans Zhang wrote:
> > > 
> > > 
> > > On 5/19/26 21:57, Manivannan Sadhasivam wrote:
> > > > On Sat, May 09, 2026 at 09:51:49PM +0800, Hans Zhang wrote:
> > > > > The DWC PCIe core and its many platform drivers repeatedly call
> > > > > dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
> > > > > PCI Express Capability structure. This is wasteful and makes the code
> > > > > verbose. And some even search for the PCI_CAP_ID_EXP offset value within
> > > > > the suspend/resume functions.
> > > > > 
> > > > 
> > > > Sashiko has flagged some real issues with this series in accessing DBI space
> > > > very early and 'pci->pcie_cap' being 0.
> > > 
> > > 
> > > Hi Mani,
> > > 
> > > We have discussed this issue in the Cadence driver. I think it won't cause
> > > any problems. Specifically as follows:
> > > 
> > > https://lore.kernel.org/linux-pci/5823faec-d972-4c77-90ec-a215c686e0a8@163.com/
> > > """
> > > As per PCIe r7.0, sec 7.5.1.1.11, Since all PCI Express Functions are
> > > required to implement the PCI Express Capability structure, which
> > > must be included somewhere in this linked list.
> > > """
> > > 
> > > 
> > > 
> > > Bjorn also responded as follows:
> > > https://lore.kernel.org/linux-pci/20260505212306.GA744158@bhelgaas/
> > > """
> > > It's true that all Root Ports must have a PCIe Capability.
> > > """
> > > 
> > 
> > Ok, what about reading the DBI registers very early?
> 
> Hi Mani,
> 
> Yes. I have performed the DBI read register operation at the very beginning
> of the following code.
> 
> 
> dw_pcie_ep_init()
>   dw_pcie_get_pcie_cap(pci);
> 
> dw_pcie_host_init
>   dw_pcie_get_pcie_cap(pci);
> 

These both calls will cause crash on a lot of platforms because these will be
reading the DBI registers while the resources are not enabled.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

