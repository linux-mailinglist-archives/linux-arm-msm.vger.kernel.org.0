Return-Path: <linux-arm-msm+bounces-118637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yZ0+KbSBVGr3mgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:12:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6E747740
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:12:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SnX3Lf7x;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118637-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118637-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2433F30209C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B689686334;
	Mon, 13 Jul 2026 06:11:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A083B364EB8;
	Mon, 13 Jul 2026 06:11:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783923075; cv=none; b=SOyuyaX8/1FLA656qbRAlJTPcSLYDxYcN5ZMk7ktRcKS7OXIHh3XfT2vy/dv6TMYZaTg8cWO+w8dlubChhP2+wv2Krc14FtRQS9q2E8S653bxNhdzWlvh1bYCpzA6MMzHIKEt5XtBrEMRp1Ok5LmdnWu+VliOWeAuYpwtUg0rgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783923075; c=relaxed/simple;
	bh=QrZwPaqYxIboZr1IH8RJ676WxJCYgZ7kCC51lTExVAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKx9VPc8pMw9FX36BhrshjZapYCCtkuG4/6Sre9oaR2BrxRcGiUVPU7iDpK3cKTax0vnBnT02zDzWKOTPopgDxyQTUpI2m23WM4wfEYsQgEuH5+uuGZcfeFl6BBKoC3PN+YPKyOjvieZkos9SV01k2ZdiJ6jvuVjU2Ev+5q62sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnX3Lf7x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C681F000E9;
	Mon, 13 Jul 2026 06:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783923074;
	bh=FC3GCWIdHPrqLtIt6VcpJQky7T5wHRBMbXEtkx/sRMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnX3Lf7xlLu64oUZdDOtqyYh6QGdhkucO17E9AWIXYQEApENFv5BEEM6xvvn05njH
	 n7nXqdpuK2jF7ZVNLpz14mWYN2GoHTVWM7RxeF7zhbC73/lYp4DWAHJlVqP+Msre5g
	 zWFDtuMkvofayUAZ0ypv86JyyI95taNk7+cgdEtCXdK+Fo4FDmyWTCdgXlMro8y2d2
	 Rr7yzZs/U8lo11qsq8z4h6EhdrXAte+rWxirMqAoAgCCkPnZgvscQ8tG33r8EFg5Jq
	 0AxFBavVK2smwSOt7WDcav2tRopIiZicfYWw4nArVhXOc8QhaDteCmPnYlKWLvrqvx
	 v6XuenO5ZOP/A==
Date: Mon, 13 Jul 2026 08:11:06 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Clear Attention Button Present in Slot
 Capabilities
Message-ID: <so4hbumfghvbknjcefxaiqmjx6bnqgtpxri26vhpqqyyjguj7k@r6vtwkhuoqjm>
References: <20260710-clear_abp_0710-v1-1-efd63ebdaa09@oss.qualcomm.com>
 <20260710173056.GA966003@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710173056.GA966003@bhelgaas>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:qiang.yu@oss.qualcomm.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-pci@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118637-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,r6vtwkhuoqjm:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01E6E747740

On Fri, Jul 10, 2026 at 12:30:56PM -0500, Bjorn Helgaas wrote:
> On Fri, Jul 10, 2026 at 06:20:57AM -0700, Qiang Yu wrote:
> > Qcom PCIe Root Ports advertise the Attention Button Present (ABP) bit in
> > the Slot Capabilities register, but the slots have no attention button.
> 
> I'm a little surprised that this would be hard-wired into the RP
> instead of being some kind of strapping or config option, which would
> allow the SoC to be used in platforms that do have Attention Buttons.
> 

For supporting Attention button, we need either one of the 3 mechanisms:

1. OS native: Some entity detecting ATTN# and injecting hotplug event to the
PCIe RP. This requires changes to the SoC design which is not present.

2. OS native: Some entity detecting ATTN# and notifying OS through an OOB
mechanism like GPIO event and the handler manually calling pciehp APIs. This
requires changes to the pcie-qcom driver, which is not present.

3. Firmware first: This requires ACPI and none of the Qcom Linux implementations
support this.

So currently there is no way one can add attention button with Qcom SoC designs
with upstream kernel. If such requirements arise in the future, then we may need
to conditionally enable ATTN# on those designs.

> If it's actually hard-wired, this might be OK.  If ABP could be made
> to work in hypothetical platforms that include it, maybe this should
> be based on a DT property?
> 

There is no DT property defined in the dtschema for ATTN#. If the requirements
arise in the future, we may end up adding somethig like 'attn-gpios' to the RP
node.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

