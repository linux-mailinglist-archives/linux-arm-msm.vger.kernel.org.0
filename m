Return-Path: <linux-arm-msm+bounces-94281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKRkFKIqoGlrfwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:12:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A91A4E2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33B9E300C935
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2FA337699;
	Thu, 26 Feb 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmDaF1SB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1A330667;
	Thu, 26 Feb 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104100; cv=none; b=XOmtckBnY4XWaaEMWFrdN1J3dRsnxngaTI/4+Ay5Yuux9w7DK2ji7lC/w5Q6SzJwHmWHkrNBDiJkEjc4ULTJ+UhGbixQt5tfmDtwvfpG28773Uv/cFs/wdxeI7pkEf6zmUUCmk1BFpEDS2gfDdkt5rh0P+C1h90JCY6Se2G8DAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104100; c=relaxed/simple;
	bh=ZqDP46s+6rmPQNKnbTHue5NpRIIQUVz+qdDzaCWyLos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7Nn2hXIcnLJ+AKkDZFHUs8jbXQ3TnQigTtLg+AIlt3RQgoWT4rpvxo6stmWCIw0Q7emdQh6z0GIY6tfMM/RIXxCWS11a+0SJb67mWRJeS5/ktMFX/tIcTAFDpMXTCadrX3jy0ON1oJ+2dFwpzD8ZZ0OUViD9OcPXD3en60mm8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmDaF1SB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558DFC116C6;
	Thu, 26 Feb 2026 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772104100;
	bh=ZqDP46s+6rmPQNKnbTHue5NpRIIQUVz+qdDzaCWyLos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmDaF1SBq/2+8xAErIRzxqfb3pdbZKsesu1po+yRhZJCCyu0qL49fg4f8TdnzDFQO
	 BybPJkTRDnX/eWmdoOKBse+FAyeSrW4EAnw71bps/I1pb+rtQfKq7Ls8IlTt1wnknp
	 QTD9BCD2gkdIb07QQUtWi1A+lgQ3yaH1JbxE1vr07NoGvNkpNMcgCm3FSMFVxkJqRQ
	 GVxiDyTLJ4p9FXo6YdgkT6iOYTI/m82iRa7il58q24/q51h9eIGMymriPp57t37gcm
	 Lgv0alYggKsysn39KjjpOAejwI7mkgi2tDF513hUZnP4enM9ilTwoFg/EJBHpL+Jpl
	 MRG6ZlsM/kjRg==
