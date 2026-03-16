Return-Path: <linux-arm-msm+bounces-97930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFqHHnTut2mfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:50:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C08298F06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 809D530263E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7136038229B;
	Mon, 16 Mar 2026 11:49:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0851355F45;
	Mon, 16 Mar 2026 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661748; cv=none; b=WSiJ5jQwC/Z0LziiZldvn9FZxqZmAYdLfaLJbgMmobKN30ij4thK+dvw+OGVCT1tBlfGpxoW3VkxoE6X4DlRI+qqx5ppryiRpR+nzMfAQUdUq/jxREeFxgn7s9sEXrPiRWxZ9jLOYJWmW2NAug8RgqNqyOjbObf/uZb8jT5jwSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661748; c=relaxed/simple;
	bh=yDwyMIe0jT0uj9BxWLio6iTlR/uGJGGXKfkNbelhLxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezcEvvJ6u79PHk93WpNdqkIRqQlCLvMSmrh5OS3LboTxd1RhS9k9QzCpanbPKPRsy053i4woSX5RAijD3OAF9PZrEbhLkDNUIWhb2dbicSz227JJ5R9+T5KUIFrg0TeoVSG82J0aMtLjOKX7p9bn+5LjbAs0VmDwz9Rjfn2X3m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA0B01477;
	Mon, 16 Mar 2026 04:48:59 -0700 (PDT)
