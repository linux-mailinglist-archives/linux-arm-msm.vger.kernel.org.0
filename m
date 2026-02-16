Return-Path: <linux-arm-msm+bounces-92966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED2iFU0nk2kI2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:18:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8081447AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 401E4300820A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D299D30E0EF;
	Mon, 16 Feb 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNteKzPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EE1E32CF;
	Mon, 16 Feb 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251527; cv=none; b=Os7V3vx2pUIQkKqGeJQ9KllIB6y2BH63bvq6hy/R7I3uzV3AjutA2Iw3vacuU0TKq7CPnQnYeiGKh3HCLJeCC0/hGBjTeddFOF0mm/KUL25wgwecEYDo/cHpcf5mCMEyHVRKGGdNEZjvKZ4FTZsQrxgRBZx433BDQID/AgA5EM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251527; c=relaxed/simple;
	bh=CfIWmaZkrAZk8PVU0AZVyy1S65UC0yPAi8eNlapkYBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fObgN//4BAPPNng5u/bpq3REBiAyO637ykv4ByiSE7uxUuhVW0jJ8eh73jt6MAlC5zbRFOQ3i/Q45u91UjGbZl9R6gaC5vrM4e2hAravRctPBI+LFtNxLhuyI3xldIEuMRDcCHS8jxFz5lDqtLVZlr8HWQz6wrGAcT3SdA3oc8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNteKzPp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366BFC116C6;
	Mon, 16 Feb 2026 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771251527;
	bh=CfIWmaZkrAZk8PVU0AZVyy1S65UC0yPAi8eNlapkYBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNteKzPpF24LWwhEutpLVXWPBpURfnvoKF/IcZF0UIZvx9YYoMN9r1sWBkdLidrXe
	 d8h32av/x8K2vm5ht36ItHCo28dTmDeLmQbmk6i8pI9O6ufs88Lg+WLVRkiVHcdlnN
	 Y3dH6lQ+3tdAFgJup0vFyvTy6WN3T6sNZSJvaYvUiiy3q5jq1TicbZrMVSFpGMPbSn
	 5nb8asse2sAb7ddAq0dIpNnW/s2QS+LWW0epjJ7wTAq3z5S8evfe+lglCsT6QLXDMi
	 nNBwkVQNYVweElqk0cyp5iSulJccztcGA9C1SN0JkqjJI/c864I9wH/yBH3zgkTdtP
	 57xe2JI332Iig==
Date: Mon, 16 Feb 2026 19:48:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: krishna.chundru@oss.qualcomm.com, Bjorn Helgaas <helgaas@kernel.org>, 
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
Message-ID: <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
References: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92966-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC8081447AA
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 02:03:41PM +0000, Jon Hunter wrote:
> Hi Mani, Krishna,
> 
> On 23/01/2026 13:56, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > So to properly fix it, we need the controller drivers to perform below checks
> > for all devices under the Root bus(ses) before initiating D3Cold:
> > 
> > 1. Check if the device state is D3Hot. If it is not D3Hot, then the device is
> > expected to stay in the current D-state by the client driver, so D3Cold should
> > not be initiated.
> > 
> > 2. Check if the device is wakeup capable. If it is, then check if it can support
> > wakeup from D3Cold (with WAKE#).
> > 
> > Only if both conditions are satisfied for all the devices under the Root busses,
> > then the host controller driver should initiate D3Cold sequence.
> > 
> > Krishna is going to post a patch that performs the above checks for
> > pcie-designware-host driver. But since the above checks are platform agnostic,
> > we should introduce a helper and resuse it across other controllers as well.
> 
> 
> Do you have a rough idea of when you will be posting patches for this?
> 

Krishna posted the series a couple of weeks before but forgot to CC you:
https://lore.kernel.org/linux-pci/20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com/

You are expected to use the helper pci_host_common_can_enter_d3cold() in the
suspend path.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

