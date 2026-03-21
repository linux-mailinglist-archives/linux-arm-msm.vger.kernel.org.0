Return-Path: <linux-arm-msm+bounces-99007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KPEJTuJvmkOSQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 13:04:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 181882E531D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 13:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D99E3301CC66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 12:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EAA1C5F11;
	Sat, 21 Mar 2026 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHdwSY/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E42E63C;
	Sat, 21 Mar 2026 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774094481; cv=none; b=pJ/NiA/gyPDKhygxW9vvWJK0RmMz7+RfRAYQ6bfZEap9bQJG4vxVZPlielk+fkjt31zCd8Uecumf7VVNbWty9908EAymarvlmMCrnZ+vq1WYwklGLgoMCKudhxVpfkXoqp8ErPXqPaTG9OjdX6GAuuEdqvkvC/a5Un4ONUsI11w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774094481; c=relaxed/simple;
	bh=VM52w2SMnOLQgAP0JEn4EpWJ1f7+pz7wfeF1c3g1Hto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6OAWXGNPMrTlX1jOY+NI8HQYhXboc2hoNelcNcwxljXSEHKggQZSRdUbe9zTRQf4Kax3f1YMtv0N3VzEBOh6nwDP8QHjNXDE7sN7MFioP+a+ETpvqY4Dnr2i3y6iR3G/UrDfirZ7u7zeKiq/mj/I5jKPelrSEw2Iu/nDuFQpHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHdwSY/g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF605C19421;
	Sat, 21 Mar 2026 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774094481;
	bh=VM52w2SMnOLQgAP0JEn4EpWJ1f7+pz7wfeF1c3g1Hto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHdwSY/g+e/zFQkrAGp+H/YaIDRd1cWaStTrZw1ErIVGfOz9grEeCR9IgxJYV3N5+
	 4VtTN4xVncouHImp3h8v58/ogqerRZKGxBNzC28Ngp4cqPgmgj+OEoZ/ZPMGNFEKwz
	 jmtFL84iSHhdBACdq7z1uwArYjw0Ssn4nW7w70M5V5xhXDoPxgsCPA2bXSBl/q2k56
	 KDMghG1QEkdLTpOC5eQ0wS74+SeNi2aMgFYZrH88o4hT3l62ifiYrZleMCyAii/v8c
	 tb+Z4hOtU+UEcFNVXOevlzJEyyp6EDlsZb1WupOqogJnL5piYosemKUDphAz9/WdaV
	 w7eTCW7AD4t/Q==
Date: Sat, 21 Mar 2026 17:31:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Advertise hotplug with no command completion
 support
Message-ID: <jhh5xvjssci4z53vsvskyp7327sgit2z7gqu7kra7e3nkaa2r7@rhe74dh2z3sa>
References: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
 <t66kmmr22z5anjhhez3mwfbmy64pz5246e4oepvpwf5j5l3u5o@i3gsh22x4dst>
 <015d00db-9ed5-45a7-83f8-1b10bc2ee457@oss.qualcomm.com>
 <e94f9da7-3daf-4393-9455-6707cb963e0c@oss.qualcomm.com>
 <4649cbd8-7128-4c24-8d8d-c12bfd2a677c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4649cbd8-7128-4c24-8d8d-c12bfd2a677c@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99007-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 181882E531D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 07:10:19AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/19/2026 4:29 PM, Konrad Dybcio wrote:
> > On 3/16/26 1:22 PM, Krishna Chaitanya Chundru wrote:
> > > 
> > > On 3/15/2026 3:39 PM, Manivannan Sadhasivam wrote:
> > > > On Sat, Mar 14, 2026 at 07:26:34AM +0530, Krishna Chaitanya Chundru wrote:
> > > > > QCOM PCIe controller advertise hotplug capability in hardware but do not
> > > > > support hotplug command completion. As a result, the PCI core registers
> > > > > the pciehp service and issues hotplug commands that never gets completions,
> > > > > leading to repeated timeout warnings and multi-second delays during boot
> > > > > and suspend/resume.
> > > > > 
> > > > > Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
> > > > > IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
> > > > > Capability bit entirely, which also disabled all hotplug functionality.
> > > > > 
> > > > Just some background: I added commit a54db86ddc153 to disable hotplug for Qcom
> > > > PCIe Root Ports since we were seeing completion timeouts for hotplug commands
> > > > and also the PRSNT# signal was not exposed on any of our SoCs. After checking
> > > > with some internal folks I learned that hotplug functionality was not exercised
> > > > in Linux. So these facts made me believe that hotplug was not suppored at all.
> > > > 
> > > > But it turned out that the Qcom Root Ports support "Data Link Layer State
> > > > Changed Events" such as DL_Up/Down events.
> > > > 
> > > > > Instead of disabling hotplug, mark these controllers as not supporting
> > > > > command completion by setting the No Command Completed Support (NCCS) bit
> > > > > in the Slot Capabilities register. This prevents the PCI hotplug driver
> > > > > from waiting for commands completion while still allowing hotplug-related
> > > > > functionality such as Data Link Layer state change events.
> > > > > 
> > > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > index 67a16af69ddc75fca1b123e70715e692a91a9135..a2924610f3625f2456a491473c135840e31bafb9 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > @@ -358,7 +358,7 @@ static void qcom_pcie_clear_hpc(struct dw_pcie *pci)
> > > > >        dw_pcie_dbi_ro_wr_en(pci);
> > > > >          val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
> > > > > -    val &= ~PCI_EXP_SLTCAP_HPC;
> > > > > +    val |= PCI_EXP_SLTCAP_NCCS;
> > > > Are you sure that this is the only non-supported capability? What about
> > > > Attention, Presence, Power Fault, MRL etc...?
> > > Even though there no signals required for attention, presence etc in the hardware
> > > there is a way to generate these MSI's with these bits set through parf, so technically
> > > so other co-processor in the system can trigger interrupts.
> > Are you saying that the RC itself will not generate them based on what
> > happens on the bus, but they can be triggered artificially?
> Yes there are parf registers through which msi's can be triggered
> artificially.
> 

As Krishna said, it seems there are ways to *inject* these events through
platform specific means (through PARF register space), even if the associated
signals are not exposed to the slot. And we might end up using those events at
some point.

So it is OK from my opinion to just disable NCCS. But this also warrants a
comment in the code.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

