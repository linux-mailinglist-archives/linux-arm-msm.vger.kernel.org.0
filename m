Return-Path: <linux-arm-msm+bounces-97839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPjvNHGSt2k0TAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:17:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98393294BC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D7B5300D928
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6726C33D4F0;
	Mon, 16 Mar 2026 05:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t2KdofcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4380733A701;
	Mon, 16 Mar 2026 05:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773638253; cv=none; b=AQ2LIVH8Lsv5Q55kV9AG4eZaux0n5yZatoN7ZPYH6RGTV7V8sjCwwD1gzgXhLGECdlW8P8TLUpwLysa81krHbURiHk3ztfyfMu4gQCxAtn6AUW3mPLYmKcDkZsQeie4+OHk814jZVZQx+IF9CFWTBqCLav9XhyXtlatpRveQBvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773638253; c=relaxed/simple;
	bh=8Kq0QOVq5TW1W5RtFpnmQ8CbqgCezmXcnXqBqPSEbhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iV93heyNOgdIX66Nyf4CXXHPDKs5Q8+KsHLKi8kRioEasy2F0NB+ZEiW6Y2kegWuPLZimcqkILfXN/PDzoE2J4UNsB0y4uS7vOabeQPwMfeEKm6KvcARaqQBjdJ6PNSPhxE9l8yKc76f7jiT3A6B8iQjYLCBJw9EuDLycMVPBFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t2KdofcF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8ACC19425;
	Mon, 16 Mar 2026 05:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773638252;
	bh=8Kq0QOVq5TW1W5RtFpnmQ8CbqgCezmXcnXqBqPSEbhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2KdofcFE+0r8caqCK4Qc58hKhA89QcGGeZ7c30zCNgqXyqq8Kju6WpdCYZsrtb2Y
	 Vbvaf8wJWEGPcszKoBavx+1OQqtmGFh5ob8nHXjRAQAKw1BIJa0xfZhb1PyczKcXCg
	 VNlYsdQ+ri8GUJz2c+uUs/wgjlrMJQ+B6hLEoEaoloeLnHx/HoWqess5/GeWN3Caed
	 DLJb+6vpUKYj82uZ4N6YBOp0FADEVS4D9t25W2cJzRAB9NCym+LyDedAlY+6xOaGVt
	 CosZIbOipnqtzZsanhNqTgfZKMCvE6cryVwHAVdsbQc0b3HB9UDDLdYL4WL0y8PnKC
	 I+LBUEDzFUzaA==
Date: Mon, 16 Mar 2026 10:47:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v3 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <de4eszg7j54ijsbxaajnldm2zccxn3vcmxxty4zn5awwtq3w5h@7lisdbxc6la4>
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
 <20260311-d3cold-v3-1-4d85dc7c2695@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-d3cold-v3-1-4d85dc7c2695@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97839-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 98393294BC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:56:46PM +0530, Krishna Chaitanya Chundru wrote:
> Add a common helper, pci_host_common_d3cold_possible(), to determine
> whether a PCI host bridge can safely transition to D3cold.
> 

Host bridge cannot be transitioned to D3Cold, it can only transition the
devices to D3Cold state. You need to reword it throughout the patch.

> This helper is intended to be used by PCI host controller drivers to
> decide whether they may safely put the host bridge into D3cold based on
> the power state and wakeup capabilities of downstream endpoints.
> 
> The helper walks all devices on the bridge's primary bus

What do you mean by 'primary bus' here?  The helper is supposed to walk through
all busses starting from the Root bus, no?

> and only allows
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
>  drivers/pci/controller/pci-host-common.c | 47 ++++++++++++++++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h |  2 ++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..bff23bcdb5d032d2781d963eebe4a3fac0505517 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -106,5 +106,52 @@ void pci_host_common_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(pci_host_common_remove);
>  
> +static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
> +{
> +	bool *d3cold_possible = userdata;
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
> +
> +exit:
> +	*d3cold_possible = false;
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +/**
> + * pci_host_common_d3cold_possible - Determine whether a host bridge can enter D3cold

"Determine whether the host bridge can transition the devices into D3Cold"

- Mani

-- 
மணிவண்ணன் சதாசிவம்

