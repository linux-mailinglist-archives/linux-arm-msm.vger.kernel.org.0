Return-Path: <linux-arm-msm+bounces-97828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNa5Lg93t2nxRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:20:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D012945E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92911301CF88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E291731E847;
	Mon, 16 Mar 2026 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFB/n1fK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD852C2EA;
	Mon, 16 Mar 2026 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773631223; cv=none; b=ajHwBLQGxSaE0isVztNpluaOoPa+M2Txba48FUrgfQK0xUodB1okjTL7V3FnMzAE+kYNoRHDSUrAvqKnAVcxWMYkrqxZYM9kYRT272i71ZpdxW4mTIY9qFE2wcYcAImQzk7Z1X3VyzFQj8DFh8jACd9Y7xbFCaokkthXLpqgr4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773631223; c=relaxed/simple;
	bh=WuPKft6M5fTY0DWTvg8L3sujWRNBfLJxZ9DjriMFQ6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ndz8Qr7KRz60ijEqKvxU+1YNWYywAZir4ZkHYn1PwG+DMw34pM5PmGuhIcZ4a42rumewTl1Y5Ykx5EBoX6w/jZtGXxajlrghpFTnYki+TC94FgtmZ90nLe9lr6hvZyzlCKqNwV84ko86fcffA840h2uKJg49vGoe9/iR7B3l3BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFB/n1fK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C959C19425;
	Mon, 16 Mar 2026 03:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773631223;
	bh=WuPKft6M5fTY0DWTvg8L3sujWRNBfLJxZ9DjriMFQ6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFB/n1fKO9ANP/cV5YTY7dm/pXdFYiuy0ANIcYtQIHeWDkppN1zEUdYi2Vk6fkcLY
	 a3F0ZOtfDrw6wZU5xrBh3mBDc+l0WO0N2NQLmiqMc/H0XjLcFUoCORBjXNfJzmJ25j
	 OqszTiZADEV7gOinRbunwZz/zxrUg7s0yWeteD8rSv9SGKdE5WHdZ4Ex5KVJdr5bKB
	 bmUCNuMPKMveenV5kTv3YVZVeW3dBs3uzO9aRfP2lUs5nJBXEGuWto/gW227xMUraI
	 IDDRS+R1giasf4gU6EpMXueiZRQiQ3SUlVGWBTvUgCsSNvPJCotm0ehUren3wzZHsD
	 qToE1CPis91Aw==
Date: Mon, 16 Mar 2026 08:50:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com, 
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: hamoa: Move PCIe PERST and Wake
 GPIOs to port nodes
Message-ID: <kqpgjzcxnazjohiop27exget6qrv37wn3csmixt5nmc6d5dkbg@n7qjo6flaabn>
References: <20260313094618.1361418-1-ziyue.zhang@oss.qualcomm.com>
 <20260313164542.GA1405513@bhelgaas>
 <en5a7jrgpbn4bsmw5qwprugb2qmjkqw2x5eey6jxxu63634duz@b43rhcsqkj3o>
 <abdviJbrluDn2Vrx@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abdviJbrluDn2Vrx@baldur>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97828-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 68D012945E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 09:53:33PM -0500, Bjorn Andersson wrote:
> On Sat, Mar 14, 2026 at 07:50:50PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Mar 13, 2026 at 11:45:42AM -0500, Bjorn Helgaas wrote:
> > > On Fri, Mar 13, 2026 at 05:46:18PM +0800, Ziyue Zhang wrote:
> > > > Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
> > > > GPIOs to PCIe port nodes and add port Nodes for all PCIe ports") did not
> > > > convert all Hamoa‑based platforms to the new method of defining PERST and
> > > > Wake GPIOs in the PCIe root port nodes.
> > > > 
> > > > Without the change PCIe probe will fail. The probe failure happens because
> > > > the PHY stays in the controller node while the PERST/Wake GPIOs were moved
> > > > to the port nodes.
> > > > 
> > > > This fixes probe failures seen on the following platforms:
> > > >  - x1-hp-omnibook-x14
> > > >  - x1-microsoft-denali
> > > >  - x1e80100-lenovo-yoga-slim7x
> > > >  - x1e80100-medion-sprchrgd-14-s1
> > > >  - x1p42100-lenovo-thinkbook-16
> > > >  - x1-asus-zenbook-a14
> > > >  - x1-crd
> > > >  - x1-dell-thena
> > > > 
> > > > Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> > > 
> > > Are you saying that DTs in the field broke because of some kernel
> > > change?  That's not supposed to happen.  Even though PHY, PERST, and
> > > Wake GPIOs should be described in Root Port nodes instead of the Root
> > > Complex node in *future* DTs, the kernel is still supposed to accept
> > > the old style with them described in the Root Complex node.
> > > 
> > 
> > This is not related to the driver change. The driver correctly parses all Root
> > Port properties either in the Root Complex node (old binding) or Root Port node
> > (new binding). But commit 960609b22be5, left converting mentioned board DTS to
> > the new binding, leaving those affected platforms in a half baked state i.e.,
> > some properties in RC node and some in Root Port node. Driver cannot parse such
> > combinations, so it fails correctly so.
> > 
> 
> Are you saying that above listed machines has broken PCIe support in
> v7.0-rc?
> 

I haven't verified it, but I'm pretty sure PCIe is broken on these platforms.

> It seems this is a (partial) revert of 960609b22be5, is this actually
> fixing that change, or is it only applicable once some other changes are
> applied?
> 

This change is fixing the issue in the respective board DTS and is a standalone
fix on top of v7.0-rc1.

> Where should this be merged?
> 

Qcom tree for 7.0-rcX.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

