Return-Path: <linux-arm-msm+bounces-91046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAA1Ff4iemmv2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:53:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4358A3481
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CCAE30C0E2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119A8298CC0;
	Wed, 28 Jan 2026 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vN3n21+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E267F284671;
	Wed, 28 Jan 2026 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611648; cv=none; b=IYMBF8+Mw/QnqtLJLYOKX6f3SI7nUpWGFHRxVOwkHKX5QttQabweO2W+KME5swaEMi4RMbil2/qVEUEsIR/gP88WkH/y/RCXJjqNnDaErxIkTPqEB175feTHVrsty4J09oTRchErYbbrCPuy9oiWT1aozv0nhAQn705aSflZ1ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611648; c=relaxed/simple;
	bh=poIiBnPQsoRCMsAh2wEVBSolxetqZX8EqXjaVucmFcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlJ3fYlbb2DB58WXoOXXJJUK0H8MJvqJZa2zzop1/VkQLU45eEF1bAARVCMpJH741Bt6QQGFBpIr/oOSiXf3UbhxMBUYWDMWtR4m9mAD2TKRivrhRIP4IaknvADSuPqhcxFFN9Pcasjd3vGwXuXdMhJBf9OuX7OQNm9xvhu0CTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vN3n21+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29CDC4CEF1;
	Wed, 28 Jan 2026 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769611647;
	bh=poIiBnPQsoRCMsAh2wEVBSolxetqZX8EqXjaVucmFcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vN3n21+QoojivHeZ/EmZbanlbJy14SRyElmm6rdhBef5w4QUV065wzTrTnDE7sKzH
	 Lb78OKbw8Pj/ai4uWxYha5z5oBRhqhD9QVXlhtr80EZV4fPHI4jKKFVN3A2u8EWpEN
	 43BeuFIO8SIxUEeL2/QRI4uGvwIdINqIZG10+ma1ZaTzL3/y9ueGNpnEDy7kCbSYRT
	 x5PPFf7OemVW7EgD2Bvi0Qsnei4HaiTR+A+1Wb4u4EmhFrk1iMlZCqIqpBImoLFlby
	 mp9B3Q073W8+PdyzCf2YEqEU/0SD/+YOZgPrbBVG9msd+pmonngT6V01YrPIWiBa/+
	 vNTHD9QPhn2bQ==
Date: Wed, 28 Jan 2026 08:47:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
Subject: Re: [PATCH 3/3] PCI: qcom: Add D3cold support
Message-ID: <qg7hyicnyqcoi7jktalyfecfgxnv4elilmmmfkzvb2jbzrhisd@bq3pngh5n2a7>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-91046-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E4358A3481
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:10:43PM +0530, Krishna Chaitanya Chundru wrote:
> Add pme_turn_off() support and use DWC common suspend resume methods
> for device D3cold entry & exit. If the device is not kept in D3cold
> use existing methods like keeping icc votes, opp votes etc.. intact.
> 
> In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
> in the controller.
> 
> Remove suspended flag from qcom_pcie structure as it is no longer needed.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 114 ++++++++++++++++++++-------------
>  1 file changed, 68 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
[..]
> @@ -2016,53 +2030,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
>  	if (!pcie)
>  		return 0;
>  
> -	/*
> -	 * Set minimum bandwidth required to keep data path functional during
> -	 * suspend.
> -	 */
> -	if (pcie->icc_mem) {
> -		ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
> -		if (ret) {
> -			dev_err(dev,
> -				"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
> -				ret);
> -			return ret;
> -		}
> -	}
> +	ret = dw_pcie_suspend_noirq(pcie->pci);
> +	if (ret)
> +		return ret;
>  
> -	/*
> -	 * Turn OFF the resources only for controllers without active PCIe
> -	 * devices. For controllers with active devices, the resources are kept
> -	 * ON and the link is expected to be in L0/L1 (sub)states.
> -	 *
> -	 * Turning OFF the resources for controllers with active PCIe devices
> -	 * will trigger access violation during the end of the suspend cycle,
> -	 * as kernel tries to access the PCIe devices config space for masking
> -	 * MSIs.
> -	 *
> -	 * Also, it is not desirable to put the link into L2/L3 state as that
> -	 * implies VDD supply will be removed and the devices may go into
> -	 * powerdown state. This will affect the lifetime of the storage devices
> -	 * like NVMe.
> -	 */
> -	if (!dw_pcie_link_up(pcie->pci)) {
> -		qcom_pcie_host_deinit(&pcie->pci->pp);
> -		pcie->suspended = true;
> -	}
> +	if (pcie->pci->suspended) {

I think this is okay for now, but I'd prefer changing the return value
of dw_pcie_suspend_noirq() to indicate if it did stop the link or not
(two different success values) - rather than deriving that information
by peeking into the dw_pcie struct and conclude that
dw_pcie_suspend_noirq() did reach the end.

> +		ret = icc_disable(pcie->icc_mem);
> +		if (ret)
> +			dev_err(dev, "Failed to disable PCIe-MEM interconnect path: %d\n", ret);
>  
> -	/*
> -	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
> -	 * Because on some platforms, DBI access can happen very late during the
> -	 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
> -	 * error.
> -	 */
> -	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
>  		ret = icc_disable(pcie->icc_cpu);
>  		if (ret)
>  			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>  
>  		if (pcie->use_pm_opp)
>  			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
> +	} else {
> +		/*
> +		 * Set minimum bandwidth required to keep data path functional during
> +		 * suspend.
> +		 */
> +		if (pcie->icc_mem) {
> +			ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
> +			if (ret) {
> +				dev_err(dev,
> +					"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
> +					ret);
> +				return ret;
> +			}
> +		}
> +
> +		/*
> +		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
> +		 * Because on some platforms, DBI access can happen very late during the
> +		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
> +		 * error.
> +		 */
> +		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> +			ret = icc_disable(pcie->icc_cpu);
> +			if (ret)
> +				dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n",
> +					ret);
> +
> +			if (pcie->use_pm_opp)
> +				dev_pm_opp_set_opp(pcie->pci->dev, NULL);
> +		}
>  	}
>  	return ret;
>  }
> @@ -2076,20 +2088,30 @@ static int qcom_pcie_resume_noirq(struct device *dev)
>  	if (!pcie)
>  		return 0;
>  
> -	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> +	if (pcie->pci->suspended) {
>  		ret = icc_enable(pcie->icc_cpu);
>  		if (ret) {
>  			dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n", ret);
>  			return ret;
>  		}
> -	}
>  
> -	if (pcie->suspended) {
> -		ret = qcom_pcie_host_init(&pcie->pci->pp);
> +		ret = icc_enable(pcie->icc_mem);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);

I think you should revert icc_enable(pcie->icc_cpu) here, to avoid
leaving the bus voted for with the PCIe controller resume aborted.

> +			return ret;
> +		}
> +		ret = dw_pcie_resume_noirq(pcie->pci);
>  		if (ret)

And Both icc_cpu and icc_mem here.

Regards,
Bjorn

>  			return ret;
> -
> -		pcie->suspended = false;
> +	} else {
> +		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> +			ret = icc_enable(pcie->icc_cpu);
> +			if (ret) {
> +				dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n",
> +					ret);
> +				return ret;
> +			}
> +		}
>  	}
>  
>  	qcom_pcie_icc_opp_update(pcie);
> 
> -- 
> 2.34.1
> 
> 

