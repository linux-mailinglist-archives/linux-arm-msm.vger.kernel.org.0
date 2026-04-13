Return-Path: <linux-arm-msm+bounces-102872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGyaOy2D3GnnSAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 07:46:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6B3E78C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 07:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 450DE302A6E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 05:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8888630E83A;
	Mon, 13 Apr 2026 05:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7NP7T/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6545D30B533;
	Mon, 13 Apr 2026 05:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776059069; cv=none; b=u881qC4bs/5xxol+E5IIlWv6hGKRUiLXCJCbAK867F67wCoMPw86Hb60z1KBewMuJob2xOh0cDq7gX2Pebro/487gPpohnDXojbEKNDRdKl31tchrUsLB6RhA+DxNVLYTUq3cAJi2rU1VDreqLTg6qIJpUvc0J3mhVzczcpAQyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776059069; c=relaxed/simple;
	bh=zlDVuvJqXaiDKgXyxHwnnUhN6t7BWFG/My3/a+C3l7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCBeAM+szDe4j7iAp9MBKBWdgVWKRrxh3BgGQFdaZrR51+BQmEJDr7oQh0nAERAJ3bgWH9DEKymafZf2p0HK978NohjzBMeRuyftEbxF3hnFPReXVnMh4yCYvtJbfV6Vl9CFPGnT8v1JBByqFy5LaHxAmXib8wg4Apnq3ctZX60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7NP7T/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59351C116C6;
	Mon, 13 Apr 2026 05:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776059069;
	bh=zlDVuvJqXaiDKgXyxHwnnUhN6t7BWFG/My3/a+C3l7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7NP7T/VQHmB5D+9AsoIAYuMP+Iau7xJXFfw0xHuYdC/yRKxWCclR6GQlzJ1FU05W
	 CgaoeuCLmDvM0wcE9Fkr+ZEgMaBT6eF1aP53lQDmma8F3JyZ6XZzxg2iU1BXs2Olau
	 72hdAnO4O3jPvIlRfS4iraS56tBoidzty9zom1gjazmJl63NXsyLTcMtGO12jsmHzx
	 2HMP5CwKtZyI6Y0kVULSWKa339UMP/ND269jXHT/S1cOPRcjb2zotSmNykWnLFg0oh
	 SH62XnJ1XpkOGHMIYEwtu9RPU2Eg+GZUlEDTp04yOJ12dstziuf0k0J3Rsa7XJrCg5
	 7LCV/rQZwHKQg==
Date: Mon, 13 Apr 2026 11:14:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Richard Cochran <richardcochran@gmail.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>, Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>, 
	Vivek Pernamitta <quic_vpernami@quicinc.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] bus: mhi: host: mhi_phc: Add support for PHC over
 MHI
Message-ID: <j5gq447bj2adpa5qcnmd4psxta7zfp4wrdodwwu76olqehk35p@vqsxtut4ipxs>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
 <20260412080951.723295fa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260412080951.723295fa@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102872-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,lists.linux.dev,vger.kernel.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 53F6B3E78C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 08:09:51AM -0700, Jakub Kicinski wrote:
> On Sat, 11 Apr 2026 13:42:00 +0530 Krishna Chaitanya Chundru wrote:
> > - User space applications use the standard Linux PTP interface.
> > - The PTP subsystem routes IOCTLs to the MHI PHC driver.
> > - The MHI PHC driver communicates with the MHI core to fetch timestamps.
> > - The MHI core interacts with the device to retrieve accurate time data.

This is a misleading statement. Only the 'pci_generic' controller driver interacts
with the device for querying timestamp. MHI bus just acts as a messenger.

> 
> Nack, stop adding functionality under the mhi "bus".
> Bus is supposed to be an abstraction into which real drivers plug in.

MHI bus is very similar to the PCI bus. Just like PCI capabilities, MHI also has
capabilities to discover the supported functionalities including timesync. So
for making use of the timesync feature, we need to add some hooks into the MHI
bus layer, but the functionality is added to the separate driver,
'drivers/bus/mhi/host/mhi_phc*'. This is also quite similar to how PCI(e)
features like AER, hotplug are structured.

In this series, timesync API definitions are added mistakenly to the core bus
code, which should be moved to the mhi_phc driver instead.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

