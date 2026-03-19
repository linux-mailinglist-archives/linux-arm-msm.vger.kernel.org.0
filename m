Return-Path: <linux-arm-msm+bounces-98824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH1nFl55vGnOzAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 23:31:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049F2D2FD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 23:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48D95308580D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 22:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD6F29BD91;
	Thu, 19 Mar 2026 22:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzbeDWpu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F893806D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 22:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773959515; cv=pass; b=nzTp4UqOYIYLfjxHxoAlhWpPJo+y+3OpSi3pl52jmyZWAiLRxmvYO1LKw+3PE9WlLXfqFcE+6Xg5FXG9nGPUdiJVIaZImZGtPyaN1U+fY0to2WVXMooH0fq4f4RVO5yOqzEsNKVT707/FTz+GEfoY9TW43ft8/gyvN2C/CBCLfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773959515; c=relaxed/simple;
	bh=mit0KJzLUgP4cy0lfJX9+xslzDEkhkVsK4QH9qQkfJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b91gfo43DdpDrAXO4JKTxLtO5TFAMJUdQNOxB1nk/1FCP9Ww0TuRJl8hEfX49xxSn3YjTUFFILN0QbqXP9Pi+5oO+tL97SIjIypVr5v6/M1/c99E1EJ3D0SpFtiRuerOPh//W+K4xGZxRaXfY0o8gXR3YcrRZtOvjWQ/XMt3Ck4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzbeDWpu; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a27a2fc113so1312644e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773959512; cv=none;
        d=google.com; s=arc-20240605;
        b=BVXi61UXC8Uelg9BR6R1SHpu+6evYOG3AJR8mWAVLfMaf97g0C4yg1mTJmTN38HLJF
         Iqx0nBH0yBU71ddkwpLWBDxq35HLOuquzXeCFb/b8DkL72G9YAvUZ9M2jboFNECfHcc4
         Tdn48u1rPa8GYcnpzLKHO+QiUeAA+3gAc7NN1YTc2JENVFIKIs2hNX7DYVaYn1Pt8zuS
         ONMIa33P8aQBCa2weW/FB3vQMjLZbHtm9ZVNuPF7JtS5PEJ+/Eq6KPQ8MG0LfdDohxT2
         nmJLWOGZTdN/pfkvkWOl4rESiPGDmDQwoOFgp++pHtCKyzJuLTDP6xfgRakD6y7TA0IS
         q/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nt8XMePWEklKsT16TIWwyu3AEb1T4eMX52Gzu+7bRRk=;
        fh=k5Mahp3uu4SaneH2e2qLsSwQ+OXuBI2QjV+KeqqiDvM=;
        b=TTmG9nmcuYd1e0CcPnqgaEMq6tjTJZFwlsAstpb5Un5Fp93H6ZHl3rGaSBCNeM3+Dc
         MvXAl7JPHK79qqGIPme/JBx6eqB91j9G60cd8CMoOZ+Meu9lT6s9/uSieWfXr3L4Ai1f
         qIT+eDtkqV85nOHGCnrJlbWL8zSHnNqBuBnYVoXEAguQpn9tMhFu6AURlCSmpIBr2Qz6
         eFIYmqsMi2wLOYVNb64QxTk/rmV8Nl11dYytIOwDR4mZy+3gL/Fdgv47SttiCOYGYbAO
         op4k8S/s/w10ErcCsU2M0dLf4qx+owADR+6t1fUDKGW+YUjXln5k9vmsTrr6Vu7VK045
         oJ8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773959512; x=1774564312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nt8XMePWEklKsT16TIWwyu3AEb1T4eMX52Gzu+7bRRk=;
        b=WzbeDWpu2Z64zv82n6ECxgmIjMpVLzjWkmbzZlJ3D+1Mzxf9OLfqECSCzZugi8umwQ
         6h2jvmMqP3dbWz/to4mUelTyR+BQ9I7sqhcITGFCWGTj5QnMoog6l99BNWbqtJtgTDsU
         PjuP93SoH9i0l1xdcLFN6VwEYLdp1nVG3PvyBO9Y5sPkOMmQyR9z5soapEEFtryMTUR1
         tDRLaxkj/9fE14GDxLi9no1zqGDeHw4JP/NBcJX9nnMzAygGAlyK0zFIjBNNKnHhZ6JP
         WX/jkt9XmB2+KxjJJPYhDQGuCgcTX+YvNAUtJh+fTPyABVn3Z0EAFIKJJJPSc30UEmQB
         rcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773959512; x=1774564312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nt8XMePWEklKsT16TIWwyu3AEb1T4eMX52Gzu+7bRRk=;
        b=Y+CyRMqmJnwujiFZro7YmcN/yhxpoGhNB4uzRv7uMgydvUKVxjO7NK5Gr0kq0vd/WJ
         EjPl/0eH5zMRhGJM+3yvs/gc56DJK/gdI8YpGxxQtstaPv+/F1dWqoK4Et9XvihLDtXS
         DbjocUHb6rWsNFHTEhdGKZ7MpRf0a4JkAPNrK4aI/7y3mz10G00DbapEN9blhqvymQV0
         NjUjNz8xpTtlLKYBoXD2GrUBn/dFrIF22GgULadjH9xZ0zulGm4uGYDmxQIIPwJwKbOG
         wVN1gKIwNcnV2pKIJqdJ0fTqDvaIrzkLKu4cZzfywSuCanSXSJh9F1fenit0yH97KtKc
         Gamw==
