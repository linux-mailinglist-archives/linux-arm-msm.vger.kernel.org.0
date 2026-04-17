Return-Path: <linux-arm-msm+bounces-103524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE0tL8wj4mlX1wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:13:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC741B1FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D209E3145558
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6EA3368B6;
	Fri, 17 Apr 2026 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEFL5pS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF932AADE;
	Fri, 17 Apr 2026 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427612; cv=none; b=BZnqcK/gBDnOP5rOiGAv0LjYyu0QKj3KQ3MfdyIhkQxsWAbbGZdnryCwcd6PzQDsF9JqqFVRSUQufnmCsamALu5OGdUxoKLL+GiozE4c3DLtnhXaBiwHQq3nlJmAgPZaQnDXaHHYwL1zgjHm5X7JrdM9yHRYMQYJjoQ7XJCP7DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427612; c=relaxed/simple;
	bh=gX5slQsvRLsEFrAM+WwAVauNcHLIRbuo2mgnsXramdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCnH386E5DzQQv8gKSNYklf9+oFij3Fu4uwYhEtohXccNAyq5kawelaAZ7utxuIEjIYWmZkUYQsOJHQazKszmnY8SBh74AGBPP/4X8B4b+XnaKuXeHmM1Sv+4kbjkzwyaaxYOHlkap7oFQeiVXTcfLYRt42PocKFPqrUso1bVE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEFL5pS+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E74EC19425;
	Fri, 17 Apr 2026 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776427611;
	bh=gX5slQsvRLsEFrAM+WwAVauNcHLIRbuo2mgnsXramdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEFL5pS+fJg+7QEkYJ06Vt7vuF/zJVS4dPQHL96T74FZtEHS8RZoSdJmaqJ6Zn8U8
	 CnWb74b7vhNdd+0AoxJHIJMfsXAsdTIKoftNCUD3ls10XYEYpXFtbHbhj1t/Grj9+M
	 LqjIBvHhbt/Te4blDWcIyUcE7j3nzAVCN88jmOPXDu6tPWtT1y1ePfnsMlWbkcXH0p
	 7Q0K0ufSFEsoGLgPmhkdTn3WP7Hn1CkNt3rgjt19CcZXziP2t9ZkWI/T47PEIPfccU
	 NfrBHyGMoVSAmxzdhziW1r1Irq2/lxEmDi1K9Zm5fjkI3I4ltClz617KPLyAO4hUa4
	 JXhW6vAccvXIA==
Date: Fri, 17 Apr 2026 17:36:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 3/4] PCI: qcom: Indicate broken L1ss exit during resume
 from system suspend
Message-ID: <vji2jty2pqerse6g66pavrt7e7oq3bax4m6sobp5wxew6xwv6d@r5lbv35klz6b>
References: <20260414-l1ss-fix-v1-3-adbb4555b5ab@oss.qualcomm.com>
 <20260416192000.GA21992@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416192000.GA21992@bhelgaas>
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
	TAGGED_FROM(0.00)[bounces-103524-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3BC741B1FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 02:20:00PM -0500, Bjorn Helgaas wrote:
> [+cc Rafael]
> 
> On Tue, Apr 14, 2026 at 09:29:41PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > Qcom PCIe RCs can successfully exit from L1ss during OS runtime. However,
> > during system suspend, the Qcom PCIe RC driver may remove all resource
> > votes and turns off the PHY to maximize power savings.
> > 
> > Consequently, when the host is in system suspend with the link in L1ss and
> > the endpoint asserts CLKREQ#, the OS must first wake up and the RC driver
> > must restore the PHY and enable the refclk. This recovery process causes
> > the strict L1ss exit latency time to be exceeded. (If the RC driver were to
> > retain all votes during suspend, L1ss exit would succeed without issue, but
> > at the expense of higher power consumption).
> 
> I don't think the link can be in L1.x if the PHY is turned off, can
> it?  I assume if the PHY is off, the link would be in L2 (if aux power
> is available) or L3.
> 

As per the spec, if the link is in L1.2, the entire analog circuitry of the PHY
can be powered off and that's what I meant here. The LTSSM state would be
preserved by the MAC layer, whose context is always retained.

The only problem is that, CLKREQ# is routed to an Always-on-Domain (AON) inside
the SoC. So when the endpoint asserts CLKREQ#, AON wakes up the SoC and later
the PCIe controller driver turns ON the PHY. But by that time, the L1ss exit
latency would've elapsed, causing LDn.

> L2 and L3 both correspond to the downstream device being in D3cold
> (PCIe r7.0, sec 5.3.2), so I assume this is a reset as far as the
> device is concerned, and we need all the delays associated with reset
> and the D3cold -> D0 transition.
> 
> > This latency violation leads to an L1ss exit timeout, followed by a Link
> > Down (LDn) condition during resume. This LDn can crash the OS if the
> > endpoint hosts the RootFS, and for other types of devices, it may result in
> > a full device reset/recovery.
> 
> What does "L1SS exit timeout" mean in PCIe terms?  Is there some event
> (Message, interrupt, etc) that is triggered by the timeout?
> 

By 'L1ss exit timeout' I meant the failure to move to L0 state post L1.2 exit.
During L1.2 exit, the endpoint expects the refclk and common mode voltage to be
restored within the negotiated time. Per spec, r7.0, sec 5.5.3.3.1, Exit from
L1.2:

```
Next state is L1.0 after waiting for TPOWER_ON

* Common mode is permitted to be established passively during L1.0, and actively
during Recovery. In order to ensure common mode has been established, the
Downstream Port must maintain a timer, and the Downstream Port must continue to
send TS1 training sequences until a minimum of TCOMMONMODE has elapsed since the
Downstream Port has started transmitting TS1 training sequences and has detected
electrical idle exit on any Lane of the configured Link.
```

So if this condition is not satisfied, then the link would move to the LDn
state and that's the only event triggered to the OS.

> > So to ensure that the client drivers can properly handle this scenario, let
> > them know about this platform limitation by setting the
> > 'pci_host_bridge::broken_l1ss_resume' flag.
> 
> I don't see how this means L1SS is broken.  If the device is
> effectively reset, of course we can't go from L1.x to L0 because we
> didn't start from L1.x.
> 

From the OS perspective, the link would still be in L1ss and not expected to
move to L2/L3 during suspend/resume, since that transition is controlled by the
OS itself. But when the OS resumes, the link would go to LDn state and it can
only be brought back to L0, after a complete reset.

- Mani

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 67a16af69ddc..01afffd384f2 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1363,6 +1363,17 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> >  
> > +	/*
> > +	 * During system suspend, the Qcom RC driver may turn off the PHY and
> > +	 * remove votes to save power. If the endpoint asserts CLKREQ# to
> > +	 * exit L1ss, the time required to wake the system and restore the
> > +	 * PHY/refclk exceeds the strict L1ss exit timing, resulting in Link
> > +	 * Down (LDn). Set this flag to indicate this limitation to client
> > +	 * drivers so that they will avoid relying on L1ss during system
> > +	 * suspend.
> > +	 */
> > +	pp->bridge->broken_l1ss_resume = true;
> > +
> >  	if (pcie->cfg->ops->host_post_init)
> >  		pcie->cfg->ops->host_post_init(pcie);
> >  }
> > 
> > -- 
> > 2.51.0
> > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

