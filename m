Return-Path: <linux-arm-msm+bounces-98622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T0LjKZSJu2m/lQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:28:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF32C636D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8DEB308A415
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D94737AA79;
	Thu, 19 Mar 2026 05:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LESB49MS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037A81E0DD8;
	Thu, 19 Mar 2026 05:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898130; cv=none; b=Hzf81u8Uf0EDp2Bdo9XtwG+8j8YGvqmUN2hNNXZcgYPj51n139imThgQS0edQMDLPhAFIT2RPKrMNcii/Hb0JF3M1FVnPWBmrtjzmZtfykFnjCXbtqQqQn4ANQQW5uKC0P7JFS7nk5L+A3B2zDv425bSGc+zrqinWauafd6tIuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898130; c=relaxed/simple;
	bh=/d3H9UINI1sBsj7nMaWrhvor6fo5T01VF8kw4+FAP9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0RLBp7vawG/ba0MjwjRziVRpi1ZdJ7VHs4Q/HmDrBMC2v2Eb1SpGVX6WCcrimMOS3q7PLoyzstRZCVAwVr1LAwfxqiaUQi4zwTcs2MOCMGDnfmf/SYptLxfHZ98rKz+bkP6SrNg6YM5lVBHBJyxFvSXziGH/EtgFn39DsuuuNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LESB49MS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9420C19425;
	Thu, 19 Mar 2026 05:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773898129;
	bh=/d3H9UINI1sBsj7nMaWrhvor6fo5T01VF8kw4+FAP9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LESB49MSO3MpUDi9I/FQK93Yf6VmX+GTybl/jjFJi8QapmPOP0lH/jEFlnQZ6fa5i
	 05GblLqg7RD/C/IzHr4OVOofI30XZyD9Z8a7DCddd7JoZgBZhJxOQ5z+jxul01XX+x
	 TZ47BcpPhY+dBoa0QJOAuJIY/n+DMenu+esmiZltzwgp/8PaYRxa7ISsVwOZmCVAGK
	 pX8hV9/ZaTbndFhUb4lr/GJrKm8eDDowpDp4I7HNpEVDfbVHEiLPyLa6yY7cpPzQ2h
	 uqO+eQw8igIE58qsMaUK/o1UzDfQPk1mZudonuUkY7qR7FpeWXUeHNNqj+8HYwc2nm
	 2fqDc/sAvLvDQ==
Date: Thu, 19 Mar 2026 10:58:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com, 
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: hamoa: Move PCIe PERST and Wake
 GPIOs to port nodes
Message-ID: <f5vqy4tfhfxeu4li33qffjzrlgqgbflidds35qdni3trdoues2@kvuzjxenrdff>
References: <en5a7jrgpbn4bsmw5qwprugb2qmjkqw2x5eey6jxxu63634duz@b43rhcsqkj3o>
 <20260317171319.GA90412@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317171319.GA90412@bhelgaas>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98622-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0FBF32C636D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 12:13:19PM -0500, Bjorn Helgaas wrote:
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
> > 
> > This is not related to the driver change. The driver correctly
> > parses all Root Port properties either in the Root Complex node (old
> > binding) or Root Port node (new binding). But commit 960609b22be5,
> > left converting mentioned board DTS to the new binding, leaving
> > those affected platforms in a half baked state i.e., some properties
> > in RC node and some in Root Port node. Driver cannot parse such
> > combinations, so it fails correctly so.
> 
> The commit log mentions probe failures on some machines.  I'd like it
> to be more clear about who is affected and what they need to do to fix
> their machines.

There is already a list of affected machines mentioned in the commit message.

And for fix, they just need to apply this patch. Or once this patch gets merged
into v7.0-rcS, v7.0 will have no issue.

>  If it only affects developers who generated DTs based
> on 960609b22be5 for internal testing, we should say that so it's clear
> that no end users will see any regressions or boot failures.
> 

Whoever have included commit 960609b22be5 in their kernel and using the above
mentioned machines will see the failure. But looks like no one really tested
v7.0-rcS on these machines as we haven't gotten any reports so far.

> Is there some way to verify that after this patch, none of the
> generated DTBs are in this half-baked situation?  Some kind of
> automated DTB checker?

I sent out a DT binding series [1] that was supposed to catch these issues
during DTB validation phase, but unfortunately it got stuck in the review. I'll
try to stir things up.

- Mani

[1] https://lore.kernel.org/linux-pci/20251106-pci-binding-v2-0-bebe9345fc4b@oss.qualcomm.com
-- 
மணிவண்ணன் சதாசிவம்

