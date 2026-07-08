Return-Path: <linux-arm-msm+bounces-117758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jHEFBl1uTmplMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:35:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23C7281A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:35:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GFEfWq56;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117758-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117758-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1D34301F8F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EA2439354;
	Wed,  8 Jul 2026 15:35:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CAF3F12CA;
	Wed,  8 Jul 2026 15:35:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524912; cv=none; b=nf0EuHrrzATOVVAF6F5aJherS73SgvNgf4QSLBExKX8w8y7UNXUtl3yWZIsAR0SCdVi7ogA0rVC9Ws1XcwFKGRzcHHF8H+i7jZ46xywiaS4xGDotliLR/QLyeVA1HqfKwDUTMhdRThn6eihRwSyeNyhVqhqrupp5KbS/qBtC9D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524912; c=relaxed/simple;
	bh=F8FzxmDbQnJT3S3eLejXFlR+nREK0IwYMuvQdmG/i3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpV4MHFTdZdHXBa6ML/Tvjg2wGuQodvaRTYAXdjhPf1/JBLSnWX6DOnLzNJPrXlE2a65KzZkBvKlGF/YuRJwnCRZrJIct2RIOdz5nt3UrA2hHkHqQpxlgkyn+yW3i7KfxN4S6ZwQ9kFu5xmKUJj831niDg7xOMCGLTkzQCs+v5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFEfWq56; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5568C1F000E9;
	Wed,  8 Jul 2026 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783524911;
	bh=TIhd5QGHHUH29LQnzEnCvrF+ZQHuAr9wGStJF7y8ltE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GFEfWq56iIsrg049quekywIWXYbcbmVhtKMHr4wPLUG9XA4AEuR9c9v2tx+uce6Lu
	 f2gEw9XMdbiYfZfIyO48tMp4gqnCU9MS8/VU99gdm+A18RUyAgx+T3WWf5k48ymWQE
	 NmaQsvnMIuNMVp5Yunm5v552kngUVGxqyfZLABzaaChawmyKGKQv73NhlHTHyvMslY
	 DsHcIbYlFxCfuMPI5u1+FtQkHZDtUubHA/CNPjaVTIkCR3Ptafslbh9IfGoudPBxd0
	 neIlEUPOhNIw9ZcBw2JnOmtM/fFtypxT1cPNS8TRxAOOIMJG62jOPE0JsdOyD5B8ld
	 0YsYLbiF90wQQ==
Date: Wed, 8 Jul 2026 10:35:07 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: eliza-evk: Enable PCIe0 and
 PCIe1 with M.2 and TC9563 switch
Message-ID: <ak5sfkmrhorCY6lf@baldur>
References: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117758-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baldur:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC23C7281A0

On Wed, Jul 08, 2026 at 11:47:15AM +0530, Krishna Chaitanya Chundru wrote:
> This series enables PCIe for the Eliza EVK board (CQS SoM on EVK carrier).
> 
> The Eliza EVK exposes two PCIe ports:
> 
> - PCIe0 drives an M.2 E key connector. The 3.3V supply is GPIO-controlled
>   via a TCA9538 I/O expander on I2C4. The slot hosts a WLAN module
>   (connected over PCIe) and a Bluetooth device (connected over UART5),
>   modelled with the pcie-m2-e-connector binding.
> 
> - PCIe1 (8GT/s x2) connects to a Toshiba TC9563 PCIe switch, whose
>   management interface sits on I2C4 (address 0x77). The TC9563 RESX# and
>   PERST# lines are OR-ed internally; reset is driven via a TLMM GPIO on
>   the RESX# pin. The iommu-map covers all downstream switch ports
>   (SID range 0x1400-0x1408).
> 
> The M.2 WLAN module carries a Qualcomm QCC2072 Bluetooth chip. A device-ID
> entry is added to the M.2 power sequencer so the serdev node for the BT
> UART interface is created on PCI enumeration.
> 
> Bluetooth is enabled with this patch https://lore.kernel.org/all/20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com/
> 
> This seris Depends-on:
>   https://lore.kernel.org/all/20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com/

Why send this patch, when this dependency is known bad - when would I
ever be able to merge this patch?

And why are you sending separate series concurrently with dependencies
between them!? It's one thing to send patches saying "I depend on
someone else's completely unrelated work", but saying "here's a random
bunch of tangled patches, good luck everyone!" is not okay.

I expect all three patches to be rebased and send in one series that I
can just click "Submit" on next time.

Thanks,
Bjorn

>   https://lore.kernel.org/all/20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com/
>   https://lore.kernel.org/all/20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com/
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop patch 3, as this is already applied
> - Rebase on top of https://lore.kernel.org/all/20260708055017.A90C91F000E9@smtp.kernel.org/
>   and remove pincntrl as pincntrl is added in the eliza.dtsi patch and also remove
>   pinctrl for resx as this is covered in pcie1_default_state as perst gpio.
> - Link to v1: https://patch.msgid.link/20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Krishna Chaitanya Chundru (2):
>       arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
>       arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch
> 
>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 228 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/eliza.dtsi     |   2 +
>  2 files changed, 230 insertions(+)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260629-eliza_evk-6f30686b161f
> prerequisite-message-id: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
> prerequisite-patch-id: 7654ff4f899ac0094a2e791e7f208998fcc7d5fa
> prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
> prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
> prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
> prerequisite-message-id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
> prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53
> 
> Best regards,
> --  
> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 

