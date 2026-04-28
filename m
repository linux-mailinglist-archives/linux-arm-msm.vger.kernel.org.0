Return-Path: <linux-arm-msm+bounces-104938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNgtJ3WG8GnuUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:05:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9A48231B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36EF8306ED71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5766138F929;
	Tue, 28 Apr 2026 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dH+hDT/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF2438947C;
	Tue, 28 Apr 2026 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368480; cv=none; b=coWnZZR+G3nOTz4Y9vBtUBS3wl3kSBNMGncYHMt9cfilzV+777rJ+KFKEC4sEVdct01x3Zsddc/rW6mjpjJkhU7mfhbFTO6VfN5ctdX6yeTruUfMTqXNY0m+uLgpfrQNlSLs/PP5Nw/DF2OKhfAfV9gjUxJIro/rzBzQI/31rSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368480; c=relaxed/simple;
	bh=Mo4G/rDgf9z8gYFzvbSXsjnYyCAnDRzNDsLl0L9AnDM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Dn+wDxk6kkmb9U/m1GbR9efO2s5pdrKofh9keaq9+f0118dsGP/2AXSpT09luHWSN7OSjTPAB2MgMvEnHokseWMAGlXmCSdFIj9qZqIP6Cffy5hcFJJDX3WGRU/30LU78Bditd47gmJugN1YyqncNON8KEqyjKYsDPiCn7NX1qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dH+hDT/3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777368479; x=1808904479;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Mo4G/rDgf9z8gYFzvbSXsjnYyCAnDRzNDsLl0L9AnDM=;
  b=dH+hDT/3BDLK0O7KIrFaGhhV1WsqPOaPcW4pNCLurRrrGm0XnqQDOh++
   dw0VEbl1NljiwZYPJsZZ8Pm5KbTOaW33SB5uEh6f15Dh/aByFoULVsq6f
   zZ5cZnsg4OzoGRUygctu1BbbO1VvT57PwhrqLp6huvUegnZZHnJgeiW9n
   Aq+5NHvDfLu70tHNmPpIMMZX5UYrI/H+/ik3Izvo0J1SMm4XOlXXZ5ywo
   7Hk7kSNJDJH+Xh0IshEIwlp4ZR3lTCj35+bkD7iiS84oRXBsQj53vVuLG
   Nl0fhsz68iqfh+QHRuCdFcHcNbK+CBfM34NSlb1VvVqE2FLktENpM50+G
   A==;
X-CSE-ConnectionGUID: MrIp7kANSV+4se2aIhtzxg==
X-CSE-MsgGUID: qpQpBsarTISZGBkOj5Aabw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78162000"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78162000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 02:27:58 -0700
X-CSE-ConnectionGUID: K4NEpT2WQzyTicXVDSfP2Q==
X-CSE-MsgGUID: 2dnTrdfrRQ6g/LP+sNiiPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="238931536"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 02:27:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 28 Apr 2026 12:27:49 +0300 (EEST)
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
cc: Manivannan Sadhasivam <mani@kernel.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
    linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
    Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v5 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
In-Reply-To: <20260428-t_power_on_fux-v5-1-f1ef926a91ff@oss.qualcomm.com>
Message-ID: <bc3a5f58-676a-3634-6b8f-bffc91d25265@linux.intel.com>
References: <20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com> <20260428-t_power_on_fux-v5-1-f1ef926a91ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-142568513-1777368469=:1128"
X-Rspamd-Queue-Id: 9AA9A48231B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com,rock-chips.com];
	TAGGED_FROM(0.00)[bounces-104938-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,qualcomm.com:email,rock-chips.com:email]

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-142568513-1777368469=:1128
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 28 Apr 2026, Krishna Chaitanya Chundru wrote:

> Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
> parameter into the T_POWER_ON Scale and T_POWER_ON Value fields.
>=20
> This helper can be used by the controller drivers to change the
> default/wrong value of T_POWER_ON in L1ss capability register to
> avoid incorrect calculation of LTR_L1.2_THRESHOLD value.
>=20
> The helper converts a T_POWER_ON time specified in microseconds into
> the appropriate scale/value encoding defined by the PCIe spec r7.0,
> sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
> to the largest representable encoding.
>=20
> Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  drivers/pci/pci.h       |  6 ++++++
>  drivers/pci/pcie/aspm.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>=20
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 4a14f88e543a..c379befe1ebe 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -1110,6 +1110,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev=
, bool locked);
>  void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
>  void pci_configure_ltr(struct pci_dev *pdev);
>  void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
>  #else
>  static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap=
) { }
>  static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
> @@ -1118,6 +1119,11 @@ static inline void pcie_aspm_pm_state_change(struc=
t pci_dev *pdev, bool locked)
>  static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev)=
 { }
>  static inline void pci_configure_ltr(struct pci_dev *pdev) { }
>  static inline void pci_bridge_reconfigure_ltr(struct pci_dev *pdev) { }
> +static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, =
u8 *value)
> +{
> +=09*scale =3D 0;
> +=09*value =3D 0;
> +}
>  #endif
> =20
>  #ifdef CONFIG_PCIE_ECRC
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 925373b98dff..457d469b8d49 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -525,6 +525,46 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 =
scale, u32 val)
>  =09return 0;
>  }
> =20
> +/**
> + * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value field=
s
> + * @t_power_on_us: T_POWER_ON time in microseconds
> + * @scale: Encoded T_POWER_ON Scale (0..2)
> + * @value: Encoded T_POWER_ON Value
> + *
> + * T_POWER_ON is encoded as:
> + *   T_POWER_ON(us) =3D scale_unit(us) * value
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

Hi,

I don't know how the type for t_power_on_us was picked but if it was=20
arbitrary decision, I suggest you just go with 32-bit input.

That would also remove the u32 -> u16 truncate done in the other patches=20
of your series which would potentially corrupt the number (I assume=20
numbers that big would be invalid but they could alias to small u16=20
numbers).

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

> +{
> +=09u8 maxv =3D FIELD_MAX(PCI_L1SS_CAP_P_PWR_ON_VALUE);
> +
> +=09/* T_POWER_ON_Value ("value") is a 5-bit field with max value of 31. =
*/
> +=09if (t_power_on_us <=3D 2 * maxv) {
> +=09=09*scale =3D 0; /* Value times 2us */
> +=09=09*value =3D DIV_ROUND_UP(t_power_on_us, 2);
> +=09} else if (t_power_on_us <=3D 10 * maxv) {
> +=09=09*scale =3D 1; /* Value times 10us */
> +=09=09*value =3D DIV_ROUND_UP(t_power_on_us, 10);
> +=09} else if (t_power_on_us <=3D 100 * maxv) {
> +=09=09*scale =3D 2; /* value times 100us */
> +=09=09*value =3D DIV_ROUND_UP(t_power_on_us, 100);
> +=09} else {
> +=09=09*scale =3D 2;
> +=09=09*value =3D maxv;
> +=09}
> +}
> +EXPORT_SYMBOL(pcie_encode_t_power_on);
> +
>  /*
>   * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
>   * register.  Ports enter L1.2 when the most recent LTR value is greater
>=20
>=20

--=20
 i.

--8323328-142568513-1777368469=:1128--

