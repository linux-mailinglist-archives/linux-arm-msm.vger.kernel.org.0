Return-Path: <linux-arm-msm+bounces-95176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJHRKcsMp2kDcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:31:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBB1F3D32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E95D30637DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 16:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138BB42983C;
	Tue,  3 Mar 2026 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGwJT3cc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E836D9ED;
	Tue,  3 Mar 2026 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555263; cv=none; b=ZvHGKAmkpZW6m69T/OZEeP/deZ1XmtkBPQ2SIi+O/Io6gbCqN+eW6ngU7p3JQmcSHzwqDfygtblH7JM1o1Co2dI4XY19UNIvQlzpH7I5KdbHj0zQJk8ayEezj+2gef9EAFnOc5hu+5RcYbXIaz+U+J3yagC13/AT6Ch8z+LEuzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555263; c=relaxed/simple;
	bh=02WuwVzfcqREGKNcO4A+gehHauWokgchNs/BbMoEVRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Frfx0a3q97oS0gIEQh8VEH9Q8RtRiDGW3msbGcbW++meCfEF5866QpIA6P60InD9CFnI6e0ma9QUyo9MTuNRUc4TF3O9T5J29WX3jFsb2EaluVAeb2NVxASgaJNWParMhJDZmJ2HsEMlEphKfrTYmgDWRNubPN8iIT15uhntoy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGwJT3cc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464ACC19422;
	Tue,  3 Mar 2026 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555262;
	bh=02WuwVzfcqREGKNcO4A+gehHauWokgchNs/BbMoEVRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGwJT3ccRPvCctpnE4DzTVD9FcqQmUNlycHUD0v6oE4FbMMKWy2q5rt9sKy0wKWn5
	 XWyuo0Xe6aDRAWyTuIbehuzELvMVCVofjpVhED//48OHcWjhILi9DMBEPdLcSDWDCb
	 d6+pNTKHz74ebyHUBnyikOrKlOvq9eJMLEd2RoXhwffxanj1dl2oO3XrEEp8Rb1vtM
	 RKec0J64+9GRrl2bq6SfYqks3UlK1VN+5ZOBcRiq8EY9e1sIuv/vYBSCpXXDm7s652
	 zmoURwTNwBIhEAEjysccLZK+I/09A5pk+DOppSF/yM+gXjuPFM62kyd9DKC/NLqvSw
	 jwVKBkkp/E0PQ==
Date: Tue, 3 Mar 2026 21:57:25 +0530
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
Message-ID: <km5stwtgzyshi5ogd2ke7qjj35nakwo6ztho5ju6y4ds32epln@fqqebty3v6me>
References: <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
 <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
 <e0a0dc6d-fff0-41ec-92eb-7f2dbefa967b@nvidia.com>
 <vpwe273ehsbsyjpysyky4ypgnawosjehen34rr2n5bpoaqjsyg@3uylwh3oyyqc>
 <cfbbe3f0-f958-4cf2-aaa0-afca52cc5d5e@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfbbe3f0-f958-4cf2-aaa0-afca52cc5d5e@nvidia.com>
X-Rspamd-Queue-Id: 52CBB1F3D32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95176-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 04:55:34PM +0000, Jon Hunter wrote:
> 
> On 26/02/2026 11:08, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > Since we know that ASPM is the issue on your platform and the failure also
> > confirms that ASPM was never enabled before, I'd suggest disabling ASPM for the
> > Root Port as a workaround:
> > 
> > ```
> > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> > index 06571d806ab3..f504b4ffbcb6 100644
> > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > @@ -2499,6 +2499,13 @@ module_platform_driver(tegra_pcie_dw_driver);
> >   MODULE_DEVICE_TABLE(of, tegra_pcie_dw_of_match);
> > +static void tegra_pcie_quirk_disable_aspm(struct pci_dev *dev)
> > +{
> > +       pcie_aspm_remove_cap(dev, PCI_EXP_LNKCAP_ASPM_L1 |
> > +                                 PCI_EXP_LNKCAP_ASPM_L0S);
> > +}
> > +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID, tegra_pcie_quirk_disable_aspm);
> > +
> >   MODULE_AUTHOR("Vidya Sagar <vidyas@nvidia.com>");
> >   MODULE_DESCRIPTION("NVIDIA PCIe host controller driver");
> >   MODULE_LICENSE("GPL v2");
> > ```
> > 
> > You can use specific Root Port IDs or PCI_ANY_ID depending on the impact. We can
> > also work on fixing the actual issue parallelly.
> 
> Thanks. By default we are building the PCIe driver for Tegra as a module and
> so I am not sure we can use DECLARE_PCI_FIXUP_EARLY() right?
> 

Ah, yes. We cannot use any of these DECLARE_PCI_FIXUP*() in a module anyway :/

> I was just thinking that in pcie_aspm_override_default_link_state() we just
> need a callback to specify the default ASPM override state?
> 

That looks like a dirty hack. Moreover, your platform works perfectly fine with
ASPM. So you should not be turning it off due to one driver behaving
erratically.

As I mentioned in [1], you should try to advertise the
PM_SUSPEND_FLAG_FW_SUSPEND flag for the platform as per [2].

FYI, this is a known issue that is plauging us for so long.
PM_SUSPEND_FLAG_FW_SUSPEND is the cleanest solution we came up with. But
unfortunately, we cannot use it across all of our Qcom SoCs due to firmware not
advertising S2RAM in some of them.

- Mani

[1] https://lore.kernel.org/linux-pci/kkly3z4durpagtenadvmzdpojlctachgfgi2fdapt6zthdl2gx@n2qhmlud2zb7/
[2] https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com/

-- 
மணிவண்ணன் சதாசிவம்

