Return-Path: <linux-arm-msm+bounces-100142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCinL7l4xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:19:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B364339F4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EE5930ED928
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA8939A7F6;
	Thu, 26 Mar 2026 18:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dw7Yzi8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC8434D90F;
	Thu, 26 Mar 2026 18:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548384; cv=none; b=bQKke+25oLduv1SWuZljlLUddCypUsdW0PqNZfWybHYXf8NwtNfGR/p29kaFClcwc3vAvTtMLhS2CZTxZunwgaBEMRHa7TltBiP6qJKVNFhtD7BPmbU/l9+ckE0XtuVggHbukUkSDsiBsEbqekVtNfk+anwbWuhjJiUShvBhGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548384; c=relaxed/simple;
	bh=eVaHhSysabA3Km2Qwi/tfv5daqFLQ8HXSHbiVCdSpYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+ePlIdQFVoirYWGM1AkJp3gufuxMAyCqq1UaWsUeLELOoMJgezmdlgZErqDiaklkEKDOFMLsRBTCM1RDUhxGuvBtveyWZi61lb72viQrCPKtrfPPGoF/0+K3Z9angY07zKtSPdFaOoo+6fJQCsR3l78iVUfl4zh2rOzn7S8IOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dw7Yzi8A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449B7C116C6;
	Thu, 26 Mar 2026 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774548384;
	bh=eVaHhSysabA3Km2Qwi/tfv5daqFLQ8HXSHbiVCdSpYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dw7Yzi8A6C1LHHeq9napDdriLMu65dNyNKCacW+HrBsq8TJtvTZOtGY9wXB6EKtdg
	 p8CxiRCLM6h91gzTqDD7dPcgxErkK8fzT2pdKxGf2CTtgADW+p6RNhklH8O7wsFNvf
	 gWXGUgMWBgc/SuaL+x1Nh5IdpSkbo2oupbQh+BvyR+JtxTVw4juobh9YMp+Bq9I7pk
	 UesxOKHKK/6YblZjznjdUHwZQcqiounnXxphEgYov32AoStLDegy8N49+EuoHqb6Q4
	 Sl8Zw4s3QwGjbKkx4HkGjI3WaJmIobC9/FD0Y6e03dkGsaw9AkwtEsZ4J5iSdtQCN7
	 yIQYyGK+5MCyA==
Date: Thu, 26 Mar 2026 23:36:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Advertise hotplug with no command completion
 support
Message-ID: <afz4j3esjt5emwqzuyjuk3yozc3z2qqj6a67irbjhbheozapfy@qgnfu3yacngw>
References: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
 <t66kmmr22z5anjhhez3mwfbmy64pz5246e4oepvpwf5j5l3u5o@i3gsh22x4dst>
 <015d00db-9ed5-45a7-83f8-1b10bc2ee457@oss.qualcomm.com>
 <e94f9da7-3daf-4393-9455-6707cb963e0c@oss.qualcomm.com>
 <4649cbd8-7128-4c24-8d8d-c12bfd2a677c@oss.qualcomm.com>
 <jhh5xvjssci4z53vsvskyp7327sgit2z7gqu7kra7e3nkaa2r7@rhe74dh2z3sa>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jhh5xvjssci4z53vsvskyp7327sgit2z7gqu7kra7e3nkaa2r7@rhe74dh2z3sa>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100142-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2B364339F4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 05:31:08PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Mar 20, 2026 at 07:10:19AM +0530, Krishna Chaitanya Chundru wrote:
> > 
> > 
> > On 3/19/2026 4:29 PM, Konrad Dybcio wrote:
> > > On 3/16/26 1:22 PM, Krishna Chaitanya Chundru wrote:
> > > > 
> > > > On 3/15/2026 3:39 PM, Manivannan Sadhasivam wrote:
> > > > > On Sat, Mar 14, 2026 at 07:26:34AM +0530, Krishna Chaitanya Chundru wrote:
> > > > > > QCOM PCIe controller advertise hotplug capability in hardware but do not
> > > > > > support hotplug command completion. As a result, the PCI core registers
> > > > > > the pciehp service and issues hotplug commands that never gets completions,
> > > > > > leading to repeated timeout warnings and multi-second delays during boot
> > > > > > and suspend/resume.
> > > > > > 
> > > > > > Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
> > > > > > IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
> > > > > > Capability bit entirely, which also disabled all hotplug functionality.
> > > > > > 
> > > > > Just some background: I added commit a54db86ddc153 to disable hotplug for Qcom
> > > > > PCIe Root Ports since we were seeing completion timeouts for hotplug commands
> > > > > and also the PRSNT# signal was not exposed on any of our SoCs. After checking
> > > > > with some internal folks I learned that hotplug functionality was not exercised
> > > > > in Linux. So these facts made me believe that hotplug was not suppored at all.
> > > > > 
> > > > > But it turned out that the Qcom Root Ports support "Data Link Layer State
> > > > > Changed Events" such as DL_Up/Down events.
> > > > > 
> > > > > > Instead of disabling hotplug, mark these controllers as not supporting
> > > > > > command completion by setting the No Command Completed Support (NCCS) bit
> > > > > > in the Slot Capabilities register. This prevents the PCI hotplug driver
> > > > > > from waiting for commands completion while still allowing hotplug-related
> > > > > > functionality such as Data Link Layer state change events.
> > > > > > 
> > > > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > > > ---
> > > > > >    drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
> > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > > index 67a16af69ddc75fca1b123e70715e692a91a9135..a2924610f3625f2456a491473c135840e31bafb9 100644
> > > > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > > @@ -358,7 +358,7 @@ static void qcom_pcie_clear_hpc(struct dw_pcie *pci)
> > > > > >        dw_pcie_dbi_ro_wr_en(pci);
> > > > > >          val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
> > > > > > -    val &= ~PCI_EXP_SLTCAP_HPC;
> > > > > > +    val |= PCI_EXP_SLTCAP_NCCS;
> > > > > Are you sure that this is the only non-supported capability? What about
> > > > > Attention, Presence, Power Fault, MRL etc...?
> > > > Even though there no signals required for attention, presence etc in the hardware
> > > > there is a way to generate these MSI's with these bits set through parf, so technically
> > > > so other co-processor in the system can trigger interrupts.
> > > Are you saying that the RC itself will not generate them based on what
> > > happens on the bus, but they can be triggered artificially?
> > Yes there are parf registers through which msi's can be triggered
> > artificially.
> > 
> 
> As Krishna said, it seems there are ways to *inject* these events through
> platform specific means (through PARF register space), even if the associated
> signals are not exposed to the slot. And we might end up using those events at
> some point.
> 
> So it is OK from my opinion to just disable NCCS. But this also warrants a
> comment in the code.
> 

I added the comments and also changed the helper function name while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

