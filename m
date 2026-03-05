Return-Path: <linux-arm-msm+bounces-95561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB03CQZQqWmd4gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:42:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F61F20EBDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 099B731746AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D731377EDE;
	Thu,  5 Mar 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZoqMdIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39506330B14;
	Thu,  5 Mar 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703263; cv=none; b=GlbRWRfRqcBD/tlVTyqt0vW310mqhwbebUcXfIuQtl4SHWJrrISldq/s7+kqxE8ycBlzcZ1VRbwmMA1w5gHAny8jDdym0qQ/5uuhD4tdGe27SP7CpbRiwEq2ctmOlS78GBc5FJU5u7ntVaEXSyroFjGB/Sm1qSAb7qJMlP8h99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703263; c=relaxed/simple;
	bh=o+Gt34zYsvVZNf9S0aEU6z0ayfCGUkefkXSathmQwOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdFv/M6oCPplfcFPTvNZcMNKeAftYyeIiLjV0rK/p8pq3CVN9CLd3VHr8NtPsCZ8qfZez9Gxdq7TiDayvRa4TnRERmW9CscJwy8nbwOtIQiLvyyF0ruycor0hqCXjE8JLngLuVilcMXb1U18UFXmVw9O88ydiAiItI4xFMSftPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZoqMdIe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD47EC19423;
	Thu,  5 Mar 2026 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772703262;
	bh=o+Gt34zYsvVZNf9S0aEU6z0ayfCGUkefkXSathmQwOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZoqMdIevoJOdKFYKmLmmvsGrlJOmvo0VKoeyPYUoepG+AmtQCtsQUtfdw5O/+lex
	 QjlohXiJRjslpf/qz+85ry7b67eXoz+KIPtStGCLhvYiK/RmWOwF33eSRLn1566JTP
	 PnzBM0Ao7LIzhHDhah6FP43KCz7mxfxSPr0e+JHrDn4Uyzw+f/spcE0Nof3gUeyteM
	 xDi1IGsiQbNpIgdeZEIc168xBUYLWVPnPly8FEJc4WVHJyM58PwQMwnIPQwCiJfcUV
	 9Bsu55isc+KqwL7GXku4cMPppOCbLZEe9ETIh/HnfSmvOt9DDCA9L3lfDyfLK46cSj
	 kBg2ueTyjKeHA==
Date: Thu, 5 Mar 2026 15:04:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 5/5] PCI: qcom: Add D3cold support
Message-ID: <5bbsp5pqj2qk5c4zaaumykks6ekvhej6zpnezud3vzf3tha3rk@fxzjbfm3jroc>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
 <om6t5hlnxadpmet5i2gochjmfjw6mdfllrdbgewiz4u6vj3zot@nse5rbl3je64>
 <c0cb73d6-262e-4529-8b07-4c545c76015b@oss.qualcomm.com>
 <miorzejq4sxcl7pucaa7fq7fplbs7bqcnflawnw4qnvntxohmf@xyttdgbfllvy>
 <9327c6a7-b2af-420d-bb1e-f2829ddaef7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9327c6a7-b2af-420d-bb1e-f2829ddaef7f@oss.qualcomm.com>
X-Rspamd-Queue-Id: 7F61F20EBDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95561-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 02:55:25PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/5/2026 2:44 PM, Manivannan Sadhasivam wrote:
> > On Thu, Mar 05, 2026 at 02:30:17PM +0530, Krishna Chaitanya Chundru wrote:
> > > 
> > > On 3/5/2026 1:28 PM, Manivannan Sadhasivam wrote:
> > > > On Tue, Feb 17, 2026 at 04:49:10PM +0530, Krishna Chaitanya Chundru wrote:
> > > > > Add support for transitioning Qcom PCIe controllers into D3cold by
> > > > You cannot transition a 'PCIe controller' to D3Cold state, but only the
> > > > endpoints and bridges.
> > > > 
> > > > > integrating with the DWC core suspend/resume helpers.
> > > > > 
> > > > > Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
> > > > > into the DWC host operations so the controller follows the standard
> > > > > PME_TurnOff-based power-down sequence before entering D3cold.
> > > > > 
> > > > > When the link is suspended into D3cold, fully tear down interconnect
> > > > You cannot suspend a link into D3Cold. Link and D-State are different.
> > > > 
> > > > > bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
> > > > > by keeping the required interconnect and OPP votes.
> > > > > 
> > > > > Drop the qcom_pcie::suspended flag and rely on the existing
> > > > > dw_pcie::suspended state, which now drives both the power-management
> > > > > flow and the interconnect/OPP handling.
> > > > > 
> > > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
> > > > >    1 file changed, 74 insertions(+), 47 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > index b02c19bbdf2ea5db252c2a0281a569bb3a0cc497..37442bbe588c36b0b0414cc4d0016da2d8424a87 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > @@ -145,6 +145,7 @@
> > > > [...]
> > > > 
> > > > > -	if (pcie->suspended) {
> > > > > -		ret = qcom_pcie_host_init(&pcie->pci->pp);
> > > > > -		if (ret)
> > > > > -			return ret;
> > > > > +		ret = icc_enable(pcie->icc_mem);
> > > > > +		if (ret) {
> > > > > +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
> > > > > +			goto disable_icc_cpu;
> > > > > +		}
> > > > > -		pcie->suspended = false;
> > > > > +		/*
> > > > > +		 * Ignore -ETIMEDOUT here since it is expected when no endpoint is
> > > > > +		 * connected to the PCIe link.
> > > > > +		 */
> > > > > +		ret = dw_pcie_resume_noirq(pcie->pci);
> > > > > +		if (ret && (ret != -ETIMEDOUT))
> > > > No, dw_pcie_resume_noirq() was reworked to return -ETIMEDOUT to indicate a hard
> > > > failure. If the device is not found, it will return -ENODEV. So you should
> > > > fail the resume if -ETIMEDOUT is returned.
> > > Ack, didn't noticed the reworked changes, I will change -ETIMEDOUT to
> > > -ENODEV.
> > > 
> > No, that's what not I meant. I meant, you should do:
> > 
> > 	if (ret == -ETIMEDOUT)
> > 		goto fail;
> there can be other failures also right, where we should fail,
> like pci->pp.ops->init(&pci->pp); can return different error other than
> -ETIMEDOUT in that case we should fail here. - Krishna Chaitanya.

Hmm, I overlooked the init() callback. In that case, you should skip both
-ENODEV and -EIO and fail resume() for other errors.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

