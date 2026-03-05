Return-Path: <linux-arm-msm+bounces-95529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B1XCBA4qWnN3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:00:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981B20D11C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 295DE3071430
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BEE33FE1F;
	Thu,  5 Mar 2026 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjssJ6aL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B510933F8C2;
	Thu,  5 Mar 2026 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697552; cv=none; b=FcpqxMjZXg2kJwcyZ/Nz+qGFKnBuDDKUlq4oI8dLnvpks2BJHUGJsZmz7+cdt6dW6jOMeJ+KyhN0lKCK+gRNDzgngjI3GWPX9neB/QbNoQxGjVxaSdGiu80UQ3MSjkmJSSmoFhBqgHyoWarzoxhuPm4GxqTYQjeipacIzu7Wk50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697552; c=relaxed/simple;
	bh=mM3OjQ33S9TQppKsWWyKBLl8eCLt4XCfC08emeBfuqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qabSnnLOcHRLpSZPdXcB09kpF1AV5/1OfbplphTkVmcjKuZt86Y+ORPBz5hRSStaZQ5ts07scBvJYcRgBOfTX8WEJPHOV2R0cBsdp3Sszs4UAFBizCoCTLhQT96mHlIK9yo275sBlpBX+1E8YdudtiIubrxzVUl+etipIYZxXw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjssJ6aL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6616C116C6;
	Thu,  5 Mar 2026 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772697552;
	bh=mM3OjQ33S9TQppKsWWyKBLl8eCLt4XCfC08emeBfuqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjssJ6aLg8dT7xUstr9c/ZnzaYyKi7sI/j7A0qr8qZHrKwFfrZvtf2Xfb+6UN3nhU
	 q1m+lNAt/BUmY4C+UV9GIOylGVrXbgQLWZf395SV7xk1xW8vi/Hho1sB+McNeSwAFb
	 F8OkJfROXIq/Z+liGDyZK07vsG+NQ2CWGY1w8rKnWAVUS1SrxpVKTj3XOEW7grgCyP
	 CisCZDfUEwBQuvs89Ol1dgUR3Mil53vH7zUH919FFdDVxOCWVUAE7JZqJB1InlXdol
	 jGrhlwu6VPUZkoTvspMPKLfixAX0Agkth+auQxoKcNIO0Sx/HWb74C8aQRYBC2qePe
	 81BZ0DzM8CWTA==
Date: Thu, 5 Mar 2026 13:28:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 5/5] PCI: qcom: Add D3cold support
Message-ID: <om6t5hlnxadpmet5i2gochjmfjw6mdfllrdbgewiz4u6vj3zot@nse5rbl3je64>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
X-Rspamd-Queue-Id: 7981B20D11C
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
	TAGGED_FROM(0.00)[bounces-95529-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 04:49:10PM +0530, Krishna Chaitanya Chundru wrote:
> Add support for transitioning Qcom PCIe controllers into D3cold by

You cannot transition a 'PCIe controller' to D3Cold state, but only the
endpoints and bridges.

> integrating with the DWC core suspend/resume helpers.
> 
> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
> into the DWC host operations so the controller follows the standard
> PME_TurnOff-based power-down sequence before entering D3cold.
> 
> When the link is suspended into D3cold, fully tear down interconnect

You cannot suspend a link into D3Cold. Link and D-State are different.

> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
> by keeping the required interconnect and OPP votes.
> 
> Drop the qcom_pcie::suspended flag and rely on the existing
> dw_pcie::suspended state, which now drives both the power-management
> flow and the interconnect/OPP handling.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
>  1 file changed, 74 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index b02c19bbdf2ea5db252c2a0281a569bb3a0cc497..37442bbe588c36b0b0414cc4d0016da2d8424a87 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -145,6 +145,7 @@

[...]

> -	if (pcie->suspended) {
> -		ret = qcom_pcie_host_init(&pcie->pci->pp);
> -		if (ret)
> -			return ret;
> +		ret = icc_enable(pcie->icc_mem);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
> +			goto disable_icc_cpu;
> +		}
>  
> -		pcie->suspended = false;
> +		/*
> +		 * Ignore -ETIMEDOUT here since it is expected when no endpoint is
> +		 * connected to the PCIe link.
> +		 */
> +		ret = dw_pcie_resume_noirq(pcie->pci);
> +		if (ret && (ret != -ETIMEDOUT))

No, dw_pcie_resume_noirq() was reworked to return -ETIMEDOUT to indicate a hard
failure. If the device is not found, it will return -ENODEV. So you should
fail the resume if -ETIMEDOUT is returned.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

