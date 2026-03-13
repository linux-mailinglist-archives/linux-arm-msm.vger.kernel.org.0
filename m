Return-Path: <linux-arm-msm+bounces-97603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF2SLrFKtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:34:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C54BC2882A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F0EF53004602
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01312C11DF;
	Fri, 13 Mar 2026 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1FLUEEL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A1535838F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423276; cv=pass; b=mBB3E8re46OR2vq/WvTcKGcCLdWA9czNGReiQn/mmduToQxUQqwla3sYqVNn/vK1dl63JUjI65F04bQFUhsNEfqinGqFJ5qls/eu/bAV5CPYIjaci2qfcOaoEM9aoU9RKU/Yyropd7LuHRr/JmGp1Xu9wTDpeMMOBykxwA4/G8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423276; c=relaxed/simple;
	bh=Jq2pOBm3qteHwzAasBRJA/5LsEGWq99j+KChMG2z3IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5dtnppqJ43zR/irDLx1TVnMAOTwm0QtxQCvVTrt1VNf0qwT20rfzQnKJpUJfzwwGrmPQEsgBCm8e+mezdySU3sfXz2CDiX+nFA9Gf8K1Pr56pTj9MWlbMdbJ1kaWiMv5wjTfHbj5pdcTFTrqMLeLBZ/QZejjg11zW1Oea5/OGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1FLUEEL; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a3066b68bso22986541fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773423273; cv=none;
        d=google.com; s=arc-20240605;
        b=Yh6jRgb3pJpD2NflRxcFHxwiqEAE9trG9tTGLY5REAxKh8/g6d9AHMk3tbfSKbA7K/
         GzQiutJ8FnCOySwDKf+gSlQ3+aTCnLCtIk6AY62NQcN70riMyNYPLh6q+mGiEwdrxNXW
         neGp/GroimI0MWyUjm00smcbRCf+rbwAW9vuwsEwyvIWDK9VplnRgKaVwYIa6kLwfNsr
         6PwxTHgxqc9nBkTqh7DenMU9q/W5aMvDNiO8GynxmXdyMGaxvWCxIQ+77ksOAtQJ/Jnp
         wmA2njfhUixflTVnKP4Yitx2gW3JxpJoTlWT1HrZyG9xxjIuF6xL8YxhEl4AJhz2Ne7z
         KGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Udsy2jADAujrQVIdBqhGPrxq6bUInWDnOKQG+aOCOlY=;
        fh=ImCANdXGoIr89qf/qkNSSyvnVUrKXNcHh4EIFq0Movc=;
        b=BGIsT/V6eYQRF4UUgjlzOjRYXUzBOYXA/3CDxxOLYsydwPS0KWoALbbt5RYPcKXHwe
         rIP/f/+0W9aB576G9EbBEzbRMPa8fp+uhg64zMCcANvk/g9WKw0vWFagRJL542pOy29U
         eLmiE5a+P3IVF0DTGLcitUHTWcdEwNfb5F5oT/dQ8o3TVl4CTADjjiLnwdKAirTu9spg
         QgFDWlCw7xBkkAZbU9JSV7rRLEcGYbqV4N54PIcDywgYPi0BnFgijPh9qmvqL1y2vCi0
         rGIeCsg6b+F/t61IH9RfvUb3WPJPyR0BmS99pmhEbAELr0Ub51g7PPTdtFDO8GFxh48T
         +8Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773423273; x=1774028073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Udsy2jADAujrQVIdBqhGPrxq6bUInWDnOKQG+aOCOlY=;
        b=T1FLUEELHEyK826N4bt1uYVuwqySTnT+8ztbio7bHJ14JYaRdl094VkdPo3WBo2kNS
         12hut2vF9MEC1JNBDYTWPehT4NxuZMzHRoapRZr4vknDkMi2/uR6Lb8bcFQOgRnxpJDX
         NBEc5RDsC9Qn2JtAHV4JU9wpzNREJRW/L16as4+kAHn5NO3DrggQRAWm7M5yDBjRExi3
         WVCH/hc2z+Bxv//Jfz03sZupAQHHHNuQvDiXlroV8Vrz1O/Pjhg689oQ7h3f2flpSs6z
         BtogB/ThKYiAWARga/w/EnnKezVnwJpQOMzZRM7aUF4xrYXKLyNkeKZKc8k9D+KTkX3h
         b3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773423273; x=1774028073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Udsy2jADAujrQVIdBqhGPrxq6bUInWDnOKQG+aOCOlY=;
        b=KWydV5mXWohqILsZlBa/DQCOAAPUk8LJxGhq8LS947AgRNY/OOXeMfPOGU9WTQ+5s5
         VONpSGTFFRvnyfZjl0eHQX2ej2uUt7Tf+X2yHe/Rqz0cqRLEEpbpkzhIVFFgb5h7QVZ3
         CBSRsjaMGy8p5/oupu+Qyw8mmnnnC1+N+nPIC6xAmf4B+sTbBYtaamDUJR9WPP71TYMW
         29g6aD+oQ+r7+YGPRmsn0VVvrhFyeIgGog+Vfb1XgivVrpQIbbXoDV6ttjPknlXwaNDC
         zmYKch0j4vvLExLLtPAzNKQm6P/UmWjutngzeFJnkYydKFLuZQpv9kTxSIbArwla17PJ
         x4Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWpVTlBW7Fd2L6MLQ+A9tLSE5CC9IyRsi0czJuFXljvxA03L/pVkVvy5yDITGNeNzog0xsuBSYy8WUxyBlU@vger.kernel.org