Date: Thu, 26 Feb 2026 16:38:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, krishna.chundru@oss.qualcomm.com, 
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
Message-ID: <vpwe273ehsbsyjpysyky4ypgnawosjehen34rr2n5bpoaqjsyg@3uylwh3oyyqc>
References: <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
 <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
 <e0a0dc6d-fff0-41ec-92eb-7f2dbefa967b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0a0dc6d-fff0-41ec-92eb-7f2dbefa967b@nvidia.com>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94281-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,oss.qualcomm.com,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 998A91A4E2C
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:34:18AM +0000, Jon Hunter wrote:
> Hi Mani, Bjorn,
> 
> On 19/02/2026 17:42, Jon Hunter wrote:
> > Hi Mani,
> > 
> > On 16/02/2026 14:35, Jon Hunter wrote:
> > 
> > ...
> > 
> > > > Krishna posted the series a couple of weeks before but forgot to CC you:
> > > > https://lore.kernel.org/linux-pci/20260128-d3cold-v1-0-
> > > > dd8f3f0ce824@oss.qualcomm.com/
> > > > 
> > > > You are expected to use the helper
> > > > pci_host_common_can_enter_d3cold() in the
> > > > suspend path.
> > 
> > 
> > I have been playing around with this, but so far I have not got anything
> > to work. Right now I have just made the following change (note that this
> > is based upon Manikanta's fixes series [0]) ...
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/
> > controller/dwc/pcie-tegra194.c
> > index 9883d14f7f97..9f88e4c1db08 100644
> > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > @@ -2311,6 +2311,7 @@ static int tegra_pcie_dw_suspend_late(struct
> > device *dev)
> >   static int tegra_pcie_dw_suspend_noirq(struct device *dev)
> >   {
> >          struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
> > +       struct dw_pcie *pci = &pcie->pci;
> > 
> >          if (pcie->of_data->mode == DW_PCIE_EP_TYPE)
> >                  return 0;
> > @@ -2318,6 +2319,9 @@ static int tegra_pcie_dw_suspend_noirq(struct
> > device *dev)
> >          if (!pcie->link_state)
> >                  return 0;
> > 
> > +       if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
> > +               return 0;
> > +
> >          tegra_pcie_dw_pme_turnoff(pcie);
> >          tegra_pcie_unconfig_controller(pcie);
> > 
> > 
> > At first I was thinking that is we are not actually suspending the
> > controller we can skip the configuration of the controller in the
> > resume. However, if we skip configuring the controller in the resume
> > then the device does not resume at all. So right now I have the
> > above, but clearly this is not sufficient. The device resumes but
> > the NVMe is not working ...
> > 
> >   nvme nvme0: ctrl state 1 is not RESETTING
> >   nvme nvme0: Disabling device after reset failure: -19
> >   nvme nvme0: Ignoring bogus Namespace Identifiers
> >   Aborting journal on device nvme0n1p1-8.
> >   nvme0n1: detected capacity change from 0 to 976773168
> >   EXT4-fs error (device nvme0n1p1): __ext4_find_entry:1613: inode
> > #18622533: comm (t-helper): reading directory lblock 0
> >   Buffer I/O error on dev nvme0n1p1, logical block 60850176, lost sync
> > page write
> >   Buffer I/O error on dev nvme0n1p1, logical block 0, lost sync page write
> >   JBD2: I/O error when updating journal superblock for nvme0n1p1-8.
> >   EXT4-fs (nvme0n1p1): I/O error while writing superblock
> >   EXT4-fs error (device nvme0n1p1): ext4_journal_check_start:86: comm
> > rs:main Q:Reg: Detected aborted journal
> >   Buffer I/O error on dev nvme0n1p1, logical block 0, lost sync page write
> >   EXT4-fs (nvme0n1p1): I/O error while writing superblock
> >   EXT4-fs (nvme0n1p1): Remounting filesystem read-only
> >   EXT4-fs (nvme0n1p1): shut down requested (2)
> > 
> > Is the above what you were thinking? Anything else I am missing?
> 
> So NVMe is still broken for us and I admit, I don't fully understand the
> issue. However, it seems to me that this change is not working for all
> device-tree platforms as intended. So for now, would it be acceptable to add
> a callback function for drivers such as the Tegra194 PCIe driver to opt out
> of this? This would at least allow NVMe to work as it was before.
> 

Since we know that ASPM is the issue on your platform and the failure also
confirms that ASPM was never enabled before, I'd suggest disabling ASPM for the
Root Port as a workaround:

```
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..f504b4ffbcb6 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -2499,6 +2499,13 @@ module_platform_driver(tegra_pcie_dw_driver);
 
 MODULE_DEVICE_TABLE(of, tegra_pcie_dw_of_match);
 
+static void tegra_pcie_quirk_disable_aspm(struct pci_dev *dev)
+{
+       pcie_aspm_remove_cap(dev, PCI_EXP_LNKCAP_ASPM_L1 |
+                                 PCI_EXP_LNKCAP_ASPM_L0S);
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID, tegra_pcie_quirk_disable_aspm);
+
 MODULE_AUTHOR("Vidya Sagar <vidyas@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA PCIe host controller driver");
 MODULE_LICENSE("GPL v2");
```

You can use specific Root Port IDs or PCI_ANY_ID depending on the impact. We can
also work on fixing the actual issue parallelly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

