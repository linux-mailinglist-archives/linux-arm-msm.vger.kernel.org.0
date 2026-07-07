Return-Path: <linux-arm-msm+bounces-117111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L7l4Il2GTGoqlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:53:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EAA7174AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:53:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IMZ9IxUk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117111-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117111-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B3D93008462
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 04:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A4C324B06;
	Tue,  7 Jul 2026 04:53:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBD723183F;
	Tue,  7 Jul 2026 04:53:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400023; cv=none; b=UIR7zqqIyz9D5HWlCzh63kPsw+qjNKZpoL2FcPpfdooBvQOU/Fglq3FtxRDCYvWZebyP4yz3alt1VwUeVX+9D52pnjL+VX5TBk8Ezt/XOToxgztsr8glkJsR7R2uA6HnzBC8OMkRUpHLFVmYsMEsugHDBVFoNUpBxEo2PnWAcmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400023; c=relaxed/simple;
	bh=rX5iaofbXbOpSh+lRtn4L63OqxQeL6DGzfQYwC6cr6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoDEjk5V+gCF0omGmc8H/rxhR+8wG8yE48MUNucYMR1asQhn8tDpb9LZezfLc0HpTl+cCLwsDOe+dx9NCsPCgpzijyI7K4HQxPaJiVBpW7un1XK+FnWid3FfKngxf1VKkcDQETYlHoljrbjj2T97GyZuzFEbNtfi+dPX/I1MVKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMZ9IxUk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2660F1F000E9;
	Tue,  7 Jul 2026 04:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783400022;
	bh=6nzkmfJ6Uv5FSEajJK/nz5K8722h+71LROCSrSNOHd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IMZ9IxUkiFg23ctSK8a7yxkZG6exNx5yK0jQCw4PXitWmmu/xoNyyW+3vTyGvSwyy
	 YrYfcEuNDPLS7XEKoUUaSnPnLC7iwC2UsZeHjJGqdBCPeUzaH8Qj7G4Bf/y6rT11sT
	 W/kh4z654JE1eHhLzBQkahN62FQp61mIAlXvY504c35vCCxJjDZ2aUM57hRWc8PFTT
	 hP1yBcomR3DhQMjm55dMkhI1X/H6VBVvtkpuSc1AINdGgEoPqLqn645h850oOl/a3r
	 eg4h93UCUyXzESADe+GMJWNZmwRwr0O35LzFn4AaKkV67X4LGu7PkQH5xIEAh/XBpm
	 bRc30qJppXPqw==
Date: Tue, 7 Jul 2026 06:53:32 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe
 compatible
Message-ID: <43b5xhqvnapamfv4aomid647kaxrudgjcbnnca23t3vxitv67t@njdlthj2oisa>
References: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
 <20260703-vdev_maili_dt_bindings-v1-1-c9df0916cd5e@oss.qualcomm.com>
 <20260706-pastoral-okapi-of-reading-e5bdb3@quoll>
 <yntj62kr7tixc7capwdr6xhv2zpisfrjg62bwftgiuujf4fzt5@cjdrkglo4dv5>
 <9967f1a0-a9e3-4d62-b5df-7f625610a89d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9967f1a0-a9e3-4d62-b5df-7f625610a89d@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:vivek.pernamitta@oss.qualcomm.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117111-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[njdlthj2oisa:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85EAA7174AB

On Mon, Jul 06, 2026 at 07:35:52PM +0200, Krzysztof Kozlowski wrote:
> On 06/07/2026 18:36, Manivannan Sadhasivam wrote:
> > On Mon, Jul 06, 2026 at 08:46:41AM +0200, Krzysztof Kozlowski wrote:
> >> On Fri, Jul 03, 2026 at 05:38:40PM +0530, Vivek Pernamitta wrote:
> >>> Add qcom,maili-pcie as a compatible string that falls back to
> >>> qcom,hawi-pcie, as the Maili SoC reuses the Hawi PCIe controller IP.
> >>>
> >>> The Maili SoC is a derivative of Hawi and shares the same PCIe
> >>> controller architecture, allowing reuse of the existing Hawi PCIe
> >>> DT bindings.
> >>>
> >>> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> >>> ---
> >>> Dependencies:
> >>> - PCI: qcom: Add PCIe support for upcoming Hawi SoC
> >>>   https://lore.kernel.org/all/20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com/
> >>
> >> Squash the patches then.
> >>
> > 
> > But these are two independent SoC additions, isn't it?
> 
> It's adding a single compatible, no? If a patch adding a single
> compatible cannot be done without multi-patchset dependencies making
> testing by tooling impossible, then probably that work should not be
> sent separately or even as separate patch. And I am not saying anything
> new because half a year ago (around Kaanapali and Glymur) I voiced
> strong opinion about that.
> 
> But really, you do not need to add two compatibles in two separate patches.
> 

Ok then. I'll squash this patch with Hawi patch which already got applied.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

