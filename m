Return-Path: <linux-arm-msm+bounces-95557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENjvMY1KqWn+3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:19:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4320E331
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F8F130217E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A928377EB2;
	Thu,  5 Mar 2026 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzVSDyz2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D964331D72E;
	Thu,  5 Mar 2026 09:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702346; cv=none; b=ZfiC5Kch7ULe5CTGOyqy6wuQpleWmknx4SfEZUGYp5UMg0sSPV89pO/oPCTuDGJRcxcRCpni5Li76kWHSH8OeCwNUinjwTwLXYCuf1u+Fcwwy0n+tBkucLlQDzhCe+s5xzAGyHiFpVZGxGP7LcwivDpxrBAhY/Kijcm8t+uKm1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702346; c=relaxed/simple;
	bh=yFqoDY8r1mMFw5CegzFxkYWhTSU9YZHU7zw6uf1pu2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eb15sj5Adqf0s0soUXmxmxBf7VAfsjO35rkVo/awd4yiEyxkrm/gG/sATDNpnT2sXcGHGKoSzvJtUfHlDA6flQy4lvUt3r/NHtJU+vQHWygKn6kO7TsB1J4+ZCU4xylBp0/RMOsZPhBt9XfETDEvoGPhWv4mCn1xEX5WxCuEMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzVSDyz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C25FC116C6;
	Thu,  5 Mar 2026 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772702346;
	bh=yFqoDY8r1mMFw5CegzFxkYWhTSU9YZHU7zw6uf1pu2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzVSDyz2eEfb1mMd/F58+/CcYUrpocNp97bNRIu6cjAbgp3+LWho6IdLNsmaEahF0
	 Gq+6q99ALhV0dAAKXIGTkGNLA1pd7drOXmGo8JwYE2MPn1AQhWvPvMaoFetyXhozyN
	 2z6ETneo6qAsPMbYwDWNcyu661n5E1jNV928LbG9/IH4Pa1Y07COPbXiZbzpcW9Rti
	 wCSGFSeg+98vGJ/ry43M920aCeezEGjlUPLUh7ZcIrF7wnyEkMlit1xgZyVqvIUIgX
	 Use99e7fxa4NSuNfX0KYOLPyM3PmYEB/i6fqMf4Zue+q/iB8aPsVA7hZNfeu0reVix
	 lZSMEqN1xoerg==
Date: Thu, 5 Mar 2026 14:48:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL
 before disabling rails/clocks
Message-ID: <ksd4ogzz2o5uuwnkvq6yzcwm3zsxiaeuotdj6aiqrew7jqrwl4@g3wcnqhviqwq>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
 <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
 <313d2262-56e4-49b0-8455-2b46d0966976@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <313d2262-56e4-49b0-8455-2b46d0966976@oss.qualcomm.com>
X-Rspamd-Queue-Id: 6EC4320E331
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95557-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 02:26:22PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/5/2026 1:19 PM, Manivannan Sadhasivam wrote:
> > On Tue, Feb 17, 2026 at 04:49:09PM +0530, Krishna Chaitanya Chundru wrote:
> > > Some Qcom PCIe controller variants bring the PHY out of test power-down
> > > (PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
> > > towards D3cold and the driver disables PCIe clocks and/or regulators
> > > without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
> > > partially powered, leading to avoidable power leakage.
> > > 
> > > Update the init-path comments to reflect that PARF_PHY_CTRL is used to
> > > power the PHY on. Also, for controller revisions that enable PHY power
> > > in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
> > > via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.
> > > 
> > > This ensures the PHY is put into a defined low-power state prior to
> > > removing its supplies, preventing leakage when entering D3cold.
> > > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
> > >   1 file changed, 27 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
> > >   	u32 val;
> > >   	int ret;
> > > -	/* enable PCIe clocks and resets */
> > > +	/* PHY power ON */
> > This comment is confusing since we already have phy_power_on() API. What does
> > really happen in the 'test power down' case?
> QCOM PCIe controller wrapper has way to force the entire PHY into lowest
> power
> state by turning everything off, without this bit being cleared the phy will
> not be
> powered on even after phy_power_on(), we can think this as a kind of switch
> from the controller side to power on phy.
> 

We never cared to set/clear this bit so far. So I'm assuming that if we simply
set it during init, it will not do any harm and allow the PHY to fully power
down itself when phy_power_off() is called?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

