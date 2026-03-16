Return-Path: <linux-arm-msm+bounces-97835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ1iIUqMt2niSgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:51:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D60294AB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ED32300C934
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6C41C84DE;
	Mon, 16 Mar 2026 04:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CX7KAFbb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AB2AE78;
	Mon, 16 Mar 2026 04:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773636677; cv=none; b=Ld9yOLohFBwnQ/uCvTlM8hXpBQW8t4fPerFQMZYSy/xp02+mwQrtGLwwN81XSPVYKd8gcvhp2Q5XmFQ/vurSwhNpWV2NWNr2Jtu7d/8m67rzgnr2xvbrRIQyo5R1r8NBUA9Nh2EfWreXfmNw+gcI8ZnIOo533L2h48IuNDb/MDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773636677; c=relaxed/simple;
	bh=rUy6W1gr1K6gq0BcK3bObcb2dEGog6yR+Jgr5yTG2xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uauM45P/2kFWcMKVIKcOeG4u37ThysdzfAwxb0VuhDVUQuVx96+fmpbzpPUsToc9xCJSBhaBkL3sTle708RHNofK5J2iZ1eE9pP+Q+ci++VfnlO87QJ8f93aE/OzvUZw60MPr12cXQ06JjP/9QVKhZO3CR8/Y93TJgWcGuovBo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CX7KAFbb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC33AC19425;
	Mon, 16 Mar 2026 04:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773636677;
	bh=rUy6W1gr1K6gq0BcK3bObcb2dEGog6yR+Jgr5yTG2xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CX7KAFbbeU4498EusalmTyAlvSRLtQKDAQ2u5SdvKOoyPRM5bUvBTvaJUr/zDgUYn
	 QETOVmf4G4D38bwYygPQIUCLVYlP+PVPDWIR8NoevN5dKBn5zjG4tcupdAX58YC8bK
	 c/5p+N0tSGTCLS8/bJ1n4rRH/+ZMy3P0gcg0MRFGp+/pUSC7WJe5xFUFHzlZ2dK52L
	 18TZZgtRzLCZWfyK4v6VrIbdGGTY8Zv2QVHswkD8crd59yXet36j2AQ6zfiiLKVpb3
	 kobxiUFTEqeYeWiuGSkPhHoyjH4aw/GPQO98QJYY9mKRssCXzW6G+imiwdb7iXvgW0
	 fjpi2dpC7Z8iA==
Date: Mon, 16 Mar 2026 10:21:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com, 
	quic_vbadigan@quicinc.com
Subject: Re: [PATCH v3 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
Message-ID: <fwa3hatuesbbsnk3o34nhi6ohpozkr74rmnqbqwxmesh5bws3r@abidzslkrily>
References: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
 <20260311-t_power_on_fux-v3-1-9b1f1d09c6f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-t_power_on_fux-v3-1-9b1f1d09c6f3@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-97835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E1D60294AB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 06:10:38PM +0530, Krishna Chaitanya Chundru wrote:
> Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
> parameter into the T_POWER_ON_Scale and T_POWER_ON_Value fields.
> 
> This helper can be used by the controller drivers to change the
> default/wrong value of T_POWER_ON in L1ss capability register to
> avoid incorrect calculation of LTR_L1.2_THRESHOLD value.
> 
> The helper converts a T_POWER_ON time specified in microseconds into
> the appropriate scale/value encoding defined by the PCIe spec r7.0,
> sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
> to the largest representable encoding.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pci.h       |  2 ++
>  drivers/pci/pcie/aspm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 13d998fbacce6698514d92500dfea03cc562cdc2..48964602d802e114a6a2481df3fb75d9e178a31b 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -1105,6 +1105,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
>  void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
>  void pci_configure_ltr(struct pci_dev *pdev);
>  void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
>  #else
>  static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
>  static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
> @@ -1113,6 +1114,7 @@ static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked)
>  static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
>  static inline void pci_configure_ltr(struct pci_dev *pdev) { }
>  static inline void pci_bridge_reconfigure_ltr(struct pci_dev *pdev) { }
> +static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value) { }
>  #endif
>  
>  #ifdef CONFIG_PCIE_ECRC
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 21f5d23e0b61bd7e1163cc869fe9356d1ab87b34..d7f9ae9e48c25dbc2d9b4887e2f74623688098e0 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -525,6 +525,49 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
>  	return 0;
>  }
>  
> +/**
> + * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
> + * @t_power_on_us: T_POWER_ON time in microseconds
> + * @scale: Encoded T_POWER_ON_Scale (0..2)
> + * @value: Encoded T_POWER_ON_Value

Nit:

s/T_POWER_ON_Scale/T_POWER_ON Scale
s/T_POWER_ON_Value/T_POWER_ON Value

Same everywhere.

> + *
> + * T_POWER_ON is encoded as:
> + *   T_POWER_ON(us) = scale_unit(us) * value
> + *
> + * where scale_unit is selected by @scale:
> + *   0: 2us
> + *   1: 10us
> + *   2: 100us
> + *
> + * If @t_power_on_us exceeds the maximum representable value, the result
> + * is clamped to the largest encodable T_POWER_ON.
> + *
> + * See PCIe r7.0, sec 7.8.3.2.
> + */
> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
> +{
> +	u8 maxv = FIELD_MAX(PCI_L1SS_CTL2_T_PWR_ON_VALUE);

Since this API is for changing the 'capabilities register', you should use
PCI_L1SS_CAP_P_PWR_ON_VALUE.

> +
> +	/*
> +	 * T_POWER_ON_Value ("value") is a 5-bit field with max
> +	 * value of 31.

Use max 80 columns for comments.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

