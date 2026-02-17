Return-Path: <linux-arm-msm+bounces-93227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDk5FhrWlGnnIAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 21:56:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A51508D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 21:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4B5D3004681
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 20:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33852DC76B;
	Tue, 17 Feb 2026 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbF9f0VK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9D5280CC1;
	Tue, 17 Feb 2026 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771361806; cv=none; b=V3Hh5IAaFrg4OMdFrjJF6erFT6O754fdOjYILolV/6NiDIoCbcG7sdavlNSURX1XsXPBcmkOH3WL/1OqbKTSUlp2JKbz51s7g/c48ImuYPFc/qNEyBUV7FcTlGHs7kRh3+m6zuwwe1+axxUhbxY4kxFr+91kyYk8srpjZ3u7Lwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771361806; c=relaxed/simple;
	bh=ddazgefXY01usFR9AKqxg+wsTQXWF7mkXJdCdpb+UIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPP9S5zzii/RP5ImvEZTQTqjkXbAMwNDFRR7GCjrsJ6jbWPG+4IbugCkXy53bWEZ2fV4lCkL//8dLQoBxsNs4tiK7UIPwY6bN3a1/n0Df4iB28weVE2rH5yfogFEkGXGq8GiwoMch3+ij2sTRmUrJDCM0+fHSYnX2xsgJKYZ30k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbF9f0VK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466BFC4CEF7;
	Tue, 17 Feb 2026 20:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771361806;
	bh=ddazgefXY01usFR9AKqxg+wsTQXWF7mkXJdCdpb+UIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbF9f0VK+eojdZWnZKakypfJ+D4fG4axH1PWlYcjA8Ob9R56MjrB4ReBAlUzJEHXG
	 eveF3OZsC6EClhzHqdgjEs9ZD1Wxmc5fvD8RqjH78D96fsh3x1SPbKoFUgab/+dY1g
	 Gl7Ca1Q8vHiUhGAR6qpkGNFABOdUduh9f/4oOJenru0OIjFnZI6mDiISxbrrI1saG1
	 zzEtMpYHHKGCox+CDCYniYK9lKsqI2bw7qHh+TCbQ0o1IG7Zpes2fSYBBxyGXj9tUZ
	 YC8oGKV7d378f5jrRiEDYbZgouezy0mDsfXe64dcdlgMezVlfru0u4HI3ZDhNCnYYZ
	 mK5jqSiDCTYjA==
Date: Tue, 17 Feb 2026 14:56:43 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, richardcochran@gmail.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com, 
	krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
Message-ID: <xdnbcpwm6cibkmy3dzyzmllqaax5rihbdevdbi6nl37orblcgi@glmdzirllpst>
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <z7y7gpfhrxgsxsqlsxmkwyr3zemvwpnpfuegv43ne56g5rsfl4@pehu3vloqjsy>
 <ec672f6b-2b8f-4241-825e-4b3e6d910762@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec672f6b-2b8f-4241-825e-4b3e6d910762@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93227-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.52:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C3A51508D2
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 01:44:40PM +0530, Umang Chheda wrote:
> Hello Bjorn,
> 
> On 2/13/2026 1:33 AM, Bjorn Andersson wrote:
> > On Tue, Feb 10, 2026 at 04:08:21PM +0530, Umang Chheda wrote:
> >> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
> > [..]
> >> +&i2c15 {
> >> +	#address-cells = <1>;
> >> +	#size-cells = <0>;
> > Do we need to repeat this? It's in the top-level i2c15 definition
> > already?
> 
> Yes this is required to be repeated in case of DTSO -- else seeing DT
> binding error if these cells are not added here. Seems the compiler is
> not looking at what is present in the Base DT first and is considering
> the default values for address and size cells and throwing error. Had
> to add similarly add for PCIe node as well to suppress binding errors.
> 

Understood, no concerns then. Thanks for helping me understand.

> >
> >> +
> >> +	status = "okay";
> > I presume this overlay is used on top of monaco-evk.dtb, which already
> > says that status is okay.
> 
> Ack
> 
> >
> >
> > That said, I don't see a "clock-frequency" in either node, so I presume
> > you have an error/warning in your kernel log about this. But unless you
> > have reason to change that in your overlay, I think that's a unrelated
> > patch on the monaco-evk.dts - which I would like you to send, separately.
> 
> 
> Ack, will share a separate patch to fix this issue.
> 
> >
> >> +
> >> +	eeprom1: eeprom@52 {
> >> +		compatible = "giantec,gt24c256c", "atmel,24c256";
> >> +		reg = <0x52>;
> >> +		pagesize = <64>;
> >> +
> >> +		nvmem-layout {
> >> +			compatible = "fixed-layout";
> >> +			#address-cells = <1>;
> >> +			#size-cells = <1>;
> >> +		};
> >> +	};
> >> +};
> >> +
> > [..]
> >> +&tlmm {
> >> +	tc9563_resx_n: tc9563-resx-state {
> >> +		pins = "gpio124";
> >> +		function = "gpio";
> >> +
> >> +		bias-disable;
> >> +		input-disable;
> >> +		output-enable;
> >> +		power-source = <0>;
> > Does these properties really match the TLMM binding? Please double
> > check.
> 
> Double checked on this -- all the properties match the TLMM bindings.
> 

I do believe the logic is binary, so input-disable == output-enable (in
contrast to the SPMI gpio binding, where those two are configured
separately). It's not listed among the valid properties for a
qcom-tlmm-state object, but perhaps I'm misremembering how the
dt-validator uses those properties.

But there's no "power-source" for TLMM, you should see an "Unsupported
config parameter" in the kernel log when you try to apply this setting.

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> >> +	};
> >> +};
> >> --
> >> 2.34.1
> 
> 
> Thanks,
> Umang
> 

