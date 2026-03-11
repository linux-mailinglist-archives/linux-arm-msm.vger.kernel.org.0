Return-Path: <linux-arm-msm+bounces-97026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH9IFliHsWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 16:16:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D1526644A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 16:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD865308744A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0CD30C602;
	Wed, 11 Mar 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzduROdM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D44345758;
	Wed, 11 Mar 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242072; cv=none; b=KF9f+BCxL85KpCzZvaLlAqGufJVyCfuyrOiwMBFUmic1tvlA4CtUDZbbzabDzH9/4ieU4S7z8pTiOC0GuT5gxtmrL4avLzSGsdFNFPaTAa1V6KXA8rfOxEZsADhfxqQTyCBgJ7KzTdBr6SBd1GE16eQMfTB48PTxofisxTPBKVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242072; c=relaxed/simple;
	bh=6G03Vmq9qwAjWyaMz8DPlElYYLptRloaQTWWkg09UaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGV15xdzCow/IrdeM5GnAmq5g/SEvTXlFk+yA0dunZtifFGgNk4UsbA9ENSZOX1Eu9YHdXpQmDTfhXE9nVCWrjQitmeTntuuwXrzpHlvVWsO6y67Mmw67qu7498LpqFsCb1d+C4hFGWSHRbnd4x8Y5+NCsKGxeFNudf6aHphD/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzduROdM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545D8C4CEF7;
	Wed, 11 Mar 2026 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773242072;
	bh=6G03Vmq9qwAjWyaMz8DPlElYYLptRloaQTWWkg09UaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NzduROdM4NtDkaC97uFQCxBxcQk2+/sdIAEDxDo46Sa1HI+QkJr/W69c2Ir2IcqT8
	 yDFVqxVG6Uoy2C1u7z8hbctT5e6H4204OSpR7P4iULIE+LNSCndBNOIlZ0dDXL8MlQ
	 l4WIr8beXU+M/Luz551S9xo13BT7i3wJ96J0SEPoSvzwaHCkwyUbIDiq2XIy4jfYuz
	 6lmGZwceMWkMXv51jWNVTUZo9r1cbbfyd0lp6Nu0cpBU+Bp0/EqnBMeyriu5GpJ1GK
	 ZQDhBsPe9f31JSjasOZkllQzRP2VjuZ7cfXP+Wwfto/f9PR5NPTFQ2Q6BSl5Ll9Fqa
	 0LqOaXelYUCfA==
Date: Wed, 11 Mar 2026 20:44:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Brian Norris <briannorris@chromium.org>, Wilson Ding <dingwei@marvell.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <srdn3bspgwff7f7tnst7wzg4us4buifrv7o3ylo527hmuciyl3@6ioyrl6rfhaz>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <abFMa6DCGGLUHddA@fedora>
 <dp2rem4gj7zhfgykvekmcrhq4ticm6m6ido6tbgflwzfcuuwkl@4wuxgle27eyx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dp2rem4gj7zhfgykvekmcrhq4ticm6m6ido6tbgflwzfcuuwkl@4wuxgle27eyx>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97026-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de,nxp.com,chromium.org,marvell.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5D1526644A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 08:09:53PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Mar 11, 2026 at 12:05:15PM +0100, Niklas Cassel wrote:
> > On Tue, Mar 10, 2026 at 07:31:58PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > Changes in v7:
> > > - Dropped Rockchip Root port reset patch due to reported issues. But the series
> > >   works on other platforms as tested by others.
> > 
> > Are you referring to
> > 
> > ## On EP side:
> > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > 
> > Then running pcitest only having 7 / 16 tests passed ?
> > 
> > If so, isn't that a problem also for qcom?
> > 
> 
> No, tests are passing on my setup after link up.
> 
> > 
> > There is no chance that the patch:
> > "misc: pci_endpoint_test: Add AER error handlers"
> > improves things in this regard?
> > 
> > Or will it simply avoid the "AER: device recovery failed" print?
> > 
> 
> Yes, as mentioned in the commit message, it just avoids the AER recovery failure
> message.
> 

I also realized that Endpoint state is not saved in all the code paths. So the
pci_endpoint_test driver has to save/restore the state also. But it is still not
clear why that didn't help you.

Can you share the snapshot of the entire config space before and after reset
using 'lspci -xxxx -s "0000:01:00"'?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

