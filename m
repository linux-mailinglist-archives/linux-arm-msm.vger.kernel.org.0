Return-Path: <linux-arm-msm+bounces-97366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBo4OYLNs2n2awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:40:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C3627FDB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBD74308F629
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BD4286897;
	Fri, 13 Mar 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTulP3xK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9312CCC5;
	Fri, 13 Mar 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773391070; cv=none; b=LMOC++WFrZz2aQYMnue6JUocahew2CK6D0Kcgv6yGltxDXDQFK9yLhFXKvD7L4Xdcdn/zjitUy3Oqr0H025pVR1v8uqk5kI1L6PD4b4ahwuOp79iT3Gx8kItU9wDj0xFl9dWp13GDTHR4pzp7OLsSCtMUJzXCmtxotowQ1sNhLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773391070; c=relaxed/simple;
	bh=if6Os7KZv3jvKc+yemWTofnnhVFQOpjqvGDEYAKip0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTGruRTEvgX+9fFeXT1Hot+FUsvBDOlKiFyVCMHlMMD+G8JeQVj799B0rDHvY5eCOIUbDaJpCfRdljMvxSLSTLFI26UltXntUmZovfzAYOnQm5tnlQppKr61b3DcLX6JaeeiZ5dnomLPrOEwQVf4x6ZMkvgaH9axQf7ba5eaMo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTulP3xK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A393DC19424;
	Fri, 13 Mar 2026 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773391070;
	bh=if6Os7KZv3jvKc+yemWTofnnhVFQOpjqvGDEYAKip0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTulP3xKiD9uDa8zSu3xuIlY++UgnIMkKR91B4cmSiPZBqB4MHjK7iC1I+9dHz/nT
	 yVRJDWtil2yeAgfUgOHei8po1hcKsBBU94riznlLp68Knr6woxxN6uTkGRQi8csjRT
	 WJKlqmYR7JGMmDWUhJlO1jziyCS00RwgnVH14oGUJXLOlBSZHZHobdDRPEVxLY031Z
	 UKkapOYblnvpUn4LxE1cQUdOFewaLN2y4tbJd0SGPBZRYr4qw3uQ8pekudvUnppSLX
	 2RB2nyPCrQpEV6tqyJ/RLb7mlDcQubk7I5RHb3VfuMC8L465qzpyy0bEhBd4TFdkLX
	 xeNo7MaeTEJxA==
Date: Fri, 13 Mar 2026 09:37:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Aaron Kling <webgeek1234@gmail.com>, Val Packett <val@packett.cool>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
Message-ID: <20260313-urban-prawn-of-success-cff01f@quoll>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
 <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
 <CALHNRZ_RU+uHXfUtSO+8pKOYfBuK9jbYgqWE70WMQ=5Qz2MvvQ@mail.gmail.com>
 <quybzbqxlohu6kiqmno2wzyltwejnc2vebxdgvdl3fdib7zg7u@wz3bkop7psu6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <quybzbqxlohu6kiqmno2wzyltwejnc2vebxdgvdl3fdib7zg7u@wz3bkop7psu6>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97366-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,vger.kernel.org,sobir.in];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: 48C3627FDB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:19:27AM +0200, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 08:39:37PM -0500, Aaron Kling wrote:
> > On Wed, Mar 11, 2026 at 7:49=E2=80=AFPM Val Packett <val@packett.cool> =
wrote:
> > >
> > > On 3/11/26 2:44 PM, Aaron Kling wrote:
> > >
> > > > From: Teguh Sobirin <teguh@sobir.in>
> > > >
> > > > This adds a base dtb of everything common between the AYN QCS8550
> > > > devices. It is intended to be extended by device specific overlays.
> > > >
> > > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> > > >   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 +++++++=
+++++++++++++

Common is not a board, NAK. This could only be DTSI if you provide some
sort of HARDWARE arguments explaining the common parts of schematics or
hardware design.

> > > >   2 files changed, 1778 insertions(+)
> > > > [=E2=80=A6]
> > > > +/ {
> > > > +     model =3D "AYN QCS8550 Common";
> > > > +     compatible =3D "ayntec,qcs8550-common", "qcom,qcs8550", "qcom=
,sm8550";
> > >
> > > Huh?.. All existing -common files are .dtsi includes without their own
> > > model/compatible, and the compile-time "dtbo" support is only used for
> > > EL2 where we want to apply the same thing to many many devices without
> > > polluting the tree with extra glue files. I don't see why this should=
 be
> > > a "common device" with its own compatible string, and not just a dtsi.
> >=20
> > My use case for these devices is Android, using a single base dtb and
> > variant dtbo's in a single software build. Given the aosp boot image
> > v4 setup, using individual dtb's would require different vendor_boot
> > images, which would require multiple build targets. This setup allows
> > for my use case, while also having individual dtb targets for a
> > standard Linux use case. To my knowledge, the final device specific
> > dtb from this is the same as a dtb using a common dtsi.
>=20
> This needs to be explained in the commit message. But do you need then a
> model/compatible in the default dtb?

Not enough. We do not add compatibles not representing actual hardware,
just to streamline boot image handling.

Plus this code is not even truly correct.

We do not write DTS to fulfill broken Android boot process.

Best regards,
Krzysztof


