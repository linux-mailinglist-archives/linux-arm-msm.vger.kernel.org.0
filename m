Return-Path: <linux-arm-msm+bounces-110111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKGyJkI0GGpwfggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:25:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0C5F20ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8188D3028165
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91BD3BC692;
	Thu, 28 May 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkM3dV3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E7136BCF0;
	Thu, 28 May 2026 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971126; cv=none; b=jr/dknS8k7HhD5qYwnRzAl172VJCpZ1DteMX7tEsfsZkLRhOXjOlKbf7QhcSgI0yvV+CzFx4tfurEs2T6yJrg/jcukOOToSceoJtxc0XukBSFUhCHm+s+7bO8dUZ/FQP/BZuJdow5lghdkjglICGHuWmGB9QjUKdnm3zsBbjyvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971126; c=relaxed/simple;
	bh=auMGNsBQxma9YoUqqEhZAHbQr2HiBAMAuunbQwSQ2aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=if0Oc40tUWXQtKxT/9x6ytVcjL8ph1NqPmHzg6djYCmIViuEDUU/NKaLCGtIsYaaWE2cjKYBbedI9hJXbpwuRX6oy0dZLyTQkFFqErYBBCQf8l6rH6IkUx4JXslTWKRZV6NCj80YLa9hvCCqJAHltq6YEEFHJhUsVg4Up1qC8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkM3dV3E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ECA1F00A3E;
	Thu, 28 May 2026 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779971125;
	bh=ee57S4UZoQ6zqEqaoGqq0lps43BN3W9FOYLXp5yMnKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OkM3dV3ERw2tXIJ/kTsqCbcTPyJe8iIEgSqPZAAVyjMk2nAAJhnuu1/i/1HQBPwE9
	 zH78yBVPODNYltObKXkEdcBEYHSIA67ldc30pjl9uRrX6cwMYEz5sZ7xKg1EJDPRMZ
	 fx4gwdMjtXUcONFdoyP+1aVREttCLTIL1x2RB/SW/psrkfud68GOp7thPm63PALyru
	 ZJcm7GXgPWfk5fzSVZRWFbRNzzFWAypM7NpsVyti9U6GyOl03Swm75cxk/1v3OlW1u
	 hPaSJCU0zURMzayD/XMTa4xHaZOqB3v9vpmDpZuNvGY98B4/EvGh3qBs8xS8y6zMgJ
	 Qcx83/AKBySFA==
Date: Thu, 28 May 2026 14:25:21 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Disable ASPM L0s for SA8775P
Message-ID: <63ekyvawag6wsihfvjdwhqwlapkaw2o6eivp3loeueffvrxo3c@h45hhk3muhqf>
References: <20260419093934.1223027-1-shengchao.guo@oss.qualcomm.com>
 <453jc2ff65zdn3yahdwkdh2uqzz2coi4kv3siqfygfgmfd3v4w@4dkwj3s4dkfp>
 <aebnPAPLO8cI0H-J@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aebnPAPLO8cI0H-J@QCOM-aGQu4IUr3Y>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110111-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 32C0C5F20ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 10:55:56AM +0800, Shawn Guo wrote:
> On Mon, Apr 20, 2026 at 12:08:25PM +0530, Manivannan Sadhasivam wrote:
> > On Sun, Apr 19, 2026 at 05:39:34PM +0800, Shawn Guo wrote:
> > > Commit f5cd8a929c82 ("PCI: dwc: Remove MSI/MSIX capability for Root Port
> > > if iMSI-RX is used as MSI controller") removed MSI/MSI-X capabilities
> > > from the Root Port on platforms using iMSI-RX (including SA8775P, which
> > > has no msi-parent/msi-map in DT).  This causes PME and AER service
> > > drivers to fall back from MSI to INTx.
> > > 
> > > With INTx-based PME active, the QCN9100 modem endpoint sends PME messages
> > > during D-state transitions early in boot.  The level-triggered INTx
> > > assertion coincides with ASPM L0s exit sequencing on SA8775P hardware,
> > > causing Data Link Layer Replay Timer Timeout errors on both sides of the
> > > link.
> > > 
> > 
> > How did you conclude that INTx collides with ASPM L0s exit sequence? Also,
> > AFAIK, L0s is supported and work well on this chipset.
> > 
> > What we are dealing with could be the board specific issue.
> 
> I just got looped into an internal discussion.  The issue seems to
> be refgen voting related, so likely affects all Lemans (and Monaco)
> boards with PCIe enabled.
> 
> Before a proper fix is available, 'pcie_aspm=off' on kernel cmdline is
> suggested as a temporary workaround.
> 

As I checked internally, it turned out that the SA8775p SoC has some hardware
issue that affects the transition from L0s to L0. So I went ahead and applied
the patch with a change in commit message and fixes tag, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

