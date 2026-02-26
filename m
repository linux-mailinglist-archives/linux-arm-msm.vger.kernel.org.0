Return-Path: <linux-arm-msm+bounces-94285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCVDJ9groGmLfwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:17:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3BB1A4F4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6BFD3004C97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5464635B636;
	Thu, 26 Feb 2026 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ce4wdFn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0E1341ACA;
	Thu, 26 Feb 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104627; cv=none; b=mULGVrInTmv/oKiKJVgiV3chgKROH1dY+HMnmUSeDvJI+xco8iqQebmVqN4Zv9byfSd4ScFb+E9ODsTkF0VoVwzK9Vh2AxCebjFU1Fu99FDwvYMrJ8apa6W3AKZ81/7SEKQvWpsfQuSLjHAQ0o0r84nvAYnqQwlrSzcWoj5+bx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104627; c=relaxed/simple;
	bh=EBm164YdJF64MvzWiqTVH2bhb4BY80EhzoyHTGgW/3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4R0VFlcbkpuWUBMb3rehzzMdaxODnbLWoT9ZuhVlS5eMrRF8U0uttFCCJa08XzVdg/nEvmeLO7s5jHVn8oRZk/hfnlje8eYf6G61iaSv/xoVexWQ5jOGFMfQ6CyNVJW4KvFgLWW10JSGdiCnV0Znat4b1FkuVZ+sal193Etw10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ce4wdFn6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4D3C116C6;
	Thu, 26 Feb 2026 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772104626;
	bh=EBm164YdJF64MvzWiqTVH2bhb4BY80EhzoyHTGgW/3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ce4wdFn61ewLsnyosxoI+FVPWXeyqhMsd7SX2CPw+LmoCsmu6eIOeriSAU/xeX/o/
	 HcL4uc9RwB1CWjegvwKQr1W03ZMSkUamL5ZK2l9m+ljoASbLcyoHlK+GJQoNMrwtju
	 QzKgKZp+lwjpY2BQqXgcePx+73MEm0mGUfdD7/VgOFhwhKmGsf+/UWqa1V0F/j0dQ7
	 THtcA6jVEjtTQTy387Wx3KAIBaLP6P6tyLcIfpREYefY/HnuA/hGfblLQ4rv/JtuEZ
	 jUbceZhL8zlBjUwXYge33JMrlGpZoW8JHeG5iTSDsN1uWL4eyC80pEBsj8BbJ+CmOg
	 +/EzqLIP1okcw==
Date: Thu, 26 Feb 2026 16:46:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>, 
	krishna.chundru@oss.qualcomm.com, Bjorn Helgaas <helgaas@kernel.org>, 
	manivannan.sadhasivam@oss.qualcomm.com, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "David E. Box" <david.e.box@linux.intel.com>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Chia-Lin Kao <acelan.kao@canonical.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
Message-ID: <npt2cgwksulq5375dzlhszqaqrurgdvlkz6fdczer6shglqfg5@gp6a6xymymww>
References: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
 <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94285-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,oss.qualcomm.com,kernel.org,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: BF3BB1A4F4F
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 05:42:37PM +0000, Jon Hunter wrote:
> Hi Mani,
> 
> On 16/02/2026 14:35, Jon Hunter wrote:
> 
> ...
> 
> > > Krishna posted the series a couple of weeks before but forgot to CC you:
> > > https://lore.kernel.org/linux-pci/20260128-d3cold-v1-0-
> > > dd8f3f0ce824@oss.qualcomm.com/
> > > 
> > > You are expected to use the helper
> > > pci_host_common_can_enter_d3cold() in the
> > > suspend path.
> 
> 
> I have been playing around with this, but so far I have not got anything
> to work. Right now I have just made the following change (note that this
> is based upon Manikanta's fixes series [0]) ...
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 9883d14f7f97..9f88e4c1db08 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -2311,6 +2311,7 @@ static int tegra_pcie_dw_suspend_late(struct device *dev)
>  static int tegra_pcie_dw_suspend_noirq(struct device *dev)
>  {
>         struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
> +       struct dw_pcie *pci = &pcie->pci;
>         if (pcie->of_data->mode == DW_PCIE_EP_TYPE)
>                 return 0;
> @@ -2318,6 +2319,9 @@ static int tegra_pcie_dw_suspend_noirq(struct device *dev)
>         if (!pcie->link_state)
>                 return 0;
> +       if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
> +               return 0;
> +
>         tegra_pcie_dw_pme_turnoff(pcie);
>         tegra_pcie_unconfig_controller(pcie);
> 
> 
> At first I was thinking that is we are not actually suspending the
> controller we can skip the configuration of the controller in the
> resume. However, if we skip configuring the controller in the resume
> then the device does not resume at all.

Device mean the 'host' here?

> So right now I have the
> above, but clearly this is not sufficient. The device resumes but
> the NVMe is not working ...
> 
>  nvme nvme0: ctrl state 1 is not RESETTING
>  nvme nvme0: Disabling device after reset failure: -19
>  nvme nvme0: Ignoring bogus Namespace Identifiers
>  Aborting journal on device nvme0n1p1-8.
>  nvme0n1: detected capacity change from 0 to 976773168
>  EXT4-fs error (device nvme0n1p1): __ext4_find_entry:1613: inode #18622533: comm (t-helper): reading directory lblock 0
>  Buffer I/O error on dev nvme0n1p1, logical block 60850176, lost sync page write
>  Buffer I/O error on dev nvme0n1p1, logical block 0, lost sync page write
>  JBD2: I/O error when updating journal superblock for nvme0n1p1-8.
>  EXT4-fs (nvme0n1p1): I/O error while writing superblock
>  EXT4-fs error (device nvme0n1p1): ext4_journal_check_start:86: comm rs:main Q:Reg: Detected aborted journal
>  Buffer I/O error on dev nvme0n1p1, logical block 0, lost sync page write
>  EXT4-fs (nvme0n1p1): I/O error while writing superblock
>  EXT4-fs (nvme0n1p1): Remounting filesystem read-only
>  EXT4-fs (nvme0n1p1): shut down requested (2)
> 
> Is the above what you were thinking? Anything else I am missing?
> 

I can't certainly know what is going wrong. If controller driver suspend is
skipped, then ideally the controller and the NVMe device should stay powered ON
during suspend. But if the platform pulls the plug at the end of suspend
(firmware, gdsc or some other entity), then all the context would be lost and
that might explain the failure because both the controller driver and NVMe
driver would expect the RC and NVMe to be active.

You can try commenting out the whole PM callbacks:
		// .pm = &tegra_pcie_dw_pm_ops

If the host itself doesn't resume, then it confirms that some other entity is
pulling the plug (which is common in ARM platforms). In that case, we have to
let the NVMe driver know about it so that it can shutdown the controller.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

