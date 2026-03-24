Return-Path: <linux-arm-msm+bounces-99565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH11ChEtwml5ZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:20:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 772CB302BEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEC4731AAEB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646323B95EB;
	Tue, 24 Mar 2026 06:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8FFdrjp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA763B8D5C;
	Tue, 24 Mar 2026 06:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332472; cv=none; b=rfASdkaG4OOJ7SDtFTJUnyAf1ZWSuQ+Qd/zK05pEaumuINVDU8ABcFcUCFPox+XZ80Pw1k+GXDV3T+JPbHmhQHyV0edi/8KjN3APWovkb7Solbc9GZFMilOER0RMVFEanms4la9FucbXMIrOrAcBmV5EiXT3FmXBPci0FJRbFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332472; c=relaxed/simple;
	bh=CbrBDMvrxeaN6eqoq4nlJm50oGW9GYqdyJhdu9KIQjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKMJ90yy3FYJFdG6hee7S3G/UkJlPQl1Talvn9HgbS82qIRZUB9+oQiBXEvniFh3lfqtasb0ruM9OHTR5G+18oJAdeb4XbSRizmWLG9b7UbwNoC2trXCsEOGqj4mygZ83xu4O3BONzAeYGvUrKB3hXrbGscVjx8bicmeeclc/O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8FFdrjp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66789C2BCB6;
	Tue, 24 Mar 2026 06:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332472;
	bh=CbrBDMvrxeaN6eqoq4nlJm50oGW9GYqdyJhdu9KIQjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8FFdrjpIm66Ud6FZQmqgFoLE3tQOuVgS10sKNaKTr0Oi+Zg8yPtGHldalvpKl1aR
	 5ork1c0yk7RzktocuBMmHVdiPxTvRSOMHDnSVUD8q+CiRdeYAE7E+LHWWxtgItjr6r
	 qLaT84wB7VJ8mLRYoFLy8oxLfwaTOXsyupgexMedPclhYyLFV/zXtPzzNrmYpssapW
	 E+CUcUBlxBxFBD5llM++URWYBUwjMCVhTEU+JIm5telWaOtHQrMxX6y9nRi5n/+g4p
	 mL+FUC8m6F8gYC1i8NL3j9x3qEJVtm/iPgD1FbmZwkkbmFiNLu4e+aSnxQgOx6alvM
	 8do02E7SokWxg==
Date: Tue, 24 Mar 2026 11:37:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bjorn Helgaas <helgaas@kernel.org>, Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com, 
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: hamoa: Move PCIe PERST and Wake
 GPIOs to port nodes
Message-ID: <dnx4ge2e2zy2unw5jtmmhktyzlnmmhrogb5skskxewi6y7ekau@vpfdphzay7td>
References: <20260313094618.1361418-1-ziyue.zhang@oss.qualcomm.com>
 <20260313164542.GA1405513@bhelgaas>
 <en5a7jrgpbn4bsmw5qwprugb2qmjkqw2x5eey6jxxu63634duz@b43rhcsqkj3o>
 <abdviJbrluDn2Vrx@baldur>
 <kqpgjzcxnazjohiop27exget6qrv37wn3csmixt5nmc6d5dkbg@n7qjo6flaabn>
 <abtgaXSv-zRysJqO@baldur>
 <4byysnjodmlphwcevw5gb2asxbwwwlf526mtpwpkfi6crjxoqb@vyuktezfu2wu>
 <CAARv3RSag8n0=ut9KGm0yALRPVTiyQ+bBBbT+3Vf1sNOCBLbGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARv3RSag8n0=ut9KGm0yALRPVTiyQ+bBBbT+3Vf1sNOCBLbGA@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-99565-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 772CB302BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 02:50:37PM +0100, Tobias Heider wrote:
