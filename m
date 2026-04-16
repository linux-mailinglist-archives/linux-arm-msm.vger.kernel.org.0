Return-Path: <linux-arm-msm+bounces-103455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G0zFXk24WlFqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 21:20:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA74140D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 21:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8DCEB300B44F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 19:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6AB36DA1F;
	Thu, 16 Apr 2026 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqW3owkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8201736CE02;
	Thu, 16 Apr 2026 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367202; cv=none; b=JBXBLKLB6NP4+Hr7daIx/EkO3Mf11LJ0KyH1NvLx5wUAw8IUNzP/mA4ncoun4Y3+k9cEY97tkkppl1K4ZObKj2mnB9BnuRap5/kVgXLXn9QrQXSb9T/BJGPz1jUDTiD6GGTmrEKKs5r7HWnol/EaXSHOEVWnnQfA5FDXT3q1UQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367202; c=relaxed/simple;
	bh=7hNoPjfRYKU5U5iFcWqPcwkIIxa98Sc2JAWepvIltT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=GcDuT2pLW6T7ijPDZS9mQejhfrAOrbe6UESTDWhIrFmzwehNot4SGcX1GPLxSzMmoeX1JNgXyMclxCUo2WkALRXnd1ZQUJkF+VVVbONaCe6ZdiRwRvePC1IwmyeN7eAH/bJUmbfGGAqPp6mO6PTUsPwPMTQXlGKwFbkz4ETi5WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqW3owkM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB58DC2BCAF;
	Thu, 16 Apr 2026 19:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776367201;
	bh=7hNoPjfRYKU5U5iFcWqPcwkIIxa98Sc2JAWepvIltT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IqW3owkMCYpC4VANOth7b4iLnX67SMSdgN/LGZqxMp7xOAedDzpf3xu12rPA8Ak6/
	 tRec/6ySePzmOYTzWb90Matv2ow8wqorbNfAtjpiqHdmjZEdCgaCSN9/4uYzx8zP5T
	 ThORpsWD3AcUgn0etGdwb4B/RejGgkdMTdggaSzAHkzl+5VhYU0aNFS9Yr1UwEdxNB
	 l9Ur79FVrXdwayThGgTNAofyvuwifoajp83KRcOEKLYkiQxqc5sR/fZY2GjsHY0ptI
	 JmJI8yicWW19oZJJTwsthalHFkMuEHXkobZj+7YTUrycnmdDQUSHEMb1jfJdEdbRLe
	 rUizM4xVbcMrA==
Date: Thu, 16 Apr 2026 14:20:00 -0500
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
Subject: Re: [PATCH 3/4] PCI: qcom: Indicate broken L1ss exit during resume
 from system suspend
Message-ID: <20260416192000.GA21992@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-l1ss-fix-v1-3-adbb4555b5ab@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103455-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 38AA74140D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[+cc Rafael]

On Tue, Apr 14, 2026 at 09:29:41PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Qcom PCIe RCs can successfully exit from L1ss during OS runtime. However,
> during system suspend, the Qcom PCIe RC driver may remove all resource
> votes and turns off the PHY to maximize power savings.
> 
> Consequently, when the host is in system suspend with the link in L1ss and
> the endpoint asserts CLKREQ#, the OS must first wake up and the RC driver
> must restore the PHY and enable the refclk. This recovery process causes
> the strict L1ss exit latency time to be exceeded. (If the RC driver were to
> retain all votes during suspend, L1ss exit would succeed without issue, but
> at the expense of higher power consumption).

I don't think the link can be in L1.x if the PHY is turned off, can
it?  I assume if the PHY is off, the link would be in L2 (if aux power
is available) or L3.

L2 and L3 both correspond to the downstream device being in D3cold
(PCIe r7.0, sec 5.3.2), so I assume this is a reset as far as the
device is concerned, and we need all the delays associated with reset
and the D3cold -> D0 transition.

> This latency violation leads to an L1ss exit timeout, followed by a Link
> Down (LDn) condition during resume. This LDn can crash the OS if the
> endpoint hosts the RootFS, and for other types of devices, it may result in
> a full device reset/recovery.

What does "L1SS exit timeout" mean in PCIe terms?  Is there some event
(Message, interrupt, etc) that is triggered by the timeout?

> So to ensure that the client drivers can properly handle this scenario, let
> them know about this platform limitation by setting the
> 'pci_host_bridge::broken_l1ss_resume' flag.

I don't see how this means L1SS is broken.  If the device is
effectively reset, of course we can't go from L1.x to L0 because we
didn't start from L1.x.

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 67a16af69ddc..01afffd384f2 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1363,6 +1363,17 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>  
> +	/*
> +	 * During system suspend, the Qcom RC driver may turn off the PHY and
> +	 * remove votes to save power. If the endpoint asserts CLKREQ# to
> +	 * exit L1ss, the time required to wake the system and restore the
> +	 * PHY/refclk exceeds the strict L1ss exit timing, resulting in Link
> +	 * Down (LDn). Set this flag to indicate this limitation to client
> +	 * drivers so that they will avoid relying on L1ss during system
> +	 * suspend.
> +	 */
> +	pp->bridge->broken_l1ss_resume = true;
> +
>  	if (pcie->cfg->ops->host_post_init)
>  		pcie->cfg->ops->host_post_init(pcie);
>  }
> 
> -- 
> 2.51.0
> 
> 

