Return-Path: <linux-arm-msm+bounces-97014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHz2Bql/sWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:43:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A461B2659C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97821303F045
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7B83C5551;
	Wed, 11 Mar 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/ZF8l4o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5FA3C4571;
	Wed, 11 Mar 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240010; cv=none; b=ZDcuby7PKH4W/954tOnTy3sR2Kw4YAH9fgksAvpX9yz10Oq5ShA0eTK1O8mUp4aXAfb0nayUFFJt135GUEQOz0Q993Evvywpyp00++EtaM7mPEwZwiAqMvGXuJzqsmCpFYZn7Tt9vQxQz+TKsztaXzHL2EtHu/eYx2NEPrYkClQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240010; c=relaxed/simple;
	bh=0zJ0HQFf1lzSS5LA2IFPSO9AkXjfgAxBGWOu+Mzp1PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdZL9kc9kWy3W6OQGVD6p22sa2Sg7TrAwkDMWf0t1UI/lYOCpXTAQ+lUzDtOE525yyvb4nHUtDSzJdIbA0uyCmEFms/8a737/AjNmYE8LiU+jtOssHchnWK5I1iGRflC9qB6egnR9Q8zQHOEDC6/rhkjr1F708Am3VwluH2iX1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/ZF8l4o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D62C4CEF7;
	Wed, 11 Mar 2026 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773240010;
	bh=0zJ0HQFf1lzSS5LA2IFPSO9AkXjfgAxBGWOu+Mzp1PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/ZF8l4o6TNAy+i+OxrOe0OLGywhNzKtVbVYp74L2z2TydeYuY3+X/g9L5dEUiYOT
	 yZUoISYDYPAj2StS7DHyURGWki4VbXGthWmYFwecKer1qiK+Ol0DMmRDBsZxDR/G/n
	 Qu14UDrbgrCgI523wcTEndr+Q5bpnKpKxh83hpon0c0fVoqpCfdvwQoWDxe7FDyVwY
	 zTjltTOCK6vw6u6YWicQm9DQ5nd6MOURmGxWLJoswyjTm2KD2SwG896Z8CXS8OWjMj
	 NtsZcxyNo1miOWcKlLG3k8k6jY06SDcow2r5lU+ZxY/1ym2GjQOsIIoxT/DfsFU3b1
	 DPpiGOOUXlNrw==
Date: Wed, 11 Mar 2026 20:09:53 +0530
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
Message-ID: <dp2rem4gj7zhfgykvekmcrhq4ticm6m6ido6tbgflwzfcuuwkl@4wuxgle27eyx>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <abFMa6DCGGLUHddA@fedora>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abFMa6DCGGLUHddA@fedora>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97014-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de,nxp.com,chromium.org,marvell.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A461B2659C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 12:05:15PM +0100, Niklas Cassel wrote:
> On Tue, Mar 10, 2026 at 07:31:58PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > Changes in v7:
> > - Dropped Rockchip Root port reset patch due to reported issues. But the series
> >   works on other platforms as tested by others.
> 
> Are you referring to
> 
> ## On EP side:
> # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
>   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> 
> Then running pcitest only having 7 / 16 tests passed ?
> 
> If so, isn't that a problem also for qcom?
> 

No, tests are passing on my setup after link up.

> 
> There is no chance that the patch:
> "misc: pci_endpoint_test: Add AER error handlers"
> improves things in this regard?
> 
> Or will it simply avoid the "AER: device recovery failed" print?
> 

Yes, as mentioned in the commit message, it just avoids the AER recovery failure
message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

