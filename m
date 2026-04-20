Return-Path: <linux-arm-msm+bounces-103669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ+OL5jM5WlIoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:50:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9F427705
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C1BF3069645
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10A2382F04;
	Mon, 20 Apr 2026 06:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amPs/eFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFEC382391;
	Mon, 20 Apr 2026 06:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667116; cv=none; b=mWD2M9Ru02Xlc9J1FzMLKLMM6swlMojkB5PIGnoasEpHjg3r3m0tHroQrFLyTffe9hihXAxyF82HyFm1bJLDsQdhDp9EfwjuAMGEgNFHmXh75krGu7xEKzJeKbABIuKQl/qSgvNQrX/oIFMrrUX2ps8SGDQmu5J6I/qWi1GP1ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667116; c=relaxed/simple;
	bh=ZY57myzLTROZkKPMgE6E+Hum6BiWgqSE7TyD0ENLE98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XS/dwfI03bxFpW2AZmmWYfMIZealEPHzehvuf6yoXNxEtoNT+9pzz+C10z/ixCxlplo+4KOvgCrQr6hIFM/Sy8wr+8tOIGH+J8o5MgizsyM7jtxFi10PhbTYCgYrEElxaLiVFIb23pGPmd1y07OamxBF1Pi+48BVFgJA35Wyhy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amPs/eFe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A4AC19425;
	Mon, 20 Apr 2026 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776667116;
	bh=ZY57myzLTROZkKPMgE6E+Hum6BiWgqSE7TyD0ENLE98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amPs/eFep+HnkJoSItsSZA2nIRxHS1TaOlgRxIUVxBBM+CkKVM/n+Y2x9j+vkPMVm
	 aXczYvMC/Su2a9Q7cBLdT7yQbOpF2GF1ghkVI4emWHWcu+WVso1KwNpoiy38JFoz8C
	 Ce55zctulKd0cHVQlDK+AU0IKsvLP744iZ4H86P+byuzV0Xle0AaSQepnBL41px+FR
	 gAEU80m1+hNlJosrLbRJK6aVA6oX9I2kB6fW+1d7b1YqXM4S7eL/UO5RoUHLPrMiU4
	 04Seeq4q96gbkHAIA6W2ubyGHdYH5pPY+mgUCdxJDE0CuVSMGCM3t6OGdt1k7qo8Ie
	 lCXluU+I9mrpg==
Date: Mon, 20 Apr 2026 12:08:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Disable ASPM L0s for SA8775P
Message-ID: <453jc2ff65zdn3yahdwkdh2uqzz2coi4kv3siqfygfgmfd3v4w@4dkwj3s4dkfp>
References: <20260419093934.1223027-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260419093934.1223027-1-shengchao.guo@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103669-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21A9F427705
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 05:39:34PM +0800, Shawn Guo wrote:
> Commit f5cd8a929c82 ("PCI: dwc: Remove MSI/MSIX capability for Root Port
> if iMSI-RX is used as MSI controller") removed MSI/MSI-X capabilities
> from the Root Port on platforms using iMSI-RX (including SA8775P, which
> has no msi-parent/msi-map in DT).  This causes PME and AER service
> drivers to fall back from MSI to INTx.
> 
> With INTx-based PME active, the QCN9100 modem endpoint sends PME messages
> during D-state transitions early in boot.  The level-triggered INTx
> assertion coincides with ASPM L0s exit sequencing on SA8775P hardware,
> causing Data Link Layer Replay Timer Timeout errors on both sides of the
> link.
> 

How did you conclude that INTx collides with ASPM L0s exit sequence? Also,
AFAIK, L0s is supported and work well on this chipset.

What we are dealing with could be the board specific issue.

> [   13.069528] pcieport 0000:00:00.0: PME: Signaling with IRQ 332
> [   13.082436] pcieport 0000:00:00.0: AER: enabled with IRQ 332
> [   13.082447] pcieport 0000:00:00.0: AER: Correctable error message received from 0000:01:00.0
> [   13.101347] pci 0000:01:00.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Transmitter ID)
> [   13.111281] pci 0000:01:00.0:   device [17cb:1103] error status/mask=00001000/0000e000
> [   13.111284] pci 0000:01:00.0:    [12] Timeout
> [   13.111313] pcieport 0000:00:00.0: AER: Multiple Correctable error message received from 0000:01:00.0
> [   13.130512] pcieport 0000:00:00.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Transmitter ID)
> [   13.130514] pcieport 0000:00:00.0:   device [17cb:0115] error status/mask=00001000/0000e000
> [   13.130516] pcieport 0000:00:00.0:    [12] Timeout
> 
> Fix the PCIe regression on SA8775P/Lemans platform by adding no_l0s = true
> to cfg_1_34_0 for SA8775P, so that PCI_EXP_LNKCAP_ASPM_L0S is cleared from
> the Root Port and ASPM L0s is prevented from being negotiated.
> 

No. This is not the correct fix. If we identify if this is a board issue, we
need to disable L0s selectively using 'pcie,no-aspm-l0s' DT property defined in
the Root Port DT node.

> Fixes: f5cd8a929c82 ("PCI: dwc: Remove MSI/MSIX capability for Root Port if iMSI-RX is used as MSI controller")
> Assisted-by: Claude:claude-4-6-sonnet

Ok, this seems to be an AI slop. INTx is triggered through in-band messages and
the link should be in L0 so that an endpoint can transmit these. So there is no
way it could collide with L0s exit sequence as the link being in L0 is the
pre-requisite for triggering INTx.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

