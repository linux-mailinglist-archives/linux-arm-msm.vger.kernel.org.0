Return-Path: <linux-arm-msm+bounces-96152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCBIEzB+rmlfFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 09:00:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BBE235294
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 09:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AC0F3010B72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 08:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2781F36AB73;
	Mon,  9 Mar 2026 08:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNZItq8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026B33644C5;
	Mon,  9 Mar 2026 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043245; cv=none; b=iEJNIZOkjJ4o9p1uRTEyVaK222dBhiyvo79qeMSpaDq8/l3qRXRwVBsT/iDiF8W6Vcmn/VeM/XyW8MvTuBv5ehSvM6XuMfY6QooOqvmnz9F0wYLKHtRBPp8VzQz8Ro+a65JSvMF6F8BrWJ+TYvGm6wVAjMgcXXiTxEecPdVbki0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043245; c=relaxed/simple;
	bh=oLICg3wmajRFE766zc5v+Mhsl02mz5h3ToNTDdVSp04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lElYhWhwYZxjsYkBx/XYfUJ1WgZjTCg3ZUefHSZ+pTp+x4GpXiH+sU2m3OD1iudqdCqQFRof1zb5TO4qN84X1vcE5oeTiZK81v9cN3IqLFkiAauTMHiLvOVsWaCprBiJB/VRaIWjdttDVv4qTNg798zpict8rXIvtoSsPKHXZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNZItq8L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09CEC4CEF7;
	Mon,  9 Mar 2026 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043244;
	bh=oLICg3wmajRFE766zc5v+Mhsl02mz5h3ToNTDdVSp04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNZItq8LwmKUyF4EsMYfZzw79lQvEZA1PoAqpBMqbYmGVknRBToRujRDKh6Ep4Csh
	 7tpZ+lWDOH1+lfes2lAtWo8E8mb7XSLrUspgSZuiyeJdMDX8h+FQktz7PZZF1T25lJ
	 uACXhUtIhn54ju06Ox37MB4fbfLeXj/G/KflaUyci8mylZHqMmJqgZNArwBJ6t83HP
	 +ji9lZ0aQQJIPvusqwCq22ogl7M502qvPO0+2PuWChQ4mMJGH6LfGAXsdhuF+J6RmM
	 rBi2SCB9AgU2x6l6VsvNUWrbrxXP0lXmwN7v77tVA0KDh+Q7QJ2Vp4TzMh5TbvnyHz
	 r73zDPAlQdt7g==
Date: Mon, 9 Mar 2026 13:30:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>, 
	krishna.chundru@oss.qualcomm.com, Bjorn Helgaas <helgaas@kernel.org>, 
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
Message-ID: <y6ssm2pxybi26r54aszgsksg7pijnnqkmrut26lwgw2iawihu7@sw7ctkze7yni>
References: <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
 <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
 <a5m4pqtiaxsq5lmq64roro633ganbeq7mypa5ojuuqy4npkvok@wcogdbzaq6xe>
 <7157c68e-97f3-43b0-bfb5-e271a8f2a4b8@nvidia.com>
 <cf1e685a-a1cb-45ec-bdc3-1ef1a3d1044e@nvidia.com>
 <npt2cgwksulq5375dzlhszqaqrurgdvlkz6fdczer6shglqfg5@gp6a6xymymww>
 <26ad62ff-4972-4b29-8f9e-1868cd20ee00@nvidia.com>
 <kkly3z4durpagtenadvmzdpojlctachgfgi2fdapt6zthdl2gx@n2qhmlud2zb7>
 <3a0ddcfa-9fe6-4744-a9e4-016c43f9400e@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a0ddcfa-9fe6-4744-a9e4-016c43f9400e@nvidia.com>
X-Rspamd-Queue-Id: E9BBE235294
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
	TAGGED_FROM(0.00)[bounces-96152-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,oss.qualcomm.com,kernel.org,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.972];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:03:35PM +0000, Jon Hunter wrote:
> 
> On 03/03/2026 16:17, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > > For Tegra, we enter a deep low power state known as SC7 on suspend which
> > > does involve firmware. Nonetheless I tried for fun, but this breaks suspend
> > > completely.
> > > 
> > 
> > Ah, this explains the problem. We also have a similar problem on our Qcom Auto
> > boards where the firmware completely shuts down the SoC and puts the DRAM in
> > self refresh mode. So NVMe driver never resumes properly. We tried multiple ways
> > to address this issue in the NVMe driver, but the NVMe maintainers rejected
> > every single one of them and asking for some API in the PCI or PM core to tell
> > the NVMe driver when to shutdown the device during suspend. But this turned out
> > to be not so trivial.
> > 
> > Another way to workaround this issue would be by calling
> > pm_set_suspend_via_firmware() from the driver that controls the entity doing
> > power management of the SoC (firmware). In your case, it is
> > drivers/soc/tegra/pmc.c?
> 
> Actually for newer devices it is PSCI and so ...
> 
> > In that case, you can use this patch as a reference:
> > https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com
> 
> This change fixes the problem as implemented. What is the status of the
> above? Any plans to get this merged?
> 

It didn't get any love so far. It'd help if you can give your tags to that
patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

