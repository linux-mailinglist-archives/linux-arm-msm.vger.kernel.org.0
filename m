Return-Path: <linux-arm-msm+bounces-24840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC9491E964
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 22:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82BDFB21D96
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76C1171096;
	Mon,  1 Jul 2024 20:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q60WqDUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1F16F265
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719864967; cv=none; b=mN81k00HoFTyPdsiNrIktV7C3rauPGON1t8HaJNpy24nrLtStn+fLP7DnLdEC3U8WsO+j7nTOT0I3zAWnnHi4gsg03SsWm+Ds49TtHOIEU3sLZ3S7NHHmk+QUFceENgw2KhAeTDZBgL47RbAij0oNdjZQJxSOrhgam3z/oCByO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719864967; c=relaxed/simple;
	bh=8BAeJrhfF4MjoWK6BCb1lGegZfneASgqj+Rvzy7n+rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiUSIiQcSngF7Qxg2JPraMt2TTNwUL9ShVVQufVpsgy+2qU42lkrc0ZuPjzUuD/bvOxK9JnU63rYD+0AhrRxGVTG6A3TUtmR9mTzPjs+aBV1mTGVpl883wQvu8XcsFDh5WzRjeCyCAu7ydNlF4+k6tVEbjwzsXx+6/Z7G/pINBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q60WqDUi; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec6635aa43so34132961fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719864963; x=1720469763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/7AZmTT+AVERGwwpJNjGUJrmrBTr7GP14K4O8EWIlY=;
        b=Q60WqDUi3pqLWriq7fVrADnm2JxdRl9Qu/HKPaI6G+kwuZOdvFAHvcq8ce0veiz3J2
         q5/3hS3OSDnCx5eT6fd5KXRqvPar4dHnHL3z0brtWdKRPeHmv19B13aIrIOVt6g8/vae
         I+YVodCB6mnvzHE74vmPDmA7GYyE7LH/nShXNeyqxvZPFvMMG1FTgIPj+0t/tex6rurM
         bC7As71en6Bv/3Jgs/VTgL2JPskQHrw0r1x7iJuzOiLbBAckdfdHGVhCU2lu/OzZjTZQ
         cqqUwEwjsUFWTfCIBlVyHWJ2I2nxfVXRykaQfi0wfoKzfOFufq1BdOZ5KpzKC44MuiT+
         mCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719864963; x=1720469763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/7AZmTT+AVERGwwpJNjGUJrmrBTr7GP14K4O8EWIlY=;
        b=VfiRlp6dlZ0L41W91+4tK+DE1Lo0Efmpn74loOHwFif13EsoNCViua1OfzSba7UnPX
         /SxQWTKhrayeigcslZPh74gMZNYKj+b4oJbB1Ts38PoGP2gZUispARAFMMOdpVMS757O
         iHRCboBKcYNHiI1PvSAvJVT4wo/Vz84+JcTvBzTDEQ/b9MX5wtbTLGh5DqXl8fcqb+sT
         xLLG+mxHtcsW9CjfH/J90RMWIw8x2PwPxLqGikXcSDzRrdXG036PorDCbjhnkDmBwbaf
         K2LwF29h+JBMDB5UGzNRF7c6HqSLZ1VNZ8wrfhx7HZ48LoQxSDQtPnGqmh1TrLWES8r8
         HGtw==
X-Forwarded-Encrypted: i=1; AJvYcCWjHrMI5+Aojiys9PhNnb6oWBlb5yPVjGNIDDfkx2TcYuIrjLIK+lxKEhzUnPSj6laxGqxKuJIp55TbfN2SdAmBbfhkqKJeeiJ7SNxUHQ==
X-Gm-Message-State: AOJu0Yyrhsw9EZpYzvI0laFeN2Q+NKrjp7aPY2lj008khO1RMjF82MtG
	/cL7KXmoBaiwaVwFUHZYFg64JnoOkk72y7Vj2tESYnxo4sByRP+7PJmZyKl/EN9ChnTobLgZmkM
	MbRXTGWl9EripXx5iGArUoiJCOwBrthmN71JufQ==
X-Google-Smtp-Source: AGHT+IEKAZ0mm0RcxwgLcfbN1Y6EDGlhonP962JD5DjNt0v+wIWUTtByp8xBB5E9Sy3ozcPBuqs8cSZzA/gNt5LZ0dQ=
X-Received: by 2002:a05:651c:b0b:b0:2ec:5c94:3d99 with SMTP id
 38308e7fff4ca-2ee5e3810b7mr44548691fa.2.1719864963002; Mon, 01 Jul 2024
 13:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627113948.25358-1-brgl@bgdev.pl> <20240627113948.25358-3-brgl@bgdev.pl>
 <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw> <f416e06e-e354-4628-883b-07850f05e276@lunn.ch>
In-Reply-To: <f416e06e-e354-4628-883b-07850f05e276@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Jul 2024 22:15:51 +0200
Message-ID: <CAMRc=MdSte_7MSfR1DAH8fHpHWcOfgPX2SO9DR1UnXrgvMDbdg@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos: add a DMA-reset
 quirk for sa8775p-ride
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 9:37=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Jun 27, 2024 at 12:07:22PM -0500, Andrew Halaney wrote:
> > On Thu, Jun 27, 2024 at 01:39:47PM GMT, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > On sa8775p-ride the RX clocks from the AQR115C PHY are not available =
at
> > > the time of the DMA reset so we need to loop TX clocks to RX and then
> > > disable loopback after link-up. Use the existing callbacks to do it j=
ust
> > > for this board.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Sorry, not being very helpful but trying to understand these changes
> > and the general cleanup of stmmac... so I'll point out that I'm still
> > confused by this based on Russell's last response:
> > https://lore.kernel.org/netdev/ZnQLED%2FC3Opeim5q@shell.armlinux.org.uk=
/
> >
> > Quote:
> >
> >     If you're using true Cisco SGMII, there are _no_ clocks transferred
> >     between the PHY and PCS/MAC. There are two balanced pairs of data
> >     lines and that is all - one for transmit and one for receive. So th=
is
> >     explanation doesn't make sense to me.
> >
>
> Agreed. We need a deeper understanding of the clocking to find an
> acceptable solution to this problem.
>
> Is the MAC extracting a clock from the SERDES lines?
>
> Is the PHY not driving the SERDES lines when there is no link?
>
> For RGMII PHYs, they often do have a clock output at 25 or 50MHz which
> the MAC uses. And some PHY drivers need asking to not turn this clock
> off.  Maybe we need the same here, by asking the PHY to keep the
> SERDES lines running when there is no link?
>

Yes, there are two 50MHz outputs on this PHY but they are not
connected on this board.

> https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/phy.h#L78=
1
>
> I also wounder why this is not an issue with plain SGMII, rather than
> overclocked SGMII? Maybe there is already a workaround for SGMII and
> it just needs extended to this not quiet 2500BaseX mode.
>

Well, you pointed out that there is a DMA-reset-related workaround in
place for ethqos so I tried to reuse it in this version. Does it
count? :) We did establish that this mode has no in-band signalling,
so we should be fine with the above solution after all.

Also regarding the PHY mode: on a rather non-technical diagram I
found, the four SGMII signals going to the MAC are referred to as 2.5G
HSGMII, not OCSGMII but I'm not sure if that's just naming convention.

I'm still trying to get more info but it's taking time... :(

Bartosz

