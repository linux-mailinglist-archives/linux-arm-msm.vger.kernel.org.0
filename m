Return-Path: <linux-arm-msm+bounces-118802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0v1UBf/zVGqjhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:19:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957D74C4A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:19:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mYgV64mE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118802-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118802-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A595A300E29E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CAB3812E1;
	Mon, 13 Jul 2026 14:10:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D477246762
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:10:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951850; cv=pass; b=Xq3jDkGoYgxqAj+U8Awm1krR4uqMeAOuWDf3apKZZN/oIdmnx7zxJoC+izCyS93x9vNonMnQ7G3JD3FUbp5HTIaFIYzhGe4GlYoKYLDwrzmgC8I/aNDc4mnZiC6/yHjWyRn0RbpQ75RwmTWLSxJFQ0CqhuVFyNgBO2EIlFQu2mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951850; c=relaxed/simple;
	bh=gam8Fe9lZYXy2nFRQ7zZV9v6MyB9GYFRvbbbDs+vbT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3LywZVkZ+RxCba39pUxRHoQb9P3WKsLjG49pPOdZ/37wFYy4RFS3/yVy+GkH/PoA8bX5lMjniHR6vKbpUPcUxMAzUFGLbK401Qq2Urh22qcI+uBCJUh0zdsR4A0qAIlabS5P9Kyc+zFEPCx/RGFXC8xjlh8ei1TNsCTjpqDEaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYgV64mE; arc=pass smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso5794611a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783951846; cv=none;
        d=google.com; s=arc-20260327;
        b=PeKtg9jvmNsVUB1EmZcjoUoMWiyxdvhhfXBnCRSNsykTK6GqgAiIIBwHt4hbRnB1it
         OvcEW8dG4Fy5PG7fQYRqxIKw6xO7DAECNjCmVMR8xVHZ95X4wb1cd7fW+4gjXHXLP0RK
         YqzMYJ5C4zXG048rWBwTUpbsOlQfIE6rGTBxgxTJjzM1jgWwrR3MWMcit30w5hoyuL0z
         TocaqyfmGljFuVPkViX2EpGSpvBAHv2RNC8RQhzv9qIQMf0k9ysLwxzwosjxo5DIUeQ5
         H7hUMIDHhECfrgtuCw0NXa5UQet54ZUjUEZ3W1tjxdipI908hEsdZDwV5av3edk+d8NO
         CQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1lhLBLRHKApCImsP/0iv5oyajNsWU+yv/r6S7+13+9M=;
        fh=QPcslq+5SIqztd/NPSXyAPbjOiWDyOZf2m9BD0Q1pLI=;
        b=mwsg4JWVL/m/j23O9YaqWeSMq3gvnlYi11aSU/3BtOMpnjWz/C40jcjlqfR7+UQFnB
         6QgmOicysAe6y+NrQjweh4NQjP6JB+r8HUNGvckFJOIRnvQazhyZs1ExBzuof77Rerox
         q2ZQG628nxHp3ts7qWHkbIsmauCc4EtigTOZBr0x2O1JM3kluwqwCk9hwkgp5VNAdq0J
         piyp/V62M5e/shJPXQhWTSog4+SPUtsiJJk0R5zKm/05FzxnHVw72tXlaQQjz515aLgA
         pztnr60Zj0HAfHrukMd3bER4YP/pVykn7rO/jE/nmYcSZ+EQ6YOfJ5nqyQetLgEXn3R9
         4MlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783951846; x=1784556646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1lhLBLRHKApCImsP/0iv5oyajNsWU+yv/r6S7+13+9M=;
        b=mYgV64mEfZr3eebL6ERkDa8xNG00WuN9cFAF1+6AiIsc8/6N1weCTWgLj/12NjP9BL
         RNd8oNSjYLdAWxSbPF882DCnmYiHvgSPoSPP9/YDRXvNE1Qp+awa9v7bFpNrLPpW/zQw
         T6f1sNXV1L4s/4OL1/hAkvM/S0J3Vzh3TiByuMVVqTqkopZIRxWPDvEZzpXVselFhDqU
         5Q3eU7YJGiOLWuhrYoOtG00WTIjC234UW/3717rsmIzCbvUZckBocG1W2bO9ck9ogpyB
         zACe3UUqlhfYFO4O6f/eG8cG/JMazFkX0vPF4h7roGaCOJVypPa+Fq0+KmYQUjKjaMSk
         X/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951846; x=1784556646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lhLBLRHKApCImsP/0iv5oyajNsWU+yv/r6S7+13+9M=;
        b=KOHQ3NgvO698EPMGvcuGqzFMWxDD8tmc6T+Kz4DpcBrfWn5DP7OzrCYjkZHXSZjP0V
         JfOL6NQ+VPZ14uHl02pUjimVKiahBnr6WVKLlpyNXOOj0tl7C9npf78B2OK4ZChOONrU
         jLUqR1OZft89WtKPxS9Pel/rWHA/FWhmv0yhdV3ITzSS/Q5vRzkigWJICWiGZBD1Gp2/
         ub04aRrtD9aQ2y9OP9n1mNblBUSUy7osxD01++fR21GGanFsfKKHkDCP3pedeZqYKbOY
         Lma+cMNDnPXBs4zsHaCY+76LZinCQhK1yhvAJIV9fKSHdoGfomxOGVeW2f7nruVImnvI
         /qvA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6o7XJkMu9yK/Y7M75wuHoSbeO0dBqSHuRpm8rrOfVq2QWve1m2uCEszyA5r98P8oYHV4qmwWgAN25TV3k@vger.kernel.org
