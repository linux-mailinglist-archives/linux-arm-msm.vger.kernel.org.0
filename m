Return-Path: <linux-arm-msm+bounces-98623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC8VHzGMu2k4lgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:40:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3448F2C645E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AC403032DE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6CF39A057;
	Thu, 19 Mar 2026 05:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRnMBe/x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A311399376;
	Thu, 19 Mar 2026 05:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898783; cv=none; b=X5YECu9UeMt55byUdK2MI4EBuAujSEjNp8Sr0bFQiYNJ7ripPbSfMbX0JS2QEl1gtxYHJ1K6YuD5ss8jlJogwymcNasNGs+IE/f9//AzcPboypWVkTK+uGs3BsOViDFZzEPfIH3y0S5v8pYMURwXWztQMUZMtrkDcHg/kGn043U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898783; c=relaxed/simple;
	bh=1pQR8OUJn3j5iGSakSh1l85iZDBT4bbEqcZ2Pu0UxiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLQL1V4FmYUVtQ6Eedo4pTQvmJ8f3fU4lwNstoAsnh2xbmQn2QNLYRhEq2jARIruAHHP1WXrCnGzo3deRMTNpufHNGWG+T/dPMSspFqEW3Ur5U/4dWp0pBpjCKj7WVP513YnjCT4Xn7MJdeqmyZJj8VHRAqMV7jYHQoHHXgmsuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRnMBe/x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55BBC2BC9E;
	Thu, 19 Mar 2026 05:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773898783;
	bh=1pQR8OUJn3j5iGSakSh1l85iZDBT4bbEqcZ2Pu0UxiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRnMBe/xMYHJp8U0yp+fYe5EKBwyy3rSk7Uy7GenoSqyCDCx4g0KsLaNRSsUdaZlf
	 I7WzWciH5bDeEvwwi3Hc7qkogYRz41lTTjEeq2v4tfjTyizCd4pV2azJYnGPxQMXND
	 81j1CYoG/rcESBZGqpRraj1iwAViwIEpe1RKqZWh38qugCCHg3YM6hIFIcWq+84FqM
	 h0eUXKS2o5Ay4CF4eDDHGMB/dIaDNV023dYgDJHTmbhJSaNKLBDtXrZxhU1p+r37yJ
	 /KQIQ5hzafq45rg7Wm8oTbogazG6j9P33w5cXKaz4CvpEWFUwvDkxEhS4CWaISAMlx
	 zqD/R8eBv4bfA==
Date: Thu, 19 Mar 2026 11:09:30 +0530
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
Message-ID: <4byysnjodmlphwcevw5gb2asxbwwwlf526mtpwpkfi6crjxoqb@vyuktezfu2wu>
References: <20260313094618.1361418-1-ziyue.zhang@oss.qualcomm.com>
 <20260313164542.GA1405513@bhelgaas>
 <en5a7jrgpbn4bsmw5qwprugb2qmjkqw2x5eey6jxxu63634duz@b43rhcsqkj3o>
 <abdviJbrluDn2Vrx@baldur>
 <kqpgjzcxnazjohiop27exget6qrv37wn3csmixt5nmc6d5dkbg@n7qjo6flaabn>
 <abtgaXSv-zRysJqO@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abtgaXSv-zRysJqO@baldur>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98623-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.952];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3448F2C645E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:42:56PM -0500, Bjorn Andersson wrote:
