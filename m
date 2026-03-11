Return-Path: <linux-arm-msm+bounces-97011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCikH/95sWk2vgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:19:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263F2654DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03362301060F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152A936E472;
	Wed, 11 Mar 2026 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7wEdddL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E585836DA08;
	Wed, 11 Mar 2026 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238779; cv=none; b=Q1HIyBtHub3WZd6QquO5KC00j8x8kOJ4iDLSS4wP6tXB50TpqjJPl2Dl4qt/Kz+uuL8R+KOHVkhm5D62ymMZ7wbgpYxxHkDIAKoXABFEL/Tx/kDabJliJR5wAPewg5ZVV4C+pBRoiX71tZvhblO0NZHiKo7WrGU/OEPfoMEBGaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238779; c=relaxed/simple;
	bh=4rspw70lAXPaOuNzAVTpF3DEdU6++Hs8qNZtz9nP5TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKIuKEL5+Tdms9a6tJgcvWuhdR1fdukKDOhE8zt9xUAGbcBPSf3Cxd+dNF/aFRALwmtaobiD5FvT9i9357ANvmDJDsAlTDF5b4p9Nx9ULJ9PRr0D+AB4r8FOUOn1AXc9X0Xm53LLn5MBzjQXj22a8Jjhg0hcwxDuJv+yivLMBDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7wEdddL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B07C19424;
	Wed, 11 Mar 2026 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773238778;
	bh=4rspw70lAXPaOuNzAVTpF3DEdU6++Hs8qNZtz9nP5TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7wEdddLJiDMDeFh9fRzF+0AA/jXYO0kBBjbzURmzLnta3Acyr9OALzeu3zxpMSGz
	 ZrjGvpciOTY4AuauFhvmS3Wy3ddEbuZETYuOSCzwcRrzzlbKYSdame0ojFrSrdvEBJ
	 vVrnwnGdPwejHqQtOF00rp1scWaAMrnV3hg8RYSkNXHwB6li0T02sarbLcTMsTlC6Y
	 IjWWtjC1KHZZmC7w1VB9Lg2H0+V6dAXzPndwp63I3ERDG8PIVGK/5eQnXaVXcglpvC
	 /MayvYHwZ7hYB9D7x0mFv4UhX1G4EdDHcCODregjf3maJAIZNh4R4ysMR3ky/ZNwNb
	 4gJZ0556zKdUw==
Date: Wed, 11 Mar 2026 19:49:23 +0530
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
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <hof7aknmmkeug6et7cj3zrwpj3cu77bofqllm25numelratbg6@pfiep2xaqlbd>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
 <aHokdhpJUhSZ5FSp@ryzen>
 <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
 <aJ743hJw-T9y3waX@ryzen>
 <lakgphb7ym3cybwmpdqyipzi4tlkwbfijzhd4r6hvhho3pc7iu@6ludgw6wqkjh>
 <aLmcO8ukT-CDZMuT@ryzen>
 <mevtdhght66tds7yhmr5a6xg5a75fb667b6lyvguoxqexmc74p@mroqidhzptxk>
 <abFLGRn9TYrsycRs@fedora>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abFLGRn9TYrsycRs@fedora>
X-Rspamd-Queue-Id: 1263F2654DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97011-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 11:59:37AM +0100, Niklas Cassel wrote:
> On Tue, Mar 10, 2026 at 07:07:39PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > I tested your patch series + your suggested change above, and after a:
> > > 
> > > ## On EP side:
> > > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> > >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > > 
> > > Instead of:
> > > 
> > > # FAILED: 1 / 16 tests passed.
> > > 
> > > I now get:
> > > # FAILED: 7 / 16 tests passed.
> > > 
> > > Test cases 1-7 now passes (the test cases related to BARs),
> > > all other test cases still fail:
> 
> (snip)
> 
> > I guess what is going wrong here is that you might be rebooting the device
> > *after* restoring the config space in 'slot_reset()' callback. So all the
> > previous config space contents would be lost and the device would've started
> > afresh.
> 
> I'm confused.
> 
> # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
>   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> 
> Will not reboot the device.
> 
> 
> > 
> > I don't think we can restore the config space after rebooting the EP device,
> > because host has no idea about it. It can only restore the content after
> > recovering the device through platform specific means.
> 
> Am I missing something, or why are we talking about rebooting the device?
> 

Sorry, I just went with reboot scenario since I remember you referring to it in
the thread. But I must admit that I didn't read your repro steps where you just
write to the 'start' parameter.

But I did test with toggling the LTSSM alone on the EP and was able to execute
the test successfully on the host. So I'm not entirely sure what is going wrong
on yours.

I need to look into it more in detail, but I do not want to block the series
from getting merged due to this.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

