Return-Path: <linux-arm-msm+bounces-94711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IL5M9QOpGlbWAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:03:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5A31CF043
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6440A3015895
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 10:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FD1335562;
	Sun,  1 Mar 2026 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiiSrQMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7376275AF0;
	Sun,  1 Mar 2026 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772359373; cv=none; b=PvypQ8fTXsnqLATdy/JPtRnYdiye8jmiDP4ZoofAPfDTPof0rvoMaxP/3/kGWmoRi/yup/lqmb+q3OObIEoiyWg3lfxMzwyOKuKVXY70k17UJuCMHZahaNTXyKstIuPMv11QlbWy5Wx0nf8vosVuJWFamdc4+KuFxy1BFW82tT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772359373; c=relaxed/simple;
	bh=vtpZN1m1i7JB60bMgpFDRckohYAe2rTfHOUBY7CPkt8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XBSsgrUseoVhx7Ovkj4ku8l4m3TOjfH8IbVF8W0Wg/JDrHHKU4NyduVJwvWcb2BhGUdrUmPZUb8OkliOp/BwIl4i9g0pyqwKdrg+vouVZ7dlGazY1rUJDSQd4KC1+r2o1OB4N0LPaQwjjhEfneRpmZ7B6iw424DV7DaZ4kC4hoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiiSrQMx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B71C116C6;
	Sun,  1 Mar 2026 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772359373;
	bh=vtpZN1m1i7JB60bMgpFDRckohYAe2rTfHOUBY7CPkt8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IiiSrQMxEXvnAmwK9OX3matQowi1OfBQGfa4wsnqZv0VCq9h4hi+Zz6eWNcJvyp/v
	 NKNEiJfQkOpipGT7qicIxsVx6iBqj9gkjCFVtdAyeuy4KsPdv7YgEPy/0IUfd+Ky6T
	 FCIvl841AaG7hzOLpmL6YDHKu58OOkeozdhjL/90dmjbHUQMOOhRvblZPdRLY9Ht+m
	 0UTfWVjWsewWXaC4++PUlDwCrawhx8s8fCQGvLTqMuOFiahVk0+ZI2X+c5Au/hCvwb
	 EQlrFqjagExB54Zt8V/LeB5iU4ngXho+Wv2XfBowHcX8X6MjHXzRljnh73mzuLFo8+
	 j55rBYk5pnByQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vwddS-0000000Ev2N-1H9X;
	Sun, 01 Mar 2026 10:02:50 +0000
Date: Sun, 01 Mar 2026 10:02:49 +0000
Message-ID: <861pi3amuu.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,	Nikhil Agarwal
 <nikhil.agarwal@amd.com>,	Joerg Roedel <joro@8bytes.org>,	Will Deacon
 <will@kernel.org>,	Robin Murphy <robin.murphy@arm.com>,	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,	Thomas Gleixner <tglx@kernel.org>,	Rob Herring
 <robh@kernel.org>,	Saravana Kannan <saravanak@kernel.org>,	Richard Zhu
 <hongxing.zhu@nxp.com>,	Lucas Stach <l.stach@pengutronix.de>,	Krzysztof
 =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,	Manivannan
 Sadhasivam <mani@kernel.org>,	Bjorn Helgaas <bhelgaas@google.com>,	Frank Li
 <Frank.Li@nxp.com>,	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix
 Kernel Team <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,
	Juergen Gross <jgross@suse.com>,	Stefano Stabellini
 <sstabellini@kernel.org>,	Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,	Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,	Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,	Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>,	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Prakash Gupta
 <prakash.gupta@oss.qualcomm.com>,	Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>,	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,	linux-pci@vger.kernel.org,	imx@lists.linux.dev,
	xen-devel@lists.xenproject.org,	linux-arm-msm@vger.kernel.org,	Charan Teja
 Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a struct
In-Reply-To: <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
	<20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: vijayanand.jitta@oss.qualcomm.com, nipun.gupta@amd.com, nikhil.agarwal@amd.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, lpieralisi@kernel.org, tglx@kernel.org, robh@kernel.org, saravanak@kernel.org, hongxing.zhu@nxp.com, l.stach@pengutronix.de, kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org, krzk+dt@kernel.org, prakash.gupta@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org, charan.kalla@oss.qualcomm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94711-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 8B5A31CF043
X-Rspamd-Action: no action

On Sun, 01 Mar 2026 08:34:20 +0000,
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> 
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
> 
> Subsequent patch will make use of the args_count field in
> struct of_phandle_args.
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c              |  2 +-
>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>  drivers/xen/grant-dma-ops.c           |  2 +-
>  include/linux/of.h                    | 21 +++++++++++++-------
>  6 files changed, 44 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index a511ecf21fcd..d255d0f58e8c 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -48,7 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	int err;
>  
> -	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> +	err = of_map_iommu_id(master_np, *id, &iommu_spec);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 57420806c1a2..6c3628255908 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2102,8 +2102,11 @@ int of_find_last_cache_level(unsigned int cpu)
>   * @id: device ID to map.
>   * @map_name: property name of the map to use.
>   * @map_mask_name: optional property name of the mask to use.
> - * @target: optional pointer to a target device node.
> - * @id_out: optional pointer to receive the translated ID.
> + * @arg: of_phandle_args structure,
> + *	which includes:
> + *	np: pointer to the target device node
> + *	args_count: number of arguments

Number of arguments *to what*? Isn't that the size of args[] instead?

> + *	args[]: array to receive the translated ID(s).
>   *
>   * Given a device ID, look up the appropriate implementation-defined
>   * platform ID and/or the target device which receives transactions on that
> @@ -2117,21 +2120,21 @@ int of_find_last_cache_level(unsigned int cpu)
>   */
>  int of_map_id(const struct device_node *np, u32 id,
>  	       const char *map_name, const char *map_mask_name,
> -	       struct device_node **target, u32 *id_out)
> +	       struct of_phandle_args *arg)
>  {
>  	u32 map_mask, masked_id;
>  	int map_len;
>  	const __be32 *map = NULL;
>  
> -	if (!np || !map_name || (!target && !id_out))
> +	if (!np || !map_name || !arg)
>  		return -EINVAL;
>  
>  	map = of_get_property(np, map_name, &map_len);
>  	if (!map) {
> -		if (target)
> +		if (arg->np)
>  			return -ENODEV;
>  		/* Otherwise, no map implies no translation */
> -		*id_out = id;
> +		arg->args[0] = id;

What if args_count is 0? Given that you place no restriction on the
way this can be called, that'd be entirely legitimate, and you'd
corrupt something you're not supposed to touch.

>  		return 0;
>  	}
>  
> @@ -2173,18 +2176,15 @@ int of_map_id(const struct device_node *np, u32 id,
>  		if (!phandle_node)
>  			return -ENODEV;
>  
> -		if (target) {
> -			if (*target)
> -				of_node_put(phandle_node);
> -			else
> -				*target = phandle_node;
> +		if (arg->np)
> +			of_node_put(phandle_node);
> +		else
> +			arg->np = phandle_node;
>  
> -			if (*target != phandle_node)
> -				continue;
> -		}
> +		if (arg->np != phandle_node)
> +			continue;
>  
> -		if (id_out)
> -			*id_out = masked_id - id_base + out_base;
> +		arg->args[0] = masked_id - id_base + out_base;
>  
>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>  			np, map_name, map_mask, id_base, out_base,
> @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
>  	}
>  
>  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
> -		id, target && *target ? *target : NULL);
> +		id, arg->np ? arg->np : NULL);
>  
>  	/* Bypasses translation */
> -	if (id_out)
> -		*id_out = id;
> +	arg->args[0] = id;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bff8289f804a..74fc603b3f84 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  {
>  	struct device *dev = imx_pcie->pci->dev;
>  	struct device_node *target;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	u32 sid_i, sid_m;
>  	int err_i, err_m;
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
>  	} else {
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..e1d4b37d200d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);
> @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>  		pci_name(pdev->bus->self), port->idx);
>  
> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>  	if (err)
>  		return err;
>  
> +	sid = iommu_spec.args[0];

I find this stuff absolutely unreadable. You're fishing the SID in a
random position of a random structure, without any documentation of
how this is supposed to work. This really needs a wrapper that hides
this implementation detail.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

