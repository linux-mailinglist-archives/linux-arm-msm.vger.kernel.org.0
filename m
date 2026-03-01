Return-Path: <linux-arm-msm+bounces-94721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKoVKM0mpGmMYwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:45:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 426401CF669
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72049300D762
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AB831C567;
	Sun,  1 Mar 2026 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyVYHmTD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D5F319617;
	Sun,  1 Mar 2026 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772365515; cv=none; b=BFvaTIwlkWvpr2SytQKViC0WrXtmRMGZDbakR9KywkSsUAJqlM8WF3/xC5y/OaPVYse0niXAZraK8tTM5olWStqkwzoMG0tuX12NuhGr/LW5UItZxBdwxTnwZEHZTAvayVPHXhBFYKtFxmsi1835tF4+oLgg2RnJdKhkUqXd63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772365515; c=relaxed/simple;
	bh=HO8YivHWw2NmKZjyR/AaPuMHAlumMfbukAjMxjZL6Ow=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8QjFPm7bz09+UIEh4ASeUugfaxDnUwOVzoQZqwUlTtlcDGDrOLAxkO3j5L9qf/WI87UcUMBtdZ29GKK0FBGW/LdD0TwR91pdrKY7wUVYmYwjfXEfYHLMAKayUG+fcjRsaQw+VXDGW4DK+Pf337oDK6gqE6N7ETAkVCtDYfK11w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyVYHmTD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B912C2BCB2;
	Sun,  1 Mar 2026 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772365515;
	bh=HO8YivHWw2NmKZjyR/AaPuMHAlumMfbukAjMxjZL6Ow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pyVYHmTD0THNl+QW/OMlfXylHjgGxR6zOTKcWckHv/fbwcSv/a4MGsrLSPLyTt/9c
	 m1omC4beoBiybHQqt2Onfs+8XhXwJAipyW8ze6mQXR8U8BreiItSVgmAr6NLj/ekkH
	 6fPIA4qi2F20OWSxjPIKmEBjsD8FUWhITpueJbN4ShldBizLAMPh9d4HopLuCX/Yef
	 N5YF+fLvKzeP3QZQyUcqz/8XWY/svr2zap2p4hEns8t0BcDxROrFhSdvL/pcZ6bAYB
	 oMjheTQk2V+OPqyY2/h9Po+cVyjg74hJYXwEfnN2A11MOkZAlxtC/n+7KwEhDK8gt8
	 KVA0jtHMBACAQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vwfEW-0000000Evlq-39lc;
	Sun, 01 Mar 2026 11:45:12 +0000
Date: Sun, 01 Mar 2026 11:45:12 +0000
Message-ID: <86y0kb93jr.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,	Nipun Gupta
 <nipun.gupta@amd.com>,	Nikhil Agarwal <nikhil.agarwal@amd.com>,	Joerg
 Roedel <joro@8bytes.org>,	Will Deacon <will@kernel.org>,	Robin Murphy
 <robin.murphy@arm.com>,	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Thomas
 Gleixner <tglx@kernel.org>,	Rob Herring <robh@kernel.org>,	Saravana Kannan
 <saravanak@kernel.org>,	Richard Zhu <hongxing.zhu@nxp.com>,	Lucas Stach
 <l.stach@pengutronix.de>,	Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>,	Manivannan Sadhasivam <mani@kernel.org>,	Bjorn
 Helgaas <bhelgaas@google.com>,	Frank Li <Frank.Li@nxp.com>,	Sascha Hauer
 <s.hauer@pengutronix.de>,	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,	Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,	Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,	Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>,	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Prakash Gupta
 <prakash.gupta@oss.qualcomm.com>,	Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>,	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,	linux-pci@vger.kernel.org,	imx@lists.linux.dev,
	xen-devel@lists.xenproject.org,	linux-arm-msm@vger.kernel.org,	Charan Teja
 Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a struct
In-Reply-To: <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
	<20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
	<bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: dmitry.baryshkov@oss.qualcomm.com, vijayanand.jitta@oss.qualcomm.com, nipun.gupta@amd.com, nikhil.agarwal@amd.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, lpieralisi@kernel.org, tglx@kernel.org, robh@kernel.org, saravanak@kernel.org, hongxing.zhu@nxp.com, l.stach@pengutronix.de, kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, konrad.dybcio@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org, krzk+dt@kernel.org, prakash.gupta@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org, charan.kalla@oss.qualcomm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94721-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 426401CF669
X-Rspamd-Action: no action

On Sun, 01 Mar 2026 10:59:23 +0000,
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
> > From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > 
> > Change of_map_id() to take a pointer to struct of_phandle_args
> > instead of passing target device node and translated IDs separately.
> > Update all callers accordingly.
> > 
> > Subsequent patch will make use of the args_count field in
> > struct of_phandle_args.
> > 
> > Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > ---
> >  drivers/iommu/of_iommu.c              |  2 +-
> >  drivers/of/base.c                     | 37 +++++++++++++++++------------------
> >  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
> >  drivers/pci/controller/pcie-apple.c   |  4 +++-
> >  drivers/xen/grant-dma-ops.c           |  2 +-
> >  include/linux/of.h                    | 21 +++++++++++++-------
> >  6 files changed, 44 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> > index a0937b7b3c4d..e1d4b37d200d 100644
> > --- a/drivers/pci/controller/pcie-apple.c
> > +++ b/drivers/pci/controller/pcie-apple.c
> > @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >  {
> >  	u32 sid, rid = pci_dev_id(pdev);
> >  	struct apple_pcie_port *port;
> > +	struct of_phandle_args iommu_spec = { .args_count = 1 };
> 
> Hmm, I didn't notice this. Parsing functions are expected to ignore
> of_phandle_args before the parsing. So passing .args_count = 1 is
> strange.

It isn't strange. It is a semantic requirement. It explicitly
indicates the boundary of what the driver is prepared to receive, just
like passing a single u32 * is perfectly clear.

Frankly, this patch makes an absolute mess of the current API.

	M.

-- 
Without deviation from the norm, progress is not possible.