Received: from [10.57.61.116] (unknown [10.57.61.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A63B3F778;
	Mon, 16 Mar 2026 04:49:01 -0700 (PDT)
Message-ID: <be41a533-46a8-411b-bf6c-d56b550691a7@arm.com>
Date: Mon, 16 Mar 2026 11:48:58 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of/iommu: support multiple iommu-map entries per input
 ID
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, xen-devel@lists.xenproject.org
References: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-97930-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,8bytes.org,kernel.org,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.966];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iommu_spec.np:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: E6C08298F06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-15 5:07 pm, Vijayanand Jitta wrote:
> When multiple mappings are present for an input ID, linux matches
> just the first one. There is a usecase [1] where all the mappings
> are to be maintained in parallel for an iommu-map entry of a same
> input id.
> 
> Add a next_offset iterator parameter to of_map_iommu_id() and
> refactor of_map_id() internals into a static helper to carry it.
> Update of_iommu_configure_dev_id() to loop over all matching
> entries to support this case. All other callers pass NULL and
> are unaffected.
> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

That series doesn't even reference "iommu-map" though?

Once again, NAK to this - the purpose of "iommu-map"/"msi-map" is to 
describe a translation from one hardware ID space to another, where a 
one-to-many mapping of IDs to a single target would never make sense. 
While it is in principle possible for a single device to map to multiple 
different *targets*, that is ambiguous as to what it means - is it 
giving the OS a choice to use whichever one it prefers, or implying they 
must all be configured identically at all times? - so depending on how 
you prefer to look at it, we either do not support that, or we have 
chosen the first option.

> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
> On Qualcomm kaanapali, the VPU hardware has multiple internal blocks
> that generate different stream IDs for the same input ID. The device
> tree encodes them as separate iommu-map entries sharing the same input
> ID:

And all that means is that your invented notion of "input IDs" is 
clearly wrong. Please stop this abuse of common bindings and just come 
up with a proper way to describe your hardware appropriately for what it 
actually is and does.

Thanks,
Robin.

>    iommu-map = <0x100 &apps_smmu 0x1940 0x1>,
>                <0x100 &apps_smmu 0x1a20 0x1>, ...
> 
> This requires multiple iommu-map entries per device.
> of_iommu_configure_dev_id() currently stops at the first match,
> so only one stream ID gets registered with the IOMMU.
> 
> The v1 series [1] addressed this with a callback threaded through
> of_map_id().
> 
> This patch uses a next_offset iterator on of_map_iommu_id() instead,
> keeping of_map_id() unchanged, and updates of_iommu_configure_dev_id()
> to loop over all matching entries.
> 
> This patch also depends on iommu-cells series [4].
> 
> Changes since v1:
>        - Split patches 2/7 [2] and 3/7 [3] out into this standalone series.
>        - Dropped the callback (of_map_id_cb / of_map_id_arg) entirely.
>        - Replaced with a next_offset iterator on of_map_iommu_id()
>      	only; of_map_id() public API is unchanged.
>        - of_iommu_configure_dev_id() now loops explicitly; no
>          bus-type heuristic (dev_is_platform()) needed.
> 
> [1] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com/
> [3] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com/
> [4] https://lore.kernel.org/all/ce25b963-0e8e-4411-a406-7b466eadb1f9@oss.qualcomm.com/
> 
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>   drivers/iommu/of_iommu.c              | 20 +++++++----
>   drivers/of/base.c                     | 65 ++++++++++++++++++++++++++++++-----
>   drivers/pci/controller/dwc/pci-imx6.c |  2 +-
>   drivers/pci/controller/pcie-apple.c   |  2 +-
>   drivers/xen/grant-dma-ops.c           |  2 +-
>   include/linux/of.h                    |  4 +--
>   6 files changed, 75 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index a18bb60f6f3d..947eedd9a88b 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -46,14 +46,22 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
>   				     const u32 *id)
>   {
>   	struct of_phandle_args iommu_spec = {};
> -	int err;
> +	int offset = 0, err;
> +	bool found = false;
>   
> -	err = of_map_iommu_id(master_np, *id, &iommu_spec);
> -	if (err)
> -		return err;
> +	while (!(err = of_map_iommu_id(master_np, *id, &iommu_spec, &offset))) {
> +		err = of_iommu_xlate(dev, &iommu_spec);
> +		of_node_put(iommu_spec.np);
> +		iommu_spec.np = NULL;
> +		if (err)
> +			return err;
> +		found = true;
> +	}
> +
> +	/* -ENODEV means all entries exhausted; success if at least one was processed */
> +	if (err == -ENODEV && found)
> +		return 0;
>   
> -	err = of_iommu_xlate(dev, &iommu_spec);
> -	of_node_put(iommu_spec.np);
>   	return err;
>   }
>   
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 9c44eb6d445d..71175e670757 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2146,13 +2146,13 @@ static bool of_check_bad_map(const __be32 *map, int len)
>    *
>    * Return: 0 on success or a standard error code on failure.
>    */
> -int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *cells_name,
> -	       const char *map_mask_name,
> -	       struct of_phandle_args *arg)
> +static int of_map_id_next(const struct device_node *np, u32 id,
> +			  const char *map_name, const char *cells_name,
> +			  const char *map_mask_name,
> +			  struct of_phandle_args *arg, int *next_offset)
>   {
>   	u32 map_mask, masked_id;
> -	int map_bytes, map_len, offset = 0;
> +	int map_bytes, map_len, offset = next_offset ? *next_offset : 0;
>   	bool bad_map = false;
>   	const __be32 *map = NULL;
>   
> @@ -2161,7 +2161,7 @@ int of_map_id(const struct device_node *np, u32 id,
>   
>   	map = of_get_property(np, map_name, &map_bytes);
>   	if (!map) {
> -		if (arg->np)
> +		if (arg->np || next_offset)
>   			return -ENODEV;
>   		/* Otherwise, no map implies no translation */
>   		arg->args[0] = id;
> @@ -2262,9 +2262,16 @@ int of_map_id(const struct device_node *np, u32 id,
>   		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>   			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>   			id_len, id, id_off + be32_to_cpup(out_base));
> +
> +		if (next_offset)
> +			*next_offset = offset;	/* caller resumes from here */
>   		return 0;
>   	}
>   
> +	/* no (more) matches found in the map */
> +	if (next_offset)
> +		return -ENODEV;
> +
>   	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>   		id, arg->np);
>   
> @@ -2276,6 +2283,38 @@ int of_map_id(const struct device_node *np, u32 id,
>   	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
>   	return -EINVAL;
>   }
> +
> +/**
> + * of_map_id - Translate an ID through a downstream mapping.
> + * @np: root complex device node.
> + * @id: device ID to map.
> + * @map_name: property name of the map to use.
> + * @cells_name: property name of target specifier cells.
> + * @map_mask_name: optional property name of the mask to use.
> + * @arg: pointer to a &struct of_phandle_args. On input, @arg->np may be
> + *	set to a target device node to match, or NULL to match any. On
> + *	success, @arg->np will be set to the matched target node (with a
> + *	reference held), @arg->args_count will be set to the number of
> + *	output specifier cells as defined by @cells_name in the target node,
> + *	and @arg->args[0..args_count-1] will contain the translated output
> + *	specifier values.
> + *
> + * Given a device ID, look up the appropriate implementation-defined
> + * platform ID and/or the target device which receives transactions on that
> + * ID, as per the "iommu-map" and "msi-map" bindings. If @arg->np points to
> + * a non-NULL device node, only entries targeting that node will be matched;
> + * if it is NULL, it will receive the device node of the first matching
> + * target phandle, with a reference held.
> + *
> + * Return: 0 on success or a standard error code on failure.
> + */
> +int of_map_id(const struct device_node *np, u32 id,
> +	      const char *map_name, const char *cells_name,
> +	      const char *map_mask_name,
> +	      struct of_phandle_args *arg)
> +{
> +	return of_map_id_next(np, id, map_name, cells_name, map_mask_name, arg, NULL);
> +}
>   EXPORT_SYMBOL_GPL(of_map_id);
>   
>   /**
> @@ -2285,15 +2324,23 @@ EXPORT_SYMBOL_GPL(of_map_id);
>    * @arg: pointer to a &struct of_phandle_args for the result. On success,
>    *	@arg->np holds a reference to the target node that the caller must
>    *	release with of_node_put().
> + * @next_offset: if non-NULL, on success it is set to the map offset just
> + *	past the matched entry. Pass this value back on the next call to
> + *	resume scanning from where the previous call left off, allowing all
> + *	matching entries for the same @id to be iterated. Pass NULL (or a
> + *	pointer to 0) to find only the first match.
>    *
> - * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
> + * Wrapper around the internal iommu-map scanner using "iommu-map" and
> + * "iommu-map-mask". When @next_offset is non-NULL, returns -ENODEV once
> + * all matching entries have been exhausted.
>    *
>    * Return: 0 on success or a standard error code on failure.
>    */
>   int of_map_iommu_id(const struct device_node *np, u32 id,
> -		    struct of_phandle_args *arg)
> +		    struct of_phandle_args *arg, int *next_offset)
>   {
> -	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", arg);
> +	return of_map_id_next(np, id, "iommu-map", "#iommu-cells",
> +			      "iommu-map-mask", arg, next_offset);
>   }
>   EXPORT_SYMBOL_GPL(of_map_iommu_id);
>   
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 5f8a11774eb5..0d7f5e6d037a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1146,7 +1146,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>   	u32 sid = 0;
>   
>   	target = NULL;
> -	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec, NULL);
>   	if (!err_i) {
>   		target = iommu_spec.np;
>   		sid_i = iommu_spec.args[0];
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 2e86f8fd300b..c780e3f9d14d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -765,7 +765,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>   	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>   		pci_name(pdev->bus->self), port->idx);
>   
> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec, NULL);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 36547d7cf1d6..062beb5825f5 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>   		struct pci_dev *pdev = to_pci_dev(dev);
>   		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>   
> -		if (of_map_iommu_id(np, rid, &iommu_spec)) {
> +		if (of_map_iommu_id(np, rid, &iommu_spec, NULL)) {
>   			dev_dbg(dev, "Cannot translate ID\n");
>   			return -ESRCH;
>   		}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 953f2dbe0e86..990849f00e74 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -467,7 +467,7 @@ int of_map_id(const struct device_node *np, u32 id,
>   	       struct of_phandle_args *arg);
>   
>   int of_map_iommu_id(const struct device_node *np, u32 id,
> -		    struct of_phandle_args *arg);
> +		    struct of_phandle_args *arg, int *next_offset);
>   
>   int of_map_msi_id(const struct device_node *np, u32 id,
>   		  struct of_phandle_args *arg);
> @@ -943,7 +943,7 @@ static inline int of_map_id(const struct device_node *np, u32 id,
>   }
>   
>   static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> -				  struct of_phandle_args *arg)
> +				  struct of_phandle_args *arg, int *next_offset)
>   {
>   	return -EINVAL;
>   }
> 
> ---
> base-commit: 9e94742cffb7541f55fa904a40c1ca9d836d303d
> change-id: 20260315-iommu_multi_map-8c9b78490ace
> 
> Best regards,


