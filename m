Return-Path: <linux-arm-msm+bounces-92827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONCuAkKLj2nURQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 21:36:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63333139785
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 21:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E032A312B199
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 20:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D0129C325;
	Fri, 13 Feb 2026 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSaHxeWF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE6627BF93;
	Fri, 13 Feb 2026 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771014889; cv=none; b=coZJoLONHnAjLd1TFM4gSXLOlDa0zeRbkZyLHjuPTbk7ZkKJ7pyJi/R8BJ0IzvAXM14IwOlpL0q5E+8JZCPtzvFwzet733ccWTpXg+P6j5n+W8X2zxXqwzQNNm7r6uBLEoKpdZM7L3RSRbDgVMeWUSFaToqWE3gclxYdiawOKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771014889; c=relaxed/simple;
	bh=JWDAGq5cYWAnZ5hcB9AbIgHLXEdTsk5gUDdomURugJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJLGnM2qbXguv9ZxWTCwTf6w/NLkKUWMzLIiMOwnE9EtH5Psacuh5UamDZMp0ylW8Ik2OXCDHFty/v9FrEBwPDF6Sma4luYJ7kCLnGzbMdRJi7ASm1UbD6hdu7wicSAyWiNPdLDzjzJgS1DR1IxPIny/xjUg28tuF7f7JtSxyvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSaHxeWF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB8DC19421;
	Fri, 13 Feb 2026 20:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771014889;
	bh=JWDAGq5cYWAnZ5hcB9AbIgHLXEdTsk5gUDdomURugJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSaHxeWFBPN/jh6OYP7pAUh3CWxJeQdEnLeLx/ObVl6To/fPwtL+8knrFelROvwX+
	 DricqS+CjSv8RdmDH13u54vWfdqgYooCoHrjHv6VQPwsta+ZH+DfAGof6glSMRnawl
	 p0nyerW6uOG25L3xUAx/an2FA7ThfjrP68jBeH/jrSIBdSfvnkblpPLXaocYpEklIc
	 ho4A6Q5iAfGZ7n5BoeCTKVNTuV/xxDDGxwKNZvg+tXNa41L9KLkq6MR8NSHO5pfjmY
	 dFGdYCJrc25KDgj2nmbT+CYmfiNS9iOx8ohnO1xLfelGmiZim54hFyGCh3DTqeALCW
	 IBMFrOsV69jmQ==
Date: Fri, 13 Feb 2026 14:34:44 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Sharma <quic_vksharma@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Fix DTBO boot failure
Message-ID: <gd7puun6xy5bh4q73mqc5ooza2kzla3rtov6d2723zc6tw7qwi@gxbsnloi2qcw>
References: <20260207-sm8550-abl-dtbo-v2-1-83afaa6f3ce9@gmail.com>
 <d4faaf8d-1517-4187-8801-a2dd52d8dde3@kernel.org>
 <CALHNRZ9k3yxXb9OfYXMSfEwyYKU8Rrrrjb-hPqLgU90X9YBP8g@mail.gmail.com>
 <487e4605-0a21-48d6-8b77-9ce2799ad212@kernel.org>
 <CALHNRZ8sqCpUMyCFP99b7nHu2onojZ0EY6YGQZ9RMP0kH8jWzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ8sqCpUMyCFP99b7nHu2onojZ0EY6YGQZ9RMP0kH8jWzw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92827-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 63333139785
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 09:10:39AM -0600, Aaron Kling wrote:
> On Mon, Feb 9, 2026 at 1:51 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 08/02/2026 16:10, Aaron Kling wrote:
> > > On Sun, Feb 8, 2026 at 3:07 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>
> > >> On 08/02/2026 02:16, Aaron Kling via B4 Relay wrote:
> > >>> From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
> > >>>
> > >>> ABL requires certain things in the base dtb to apply a dtbo. Namely:
> > >>>
> > >>> * A label named qcom_tzlog must exist, but doesn't have to contain any
> > >>>   specific properties
> > >>> * The timer node must have a label named arch_timer
> > >>>
> > >>> This aligns the sm8550 soc dtsi with those requirements. Without these
> > >>> in the base dtb, when ABL attempts to apply any dtbo, it will fail to
> > >>> the bootloader menu.
> > >>>
> > >>
> > >> Incomplete DCO chain.
> > >>
> > >>> Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
> > >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > >>> ---
> > >>> With a current mainline sm8550 base dtb, ABL will fail to apply any dtbo
> > >>> and fail back to the bootloader menu. There are two changes needed:
> > >>
> > >> Since when? We were testing SM8550 (me on QRD) all the time and there
> > >> was no problem.
> > >>
> > >> You need to provide details which hardware needs it, if this is about to
> > >> expected, but honestly, we don't add such nodes/labels for downstream
> > >> bootloader. Qualcomm should fix the bootloder instead.
> > >
> > > This discussion has been ongoing in a couple places. It is needed on
> > > all semi-recent recent qcom socs. See this chain [0] on my sm8550
> >
> >
> > Explanation must be in this commit, not in other places.
> >
> > > questions thread and the previous revision of this series [1]. This
> > > has been a known issue for a while, see this comment [2] on the gunyah
> > > watchdog series, which is what the series was based on.
> >
> > But that [2] still speaks about overlay. You are suppose to boot
> > standard kernel with typical setup - concatenated DTB.
> >
> > If you want some other ways, like choosing overlays by ABL or whatever
> > else, you need to fix ABL.
> >
> > You want to use some custom boot way of ABL, but it's broken... yet it
> > is no reason to add these properties. What if I want to boot DTJUNK
> > files via my custom ABJUNK - can I add such things to upstream? No.
> >
> > You cannot add properties to support custom boot of ABL if that boot is
> > broken.
> 
> My use case here is an open source Android rom. I would like to think
> that android would be a supported use case. Not necessarily a driving
> force for decisions, but at least supported. And I'm using the
> standard boot image v4 setup with dtb on vendor_boot and dtbo's on the
> dedicated partition. This isn't some weird and wacko setup, it's what
> the vast majority of devices this soc is used in are designed for.
> 

Android isn't a weird and wacko setup; but I'm guessing that the
proposed changes aren't related to running Android, nor are they related
to dependencies of the overlays, but it rather relate to some
runtime-generated overlay that ABL wants to apply?

Fixing ABL to be resilient against such failure cases certainly seems
like the right thing to do. But I'm guessing that you're on some device
where you can't change the ABL?

If that is the case, then I'm open to a pragmatic solution where you add
such workarounds to the specific dts that needs it, with clear
documentation of the circumstances.

PS. Not all SM8550 runs Android, not all SM8550 has that specific
version of ABL, so therefor the change does not belong in sm8550.dtsi.

Regards,
Bjorn

> Also, the vast majority of devices can't replace the bootloader. This
> isn't an option, the devices are fused. The qrd and hdk are not
> available to consumers. There are a handful of qcs8550 devices like
> what I'm using that are unfused and thus are able to replace abl, but
> I would prefer not not add that extra step for users to install my
> project. Plus, I am trying to not just make changes that only affect
> my devices, when they could be generic and benefit all devices using
> the soc.
> 
> Aaron