> Resending because the previous mail ended up being HTML (sorry)
> 
> On Thu, Mar 19, 2026 at 6:39 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Wed, Mar 18, 2026 at 09:42:56PM -0500, Bjorn Andersson wrote:
> > > On Mon, Mar 16, 2026 at 08:50:12AM +0530, Manivannan Sadhasivam wrote:
> > > > On Sun, Mar 15, 2026 at 09:53:33PM -0500, Bjorn Andersson wrote:
> > > > > On Sat, Mar 14, 2026 at 07:50:50PM +0530, Manivannan Sadhasivam wrote:
> > > > > > On Fri, Mar 13, 2026 at 11:45:42AM -0500, Bjorn Helgaas wrote:
> > > > > > > On Fri, Mar 13, 2026 at 05:46:18PM +0800, Ziyue Zhang wrote:
> > > > > > > > Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
> > > > > > > > GPIOs to PCIe port nodes and add port Nodes for all PCIe ports") did not
> > > > > > > > convert all Hamoa‑based platforms to the new method of defining PERST and
> > > > > > > > Wake GPIOs in the PCIe root port nodes.
> > > > > > > >
> > > > > > > > Without the change PCIe probe will fail. The probe failure happens because
> > > > > > > > the PHY stays in the controller node while the PERST/Wake GPIOs were moved
> > > > > > > > to the port nodes.
> > > > > > > >
> > > > > > > > This fixes probe failures seen on the following platforms:
> > > > > > > >  - x1-hp-omnibook-x14
> > > > > > > >  - x1-microsoft-denali
> > > > > > > >  - x1e80100-lenovo-yoga-slim7x
> > > > > > > >  - x1e80100-medion-sprchrgd-14-s1
> > > > > > > >  - x1p42100-lenovo-thinkbook-16
> > > > > > > >  - x1-asus-zenbook-a14
> > > > > > > >  - x1-crd
> > > > > > > >  - x1-dell-thena
> > > > > > > >
> > > > > > > > Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> > > > > > >
> > > > > > > Are you saying that DTs in the field broke because of some kernel
> > > > > > > change?  That's not supposed to happen.  Even though PHY, PERST, and
> > > > > > > Wake GPIOs should be described in Root Port nodes instead of the Root
> > > > > > > Complex node in *future* DTs, the kernel is still supposed to accept
> > > > > > > the old style with them described in the Root Complex node.
> > > > > > >
> > > > > >
> > > > > > This is not related to the driver change. The driver correctly parses all Root
> > > > > > Port properties either in the Root Complex node (old binding) or Root Port node
> > > > > > (new binding). But commit 960609b22be5, left converting mentioned board DTS to
> > > > > > the new binding, leaving those affected platforms in a half baked state i.e.,
> > > > > > some properties in RC node and some in Root Port node. Driver cannot parse such
> > > > > > combinations, so it fails correctly so.
> > > > > >
> > > > >
> > > > > Are you saying that above listed machines has broken PCIe support in
> > > > > v7.0-rc?
> > > > >
> > > >
> > > > I haven't verified it, but I'm pretty sure PCIe is broken on these platforms.
> > > >
> > >
> > > In line with Bjorn's request, we shouldn't have to guess.
> > >
> > > > > It seems this is a (partial) revert of 960609b22be5, is this actually
> > > > > fixing that change, or is it only applicable once some other changes are
> > > > > applied?
> > > > >
> > > >
> > > > This change is fixing the issue in the respective board DTS and is a standalone
> > > > fix on top of v7.0-rc1.
> > > >
> > >
> > > So 960609b22be5 was broken when I merged it?
> > >
> >
> > Broken on the machines mentioned in the commit message, not for all Hamoa
> > platforms.
> >
> > > The commit message says that the commit was incomplete, in that it
> > > didn't fully convert from the old to the new style, so it sounds like
> > > the offending commit was incomplete - but I believe the offending commit
> > > was a workaround for the new solution not being in place and this commit
> > > mostly reverts the changes in the offending commit.
> > >
> >
> > So 960609b22be5 was supposed to move all the platforms from old PCIe binding to
> > new for greater good, but it apparently decided to do so only for a subset of
> > the platforms for some reason which  don't know. But the problem arises due to
> > 960609b22be5 changing the hamoa.dtsi to the new binding which also warrants the
> > platform DTS to also be changed to the new binding. If we only have either dtsi
> > or dts converted and not both to the new binding, the driver will get confused
> > and fail. And this is what exactly happended for below machines:
> >
> >  - x1-hp-omnibook-x14
> >  - x1-microsoft-denali
> >  - x1e80100-lenovo-yoga-slim7x
> >  - x1e80100-medion-sprchrgd-14-s1
> >  - x1p42100-lenovo-thinkbook-16
> >  - x1-asus-zenbook-a14
> >  - x1-crd
> >  - x1-dell-thena
> 
> I can confirm the breakage for (some of) the listed devices on Ubuntu.
> We are experimenting with 7.0-rcs ahead of our 26.04 release.
> 
> I'll try to collect some test feedback for the fix.
> I'd certainly appreciate this being included as an rc fix since
> currently half of
> the x1 laptop devices are broken.
> 

Thanks for the report. We will try to get this patch into v7.0-rcS.

It'd be appreciated if you can test this patch and give your tested-by tag.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