X-Gm-Message-State: AOJu0YwtdhaiUU/DYhQf7Y8o95G4UApFaMPwS/YRL0Q5H3hbfC4PZnNS
	4UN3YCczei2G52+InHQn4wrffHfI2G4g66BXGi/T7ePhje8a2Rkw4URvcHfLyuutmQLSgl2LsR2
	5lbQmbjCskNbCHP1nmZm+FQkcvGwd6mMJ2vT3
X-Gm-Gg: AfdE7cmkjOBfwFPiT7DeI251pT5Re+hzNunee7MukEJACV9wO3Vs+Jb35z6PMtYaWNx
	iGhD/XKiGRWq71x4eRJmVKvYD6AD3yqx0NL/V9ADJDMy2MhK4K51AZAidrYRq20abAYc2owA8Ih
	iTW3L5zFIvKMms9AhqgJVDoTL/WbiqFXyG+Qa4kYYx89PPKt/Mx8MyObAldQKnWy0hWxDlhW1oh
	mjdTDI6ZJbRRkApkwznTnoIRDVMICmnwl+AOI60jNcth2lDQNOdMjugaY84Ez68HtNQwYMe
X-Received: by 2002:a05:6402:1e8f:b0:697:cec5:d056 with SMTP id
 4fb4d7f45d1cf-69c5eeb6629mr3899017a12.0.1783951845729; Mon, 13 Jul 2026
 07:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
 <20260711184934.55701-3-oleksiionchul@gmail.com> <3f923649-34ff-4089-87e2-8989dae335ca@oss.qualcomm.com>
In-Reply-To: <3f923649-34ff-4089-87e2-8989dae335ca@oss.qualcomm.com>
From: Alex <oleksiionchul@gmail.com>
Date: Mon, 13 Jul 2026 16:10:33 +0200
X-Gm-Features: AUfX_my6XKkZ5u5LrkKRw97yKmZFSBXvLHwP_cZ9NBflKmx2DT8D27WYMmlWjJw
Message-ID: <CAD3ATv2awRTVKXD_+fK1vMv7R+du9deuyZoBqsZCT49mnLB0SA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-118802-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[oleksiionchul@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiionchul@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9957D74C4A9

On 13/7/26 at 09:52 AM, Konrad Dybcio wrote:
> > +&usb_1 {
> > + /* USB 2.0 only */
>
> Did you test that (with an actual USB3 cable)?

No, I have only tested USB 2.0 operation and do not currently have a
USB 3-capable Type-C cable available. The downstream DTS configures
the generic Yupik primary controller for SuperSpeed, but I could not
verify SuperSpeed operation on Lisa. Therefore, the initial submission
only describes the USB 2.0 configuration that has been tested.

Oleksii


On Mon, Jul 13, 2026 at 9:52=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/11/26 8:49 PM, Oleksii Onchul wrote:
> > Add initial support for the Xiaomi 11 Lite 5G NE, codenamed lisa.
> >
> > The supported hardware includes regulators, UFS, SD card, USB, GPU,
> > remote processors, Wi-Fi, Bluetooth, touchscreen, flash LED, thermal
> > sensors and the hardware buttons.
> >
> > Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
> > ---
>
> [...]
>
> > +     chosen {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             stdout-path =3D "serial0:115200n8";
> > +
> > +             framebuffer0: framebuffer@e1000000 {
> > +                     compatible =3D "simple-framebuffer";
> > +                     reg =3D <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
>
> Please use memory-region instead
>
> [...]
>
> > +             ramoops@a9000000 {
> > +                     compatible =3D "ramoops";
> > +                     reg =3D <0x0 0xa9000000 0x0 0x200000>;
> > +                     pmsg-size =3D <0x200000>;
> > +                     mem-type =3D <0x02>;
>
> Let's make mem-type decimal. Don't you need ecc-size for reliability?
>
> [...]
>
> > +             regulators {
> > +                     vreg_l1p: ldo1 {
> > +                             regulator-name =3D "vreg_l1p";
> > +                             regulator-min-microvolt =3D <1000000>;
> > +                             regulator-max-microvolt =3D <1200000>;
> > +                             regulator-always-on;
>
> Many/all of these shouldn't be always on. This PMIC normally only
> powers cameras, so dropping this should be fine
>
> [...]
>
> > +&ipa {
> > +     qcom,gsi-loader =3D "self";
> > +     memory-region =3D <&ipa_fw_mem>;
>
> These two fill be folded into the SoC DTSI soon
>
> https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qua=
lcomm.com/
>
>
> [...]
>
> > +&tlmm {
> > +     /*
> > +      * 32-33: SMB1394 (SPMI)
> > +      * 56-59: fingerprint reader (SPI)
> > +      */
> > +     gpio-reserved-ranges =3D <32 2>, <48 4>, <56 4>;
>
> What about the <48 4> range?
>
> as a nit, other files place the comments inline with the ranges:
>
> gpio-reserved-ranges =3D <4 4>, /* EC TZ Secure I3C */
>                                <10 2>, /* OOB UART */
>                                <44 4>; /* Security SPI (TPM) */
>
>
> [...]
>
> > +&usb_1 {
> > +     /* USB 2.0 only */
>
> Did you test that (with an actual USB3 cable)?
>
> Konrad

