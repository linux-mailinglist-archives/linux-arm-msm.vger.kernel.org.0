Return-Path: <linux-arm-msm+bounces-92161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJX/CnKniGmjtQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 16:10:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E02510910A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 16:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5061830062D4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 15:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DBA35EDC2;
	Sun,  8 Feb 2026 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+JGra55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A935EDB8
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770563438; cv=pass; b=SV4K07wTJ3KQA+a+6PqkChgETavUPa3PPRBl8rOWGFbMot53nduLTr//i3dNqilFipMOAf5EsnQHwQ7pXyf8lZmD1QjHe4MHpTSkDDgkGF+9UpAlDP8fGuQZTC/bdxZJC3OYN1NX1xZAoaVeiGATns37o/fa03GYMGb3NklU0aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770563438; c=relaxed/simple;
	bh=DvLZlr2NgzyXtwCwMI/0ZeIhY3zf+5zrw9+SGPFRK3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDpztdEfMdihVSsZUlRE5p3xKXmLQr3w6yZjQVEdb/WDiDDjBV6Kf1WbLErIn5MB8Pha4xM/vYQ6UgNxgVIuopeFH3DbJ9VJ19eJoOevhdDRdyrZaNE/pWsk8fF5N2bg8BbdUeZ4lI21Wm5Kvx5oJGTgBiCqbh+Lbz7lWZcE5fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+JGra55; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-385bdc72422so32292591fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 07:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770563437; cv=none;
        d=google.com; s=arc-20240605;
        b=aFFRtiOca/o3nsB5mzlj378gEWydp+TvPuNukX7F12kPMTPlpDz1xdXuBgrF+CfRJp
         iEfmcrQE3jmpG35sHoe6LKVJMcsfZ8/MEGg25fYuhjIePsyJAr7d4wNvHek9NvbfTWyr
         V1PWbDkxWPySozDE3sXrQErQsg5b+7ZKjWemYRI4+JNUS4sCsc0Z3s8bKpnGglcmgEJn
         UPgMT4Z9nhO1U02MmxG3TKIoMKdjMwgig5K7zE8cc04bl6WG6MmHhjdspzAz1k6clMST
         l6IAEyZSZuUsnSU4ePjGRgFtgQj+HXCWwe84R0nmtWyWve0XM32LxJuuO0jIH4gAgs0W
         UdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Jn4kxd847oCgm7G0VQDzqDfWknM87DJP99bHRjsVJc=;
        fh=q6UwIvCNlTHji5bSE5kKQGH8zdvHZD4STEfBwhhD2ko=;
        b=AMn8gyEEqirjq5s7EtSrYnSd1a355WtNpUR03wY0fmytbiFghP37+K4XkEye9m+AxD
         FQX7dX58TOm4JBOpSLs/h2eME24TNJxwkqHf7vCkizdKN32ce9rau3v+Pj6D0QJqdxIT
         Lgxh6UqRxxxruPHPHON8m8BUTqVv47FOyu7EW3jhRpLIijtTSF7lf6LWitpOXdP6s6dU
         Wruf0RJq1YnHeoVD8QqWVtn52Pzt7cnUbvK55YF5jw1NcQk9LiZ7niVAZmxxGnEvpAfp
         td4YJM7l69on0hakx+qKSTyzNdPhHa7o+QB7GVeJ5FqrD0HjmOof6y/Sgf9fWqBPhcFo
         b/zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770563437; x=1771168237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Jn4kxd847oCgm7G0VQDzqDfWknM87DJP99bHRjsVJc=;
        b=I+JGra55+7cR/7NXi/dAQgAT6bOZgf4f9nzaPObMEQVlxxRbeShXA0esN9FpXdx+lb
         4MmlGMmlUXN2kAhZAaBW0raXw4zDQvldqPPdxdtJ5VOaNbJA3fGqTG3ShPDuv25R33vI
         zajsiGBEgAbCVS1PghasC4oQu4+6pxbxY5yxmoPLViLrBvxT3/EvfhbSG0ooJeB/M/9t
         VJPUVl6fzFIucZroEK1u9IYBnpPNshKSkaEFQD6L86cr72THVBFFTcH54cSwxzC9yG0p
         OBzaL03OF0TAnES/2YV35rc+ukDQP0W/a1t3uDg95erFWFcP9iae2IjfpV1v8TbOPpur
         GeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770563437; x=1771168237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Jn4kxd847oCgm7G0VQDzqDfWknM87DJP99bHRjsVJc=;
        b=I5N3rp1Wx+7oQk9VHFZGg7PmkhO629lUedIAd+NrxhbD0jqUJ/fJGrt0gnviA/HWaI
         W4+fxlycmpxRhjqy3yck8kAJuoHru0ZXwSXcCzcJCRy1LOXnWRcvj8xiNPk6F1l0e14Q
         RINy/vZEpL+F7MazIn8YjN874vCqLzKoTwkst7ByWXKzZOfMw3QkZF2XcUItp04mm2wV
         dyoQi9Dt3WihZdsI7+jUBjDjHOEXDGWcp3Na3Ste4qs9w0n9i9aXcf9BVcnrIsY7HYLO
         gdEWO8UYrcyFnNSdH9WFYg+tyMsVuEvGSVlOIq5EVs3n8KxI/ykxYd9oDgb5Cctk6HVy
         ek/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrNv1HcCw5IynNxWgXyq927BoDdYKGK3OVf0m+7RoXhf4c/KuxGM+UGmG+X3pyg7EeJtNeuIOQi9gsrtpi@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcwEAbtc19X1X41y/V4vsvfEOGTymOw1PnEJ29BkFKXapJLJl
	XGXVQj2xmtfOJuE5QW2GnJlJYwFO6kITblrxA7D66WVpZhEAXuTi6fCJFYKS6g/MjqaUyS9i5Dj
	UDeOUfetgcAnhAERG1TC6TDfi+lyeN5k=
