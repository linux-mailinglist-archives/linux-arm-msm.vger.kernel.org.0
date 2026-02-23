Return-Path: <linux-arm-msm+bounces-93717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH6FEGBynGmcGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:29:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD2178BD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE53E301AAA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3C829B799;
	Mon, 23 Feb 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+6MAdil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67392C027C;
	Mon, 23 Feb 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771860543; cv=none; b=gni7aHpxH5fogr4QFkMwELXBd18/RLyy1b2LnnA1akbTPT9fCUDu7wO5AEdCP5R0g0Q0HBsBC4EJ489ZScdSp+YY+AKp+az0nQDAoCwguX58FUN4I6Eke/420cnZeR6xcmI3VjCRA9HvkM554O/rN9O+eesT0azPOGx5l9eAhyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771860543; c=relaxed/simple;
	bh=I3iet3x99uxDCI36yFxWvwNJLu73fsxRnYcMhsEpYJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=s82lE2HfGUc0VnYauI9dXTFzpMw6jvxqrLi1OcGPjq0Y/0WCroV1H2aajvpJp9KXP+wgw1+o0WpqG5Lu3WzGErzJqUnTkKLnGzo89icHkHiiiiwWQsj2z2URoiJDevkbBz10hvsVp6DIaymOqjskHf9X5NUrrHVZhiEzdTik8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+6MAdil; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D907C19424;
	Mon, 23 Feb 2026 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771860543;
	bh=I3iet3x99uxDCI36yFxWvwNJLu73fsxRnYcMhsEpYJM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=t+6MAdilOqzVrZjqbFVM86h+VPcrYbuB9lU3ebrEoYlYZxVwHiCkffCX6P4SMOYx1
	 DbDdiYkN2jYygHIvqg1updb9MZtG31bmJMmpv58iniLpBQx6kbC6qkQFqw6Rs3E8nO
	 vnH+BwC3SrXKdqTKGQL8JNPfFE3J5C780pbWOvwAdt44RlXl6M0c16dy9WHb6btKiy
	 M1Jfj3TaDIBYw4QnfuxRvBvY359Op7vmPH5WzuJ3Pj6F8bLeZylZRz2QI4v9HbhEAn
	 a0Sxn3ek/l6sc+WotOo8nZ007mfXVrTZT5ou7LrlVbDmsabgllfs2LJZLDuwY/ma+5
	 FPnktH01oyczQ==
Date: Mon, 23 Feb 2026 09:29:01 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v2 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
Message-ID: <20260223152901.GA3694918@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-t_power_on_fux-v2-1-20c921262709@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93717-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6CCD2178BD1
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:43:30PM +0530, Krishna Chaitanya Chundru wrote:
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
>  drivers/pci/pcie/aspm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pci.h     |  2 ++
>  2 files changed, 45 insertions(+)
> 
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
> +
> +	/*
> +	 * T_POWER_ON_Value ("value") is a 5-bit field with max
> +	 * value of 31.
> +	 */
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
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..eec16fdcb9996ab0f663f4587a2367a676a49ce6 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1911,6 +1911,7 @@ int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
>  void pcie_no_aspm(void);
>  bool pcie_aspm_support_enabled(void);
>  bool pcie_aspm_enabled(struct pci_dev *pdev);
> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);

This looks like it should go in drivers/pci/pci.h.  I don't think it's
needed outside drivers/pci/.

>  #else
>  static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
>  { return 0; }
> @@ -1923,6 +1924,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
>  static inline void pcie_no_aspm(void) { }
>  static inline bool pcie_aspm_support_enabled(void) { return false; }
>  static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
> +static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value) { }
>  #endif
>  
>  #ifdef CONFIG_HOTPLUG_PCI
> 
> -- 
> 2.34.1
> 

