Return-Path: <linux-arm-msm+bounces-104180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPBrKphe6WnJYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 01:49:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59544BDB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 01:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A287A300D0F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 23:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00BC3806C2;
	Wed, 22 Apr 2026 23:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wpbcaguo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C55734DCEB;
	Wed, 22 Apr 2026 23:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776901780; cv=none; b=stqQ1Lkcx5LQcRa4rr0csVCON6jwId5SsNKRdR4oggSaBS4sMUUhZfRpapsLsI1yYSXgL0ezEeMlh6XAYbYfNoyZfaR0KkYdkEK2GjxPuVheD3aduSpPiW2PlRhQ7NeS3k4gDJHDXGbxjSJv1TAxazKnJOrocE/AFrWvhaag8dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776901780; c=relaxed/simple;
	bh=MKSrCh2S3mr55uyV/Z12S+XkTvz5MBWMuSM4wQ/Job8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Pmr9uaF2LdOkNQmVRHRhhPIdFgpZx6vJE++YKVsp2hwRIy21RxsJStinSKIiOD5S7ALD3zOj/08kn/OLJsOoeDwjKsj3IpTztnRWT/REsUCUXk0VsbS7ZQFmL5UbQjzuWxpFoGYrN7eHa26RiIPEV3b/avDlP12ajfumm3rPTS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wpbcaguo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23934C19425;
	Wed, 22 Apr 2026 23:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776901780;
	bh=MKSrCh2S3mr55uyV/Z12S+XkTvz5MBWMuSM4wQ/Job8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WpbcaguohQuyurO8P9qtHx431iyqolN/sDurNKWaVcGWhWbZj/2Lc6Pv4nPkXoNon
	 AAE4IFmzh7tEK57XXFytVmCX4oVXszIKIsHRfbJ1Ei4SqPhvIdQ+lSzJgZ+wQstkDb
	 Qn5JiTXlcsFMNCN23gl6SFSmA+GRSGt3L88n4Uh0+tP5SkQszctAMq57O0E0XKOp+J
	 cxuFjkKosm8JZwkQqJUXjWTrfuk+8VEqOEUUZmrNEyJcdDnKc/oNTl4T3ufrpn1+mz
	 o4f3ipYA3UdzUWGTadg3O6uumqQYyjH8gMW6HsmnXR99yaBV4uXT1HzKPFYKFeUm55
	 3s2CzP2xqxfBw==
Date: Wed, 22 Apr 2026 18:49:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 3/4] PCI: qcom: Indicate broken L1ss exit during resume
 from system suspend
Message-ID: <20260422234938.GA416865@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bkejoqdchyv55efsyl7o6b3ewiwaj5kbc2hgltxt5vwqdvt5yf@cxvwcjo5zcrp>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104180-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pcisig.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D59544BDB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 10:41:08PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Apr 20, 2026 at 03:49:15PM -0500, Bjorn Helgaas wrote:
> > On Sat, Apr 18, 2026 at 11:09:11AM +0530, Manivannan Sadhasivam wrote:
> > > On Fri, Apr 17, 2026 at 05:26:15PM -0500, Bjorn Helgaas wrote:
> > > ...
> > 
> > > > Does L1.2 have to meet the advertised L1 Exit Latency?  I assume
> > > > maybe it does because I don't see an exception for L1.x or any
> > > > exit latencies advertised in the L1 PM Substates Capability.
> > > 
> > > As per my understanding, 'L1 Exit Latency' only covers ASPM L1
> > > state, not L1ss.  Because, 'L1 Exit Latency' field exists even
> > > before L1 PM Substates got introduced in r3.1. So it doesn't cover
> > > L1.2 exit latency.

FWIW, this FAQ from https://pcisig.com/faq?keys=3.0 confirms your
understanding:

  Section 7.8.6 - Is the L1 Exit Latency in the Link Capabilities
  register only the ASPM L1.0 exit latency or does it include the
  added ASPM L1.2 to ASPM L1.0 latency?

    The ASPM L1 Exit Latency in the Link Capabilities register
    indicates the L1/L1.0 to L0 latency, and does not include added
    latency due to Clock Power Management, L1.1 or L1.2.

> > > > Regardless, I'd be kind of surprised if *any* system could meet an
> > > > L1.2 exit latency from a system suspend situation where PHY power
> > > > is removed.  On ACPI systems, the OS doesn't know how to remove
> > > > PHY power, so I don't think that situation can happen unless
> > > > firmware is involved in the suspend.
> > > 
> > > Yes, you are right. Even for systems turning off the PHY completely,
> > > they should have some mechanism to detect the CLKREQ# assert and
> > > turn ON the PHY within the expected time.
> > 
> > What would the expected time be?
> 
> That's mostly L10_REFCLK_ON + T_COMMONMODE. But nevertheless, the
> system wakeup and controller driver resume() time would be far
> greater than it.

This patch sets "pp->bridge->broken_l1ss_resume = true".  I'm trying
to understand how we know to set this.  There might be other platforms
that need to do this but I don't know how to identify them.

This comment:

  + * Some host bridges power off the PHY to enter deep low-power modes
  + * during system suspend. Exiting L1 PM Substates from this condition
  + * violates strict timing requirements and results in Link Down (LDn).
  + * On such platforms, the endpoint must be prepared for context loss.

suggests that the L1.2 exit takes too long and results in the link
going down, which is essentially a reset for the downstream device,
which would destroy the context.

Is there some spec language that determines how long the Downstream
Port waits for the L1.2 exit before it gives up and decides the link
is down?

