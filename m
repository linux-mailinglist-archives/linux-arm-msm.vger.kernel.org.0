Return-Path: <linux-arm-msm+bounces-95518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GADHOQ01qWlH3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:47:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA820CDE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4178D3055FBC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE5B32B981;
	Thu,  5 Mar 2026 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGPXzrEs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A54C32AAA8;
	Thu,  5 Mar 2026 07:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696816; cv=none; b=Cg1DEnoclfpy70x+tuAQ3DTq7w7K2aSH6J7UM9QdVBQz8TtbnnPKdNBHIpdVUtXEMhW12pVK+qI9LcY0HIB3Wl9RUiSqScfAExH7auV/1rwYW1uVFosE2nxEX9LEOaevs/jV1yLubiHwufLGUIJwssWKOwW8/g4XtgIyA7ugnas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696816; c=relaxed/simple;
	bh=NaRIJK+9E3Xt1qmxieZYZj0jw25dQ/vq0Tp6eNlWHz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H83ihp7ewQG3oJxnQOPFLLGKw0btYgbLTBGdML739/AvgWNuSRQSarDx99HxIcoULQMfLirUctDYszKfGIga1smpNFqKAo+G/aJzihm0oGh/D+heyBgIVpap1s8ua+60ek8cRJH83OR93dQNpr3MyP+TTw3IABpn7tEU4bUwRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGPXzrEs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777D2C116C6;
	Thu,  5 Mar 2026 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772696815;
	bh=NaRIJK+9E3Xt1qmxieZYZj0jw25dQ/vq0Tp6eNlWHz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGPXzrEsSpxrCo30Nx3IkTPqMVPG4L2EGfnCeG91xBWKkBlmEosbSNuMBKw8cXhTD
	 fLxONRS7c8tDbFsFAxJsollNcDydST836ln6TQCJ0e/OvaDQRg9ydytTP/TFAWNiPq
	 K+mE4FJoM7TVoMcVcy2u+fxmsmF1bRKvEwRgzSsQONC9Ci4qNoQQ8+ma9vRI6vv6Rx
	 lLsotgReTWa9g+2XXXaJBhe8Y6NS+vOb9XHiQ6D8Q7Fw/udP/ou3CmIOv9S341Ma+/
	 Ydaa6TxF1lm1j0PM3JD69wWwbFz4w/HfVirnmuWQFWoGps7iZL/K0aM2HPy095paos
	 1Pfbo/obSe+gA==
Date: Thu, 5 Mar 2026 13:16:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 3/5] PCI: qcom: Add .get_ltssm() helper
Message-ID: <tesrw4icg2gnlxqfgigondqet4okvm3eokuw5phl3e5ozzzwxj@ktbka4nxsluc>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-3-89b322864043@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-d3cold-v2-3-89b322864043@oss.qualcomm.com>
X-Rspamd-Queue-Id: 6ABA820CDE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95518-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 04:49:08PM +0530, Krishna Chaitanya Chundru wrote:
> For older targets like sc7280, we see reading DBI after sending PME
> turn off message is causing NOC error.
> 
> To avoid unsafe DBI accesses, introduce qcom_pcie_get_ltssm(), which
> retrieves the LTSSM state from the PARF_LTSSM register instead.
> 

You completely missed describing the helper here and where it is used.

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 67a16af69ddc75fca1b123e70715e692a91a9135..2c4dc7134e006d3530a809f1bcc1a6488d4632ad 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -131,6 +131,7 @@
>  
>  /* PARF_LTSSM register fields */
>  #define LTSSM_EN				BIT(8)
> +#define PARF_LTSSM_STATE_MASK			GENMASK(5, 0)
>  
>  /* PARF_NO_SNOOP_OVERRIDE register fields */
>  #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
> @@ -1255,6 +1256,15 @@ static bool qcom_pcie_link_up(struct dw_pcie *pci)
>  	return val & PCI_EXP_LNKSTA_DLLLA;
>  }
>  
> +static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct dw_pcie *pci)
> +{
> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +	u32 val;
> +
> +	val = readl(pcie->parf + PARF_LTSSM);

Newline

- Mani

-- 
மணிவண்ணன் சதாசிவம்

