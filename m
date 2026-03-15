Return-Path: <linux-arm-msm+bounces-97716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rEJfI3mFtmlhCwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 11:10:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C64422905FF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 11:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 518E63023502
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 10:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B10246781;
	Sun, 15 Mar 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP8lEyXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037C20C038;
	Sun, 15 Mar 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773569397; cv=none; b=N3t7ohVN7UpZIEYbZihuNZEc9hwE6Egb/7H84SEdicgYItImu5MHucgq481Hy+baPFMPRchT491EoffgUY/igDx3tYTKs1aPQEVKh44XHzbqGcus5jCtc5vLQUnLg9+cT/xhKDz2Ib5W8I+4iGBU7WBvian9/bLrClDw+FPPhnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773569397; c=relaxed/simple;
	bh=xPSA+uKV1s9OI288Gn91ZJ/8IVLEIe3Pxg7Ofp0JPig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/j0Nh2hpn4KIuhIur3Z/o0v0MQV8FyUtKFiwPZMQnixU4c1PQULw1y+7n5UJ+9Va+m05Qlalh42xQK8M3Qc5d2RVSZafkPaOP0VOThoBK9RxegnqI/PadyGo9ZD5TXzrarbZPYFD2e7alebfycUc6IHfPy+oidPAkkrgNz4muU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP8lEyXD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0A8C4CEF7;
	Sun, 15 Mar 2026 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773569397;
	bh=xPSA+uKV1s9OI288Gn91ZJ/8IVLEIe3Pxg7Ofp0JPig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dP8lEyXD59oUDLuPc9WQJKXUSm3/OWt+risr1P0jrLOUST7qsjvJQpzW9e+AQ0Fb0
	 7zzTgkRWXwFhqxkp7vSwfKSt2vksnxL4KtLET6cMIDlWgg1F6Q/9GlCReAPrly0VLp
	 J4e5ozmrfO7QtoPPcd0W1SVxlQnmHznk49BJiGTO0ISEBLgxwZxtU+pdU+fIIS1F2G
	 kZLys8XJI0sG9oeLQTucwcCHduC39geteloYIeLPrl6vhVKtottGjvnCHn9YTG8sr9
	 aF6a+JcnR6U/+NC/2lszK6x0L6t4qn21lVA4TQ3Qv/UxF50i4s3bWAj94r7Uj2xSkQ
	 aeuiN/KfT+Ggg==
Date: Sun, 15 Mar 2026 15:39:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Advertise hotplug with no command completion
 support
Message-ID: <t66kmmr22z5anjhhez3mwfbmy64pz5246e4oepvpwf5j5l3u5o@i3gsh22x4dst>
References: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97716-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C64422905FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 07:26:34AM +0530, Krishna Chaitanya Chundru wrote:
> QCOM PCIe controller advertise hotplug capability in hardware but do not
> support hotplug command completion. As a result, the PCI core registers
> the pciehp service and issues hotplug commands that never gets completions,
> leading to repeated timeout warnings and multi-second delays during boot
> and suspend/resume.
> 
> Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
> IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
> Capability bit entirely, which also disabled all hotplug functionality.
> 

Just some background: I added commit a54db86ddc153 to disable hotplug for Qcom
PCIe Root Ports since we were seeing completion timeouts for hotplug commands
and also the PRSNT# signal was not exposed on any of our SoCs. After checking
with some internal folks I learned that hotplug functionality was not exercised
in Linux. So these facts made me believe that hotplug was not suppored at all.

But it turned out that the Qcom Root Ports support "Data Link Layer State
Changed Events" such as DL_Up/Down events.

> Instead of disabling hotplug, mark these controllers as not supporting
> command completion by setting the No Command Completed Support (NCCS) bit
> in the Slot Capabilities register. This prevents the PCI hotplug driver
> from waiting for commands completion while still allowing hotplug-related
> functionality such as Data Link Layer state change events.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 67a16af69ddc75fca1b123e70715e692a91a9135..a2924610f3625f2456a491473c135840e31bafb9 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -358,7 +358,7 @@ static void qcom_pcie_clear_hpc(struct dw_pcie *pci)
>  	dw_pcie_dbi_ro_wr_en(pci);
>  
>  	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
> -	val &= ~PCI_EXP_SLTCAP_HPC;
> +	val |= PCI_EXP_SLTCAP_NCCS;

Are you sure that this is the only non-supported capability? What about
Attention, Presence, Power Fault, MRL etc...?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

