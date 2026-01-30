Return-Path: <linux-arm-msm+bounces-91233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP3lHu4nfGkiKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 04:39:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9DB6E00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 04:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F6603008634
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C394366545;
	Fri, 30 Jan 2026 03:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERolQwUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6981036604A;
	Fri, 30 Jan 2026 03:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769744351; cv=none; b=XOfTyHWldffWI6p6Defl3yz2QRELMYDC17m3VQcc1x7Lsn/li2fMv726fCzpeg/ny6HZlil5+PN03zc7wcwEF6NQbcHkC5VMFdSJms/vjCjl3T6OkQkmbFUTgRZRYdKtLZcXjjsZGMpDwhwFpxm2WpEDyzubp7NmflyjDlEzZnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769744351; c=relaxed/simple;
	bh=s6FR1es3e9lJL9eOUoxUog50w9T/H83exwpcZ0L2giw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sv+pObRvlB9OmgAhrkwy389DiRTE1ARJju9BpKjY/cfk7CfWrdmTfeqpkF9J00kb/qXtxzOR7b5KlJPNQ6+KNHk7cemH8InmQOebpArbl15jhOQeEcOVyaQhIZpipC+nd6QWhNoT0tEHcbdA4IjE6t4cTdXyzz3K/7cuBxQAD0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERolQwUJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3992C116C6;
	Fri, 30 Jan 2026 03:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769744351;
	bh=s6FR1es3e9lJL9eOUoxUog50w9T/H83exwpcZ0L2giw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERolQwUJScab55KwO1PyBoZ2PFcsOyj9sM40c74uyVL8Z/uTNv8sMRe8Onh071TSj
	 weL919HETTqRfNoXzJlaeOiFf24ZVTdVwbLIhVHv/pGQFlJdz7utcBX1xLPl2YyOz9
	 4UQ+fsKQJjYsN/FLcVdDSvaRJ5LEXKpKyXtfz3VAQzyL4OOtuvdJhKqPkTOY0qu+ec
	 D+BcNZuOda8bthfvyGTM0Tv3wUo5yTeCxNZidFibC+PkwN4DPoFBahgf2xsP2NhNfk
	 TCC+ei7aa0njFv3mnNjgax7EHpFUz/K+STRDnLaW3ARD3hsahWqUDzV5fwNSGhrkq5
	 CwsDzFRzgK13A==
Date: Thu, 29 Jan 2026 21:39:07 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
Subject: Re: [PATCH 0/3] PCI: qcom: Add D3cold support
Message-ID: <yckdfmxa2a7g7bwa4dc2uarnzgfepery7dtgmrug3uo2fqwvfw@nkxq42jylzsl>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <leonjtaswjzgibn4p5rmgegtad4fhi2y47qwtagilewebm3o4y@pc6eydqfujm4>
 <1787b076-a07f-4ac2-bd50-55914c70461a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1787b076-a07f-4ac2-bd50-55914c70461a@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91233-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.infradead.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B9B9DB6E00
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 10:53:43AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 1/28/2026 8:25 PM, Bjorn Andersson wrote:
> > On Wed, Jan 28, 2026 at 05:10:40PM +0530, Krishna Chaitanya Chundru wrote:
> > > This series adds a common helper to determine when a PCIe host bridge
> > > can safely enter D3cold, converts the DesignWare host driver to use that
> > > helper, and enables D3cold support for Qualcomm PCIe controllers.
> > > 
> > You only modify qcom_pcie_deinit_2_7_0() so which targets is this
> > expected to work on and which targets have you tested it on. How can I
> > test it and what outcome should I expect?
> we modified qcom_pcie_deinit_2_7_() because we are trying to undo what we
> are doing as part of init for other platforms, in init() we are just turning
> on the resources. I tested this on lemans evk device. After this series we
> can expect PCIe link will go to D3cold(provided there is no NVMe attach),
> and cxpc can be achieved. For NVMe devices, mani is working on, in which
> requires some psci changes[1]

