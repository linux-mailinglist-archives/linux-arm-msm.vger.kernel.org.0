Return-Path: <linux-arm-msm+bounces-107955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EmPEFJdB2rF0QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:52:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CBE555A2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FBD33352929
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3218A4C0430;
	Fri, 15 May 2026 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPUQrMVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E97731B837;
	Fri, 15 May 2026 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863988; cv=none; b=mya9WWtkuN4jYNnankiCR36EdfONrgBC0/XDt2+3YyDySaN61zs6YDztM/bw8N2rlfEbqIL9CK25m++rYmlxRSkd1ZPvXG1v0Enh4kTg3QW7NtCLXGJjcwy7bIc8IoNOt/4vwIVZX6HNURFR7OtYPAEHkEActnWfNe6aLnqVXpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863988; c=relaxed/simple;
	bh=oIKMi1ehDEkXp9aU3XHl0B8XP9I6pC3plKI0OXPu3Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWTdIMAtPgbGkKPbxguG47SQgjNWOpIKjQXlFtx3vxTUcEDRoezOrprsoIaFqNYJPqqWnnrGdwL/xC+SjVLTWXv3IROIe9vZx8cAZ09YyeK5/iHhqbWbf2cSXs+59CtBmMAss8dbsePZ80cOaos8IH44A4DJsbOaikShOOneUQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPUQrMVs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A883C2BCB0;
	Fri, 15 May 2026 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863987;
	bh=oIKMi1ehDEkXp9aU3XHl0B8XP9I6pC3plKI0OXPu3Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPUQrMVsbkR32YUzlnlBWYPTULeYRuazE/NbEklBRl23pISSofjjEAIGG1+1RWoWs
	 PHAs9vDjzv/C2WgJ/yMVme1te3aqrTvuDy0VTt6+O70/l+jo0ekcWLqmFcl+Dm1NmV
	 FPfYKcMm/vJlv15jgA5aBGA3ohLa0RMPuhfnTopX9lXGTr3GiiUoK23Ttz9bzUtCh9
	 eoSNswcI496u1uo176zYhzwKoZNV2PkePNV5kwSjHj3Tx4sfX5y5MO0JFnImqtsig/
	 JrQuNcqjYOEiL36cPOHzLZbTHt9TpE8Wzze8aAgox8dRfHezuGWxJm+7xw4JFJqQk4
	 Zw5dQT/KOZ8TA==
Date: Fri, 15 May 2026 22:22:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v5 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
Message-ID: <hyju3hv5ibr4jf466qmsxjlkusvbglk4gjsejqrclfhcp2jt6t@vaa7g7ifjmnk>
References: <20260428-t_power_on_fux-v5-1-f1ef926a91ff@oss.qualcomm.com>
 <20260514161725.GA408115@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514161725.GA408115@bhelgaas>
X-Rspamd-Queue-Id: B3CBE555A2D
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
	TAGGED_FROM(0.00)[bounces-107955-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,google.com,gmail.com,vger.kernel.org,quicinc.com,rock-chips.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 11:17:25AM -0500, Bjorn Helgaas wrote:
> On Tue, Apr 28, 2026 at 02:07:15PM +0530, Krishna Chaitanya Chundru wrote:
> > Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
> > parameter into the T_POWER_ON Scale and T_POWER_ON Value fields.
> > 
> > This helper can be used by the controller drivers to change the
> > default/wrong value of T_POWER_ON in L1ss capability register to
> > avoid incorrect calculation of LTR_L1.2_THRESHOLD value.
> > 
> > The helper converts a T_POWER_ON time specified in microseconds into
> > the appropriate scale/value encoding defined by the PCIe spec r7.0,
> > sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
> > to the largest representable encoding.
> > 
> > Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> I do agree with Ilpo's suggestion of using u32 for t_power_on_us to
> avoid some implicit conversions.  The DT binding restriction is good,
> but it's far removed from the code and doesn't necessarily cover all
> callers.
> 
> I think it's also helpful to include the actual function name in the
> subject instead of just "helper" because it can help identify
> dependencies when backporting patches that use it.
> 
> s/L1ss/L1SS/ for consistency.
> 

Incorporated both comments while applying.

- Mani

> > ---
> >  drivers/pci/pci.h       |  6 ++++++
> >  drivers/pci/pcie/aspm.c | 40 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 46 insertions(+)
> > 
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 4a14f88e543a..c379befe1ebe 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -1110,6 +1110,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
> >  void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
> >  void pci_configure_ltr(struct pci_dev *pdev);
> >  void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
> > +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
> >  #else
> >  static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
> >  static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
> > @@ -1118,6 +1119,11 @@ static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked)
> >  static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
> >  static inline void pci_configure_ltr(struct pci_dev *pdev) { }
> >  static inline void pci_bridge_reconfigure_ltr(struct pci_dev *pdev) { }
> > +static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
> > +{
> > +	*scale = 0;
> > +	*value = 0;
> > +}
> >  #endif
> >  
> >  #ifdef CONFIG_PCIE_ECRC
> > diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> > index 925373b98dff..457d469b8d49 100644
> > --- a/drivers/pci/pcie/aspm.c
> > +++ b/drivers/pci/pcie/aspm.c
> > @@ -525,6 +525,46 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
> > + * @t_power_on_us: T_POWER_ON time in microseconds
> > + * @scale: Encoded T_POWER_ON Scale (0..2)
> > + * @value: Encoded T_POWER_ON Value
> > + *
> > + * T_POWER_ON is encoded as:
> > + *   T_POWER_ON(us) = scale_unit(us) * value
> > + *
> > + * where scale_unit is selected by @scale:
> > + *   0: 2us
> > + *   1: 10us
> > + *   2: 100us
> > + *
> > + * If @t_power_on_us exceeds the maximum representable value, the result
> > + * is clamped to the largest encodable T_POWER_ON.
> > + *
> > + * See PCIe r7.0, sec 7.8.3.2.
> > + */
> > +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
> > +{
> > +	u8 maxv = FIELD_MAX(PCI_L1SS_CAP_P_PWR_ON_VALUE);
> > +
> > +	/* T_POWER_ON_Value ("value") is a 5-bit field with max value of 31. */
> > +	if (t_power_on_us <= 2 * maxv) {
> > +		*scale = 0; /* Value times 2us */
> > +		*value = DIV_ROUND_UP(t_power_on_us, 2);
> > +	} else if (t_power_on_us <= 10 * maxv) {
> > +		*scale = 1; /* Value times 10us */
> > +		*value = DIV_ROUND_UP(t_power_on_us, 10);
> > +	} else if (t_power_on_us <= 100 * maxv) {
> > +		*scale = 2; /* value times 100us */
> > +		*value = DIV_ROUND_UP(t_power_on_us, 100);
> > +	} else {
> > +		*scale = 2;
> > +		*value = maxv;
> > +	}
> > +}
> > +EXPORT_SYMBOL(pcie_encode_t_power_on);
> > +
> >  /*
> >   * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
> >   * register.  Ports enter L1.2 when the most recent LTR value is greater
> > 
> > -- 
> > 2.34.1
> > 

-- 
மணிவண்ணன் சதாசிவம்

