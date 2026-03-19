Return-Path: <linux-arm-msm+bounces-98802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Fw0IgsxvGnxuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:23:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E1F2CFE2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33E1431BF8F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 17:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0894F3242BD;
	Thu, 19 Mar 2026 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vITGmSga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76702750E6;
	Thu, 19 Mar 2026 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773940649; cv=none; b=mtvaauic8qo8kvwX+mKs5zl8lesPeffHEiBSPKr60Udpc56MwnKABQ/Ij2fIVWaKXsBvI9ataDnvdpB3w3tNQC9r4wk234OwBFIlR1e+lBJWtZHbEfKGmj+0P1eUC4HATYHCEw/8CSTWTEbn1bptFNnlZflNptp+oofL03A1wr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773940649; c=relaxed/simple;
	bh=s1URZtMYRdo2m24AfGzq+HczpETBJJYGDMsU+ejJkek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TsMEFXu/srN/SLJXs7z4x4cR/K8V8SfF7DPlI2mfET6jMVSEqyA4XS/tWH9SB3Ut2Lhqh+/3HP6KdUoPMAqojT+wqiRUvm2tdBSqdYcNtT9B8ZjCKnnugQOWAGBrgCNUSsydM0bXePZAWLms+JZ/tmEbTSCptEs41pdktyBgGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vITGmSga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9FCC2BCAF;
	Thu, 19 Mar 2026 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773940649;
	bh=s1URZtMYRdo2m24AfGzq+HczpETBJJYGDMsU+ejJkek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=vITGmSgaVDGo35wP0edDRbyzFYwuN5X4rd0VjuPbprttAsBRd+5vhNnDcLSXaR6Eq
	 CMa6IlaN6BSzu/792cXFr76CuUvzspffPNMdUDuKNmYjRSOJoluuHcRGKJijBHmqiX
	 NuBMLA306VPdMONBe31tc9geYDlMFfEmvF+wnxuJIIG1PN36Sgple7lbcM6Ipc1JbI
	 7yHh4Dd1bCY0EP0GEcI92Zq6lAaT7GUiUUS790Yf58ENBWeM9IZqSd7MHFoqF1RBeX
	 byTfveamzLFTG42yrAoJqdNzeNNU5lTKD2f6WCVPqw25nq+TNY3blWpXyc6XvTbweu
	 1GdgGF5ukjv8w==
Date: Thu, 19 Mar 2026 12:17:28 -0500
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
Message-ID: <20260319171728.GA505341@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5vqy4tfhfxeu4li33qffjzrlgqgbflidds35qdni3trdoues2@kvuzjxenrdff>
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
	TAGGED_FROM(0.00)[bounces-98802-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.888];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29E1F2CFE2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 10:58:36AM +0530, Manivannan Sadhasivam wrote:
> On Tue, Mar 17, 2026 at 12:13:19PM -0500, Bjorn Helgaas wrote:
> > On Sat, Mar 14, 2026 at 07:50:50PM +0530, Manivannan Sadhasivam wrote:
> > > On Fri, Mar 13, 2026 at 11:45:42AM -0500, Bjorn Helgaas wrote:
> > > > On Fri, Mar 13, 2026 at 05:46:18PM +0800, Ziyue Zhang wrote:
> > > > > Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
> > > > > GPIOs to PCIe port nodes and add port Nodes for all PCIe ports") did not
> > > > > convert all Hamoa‑based platforms to the new method of defining PERST and
> > > > > Wake GPIOs in the PCIe root port nodes.
> > > > > 
> > > > > Without the change PCIe probe will fail. The probe failure happens because
> > > > > the PHY stays in the controller node while the PERST/Wake GPIOs were moved
> > > > > to the port nodes.
> > > > > 
> > > > > This fixes probe failures seen on the following platforms:
> > > > >  - x1-hp-omnibook-x14
> > > > >  - x1-microsoft-denali
> > > > >  - x1e80100-lenovo-yoga-slim7x
> > > > >  - x1e80100-medion-sprchrgd-14-s1
> > > > >  - x1p42100-lenovo-thinkbook-16
> > > > >  - x1-asus-zenbook-a14
> > > > >  - x1-crd
> > > > >  - x1-dell-thena
> > > > > 
> > > > > Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> > > > 
> > > > Are you saying that DTs in the field broke because of some kernel
> > > > change?  That's not supposed to happen.  Even though PHY, PERST, and
> > > > Wake GPIOs should be described in Root Port nodes instead of the Root
> > > > Complex node in *future* DTs, the kernel is still supposed to accept
> > > > the old style with them described in the Root Complex node.
> > > 
> > > This is not related to the driver change. The driver correctly
> > > parses all Root Port properties either in the Root Complex node (old
> > > binding) or Root Port node (new binding). But commit 960609b22be5,
> > > left converting mentioned board DTS to the new binding, leaving
> > > those affected platforms in a half baked state i.e., some properties
> > > in RC node and some in Root Port node. Driver cannot parse such
> > > combinations, so it fails correctly so.
> > 
> > The commit log mentions probe failures on some machines.  I'd like it
> > to be more clear about who is affected and what they need to do to fix
> > their machines.
> 
> There is already a list of affected machines mentioned in the commit
> message.
>
> And for fix, they just need to apply this patch. Or once this patch
> gets merged into v7.0-rcS, v7.0 will have no issue.
>
> >  If it only affects developers who generated DTs based on
> >  960609b22be5 for internal testing, we should say that so it's
> >  clear that no end users will see any regressions or boot
> >  failures.
> 
> Whoever have included commit 960609b22be5 in their kernel and using
> the above mentioned machines will see the failure. But looks like no
> one really tested v7.0-rcS on these machines as we haven't gotten
> any reports so far.

Two points:

  - a2fbecdbbb9d ("PCI: qcom: Add support for parsing the new Root
    Port binding") is intended for hardware with multiple Root Ports
    with independent PHY/reset controls.

    The driver will always fall back to PHY/reset info in the host
    bridge, so I think the only reason to do 960609b22be5 and this fix
    is if hamoa.dtsi will also be used for hardware with multiple Root
    Ports.  If there's no plan for multiple RPs with hamoa.dtsi,
    reverting 960609b22be5 is another, less risky, option.

  - 960609b22be5 only touches .dtsi and .dts files; it doesn't change
    the kernel itself.

    So I assume this issue only affects somebody who used v7.0-rc1 to
    rebuild the DTB for one of those machines and then installed that
    new DTB on their system.  That sounds like developers to me, not
    end users.

    The commit log already mentions the affected machines.  I'm
    suggesting that it should also say something about the fact that
    only DTBs built with 960609b22be5 are affected, i.e., DTBs built
    with 960609b22be5 but without this fix are incompatible with the
    kernel driver.