X-Gm-Gg: AZuq6aIfEM5SPZl3elXKW1OqCssnI9vHT87HEWwi4K0A/m0rQiZkpjq38ngptvLFXaB
	wi6XEoJ4e5DVo0ukjhluYGBJtpBRXupKCQpqs1ZfBXbbDat8B2erSkl2Ay+L97Pyr6+J2HYCZnY
	M1k38V5jCv1Ice79Eb8ZdP3AnHs/PNQFrSMhDzJw/RmFa6wSSjKrASVeB8QPtmFpUkvOU43Jz21
	2LOsi7XYbkcv5dfTw7vhYPVvzTCYw25I0TLacDL6TMqsirZDwLFTpDuUDdzoIgO5TkAYMoHwbs/
	3xkO54CfHd4/iZ14AihMp6Y+2i9XThu9hcTBygh/LZ31TY8zKuzlzK5hzCR6Y41vNBM=
X-Received: by 2002:a2e:a99f:0:b0:37b:96e5:dc40 with SMTP id
 38308e7fff4ca-386b4e9f82amr24273221fa.8.1770563436277; Sun, 08 Feb 2026
 07:10:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207-sm8550-abl-dtbo-v2-1-83afaa6f3ce9@gmail.com> <d4faaf8d-1517-4187-8801-a2dd52d8dde3@kernel.org>
In-Reply-To: <d4faaf8d-1517-4187-8801-a2dd52d8dde3@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 8 Feb 2026 09:10:21 -0600
X-Gm-Features: AZwV_QgVCBf2E2I6vxsb9Bcklg_zmheaKw9q96CZiXj69pSA9gVlOjvhMjKgrJc
Message-ID: <CALHNRZ9k3yxXb9OfYXMSfEwyYKU8Rrrrjb-hPqLgU90X9YBP8g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Fix DTBO boot failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Sharma <quic_vksharma@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92161-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.981];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7E02510910A
X-Rspamd-Action: no action

On Sun, Feb 8, 2026 at 3:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 08/02/2026 02:16, Aaron Kling via B4 Relay wrote:
> > From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
> >
> > ABL requires certain things in the base dtb to apply a dtbo. Namely:
> >
> > * A label named qcom_tzlog must exist, but doesn't have to contain any
> >   specific properties
> > * The timer node must have a label named arch_timer
> >
> > This aligns the sm8550 soc dtsi with those requirements. Without these
> > in the base dtb, when ABL attempts to apply any dtbo, it will fail to
> > the bootloader menu.
> >
>
> Incomplete DCO chain.
>
> > Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > With a current mainline sm8550 base dtb, ABL will fail to apply any dtb=
o
> > and fail back to the bootloader menu. There are two changes needed:
>
> Since when? We were testing SM8550 (me on QRD) all the time and there
> was no problem.
>
> You need to provide details which hardware needs it, if this is about to
> expected, but honestly, we don't add such nodes/labels for downstream
> bootloader. Qualcomm should fix the bootloder instead.

This discussion has been ongoing in a couple places. It is needed on
all semi-recent recent qcom socs. See this chain [0] on my sm8550
questions thread and the previous revision of this series [1]. This
has been a known issue for a while, see this comment [2] on the gunyah
watchdog series, which is what the series was based on.

My current understanding is that the qcom_tzlog and arch_timer labels
are required period for abl to apply a dtbo. And this setup will only
work flashing a unit from a downstream dtb to mainline with this
change if said unit is removed from all external power and fully
powered off. For this to work without a cold restart, the scm node
needs renamed to qcom_scm. This latter part was rejected during v1.

Aaron

[0] https://lore.kernel.org/linux-arm-msm/aa90c5ca-72d7-48fb-b3b6-4be8a51dc=
0cc@oss.qualcomm.com/
[1] https://lore.kernel.org/linux-arm-msm/20260129-sm8550-abl-dtbo-v1-0-abc=
a3be14024@gmail.com/
[2] https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicin=
c.com/

