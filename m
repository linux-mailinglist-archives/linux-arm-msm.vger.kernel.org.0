Return-Path: <linux-arm-msm+bounces-118459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4s0PNEhjUmrGPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 450FD74201A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:37:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Vo8HfXbY;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118459-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118459-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 825E93000B38
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947B22C21FF;
	Sat, 11 Jul 2026 15:37:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C82226B2AD;
	Sat, 11 Jul 2026 15:37:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783784261; cv=none; b=NcQL4MkejSMdttYfYDLk+3eSe6j5ahNobVVMde/1m73ZWYpIN5UbPXFsu8JeWaePRtawMi//5hA83lzLu8PMob3aIcKknmis+RXcrZwzofvV6EtxTpmQ/1tRVnsdKerps0g3QdU2Dx25qIXN1CnkgqK8k5BUzXmCQcRfqIpp19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783784261; c=relaxed/simple;
	bh=2GAXUAzX31wM46cq0fS2iWhFTrtOYhqfd2V1TdjApTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pv9LjfAJd5rHgj6pZAR35qM6twet4oUbRlKFhkDOWTirDgc/l1GN7H67yb4u3jOti2MeYsau7k+3piHHi5A7ymHqu/bNCs/PbYx35E6uBQjA3iZR0FQPLywOOK70BNf0sGawN9+WMoi3jjwBUumBtqCffOemKkz6vC3Q3PA6YIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vo8HfXbY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E571F000E9;
	Sat, 11 Jul 2026 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783784260;
	bh=YIQwZIjSH6JLjyeNDUha8teupTqbDrlrCcrcp+PqVVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vo8HfXbYqZxID8tTe6ZZacwYSWuqf/Axf1y5xv0EXPzC4DCREi1W3sFZ2tQGt+t22
	 OiBt1jqOMAVEL2pYWLfcbg73FeHAUb1edVmScjle3wcvD+eoVyFOGf//SWLgfpHfA6
	 ugca8JVOOlV41dra13E6I/SBuaOylblvIV0XCavfW/LfP5oAuLC1IObLiesyeMqqnP
	 tEzt8ECK0DmhbRhCKP20yYOuK9mHM/7jPwGkVhe2aJCz1QI555sW4VcrsFNlMjcS5Y
	 tPUiPEOtjHqtYgyWx1K+TmrsvOPy+0ITOGj94JXTDJkqJY39DM5y1x83NgyvNfMPLL
	 uOoy77pcTHWgA==
Date: Sat, 11 Jul 2026 10:37:34 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xin Liu <xin.liu@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm
 boards
Message-ID: <alJh-ez0MepsuCT9@baldur>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
 <CAFEp6-2-n1L8rLv9zV142D_Q7io1G1ZuFgLHowsf8sObQt6iLw@mail.gmail.com>
 <aivBcGQgeKGW45Is@lpieralisi>
 <9a2f95e1-f01e-4956-9e84-23f0a5f26298@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a2f95e1-f01e-4956-9e84-23f0a5f26298@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:shivendra.pratap@oss.qualcomm.com,m:lpieralisi@kernel.org,m:loic.poulain@oss.qualcomm.com,m:anurag.pateriya@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xin.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118459-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baldur:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 450FD74201A

On Mon, Jun 15, 2026 at 06:38:59PM +0530, Shivendra Pratap wrote:
> 
> 
> On 12-06-2026 13:51, Lorenzo Pieralisi wrote:
> > On Wed, Jun 10, 2026 at 02:57:19PM +0200, Loic Poulain wrote:
> > > Hi Anurag,
> > > 
> > > On Fri, May 29, 2026 at 4:29 PM Anurag Pateriya
> > > <anurag.pateriya@oss.qualcomm.com> wrote:
> > > > 
> > > > Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
> > > > kaanapali based boards.
> > > 
> > > I would like to highlight that when Linux/EFI is enabled, which is a
> > > common config, efi_reboot is used as the primary reboot path (see
> > > machine_restart).
> 
> Yes but, only if EFI RESET RUNTIME service is enabled by UEFI.
> 
> efi_reboot(...) {
> ..
>          if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
>                   return;
> ..
> 
> > > As a result, the PSCI reboot hook is not invoked in
> > > this scenario, assuming Qualcomm firmware provides EFI runtime
> > > services.
> 
> Currently EFI RUNTIME RESET service is not enabled on these firmware.
> 

We have every intent to align with these standards, so this will become
a valid concern.

> > > As a follow-up, it would therefore be beneficial to also
> > > improve the EFI path to support such custom mode(s)...
> 
> Yes, and potentially linux should also have some control, if it wants to
> go via efi reset path or the PSCI reset path.
> 

Please stop thinking in terms of embedded system. Things like this
should just work, it should not rely on userspace to tinker with every
available knob.


That said, I think Loic's concern should be considered feedback on the
implementation - and specifically the DT binding in that series. Given
those bindings, I think these patches looks good - but the version of
the dependency that is being linked to has change requests, so please
resubmit this once it's possible to merge.

Regards,
Bjorn

> thanks,
> Shivendra
> 
> > 
> > I have not checked but we should probably put in a place a way for user
> > space to check that PSCI is _not_ the reboot method that will be
> > used, lest it would be allowed to send commands to the kernel that
> > would be duly ignored.
> > 
> > Need to go through the whole thing again before commenting any further.
> > 
> > Thanks,
> > Lorenzo
> > 
> > > Regards,
> > > Loic
> > > 
> > > 
> > > 
> > > > 
> > > > These DT patches depend on PSCI SYSTEM_RESET2 support introduced in:
> > > > https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/
> > > > 
> > > > To: Bjorn Andersson <andersson@kernel.org>
> > > > To: Konrad Dybcio <konradybcio@kernel.org>
> > > > To: Rob Herring <robh@kernel.org>
> > > > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > > To: Conor Dooley <conor+dt@kernel.org>
> > > > Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > > > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > > > Cc: linux-arm-msm@vger.kernel.org
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > 
> > > > Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> > > > ---
> > > > Changes in v2:
> > > > - Fixed subject lines.
> > > > - Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com
> > > > 
> > > > ---
> > > > Anurag Pateriya (1):
> > > >        arm64: dts: qcom: sm8750: add reboot-mode support
> > > > 
> > > > Xin Liu (1):
> > > >        arm64: dts: qcom: kaanapali: add reboot-mode support
> > > > 
> > > >   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
> > > >   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
> > > >   arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
> > > >   arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
> > > >   arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
> > > >   arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
> > > >   6 files changed, 30 insertions(+), 2 deletions(-)
> > > > ---
> > > > base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
> > > > change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8
> > > > 
> > > > Best regards,
> > > > --
> > > > Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> > > > 
> > > > 
> 

