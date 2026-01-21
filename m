Return-Path: <linux-arm-msm+bounces-89934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAytDo44cGmgXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:23:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C40E14FB1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8304B828FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4B5326D51;
	Wed, 21 Jan 2026 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iz98ZNR0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C722F60A3;
	Wed, 21 Jan 2026 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962094; cv=none; b=sksnpzfh6nB7cij+bpCVT1LDDKBMWYI6xNFR3eewTI2hE0pE9j9KWBmzApIbdMm0cEWlMj1osqNcR6+Pp7PONGpBIrFFJ2cAUt13pialDU7MO48+R4db3Wn7yoB541hcuAmOkLW2rtI3Qe5r7Wk5hce2/GgbqGkwGAhOPIDnnDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962094; c=relaxed/simple;
	bh=rwFYIhlg90jmywlJZCXUWi2xc01CWNMPcq6ftxOzJiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCfS83Q10OTO1/9kBv5h3+wnjpR9+NtQM35duMDNGuXbNV2qN8cd8jcWAHwbTomiatE2k0+/3iVgDDt5nhLeQ//cK7+P8+j4uzpdz4e6je5KuIoU/d6U+DbwuMTFR8FvbMDK9mJXmsMB3bMWO1BmwkguSRpIj0w9CNx09+XmweI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iz98ZNR0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EC5C16AAE;
	Wed, 21 Jan 2026 02:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962094;
	bh=rwFYIhlg90jmywlJZCXUWi2xc01CWNMPcq6ftxOzJiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iz98ZNR0DpMwiv3kp7J+tXO9gXPtlllCj+KLaPcy4/lVyG+dkFPvsQf//lYjxRkSV
	 C2v5mFq32tiT4MeBXRtGKJa+qnngjkob5XeqDT6qUgDpqFWf5aVxEBeASCwKjSV/00
	 flvqrjZi3JHFxstXRjWg22hF7Yb6CwFJTR07A657YAaMBqNYPoZxKLUl+OJHfxw2G7
	 hDgN/Q2bYfBg2VbjxyG4EyPaq9UoaI4+CesNSyiwqguXHsM9SAM5aMEjxST6u9rIHu
	 s1/vTY4BMSAjVDLohUSeQMuXemDMDKqh7MhZ1lgC/krhdpVhvIv+1PRdV615aPQhU0
	 LdL7zZDlAYOqw==
Date: Tue, 20 Jan 2026 20:21:31 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Souradeep Chowdhury <quic_schowdhu@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
Message-ID: <l2gv232wwct4px45rb27eouehx7nmy4b6n6lb4aoa6e3npeun6@dih26d4gzmuo>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
 <20260116232106.2234978-2-elson.serrao@oss.qualcomm.com>
 <20260117-courageous-chamois-of-focus-20d5d5@quoll>
 <sfazro75vspadpe4wco7zvlalcy2wbrbdjx2wn7lyonjgw22sf@z73u67pinusx>
 <4d6ffe96-2113-42fd-97e5-42247f073aef@kernel.org>
 <5cec9127-bdc5-49d7-80e1-2ae26f81163c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cec9127-bdc5-49d7-80e1-2ae26f81163c@oss.qualcomm.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89934-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: C40E14FB1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:16:17PM -0800, Elson Serrao wrote:
> 
> 
> On 1/19/2026 11:20 PM, Krzysztof Kozlowski wrote:
> > On 19/01/2026 20:58, Bjorn Andersson wrote:
> >> On Sat, Jan 17, 2026 at 12:57:58PM +0100, Krzysztof Kozlowski wrote:
> >>> On Fri, Jan 16, 2026 at 03:20:58PM -0800, Elson Serrao wrote:
> >>>> The Qualcomm Embedded USB Debugger (EUD) hardware can intercept up to
> >>>> two independent High-Speed UTMI data paths, depending on the SoC
> >>>> configuration. Each path operates independently with:
> >>>>
> >>>> - Dedicated PHY interface
> >>>> - Distinct USB connector and controller associations
> >>>> - Role dependent routing
> >>>>
> >>>> Model these hardware paths as separate eud-path nodes to accurately
> >>>> represent the physical topology and add below per-path properties:
> >>>>
> >>>> phys: EUD exposes a High-Speed debug hub that relies on HS-PHY for its
> >>>> operation. This property references the HS-PHY associated with the UTMI
> >>>> path.
> >>>>
> >>>> usb-role-switch: Indicates that the USB port on this UTMI path supports
> >>>> role switching. In device role, debug mode inserts the EUD hub into the
> >>>> UTMI path. In host role, the EUD hub is bypassed and UTMI traffic flows
> >>>> directly between the PHY and the USB controller.
> >>>>
> >>>> This change breaks backwards compatibility, but the previous binding
> >>>> omitted critical resources like PHY and did not describe per-path
> >>>> topology. Without these modifications EUD cannot be guaranteed to
> >>>> function.
> >>>
> >>> It was working for 3 years, so your guarantees are just imprecise. FUD
> >>> is not an argument.
> >>>
> >>> Qualcomm task at 2022 was to post complete bindings. These were posted
> >>> and accepted. Three years later you say that previous posting was
> >>> bollocks and this cannot even work?
> >>>
> >>
> >> That is correct. The description of the hardware that was provided when
> >> this was upstreamed and the binding that was accepted based on this
> >> description is wrong.
> >>
> >> There's absolutely a value in maintainting backwards compatibility in
> >> general, but is this one of those cases?
> >>
> >>> Nah, take responsibility of what you did in the past.
> >>>
> >>
> >> In my view the responsible thing is to accept that we got it wrong and
> >> make sure EUD is enabled end-to-end so people can actually use it.
> > 
> > I would expect to see what is not working. This is in mainline for three
> > years, so the assumption is that it was working for these three years.
> > If it wasn't, this should be described and "cannot be guaranteed to
> > function" is just imprecise.
> > 

I see, that I agree with.

> Thanks, Bjorn and Krzysztof, for the feedback.
> 
> Let me clarify what I meant by “cannot be guaranteed to work”, as I agree
> the phrasing can be improved to more precisely convey the intent.
> 
> The concern is not that EUD did not or could not work historically.
> Rather, the issue is that the hardware description provided by the
> binding does not explicitly describe ownership and control of hardware
> resources that EUD depends on. As a result, correctness of EUD operation
> relies on behavior outside of what is expressed in the description.
> 
> Concretely, the binding does not reference the HS-PHY. In practice,
> EUD may function because the USB controller (e.g. DWC3) keeps the
> PHY powered and configured.
> 
> However, this relationship is not described as a contract in the
> binding. The USB controller may legitimately relinquish PHY control as
> part of its own power-management or low-power transitions. The EUD
> hardware is capable of operating independently, but doing so requires
> EUD to have explicit control of the PHY.
> 
> The hardware specification lists the PHY as a required resource of the
> EUD debug hub. Not modeling it in the binding therefore leaves the
> description incomplete, because EUD resource requirements are being met
> implicitly through another hardware block (USB controller) rather than
> being described directly.
> 
> In addition, the hardware can expose multiple UTMI paths (dual-port
> EUD), which the current binding cannot represent.
> 
> The intent of this patch is therefore to correct and tighten the
> binding so that the hardware resources and topology EUD depends on are
> explicitly modeled, rather than relying on side effects of USB controller.
> 
> I will update the backwards compatibility justification accordingly.
> 

Please try to consolidate this whole explanation a bit and include it in
the commit message.

Regards,
Bjorn

> Thanks
> Elson