> On Mon, Mar 16, 2026 at 08:50:12AM +0530, Manivannan Sadhasivam wrote:
> > On Sun, Mar 15, 2026 at 09:53:33PM -0500, Bjorn Andersson wrote:
> > > On Sat, Mar 14, 2026 at 07:50:50PM +0530, Manivannan Sadhasivam wrote:
> > > > On Fri, Mar 13, 2026 at 11:45:42AM -0500, Bjorn Helgaas wrote:
> > > > > On Fri, Mar 13, 2026 at 05:46:18PM +0800, Ziyue Zhang wrote:
> > > > > > Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
> > > > > > GPIOs to PCIe port nodes and add port Nodes for all PCIe ports") did not
> > > > > > convert all Hamoa‑based platforms to the new method of defining PERST and
> > > > > > Wake GPIOs in the PCIe root port nodes.
> > > > > > 
> > > > > > Without the change PCIe probe will fail. The probe failure happens because
> > > > > > the PHY stays in the controller node while the PERST/Wake GPIOs were moved
> > > > > > to the port nodes.
> > > > > > 
> > > > > > This fixes probe failures seen on the following platforms:
> > > > > >  - x1-hp-omnibook-x14
> > > > > >  - x1-microsoft-denali
> > > > > >  - x1e80100-lenovo-yoga-slim7x
> > > > > >  - x1e80100-medion-sprchrgd-14-s1
> > > > > >  - x1p42100-lenovo-thinkbook-16
> > > > > >  - x1-asus-zenbook-a14
> > > > > >  - x1-crd
> > > > > >  - x1-dell-thena
> > > > > > 
> > > > > > Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> > > > > 
> > > > > Are you saying that DTs in the field broke because of some kernel
> > > > > change?  That's not supposed to happen.  Even though PHY, PERST, and
> > > > > Wake GPIOs should be described in Root Port nodes instead of the Root
> > > > > Complex node in *future* DTs, the kernel is still supposed to accept
> > > > > the old style with them described in the Root Complex node.
> > > > > 
> > > > 
> > > > This is not related to the driver change. The driver correctly parses all Root
> > > > Port properties either in the Root Complex node (old binding) or Root Port node
> > > > (new binding). But commit 960609b22be5, left converting mentioned board DTS to
> > > > the new binding, leaving those affected platforms in a half baked state i.e.,
> > > > some properties in RC node and some in Root Port node. Driver cannot parse such
> > > > combinations, so it fails correctly so.
> > > > 
> > > 
> > > Are you saying that above listed machines has broken PCIe support in
> > > v7.0-rc?
> > > 
> > 
> > I haven't verified it, but I'm pretty sure PCIe is broken on these platforms.
> > 
> 
> In line with Bjorn's request, we shouldn't have to guess.
> 
> > > It seems this is a (partial) revert of 960609b22be5, is this actually
> > > fixing that change, or is it only applicable once some other changes are
> > > applied?
> > > 
> > 
> > This change is fixing the issue in the respective board DTS and is a standalone
> > fix on top of v7.0-rc1.
> > 
> 
> So 960609b22be5 was broken when I merged it?
> 

Broken on the machines mentioned in the commit message, not for all Hamoa
platforms.

> The commit message says that the commit was incomplete, in that it
> didn't fully convert from the old to the new style, so it sounds like
> the offending commit was incomplete - but I believe the offending commit
> was a workaround for the new solution not being in place and this commit
> mostly reverts the changes in the offending commit.
> 

So 960609b22be5 was supposed to move all the platforms from old PCIe binding to
new for greater good, but it apparently decided to do so only for a subset of
the platforms for some reason which  don't know. But the problem arises due to
960609b22be5 changing the hamoa.dtsi to the new binding which also warrants the
platform DTS to also be changed to the new binding. If we only have either dtsi
or dts converted and not both to the new binding, the driver will get confused
and fail. And this is what exactly happended for below machines:

 - x1-hp-omnibook-x14
 - x1-microsoft-denali
 - x1e80100-lenovo-yoga-slim7x
 - x1e80100-medion-sprchrgd-14-s1
 - x1p42100-lenovo-thinkbook-16
 - x1-asus-zenbook-a14
 - x1-crd
 - x1-dell-thena

> In other words, it's not clear to me, from the commit message, why this
> change is a -rc fix. Perhaps the author of the offending commit tricked
> me to merge that one, and that's what's being fixed?
> 

I wouldn't say that the author has tricked, but he was unaware of the fact that
changing SoC dtsi warrants change in all platforms, not a subset. I wanted to
catch these kind of issues with DT binding validation, so I sent out a series
earlier [1], but it got stuck. I'll push it forward.

[1] https://lore.kernel.org/linux-pci/20251106-pci-binding-v2-0-bebe9345fc4b@oss.qualcomm.com

> Also, is the lack of Tested-by telling us that nobody has tested any of
> the v7.0-rc on the 8 listed Hamoa devices?
> 

Exactly. Otherwise, they would've seen the failure so obviously.

> 
> 
> If it's actually needed, can we please have the commit message improved
> so that we can merge it into -rc?
> 

Sure. I'll work with Ziyue to reword it properly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