I have no objections to start with one platform, please consider what
will happen to others (don't break existing users) and please document
in the commit message that this only affects X, Y, Z platforms.

> > > The first patch introduces pci_host_common_can_enter_d3cold() in
> > > pci-host-common. The helper walks all devices on the bridge's bus and
> > > only allows the host bridge to enter D3cold if all PCIe endpoints are
> > > already in PCI_D3hot. For devices that may wake the system, it
> > > additionally requires that the device support PME wakeup from D3cold
> > > (via WAKE#). Devices without wakeup enabled are not restricted by this
> > > check and may be left in D3cold.
> > > 
> > > The second patch updates the DesignWare host driver to use this common
> > > helper in dw_pcie_suspend_noirq(). Previously, the driver skipped
> > > putting the link into L2 / device D3cold whenever L1 ASPM was enabled,
> > > since some devices (e.g. NVMe) expect low resume latency and may not
> > > tolerate deeper power states. However, such devices typically remain in
> > > D0 and are already covered by the helper's requirement that all
> > > endpoints be in D3hot before the host bridge may enter D3cold. Using the
> > > shared helper removes this coarse heuristic and centralizes the D3cold
> > > eligibility policy.
> > > 
> > > The third patch enables D3cold support for Qualcomm PCIe controllers. It
> > > adds pme_turn_off() support and switches to the DesignWare common
> > > suspend/resume methods for device D3cold entry and exit. If the
> > > controller is not kept in D3cold, the existing paths are used so that
> > > ICC votes, OPP votes, and other resources remain managed as before. In
> > > addition, qcom_pcie_deinit_2_7_0() is updated to explicitly disable
> > > PCIe clocks and resets in the controller, and the now-unused "suspended"
> > > flag is removed from struct qcom_pcie.
> > > 
> > This is effectively just duplicating the commit messages. Lacking from
> > both is a good explanation of the problem statement, but that might just
> > be me not getting it?
> We are adding support for D3cold for qcom controllers, this is a PCIe
> feature,
> I haven't added reference to qcom internal power state like CXPC since this
> alone
> will not achieve this. But I should have added to this as ultimate purpose
> is to
> have CXPC and main blocking is currently PCIe.

Thank you.

> > 
> > Could you please help me understand what the actual outcome of this
> > series is? I was under the impression that this work would lead us
> > towards unblocking CXPC, but the other patch you sent will prevent CXPC.
> This will keep PCIe in D3cold and achieve CXPC if there is no NVMe
> endpoints.
> 
> No other patch is not preventing CXPC, it is just trying to tell genpd
> framework that
> don't turn off GENPD, if the controller is not suspended. if we don't have
> that patch
> when device is not suspended i.e not kept in D3cold the gdsc is getting
> turned off
> and PCIe link is going down. Until PCIe state is in D3cold, gdsc should not
> be off
> even in cxpc case.
> 

Please do include such information in your cover letters or commit
messages. By not assuming that recipients can read your mind, you will
be able to get more engagement surrounding your patches - and this is a
topic that we're very much interested in.

Regards,
Bjorn

> Mani,
> To avoid the confusion, can I club this patch[2] to this series in next
> verision
> 
> [1] https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com
> [2] [PATCH] PCI: qcom: Prevent GDSC power down on suspend - Krishna
> Chaitanya Chundru <https://lore.kernel.org/all/20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com/>
> 
> - Krishna Chaitanya.
> > 
> > Regards,
> > Bjorn
> > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > > Krishna Chaitanya Chundru (3):
> > >        PCI: host-common: Add shared D3cold eligibility helper for host bridges
> > >        PCI: dwc: Use common D3cold eligibility helper in suspend path
> > >        PCI: qcom: Add D3cold support
> > > 
> > >   drivers/pci/controller/dwc/pcie-designware-host.c |   7 +-
> > >   drivers/pci/controller/dwc/pcie-designware.h      |   1 +
> > >   drivers/pci/controller/dwc/pcie-qcom.c            | 114 +++++++++++++---------
> > >   drivers/pci/controller/pci-host-common.c          |  29 ++++++
> > >   drivers/pci/controller/pci-host-common.h          |   2 +
> > >   5 files changed, 101 insertions(+), 52 deletions(-)
> > > ---
> > > base-commit: 590a64365d9bcc13ee644a3e73ffdc3df26cf23c
> > > change-id: 20251229-d3cold-bf99921960bb
> > > 
> > > Best regards,
> > > -- 
> > > Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > 
> > > 
> 

