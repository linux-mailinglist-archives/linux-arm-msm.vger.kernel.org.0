Return-Path: <linux-arm-msm+bounces-119051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fvBsHNE/Vmq92AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:55:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B16075563B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:55:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BkJkt2q7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119051-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119051-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31CE9300F15B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB4C47AF56;
	Tue, 14 Jul 2026 13:55:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F7B47A0D8;
	Tue, 14 Jul 2026 13:55:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037322; cv=none; b=rDfBdnjSbl/4SLTH6GNNQP3Dn7nv/jHEm9mo5hQ+ihZ6eG0FcC+eTUs4avXHXpp+yytTv9BlVGpj7ubm1xxLuT5XjTzN4oejHj/8ccZ+LLc9RmOd3IYRLIS8HdETHNnLwRY5AgK8apw+SNS4gPXDJ2bp/Bqc98x/fz7CxbJgyl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037322; c=relaxed/simple;
	bh=cmc/aIuMjg9PV2KGS2UBuRJTHpKXuzpAISPFbH/wEv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5IqMnQBCmGUa4wCaJXV+CqSG3Y4KPrqXvRxZbgu+4pR4uZarr6MJKl1gDywGohvXPajZSknPqYLlxZ6X38IB5KLia9BTgA6aqPyySgDxRWtnpKWjZtnd5/tDsx377CUE13zsfX/nrtZkzPwzRi71mRyF5uFG7GrrkNM/4KkH9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkJkt2q7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35641F000E9;
	Tue, 14 Jul 2026 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784037320;
	bh=K8IJldkTRt1FtCS6EIP1M86hblVqMCHFadZ/rYcCp+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BkJkt2q7S0wulWdSwiZKqTT5wLEy0JHO+mWFnc/rzCLfIuOpN1DOWYExJAaq8IfNV
	 Hnujq+T+5gSr3znYik66PQ6m/Jbm+jfcNj4sSlx38/WCOs2KQpgB/6rbKdg9gqtND7
	 GqdrvZ75bwi0TLKal/mHomTLtoV4dT+thdPIF4MIgiUj2I4x8VxLyABjTbh6glQKQe
	 E1uIaPEme1bVCkuteu/0P2RbQ+kciK+xDKx44K6SmlUaKYZyEdsYcKPZ4b1b2o7My6
	 qmN/H1CvsTRam9d+HYR1hv6bWJU1YkbFtkVqeqt2FuWg0oPNJb5knvrmyJE18zFwG2
	 guL5jmwAuIcWg==
Date: Tue, 14 Jul 2026 15:55:12 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and
 WCN7851 UART BT variants by subdevice ID
Message-ID: <tctgytskrycxiybavlq4gb2gt2xe7hqegsu6g4pms3vl5k4g6z@bl5us2yyk7iz>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
 <20260709-fix-hamoa-m2-w-disable2-v1-2-5e725091266a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-2-5e725091266a@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119051-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B16075563B

On Thu, Jul 09, 2026 at 12:59:41PM +0530, Wei Deng wrote:
> The WCN6855 and WCN7851 combo chips are available in M.2 card variants
> that differ by their BT interface: some expose BT over UART while others
> expose BT over USB. Both variants use the same PCIe device ID for the
> WiFi interface, distinguished only by their sub-system device ID.
> 
> The bare PCI_DEVICE() entries match all sub-system IDs, so both UART and
> USB variants hit the same table entry and trigger UART serdev creation.
> For USB variants this is wrong — there is no UART BT interface on such
> a card, and the serdev probe will fail.
> 
> Narrow the matches to UART variants only by using PCI_DEVICE_SUB with
> their respective sub-system IDs. USB variants no longer match the table
> and will be handled separately to deassert W_DISABLE2# for USB BT
> enumeration.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
> index 83fe6a1396bc..cf51122d54fd 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -191,9 +191,11 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
>  	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_QCOM, 0x0108),
>  	  .driver_data = (kernel_ulong_t)"qcom,qca2066-bt" },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_FOXCONN, 0xe105),
>  	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_QCOM, 0x337e),
> +	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1107, PCI_VENDOR_ID_QCOM, 0x337c),
>  	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1112),
>  	  .driver_data = (kernel_ulong_t)"qcom,qcc2072-bt" },
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

