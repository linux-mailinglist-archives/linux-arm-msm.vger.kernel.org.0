Return-Path: <linux-arm-msm+bounces-95046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Nq3KaBtpmkaPwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 06:12:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A21E920D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 06:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C78630547D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 05:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC6C2DC77F;
	Tue,  3 Mar 2026 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSPGYY1S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C0D201278;
	Tue,  3 Mar 2026 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772514717; cv=none; b=kly1ek9RvsU3TFRwNocto+0B0693UCHCK9ivwLtx6YefyPGBhR0J51QGYweCKrUTFiGS+22c906jRUM97o1a3Bp+QrgPNMK7MQ56Zc4teyRz3XHLwXf9R/lq6APRTgGpnclApZrZ990/JBUi3ThIhjBe6H+We/KUNHiMkoMx/eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772514717; c=relaxed/simple;
	bh=SHzF/ni6U6PzN+MiwOiLIjNBAK3a4oNFIWAmVWHXCR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfeA4XPlpz7ClxPKboo6AQCPQn3kx9Ubxexk8+sBgySdu2Tcsux8yXgdarMA7YNQ568xQ/SIhVDbAudnj+hiPLd15+PMSWuu70BYt1Sei8cRLfyT+uooO7W+cugOilsf2drmiLZOWeWvfE5wcaB+16waloMCPtLa+3HDdFUgHSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSPGYY1S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73969C116C6;
	Tue,  3 Mar 2026 05:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772514717;
	bh=SHzF/ni6U6PzN+MiwOiLIjNBAK3a4oNFIWAmVWHXCR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSPGYY1SEy5LDHLaTNlzRTk00yyyGEh6MQQC2lfkmMXuR+JPepMg7Krk3Fb2Mb/fJ
	 3owdXt7soz18ZZFs/CaaS11wUYQr9NZHFmmB3EH/nwfofsVMwBUZcbTtOyhAwdMiFw
	 y4JzOVCkXpFPm+H3AaCdxd+kj1gcNqq7cX9RS8sSwj7Aky+YfV2p51SyT8T8eUAeWr
	 enb5d0KkTiEtJyTD2UYTMS8jl3FFbakM6SKkB47eaSCOfFNUdjp89JjjvmNgzniODc
	 IOhDgOf1/+Og6zmTCDumyBloamwIgvNL7kNfTWmolZqfbia1y8+gAfmj+gq/WIZyjM
	 ecLZq3vZLJecQ==
Date: Tue, 3 Mar 2026 10:41:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Resume the device before
 executing mhi_pci_remove()
Message-ID: <au4575veiqz2kmgx4jxa5n6k45uhzucjlczodjsbl7efipwee2@n5uqjpdnvt7c>
References: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
 <aaY8xfPF9j83aM5X@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaY8xfPF9j83aM5X@hu-qianyu-lv.qualcomm.com>
X-Rspamd-Queue-Id: 0F7A21E920D
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-95046-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:43:33PM -0800, Qiang Yu wrote:
> On Mon, Mar 02, 2026 at 07:11:16PM +0530, Manivannan Sadhasivam wrote:
> > mhi_pci_remove() carries out device specific operations that requires the
> > device to be active. But pm_runtime_get_noresume() called at the end of the
> > remove() will not guarantee that.
> > 
> > So use pm_runtime_get_sync() and call it at the start of remove().
> > 
> > Cc: <stable@vger.kernel.org> # 5.13
> > Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > index 425362037830..fe3aefa15966 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -1440,6 +1440,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> >  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> >  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >  
> > +	/* balancing probe put_noidle */
> > +	if (pci_pme_capable(pdev, PCI_D3hot))
> > +		pm_runtime_get_sync(&pdev->dev);
> 
> Mani, I don't think we need to resume here. See drivers/pci/pci-driver.c.
> PCI framework has called pm_runtime_get_sync before drv->remove(pci_dev);
> Is there any other thing I misunderstand?
> 

Oops... I completely forgot this. Yes, the device gets resumed by the PCI core
before invoking the remove() callback to ensure that the device stays active.

Then the driver bumps the reference correctly using pm_runtime_get_noresume() to
balance pm_runtime_put_noidle() in probe().

So yes, your understanding was correct and I overlooked it. Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

