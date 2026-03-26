Return-Path: <linux-arm-msm+bounces-100131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANW1EFZexWlM9wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:27:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0C13385C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B660A3017502
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE973C198C;
	Thu, 26 Mar 2026 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8mHPbZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF67394799;
	Thu, 26 Mar 2026 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541999; cv=none; b=Pt17Ym0TTJg0WF63ESf6hP0F6aRLugnspj4p4VT2WXGNPGmifrCozeaPpNbjzh+K5/3bAeUXjR+E4MZ8+QPM51cFx2jA0zzg7dcDM26KFXne1a/cRXzo3NGFEGh8FH9eUYvgY8emqG4TLkXGxohLFC+wZpbVhlSomfnTSIl9jEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541999; c=relaxed/simple;
	bh=HUtRwEpymq8y1tHT5IuCcbjZ8WgelRutIBJgFxgBfwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Nh3GDQ1K/Dlmns3pEiP7iu5pALHQQQhqqwlq4K48jB7ip6yfWThZYwov4EesUDfSL4MEqNqEBP5B/CYHZeoMUnTbWR//heA28XYyZndZi2OYNfN/TsVFu9kqqFYrq4AxmByJIiuSRGk+NOrdcNICw+FFIHK9xIFJuOBkVd/v0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8mHPbZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58181C116C6;
	Thu, 26 Mar 2026 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774541998;
	bh=HUtRwEpymq8y1tHT5IuCcbjZ8WgelRutIBJgFxgBfwY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=F8mHPbZMLywhR2KPKiO47GUlQve1aWTvrP9jUY2zHBn/GgXJAJ8kIosO6KRmT2xPy
	 0IOXnbxBuiHeZMvRl+TjIGCZL+xLIklcHleCk7JhPz7DuyprdCRvXeIavUjsvsJn3u
	 2Q1RhEo14xk900QBnukOrxjvVlgBCi/2LncSYTzSdhsFA5hJ9IBKJY83E/k7nfnIj+
	 5lTlIF6wm86KROEBrkkqhHauUmxF3ByqGulkPiq2SUiGMalg+b2lo7okZjYoEqA7SE
	 DQIUYImcIBQS+JZCWgUDtLEZ0SBKAUGmugBagt425A+Pxg6+wxIOHa2m/AYEY0slHj
	 ZzEGDAJHfpMMw==
Date: Thu, 26 Mar 2026 11:19:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/3] of: Factor arguments passed to of_map_id() into
 a struct
Message-ID: <20260326161957.GA1324845@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-parse_iommu_cells-v11-2-1fefa5c0e82c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100131-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,google.com,nxp.com,pengutronix.de,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iommu_spec.np:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 7F0C13385C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[cc->to: Richard, Lucas for pci-imx6.c question]

On Wed, Mar 25, 2026 at 04:38:23PM +0530, Vijayanand Jitta wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
> 
> Add an explicit filter_np parameter to of_map_id() and of_map_msi_id()
> to separate the filter input from the output. Previously, the target
> parameter served dual purpose: as an input filter (if non-NULL, only
> match entries targeting that node) and as an output (receiving the
> matched node with a reference held). Now filter_np is the explicit
> input filter and arg->np is the pure output.
> 
> Previously, of_map_id() would call of_node_put() on the matched node
> when a filter was provided, making reference ownership inconsistent.
> Remove this internal of_node_put() call so that of_map_id() now always
> transfers ownership of the matched node reference to the caller via
> arg->np. Callers are now consistently responsible for releasing this
> reference with of_node_put(arg->np) when done.
> ...

Not actually part of *this* patch, and AFAICS this patch is correct
as-is, but is it necessary to have different logic around
of_node_put() for imx_pcie_add_lut_by_rid() and
apple_pcie_enable_device()?

> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1137,6 +1137,8 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
>  
>  static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  {
> +	struct of_phandle_args iommu_spec = {};
> +	struct of_phandle_args msi_spec = {};
>  	struct device *dev = imx_pcie->pci->dev;
>  	struct device_node *target;
>  	u32 sid_i, sid_m;
> @@ -1144,7 +1146,12 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  	u32 sid = 0;
>  
>  	target = NULL;
> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
> +	if (!err_i) {
> +		target = iommu_spec.np;
> +		sid_i = iommu_spec.args[0];
> +	}
> +
>  	if (target) {
>  		of_node_put(target);

Here it's conditional on "target" even though of_node_put() checks
internally for non-NULL, so it would be safe without the conditional
here.

>  	} else {
> @@ -1156,8 +1163,11 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  		err_i = -EINVAL;
>  	}
>  
> -	target = NULL;
> -	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
> +	err_m = of_map_msi_id(dev->of_node, rid, NULL, &msi_spec);
> +	if (!err_m) {
> +		target = msi_spec.np;
> +		sid_m = msi_spec.args[0];
> +	}
>  
>  	/*
>  	 *   err_m      target

And here (outside the diff context) we also call of_node_put()
conditionally:

  ...
  else if (target)
    of_node_put(target);

> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..c2cffc0659f4 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = {};
>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);
> @@ -764,10 +765,12 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>  		pci_name(pdev->bus->self), port->idx);
>  
> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>  	if (err)
>  		return err;
>  
> +	of_node_put(iommu_spec.np);

Here we call of_node_put() unconditionally.

I think it would be much nicer if imx_pcie_add_lut_by_rid() used the
same style as apple_pcie_enable_device() and did the of_node_put()
unconditionally.  That would untangle the function a bit and make it
easier to analyze.

> +	sid = iommu_spec.args[0];
>  	mutex_lock(&port->pcie->lock);
>  
>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);

