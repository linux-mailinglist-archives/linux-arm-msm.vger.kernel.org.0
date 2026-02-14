Return-Path: <linux-arm-msm+bounces-92839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPwrHdPzj2k3UgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 05:02:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF5513AF82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 05:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40CA0301DE24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 04:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6532017A31C;
	Sat, 14 Feb 2026 04:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMhltCUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD8B3EBF06;
	Sat, 14 Feb 2026 04:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771041744; cv=none; b=nEEfySSSijvs5+s4kiQgaupE0o+sbGyVkJqAYqx23Sl8dddZLjeihB54SuVjEFMZN2I5RBvDg7xtcF3HnHr1+8reTJ9+I3nmlNOxM63hbDvmdu1REiB/zEShaRgj2Y3wznKeHZrPx+d8djtnJIbnjrt4hJJbKvhkW5xjqBuHRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771041744; c=relaxed/simple;
	bh=RcMDwI8y8h3Rzt0mAi0JN3jRa8Y+v7JRmhYCcEfJ6y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjlbA3M9S3Mdmxjvn9EdyzkPuS5eWMGS1FDMgZ42uB9P4ctJRKCx0xhWICQ2MdfkNtibuNgtsuGJS070rAXSY7oqkVIrqX9vWRycZICoO5TUTkl6Kp0poCMlqTiu7BCScHEQh2sEoGVp/W/XwXW4wy9uw0vqHESlAIOLdltizoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMhltCUi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EE4C19421;
	Sat, 14 Feb 2026 04:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771041743;
	bh=RcMDwI8y8h3Rzt0mAi0JN3jRa8Y+v7JRmhYCcEfJ6y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMhltCUid9v3vOJVF2v9pQJ5RDOcc1KlcY8e75g5ASnY9+AQ2R0iRts7FOBbc8iXF
	 mxopsCyGclOX8t57vaVf+zW70AWASbhjY9tfapXqQY3qZyKNPf1xEyy2T+xHkcUZZu
	 OBAWzG47yx9cuLopUTpliEO+9suwjPJMBG1t7K3ITK6Tdk+3mAp+mSKIfGF4xbQojP
	 i/ew1JLC/1Y6vNQzvQrhXUi8x1jfBpN35qnckCOVxyw25fg9rUJU/7a/BrvWKnBsHE
	 y90cd29WomHNIT97pTTKV03Geq/wEB9ckHxPBjklKK7+YlB7KOlpFz7AvinmgobQNK
	 ZN6v2JmaxGCvA==
