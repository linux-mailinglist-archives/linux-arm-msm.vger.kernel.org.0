Return-Path: <linux-arm-msm+bounces-1879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 019717F79C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 17:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAEC5281324
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 16:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ADD2420D;
	Fri, 24 Nov 2023 16:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="D5dJfcqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB441988
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 08:59:27 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5bde80aad05so1456327a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 08:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1700845166; x=1701449966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0Guy2IikSc5MeYOJiXDfxaB0G9vo7MgKvXYX5tKlvo=;
        b=D5dJfcqb8mc2kWNs4GeR16/WZyxftYQwMtDG84BUD4zhCLFSCPIvjBpyQsp/ZhzJAV
         +umFMbNx7B5PZYLdSrk/9k9m2wby2qqYx+tIfHVr0fTEkG0LNrZd3QRnnzNMEwsVxsx3
         B7raN8eqf6kH4+Ci32JD3GTUxHZvOwt+4ducbkxukE0yqgSeOBq8iARqqiid+/Ir366w
         q0usQJIvAQQQkso/wTqiC/rCBQpuwXKF2+sQeysInn6vtNgZ1ojYLlURasPUmFaqopO6
         K7xkB5wd+Ji/6IQ3rDuHFSLErKwhI+0u6aJgDOIXzsqdNPrrn2DBYZlJGerEuRDJG8V8
         v6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845166; x=1701449966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0Guy2IikSc5MeYOJiXDfxaB0G9vo7MgKvXYX5tKlvo=;
        b=DVzVnOiXwCgs2ux/UBewyx8ALiz3QBrPhQ7grN3+bbIZEDeePUaweDTiRawUu/bsho
         YeY8XrnUhHpwN7mIVXAKSs+dZ0HOBjLwU+Fnn984HWltAkGsDr//VbnubuziDDwJPG9Y
         istxe05p/KJs2BEzq6DwOUjMAeZ99Pyl677dvO5IJO1b7uB7Bf5J1DzDSttgwv8lO1Ge
         52+7MZ+rNVrCoGQhAfhu7J/U+7sB4mSx6knhVfoIA4Pn5otJr2F787sl8SopGWsN77O1
         yCLfWb7qAujmfbDOPTaTK/nOuWyeh9QGJdgLC2RnYmgG+t0+3rj2Ue6A/fmYaWpgUi9I
         FtKw==
X-Gm-Message-State: AOJu0Yyyrq2Ws93wUQaj4f0pxkN9w3z4g2eSd5sKVQdCt/PVPs3Th59g
	9N2/yWzerWILbxy3XUI1ftgtxfI8XG/Li+AlOZF3Zg==
X-Google-Smtp-Source: AGHT+IHANFt6j41WeXiCE1lhK/kJd4IBW6feWSz0BdtxnVoWKOJ+Km1T0KP0R8Av6R6bQ+IbTqkv9F2Rqj6LSMBT64Q=
X-Received: by 2002:a17:90b:1b07:b0:285:9d0d:7e3 with SMTP id
 nu7-20020a17090b1b0700b002859d0d07e3mr1013190pjb.38.1700845166588; Fri, 24
 Nov 2023 08:59:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <655e4939.5d0a0220.d9a9e.0491@mx.google.com> <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com> <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
 <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk> <e32d5c84-7a88-4d9f-868f-98514deae6e9@lunn.ch>
 <655fa905.df0a0220.49d9b.7afd@mx.google.com> <367c0aea-b110-4e3f-a161-59d27db11188@quicinc.com>
 <ZWCQv9oaACowJck0@shell.armlinux.org.uk> <4d159a99-f602-424e-a3c1-259c52e4d543@lunn.ch>
 <ZWC+PbNjir7rT4MK@shell.armlinux.org.uk>
In-Reply-To: <ZWC+PbNjir7rT4MK@shell.armlinux.org.uk>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 24 Nov 2023 17:59:15 +0100
Message-ID: <CA+HBbNHkAxnTLo2N_-LtMCPhZLsqPAjpYUKBNoRqKc1qmbg=GQ@mail.gmail.com>
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jie Luo <quic_luoj@quicinc.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Harini Katakam <harini.katakam@amd.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 4:16=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Nov 24, 2023 at 03:44:20PM +0100, Andrew Lunn wrote:
> > >             First Serdes mode       Second Serdes mode
> > > Option 1    PSGMII for copper       Disabled
> > >             ports 0-4
> > > Option 2    PSGMII for copper       1000BASE-X / 100BASE-FX
> > >             ports 0-4
> > > Option 3    QSGMII for copper       SGMII for
> > >             ports 0-3               copper port 4
> >
> > With option 2, can the second SERDES also do SGMII? You are likely to
> > need that when a Copper SFP module is inserted into the cage.
>
> The document states "The fiber port supports 1000BASE-X/100BASE-FX".
>
> The same is true of Marvell 88x3310's fiber port - it supports only
> fiber not SGMII. This is actually something else that - when the
> patches for stacked PHYs mature - will need to be addressed. If we
> have a 1G copper SFP plugged into an interface that only supports
> 1000base-X then we need a way to switch the PHY on the SFP module
> to 1000base-X if it's in SGMII mode.
>
> Some copper SFPs come up in 1000base-X mode, and we currently rely
> on the 88e1111 driver to switch them to SGMII mode. Others do want
> SGMII mode (like Mikrotik RJ01 where the PHY is inaccessible and
> thus can't be reconfigured.)

I can confirm that SGMII mode doesn't work with Option 2, I have tested thi=
s
a while ago with Mikrotik RJ01 (I think it has AR803x, but its not accessib=
le as
you pointed out) and it was somewhat working but in half duplex only
and dropping
packets.
Currently, SFP mode is checked and only 1000Base-X and 100Base-FX are
accepted, otherwise the module insert will return and error for unsupported
mode.

Regards,
Robert

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