X-Gm-Message-State: AOJu0YwOk1yKtUgjeyqvEWbbw6ZRlyenzxU2rjgeEAi1PUDj5ZANjhvq
	wIkb7f3bUbko4FHzTGOksmF7BLfU2m0b0LZMrxYU4OP64EM1nNDnZvzao1DPSd/ZlvrT1B0mYKn
	6FfWytV9/+K0m0WRi37SeV7IwpgD2/r4=
X-Gm-Gg: ATEYQzwX/a7WHL4I4fjbkK6HJN92Q+77BeHh+iR4G2u7OwwwXaew/gMI5OY4/y99ta8
	U7q3tFXInD1vEKgZ+u1pqQ3yFAYmA0/GruBZ9N6bzu1AA8Amq9vM+xto0qjVPRXKQ1V0nEOCJy7
	jsq3oNW89SHD1PinshzajXvCiNjRR8N6c/BU7iMFWAxBDF3nF0KXORx/oQZYxcGTLPjSQKEB8Op
	+glZ+SObcYeLOxB38hS7BsYBij2cMUu020woE6hHvlfXCgqDYU8ivfRpN1ChfTnxWtUBPlrPxbu
	e7WmGahO/5mksI+MwgkP3VnraEX6fL/XFOc8qe9c71iDDS3cFF+j34dgScBmDPbzuHLSkDfjJab
	N3+w=
X-Received: by 2002:a2e:ae18:0:20b0:38a:18e0:6433 with SMTP id
 38308e7fff4ca-38a8982bc52mr10293091fa.37.1773423273049; Fri, 13 Mar 2026
 10:34:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com> <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
 <CALHNRZ_RU+uHXfUtSO+8pKOYfBuK9jbYgqWE70WMQ=5Qz2MvvQ@mail.gmail.com>
 <quybzbqxlohu6kiqmno2wzyltwejnc2vebxdgvdl3fdib7zg7u@wz3bkop7psu6> <20260313-urban-prawn-of-success-cff01f@quoll>
In-Reply-To: <20260313-urban-prawn-of-success-cff01f@quoll>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 13 Mar 2026 12:34:21 -0500
X-Gm-Features: AaiRm51VspXcjEKHXmJc37HLPjgLi1YxqpxRPyKHzV8n0-Gps0zwXBk9qmWEjPk
Message-ID: <CALHNRZ8iBqGGRDKhDNOasfyf8TY43ne1N82irkuzDZfWUuV5sg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Val Packett <val@packett.cool>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97603-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,sobir.in:email]
X-Rspamd-Queue-Id: C54BC2882A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 3:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Mar 13, 2026 at 05:19:27AM +0200, Dmitry Baryshkov wrote:
> > On Wed, Mar 11, 2026 at 08:39:37PM -0500, Aaron Kling wrote:
> > > On Wed, Mar 11, 2026 at 7:49=E2=80=AFPM Val Packett <val@packett.cool=
> wrote:
> > > >
> > > > On 3/11/26 2:44 PM, Aaron Kling wrote:
> > > >
> > > > > From: Teguh Sobirin <teguh@sobir.in>
> > > > >
> > > > > This adds a base dtb of everything common between the AYN QCS8550
> > > > > devices. It is intended to be extended by device specific overlay=
s.
> > > > >
> > > > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > > > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > ---
> > > > >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> > > > >   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 +++++=
+++++++++++++++
>
> Common is not a board, NAK. This could only be DTSI if you provide some
> sort of HARDWARE arguments explaining the common parts of schematics or
> hardware design.
>
> > > > >   2 files changed, 1778 insertions(+)
> > > > > [=E2=80=A6]
> > > > > +/ {
> > > > > +     model =3D "AYN QCS8550 Common";
> > > > > +     compatible =3D "ayntec,qcs8550-common", "qcom,qcs8550", "qc=
om,sm8550";
> > > >
> > > > Huh?.. All existing -common files are .dtsi includes without their =
own
> > > > model/compatible, and the compile-time "dtbo" support is only used =
for
> > > > EL2 where we want to apply the same thing to many many devices with=
out
> > > > polluting the tree with extra glue files. I don't see why this shou=
ld be
> > > > a "common device" with its own compatible string, and not just a dt=
si.
> > >
> > > My use case for these devices is Android, using a single base dtb and
> > > variant dtbo's in a single software build. Given the aosp boot image
> > > v4 setup, using individual dtb's would require different vendor_boot
> > > images, which would require multiple build targets. This setup allows
> > > for my use case, while also having individual dtb targets for a
> > > standard Linux use case. To my knowledge, the final device specific
> > > dtb from this is the same as a dtb using a common dtsi.
> >
> > This needs to be explained in the commit message. But do you need then =
a
> > model/compatible in the default dtb?

This was added because schema checks failed without model and compatible.

> Not enough. We do not add compatibles not representing actual hardware,
> just to streamline boot image handling.
>
> Plus this code is not even truly correct.
>
> We do not write DTS to fulfill broken Android boot process.

I have been trying rather hard to find a reasonable compromise between
mainline requirements and a normal Android use case, something I can
actually ship to normal users. This seemed fairly reasonable to me,
since it can generate standalone dtb's transparently. But if my use
case can never meet submission requirements, then why am I even here,
getting shamed for working on Android? If I have to fork the
device-tree anyways to fit my requirements, then there's no reason for
me to put the time and effort in to submitting something I can't use.
I'd be better off just keeping everything out of tree as googles
kernel-platform supports. And never look at mainline qcom again.

Frustratedly,
Aaron

