Return-Path: <linux-arm-msm+bounces-114810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Z03D8nEQWrVuAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 03:05:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A76D5627
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 03:05:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114810-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114810-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B88C300DE34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 01:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F197415687D;
	Mon, 29 Jun 2026 01:05:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEE240D594;
	Mon, 29 Jun 2026 01:05:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782695108; cv=none; b=FgubdMITJP/Dm7BxjJ98jEgk3J8/Z2yc2oItKN3QGS0Umkyxp63nCsE2U+2sQHFu9pAIiw0bM7rf12DErfyuOtx05eLKU4wjSCM2GQuxNLNeDn5GDjn+blALcUgmoSJx2+a9Xu27y04j3jJJH03K9sJwZQqWSZkdHfdL+sQNBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782695108; c=relaxed/simple;
	bh=fxrHP4SvUBT+mxkzTAHy/Nl6EN61l2l0l2t0hFKbrrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwQBS/mGjZvZL1WqhBC1jUQ6I0oSn1fYlYbwsOxPynvTC1KWDruKuE30YxFB1GRdx5Hoee6VF+MpqFq2UjermltiLQl4Lx+5WxFj8Il+d2JX91PsoIf2WQPaYbkBLdDpvdYnc0Vrk0hteCZjVtXNqwfKGNNDp8qIxvti2bZuScQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A781F000E9;
	Mon, 29 Jun 2026 01:04:58 +0000 (UTC)
Date: Sun, 28 Jun 2026 20:04:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Message-ID: <akHEKifRtKksIbpQ@baldur>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
 <fcb6579a-4e5e-47ef-b9a5-009dd761e4de@oss.qualcomm.com>
 <akCIGtSZO-FW1EEo@baldur>
 <obf2iw3wq6xuvftkkwf4wa47i4y7q2apoaa5a5vvprrcqphawo@gr2snc33hnph>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <obf2iw3wq6xuvftkkwf4wa47i4y7q2apoaa5a5vvprrcqphawo@gr2snc33hnph>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114810-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 719A76D5627

On Sun, Jun 28, 2026 at 04:20:22PM +0300, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 09:41:38PM -0500, Bjorn Andersson wrote:
> > On Tue, Jun 23, 2026 at 09:06:51AM +0200, Konrad Dybcio wrote:
> > > On 6/23/26 3:31 AM, Bjorn Andersson wrote:
> > > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > 
> > > > UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> > > > Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> > > > the other typical Glymur platform capabilities.
> > > > 
> > > > The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> > > > OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> > > > 
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > ---
> > > > +&tlmm {
> > > > +	gpio-reserved-ranges = <4 4>, /* EC Secure */
> > > > +			       <10 2>, /* OOB UART */
> > > > +			       <44 4>, /* TPM */
> > > > +			       <90 2>; /* TPM */
> > > 
> > > Is there no EC reset pin? I wouldn't want others to have to open up
> > > a laptop after trying to find out what it does..
> 
> :-)
> 
> > > 
> > 
> > These are the ones needed to allow the thing to boot, I don't know what
> > the EC reset pin does, but I guess we can add some more for convenience.
> > 
> > [..]
> > > > +&uart21 {
> > > > +	status = "disabled";
> > > 
> > > hm?
> > > 
> > 
> > The debug-uart is left enabled in glymur.dtsi. Perhaps we should change
> > that instead?
> 
> I think that would match other platforms. But, is it actually not wired
> up? No debug connector or TPs?
> 

It might very well be, but like most other users I don't intend to ever
use them...

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry

