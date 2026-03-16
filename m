Return-Path: <linux-arm-msm+bounces-97823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAI1F7lwt2n8RAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:53:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C08229446E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43C1C30011A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9687B31D759;
	Mon, 16 Mar 2026 02:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbF+NsKh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7290823E342;
	Mon, 16 Mar 2026 02:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773629619; cv=none; b=rkp+DMJp/xWukdp0TBCs6PK0DsqW58HyJO2J9sbBgDdZKYn/7kFGOAo7LZLAlIIB+HhdCoL7LhXD0qHXn6ucv6MOf+4Pb0YfooCy4wOqUgzSzIJbgmGBDJqA2gtGNDlGCVZ3xuDVsCQZtLwlyhQ6emR7sqDDyH5TfsH+6PHTyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773629619; c=relaxed/simple;
	bh=f086Q6qm64jLIfAt39GIf5jozndghww97l+kATvoaig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1yIPJJ82BBgK6Df+vxrV59ue7SUzzu5NlHzLBOmzSBwQgdC1EfPskGao4DW0k33RJP3ps3kx2SZmX1dg8nxTr4hWPotYXnpeAbI7OAiGtlU1RE1xzCSA1dR7iQwG8NPnpaUEJJZHBsJ4l7XyRnWJ1wagJJtbqAmQgSqHAWWWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbF+NsKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9377C4CEF7;
	Mon, 16 Mar 2026 02:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773629619;
	bh=f086Q6qm64jLIfAt39GIf5jozndghww97l+kATvoaig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbF+NsKh5Ssgz4mu1cFl+rTq0AAImjOnQT5JFeBXkPgUaa/7uDt60ts75LM734CpM
	 BLyzBgeWimIpLN3k0aPVHqP7US5WIrly2pFl9UOBQUniWxGhecNxiS2011v3btXgkq
	 WZ6k5+pGDabPM8+sVxhoUZg4Q6pVljQxJgoTg0oIB93ZwJ0NzbjUiZUa9dLiLBtEmN
	 fZVuhhhJBGDhN0/TxIuTqOfW/P5/Gyjvbfe8AbJmLgzDuOyT/s9LMKW2fQQRvmlI4E
	 u3ZVFgS7UnlDkymKexpqbwNlw093PHOdb3cZ/4vG4vNtm1cmmoHflht2bQqpCGtCkn
	 /1/NKEhLbgL2Q==
Date: Sun, 15 Mar 2026 21:53:33 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
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
Message-ID: <abdviJbrluDn2Vrx@baldur>
References: <20260313094618.1361418-1-ziyue.zhang@oss.qualcomm.com>
 <20260313164542.GA1405513@bhelgaas>
 <en5a7jrgpbn4bsmw5qwprugb2qmjkqw2x5eey6jxxu63634duz@b43rhcsqkj3o>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97823-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C08229446E
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
> > 
> 
> This is not related to the driver change. The driver correctly parses all Root
> Port properties either in the Root Complex node (old binding) or Root Port node
> (new binding). But commit 960609b22be5, left converting mentioned board DTS to
> the new binding, leaving those affected platforms in a half baked state i.e.,
> some properties in RC node and some in Root Port node. Driver cannot parse such
> combinations, so it fails correctly so.
> 

Are you saying that above listed machines has broken PCIe support in
v7.0-rc?

It seems this is a (partial) revert of 960609b22be5, is this actually
fixing that change, or is it only applicable once some other changes are
applied?

Where should this be merged?

Regards,
Bjorn

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