X-Forwarded-Encrypted: i=1; AJvYcCUyDdmezXPxrGBmE/0PIZCHJon4AmXCxBK/ZYyX/78DCVIf8ZujXKFAZFMBejA+v5ymoQmX4XxYMP+BNufo@vger.kernel.org
X-Gm-Message-State: AOJu0YyLU878Ynv/XTwHYBpAHmc9vIb1pSqvrd2+kuVOPAt9o8kdCsi7
	5OX/JnIIOPZhAGKhkJj43dwBhPcUd/FQMsoqbTGKjJMtQZ4UNGc7cWSj3RNWmxxnmY6qJWBUkAB
	BIdS5ufEZ0P1SjFnVLshDqfwM0Sll3M0=
X-Gm-Gg: ATEYQzyoKyxzKpAqMHZiFx59s2w3CJRpgKS7XYTHJAl2DjJYq3KhmiyVDRg4WWhGN+p
	asvojLU1diJFoDK/PP1PwPRAAfZFhMgxZ7S6aJuHikDgz6RFv3FdPEt6faYAxY8KNFgInG19GI/
	hABbYWJPCEZKE12hoVx+hpcgBGj1gQDD6foexnH1i7NhN8LT5F+Zb4qgxNcoyMCoT6Xizq/NT5y
	l6x1OGSlnFaWMoG4A+fmZMHGdxs/U13q1KmDPXSdu1c1oH/c0q3B/4Ph9alvXc0eq5Dd6aDNHGN
	8W3I34EykBPH6amXFI5raVotHVDJfgDb2Yo/N9qbM2WR1HMprvhFlt12u0a+m5n82knC
X-Received: by 2002:a05:6512:31ce:b0:5a2:7b95:af0 with SMTP id
 2adb3069b0e04-5a285b44041mr293044e87.25.1773959511843; Thu, 19 Mar 2026
 15:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com> <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
In-Reply-To: <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 19 Mar 2026 17:31:40 -0500
X-Gm-Features: AaiRm50YUdnjEIFoQzOS88tsT0r32B87raRY5860v1pJ-Ke5qGg8NEzyLj1w_kI
Message-ID: <CALHNRZ97zmk0BmctznXrrnyyk50XH506GrdWSU-mEeN3NVEBFQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98824-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.744];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0049F2D2FD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 7:49=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
> On 3/11/26 2:44 PM, Aaron Kling wrote:
>
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This adds a base dtb of everything common between the AYN QCS8550
> > devices. It is intended to be extended by device specific overlays.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> >   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 +++++++++++=
+++++++++
> >   2 files changed, 1778 insertions(+)
> > [=E2=80=A6]
> > +/ {
> > +     model =3D "AYN QCS8550 Common";
> > +     compatible =3D "ayntec,qcs8550-common", "qcom,qcs8550", "qcom,sm8=
550";
>
> Huh?.. All existing -common files are .dtsi includes without their own
> model/compatible, and the compile-time "dtbo" support is only used for
> EL2 where we want to apply the same thing to many many devices without
> polluting the tree with extra glue files. I don't see why this should be
> a "common device" with its own compatible string, and not just a dtsi.
>
> > [=E2=80=A6]
> > +&gpu {
> > +     status =3D "okay";
> > +
> > +     zap-shader {
> > +             firmware-name =3D "qcom/sm8550/a740_zap.mbn";
> > +     };
> > +};
>
> Please use the &gpu_zap_shader label.
>
> And does the generic zap actually just work?
>
> > [=E2=80=A6]
> > +&i2c0 {
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c4 {
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c12 {
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> If the individual devices actually use these busses, better to enable
> them inside of their .dts as well I think?
> > +&iris {
> > +     status =3D "okay";
> > +};
> Works with generic firmware?
> > [=E2=80=A6]
> > +&pcie0 {
> > +     wake-gpios =3D <&tlmm 96 GPIO_ACTIVE_HIGH>;
> > +     perst-gpios =3D <&tlmm 94 GPIO_ACTIVE_LOW>;
> Current binding is to put these inside of the &pcieportN (renaming
> 'perst' to 'reset' which I just noticed I failed to do for one of my own
> files :D), see x1e78100-lenovo-thinkpad-t14s.dtsi for an example.

I tried making this change, but the pcie port failed to probe. I also
notice that all existing sm8550 devices still use the 'old' syntax.

Aaron