Date: Fri, 13 Feb 2026 22:02:21 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Sharma <quic_vksharma@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Fix DTBO boot failure
Message-ID: <dczz4uvcq4hc6p3zb6xnrsgmfeomwliagwhf36tewdz4z6mndp@afbxzhjziiwv>
References: <20260207-sm8550-abl-dtbo-v2-1-83afaa6f3ce9@gmail.com>
 <d4faaf8d-1517-4187-8801-a2dd52d8dde3@kernel.org>
 <CALHNRZ9k3yxXb9OfYXMSfEwyYKU8Rrrrjb-hPqLgU90X9YBP8g@mail.gmail.com>
 <487e4605-0a21-48d6-8b77-9ce2799ad212@kernel.org>
 <CALHNRZ8sqCpUMyCFP99b7nHu2onojZ0EY6YGQZ9RMP0kH8jWzw@mail.gmail.com>
 <gd7puun6xy5bh4q73mqc5ooza2kzla3rtov6d2723zc6tw7qwi@gxbsnloi2qcw>
 <CALHNRZ87j=j5LEMA=P=D73vOz1C-p+BDKcXV2bH7rcPDtAx9JQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ87j=j5LEMA=P=D73vOz1C-p+BDKcXV2bH7rcPDtAx9JQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-92839-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: CAF5513AF82
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 04:50:25PM -0600, Aaron Kling wrote:
> On Fri, Feb 13, 2026 at 2:34 PM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Wed, Feb 11, 2026 at 09:10:39AM -0600, Aaron Kling wrote:
> > > On Mon, Feb 9, 2026 at 1:51 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > On 08/02/2026 16:10, Aaron Kling wrote:
> > > > > On Sun, Feb 8, 2026 at 3:07 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > >>
> > > > >> On 08/02/2026 02:16, Aaron Kling via B4 Relay wrote:
> > > > >>> From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
> > > > >>>
> > > > >>> ABL requires certain things in the base dtb to apply a dtbo. Namely:
> > > > >>>
> > > > >>> * A label named qcom_tzlog must exist, but doesn't have to contain any
> > > > >>>   specific properties
> > > > >>> * The timer node must have a label named arch_timer
> > > > >>>
> > > > >>> This aligns the sm8550 soc dtsi with those requirements. Without these
> > > > >>> in the base dtb, when ABL attempts to apply any dtbo, it will fail to
> > > > >>> the bootloader menu.
> > > > >>>
> > > > >>
> > > > >> Incomplete DCO chain.
> > > > >>
> > > > >>> Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
> > > > >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > >>> ---
> > > > >>> With a current mainline sm8550 base dtb, ABL will fail to apply any dtbo
> > > > >>> and fail back to the bootloader menu. There are two changes needed:
> > > > >>
> > > > >> Since when? We were testing SM8550 (me on QRD) all the time and there
> > > > >> was no problem.
> > > > >>
> > > > >> You need to provide details which hardware needs it, if this is about to
> > > > >> expected, but honestly, we don't add such nodes/labels for downstream
> > > > >> bootloader. Qualcomm should fix the bootloder instead.
> > > > >
> > > > > This discussion has been ongoing in a couple places. It is needed on
> > > > > all semi-recent recent qcom socs. See this chain [0] on my sm8550
> > > >
> > > >
> > > > Explanation must be in this commit, not in other places.
> > > >
> > > > > questions thread and the previous revision of this series [1]. This
> > > > > has been a known issue for a while, see this comment [2] on the gunyah
> > > > > watchdog series, which is what the series was based on.
> > > >
> > > > But that [2] still speaks about overlay. You are suppose to boot
> > > > standard kernel with typical setup - concatenated DTB.
> > > >
> > > > If you want some other ways, like choosing overlays by ABL or whatever
> > > > else, you need to fix ABL.
> > > >
> > > > You want to use some custom boot way of ABL, but it's broken... yet it
> > > > is no reason to add these properties. What if I want to boot DTJUNK
> > > > files via my custom ABJUNK - can I add such things to upstream? No.
> > > >
> > > > You cannot add properties to support custom boot of ABL if that boot is
> > > > broken.
> > >
> > > My use case here is an open source Android rom. I would like to think
> > > that android would be a supported use case. Not necessarily a driving
> > > force for decisions, but at least supported. And I'm using the
> > > standard boot image v4 setup with dtb on vendor_boot and dtbo's on the
> > > dedicated partition. This isn't some weird and wacko setup, it's what
> > > the vast majority of devices this soc is used in are designed for.
> > >
> >
> > Android isn't a weird and wacko setup; but I'm guessing that the
> > proposed changes aren't related to running Android, nor are they related
> > to dependencies of the overlays, but it rather relate to some
> > runtime-generated overlay that ABL wants to apply?
> 
> I honestly can't say what the underlying cause is. A couple of us have
> looked at the public abl source and weren't able to find what causes
> this issue. We just know that this issue happens when abl tries to
> apply a dtbo off the dtbo partition. So yes, in technicality this is
> not an android specific issue. I mention android because having a dtbo
> is generally expected in the aosp setup. In my specific use case, I
> have four devices from the same odm, where it's simple to split the
> common part into a dts, then the device specific parts into dtso's,
> allowing for a single software build to support all four devices.
> Requiring everything to be baked into a dts would require separate
> vendor_boot images per device, and thus completely separate build
> targets.

Your use of overlays is very reasonable.

It is an Android-specific issue, because you store and apply those
overlays using the Android bootloader and its way of doing things.

If you run e.g. Debian on your 8550 you could still use overlays to
solve your problem, but you wouldn't want abl and/or vendor_boot.

> 
> > Fixing ABL to be resilient against such failure cases certainly seems
> > like the right thing to do. But I'm guessing that you're on some device
> > where you can't change the ABL?
> 
> My devices are unfused, and thus I could change ABL. Two problems,
> however. 1) we can't find the necessary changes to make to fix the
> problem. And 2) this problem is more universal. Per [0], this affects
> 8550 and 8750 using the qcom baseline abl. By extrapolation, all odm
> copies will also have this problem. This has also been observed on a
> sm7635 phone. It appears to affect all baseline abl copies since at
> least sm8550.

It's fair to assume that there's leverage between the different
platforms, there shouldn't be much hardware-specifics in ABL.

> 
> > If that is the case, then I'm open to a pragmatic solution where you add
> > such workarounds to the specific dts that needs it, with clear
> > documentation of the circumstances.
> 
> > PS. Not all SM8550 runs Android, not all SM8550 has that specific
> > version of ABL, so therefor the change does not belong in sm8550.dtsi.
> 
> Ideally would be getting this fixed in the baseline abl code by qcom,
> since this issue seems to be continuing.

Sounds like it, but I don't know what it is that ABL is expecting to be
able to insert. [0] seems to mostly say "I added this and then it works"
:(

> That's not something I can affect, however.

I can ask the team to read this thread...

> But I disagree about making this device specific,
> because the vast majority of devices are affected by this, it would be
> the exception to not be affected, from what I can tell. And on more
> soc's than sm8550, but qcs8550 is the only qcom soc I am currently
> working on.

I understand your argument, but I don't want top-level quirks for things
that is device-specific.

Regards,
Bjorn

> 
> Aaron
> 
> [0] https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/

