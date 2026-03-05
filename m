Return-Path: <linux-arm-msm+bounces-95517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yADuNBA0qWnM2wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:43:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996020CD16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C17CA302F734
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC2C319848;
	Thu,  5 Mar 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIzvDUAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B034A35;
	Thu,  5 Mar 2026 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696589; cv=none; b=BKmiL9Ty7XExjmGR9gzoihaR6/o4G5MdJ9GQvz9+/MclPc8LcoC9p66rwpyQfqQlwILZhGIWG69CpKw45SvLb/GV5qRJeNmHCPFD0DF8iwIjHIlQat63M0nYfDghhG9L7Lf73eKUfVhFxknI8n9JV+Ms5nvSVp8G1Fkfxx+RL2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696589; c=relaxed/simple;
	bh=Q4hR08jwk8NYDY7pDYXXyrQ+TK/dbIOE1VyLlysisSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uu38Oun7rTh7fdO903g0hJaM4w3R5dpGO+EOJdxqf5mbmLshgwnDfHn+D3JC69DyAhoe6LnUDlN0jiiMs9DjZI5s79AKLGn0QcXxpYs8LrFU04m3FQZvMWcAlgfyd/enBg/3CsxYswo4LAo/34SGgJQBhUnNP3W6rTv0s2ewVcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIzvDUAD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1253C116C6;
	Thu,  5 Mar 2026 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772696588;
	bh=Q4hR08jwk8NYDY7pDYXXyrQ+TK/dbIOE1VyLlysisSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIzvDUADoi0KCGyPVVuICFuXDFQEedvvlub8sDezUZrhBcsWFbq8vMpqckKgJvz+j
	 zaxMxIfvYbmFvhLEANJ1hqA844JfUV094ICsdl6COHyjksvnYZNCSAsk3xqodhO+FD
	 nJBN2ab+67h8qBDirUbXPIlb/fT/WJmme2S7gu2V3j0RbHQKKu+2LJT+f7wvoXmnHl
	 645NFwdMhlPACKWsy+QJPfr0PoRQELmZKd5NnwUZ7iXlSgM4eWWKsoE76fpNroMSwD
	 OhuklWjz2pLYBg7QsgFUHhsafcsfQ606ypYOG2kf2/gzkXhh/rS0kafYpYNkbqSsQS
	 u26XVC7SkvTxw==
Date: Thu, 5 Mar 2026 13:12:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <3fnnuxwpvpk6abtjtlp74synz3fk4cbobub27aqvtdytdx4wtd@gknztr4cwalg>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-1-89b322864043@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-d3cold-v2-1-89b322864043@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2996020CD16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95517-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 04:49:06PM +0530, Krishna Chaitanya Chundru wrote:
> Add a common helper, pci_host_common_can_enter_d3cold(), to determine
> whether a PCI host bridge can safely transition to D3cold.
> 
> This helper is intended to be used by PCI host controller drivers to
> decide whether they may safely put the host bridge into D3cold based on
> the power state and wakeup capabilities of downstream endpoints.
> 
> The helper walks all devices on the bridge's primary bus and only allows
> the host bridge to enter D3cold if all PCIe endpoints are already in
> PCI_D3hot. This ensures that we do not power off the host bridge while
> any active endpoint still requires the link to remain powered.
> 
> For devices that may wake the system, the helper additionally requires
> that the device supports PME wake from D3cold (via WAKE#). Devices that
> do not have wakeup enabled are not restricted by this check and do not
> block the host bridge from entering D3cold.
> 
> Devices without a bound driver and with PCI not enabled via sysfs are
> treated as inactive and therefore do not prevent the host bridge from
> entering D3cold. This allows controllers to power down more aggressively
> when there are no actively managed endpoints.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/pci-host-common.c | 45 ++++++++++++++++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h |  2 ++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..b0a4a3c995e80e0245657f0273a349334071013c 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -106,5 +106,50 @@ void pci_host_common_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(pci_host_common_remove);
>  
> +static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
> +{
> +	bool *d3cold_allow = userdata;

d3cold_possible

> +
> +	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
> +		return 0;
> +
> +	if (!pdev->dev.driver && !pci_is_enabled(pdev))
> +		return 0;
> +
> +	if (pdev->current_state != PCI_D3hot)
> +		goto exit;
> +
> +	if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
> +		goto exit;
> +
> +	return 0;

Newline

> +exit:
> +	*d3cold_allow = false;

Newline

> +	return -EBUSY;

I think -EOPNOTSUPP should be returned here.

> +}
> +
> +/**
> + * pci_host_common_can_enter_d3cold - Determine whether a host bridge may enter D3cold

Since PCI core already has pci_bridge_d3_possible() API, we should try to be in
sync by calling this API as pci_host_common_d3cold_possible().

> + * @bridge: PCI host bridge to check
> + *
> + * Walk downstream PCIe endpoint devices and determine whether the host bridge
> + * is permitted to transition to D3cold.
> + *
> + * The host bridge may enter D3cold only if all active PCIe endpoints are in

s/may/can

> + * %PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from

Remove %

> + * D3cold. Inactive endpoints are ignored.
> + *
> + * Return: %true if the host bridge may enter D3cold, otherwise %false.
> + */
> +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
> +{
> +	bool d3cold_allow = true;
> +
> +	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);

s/pci_host_common_check_d3cold/__pci_host_common_d3cold_possible

- Mani

-- 
மணிவண்ணன் சதாசிவம்

