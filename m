Return-Path: <linux-arm-msm+bounces-93724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIF5HE51nGmyHwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:42:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC86178E8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D96D305542D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071E52ECE91;
	Mon, 23 Feb 2026 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svfrjplP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88B0285C88;
	Mon, 23 Feb 2026 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861137; cv=none; b=GirTKBuqUGtziPmDGvxclEuyLy7b9kGD95ur23KB0yLmw2Iyud4akACOjrADTDbHFLjisR6fGpik7PPNjXIqjX01lknPDqUqa8KLS2RJYUvLbMVYgwGw/AhOQivlQMqBRyn4oqtLfYUHtKofZOjsPjPH7Oqs2qXGs6kMxnsulcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861137; c=relaxed/simple;
	bh=a91x6ZjyFVgYhiuh7Il+46iAHGDPqn7LDIlyqFnTu5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BmQ7bJ/JuxMcL+OAsl0D25sV3eHHDhKe1vAgvjavYez8OEfGuwI6Rm+aJxg5p3U115lqCo6LUhkbvHsTrB7zU0JwZ/3+BHnYWWW3FDeR6hT1SMaNJwvRpcFwwkQksNuSObQbxZVgxSjpHkreMHbYFa39ZFy0+WOvqMlHUleS/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svfrjplP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5716FC116D0;
	Mon, 23 Feb 2026 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771861137;
	bh=a91x6ZjyFVgYhiuh7Il+46iAHGDPqn7LDIlyqFnTu5k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=svfrjplPzw4A3l5INpYv4WC3llJq3EA60Vw5jgFk5X3FlJ0MpNOm2yUTf1jhe3xqH
	 ZZ27tio3TdQS80zkmxsvMFTiN2UC6yawBWdYrXvfM9rHPZQV1Sqac+gwlb8fQzs3J7
	 uh/ldIyq760LZH/kC+7nv8OdaXB8MNSiC/BWObgasnDMfRwdFQ3S86MjPWRcaqgnlu
	 gQZI6JChPhhkRhkW6Y/x7DZnZGmklsIAfXfqevVrw+vd/MwuYHRjwXDauaz/MXG3h2
	 kzO0EKp57slNQlwM3qXctibSJbP8Q5JK4nphZ2dcM+NJPWd4SIiBJTFdh3Jmp+1XZ7
	 rr/RmiA7kqoYQ==
Date: Mon, 23 Feb 2026 09:38:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v2 2/3] PCI: dwc: Add helper to Program T_POWER_ON
Message-ID: <20260223153856.GA3695024@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-t_power_on_fux-v2-2-20c921262709@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93724-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CBC86178E8C
X-Rspamd-Action: no action


  PCI: dwc: Add dw_pcie_program_t_power_on() helper for L1SS T_POWER_ON

On Mon, Feb 23, 2026 at 04:43:31PM +0530, Krishna Chaitanya Chundru wrote:
> The T_POWER_ON indicates the time (in μs) that a Port requires the port
> on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
> asserted before actively driving the interface. This value is used by
> the ASPM driver to compute the LTR_L1.2_THRESHOLD.
> 
> Currently, some controllers exposes T_POWER_ON value of zero in the L1SS
> capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations,
> which  can result in improper L1.2 exit behavior and can trigger AER's.

s/some controllers exposes/some controllers expose/

> Add a helper to override T_POWER_ON value by the DWC controller drivers.

s/a helper/dw_pcie_program_t_power_on()/

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 27 +++++++++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 5741c09dde7f40487c6da6dfd66f7c8d96a74259..f56e2c07ddc57bd84882c14bebc7d4b4961f601a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -1249,6 +1249,33 @@ void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci)
>  	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
>  }
>  
> +/* TODO: Need to handle multi root ports */
> +void dw_pcie_program_t_power_on(struct dw_pcie *pci, u16 t_power_on)
> +{
> +	u8 scale, value;
> +	u16 offset;
> +	u32 val;
> +
> +	if (!t_power_on)
> +		return;
> +
> +	offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> +	if (offset) {

  if (!offset)
    return;

> +		pcie_encode_t_power_on(t_power_on, &scale, &value);
> +
> +		dw_pcie_dbi_ro_wr_en(pci);
> +
> +		val = readl(pci->dbi_base + offset + PCI_L1SS_CAP);
> +		val &= ~(PCI_L1SS_CAP_P_PWR_ON_SCALE | PCI_L1SS_CAP_P_PWR_ON_VALUE);
> +		val |= FIELD_PREP(PCI_L1SS_CAP_P_PWR_ON_SCALE, scale);
> +		val |= FIELD_PREP(PCI_L1SS_CAP_P_PWR_ON_VALUE, value);

  FIELD_MODIFY(PCI_L1SS_CAP_P_PWR_ON_SCALE, &reg, scale);
  FIELD_MODIFY(PCI_L1SS_CAP_P_PWR_ON_VALUE, &reg, value);

> +		writel(val, pci->dbi_base + offset + PCI_L1SS_CAP);
> +
> +		dw_pcie_dbi_ro_wr_dis(pci);
> +	}
> +}
> +
>  void dw_pcie_setup(struct dw_pcie *pci)
>  {
>  	u32 val;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index ae6389dd9caa5c27690f998d58729130ea863984..da67beece3f11e33d9a1937fa23d443feea3bbc7 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -602,6 +602,7 @@ int dw_pcie_prog_ep_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
>  				u8 bar, size_t size);
>  void dw_pcie_disable_atu(struct dw_pcie *pci, u32 dir, int index);
>  void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci);
> +void dw_pcie_program_t_power_on(struct dw_pcie *pci, u16 t_power_on);
>  void dw_pcie_setup(struct dw_pcie *pci);
>  void dw_pcie_iatu_detect(struct dw_pcie *pci);
>  int dw_pcie_edma_detect(struct dw_pcie *pci);
> 
> -- 
> 2.34.1
> 

