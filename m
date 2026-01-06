Return-Path: <linux-arm-msm+bounces-87679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A50B5CF8542
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 13:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9443B30217AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 12:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658B532ABC7;
	Tue,  6 Jan 2026 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dF9TEjc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4197A30DEC4
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702881; cv=none; b=I/7f6stkZqODQhK2EItkalFjTrGuIo2Y3CejhVvb5lWJY80wN0LXHWsLtu5GxwCVndDF+lAP13aYfIVjDFni7QiSzNIoc9LbUCBAKnjeOXF1dUAl+vsvuEdx0NTnmoN4U1/qfia8/fkIODdHCYI+e5s8wn2fGWQql0r7/nsF1a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702881; c=relaxed/simple;
	bh=4+orIZPsoech51NuQIOn2Zg7FT06+LCoqm268lCdbzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dt85h3iTiyFsepPGYts2VxrcE6s4p/CVXh/9fS+BTV9YSUbU8/OOOnBL0hR8iGC9jzYaqWGzIuWxCdcM6tuO6AuvlDJnwT33VnxF2RIX77S87/197yFth5R09gLppZLNy3O0jdzVv+wRhFlCNLdf2pJlUp7chODem+XpB+ZpV3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dF9TEjc4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0262BC2BCB7
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702881;
	bh=4+orIZPsoech51NuQIOn2Zg7FT06+LCoqm268lCdbzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dF9TEjc4HgBMrZUUq91Tj2e4CPtQhzmgsRA430rRdKdqccx2nuTIp1NqWVxQYiT9e
	 p2jG4PhFoesnEBHxai9oKdE/EJZLoANYWvG2Mz8B/5YvSJw3iU9rmhr9pcFC+YiDLN
	 Rb+5TwTxF1QTQtzqIAv9ugu9ljR2ARFLVkFzZ8GsuR5rUf9HChdIg3jBfSz3Mp5mpt
	 IlEfRJ14wDVMunk7NCIHbwqQ6Lt+tXun8m2Jz+gO4NUF5BJy4PvEbfAnkXkepknAze
	 0aLSd7t72DKr6iuuwGXvpYJyxptV6/V4Ve5czBswFKrmhZkmXNHT4/UflOMt11Ru/9
	 KqHl0ZOLcH/tA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37b95f87d4eso8396051fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 04:34:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5CHJcBK9s57UDqTlVbSZ5SPvIzGgjvTbR9VwyH4gQCM7Wo+BYiaBpeB/RhmIWmStU2sU8t11U3JvqT3n/@vger.kernel.org
X-Gm-Message-State: AOJu0YzHrUFHGGiz2L8acBCoKD00391AOLeh4ngdREjwQtNj5bnshstb
	AJfBUtnY1O14tCFykWjxniFC3aOXtTK4Uez00FPkxSEBt8o+6/5UJ3aNaUeEPG2gklVac/j3I98
	ofNoPQPewyazjtOUXvQerzm4Dw8NVyvJsDJKhx4A+Tg==
X-Google-Smtp-Source: AGHT+IFlaA7Jb0UAvj2/ADx9U7kF+/J52SI2sl5w+0mIAGkNff+OpGPevDWqlcbK5aCbGbh5tDkw5EZ2yIDJMwYezoc=
X-Received: by 2002:a2e:a543:0:b0:37b:8d78:e4bf with SMTP id
 38308e7fff4ca-382eaaff24cmr7493291fa.43.1767702879378; Tue, 06 Jan 2026
 04:34:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
 <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com> <87f25d02-2805-9da7-0d7f-05ce8a022d25@oss.qualcomm.com>
In-Reply-To: <87f25d02-2805-9da7-0d7f-05ce8a022d25@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 13:34:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=McH6jsaKROyMGAhH_gGSiQtqvuVmrUODgtSp0hX8g06=A@mail.gmail.com>
X-Gm-Features: AQt7F2ofSXIpLVNOI-neQtNGPzXdFSY34QulJ5QeYug3Q7OJAdE6o0yIqoiRcKk
Message-ID: <CAMRc=McH6jsaKROyMGAhH_gGSiQtqvuVmrUODgtSp0hX8g06=A@mail.gmail.com>
Subject: Re: [PATCH v19 06/10] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 7:06=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >> +static int __init psci_reboot_mode_init(void)
> >> +{
> >> +       struct faux_device *fdev;
> >> +
> >> +       fdev =3D faux_device_create("psci-reboot-mode", NULL, &psci_re=
boot_mode_ops);
> >> +       if (!fdev)
> >> +               return -ENODEV;
> >
> > This will always create this device for everyone who includes this
> > module. Move the of_find_compatible_node(NULL, NULL, "arm,psci-1.0")
> > call from probe() here instead and don't create the device if it
> > fails.
>
> Ack.
> Will move both calls to init before creating the faux device.
>
> psci_np =3D of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> and
> np =3D of_find_node_by_name(psci_np, "reboot-mode");
> --
>

On a second glance - and I may be totally wrong - would it be possible
to switch to using the auxiliary bus and create this device from
drivers/firmware/psci/psci.c? That would be even cleaner.

Bart

