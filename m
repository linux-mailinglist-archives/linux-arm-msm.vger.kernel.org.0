Return-Path: <linux-arm-msm+bounces-102707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIO/IJAr2WnhmwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:55:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB53DAC63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFFBC3015C81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 16:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB9B3DA5CF;
	Fri, 10 Apr 2026 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIM479g4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF582DF142;
	Fri, 10 Apr 2026 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839608; cv=none; b=r0UzxH0EnVca9fFfxivwOaSSUe1bAfEZ/gfhM4W8wGZUFfd1grNU1JhxA/R8kwJA2fLaI8NxDO8S8RKhzJY/CvcFKQ6AueJ1BauEcRKI1BfbHCMDPXoviDBrbGlt9mCc+uoB1913v1xxz+HXeWtPNDNLKelYYZL1aRNZwuDu83I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839608; c=relaxed/simple;
	bh=vYuCGeZrvzRsD5X2mA2XHFIrMR3WeAbK7kCawFMdixk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToqkHinte4X61ruPHz893wELLJUQcWjlDa5lDS2MrMpYnpBv9KmGKfjCvgVU03iERXOHuEciHAmwJZzkTbVqCdrEr2i82y3HwC9EeLU2vXK9JN4u6O3zTkJAaUKc49N50aVAnCgme2Ab7n17LycZ6+Cx95bLAZ6ApedmPH6DWs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIM479g4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6355C19421;
	Fri, 10 Apr 2026 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775839607;
	bh=vYuCGeZrvzRsD5X2mA2XHFIrMR3WeAbK7kCawFMdixk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIM479g42BcjWK4UJS0jW2EroTuLo/3cQVOEXd2SExU0yAA1zGukTYbhgMIiAUDa1
	 fDWr+lnRj3CUg2CPbe7VRhruUxc01iNDRaayTJPZeK2sSOIBmCQyDpSJfwFEzHcfPv
	 dfzrFeS9H3NSyffZNzNeMx4oMQpyzEPhOy3239bDqkR+BXLAp/vPEbpjsWr4jeTxf6
	 uJ1K+HLXmAhizDk3RvEFLZ00C9q1iooEjgQ3I/WfV8T/zLjf4qLxdjLQRVz9ko3rz2
	 ryWv3llT/Rin4K22FvmmsZ95Mk5NwGKeFiYDKhPwoMwx2xhhnk99pXvbfT0cX33Xzu
	 tgV1Nn9iV7KcA==
Date: Fri, 10 Apr 2026 22:16:40 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com, 
	quic_vbadigan@quicinc.com, Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v4 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
Message-ID: <kd4r5bcaqmjjy4nkqeflbpwgua45umbd3oz4vzkrw26emab5yt@cdvh2rhosdgj>
References: <20260404-t_power_on_fux-v4-0-2891391177f4@oss.qualcomm.com>
 <20260404-t_power_on_fux-v4-1-2891391177f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260404-t_power_on_fux-v4-1-2891391177f4@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-102707-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com,rock-chips.com];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rock-chips.com:email]
X-Rspamd-Queue-Id: DCEB53DAC63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 01:47:18PM +0530, Krishna Chaitanya Chundru wrote:
> Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
> parameter into the T_POWER_ON Scale and T_POWER_ON Value fields.
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
> Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pci.h       |  2 ++
>  drivers/pci/pcie/aspm.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
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

As Sashiko pointed out, you need to assign 0 value to these pointers to save the
callers from writing random junk to L1 PM Substates register if CONFIG_PCIEASPM
is disabled.

- Mani

>  #endif
>  
>  #ifdef CONFIG_PCIE_ECRC
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 21f5d23e0b61bd7e1163cc869fe9356d1ab87b34..879d7ecddf8d6430c49f31c88a75d5c6e74015d6 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -525,6 +525,46 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
>  	return 0;
>  }
>  
> +/**
> + * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
> + * @t_power_on_us: T_POWER_ON time in microseconds
> + * @scale: Encoded T_POWER_ON Scale (0..2)
> + * @value: Encoded T_POWER_ON Value
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
> +	u8 maxv = FIELD_MAX(PCI_L1SS_CAP_P_PWR_ON_VALUE);
> +
> +	/* T_POWER_ON_Value ("value") is a 5-bit field with max value of 31. */
> +	if (t_power_on_us <= 2 * maxv) {
> +		*scale = 0; /* Value times 2us */
> +		*value = DIV_ROUND_UP(t_power_on_us, 2);
> +	} else if (t_power_on_us <= 10 * maxv) {
> +		*scale = 1; /* Value times 10us */
> +		*value = DIV_ROUND_UP(t_power_on_us, 10);
> +	} else if (t_power_on_us <= 100 * maxv) {
> +		*scale = 2; /* value times 100us */
> +		*value = DIV_ROUND_UP(t_power_on_us, 100);
> +	} else {
> +		*scale = 2;
> +		*value = maxv;
> +	}
> +}
> +EXPORT_SYMBOL(pcie_encode_t_power_on);
> +
>  /*
>   * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
>   * register.  Ports enter L1.2 when the most recent LTR value is greater
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

