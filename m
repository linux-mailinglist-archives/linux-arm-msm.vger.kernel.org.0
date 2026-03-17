Return-Path: <linux-arm-msm+bounces-98240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDdgK7eMuWnkJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:17:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC472AF43E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FE0930535FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800F73F6610;
	Tue, 17 Mar 2026 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHT7mi1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5333F660D;
	Tue, 17 Mar 2026 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767601; cv=none; b=nSHLhPD7yQcfQ07ogDvu/npcggm0iW4tPwsc9dQFH5tJXXq6i/PbOwzmWS5A3WSIfxdjz0BNl0ZY6nW79CRImVGgNMbIhkyf6T6jX5IGe4fB1dl7Cb0KFwotU9L9u8A3tvTURpKm+cujO7fYeVZ4OxP8RT9vm/UnIkKp05PSLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767601; c=relaxed/simple;
	bh=YUGa0rM6GM1dvmEZEUBayZ4+YXqnZXKw66yxX9v/xAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=l03OVroFUiBtuO5QgKlqDuyZCs/KkB6TwKyt59URaEV0xTqZ2zv7a7Ar5xu35fAwBxDtnDpdPOnn631ksFCKQx344+7cG2bCOhWSUL9d0A40g1FgTesiYWGHvJydkqYBsNJiw+X8jk8qEOUdb7TDvMd8LCr33csH9wQHZ2zs3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHT7mi1u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAECC19424;
	Tue, 17 Mar 2026 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773767601;
	bh=YUGa0rM6GM1dvmEZEUBayZ4+YXqnZXKw66yxX9v/xAY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aHT7mi1uauabWthYhhgW7RDcMOIZvX05rdzbiXcYf0uaDcwYWPC8K2do58vOQLNJs
	 1m0hy6lkghHp7mr7UNlTP4coo6YUHYdDMD0nXbMkSbhcYhanGJkJDpswOe6vPiaJis
	 jVGV/H7moSB9f+cwN5nSWtqyWJAWBBXSpsgx/lqsnQvquy0XpdJYvzdx3d02pLDSK8
	 TEl0y2UYGSO2xmUnePn/99e555ZPXD7C2XIPxsYWE84uBNhR5wzdd7TvTgMrQ0AsHf
	 vMAzXa6ioNgU9NczSZxx5h08/w/5zVQxlXPdniYdub5tJMfXkSICq1bcV46WZ/x9pv
	 dpn3xKRIC63rw==
Date: Tue, 17 Mar 2026 12:13:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, bhelgaas@google.com,
	johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
	neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: hamoa: Move PCIe PERST and Wake
 GPIOs to port nodes
Message-ID: <20260317171319.GA90412@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <en5a7jrgpbn4bsmw5qwprugb2qmjkqw2x5eey6jxxu63634duz@b43rhcsqkj3o>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98240-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DC472AF43E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 07:50:50PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Mar 13, 2026 at 11:45:42AM -0500, Bjorn Helgaas wrote:
> > On Fri, Mar 13, 2026 at 05:46:18PM +0800, Ziyue Zhang wrote:
> > > Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
> > > GPIOs to PCIe port nodes and add port Nodes for all PCIe ports") did not
> > > convert all Hamoa‑based platforms to the new method of defining PERST and
> > > Wake GPIOs in the PCIe root port nodes.
> > > 
> > > Without the change PCIe probe will fail. The probe failure happens because
> > > the PHY stays in the controller node while the PERST/Wake GPIOs were moved
> > > to the port nodes.
> > > 
> > > This fixes probe failures seen on the following platforms:
> > >  - x1-hp-omnibook-x14
> > >  - x1-microsoft-denali
> > >  - x1e80100-lenovo-yoga-slim7x
> > >  - x1e80100-medion-sprchrgd-14-s1
> > >  - x1p42100-lenovo-thinkbook-16
> > >  - x1-asus-zenbook-a14
> > >  - x1-crd
> > >  - x1-dell-thena
> > > 
> > > Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> > 
> > Are you saying that DTs in the field broke because of some kernel
> > change?  That's not supposed to happen.  Even though PHY, PERST, and
> > Wake GPIOs should be described in Root Port nodes instead of the Root
> > Complex node in *future* DTs, the kernel is still supposed to accept
> > the old style with them described in the Root Complex node.
> 
> This is not related to the driver change. The driver correctly
> parses all Root Port properties either in the Root Complex node (old
> binding) or Root Port node (new binding). But commit 960609b22be5,
> left converting mentioned board DTS to the new binding, leaving
> those affected platforms in a half baked state i.e., some properties
> in RC node and some in Root Port node. Driver cannot parse such
> combinations, so it fails correctly so.

The commit log mentions probe failures on some machines.  I'd like it
to be more clear about who is affected and what they need to do to fix
their machines.  If it only affects developers who generated DTs based
on 960609b22be5 for internal testing, we should say that so it's clear
that no end users will see any regressions or boot failures.

Is there some way to verify that after this patch, none of the
generated DTBs are in this half-baked situation?  Some kind of
automated DTB checker?

