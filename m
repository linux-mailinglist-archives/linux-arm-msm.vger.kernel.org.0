Return-Path: <linux-arm-msm+bounces-91048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJDxJPkkemkO3QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:02:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F8A370B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4C9830036FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059CF30AD1C;
	Wed, 28 Jan 2026 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n88qhjui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF523D291;
	Wed, 28 Jan 2026 14:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612126; cv=none; b=n5/fC8lcBF439aHcFZStH0mVQ/K+O3eHRVMGVV6UM2MaEbnAhhOLDRGlqFQTarT5z1C0X+BOjsA6PBaGnXMduLVGjPp3CJ3QBhQOFhNzgMgKTI5MVStexH31ZZKiJ+vz/nZ67PrAbYkku/81lVoFdDOuTmYsGuKmroqaFyaufKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612126; c=relaxed/simple;
	bh=UZhcBjbG4OlySfIhFDxqIUaepkapWzNZkH8yaYRq/qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poD2OaltxHYjMhjbT0baEL2LLAj7Jlhwz32+qHUzI2KMgwenq7/aRBtz1THKo9beR34spKRyhC6jRHs24vcrLRrUeCIF2M067umGZQR9mBM5ayZqS8ulYI4NqU/AUL/K/d6LM6WFoAJ9imxyP/qp/mkq6s89O4dbT8i8XoAWeeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n88qhjui; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91530C4CEF1;
	Wed, 28 Jan 2026 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769612126;
	bh=UZhcBjbG4OlySfIhFDxqIUaepkapWzNZkH8yaYRq/qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n88qhjuiNnwo2tLONNdy+YL/EBTtX1WWN5jyA0LMx2ukeoPKd8Q/LoIw9LldznPPS
	 qidWz0BRAQD3qsAtWJgYDpMF4criLJrG7Vnb0Wf5PSKEAo/wNfyuk6EYT+saa8eexA
	 5iUodmrtGO86gEbdlfHH7e4yS+TB2nkgfmJagKsIkCyvVVpiVARjlDPaXbrpac3iH1
	 Mx6SeKx85B0dnrttpKjVAyIxo5Vo2+6buV39pSM/uprz7fO7g/TUOtdPhdmhEAGaW+
	 0cT4QtJ9bkDMypi8uJwyFh6V39QLVCBOczXwz1oSIpcUr5fbaN/nzAxaPHvvCci9IS
	 K9kGY1z2Hi3oQ==
Date: Wed, 28 Jan 2026 08:55:23 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
Subject: Re: [PATCH 0/3] PCI: qcom: Add D3cold support
Message-ID: <leonjtaswjzgibn4p5rmgegtad4fhi2y47qwtagilewebm3o4y@pc6eydqfujm4>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:server fail];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91048-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[krishna.chundru.oss.qualcomm.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 595F8A370B
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:10:40PM +0530, Krishna Chaitanya Chundru wrote:
> This series adds a common helper to determine when a PCIe host bridge
> can safely enter D3cold, converts the DesignWare host driver to use that
> helper, and enables D3cold support for Qualcomm PCIe controllers.
> 

You only modify qcom_pcie_deinit_2_7_0() so which targets is this
expected to work on and which targets have you tested it on. How can I
test it and what outcome should I expect?

> The first patch introduces pci_host_common_can_enter_d3cold() in
> pci-host-common. The helper walks all devices on the bridge's bus and
> only allows the host bridge to enter D3cold if all PCIe endpoints are
> already in PCI_D3hot. For devices that may wake the system, it
> additionally requires that the device support PME wakeup from D3cold
> (via WAKE#). Devices without wakeup enabled are not restricted by this
> check and may be left in D3cold.
> 
> The second patch updates the DesignWare host driver to use this common
> helper in dw_pcie_suspend_noirq(). Previously, the driver skipped
> putting the link into L2 / device D3cold whenever L1 ASPM was enabled,
> since some devices (e.g. NVMe) expect low resume latency and may not
> tolerate deeper power states. However, such devices typically remain in
> D0 and are already covered by the helper's requirement that all
> endpoints be in D3hot before the host bridge may enter D3cold. Using the
> shared helper removes this coarse heuristic and centralizes the D3cold
> eligibility policy.
> 
> The third patch enables D3cold support for Qualcomm PCIe controllers. It
> adds pme_turn_off() support and switches to the DesignWare common
> suspend/resume methods for device D3cold entry and exit. If the
> controller is not kept in D3cold, the existing paths are used so that
> ICC votes, OPP votes, and other resources remain managed as before. In
> addition, qcom_pcie_deinit_2_7_0() is updated to explicitly disable
> PCIe clocks and resets in the controller, and the now-unused "suspended"
> flag is removed from struct qcom_pcie.
> 

This is effectively just duplicating the commit messages. Lacking from
both is a good explanation of the problem statement, but that might just
be me not getting it?

Could you please help me understand what the actual outcome of this
series is? I was under the impression that this work would lead us
towards unblocking CXPC, but the other patch you sent will prevent CXPC.

Regards,
Bjorn

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Krishna Chaitanya Chundru (3):
>       PCI: host-common: Add shared D3cold eligibility helper for host bridges
>       PCI: dwc: Use common D3cold eligibility helper in suspend path
>       PCI: qcom: Add D3cold support
> 
>  drivers/pci/controller/dwc/pcie-designware-host.c |   7 +-
>  drivers/pci/controller/dwc/pcie-designware.h      |   1 +
>  drivers/pci/controller/dwc/pcie-qcom.c            | 114 +++++++++++++---------
>  drivers/pci/controller/pci-host-common.c          |  29 ++++++
>  drivers/pci/controller/pci-host-common.h          |   2 +
>  5 files changed, 101 insertions(+), 52 deletions(-)
> ---
> base-commit: 590a64365d9bcc13ee644a3e73ffdc3df26cf23c
> change-id: 20251229-d3cold-bf99921960bb
> 
> Best regards,
> -- 
> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> 

